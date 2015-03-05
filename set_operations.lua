--==============================================================================
--[[
	Author: Ragnarok.Lorand
	GearSwap utility functions that are related to gear set building
	and manipulation
--]]
--==============================================================================

local itemSlots = {'main', 'sub', 'range', 'ammo', 'head', 'neck', 'ear1', 'ear2', 'body', 'hands', 'ring1', 'ring2', 'back', 'waist', 'legs', 'feet'}

--[[
	Combines equipment verified as available from set1 and set2.  Supports slots having more than one
	option each, contained in a table ordered by preference.  If a specific item slot's contents is defined
	in both set1 and set2, then that slot in the resulting set will contain the item defined in set2.  It
	is safe for set1 and/or set2 to be empty (nil).  Any subsets of either set will NOT be included in the
	resulting set.  Optionally, a subset may be provided for set2 that will be used if set2 exists.
--]]
function combineSets(set1, set2, ...)
	local newSet = {}
	local subsets = {...}
	local numsub = sizeof(subsets)
	if numsub > 0 then
		for i = 1, numsub, 1 do
			if (set2 ~= nil) then
				local subset = set2[subsets[i]]
				if subset == nil then
					if i < numsub then	--If not the last potential subset
						--Do nothing; set2 stays the way it is
					else	--i == #subsets
						set2 = subset
					end
				else
					set2 = subset
				end
			end
		end
	end
	
	for _,itemSlot in pairs(itemSlots) do
		if (set2 ~= nil) and (set2[itemSlot] ~= nil) then
			if type(set2[itemSlot]) == 'table' then
				local i = chooseAvailablePiece(set2[itemSlot])
				if i ~= nil then
					newSet[itemSlot] = i
				end
			elseif isAvailable(set2[itemSlot]) then
				newSet[itemSlot] = set2[itemSlot]
			end
		end
		
		--If the slot was not defined in set2 or if the item(s) defined for that slot
		--in set2 was unavailable, then use what was defined in set1
		if newSet[itemSlot] == nil then
			if (set1 ~= nil) and (set1[itemSlot] ~= nil) then
				if type(set1[itemSlot]) == 'table' then
					local i = chooseAvailablePiece(set1[itemSlot])
					if i ~= nil then
						newSet[itemSlot] = i
					end
				elseif isAvailable(set1[itemSlot]) then
					newSet[itemSlot] = set1[itemSlot]
				end
			end
		end
	end
	return newSet
end

--[[
	Returns the name of the first item that is available in the player's inventory from a list
	that is ordered from most desirable to least desirable.
--]]
function chooseAvailablePiece(gearTable)
	if gearTable == nil then return nil end
	for _,i in pairs(gearTable) do
		if isAvailable(i) then
			return i
		end
	end
	return nil
end

--[[
	Returns true if the given item is in the player's inventory, false otherwise.
--]]
function isAvailable(item)
	local itable = player.inventory[item] or player.wardrobe[item]
	if (itable ~= nil) then
		local iinfo = res.items[itable.id]
		local lvl_ok = iinfo.level <= player.main_job_level
		local race_ok = iinfo.races:contains(player.race_id)
		local job_ok = iinfo.jobs:contains(player.main_job_id)
		local i_su = iinfo.superior_level or 0
		local p_su = player.superior_level or 0
		local su_ok = i_su <= p_su
		local canuse = lvl_ok and race_ok and job_ok and su_ok
		return canuse
	end
	return false
end

--[[
	Returns a set containing the ftp pieces for the given ws.
--]]
function get_ftp_set(ws)
	local ftpSet = {}
	if options.use_ftp_neck then
		ftpSet = combineSets(ftpSet, get_ftp_gear('neck', ws))
	end
	if options.use_ftp_waist then
		ftpSet = combineSets(ftpSet, get_ftp_gear('waist', ws))
	end
	return ftpSet
end

--[[
	Returns a set containing the ftp piece for the given slot and ws.
	TODO: New ftp neck/belts
--]]
function get_ftp_gear(slot, ws)
	local all_waist = 'Fotia Belt'
	local all_neck = 'Fotia Gorget'
	if (slot == 'waist') and (player.inventory[all_waist] or player.wardrobe[all_waist]) then
		return {[slot] = all_waist}
	elseif (slot == 'neck') and (player.inventory[all_neck] or player.wardrobe[all_neck]) then
		return {[slot] = all_neck}
	end
	
	local ws_elements = S{}:
		union(skillchain_elements[ws.skillchain_a]):
		union(skillchain_elements[ws.skillchain_b]):
		union(skillchain_elements[ws.skillchain_c])
	
	for ele,i in pairs(ws_elements) do
		if isAvailable(gear_map.ftp[slot][ele]) then
			return {[slot] = gear_map.ftp[slot][ele]}
		end
	end
	return {}
