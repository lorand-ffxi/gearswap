--======================================================================================================================
--[[
    Author: Ragnarok.Lorand
    Functions for analyzing gear/set stats
--]]
--======================================================================================================================

lor_gs_versions.gear_inspection = '2016-07-17.0'

gi = {}

local slots = {'main','sub','range','ammo','head','neck','left_ear','right_ear','body','hands','left_ring','right_ring','back','waist','legs','feet'}
local slotmap = {['left_ear']='ear1',['right_ear']='ear2',['left_ring']='ring1',['right_ring']='ring2'}
local bagmap = {[0]='inventory',[8]='wardrobe',[10]='wardrobe2',[11]='wardrobe3',[12]='wardrobe4'}

local schars = {wtilde=string.parse_hex('EFBD9E')}

function gi.get_equipped()
    local itemlist = windower.ffxi.get_items()
    local eq_tbl = itemlist.equipment
    local enquote = customized(string.format, "'%s'")
    
    local equipped = {}
    for _,slot in pairs(slots) do
        local idx_in_bag = eq_tbl[slot]
        if (idx_in_bag ~= 0) then
            local sname = slotmap[slot] or slot
            local uniq_item = itemlist[bagmap[eq_tbl[slot..'_bag']]][idx_in_bag]
            local ires = res.items[uniq_item.id]
            equipped[sname] = {
                augments = setops.expand_augments(uniq_item).augments,
                --description = res.item_descriptions[uniq_item.id].en:gsub('\n',' '),
                description = gi.tokenize_description(res.item_descriptions[uniq_item.id].en),
                name = ires.enl:capitalize(),
                category = ires.category,
                id = uniq_item.id,
                level = ires.level,
                slots = ires.slots,
                flags = ires.flags,
                jobs = ires.jobs
            }
            --equipped[sname].description = '{%s}':format(', ':join(map(customized(string.format,"'%s'"),equipped[sname].description)))
        end
    end
    return equipped
end


function gi.merge_stats(equipped)
    for slot,tbl in pairs(equiped) do
        atc('')
    end
end


tpattern = '[^:+-]+[:+-]%d+~?%d*%%?'

function gi.tokenize_description(description)
    local dtoks = {}
    local dlines = description:split('\n')
    for k,line in ipairs(dlines) do
        line = line:gsub(schars.wtilde, '~')
        --atcfs('%s  %s', k, line)
        local i = 1
        while i <= #line + 1 do
            local tok = line:match(tpattern, i)
            if tok then
                i = i + #tok + 1
                tok = tok:trim()
            else
                i = #line + 2
                tok = line:trim()
            end
            
            if #tok > 0 then
                --atcfs("    '%s'", tok)
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
                        v = {rng[1], rng[2]}
                    else
                        v = tonumber(v)
                    end
                    
                    if v then
                        dtoks[#dtoks+1] = {[k] = v}
                    else
                        dtoks[#dtoks+1] = tok
                    end
                else
                    atcfs("Unable to split '%s' into k,v pair", tok)
                    dtoks[#dtoks+1] = tok
                end
            end
        end
    end
    return dtoks
end


















return gi