-----------------------------------------------------------------------------------------------------------
--[[
	Author: Ragnarok.Lorand
--]]
-----------------------------------------------------------------------------------------------------------

function get_sets()
	include('include.lua')
end

function refreshRangedModes()
	if state.OffenseMode == 'Bow' then
		if player.sub_job == 'SAM' then
			options.RangedModes = {'r5-hit','5-hit','a5-hit','r4-hit'}
			set_default_RangedMode('a5-hit')
		else
			options.RangedModes = {'r5-hit','5-hit'}
			set_default_RangedMode('5-hit')
		end
	elseif state.OffenseMode == 'Gun' then
		if player.sub_job == 'SAM' then
			options.RangedModes = {'5-hit','a5-hit','4-hit'}
			set_default_RangedMode('a5-hit')
		else
			options.RangedModes = {'5-hit'}
			set_default_RangedMode('5-hit')
		end
	else
		options.RangedModes = {'Accuracy'}
		set_default_RangedMode('Accuracy')
	end
end

function set_default_RangedMode(defaultMode)
	if options.RangedModes[state.RangedMode] ~= nil then
		state.RangedMode = defaultMode
	end
end

-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)
	local defenseString = ''
	if state.Defense.Active then
		local defMode = state.Defense.PhysicalMode
		if state.Defense.Type == 'Magical' then
			defMode = state.Defense.MagicalMode
		end
		defenseString = 'Defense: '..state.Defense.Type..' '..defMode..', '
	end

	add_to_chat(122,'Offense: '..state.OffenseMode..', Ranged: '..state.RangedMode..', WS: '..state.WeaponskillMode..
		', '..defenseString..'Kiting: '..on_off_names[state.Kiting])
	eventArgs.handled = true
end