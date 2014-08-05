-----------------------------------------------------------------------------------------------------------
--[[
	Author: Ragnarok.Lorand
	GearSwap utility functions that are required by, but don't belong in, core_components.lua
--]]
-----------------------------------------------------------------------------------------------------------

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
	Allows add_to_chat to be called via the Windower console.
	This enables messages to be added to the chat log with a delay.
	Usage: gs c atc <color> <text>
--]]
function addToChat(cmdParams)
	local dispText = cmdParams[2]
	for i = 3, #cmdParams, 1 do
		dispText = dispText .. ' ' .. cmdParams[i]
	end
	add_to_chat(cmdParams[1], dispText)
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
	
	if options.modes[mode] == nil then
		options.modes[mode] = {}
	end
	
	if vals ~= nil then
		for _,option in ipairs(vals) do
			addModeOption(mode, option)
		end
	end
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
		
		local invertedTable = invertTable(options.modes[mode])
		local i = invertedTable[lastOption]
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
function cycleState(mode)
	if options.modes[mode] == nil then return end
	if #options.modes[mode] < 1 then return end
	
	if state == nil then state = {} end
	if state.modes == nil then state.modes = {} end
	
	state.modes[mode] = getNextOption(mode, state.modes[mode])
end