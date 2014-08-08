-----------------------------------------------------------------------------------------------------------
--[[
	Author: Ragnarok.Lorand
--]]
-----------------------------------------------------------------------------------------------------------

function get_sets()
	include('include.lua')
end

-- Setup vars that are user-independent.
function job_setup()
	state.CombatForm = get_combat_form()
	update_melee_groups()
end

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
	-- Options: Override default values
	options.OffenseModes = {'Normal_A', 'Normal_B', 'Normal_C',	'HitMoar', 'Tank', 'TankAcc', 'Mix'}
	options.DefenseModes = {'Normal'}
	options.WeaponskillModes = {'Normal', 'Acc'}
	options.IdleModes = {'Normal','Speedy'}
	options.RestingModes = {'Normal'}
	options.PhysicalDefenseModes = {'PDT'}
	options.MagicalDefenseModes = {'MDT'}

	state.OffenseMode = 'Normal_A'
	state.Defense.PhysicalMode = 'PDT'
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
	
	send_command('unbind ^=')
	send_command('unbind !=')
	send_command('unbind ^`')
	send_command('bind !` input /ja "Perfect Counter" <me>')
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

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks that are called to process player actions at specific points in time.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
	-- Don't gearswap for weaponskills when Defense is on.
	if spell.type:lower() == 'weaponskill' and state.Defense.Active then
		eventArgs.handled = true
	elseif spell.type == 'Waltz' then
		refine_waltz(spell, action, spellMap, eventArgs)
	end
end

-- Run after the general precast() is done.
function job_post_precast(spell, action, spellMap, eventArgs)
	if spell.type:lower() == 'weaponskill' and not state.Defense.Active then
		--if buffactive.impetus and (spell.english == "Ascetic's Fury" or spell.english == "Victory Smite") then
		--	equip({body="Tantra Cyclas +2"})
		--else
		if buffactive.footwork and (spell.english == "Dragon's Kick" or spell.english == "Tornado Kick") then
			equip({feet="Anchorite's Gaiters"})
		end
	end
end

-------------------------------------------------------------------------------------------------------------------
-- General hooks for other game events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
	-- Set Footwork as combat form any time it's active and Hundred Fists is not.
	if buff == 'Footwork' and gain and not buffactive['hundred fists'] then
		state.CombatForm = 'Footwork'
	elseif buff == "Hundred Fists" and not gain and buffactive.footwork then
		state.CombatForm = 'Footwork'
	else
		state.CombatForm = nil
	end
	
	-- Hundred Fists and Impetus modify the custom melee groups
	if buff == "Hundred Fists" or buff == "Impetus" then
		classes.CustomMeleeGroups:clear()
		
		if (buff == "Hundred Fists" and gain) or buffactive['hundred fists'] then
			classes.CustomMeleeGroups:append('HF')
		end
		
		if (buff == "Impetus" and gain) or buffactive.impetus then
			classes.CustomMeleeGroups:append('Impetus')
		end
	end

	-- Update gear if any of the above changed
	if buff == "Hundred Fists" or buff == "Impetus" or buff == "Footwork" then
		handle_equipping_gear(player.status)
	end
end


-- Called when the player's subjob changes.
function sub_job_change(newSubjob, oldSubjob)
	refresh_keybindings()
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements self-commands.
-------------------------------------------------------------------------------------------------------------------

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
	state.CombatForm = get_combat_form()
	update_melee_groups()
end


-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function get_combat_form()
	if buffactive.footwork and not buffactive['hundred fists'] then
		return 'Footwork'
	end
end

function update_melee_groups()
	classes.CustomMeleeGroups:clear()
	
	if buffactive['hundred fists'] then
		classes.CustomMeleeGroups:append('HF')
	end
	
	if buffactive.impetus then
		classes.CustomMeleeGroups:append('Impetus')
	end
end