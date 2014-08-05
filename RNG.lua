-----------------------------------------------------------------------------------------------------------
--[[
	Author: Ragnarok.Lorand
--]]
-----------------------------------------------------------------------------------------------------------

function get_sets()
	include('include.lua')
end

function job_setup()
	state.warned = false
end

function user_setup()
	-- Options: Override default values
	options.OffenseModes = {'Melee', 'Gun', 'Bow', 'Accuracy'}
	options.RangedModes = {'Default'}
	options.WeaponskillModes = {'Normal'}
	options.CastingModes = {'Normal'}
	options.IdleModes = {'Normal','Speedy'}
	options.RestingModes = {'Normal'}
	options.PhysicalDefenseModes = {'PDT'}
	options.MagicalDefenseModes = {'MDT'}

	state.Defense.PhysicalMode = 'PDT'
	state.OffenseMode = 'Bow'
	state.IdleMode = 'Speedy'
	state.RangedMode = 'Default'
	
	options.ammo_warning_limit = 15

	refreshRangedModes()
	
	send_command('bind @1 input /ma "Utsusemi: Ni" <me>')
	send_command('bind @2 input /ma "Utsusemi: Ichi" <me>')
	send_command('bind @3 input /ja "Scavenge" <me>')
	send_command('bind @4 input /ja "Bounty Shot" <t>')
	send_command('bind @5 gs c cycle RangedMode')
	send_command('bind @6 input ')
	send_command('bind @7 input ')
	send_command('bind @8 input /ja "Spectral Jig" <me>')
	send_command('bind @9 input /ma "Monomi: Ichi" <me>')
	send_command('bind @0 input /ma "Tonko: Ni" <me>')
	
	send_command('bind ^` input /ja "Sharpshot" <me>')
	send_command('bind !` input /ja "Velocity Shot" <me>')
	
	send_command('bind @` input /ja "Shadowbind" <t>')
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

function get_sub_type()
	if player.sub_job == 'SAM' then
		return 'sam'
	else
		return 'other'
	end
end

function build_equipSet(spell, action)
	equipSet = {}
	equipSet = set_combine(equipSet, sets[state.OffenseMode])
	equipSet = combine_if_defined(equipSet, sets[state.OffenseMode][get_sub_type()])
	--equipSet = set_combine(equipSet, sets[state.OffenseMode][get_sub_type()])
	equipSet = combine_if_defined(equipSet, sets[state.OffenseMode][get_sub_type()][state.RangedMode])
	--equipSet = set_combine(equipSet, sets[state.OffenseMode][get_sub_type()][state.RangedMode])

	if action == 'Idle' then
		idleSet = {}
		idleSet = get_current_idle_set()
		equipSet = set_combine(idleSet, equipSet)
	elseif action == 'TP' then
		if buffactive.Barrage then
			equipSet = sets.ranged.barrage
		else
			equipSet = set_combine(equipSet, sets[state.OffenseMode][get_sub_type()][state.RangedMode]['tp'])
			equipSet = set_combine(sets.tpBase, equipSet)
		end
	elseif action == 'WS' then
		equipSet = set_combine(equipSet, sets[state.OffenseMode][get_sub_type()][state.RangedMode]['ws'])
		equipSet = combine_if_available(equipSet, 'ammo', gear[state.OffenseMode..'_ammo_WS'])
		
		wsSet = {}
		wsSet = sets.wsBase
		
		wsSet = incorporate_subset(wsSet, wsmod[spell.english])
		wsSet = incorporate_subset(wsSet, spell.english)
		wsSet = combine_ftp_gear(wsSet, spell)
		
		equipSet = set_combine(wsSet, equipSet)
	end
	
	return equipSet
end

-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
	refreshRangedModes()
	
	equip(build_equipSet(nil, 'Idle'))
	
	--equipSet = set_combine(get_current_baseSet(), get_gear_for_status(player.status))
	--equip(equipSet)
	--equip(get_current_baseSet())
	--equip(get_gear_for_status(player.status))
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