--======================================================================================================================
--[[
    Author: Ragnarok.Lorand
    Functions for analyzing gear/set stats
    
    The stats returned may be inaccurate for gear that has Pet: sections...
    
--]]
--======================================================================================================================

lor_gs_versions.gear_inspection = '2016-10-09.0'

gi = {}

local set_bonuses = _libs.lor.settings.load('data/gear_inspection/set_bonuses.lua')
local ambiguous_stats = _libs.lor.settings.load('data/gear_inspection/gear_stats.lua')
local hasso_haste = {
    [11235] = 0.015,    --[['Unkai Haidate +1']]    [11135] = 0.025,    --[['Unkai Haidate +2']]
    [27259] = 0.02,     --[['Kasuga Haidate']]      [27260] = 0.03      --[['Kasuga Haidate +1']]
}

local schars = {wtilde=string.parse_hex('EFBD9E')}
local slots = {'main','sub','range','ammo','head','neck','left_ear','right_ear','body','hands','left_ring','right_ring','back','waist','legs','feet'}
local slotmap = {['left_ear']='ear1',['right_ear']='ear2',['left_ring']='ring1',['right_ring']='ring2'}
local bagmap = {[0]='inventory',[8]='wardrobe',[10]='wardrobe2',[11]='wardrobe3',[12]='wardrobe4'}

local always_percent = S{'Haste','Triple Attack','Double Attack','Magic Attack Bonus','Weapon skill damage','Store TP','Dual Wield','Critical hit rate'}

local inconsistent_names = {
    ['Damage Taken'] = 'Damage taken'
}

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

