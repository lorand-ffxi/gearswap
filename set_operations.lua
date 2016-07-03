--======================================================================================================================
--[[
    Author: Ragnarok.Lorand
    GearSwap utility functions that are related to gear set building and manipulation
--]]
--======================================================================================================================

setops = setops or {}

local itemSlots = {'main', 'sub', 'range', 'ammo', 'head', 'neck', 'ear1', 'ear2', 'body', 'hands', 'ring1', 'ring2', 'back', 'waist', 'legs', 'feet'}
local all_bag_names = S{'case','inventory','locker','sack','safe','safe2','satchel','storage','wardrobe','wardrobe2'}
local equip_bag_names = {'inventory', 'wardrobe', 'wardrobe2'}
local bags_nonequippable = {'case','locker','sack','safe','safe2','satchel','storage'}

--[[
    Overwrites the contents of the slots in set1 with the contents of the slots in set2.  Safe to use for setting
    the contents of a parent set (such as sets.precast.FC) without affecting child sets (sets.precast.FC.Ninjutsu).
    This function does not consider the usability/possession of items.  By default, if a slot in set2 is empty, the
    item in set1 will be retained.  Making strict true will cause empty slots in set2 to overwrite occupied slots in
    set1.
--]]
function safe_set(set1, set2, strict)
    if any_eq(nil, set1, set2) then return end
    --if (set1 == nil) or (set2 == nil) then return end
    for _,itemSlot in pairs(itemSlots) do
        if strict then
            set1[itemSlot] = set2[itemSlot]
        else
            set1[itemSlot] = set2[itemSlot] or set1[itemSlot]
        end
    end
end