end

function getObi(element)
	local all_ele = 'Hachirin-no-obi'
	if (player.inventory[all_ele] or player.wardrobe[all_ele]) then
		return all_ele
	else
		return gear_map.Obi[element]
	end
end

--==============================================================================
--			Set Information
--==============================================================================

function retrieve_items(set)
	local items = S{}
	for slot,iname in pairs(set) do
		if (type(iname) == 'table') then
			local others = retrieve_items(iname)
			items = items:union(others)
		elseif (iname ~= 'empty') then
			items:add(iname)
		end
	end
	return items
end

function retrieve_item_ids(set, res_items)
	res_items = res_items or get_item_res()
	local item_ids = S{}
	for slot,iname in pairs(set) do
		if (type(iname) == 'table') then
			local others = retrieve_item_ids(iname, res_items)
			item_ids = item_ids:union(others)
		elseif (iname ~= 'empty') then
			local itable = res_items:with('en_l',iname:lower()) or res_items:with('enl_l',iname:lower())
			if (itable ~= nil) then
				item_ids:add(itable.id)
			end
		end
	end
	return item_ids
end

function get_item_res()
	local list = S{}
	for id,tbl in pairs(res.items) do
		list[id] = {id=id,en=tbl.en,enl=tbl.enl,en_l=tbl.en:lower(),enl_l=tbl.enl:lower()}
	end
	return list
end

function process_inventory_gear()
	local item_ids = retrieve_item_ids(sets)
	local res_items = get_item_res()
	
	local extras = S{}
	for _,itbl in pairs(player.inventory) do
		if not (item_ids:contains(itbl.id)) then
			local item = res.items[itbl.id]
			if not (S{'Gil','pearlsack','copper A.M.A.N. voucher'}:contains(item.enl)) then
				extras:add(item.enl)
			end
		end
	end
	
	if (sizeof(extras) > 0) then
		atc(50, 'Items you do not need in your inventory:')
	else
		atc(50, 'Everything in your inventory is necessary!')
	end
	for iname,_ in pairs(extras) do
		atc(50, iname)
	end
end

function process_slip_gear()
	local items = retrieve_items(sets)
	local slip_items = slips.get_player_items()
	local res_items = get_item_res()
	
	local slipped = {}
	for item,_ in pairs(items) do
		if not (player.inventory[item] or player.wardrobe[item]) then
			local itable = res_items:with('en_l',item:lower()) or res_items:with('enl_l',item:lower())
			if (itable ~= nil) then
				for sid,sitems in pairs(slip_items) do
					if S(sitems):contains(itable.id) then
						local sliptbl = res.items[sid]
						slipped[sliptbl.en] = slipped[sliptbl.en] or S{}
						slipped[sliptbl.en]:add(item)
					end
				end
			end
		end
	end
	
	if (sizeof(slipped) > 0) then
		atc(50, 'Items you need to retrieve from the Porter Moogle:')
	else
		atc(50, 'You have everything that you need from the Porter Moogle!')
	end
	local output = {}
	for slip,stbl in pairs(slipped) do
		output[tonumber(slip:sub(-2))] = slip..': '..stbl:format('list')
	end
	for i = 1, sizeof(slip_items) do
		if (output[i] ~= nil) then
			atc(50, output[i])
		end
	end	
end

function set_to_chat(args)
	if not S{'/l','/p'}:contains(args[1]) then
		atc(123,'Invalid target for printing set info: '..args[1])
		return
	end
	local pe = player.equipment
	local line1 = 'input '..args[1]..' '..pe.main..', '..pe.sub..', '..pe.range..', '..pe.ammo
	local line2 = 'input '..args[1]..' '..pe.head..', '..pe.neck..', '..pe.ear1..', '..pe.ear2
	local line3 = 'input '..args[1]..' '..pe.body..', '..pe.hands..', '..pe.ring1..', '..pe.ring2
	local line4 = 'input '..args[1]..' '..pe.back..', '..pe.waist..', '..pe.legs..', '..pe.feet
	windower.send_command(line1..';wait 1.1;'..line2..';wait 1.1;'..line3..';wait 1.1;'..line4)
end