local job_traits = {
    ['Dual Wield'] = {
        tiers = {.1,.15,.25,.3,.35},
        levels = {nin={10,25,45,65,85}, dnc={20,40,60,80}, thf={83,90,98}},
        blu = {
            [657] = 4,  --[[Blazing Bound]]     [661] = 4,  --[[Animating Wail]]
            [673] = 4,  --[[Quad. Continuum]]   [682] = 4,  --[[Delta Thrust]]
            [686] = 4,  --[[Mortal Ray]]        [699] = 4,  --[[Barbed Crescent]]
            [715] = 8   --[[Molting Plumage]]
        },
        blu_points_per_tier = 8
    },
    ['Store TP'] = {
        tiers = {.1,.15,.2,.25,.3},
        levels = {sam={10,30,50,70,90}},
        blu = {
            [545] = 4,  --[[Sickle Slash]]      [640] = 4,  --[[Tail Slap]]
            [674] = 4,  --[[Fantod]]            [692] = 4,  --[[Sudden Lunge]]
            [713] = 8,  --[[Diffusion Ray]]
        },
        blu_points_per_tier = 8
    },
    ['Martial Arts'] = {
        tiers = {400,380,360,340,320,300,280},
        levels = {mnk={1,16,31,46,61,75,82}, pup={25,50,75,87,97}}
    },
    ['Double Attack'] = {
        tiers = {.1,.12,.14,.16,.18},
        levels = {war={25,50,75,85,99}},
        blu = {
            [656] = 4,  --[[Acrid Stream]]      [659] = 4,  --[[Demoralizing Roar]]
            [677] = 4,  --[[Empty Thrash]]      [688] = 4,  --[[Heavy Strike]]
            [709] = 8,  --[[Thrashing Assault]]
        },
        blu_points_per_tier = 8
    },
    ['Triple Attack'] = {
        tiers = {.05,.06},
        levels = {thf={55,95}},
        blu = {
            [656] = 4,  --[[Acrid Stream]]      [659] = 4,  --[[Demoralizing Roar]]
            [677] = 4,  --[[Empty Thrash]]      [688] = 4,  --[[Heavy Strike]]
            [709] = 8,  --[[Thrashing Assault]]
        },
        blu_points_per_tier = 8
    },
    ['Accuracy Bonus'] = {
        tiers = {10,22,35,48,60,73},
        levels = {rng={10,30,50,70,86,96},drg={30,60,76},dnc={30,60,76},run={50,70,90}},
        blu = {
            [589] = 4,  --[[Dimensional Death]]     [560] = 4,  --[[Frenetic Rip]]
            [611] = 4,  --[[Disseverment]]          [667] = 4,  --[[Vanity Dive]]
            [700] = 8,  --[[Nature's Meditation]]   [721] = 8,  --[[Anvil Lightning]]
        },
        blu_points_per_tier = 8
    },
    ['Attack Bonus'] = {
        tiers = {10,22,35,48,60,72,84,96},
        levels = {drk={10,30,50,70,76,83,91,99},drg={10,91},war={30,65}},
        blu = {
            [620] = 4,  --[[Battle Dance]]      [594] = 4,  --[[Uppercut]]
            [554] = 4,  --[[Death Scissors]]    [540] = 4,  --[[Spinal Cleave]]
            [616] = 4,  --[[Temporal Shift]]    [675] = 4,  --[[Thermal Pulse]]
            [703] = 8,  --[[Embalming Earth]]   [719] = 8,  --[[Searing Tempest]]
        },
        blu_points_per_tier = 8
    },
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


local function normalize_stat_name(stat_name)
    return inconsistent_names[stat_name] or stat_name
end


local function normalize_stat_dict_keys(stat_dict)
    local normalized = {}
    for k,v in pairs(stat_dict) do
        local nk = normalize_stat_name(k)
        normalized[nk] = v
    end
    return normalized
end


local function merge_stat_dicts(d1, d2)
    local merged = normalize_stat_dict_keys(d1)
    for k,v in pairs(d2) do
        local nk = normalize_stat_name(k)
        if merged[nk] ~= nil then
            merged[nk] = merged[nk] + v
        else
            merged[nk] = v
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
                name = ires.enl:capitalize(),
                category = ires.category,
                id = uniq_item.id,
                level = ires.level,
                slots = ires.slots,
                flags = ires.flags,
                jobs = ires.jobs,
                augments = gi.parse_stats(setops.expand_augments(uniq_item).augments),
                description = gi.tokenize_description(res.item_descriptions[uniq_item.id].en),
                res = ires
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
    for id,info in pairs(ambiguous_stats) do
        if item.id == id then
            for k,v in pairs(info.stats) do
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


function gi.get_summary(key)
    local stat_summary = gi.summarize_stats()
    key = key:lower()
    if key == 'mdt' then
        local dt = stat_summary['Damage taken'] or 0
        local mdt1 = stat_summary['Magic damage taken'] or 0
        local mdt2 = stat_summary['Magic damage taken II'] or 0
        local mdtA = dt + mdt1
        local mdt_final = ((mdtA > -0.5) and mdtA or -0.5) + mdt2
        return (mdt_final > -0.875) and mdt_final or -0.875
    elseif key == 'pdt' then
        local dt = stat_summary['Damage taken'] or 0
        local pdt1 = stat_summary['Physical damage taken'] or 0
        local pdt2 = stat_summary['Physical damage taken II'] or 0
        local pdtA = dt + pdt1
        local pdt_final = ((pdtA > -0.5) and pdtA or -0.5) + pdt2
        return (pdt_final > -0.875) and pdt_final or -0.875
    elseif key == 'haste' then
        local haste = stat_summary['Haste'] or 0
        return haste > 0.25 and 0.25 or haste
    elseif key == 'mdb' then
        return stat_summary['Magic Defense Bonus'] or 0
    elseif key == 'mdt+mdb' then
        local mdt = gi.get_summary('mdt')
        local mdb = stat_summary['Magic Defense Bonus'] or 0
        return (1 + mdt) / (1 + (mdb / 100.0))
    elseif key == 'dt' then
        local dt = stat_summary['Damage taken'] or 0
        dt = (dt > -0.5) and dt or -0.5
        local pdt = gi.get_summary('pdt')
        local mdt = gi.get_summary('mdt')
        local mdtb = gi.get_summary('mdt+mdb')
        return {dt, pdt, mdt, mdtb}
    else
        return nil
    end
end


local function fpct(val)
    local pct = val * 100
    if pct == math.floor(pct) then
        return '%s%%':format(pct)
    else
        return '%.2f%%':format(pct)
    end
end


function gi.print_summary(key)
    local summary = gi.get_summary(key)
    key = key:lower()
    if summary ~= nil then
        local dkey = key
        local dsummary = summary
        if key == 'dt' then
            local mdtb = '-%.2f%%':format((1 - summary[4]) * 100)
            for i = 1, 3 do
                dsummary[i] = fpct(summary[i])
            end
            atcfs('DT: %s  |  PDT: %s  |  MDT: %s  |  MDT+MDB: %s', dsummary[1], dsummary[2], dsummary[3], mdtb)
            return
        elseif S{'mdt','mdb','pdt'}:contains(key) then
            dkey = key:upper()
            if S{'mdt','pdt'}:contains(key) then
                dsummary = fpct(summary)
            end
        elseif key == 'mdt+mdb' then
            dkey = 'MDT + MDB'
            dsummary = '-%.2f%%':format((1 - summary) * 100)
        elseif key == 'haste' then
            dkey = 'Haste'
        end
        atcfs('%s: %s', dkey, dsummary)
    else
        atcfs(123, 'Error: summary not available for \'%s\'', key)
    end
    
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
            if v:contains('~') then
                local rng = v:split('~')
                v = {tonumber(rng[1]), tonumber(rng[2])}
            elseif v:endswith('%') then
                v = tonumber(v:sub(1,-2)) / 100
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

local function calc_acc(skill, dex)
    local dex_acc = math.floor(dex * 0.75)
    local skill_acc = 0
    if skill < 201 then
        skill_acc = skill
    elseif skill < 401 then
        skill_acc = math.floor((skill - 200) * 0.9) + 200
    elseif skill < 601 then
        skill_acc = math.floor((skill - 400) * 0.8) + 380
    else
        skill_acc = math.floor((skill - 600) * 0.9) + 540
    end
    return skill_acc + dex_acc
end


function gi.equipped_stat(stat)
    return gi.summarize_stats()[stat] or 0
end


function gi.melee_stats()
    local gear = gi.get_equipped()
    local gear_stats = gi.summarize_stats()
    local dwing = false
    local h2hing = false
    if gear.sub ~= nil then
        dwing = (gear.sub.category == 'Weapon')
    end
    
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
    
    local gear_haste = (gear_stats.Haste or 0) * 1024
    gear_haste = ((gear_haste > 256) and 256 or gear_haste) / 1024
    
    local ja_haste = 0
    --Haste Samba: 5 + (if main=DNC: player.merits.haste_samba_effect)
    --Last Resort: 15 + (if main=DRK: (player.merits.desperate_blows * 2))
    if (not h2hing) and buff_active('Hasso') and (gear.main ~= nil) then
        if (#(gear.main.res.slots) == 1) then
            ja_haste = ja_haste + .1
            if hasso_haste[gear.legs.id] ~= nil then
                ja_haste = ja_haste + hasso_haste[gear.legs.id]
            end
        end
    end
    ja_haste = (ja_haste < .25) and ja_haste or .25
    
    local gear_stp = gear_stats['Store TP'] or 0
    local stp = gear_stp + gi.job_trait('Store TP')
    local pre_magic_haste = ja_haste + gear_haste
    
    local total_da = (gear_stats['Double Attack'] or 0) + gi.job_trait('Double Attack')
    local total_ta = (gear_stats['Triple Attack'] or 0) + gi.job_trait('Triple Attack')
    
    atcfs('Gear+JA Haste: %.2f%% | Total STP: %.2f%% | Double Attack: %.2f%% | Triple Attack: %.2f%%':format(pre_magic_haste*100, stp*100, total_da*100, total_ta*100))
    
    local dex = player.base_dex + (gear_stats['DEX'] or 0)
    local str = player.base_str + (gear_stats['STR'] or 0)
    local acc = (gear_stats['Accuracy'] or 0) + gi.job_trait('Accuracy Bonus')
    local att = (gear_stats['Attack'] or 0) + gi.job_trait('Attack Bonus')
    
    local main_acc, main_att = 0, 0
    local main_skill_type = (gear.main ~= nil) and res.skills[gear.main.res.skill].en or 'Hand-to-Hand'
    local main_skill = player.skills[main_skill_type:lower():gsub(' ','_'):gsub('-','_')]
    local main_skill_desc = '%s skill':format(main_skill_type)
    local main_total_skill = main_skill + ((gear.main ~= nil) and (gear.main.description[main_skill_desc] or 0) or 0)
    main_acc = calc_acc(main_total_skill, dex) + acc
    main_att = 15 + main_total_skill + math.floor(str * 0.75) + att
    
    local sub_acc, sub_att = 0, 0
    if gear.sub ~= nil then
        local sub_skill_type = res.skills[gear.sub.res.skill].en
        local sub_skill = player.skills[sub_skill_type:lower():gsub(' ','_'):gsub('-','_')]
        local sub_skill_desc = '%s skill':format(sub_skill_type)
        local sub_total_skill = sub_skill + (gear.sub.description[sub_skill_desc] or 0)
        sub_acc = calc_acc(sub_total_skill, dex) + acc
        sub_att = 15 + sub_total_skill + math.floor(str * 0.5) + att
    end
    
    atcfs('Accuracy: %s / %s  |  Attack: %s / %s', main_acc, sub_acc, main_att, sub_att)
    
    local rtbl = {}
    if dwing then
        local gear_dw = gear_stats['Dual Wield'] or 0
        local total_dw = gear_dw + gi.job_trait('Dual Wield')
        total_dw = (total_dw <= 0.8) and total_dw or 0.8
        local dw_delay = (delay1 + delay2) * (1 - total_dw) / 2.0
        
        local delay_cap = (delay1 + delay2) * 0.2
        local tpPerHit = gi.tp_for_delay(dw_delay)
        tpPerHit = math.floor(tpPerHit * (1 + stp))
        
        atcfs('Total DW: %.2f%% | Base DW delay: %s | TP/Hit: %s | Hits to 1k: %.2f', total_dw*100, dw_delay, tpPerHit, 1000/tpPerHit)
        
        local unbuffed_delay = (delay1 + delay2) * (1 - total_dw) * (1 - pre_magic_haste)
        unbuffed_delay = (unbuffed_delay < delay_cap) and delay_cap or unbuffed_delay
        local delay_reduction = (1 - (unbuffed_delay / (delay1 + delay2))) * 100
        
        rtbl['Base'] = 'Delay: %d per hand (%.2f%% reduction)':format(math.floor(unbuffed_delay/2), delay_reduction)
        
        for buff,value in pairs(haste_buffs) do
            local magic_haste = (value > 448/1024) and 448/1024 or value
            local total_haste = magic_haste + pre_magic_haste
            local buffed_delay = (delay1 + delay2) * (1 - total_dw) * (1 - total_haste)
            buffed_delay = (buffed_delay < delay_cap) and delay_cap or buffed_delay
            delay_reduction = (1 - (buffed_delay / (delay1 + delay2))) * 100
            rtbl['Buffs: %s':format(buff)] = 'Delay: %d per hand (%.2f%% reduction)':format(math.floor(buffed_delay/2), delay_reduction)
        end
        
    end
    pprint(rtbl)
    --return rtbl
end


function gi.print_melee_stats()
    local melee_stats = gi.melee_stats()
    
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
    if point_map == nil then return 0 end
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
        trait_points = trait_points + (point_map[id] or 0)
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
    
    local blu_da = false
    if (player.main_job == 'BLU') then
        if trait_name == 'Double Attack' then
            blu_da = (main_tier == 1)
            main_tier = 0
        elseif trait_name == 'Triple Attack' then
            main_tier = (main_tier > 1) and 1 or 0
        end
    end
    local tier = max(main_tier, sub_tier)
    tier = (tier > #trait.tiers) and #trait.tiers or tier
    local trait_value = trait.tiers[tier] or 0
    if blu_da then
        return max(0.07, trait_value)
    end
    return trait_value
end
















return gi