-----------------------------------------------------------------------------------------------------------
--[[
	Author: Ragnarok.Lorand
--]]
-----------------------------------------------------------------------------------------------------------

function get_sets()
	include('include.lua')
end

function job_setup()
	state.Buff['Sneak Attack'] = buffactive['sneak attack'] or false
	state.Buff['Trick Attack'] = buffactive['trick attack'] or false
	state.Buff['Feint'] = buffactive['feint'] or false
	
	-- TH mode handling
	options.TreasureModes = {'None','TH'}
	state.TreasureMode = 'None'
end

function user_setup()
	options.OffenseModes = {'Normal', 'Acc', 'TH'}
	options.DefenseModes = {'Normal', 'Evasion', 'PDT'}
	options.RangedModes = {'Normal', 'TH', 'Acc'}
	options.WeaponskillModes = {'Normal'}
	options.IdleModes = {'Normal','Speedy'}
	options.RestingModes = {'Normal'}
	options.PhysicalDefenseModes = {'Evasion', 'PDT'}
	options.MagicalDefenseModes = {'MDT'}

	state.RangedMode = 'TH'
	state.Defense.PhysicalMode = 'Evasion'
	state.OffenseMode = 'TH'
	state.IdleMode = 'Speedy'

	refresh_keybindings()
end

function refresh_keybindings()
	send_command('bind @1 input /ma "Utsusemi: Ni" <me>')
	send_command('bind @2 input /ma "Utsusemi: Ichi" <me>')
	send_command('bind @3 input /ja Provoke <t>')
	send_command('unbind @4')
	send_command('unbind @5')
	send_command('unbind @6')
	send_command('unbind @7')
	send_command('bind @8 input /ja "Spectral Jig" <me>')
	send_command('bind @9 input /ma "Monomi: Ichi" <me>')
	send_command('bind @0 input /ma "Tonko: Ni" <me>')
	
	send_command('bind @` input /ja "Violent Flourish" <t>')
	
	send_command('bind ^= gs c cycle treasuremode')
	--send_command('bind != gs c cycle targetmode')
	send_command('unbind ^`')
	send_command('unbind !`')
	send_command('unbind !s')
	send_command('unbind ^s')
	send_command('unbind !a')
	send_command('unbind ^a')
	
	if player.sub_job == 'DNC' then
		send_command('bind @3 input /ja "Animated Flourish" <t>')
	elseif player.sub_job == 'WAR' then
		send_command('bind @3 input /ja Provoke <t>')
	else
		send_command('unbind @3')
	end
end

function th_check()
	if state.TreasureMode == 'TH' then
		equip(sets.TreasureHunter)
	end
end

-- Run after the general precast() is done.
function job_post_precast(spell, action, spellMap, eventArgs)
	if spell.type == 'Step' or spell.type == 'Flourish1' then
		if state.TreasureMode ~= 'None' then
			equip(sets.TreasureHunter)
		end
	elseif spell.english=='Sneak Attack' or spell.english=='Trick Attack' then
		th_check()
	end
end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
	-- Update the state of certain buff JAs if the action wasn't interrupted.
	if not spell.interrupted then
		if state.Buff[spell.name] ~= nil then
			state.Buff[spell.name] = true
		end
		
		-- Don't let aftercast revert gear set for SA/TA/Feint
		if S{'Sneak Attack', 'Trick Attack', 'Feint'}:contains(spell.english) then
			eventArgs.handled = true
		end
		
		-- If this wasn't an action that would have used up SATA/Feint, make sure to put gear back on.
		if spell.type:lower() ~= 'weaponskill' and spell.type:lower() ~= 'step' then
			-- If SA/TA/Feint are active, put appropriate gear back on (including TH gear).
			if state.Buff['Sneak Attack'] then
				equip(sets.precast.JA['Sneak Attack'])
				th_check()
				eventArgs.handled = true
			elseif state.Buff['Trick Attack'] then
				equip(sets.precast.JA['Trick Attack'])
				th_check()
				eventArgs.handled = true
			elseif state.Buff['Feint'] then
				equip(sets.precast.JA['Feint'])
				th_check()
				eventArgs.handled = true
			end
		end
	end
end


-------------------------------------------------------------------------------------------------------------------
-- Customization hooks for idle and melee sets construction.
-------------------------------------------------------------------------------------------------------------------

function get_custom_wsmode(spell, action, spellMap)
	local wsmode = ''
	if state.Buff['Sneak Attack'] then
		wsmode = 'SA'
	end
	if state.Buff['Trick Attack'] then
		wsmode = wsmode .. 'TA'
	end
	
	if wsmode ~= '' then
		return wsmode
	end
end

