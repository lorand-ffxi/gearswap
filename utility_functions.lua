--==============================================================================
--[[
	Author: Ragnarok.Lorand
	GearSwap utility functions that are required by, but don't belong
	in, core_components.lua
--]]
--==============================================================================
--			File Handling Functions
--==============================================================================

--[[
	Attempt to load user gear files in place of default gear sets.
	Returns true if one exists and was loaded, otherwise returns false.
	File name format order of precedence:
		Playername_JOB_gear.lua
		JOB_gear.lua
--]]
function load_user_gear(job)
	if not job then return false end
	local filenames = {player.name..'_'..job..'_gear.lua', job..'_gear.lua'}
	for _,fname in pairs(filenames) do
		if include_if_exists(fname) then
			return true
		elseif include_if_exists('gear/'..fname) then
			return true
		end
	end
	return false
end

--[[
	Attempt to load user's settings file by character name, or, optionally,
	a given file name.  If the file is found, the function that will be
	called by core_components.lua in init() is use_user_settings()
--]]
function load_user_settings(filename)
	if include_if_exists(filename) then
		return true
	else
		local filenames = {[1]='settings_'..player.name..'.lua'}
		filenames[2] = player.name..'_settings.lua'
		filenames[3] = 'settings_default.lua'
		for _,fname in pairs(filenames) do
			if include_if_exists(fname) then
				return true
			end
		end
	end
	return false
end

--[[
	Loads the lua file with the given name if it exists, and returns true.
	Returns false if the file cannot be found/loaded.
--]]
function include_if_exists(filename)
	if (filename ~= nil) and (type(filename) == 'string') then
		local path = gearswap.pathsearch({filename})
		if path then
			include(filename)
			echo('Loaded: '..filename)
			return true
		end
	end
	return false
end

function populateTrustList()
	local trusts = S{}
	for _,spell in pairs(res.spells) do
		if (spell.type == 'Trust') then
			trusts:add(spell.en)
		end
	end
	return trusts
end

--==============================================================================
--			Printing Functions
--==============================================================================

function colorFor(col)
	local cstr = ''
	if not ((S{256,257}:contains(col)) or (col<1) or (col>511)) then
		if (col <= 255) then
			cstr = string.char(0x1F)..string.char(col)
		else
			cstr = string.char(0x1E)..string.char(col - 256)
		end
	end
	return cstr
end

function string.colorize(str, new_col, reset_col)
	new_col = new_col or 1
	reset_col = reset_col or 1
	return colorFor(new_col)..str..colorFor(reset_col)
end

--[[
	Convenience wrapper for accessing the true windower.add_to_chat
	function. Information printed via print_table() was being mangled and
	causing FFXI crashes through chat log glitches.
--]]
function atc(c, msg)
	if (type(c) == 'string') and (msg == nil) then
		msg = c
		c = 0
	end
	winraw.add_to_chat(c, winraw.to_shift_jis(msg))
end

function atcd(c, msg)
	if show_debug then
		atc(c, msg)
	end
end


function printTiered(tbl, tab)
	local sp = tab and tab..'   ' or ''
	if (tbl ~= nil) and (type(tbl) == 'table') then
		for k,v in pairs(tbl) do
			if (type(v) == 'table') then
				atc(sp..tostring(k)..' = {')
				printTiered(v, sp)
				atc(sp..'}')
			else
				atc(sp..tostring(k):rpad(' ',15)..': '..tostring(v))
			end
		end
		
	else
		atc(0, sp..tostring(tbl))
	end
end

--[[
	Convenience wrapper for echoing a message in the Windower console.
--]]
function echo(msg)
	if (msg ~= nil) then
		windower.send_command('echo [GearSwap]'..msg)
	end
end

--[[
	Allows atc to be called via the Windower console.
	This enables messages to be added to the chat log with a delay.
	Usage: gs c atc <color> <text>
--]]
function addToChat(cmdParams)
	local dispText = cmdParams[2]
	for i = 3, #cmdParams, 1 do
		dispText = dispText .. ' ' .. cmdParams[i]
	end
	--Parse the text to be displayed for special character codes as found
	-- in Windower/addons/libs/chat/chars.lua
	for k,v in pairs(_libs.chars) do
		if dispText:contains('<'..k..'>') then
			--Replace codes with the characters they represent
			dispText = dispText:gsub('<'..k..'>', v)
		end
	end
	local val = tonumber(cmdParams[1]) or 1
	winraw.add_to_chat(val, dispText)
end

function display_current_state()
	local ms = {}
	for k,v in pairs(modes) do
		if (k == 'ranged') then
			if usesRanged:contains(player.main_job) then
				table.insert(ms, tostring(k)..': '..tostring(v))
			end
		elseif (k == 'offense') and S{'auto','auto_acc'}:contains(v) then
			local hm = get_haste_mod()
			table.insert(ms, tostring(k)..': '..tostring(v)..'['..hm..']')
		else
			table.insert(ms, tostring(k)..': '..tostring(v))
		end
	end
	if (buffs ~= nil) then
		table.insert(ms, 'Haste tier: '..tostring(buffs.Haste))
	end
	atc(1, table.concat(ms, ' | '))
end

--==============================================================================
--		Table/Array/Set Manipulation Functions
--==============================================================================

