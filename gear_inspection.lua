--======================================================================================================================
--[[
    Author: Ragnarok.Lorand
    Functions for analyzing gear/set stats
    
    The stats returned may be inaccurate for gear that has Pet: sections...
    
--]]
--======================================================================================================================

lor_gs_versions.gear_inspection = '2016-08-14.0'

gi = {}

local schars = {wtilde=string.parse_hex('EFBD9E')}
local slots = {'main','sub','range','ammo','head','neck','left_ear','right_ear','body','hands','left_ring','right_ring','back','waist','legs','feet'}
local slotmap = {['left_ear']='ear1',['right_ear']='ear2',['left_ring']='ring1',['right_ring']='ring2'}
local bagmap = {[0]='inventory',[8]='wardrobe',[10]='wardrobe2',[11]='wardrobe3',[12]='wardrobe4'}

local always_percent = S{'Haste','Triple Attack','Double Attack','Magic Attack Bonus','Weapon skill damage','Store TP','Dual Wield'}

local _stat_abbreviations = {
    ['Dbl'] = 'Double',
    ['Atk'] = 'Attack',
    ['Def'] = 'Defense',
    ['Crit'] = 'Critical',
    ['Phys'] = 'Physical',
    ['dmg'] = 'damage',
}
local stat_abbreviations = {}
for brief,full in pairs(_stat_abbreviations) do
    stat_abbreviations[brief..'%.'] = full
end
_stat_abbreviations = nil

--[[
    Value is per-item (set bonus / number of items in set)
--]]
local set_bonuses = {
    ['Steelflash+Bladeborn'] = {
        ids = S{28520,28521}, stat = 'Double Attack', val = 0.035
    },
    ['Dudgeon+Heartseeker'] = {
        ids = S{28522,28523}, stat = 'Dual Wield', val = 0.035
    },
}

local ambiguous_stats = {
    [14813] = {['Double Attack'] = 0.05},   --Brutal Earring
    [10838] = {['Dual Wield'] = 0.05},      --Patentia Sash
    [19260] = {['Dual Wield'] = 0.03}    --Raider's Boomerang
}

local job_traits = {
    ['Dual Wield'] = {
        tiers = {.1,.15,.25,.3,.35},
        levels = {nin={10,25,45,65,85}, dnc={20,40,60,80}, thf={83,90,98}},
        blu = {
            [657] = 4,  --[[Blazing Bound]]     [661] = 4,  --Animating Wail
            [673] = 4,  --[[Quad. Continuum]]   [682] = 4,  --Delta Thrust
            [686] = 4,  --[[Mortal Ray]]        [699] = 4,  --Barbed Crescent
            [715] = 8   --Molting Plumage
        },
        blu_points_per_tier = 8
    },
    ['Store TP'] = {
        tiers = {.1,.15,.2,.25,.3},
        levels = {sam={10,30,50,70,90}},
        blu = {
            [545] = 4,  --[[Sickle Slash]]      [640] = 4,  --Tail Slap
            [674] = 4,  --[[Fantod]]            [692] = 4,  --Sudden Lunge
            [713] = 8,  --Diffusion Ray
        },
        blu_points_per_tier = 8
    },
    ['Martial Arts'] = {
        tiers = {400,380,360,340,320,300,280},
        levels = {mnk={1,16,31,46,61,75,82}, pup={25,50,75,87,97}}
    }
}
job_traits['Martial Arts'].tiers[0] = 480