--local _expand_augments = function(item)
function setops.expand_augments(item)
    if item ~= nil then
        local encoded = item.extdata
        if (encoded ~= nil) and (#encoded > 0) then
            local valid_augs = {}
            local iaugs = extdata.decode(item).augments or {}
            for _,aug in pairs(iaugs) do
                if (#aug > 0) and (aug ~= 'none') then
                    local esc_aug = aug:gsub("'","\\'")
                    table.insert(valid_augs, esc_aug)
                end
            end
            item.augments = valid_augs
        end
    end
    return item
end
--setops.expand_augments = traceable(_expand_augments)


function setops.expand_augments_in_bags(bag_list)
    local witems = windower.ffxi.get_items()
    local equippable = {}
    for _,bag_name in pairs(bag_list) do
        for _,bagged_item in ipairs(witems[bag_name]) do
            if bagged_item ~= nil then
                bagged_item = setops.expand_augments(bagged_item)
                bagged_item.bag_name = bag_name
                local id = bagged_item.id
                if equippable[id] == nil then equippable[id] = {} end
                table.insert(equippable[id], bagged_item)
            end
        end
    end
    return equippable
end


local function refresh_equippable()
    setops.equippable = setops.expand_augments_in_bags(equip_bag_names)
end


local function refresh_non_equippable()
    setops.non_equippable = setops.expand_augments_in_bags(bags_nonequippable)
end


--[[
    Combines equipment verified as available from set1 and set2.  Supports slots having more than one option each,
    contained in a table ordered by preference.  If a specific item slot's contents is defined in both set1 and
    set2, then that slot in the resulting set will contain the item defined in set2.  It is safe for set1 and/or
    set2 to be empty (nil).  Any subsets of either set will NOT be included in the resulting set.  Optionally, a
    subset may be provided for set2 that will be used if set2 exists.
--]]
function combineSets(set1, set2, ...)
    refresh_equippable()
    
    local newSet = {}
    local subsets = {...}
    local numsub = sizeof(subsets)
    if numsub > 0 then
        for i = 1, numsub, 1 do
            if (set2 ~= nil) then
                local subset = set2[subsets[i]]
                if subset == nil then
                    if i < numsub then  --If not the last potential subset
                        --Do nothing; set2 stays the way it is
                    else    --i == #subsets
                        set2 = subset
                    end
                else
                    set2 = subset
                end
            end
        end
    end
    
    local current_item
    for _,itemSlot in pairs(itemSlots) do
        if (set2 ~= nil) and (set2[itemSlot] ~= nil) then
            current_item = set2[itemSlot]
            if type(current_item) == 'table' then
                if current_item.name == nil then
                    --If it's not a {name, augment} table, it's a list of options for the slot
                    newSet[itemSlot] = setops.chooseAvailablePiece(current_item, itemSlot)
                elseif setops.isAvailable(current_item, itemSlot) then
                    newSet[itemSlot] = current_item
                end
            elseif setops.isAvailable(current_item, itemSlot) then
                newSet[itemSlot] = current_item
            end
        end
        
        --If the slot was not defined in set2 or if the item(s) defined for that slot
        --in set2 was unavailable, then use what was defined in set1
        if newSet[itemSlot] == nil then
            if (set1 ~= nil) and (set1[itemSlot] ~= nil) then
                current_item = set1[itemSlot]
                if type(current_item) == 'table' then
                    if current_item.name == nil then
                        newSet[itemSlot] = setops.chooseAvailablePiece(current_item, itemSlot)
                    elseif setops.isAvailable(current_item, itemSlot) then
                        newSet[itemSlot] = current_item
                    end
                elseif setops.isAvailable(current_item, itemSlot) then
                    newSet[itemSlot] = current_item
                end
            end
        end
    end
    return newSet
end


function canDW()
    local dwJobs = S{'NIN','DNC','BLU','THF'}
    return dwJobs:contains(player.main_job) or dwJobs:contains(player.sub_job)
end


function setops.in_equippable_bag(item)
    local iname = item
    local augs = nil
    if type(item) ~= "string" then
        iname = item.name
        augs = item.augments
    end
    local player_bag_tables = map(customized(lor.fn_get, player), equip_bag_names)
    local item_opts = map(customized(lor.fn_get, iname, 2), player_bag_tables)
    if augs == nil then
        for _,itbl in pairs(item_opts) do
            if itbl ~= nil then return itbl end
        end
        return nil
    end
    
    for _,itbl in pairs(item_opts) do
        if itbl ~= nil then
            local equippable_items = setops.equippable[itbl.id]
            if equippable_items ~= nil then
                for _,equippable_item in pairs(equippable_items) do
                    if table.equals(item.augments, equippable_item.augments) then
                        return itbl
                    end
                end
            end
        end
    end
    return nil
end


--[[
    Returns the name of the first item that is available in the player's inventory from a list that is ordered from
    most desirable to least desirable.
--]]
function setops.chooseAvailablePiece(gearTable, slot)
    if gearTable == nil then return nil end
    for _,i in pairs(gearTable) do
        if setops.isAvailable(i, slot) then
            return i
        end
    end
    return nil
end


--[[
    Returns true if the given item is in the player's inventory, false otherwise.
--]]
function setops.isAvailable(item, slot)
    local itable = setops.in_equippable_bag(item)
    if (itable ~= nil) then
        local iinfo = res.items[itable.id]
        local lvl_ok = iinfo.level <= player.main_job_level
        local race_ok = iinfo.races:contains(player.race_id)
        local job_ok = iinfo.jobs:contains(player.main_job_id)
        local i_su = iinfo.superior_level or 0
        local p_su = player.superior_level or 0
        local su_ok = i_su <= p_su
        
        local dw_ok = true
        if (iinfo.category == 'Weapon') and (slot == 'sub') and (iinfo.skill ~= 0) then
            dw_ok = canDW()
        end
        return lazy_and(lvl_ok, race_ok, job_ok, su_ok, dw_ok)
    end
    return false
end


--[[
    Returns a set containing the ftp pieces for the given ws.
--]]
function setops.get_ftp_set(ws)
    local ftpSet = {}
    if options.use_ftp_neck then
        ftpSet = combineSets(ftpSet, setops.get_ftp_gear('neck', ws))
    end
    if options.use_ftp_waist then
        ftpSet = combineSets(ftpSet, setops.get_ftp_gear('waist', ws))
    end
    return ftpSet
end


--[[
    Returns a set containing the ftp piece for the given slot and ws.
--]]
function setops.get_ftp_gear(slot, ws)
    refresh_equippable()
    local all_waist = 'Fotia Belt'
    local all_neck = 'Fotia Gorget'
    if (slot == 'waist') and setops.in_equippable_bag(all_waist) then
        return {[slot] = all_waist}
    elseif (slot == 'neck') and setops.in_equippable_bag(all_neck) then
        return {[slot] = all_neck}
    end
    
    local ws_elements = S{}:
        union(skillchain_elements[ws.skillchain_a]):
        union(skillchain_elements[ws.skillchain_b]):
        union(skillchain_elements[ws.skillchain_c])
    
    for ele,i in pairs(ws_elements) do
        if setops.isAvailable(gear_map.ftp[slot][ele]) then
            return {[slot] = gear_map.ftp[slot][ele]}
        end
    end
    return {}
end


function setops.getObi(element)
    refresh_equippable()
    local all_ele = 'Hachirin-no-obi'
    if setops.in_equippable_bag(all_ele) then
        return all_ele
    else
        return gear_map.Obi[element]
    end
end


--==============================================================================
--          Set Information
--==============================================================================


--[[
    Recursively traverses user-defined sets to compile a list of all gear that
    is currently necessary.
--]]
--local _retrieve_items = function(set)
function setops.retrieve_items(set)
    local items = {}
    for slot,item in pairs(set) do
        if (type(item) == 'table') then
            if item.name ~= nil then
                if item.name ~= 'empty' then
                    items[item.name] = items[item.name] or {}
                    local found_match = false
                    for _,existing in pairs(items[item.name]) do
                        if table.equals(item.augments, existing.augments) then
                            found_match = true
                            break
                        end
                    end
                    if not found_match then
                        table.insert(items[item.name], item)
                    end
                end
            else
                local others = setops.retrieve_items(item)
                for iname,instances in pairs(others) do
                    if iname ~= 'empty' then
                        items[iname] = items[iname] or {}
                        for _,instance in pairs(instances) do
                            local found_match = false
                            for _,existing in pairs(items[iname]) do
                                if table.equals(instance.augments, existing.augments) then
                                    found_match = true
                                    break
                                end
                            end
                            if not found_match then
                                table.insert(items[iname], instance)
                            end
                        end
                    end
                end
            end
        elseif (item ~= 'empty') then
            items[item] = items[item] or {}
        end
    end
    return items
end
--setops.retrieve_items = traceable(_retrieve_items)

--[[
    Recursively traverses user-defined sets to compile a list of item IDs for
    all gear that is currently necessary.
--]]
function setops.retrieve_item_ids(set, res_items)
    res_items = res_items or setops.get_item_res()
    local item_ids = S{}
    for iname,instances in pairs(setops.retrieve_items(set)) do
        local itable = res_items:with('en_l',iname:lower()) or res_items:with('enl_l',iname:lower())
        if (itable ~= nil) then
            item_ids:add(itable.id)
        end
    end
    return item_ids
end


--local _retrieve_item_details = function(set, res_items)
function setops.retrieve_item_details(set, res_items)
    res_items = res_items or setops.get_item_res()
    local items = setops.retrieve_items(set)
    for iname,instances in pairs(items) do
        items[iname].res = res_items:with('en_l',iname:lower()) or res_items:with('enl_l',iname:lower())
    end
    return items
end
--setops.retrieve_item_details = traceable(_retrieve_item_details)

--[[
    Creates a copy of res.items with all names converted to lower case.
--]]
function setops.get_item_res()
    local list = S{}
    for id,tbl in pairs(res.items) do
        list[id] = {id=id,en=tbl.en,enl=tbl.enl,en_l=tbl.en:lower(),enl_l=tbl.enl:lower()}
    end
    return list
end


--[[
    Compiles a list of all items that are in the player's normal storages.
--]]
function setops.get_player_items(bagname)
    local searchbags = all_bag_names
    if (bagname ~= nil) and all_bag_names:contains(bagname:lower()) then
        searchbags = S{bagname}
    end

    local items = winraw.ffxi.get_items()
    local gear = {}
    for bname,_ in pairs(searchbags) do
        local bag = items[bname]
        for i = 1, 80 do
            local item = res.items[bag[i].id]
            if (item ~= nil) then
                table.insert(gear, item)
            end
        end
    end
    return gear
end


function setops.determine_storable(args)
    local gear = setops.get_player_items(args[1])
    local slippable = {}
    local c = 0
    for _,item in pairs(gear) do
        local slip = _libs.slips.get_slip_id_by_item_id(item.id)
        if (slip ~= nil) then
            slippable[slip] = slippable[slip] or S{}
            slippable[slip]:add(item.enl:capitalize())
            c = c + 1
        end
    end
    
    if (c > 0) then
        atc('Items that you can store with the Porter Moogle (':colorize(262)..tostring(c):colorize(123,262)..'):')
    else
        atc("You don't have anything that's storable with the Porter Moogle":colorize(258))
    end
    
    local maxSlip = -1
    local output = {}
    for sid,sitems in pairs(slippable) do
        local sname = res.items[sid].en
        local snum = tonumber(sname:sub(-2))
        output[snum] = '[':colorize(263)..tostring(sizeof(sitems)):colorize(4,263)..']'..sname:colorize(326,263)..': '..sitems:format('list')
        if (snum > maxSlip) then
            maxSlip = snum
        end
    end
    for i = 1, maxSlip do
        if (output[i] ~= nil) then
            atc(output[i])
        end
    end 
end


--[[
    Compares the gear specified in the currently active Player_JOB_gear.lua with the gear present in inventory.
    Reports which items are not necessary so that they can be moved to make room.
--]]
function setops.find_movable()
    local item_ids = setops.retrieve_item_ids(sets)
    
    local extras = S{}
    for _,itbl in pairs(player.inventory) do
        if not (item_ids:contains(itbl.id)) then
            local item = res.items[itbl.id]
            if not (ignore_items:contains(item.enl)) then
                extras:add(item.enl:capitalize())
            end
        end
    end
    
    if (sizeof(extras) > 0) then
        atc('Items you do not need in your inventory (':colorize(262)..tostring(sizeof(extras)):colorize(123,262)..'):')
    else
        atc('Everything in your inventory is necessary!':colorize(258))
        return
    end
    for iname,_ in opairs(extras) do
        atc(iname:colorize(329))
    end
end


function setops.map_slipped_to_slip()
    local slip_items = _libs.slips.get_player_items()   --List of all gear stored with the Porter Moogle now
    local slipped = {}
    for sid,sitems in pairs(slip_items) do
        local sliptbl = res.items[sid]
        for _,id in pairs(sitems) do
            slipped[id] = sliptbl.en
        end
    end
    return slipped
end


--[[
    Compares the gear specified in the currently active Player_JOB_gear.lua with the gear that is stored with the
    Porter Moogle.  Reports which slips are necessary to retrieve gear from, and which pieces are stored with each
    of those slips. Automatically runs when a player change jobs.  Can be run at any time via: //gs c slips
--]]
function setops.find_slipped()
    refresh_equippable()
    local items = setops.retrieve_item_details(sets)    --List of all gear in Player_JOB_gear.lua
    local slipped2slip = setops.map_slipped_to_slip()   --Mapping of items stored in slips to slip names
    
    local slipped = {}
    for iname,itbl in pairs(items) do
        if not setops.in_equippable_bag(iname) then
            if itbl.res ~= nil then
                local slip = slipped2slip[itbl.res.id]
                if slip ~= nil then
                    slipped[slip] = slipped[slip] or {}
                    table.insert(slipped[slip], iname)
                end
            end
        end
    end
    
    if (sizeof(slipped) > 0) then
        atc('Items you need to retrieve from the Porter Moogle:':colorize(262))
    else
        atc('You have everything that you need from the Porter Moogle!':colorize(258))
        return
    end
    local output = {}
    for slip,stbl in pairs(slipped) do
        local item_list = ", ":join(stbl)
        output[tonumber(slip:sub(-2))] = '[':colorize(263)..tostring(sizeof(stbl)):colorize(4,263)..']'..slip:colorize(326,263)..': '..item_list 
    end
    for k,v in opairs(output) do
        atc(v)
    end
end


--[[
    Prints a list of items that are specified in the current player sets, but
    are in inventory locations from which those items cannot be equipped.
--]]
function setops.find_misplaced()
    refresh_non_equippable()
    local items = setops.retrieve_items(sets)           --List of all gear in Player_JOB_gear.lua
    local res_items = setops.get_item_res()             --Transform res.items for easier use
    local slipped2slip = setops.map_slipped_to_slip()
    
    local misplaced = {}
    for iname,instances in pairs(items) do
        if iname ~= 'empty' then
            local itable = res_items:with('en_l',iname:lower()) or res_items:with('enl_l',iname:lower())
            if itable == nil then
                atcfs(123, 'Unable to find item table for %s', iname)
            elseif slipped2slip[itable.id] == nil then
                if #instances == 0 then
                    if not setops.in_equippable_bag(iname) then
                        local non_equippable_items = setops.non_equippable[itable.id] or {}
                        local found_match = false
                        for _,non_equippable_item in pairs(non_equippable_items) do
                            local bag_name = non_equippable_item.bag_name
                            misplaced[bag_name] = misplaced[bag_name] or {}
                            table.insert(misplaced[bag_name], iname)
                            found_match = true
                            break
                        end
                        if not found_match then
                            misplaced['missing'] = misplaced['missing'] or {}
                            table.insert(misplaced['missing'], iname)
                        end
                    end
                else
                    local iname2 = '%s%s':format(iname, (#instances > 0) and '*' or '')
                    for _,item in pairs(instances) do
                        if not setops.in_equippable_bag(item) then
                            local non_equippable_items = setops.non_equippable[itable.id] or {}
                            local found_match = false
                            for _,non_equippable_item in pairs(non_equippable_items) do
                                local bag_name = non_equippable_item.bag_name
                                if table.equals(item.augments, non_equippable_item.augments) then
                                    misplaced[bag_name] = misplaced[bag_name] or {}
                                    table.insert(misplaced[bag_name], iname2)
                                    found_match = true
                                    break
                                end
                            end
                            if not found_match then
                                misplaced['missing'] = misplaced['missing'] or {}
                                table.insert(misplaced['missing'], iname2)
                            end
                        end
                    end
                end
            end
        end
    end
    
    if (sizeof(misplaced) > 0) then
        atc('Items you need to move to bags from which items can be equipped:':colorize(262))
        local output = {}
        for bname,btbl in pairs(misplaced) do
            local item_list = ", ":join(btbl)
            output[bname] = '[':colorize(263)..tostring(sizeof(btbl)):colorize(4,263)..']'..bname:colorize(326,263)..': '..item_list
        end
        for k,v in opairs(output) do
            atc(v)
        end
    else
        atc('All of your required items are equippable!':colorize(258))
    end
end


--[[
    Prints the currently equipped set to the specified chat channel.  Valid chat channels: /t name, /p, /l
    Usage:  //gs c set2chat /t playername
--]]
function setops.set_to_chat(args)
    if not S{'/l','/p','/t'}:contains(args[1]) then
        atc(123,'Invalid target for printing set info: \'%s\' - Valid: /l, /p, /t':format(args[1]))
        return
    end
    local targ = args[1]
    if (targ == '/t') then
        if (args[2] == nil) then
            atc(123,'Error: No argument provided for /t for printing set info.')
            return
        end
        targ = targ..' '..args[2]
    end
    local pe = player.equipment
    local fmt = 'input %s %s, %s, %s, %s'
    local olines = {
        fmt:format(targ, pe.main, pe.sub, pe.range, pe.ammo),
        fmt:format(targ, pe.head, pe.neck, pe.ear1, pe.ear2),
        fmt:format(targ, pe.body, pe.hands, pe.ring1, pe.ring2),
        fmt:format(targ, pe.back, pe.waist, pe.legs, pe.feet)
    }
    windower.send_command(';wait 1.1;':join(olines))
end
