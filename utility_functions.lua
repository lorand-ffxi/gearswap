-----------------------------------------------------------------------------------------------------------
--[[
	Author: Ragnarok.Lorand
	GearSwap utility functions that are required by, but don't belong in, core_components.lua
--]]
-----------------------------------------------------------------------------------------------------------

local chars = require('chat/chars')

--[[
	Convenience wrapper for accessing the true windower.add_to_chat function.
	Information printed via printInfo() was being mangled and causing FFXI crashes
	through chat log glitches.
--]]
function atc(c, msg)
	gearswap._G.windower.add_to_chat(c, msg)	--This exact syntax MUST be used, hence the need for a wrapper
end

-- Attempt to load user gear files in place of default gear sets.
-- Return true if one exists and was loaded.
function load_user_gear(job)
	if not job then return false end
	-- filename format example for user-local files: whm_gear.lua, or playername_whm_gear.lua
	local filenames = {player.name..'_'..job..'_gear.lua', job..'_gear.lua'}
	for _,v in pairs(filenames) do
		local path = gearswap.pathsearch({v})
		if path then
			include(v)
			return true
		end
	end
	return false
end

function print_gearset(gearset, title)
	if title ~= nil then
		atc(2, title)
	end
	for s,i in pairs(gearset) do
		atc(1, tostring(s)..': '..tostring(i))
	end
end

function display_current_state()
	local modeStrings = {}
	for k,v in pairs(modes) do
		table.insert(modeStrings, tostring(k)..': '..tostring(v))
	end
	if (gearswap.buffs ~= nil) then
		table.insert(modeStrings, 'Haste tier: '..tostring(gearswap.buffs.Haste))
	end
	atc(1, table.concat(modeStrings, ' | '))
end

--[[
	Rounds a number to the given number of decimal places
	Note: math.round erroneously floors the entire return statement, causing it to always return an integer value
--]]
function round(num, idp)
	local mult = 10^(idp or 0)
	return math.floor(num * mult + 0.5) / mult
end

--[[
	Returns a new table in which the given table's keys are the values, and their associated values are the keys.
	Useful for determining the index number of a given element.
--]]
function invertTable(t)
	local i = {}
	for k,v in pairs(t) do 
		i[v] = k
	end
	return i
end

--[[
	Returns the location (index number) of the given element in the given table.
--]]
function getIndex(t, element)
	local i = invertTable(t)
	return i[element]
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
	--Parse the text to be displayed for special character codes as found in Windower/addons/libs/chat/chars.lua
	for k,v in pairs(chars) do
		if dispText:contains('<'..k..'>') then
			dispText = dispText:gsub('<'..k..'>', v)	--Replace codes with the characters they represent
		end
	end
	atc(cmdParams[1], dispText)
end

--[[
	Get the given party/alliance member's vitals.  Returns nil if the player with the given name
	is not in the player's party/alliance.
--]]
function get_ally_info(name)
	for _,m in pairs(windower.ffxi.get_party()) do
		if (type(m)=='table') and (m.name == name) then
			return m
		end
	end
	return nil
end

--[[
	Add a new mode to the global list of options.  Initializes the options and modes tables if they
	have not already been initialized.  Optionally fills the list of options for the new mode with
	a given set of values.
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
	Returns the next option from the global list of options for the given mode based on the
	given previous option.  Returns the first option for the given mode if no previous option is
	provided, or if the given previous option was not in the list of possible options for the
	given mode.
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
	Changes the active state for the given mode to the next option in its list.  If there was no
	previously active state, then the state is set to the first option in the list as per the behaviour
	of the getNextOption function.
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
	--if modes[mode] == nil then addMode(mode) end
	modes[mode] = option
end

--======================================================================
--			Table info functions
--======================================================================

function parseInput(command)
	local parts = string.split(command, '.')
	local result = _G[parts[1]] or _G[parts[1]:lower()]
	if result == nil then return nil end
	
	for i = 2, #parts, 1 do
		local str = parts[i]
		if string.endswith(str, '()') then
			local func = str:sub(1, #str-2)
			result = result[func]()
		elseif string.endswith(str, ')') then
			local params = string.match(str, '%([^)]+%)')
			params = params:sub(2, #params-1)
			local func = str:sub(1, string.find(str, '%(')-1)
			result = result[func](params)
		elseif string.endswith(str, ']') then
			local key = string.match(str, '%[.+%]')
			key = key:sub(2, #key-1)
			local tab = str:sub(1, string.find(str, '%[')-1)
			result = result[tab][key]
		else
			local strnum = tonumber(str)
			if (strnum ~= nil) and (result[strnum] ~= nil) then
				result = result[strnum]
			else
				result = result[str]
			end
		end
	end
	return result
end

--[[
	Print all key, value pairs in the given table t to the FFXI chat log,
	with an optional header line h
--]]
function printInfo(t, h)
	if t ~= nil then
		if h ~= nil then
			atc(2, h)
		end
		if type(t) == 'table' then
			for k,v in pairs(t) do
				atc(0, tostring(k)..'  :  '..tostring(v))
			end
		else
			atc(0, tostring(t))
		end
	end
end