local function expand_abbreviations(stat_name)
    for brief,full in pairs(stat_abbreviations) do
        local a,b = stat_name:find(brief)
        if b ~= nil then
            local nextchr = stat_name[b+1]
            local suffix = ((nextchr ~= ' ') and (b ~= #stat_name)) and ' ' or ''
            stat_name = stat_name:gsub(brief, full..suffix)
        end
    end
    return stat_name
end


local function normalize_stat_list(stats)
    local normalized = {}
    for _,stat in pairs(stats) do
        if istable(stat) then
            for k,v in pairs(stat) do
                if normalized[k] ~= nil then
                    normalized[k] = normalized[k] + v
                else
                    normalized[k] = v
                end
            end
        else
            normalized[#normalized+1] = stat
        end
    end
    return normalized
end


local function merge_stat_dicts(d1, d2)
    local merged = table.copy(d1)
    for k,v in pairs(d2) do
        if merged[k] ~= nil then
            merged[k] = merged[k] + v
        else
            merged[k] = v
        end
    end
    return merged
end


function gi.get_equipped()
    local itemlist = windower.ffxi.get_items()
    local eq_tbl = itemlist.equipment
    local equipped = {}
    for _,slot in pairs(slots) do
        local idx_in_bag = eq_tbl[slot]
        if (idx_in_bag ~= 0) then
            local sname = slotmap[slot] or slot
            local uniq_item = itemlist[bagmap[eq_tbl[slot..'_bag']]][idx_in_bag]
            local ires = res.items[uniq_item.id]
            equipped[sname] = gi.resolve_stat_misc({
                name = ires.enl:capitalize(), category = ires.category,
                id = uniq_item.id, level = ires.level, slots = ires.slots,
                flags = ires.flags, jobs = ires.jobs,
                augments = gi.parse_stats(setops.expand_augments(uniq_item).augments),
                description = gi.tokenize_description(res.item_descriptions[uniq_item.id].en)
            })
        end
    end
    return gi.resolve_set_bonuses(equipped)
end


--[[
    Resolve description ambiguities, such as selecting the actual bonus amount
    from Rajas Ring or providing the amount of Double Attack granted by Brutal
    Earring.
--]]
function gi.resolve_stat_misc(item)
    if item.id == 15543 then    --Rajas Ring
        local potency = math.floor(player.main_job_level / 15)
        potency = (potency > 5) and 5 or potency
        item.description.STR = potency
        item.description.DEX = potency
        item.description['STR*'] = nil
        item.description['DEX*'] = nil
    end
    for id,stats in pairs(ambiguous_stats) do
        if item.id == id then
            for k,v in pairs(stats) do
                item.description[k] = v
            end
            break
        end
    end
    return item
end


function gi.resolve_set_bonuses(items)
    local set_ids = S{}
    for _,item in pairs(items) do
        set_ids:add(item.id)
    end
    for _,bonus in pairs(set_bonuses) do
        if #set_ids:intersection(bonus.ids) == #bonus.ids then
            for k,tbl in pairs(items) do
                if bonus.ids:contains(tbl.id) then
                    items[k].description[bonus.stat] = bonus.val
                end
            end
        end
    end
    return items
end


function gi.get_equipped_stats()
    local equipped = gi.get_equipped()
    local equipped_stats = {}
    for slot,item in pairs(equipped) do
        equipped_stats[slot] = gi.merge_item_stats(item)
    end
    return equipped_stats
end


function gi.summarize_stats()
    local summary = {}
    for _,stats in pairs(gi.get_equipped_stats()) do
        summary = merge_stat_dicts(summary, stats)
    end
    return summary
end


function gi.merge_item_stats(item)
    return merge_stat_dicts(item.description, item.augments)
end


function gi.tokenize_description(description)
    return gi.parse_stats(description:split('\n'))
end


function gi.parse_stats(iterable)
    local stats = T{}
    for _,val in ipairs(iterable) do
        local temp = gi.parse_stat_str(val)
        if temp ~= nil then
            stats:extend(temp)
        end
    end
    return normalize_stat_list(stats)
end


function gi.parse_stat_str(line)
    local stats = {}
    line = line:gsub(schars.wtilde, '~')
    
    local toks = line:all_matches('(%D+[ :+-]%d*~?%d+%%?)')
    for _,tok in pairs(toks) do
        local p = table.getval(tok:findall('[ :+-]'), -1)[1]
        if p then
            local k = tok:sub(1,p-1):trim()
            local op = tok:sub(p,p):trim()
            local v = tok:sub(p+1):trim()
            if op == '-' then v = op..v end
            if v:endswith('%') then
                v = tonumber(v:sub(1,-2)) / 100
            elseif v:contains('~') then
                local rng = v:split('~')
                v = {tonumber(rng[1]), tonumber(rng[2])}
            else
                v = tonumber(v)
            end
            
            if v then
                k = expand_abbreviations(k:unquote())
                if always_percent:contains(k) then
                    if math.floor(v) == v then
                        v = v / 100
                    end
                elseif istable(v) then
                    k = k..'*'
                end
                stats[#stats+1] = {[k] = v}
            else
                stats[#stats+1] = tok
            end
        else
            atcfs("Unable to split '%s' into k,v pair", tok)
            stats[#stats+1] = tok
        end
    end
    return stats
end


local haste_buffs = {
    ['Haste'] = 150/1024,
    ['Haste II'] = 307/1024,
    --['Advancing March +0'] = 64/1024,
    --['Victory March +0'] = 96/1024,
    --['Honor March +0'] = 150/1024,
    --['Advancing March +3'] = 112/1024,
    --['Victory March +3'] = 144/1024,
    --['Honor March +1'] = 201/1024,
    --Refueling = 102/1024,
    ['Geo Haste'] = 362/1024,  --29.9% base @ skill 900 + 5.5% (Nepote Bell)
    ['Haste II + March x2'] = 467/1024,
    ['Haste + March x2'] = 310/1024,
    ['Haste + March+3 x2'] = 406/1024,
    ['Haste II + Victory March +3'] = 451/1024,
}


function gi.weap_delay()
    --TODO: JA Haste
    local gear = gi.get_equipped()
    local gear_stats = gi.summarize_stats()
    local dwing = false
    local h2hing = false
    if gear.sub ~= nil then
        dwing = (gear.sub.category == 'Weapon')
    end
    
    local gear_haste = (gear_stats.Haste or 0) * 1024
    gear_haste = ((gear_haste > 256) and 256 or gear_haste) / 1024
    
    local gear_stp = gear_stats['Store TP'] or 0
    local stp = gear_stp + gi.job_trait('Store TP')
    
    local delay1, delay2 = 0, 0
    if gear.main then
        delay1 = gear.main.description.Delay
        if dwing then
            delay2 = gear.sub.description.Delay
        elseif delay1 == nil then   --Parsing bug that can be used to advantage
            h2hing = true
            delay1 = gi.job_trait('Martial Arts') + gear.sub.description['Delay:']
        end
    else
        delay1 = gi.job_trait('Martial Arts')
    end
    
    local rtbl = {}
    
    if dwing then
        local gear_dw = gear_stats['Dual Wield'] or 0
        local total_dw = gear_dw + gi.job_trait('Dual Wield')
        local dw_delay = (delay1 + delay2) * (1 - total_dw) / 2.0
        
        atcfs('Total DW: %s  |  Base DW delay: %s  |  Total STP: %s', total_dw, dw_delay, stp)
        
        local delay_cap = (delay1 + delay2) * 0.2
        local tpPerHit = gi.tp_for_delay(dw_delay)
        tpPerHit = math.floor(tpPerHit * (1 + stp))
        
        local unbuffed_delay = (delay1 + delay2) * (1 - total_dw) * (1 - gear_haste)
        unbuffed_delay = (unbuffed_delay < delay_cap) and delay_cap or unbuffed_delay
        local delay_reduction = (1 - (unbuffed_delay / (delay1 + delay2))) * 100
        
        rtbl['Base'] = 'Delay: %d per hand (%.2f%% reduction) | %d TP/Hit':format(math.floor(unbuffed_delay/2), delay_reduction, tpPerHit)
        
        for buff,value in pairs(haste_buffs) do
            local magic_haste = (value > 448/1024) and 448/1024 or value
            local total_haste = magic_haste + gear_haste
            local buffed_delay = (delay1 + delay2) * (1 - total_dw) * (1 - total_haste)
            buffed_delay = (buffed_delay < delay_cap) and delay_cap or buffed_delay
            delay_reduction = (1 - (buffed_delay / (delay1 + delay2))) * 100
            rtbl['Buffs: %s':format(buff)] = 'Delay: %d per hand (%.2f%% reduction) | %d TP/Hit':format(math.floor(buffed_delay/2), delay_reduction, tpPerHit)
        end
        
    end
    return rtbl
end


function gi.tp_for_delay(delay)    
    local tiers = {180,540,630,720,900,9999}
    local base = {61,61,149,154,161,173}
    local mod = {180,180,540,630,720,900}
    local mult = {63,88,20,28,24,28}
    local t = 1
    for i = #tiers, 1, -1 do
        if delay > tiers[i] then
            break
        end
        t = i
    end
    return base[t] + math.floor((delay - mod[t]) * mult[t] / 360)
end


--==============================================================================
-- Job Trait Functions
--==============================================================================

function gi.blu_trait_tier(point_map, points_per_tier)
    local set_spells
    local job_points = 0
    if player.main_job == 'BLU' then
        set_spells = windower.ffxi.get_mjob_data().spells
        job_points = windower.ffxi.get_player().job_points.blu.jp_spent
    elseif player.sub_job == 'BLU' then
        set_spells = windower.ffxi.get_sjob_data().spells
    else
        return 0
    end
    
    local trait_points = 0
    for _,id in pairs(set_spells) do
        trait_points = trait_points + point_map[id]
    end
    local tier = math.floor(trait_points / points_per_tier)
    if job_points >= 1200 then
        tier = tier + 2
    elseif job_points >= 100 then
        tier = tier + 1
    end
    return tier
end


local function job_trait_tier(levels, player_level)
    local tier = 0
    if levels ~= nil then
        for t,v in ipairs(levels) do
            if player_level >= v then
                tier = t
            else
                break
            end
        end
    end
    return tier
end


local function tier_for_job(trait, job, level)
    job = job:lower()
    if job ~= nil then
        if (job == 'blu') and (trait.blu ~= nil) then
            return gi.blu_trait_tier(trait.blu, trait.blu_points_per_tier)
        else
            return job_trait_tier(trait.levels[job], level)
        end
    end
end


function gi.job_trait(trait_name)
    if job_traits[trait_name] == nil then
        return nil
    end
    local trait = job_traits[trait_name]
    local main_tier = tier_for_job(trait, player.main_job, player.main_job_level)
    local sub_tier = tier_for_job(trait, player.sub_job, player.sub_job_level)
    
    local tier = max(main_tier, sub_tier)
    tier = (tier > #trait.tiers) and #trait.tiers or tier
    return trait.tiers[tier] or 0
end
















return gi