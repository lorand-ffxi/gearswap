--==============================================================================
--[[
	Author: Ragnarok.Lorand
	GearSwap utility functions that are related to gear set building
	and manipulation
--]]
--==============================================================================

setops = setops or {}

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
				local i = setops.chooseAvailablePiece(set2[itemSlot])
				if i ~= nil then
					newSet[itemSlot] = i
				end
			elseif setops.isAvailable(set2[itemSlot]) then
				newSet[itemSlot] = set2[itemSlot]
			end
		end
		
		--If the slot was not defined in set2 or if the item(s) defined for that slot
		--in set2 was unavailable, then use what was defined in set1
		if newSet[itemSlot] == nil then
			if (set1 ~= nil) and (set1[itemSlot] ~= nil) then
				if type(set1[itemSlot]) == 'table' then
					local i = setops.chooseAvailablePiece(set1[itemSlot])
					if i ~= nil then
						newSet[itemSlot] = i
					end
				elseif setops.isAvailable(set1[itemSlot]) then
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
function setops.chooseAvailablePiece(gearTable)
	if gearTable == nil then return nil end
	for _,i in pairs(gearTable) do
		if setops.isAvailable(i) then
			return i
		end
	end
	return nil
end

--[[
	Returns true if the given item is in the player's inventory, false otherwise.
--]]
function setops.isAvailable(item)
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
		if setops.isAvailable(gear_map.ftp[slot][ele]) then
			return {[slot] = gear_map.ftp[slot][ele]}
		end
	end
	return {}
end

function setops.getObi(element)
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

--[[
	Recursively traverses user-defined sets to compile a list of all gear
	that is currently necessary.
--]]
function setops.retrieve_items(set)
	local items = S{}
	for slot,iname in pairs(set) do
		if (type(iname) == 'table') then
			local others = setops.retrieve_items(iname)
			items = items:union(others)
		elseif (iname ~= 'empty') then
			items:add(iname)
		end
	end
	return items
end

--[[
	Recursively traverses user-defined sets to compile a list of item IDs
	for all gear that is currently necessary.
--]]
function setops.retrieve_item_ids(set, res_items)
	res_items = res_items or setops.get_item_res()
	local item_ids = S{}
	for slot,iname in pairs(set) do
		if (type(iname) == 'table') then
			local others = setops.retrieve_item_ids(iname, res_items)
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
function setops.get_player_items()
	local bagnames = {'wardrobe','locker','storage','sack','satchel','inventory','safe','case'}
	local items = winraw.ffxi.get_items()
	local gear = {}
	for _,bname in pairs(bagnames) do
		local bag = items[bname]
		for i = 1, 80 do
			local bagged = bag[i]
			local item = res.items[bagged.id]
			if (item ~= nil) then
				table.insert(gear, item)
			end
		end
	end
	return gear
end

function setops.determine_storable()
	local gear = setops.get_player_items()
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
	Compares the gear specified in the currently active Player_JOB_gear.lua
	with the gear present in inventory.  Reports which items are not
	necessary so that they can be
--]]
function setops.find_movable()
	local item_ids = setops.retrieve_item_ids(sets)
	local res_items = setops.get_item_res()
	
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
	for iname,_ in pairs(extras) do
		atc(iname:colorize(329))
	end
end

--[[
	Compares the gear specified in the currently active Player_JOB_gear.lua
	with the gear that is stored with the Porter Moogle.  Reports which
	slips are necessary to retrieve gear from, and which pieces are stored
	with each of those slips.
	Automatically runs when a player change jobs.  Can be run at any time
	via: //gs c slips
--]]
function setops.find_slipped()
	local items = setops.retrieve_items(sets)		--Get a list of all gear in Player_JOB_gear.lua
	local slip_items = _libs.slips.get_player_items()	--Get a list of all gear currently stored with the Porter Moogle
	local res_items = setops.get_item_res()		--Get res.items in a way that's easier to work with
	
	--Iterate through required gear, checking to see if any of it is stored with Porter
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
		atc('Items you need to retrieve from the Porter Moogle:':colorize(262))
	else
		atc('You have everything that you need from the Porter Moogle!':colorize(258))
		return
	end
	local output = {}
	for slip,stbl in pairs(slipped) do
		output[tonumber(slip:sub(-2))] = '[':colorize(263)..tostring(sizeof(stbl)):colorize(4,263)..']'..slip:colorize(326,263)..': '..stbl:format('list')
	end
	for i = 1, sizeof(slip_items) do
		if (output[i] ~= nil) then
			atc(output[i])
		end
	end	
end

--[[
	Prints the currently equipped set to the specified chat channel.
	Valid chat channels: /t name, /p, /l
	Usage:	//gs c set2chat /t playername
--]]
function setops.set_to_chat(args)
	if not S{'/l','/p','/t'}:contains(args[1]) then
		atc(123,'Invalid target for printing set info: '..args[1])
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
	local line1 = 'input '..targ..' '..pe.main..', '..pe.sub..', '..pe.range..', '..pe.ammo
	local line2 = 'input '..targ..' '..pe.head..', '..pe.neck..', '..pe.ear1..', '..pe.ear2
	local line3 = 'input '..targ..' '..pe.body..', '..pe.hands..', '..pe.ring1..', '..pe.ring2
	local line4 = 'input '..targ..' '..pe.back..', '..pe.waist..', '..pe.legs..', '..pe.feet
	windower.send_command(line1..';wait 1.1;'..line2..';wait 1.1;'..line3..';wait 1.1;'..line4)
end