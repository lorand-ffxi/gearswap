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
	state.Buff.Sentinel = buffactive.sentinel or false
	state.Buff.Cover = buffactive.cover or false
end

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
	-- Options: Override default values
	options.OffenseModes = {'Normal', 'TankP', 'TankM'}
	options.DefenseModes = {'Normal'}
	options.WeaponskillModes = {'Normal'}
	options.CastingModes = {'Normal'}
	options.IdleModes = {'Normal','Speedy','Showoff','ShieldSkillup','PDT','MDT'}
	options.RestingModes = {'Normal'}
	options.PhysicalDefenseModes = {'PDT', 'Reraise'}
	options.MagicalDefenseModes = {'MDT', 'Reraise'}

	state.Defense.PhysicalMode = 'PDT'
	state.IdleMode = 'Showoff'

	-- physical_darkring1 = {name="Dark Ring",augments={"Physical Damage Taken -6%", "Magic Damage Taken -3%", "Spell Interruption Rate Down 5%"}}
	-- physical_darkring2 = {name="Dark Ring",augments={"Physical Damage Taken -5%", "Magic Damage Taken -3%"}}
	-- magic_breath_darkring1 = {name="Dark Ring",augments={"Magic Damage Taken -6%", "Breath Damage Taken -5%"}}
	-- magic_breath_darkring2 = {name="Dark Ring",augments={"Magic Damage Taken -5%", "Breath Damage Taken -6%"}}

	refresh_keybindings()
end

function refresh_keybindings()
	send_command('bind @1 input /ma "Utsusemi: Ni" <me>')
	send_command('bind @2 input /ma "Utsusemi: Ichi" <me>')
	send_command('bind @3 input /ja Provoke <t>')
	send_command('bind @4 input /ma "Reprisal" <me>')
	send_command('bind @5 input /ma "Phalanx" <me>')
	send_command('bind @6 input /ma "Enlight" <me>')
	send_command('unbind @7')
	send_command('bind @8 input /ja "Spectral Jig" <me>')
	send_command('bind @9 input /ma "Monomi: Ichi" <me>')
	send_command('bind @0 input /ma "Tonko: Ni" <me>')
	
	send_command('bind @` input /ja "Violent Flourish" <t>')
	
	send_command('unbind ^=')
	send_command('unbind !=')
	send_command('bind ^` input /ja "Divine Emblem" <me>')
	send_command('bind !` input /ja "Shield Bash" <t>')
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
	end
end