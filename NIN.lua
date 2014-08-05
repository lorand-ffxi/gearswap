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
	state.Buff.Migawari = buffactive.migawari or false
	state.Buff.Doomed = buffactive.doomed or false

	determine_haste_group()
end

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
	-- Options: Override default values
	options.OffenseModes = {'HasteII', 'HasteII++', 'HasteII_Acc', 'HasteII++_Acc', 'Tank'}	--'HasteI', 'HasteI_HasteSamba',
	options.AccuracyModes = {'Normal', 'Higher'}
	options.DefenseModes = {'Normal', 'Evasion', 'PDT'}
	options.WeaponskillModes = {'Normal', 'Acc', 'Att'}
	options.CastingModes = {'Normal'}
	options.IdleModes = {'Normal','Speedy'}
	options.RestingModes = {'Normal'}
	options.PhysicalDefenseModes = {'PDT', 'Evasion'}
	options.MagicalDefenseModes = {'MDT'}

	state.OffenseMode = 'HasteII'
	state.AccuracyMode = 'Normal'
	state.Defense.PhysicalMode = 'PDT'
	state.IdleMode = 'Speedy'
	
	refresh_keybindings()
end

function refresh_keybindings()
	send_command('bind @1 input /ma "Utsusemi: Ni" <me>')
	send_command('bind @2 input /ma "Utsusemi: Ichi" <me>')
	send_command('bind @3 input /ja Provoke <t>')
	send_command('unbind @4')
	send_command('bind @5 gs c cycle AccuracyMode')
	send_command('unbind @6')
	send_command('unbind @7')
	send_command('bind @8 input /ja "Spectral Jig" <me>')
	send_command('bind @9 input /ma "Monomi: Ichi" <me>')
	send_command('bind @0 input /ma "Tonko: Ni" <me>')
	
	send_command('bind @` input /ja "Violent Flourish" <t>')
	
	send_command('unbind ^=')
	send_command('unbind !=')
	send_command('bind ^` input /ja "Innin" <me>')
	send_command('bind !` input /ja "Yonin" <me>')
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
function job_aftercast(spell, action, spellMap, eventArgs)
	if not spell.interrupted and spell.english == "Migawari: Ichi" then
		state.Buff.Migawari = true
	end
end

-------------------------------------------------------------------------------------------------------------------
-- Customization hooks for idle and melee sets, after they've been automatically constructed.
-------------------------------------------------------------------------------------------------------------------

-- Called before the Include starts constructing melee/idle/resting sets.
-- Can customize state or custom melee class values at this point.
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_handle_equipping_gear(status, eventArgs)
	sets.Kiting = select_movement()
end

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
	idleSet = set_combine(idleSet, select_movement())
	if state.Buff.Migawari then
		idleSet = set_combine(idleSet, sets.buff.Migawari)
	end
	if state.Buff.Doomed then
		idleSet = set_combine(idleSet, sets.buff.Doomed)
	end
	return idleSet
end

-- Modify the default melee set after it was constructed.
function customize_melee_set(meleeSet)
	if state.Buff.Migawari then
		meleeSet = set_combine(meleeSet, sets.buff.Migawari)
	end
	if state.Buff.Doomed then
		meleeSet = set_combine(meleeSet, sets.buff.Doomed)
	end
	return meleeSet
end

-------------------------------------------------------------------------------------------------------------------
-- General hooks for other events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
	-- If we gain or lose any haste buffs, adjust which gear set we target.
	if S{'haste','march','embrava','haste samba'}:contains(buff:lower()) then
		determine_haste_group()
		handle_equipping_gear(player.status)
	elseif state.Buff[buff] ~= nil then
		state.Buff[buff] = gain
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

-- Called by the default 'update' self-command.
function job_update(cmdParams, eventArgs)
	determine_haste_group()
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function select_movement()
	-- world.time is given in minutes into each day
	-- 7:00 AM would be 420 minutes		(dawn)
	-- 17:00 PM would be 1020 minutes	(dusk)
	if state.IdleMode == 'Speedy' and (world.time >= (17*60) or world.time <= (7*60)) then
		return sets.NightMovement
	else
		return sets.DayMovement
	end
end

function determine_haste_group()
	-- We have three groups of DW in gear: Hachiya body/legs, Iga head + Patentia Sash, and DW earrings
	
	-- Standard gear set reaches near capped delay with just Haste (77%-78%, depending on HQs)

	-- For high haste, we want to be able to drop one of the 10% groups.
	-- Basic gear hits capped delay (roughly) with:
	-- 1 March + Haste
	-- 2 March
	-- Haste + Haste Samba
	-- 1 March + Haste Samba
	-- Embrava
	
	-- High haste buffs:
	-- 2x Marches + Haste Samba == 19% DW in gear
	-- 1x March + Haste + Haste Samba == 22% DW in gear
	-- Embrava + Haste or 1x March == 7% DW in gear
	
	-- For max haste (capped magic haste + 25% gear haste), we can drop all DW gear.
	-- Max haste buffs:
	-- Embrava + Haste+March or 2x March
	-- 2x Marches + Haste
	
	-- So we want four tiers:
	-- Normal DW
	-- 20% DW -- High Haste
	-- 7% DW (earrings) - Embrava Haste (specialized situation with embrava and haste, but no marches)
	-- 0 DW - Max Haste
	
	classes.CustomMeleeGroups:clear()
	
	if buffactive.embrava and (buffactive.march == 2 or (buffactive.march and buffactive.haste)) then
		classes.CustomMeleeGroups:append('MaxHaste')
	elseif buffactive.march == 2 and buffactive.haste then
		classes.CustomMeleeGroups:append('MaxHaste')
	elseif buffactive.embrava and (buffactive.haste or buffactive.march) then
		classes.CustomMeleeGroups:append('EmbravaHaste')
	elseif buffactive.march == 1 and buffactive.haste and buffactive['haste samba'] then
		classes.CustomMeleeGroups:append('HighHaste')
	elseif buffactive.march == 2 then
		classes.CustomMeleeGroups:append('HighHaste')
	end
end