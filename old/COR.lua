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
	else
		if player.sub_job == 'SAM' then
			options.RangedModes = {'5-hit','a5-hit','4-hit'}
			set_default_RangedMode('a5-hit')
		else
			options.RangedModes = {'5-hit'}
			set_default_RangedMode('5-hit')
		end
	end
end

function set_default_RangedMode(defaultMode)
	if options.RangedModes[state.RangedMode] ~= nil then
		state.RangedMode = defaultMode
	end
end

function build_equipSet(spell, action)
	equipSet = {}
	equipSet = set_combine(equipSet, sets[state.OffenseMode])
	equipSet = set_combine(equipSet, sets[state.OffenseMode][get_sub_type()])
	equipSet = set_combine(equipSet, sets[state.OffenseMode][get_sub_type()][state.RangedMode])

	if action == 'Idle' then
		idleSet = {}
		idleSet = get_current_idle_set()
		equipSet = set_combine(idleSet, equipSet)
	elseif action == 'TP' then
		equipSet = set_combine(equipSet, sets[state.OffenseMode][get_sub_type()][state.RangedMode]['tp'])
		equipSet = set_combine(sets.tpBase, equipSet)
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

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function define_roll_values()
	rolls = {
		["Corsair's Roll"]   = {lucky=5, unlucky=9, bonus="Experience Points"},
		["Ninja Roll"]       = {lucky=4, unlucky=8, bonus="Evasion"},
		["Hunter's Roll"]    = {lucky=4, unlucky=8, bonus="Accuracy"},
		["Chaos Roll"]       = {lucky=4, unlucky=8, bonus="Attack"},
		["Magus's Roll"]     = {lucky=2, unlucky=6, bonus="Magic Defense"},
		["Healer's Roll"]    = {lucky=3, unlucky=7, bonus="Cure Potency Received"},
		["Puppet Roll"]      = {lucky=4, unlucky=8, bonus="Pet Magic Accuracy/Attack"},
		["Choral Roll"]      = {lucky=2, unlucky=6, bonus="Spell Interruption Rate"},
		["Monk's Roll"]      = {lucky=3, unlucky=7, bonus="Subtle Blow"},
		["Beast Roll"]       = {lucky=4, unlucky=8, bonus="Pet Attack"},
		["Samurai Roll"]     = {lucky=2, unlucky=6, bonus="Store TP"},
		["Evoker's Roll"]    = {lucky=5, unlucky=9, bonus="Refresh"},
		["Rogue's Roll"]     = {lucky=5, unlucky=9, bonus="Critical Hit Rate"},
		["Warlock's Roll"]   = {lucky=4, unlucky=8, bonus="Magic Accuracy"},
		["Fighter's Roll"]   = {lucky=5, unlucky=9, bonus="Double Attack Rate"},
		["Drachen Roll"]     = {lucky=3, unlucky=7, bonus="Pet Accuracy"},
		["Gallant's Roll"]   = {lucky=3, unlucky=7, bonus="Defense"},
		["Wizard's Roll"]    = {lucky=5, unlucky=9, bonus="Magic Attack"},
		["Dancer's Roll"]    = {lucky=3, unlucky=7, bonus="Regen"},
		["Scholar's Roll"]   = {lucky=2, unlucky=6, bonus="Conserve MP"},
		["Bolter's Roll"]    = {lucky=3, unlucky=9, bonus="Movement Speed"},
		["Caster's Roll"]    = {lucky=2, unlucky=7, bonus="Fast Cast"},
		["Courser's Roll"]   = {lucky=3, unlucky=9, bonus="Snapshot"},
		["Blitzer's Roll"]   = {lucky=4, unlucky=9, bonus="Attack Delay"},
		["Tactician's Roll"] = {lucky=5, unlucky=8, bonus="Regain"},
		["Allies's Roll"]    = {lucky=3, unlucky=10, bonus="Skillchain Damage"},
		["Miser's Roll"]     = {lucky=5, unlucky=7, bonus="Save TP"},
		["Companion's Roll"] = {lucky=2, unlucky=10, bonus="Pet Regain and Regen"},
		["Avenger's Roll"]   = {lucky=4, unlucky=8, bonus="Counter Rate"},
	}
end

function display_roll_info(spell)
	rollinfo = rolls[spell.english]
	local rollsize = 'Small'
	if rollinfo then
		add_to_chat(104, spell.english..' provides a bonus to '..rollinfo.bonus..'.  Roll size: '..rollsize)
		add_to_chat(104, 'Lucky roll is '..tostring(rollinfo.lucky)..', Unlucky roll is '..tostring(rollinfo.unlucky)..'.')
	end
end