-----------------------------------------------------------------------------------------------------------
--[[
	Author: Ragnarok.Lorand
--]]
-----------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
	include('include.lua')
end

-- Setup vars that are user-independent.
function job_setup()
	state.Buff.Sekkanoki = buffactive.sekkanoki or false
	state.Buff.Sengikori = buffactive.sengikori or false
	state.Buff['Meikyou Shisui'] = buffactive['Meikyou Shisui'] or false
end

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
	-- Options: Override default values
	options.OffenseModes = {'4-Hit', '5-Hit', '5-Acc'}
	options.DefenseModes = {'Normal', 'PDT', 'Reraise'}
	options.WeaponskillModes = {'Normal'}
	options.CastingModes = {'Normal'}
	options.IdleModes = {'Normal', 'Speedy', 'Reraise'}
	options.RestingModes = {'Normal'}
	options.PhysicalDefenseModes = {'PDT', 'Reraise'}
	options.MagicalDefenseModes = {'MDT'}

	state.OffenseMode = '4-Hit'
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
	--send_command('bind @` input /ja "Blade Bash" <t>')
	
	send_command('unbind ^=')
	send_command('unbind !=')
	send_command('bind ^` input /ja "Hasso" <me>')
	send_command('bind !` input /ja "Seigan" <me>')
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

-- Run after the default precast() is done.
-- eventArgs is the same one used in job_precast, in case information needs to be persisted.
function job_post_precast(spell, action, spellMap, eventArgs)
	if spell.type:lower() == 'weaponskill' then
		if state.Buff.Sekkanoki then
			equip(sets.buff.Sekkanoki)
		end
		if state.Buff.Sengikori then
			equip(sets.buff.Sengikori)
		end
		if state.Buff['Meikyou Shisui'] then
			equip(sets.buff['Meikyou Shisui'])
		end
	end
end

function job_post_midcast(spell, action, spellMap, eventArgs)
	-- Effectively lock these items in place.
	if state.DefenseMode == 'Reraise' or
		(state.Defense.Active and state.Defense.Type == 'Physical' and state.Defense.PhysicalMode == 'Reraise') then
		equip(sets.Reraise)
	end
end