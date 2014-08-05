-----------------------------------------------------------------------------------------------------------
--[[
	Author: Ragnarok.Lorand
	GearSwap utility functions that are related to gear set building and manipulation
--]]
-----------------------------------------------------------------------------------------------------------

local itemSlots = {'main', 'sub', 'range', 'ammo', 'head', 'neck', 'ear1', 'ear2', 'body', 'hands', 'ring1', 'ring2', 'back', 'waist', 'legs', 'feet'}


function incorporate_subset(baseSet, subset)
	if baseSet[subset] ~= nil then
		return combineSets(baseSet, baseSet[subset])
	else
		return baseSet
	end
end

--[[
	Combines equipment verified as available from set1 and set2.  Supports slots having more than one
	option each, contained in a table ordered by preference.  If a specific item slot's contents is defined
	in both set1 and set2, then that slot in the resulting set will contain the item defined in set2.  It
	is safe for set1 and/or set2 to be empty (nil).  Any subsets of either set will NOT be included in the
	resulting set.
--]]
function combineSets(set1, set2)
	local newSet = {}
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
end

--[[
	Returns the name of the first item that is available
	in the player's inventory from a list that is ordered from
	most desirable to least desirable.
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
	return player.inventory[item] or player.wardrobe[item]
end

function incorporate_ftp_gear(baseSet, spell)
	if options.use_ftp_neck then
		baseSet = set_combine(baseSet, get_ftp_gear('neck', spell))
	end
	if options.use_ftp_waist then
		baseSet = set_combine(baseSet, get_ftp_gear('waist', spell))
	end
	return baseSet
end

function get_ftp_gear(slot, spell)
	local ws_elements = S{}:
		union(skillchain_elements[spell.skillchain_a]):
		union(skillchain_elements[spell.skillchain_b]):
		union(skillchain_elements[spell.skillchain_c])
	
	for ele,i in pairs(ws_elements) do
		if isAvailable(gear_map.ftp[slot][ele]) then
			return {[slot] = gear_map.ftp[slot][ele]}
		end
	end
	return {}
end