function customize_idle_set(idleSet)
	if state.TreasureMode == 'TH' then
		idleSet = set_combine(idleSet, sets.TreasureHunter, sets.NormalWeapons)
	else
		idleSet = set_combine(idleSet, sets.NormalWeapons)
	end
	
	if state.Kiting then
		idleSet = set_combine(idleSet, sets.Kiting)
	end
	
	return idleSet
end

function customize_melee_set(meleeSet)
	if state.TreasureMode == 'TH' then
		meleeSet = set_combine(meleeSet, sets.TreasureHunter, sets.NormalWeapons)
	else
		meleeSet = set_combine(meleeSet, sets.NormalWeapons)
	end
	
	return meleeSet
end

-------------------------------------------------------------------------------------------------------------------
-- General hooks for other events.
-------------------------------------------------------------------------------------------------------------------

-- Called when the player's status changes.
function job_status_change(newStatus, oldStatus, eventArgs)
	check_range_lock()
	
	-- If engaging, put on TH gear.
	-- If disengaging, turn off TH tagging.
	if newStatus == 'Engaged' and state.TreasureMode ~= 'None' then
		equip(sets.TreasureHunter)
	end

	-- If SA/TA/Feint are active, don't change gear sets
	if satafeint_active() then
		eventArgs.handled = true
	end
end

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
	if state.Buff[buff] ~= nil then
		state.Buff[buff] = gain

		if not satafeint_active() then
			handle_equipping_gear(player.status)
		end
	end
end

-------------------------------------------------------------------------------------------------------------------
-- Hooks for TH mode handling.
-------------------------------------------------------------------------------------------------------------------

-- Request job-specific mode tables.
-- Return true on the third returned value to indicate an error: that we didn't recognize the requested field.
function job_get_mode_list(field)
	if field == 'Treasure' then
		return options.TreasureModes, state.TreasureMode
	end
end

-- Set job-specific mode values.
-- Return true if we recognize and set the requested field.
function job_set_mode(field, val)
	if field == 'Treasure' then
		state.TreasureMode = val
		return true
	end
end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements self-commands.
-------------------------------------------------------------------------------------------------------------------

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
	check_range_lock()
	
	-- Update the current state of state.Buff, in case buff_change failed to update the value.
	state.Buff['Sneak Attack'] = buffactive['sneak attack'] or false
	state.Buff['Trick Attack'] = buffactive['trick attack'] or false
	state.Buff['Feint'] = buffactive['feint'] or false

	-- Don't allow normal gear equips if SA/TA/Feint is active.
	if satafeint_active() then
		eventArgs.handled = true
	end
end


-- Handle notifications of general user state change.
function job_state_change(stateField, newValue)
	if stateField == 'TreasureMode' then
		local prevRangedMode = state.RangedMode
		
		if newValue == 'TH' or newValue == 'PureTH' then
			state.RangedMode = 'TH'
		elseif state.OffenseMode == 'Acc' then
			state.RangedMode = 'Acc'
		else
			state.RangedMode = 'Normal'
		end
		
		if state.RangedMode ~= prevRangedMode then
			add_to_chat(121,'Ranged mode is now '..state.RangedMode)
		end
	elseif stateField == 'OffenseMode' then
		local prevRangedMode = state.RangedMode

		if newValue == 'Acc' then
			state.RangedMode = 'Acc'
		else
			state.RangedMode = 'Normal'
		end
		
		if state.RangedMode ~= prevRangedMode then
			add_to_chat(121,'Ranged mode is now '..state.RangedMode)
		end
	elseif stateField == 'Reset' then
		state.RangedMode = 'TH'
	end
end


-- Function to display the current relevant user state when doing an update.
-- Return true if display was handled, and you don't want the default info shown.
function display_current_job_state(eventArgs)
	local defenseString = ''
	if state.Defense.Active then
		local defMode = state.Defense.PhysicalMode
		if state.Defense.Type == 'Magical' then
			defMode = state.Defense.MagicalMode
		end

		defenseString = 'Defense: '..state.Defense.Type..' '..defMode..'  '
	end
	
	add_to_chat(122,'Melee: '..state.OffenseMode..'/'..state.DefenseMode..'  WS: '..state.WeaponskillMode..'  '..
		defenseString..'Kiting: '..on_off_names[state.Kiting]..'  TH: '..state.TreasureMode)

	eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Function to lock the ranged slot if we have a ranged weapon equipped.
function check_range_lock()
	if player.equipment.range ~= 'empty' then
		disable('range', 'ammo')
	else
		enable('range', 'ammo')
	end
end

-- Function to indicate if any buffs have been activated that we don't want to equip gear over.
function satafeint_active()
	return state.Buff['Sneak Attack'] or state.Buff['Trick Attack'] or state.Buff['Feint']
end