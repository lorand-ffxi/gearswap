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
	if #subsets > 0 then
		for i = 1, #subsets, 1 do
			if set2 ~= nil then
				local subset = set2[subsets[i]]
				if subset == nil then
					if i < #subsets then	--If not the last potential subset
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
--]]
function get_ftp_gear(slot, ws)
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

function process_slip_gear()
	local items = retrieve_items(sets)
	local slip_items = slips.get_player_items()
	local slipped = {}
	for item,_ in pairs(items) do
		if not (player.inventory[item] or player.wardrobe[item]) then
			local itable = res.items:with('en',item) or res.items:with('enl',item)
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