function sizeof(tbl)
	local c = 0
	for _,_ in pairs(tbl) do c = c + 1 end
	return c
end

--[[
	Returns a new table in which the given table's keys are the values,
	and their associated values are the keys. Useful for determining the
	index number of a given element.
--]]
function invertTable(t)
	local i = {}
	for k,v in pairs(t) do 
		i[v] = k
	end
	return i
end

--[[
	Returns the location (index) of the given element in the given table.
--]]
function getIndex(t, element)
	local i = invertTable(t)
	return i[element]
end

--[[
	Extension of the set class to check for the existence of one or more
	elements in the set.
--]]
function set.containsOneOrMore(s, eles)
	local elez = S(eles)
	for chk,_ in pairs(elez) do
		if s:contains(chk) then
			return true
		end
	end
	return false
end

--==============================================================================
--			Mode handling functions
--==============================================================================

--[[
	Add a new mode to the global list of options.  Initializes the options
	and modes tables if they have not already been initialized.  Optionally
	fills the list of options for the new mode with a given set of values.
--]]
function addMode(mode, vals)
	if mode == nil then return end
	if options == nil then options = {} end
	if options.modes == nil then options.modes = {} end
	options.modes[mode] = {}
	if vals ~= nil then
		for _,option in ipairs(vals) do
			addModeOption(mode, option)
		end
	end
	modes[mode] = getNextOption(mode)
end

--[[
	Add a new option to a given mode in the global list of options.
--]]
function addModeOption(mode, option)
	if (options.modes[mode] ~= nil) and (options.modes[mode][option] == nil) then
		table.insert(options.modes[mode], option)
	end
end

--[[
	Returns the next option from the global list of options for the given
	mode based on the given previous option.  Returns the first option for
	the given mode if no previous option is provided, or if the given
	previous option was not in the list of possible options for the given
	mode.
--]]
function getNextOption(mode, lastOption)
	if options.modes[mode] == nil then return nil end
	local listLen = #options.modes[mode]
	if listLen > 0 then
		if lastOption == nil then
			return options.modes[mode][1]
		end
		local i = getIndex(options.modes[mode], lastOption)
		if i ~= nil then
			if i == listLen then
				return options.modes[mode][1]
			else
				return options.modes[mode][i+1]
			end
		else
			return options.modes[mode][1]
		end
	end
	return nil
end

--[[
	Changes the active state for the given mode to the next option in its
	list.  If there was no previously active state, then the state is set
	to the first option in the list as per the behavior of the
	getNextOption function.
--]]
function cycleMode(mode)
	if options.modes[mode] == nil then return end
	if #options.modes[mode] < 1 then return end
	setMode(mode, getNextOption(mode, modes[mode]))
end

--[[
	Set the active mode for the given mode.
--]]
function setMode(mode, option)
	if mode == nil then return end
	if modes == nil then modes = {} end
	modes[mode] = option
end

--==============================================================================
--			Misc Functions
--==============================================================================

--[[
	Stores a value if provided, otherwise returns the value stored to the given key (if available).
--]]
function cache(key, val)
	cached = cached or {}
	if (val == nil) then
		return cached[key]
	else
		cached[key] = val
	end
end

--[[
	Rounds a float to the given number of decimal places.
	Note: math.round is only for rounding to the nearest integer
--]]
function round(num, dec_places)
	local mult = 10^(dec_places or 0)
	return math.floor(num * mult + 0.5) / mult
end

--[[
	Get the given party/alliance member's vitals. Returns nil if the player
	with the given name is not in the player's party/alliance.
--]]
function get_ally_info(name)
	for _,m in pairs(windower.ffxi.get_party()) do
		if (type(m)=='table') and (m.name == name) then
			return m
		end
	end
	return nil
end

function getPartyMemberNumber(name)
	for n,m in pairs(windower.ffxi.get_party()) do
		if (type(m)=='table') and (m.name == name) then
			return n
		end
	end
	return nil
end

--[[
	Generate and send an old style string with equipment.  Created because equip() wasn't working for the below
	function that shows WS equipment
--]]
function equip_now(set)
	local slotmap = {['ear1']='L.ear',['ear2']='R.ear',['ring1']='L.ring',['ring2']='R.ring'}
	local equipline = ''	
	for slot,piece in pairs(set) do
		local slotstr = slotmap[slot] or slot
		equipline = equipline..'input /equip '..slotstr..' "'..piece..'";'
	end
	send_command(equipline)
end

function parse_out_text(original)
	cache('last outgoing', original)
end

function parse_inc_text(original)
	if (original == 'You can only use that command during battle.') then
		local last_outgoing = cache('last outgoing')
		if (player.status == 'Idle') and (last_outgoing ~= nil) then
			last_outgoing = windower.convert_auto_trans(last_outgoing)
			if last_outgoing:startswith('/ws') then
				local wsname = last_outgoing:sub(4,-4):trim():stripchars('"'):trim()
				local ws = res.weapon_skills:with('en',wsname)
				if (ws ~= nil) then
					ws.action_type = 'Ability'
					equip_now(get_precast_set(ws))
				else
					atc(123,'Unable to locate resource for '..wsname)
				end
			end
		end
	end
end
