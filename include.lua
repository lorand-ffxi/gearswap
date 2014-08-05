--=========================================================================================================
--[[
	Adapted from Mote's GearSwap files by Ragnarok.Lorand
	Common variables and functions to be included in job scripts, for general default handling.

	Include this file in the get_sets() function with the command:
	include('include.lua')
	It will then automatically run its own init_include() function.

	Included variables and functions are considered to be at the same scope level as the job script itself,
	and can be used as such.
--]]
--=========================================================================================================

function binds_on_load()
	send_command('alias equip gs c equip')
	send_command('bind ^d gs c activate PhysicalDefense')
	send_command('bind !d gs c activate MagicalDefense')
	send_command('bind @d gs c reset defense')
	
	send_command('bind @e gs c update user')
	send_command("bind @w equip engaged")
	send_command('bind @s gs c cycle OffenseMode')
	send_command('bind @q gs c cycle IdleMode')
	send_command('bind @c gs c cycle CastingMode')
	send_command('bind @k gs c toggle kiting')
	
	send_command('bind @F12 du blinking self always')
end

function binds_on_unload()
	send_command('unbind @1;unbind @2;unbind @3;unbind @4;unbind @5')
	send_command('unbind @6;unbind @7;unbind @8;unbind @9;unbind @0')
	send_command('unbind ^=;unbind !=')
	send_command('unbind ^`;unbind !`;unbind @`')
	send_command('unbind @F1;unbind @F2;unbind @F3;unbind @F4')
	send_command('unbind !a;unbind ^a')
	send_command('unbind !s;unbind ^s')
end

--=========================================================================================================
-- Initialization function that defines variables to be used.
-- These are accessible at the including job lua script's scope.
--
-- Auto-initialize after defining this function.
--=========================================================================================================
function init_include()
	include('mappings')
	info = {}								-- Var for tracking misc info
	state = {}								-- Var for tracking state values

	-- General melee offense/defense modes, allowing for hybrid set builds, as well as idle/resting/weaponskill.
	state.OffenseMode     = 'Normal'
	state.AccuracyMode	  = 'Normal'
	state.DefenseMode     = 'Normal'
	state.RangedMode      = 'Normal'
	state.WeaponskillMode = 'Normal'
	state.CastingMode     = 'Normal'
	state.IdleMode        = 'Normal'
	state.RestingMode     = 'Normal'

	-- All-out defense state, either physical or magical
	state.Defense = {}
	state.Defense.Active       = false
	state.Defense.Type         = 'Physical'
	state.Defense.PhysicalMode = 'PDT'
	state.Defense.MagicalMode  = 'MDT'

	state.Kiting               = false
	state.MaxWeaponskillDistance = 0

	state.SelectNPCTargets     = false
	state.PCTargetMode         = 'default'
	
	state.CombatWeapon = nil
	state.CombatForm = nil

	state.Buff = {}

	-- Vars for specifying valid mode values.
	-- Defaults here are just for example. Set them properly in each job file.
	options = {}
	options.OffenseModes = {'Normal'}
	options.AccuracyModes = {'Normal'}
	options.DefenseModes = {'Normal'}
	options.RangedModes = {'Normal'}
	options.WeaponskillModes = {'Normal'}
	options.CastingModes = {'Normal'}
	options.IdleModes = {'Normal'}
	options.RestingModes = {'Normal'}
	options.PhysicalDefenseModes = {'PDT'}
	options.MagicalDefenseModes = {'MDT'}

	options.TargetModes = {'default', 'stpc', 'stpt', 'stal'}
	
	options.use_ftp_neck = true
	options.use_ftp_waist = false
	options.useTwilightCape = false
	options.useObi = true
	
	-- Spell mappings to describe a 'type' of spell.  Used when searching for valid sets.
	classes = {}
	classes.SpellMaps = spell_maps
	classes.NoSkillSpells = no_skill_spells_list
	
	-- Custom, job-defined class, like the generic spell mappings.
	-- Takes precedence over default spell maps.
	-- Is reset at the end of each spell casting cycle (ie: at the end of aftercast).
	classes.CustomClass = nil
	
	-- Custom groups used for defining melee and idle sets.  Persists long-term.
	classes.CustomMeleeGroups = L{}
	classes.CustomRangedGroups = L{}
	classes.CustomIdleGroups = L{}
	classes.CustomDefenseGroups = L{}

	-- Display text mapping.
	on_off_names = {[true] = 'on', [false] = 'off'}

	-- Subtables of sets that are expected to exist, and are annoying to have to define within each job
	-- file.  Defined here to prevent need for a checking for their existence. The job file should be
	-- including this before defining any sets, so any changes it makes will override these anyway.
	sets.precast = {}
	sets.precast.FC = {}
	sets.precast.JA = {}
	sets.precast.WS = {}
	sets.precast.WS.Magic = {}
	sets.precast.RangedAttack = {}
	sets.midcast = {}
	sets.midcast.RangedAttack = {}
	sets.midcast.Pet = {}
	sets.idle = {}
	sets.resting = sets.idle
	sets.engaged = {}
	sets.defense = {}
	sets.buff = {}
	
	sets.wsBase = {}
	
	gear = {}
	gear.default = {}
	
	gear.Thief = {}
	gear.Thief.Main = {}
	gear.Thief.Sub = {}

	
	-- Load externally-defined information (info that we don't want to change every time this file is updated).
	include('utility')							-- Misc utility functions
	include('selfCommands')						-- Handling of self-commands
	
	binds_on_load()								-- Activate global default binds (defined in *globals.lua)
	load_user_gear(player.main_job)				-- Load gear from a job-specific file
	execute_if_available(job_setup)				-- General var initialization and setup.
	execute_if_available(user_setup)			-- User-specific var initialization and setup.  
	init_gear_sets()							-- Load up all the gear sets.
end

init_include()									-- Auto-initialize the include

-----------------------------------------------------------------------------------------------------------
-- Generalized functions for handling precast/midcast/aftercast for player-initiated actions.
-- This depends on proper set naming.
-- Each job can override any amount of these general functions using job_xxx() hooks.
-----------------------------------------------------------------------------------------------------------

--[[
	Called when an action has been flagged as not possible to perform
--]]
function filtered_action(spell)
	add_to_chat(166, 'filtered_action('..spell.english..')')
	if spell.type == 'WhiteMagic' and buffactive['Light Arts'] and addWhiteSpells[spell.english] then
		cancel_spell()
		if update_stratagem_count() > 0 then
			send_command('@input /ja "Addendum: White" <me>; wait 1.75; input /ma "'..spell.name..'" '..spell.target.name)
		else
			add_to_chat(122, "Cancelled "..spell.name..".  Addendum: White is required, but there are no available stratagems.")
		end
		return
	elseif spell.type == 'BlackMagic' and buffactive['Dark Arts'] and addBlackSpells[spell.english] then
		local retryTarget
		if spell.target.type == 'MONSTER' then
			retryTarget = '<t>'
		else
			retryTarget = spell.target.name
		end
		cancel_spell()
		if update_stratagem_count() > 0 then
			send_command('@input /ja "Addendum: Black" <me>; wait 1.75; input /ma "'..spell.name..'" '..retryTarget)
		else
			add_to_chat(122, "Cancelled "..spell.name..".  Addendum: Black is required, but there are no available stratagems.")
		end
		return
	end
end

-- Pretarget is called when GearSwap intercepts the original text input, but before the game has done any
-- processing on it.  In particular, it hasn't initiated target selection for <st*> target types.
-- This is the only function where it will be valid to use change_target().
function pretarget(spell,action)
	local spellMap = classes.SpellMaps[spell.english]
	local eventArgs = {handled = false, cancel = false}
	
	if (spell.target.type == 'PLAYER' or spell.target.type == 'SELF') and debuff_to_na[spell.english] then
		send_command('@input /ma "'..debuff_to_na[spell.english]..'" '..spell.target.name)
		eventArgs.cancel = true
	elseif spell.english == 'Phalanx' and spell.target.type == 'PLAYER' and spell.target.type ~= 'SELF' then
		send_command('@input /ma "Phalanx II" '..spell.target.name)
		eventArgs.cancel = true
	elseif S{'Haste'}:contains(spell.english) and player.main_job == 'RDM' then
		send_command('@input /ma "Haste II" '..spell.target.name)
		eventArgs.cancel = true
	end
	
	if eventArgs.cancel then
		cancel_spell()
		return
	end

--	if not eventArgs.handled then
		-- Handle optional target conversion.
--		auto_change_target(spell, action, spellMap)
--	end
end

-- Called after the text command has been processed (and target selected), but before the packet
-- gets pushed out.  Equip any gear that should be on before the spell or ability is used.
function precast(spell, action)
	local spellMap = classes.SpellMaps[spell.name]
	local eventArgs = {handled = false, cancel = false}
	refine_waltz(spell, action, spellMap, eventArgs)
	if not_possible_to_use(spell) or eventArgs.cancel then
		cancel_spell()
		return
	end
	
	local notOverwritable = S{'Stoneskin', 'Sneak', 'Spectral Jig'}
	if notOverwritable:contains(spell.name) then
		if spell.name == 'Spectral Jig' then
			send_command('cancel Sneak')
		else
			send_command('@wait 0.5; cancel '..spell.name)
		end
	end

	--Perform checks prior to execution of the command
	if player.main_job == 'BRD' and spell.type == 'BardSong' then
		add_to_chat(122, "Casting "..spell.name.." in mode: "..state.DaurdablaMode)
		-- Auto-Pianissimo
		if spell.target.type == 'PLAYER' and not spell.target.charmed and not state.Buff['Pianissimo'] then
			cancel_spell()
			send_command('@input /ja "Pianissimo" <me>; wait 1.25; input /ma "'..spell.name..'" '..spell.target.name)
			return
		end
	elseif S{'RNG', 'COR'}:contains(player.main_job) then
		local check_ammo
		--Choose which ammo should be verified
		if spell.type == 'WeaponSkill' and bow_gun_weaponskills:contains(spell.name) then
			check_ammo = gear[state.OffenseMode..'_ammo_WS']
		elseif spell.action_type == 'Ranged Attack' then
			check_ammo = gear[state.OffenseMode..'_ammo_RA']
		end
		
		if check_ammo then		--Verify that ammunition is available
			if not player.inventory[check_ammo] then
				add_to_chat(104, 'No ammo available for that action.')
				cancel_spell()
				return
			end
			if player.inventory[check_ammo].count <= options.ammo_warning_limit and
			   player.inventory[check_ammo].count > 1 and not state.warned then
				add_to_chat(104, '*******************************')
				add_to_chat(104, '*****  LOW AMMO WARNING *****')
				add_to_chat(104, '*******************************')
				state.warned = true
			elseif player.inventory[check_ammo].count > options.ammo_warning_limit and state.warned then
				state.warned = false
			end
		end
	end
	
	equip(get_default_precast_set(spell, action, spellMap, eventArgs))
	
	-- Allow the job to add additional gear on top of the default set.
	if job_post_precast then
		job_post_precast(spell, action, spellMap, eventArgs)
	end
end

-- Builds midcast set immediately after precast() call.  Both sets are sent simultaneously; the packet
-- contains precastgear:action:midcastgear.  It should take effect regardless of the spell cast speed.
function midcast(spell,action)
	local spellMap = classes.SpellMaps[spell.english]
	local eventArgs = {handled = false}

	if spell.english == 'Utsusemi: Ichi' and not spell.interrupted then
		send_command('@wait 2; cancel 66; cancel 446')
	end
	
	if not eventArgs.handled then
		equip(get_default_midcast_set(spell, action, spellMap, eventArgs))
	end

	-- Allow the job to add additional gear on top of the default set.
	if job_post_midcast then
		job_post_midcast(spell, action, spellMap, eventArgs)
	end
	
	if buffactive['Doomed'] or buffactive['Doom'] then
		equip(sets.buff.Doomed)
	end
end

-- Called upon action completion (i.e., casting finished, ws landed, casting interrupted, etc)
function aftercast(spell,action)
	if spell.name == 'Unknown Interrupt' then return end
	local spellMap = classes.SpellMaps[spell.english]
	local eventArgs = {handled = false}
	
	if not spell.interrupted then
		initSleepTimer(spell, spellMap)
		if player.main_job == "BLM" then
			if spell.english == 'Mana Wall' and player.equipment.feet == "Goetia Sabots +2" then
				disable('feet')
			end
		elseif player.main_job == "BRD" then
			if spell.type == 'BardSong' and spell.target then
				if spell.target.type and spell.target.type:upper() == 'SELF' then
					adjust_Timers(spell, action, spellMap)
				end
			end
		elseif player.main_job == 'WHM' then
			if spell.name == "Afflatus Misery" then
				state.Buff['Afflatus Solace'] = false
			end
		end
		if state.Buff[spell.name] ~= nil then state.Buff[spell.name] = true end
	end
	
	if job_aftercast then
		job_aftercast(spell, action, spellMap, eventArgs)
	end

	-- Handle equipping default gear if the job didn't mark this as handled, and if the pet isn't
	-- in mid-action (thus triggering calls to pet_midcast before this and pet_aftercast after this).
	if not eventArgs.handled and not pet_midaction() then
		if spell.interrupted then
			send_command('wait 0.6;gs c update')	-- Delay update so aftercast equip will actually be worn.
		else
			handle_equipping_gear(player.status)
		end
	end
	
	-- Allow the job to take additional actions after the default gear handling.
	if job_post_aftercast then
		job_post_aftercast(spell, action, spellMap, eventArgs)
	end
	-- Reset after all possible precast/midcast/aftercast/job-specific usage of the value
	-- if there's no pending pet action, in which case pet_aftercast will handle clearing it.
	if not pet_midaction() then
		classes.CustomClass = nil
	end
end

-- Called when the pet readies an action.
function pet_midcast(spell,action)
	local spellMap = classes.SpellMaps[spell.english]
	local eventArgs = {handled = false}
	if job_pet_midcast then
		job_pet_midcast(spell, action, spellMap, eventArgs)
	end
	-- Perform default equips if the job didn't handle it.
	if not eventArgs.handled then
		equip(get_default_pet_midcast_set(spell, action, spellMap, eventArgs))
	end
	-- Allow the job to add additional gear on top of the default set.
	if job_post_pet_midcast then
		job_post_pet_midcast(spell, action, spellMap, eventArgs)
	end
end

-- Called when the pet's action is complete.
function pet_aftercast(spell,action)
	local spellMap = classes.SpellMaps[spell.english]
	local eventArgs = {handled = false}
	if job_pet_aftercast then
		job_pet_aftercast(spell, action, spellMap, eventArgs)
	end
	if not eventArgs.handled then
		if spell.interrupted then	send_command('wait 0.6;gs c update')	-- Delay update so aftercast equip will actually be worn.
		else						handle_equipping_gear(player.status)
		end
	end
	-- Allow the job to take additional actions after the default gear handling.
	if job_post_pet_aftercast then
		job_post_pet_aftercast(spell, action, spellMap, eventArgs)
	end
	-- Reset after all possible precast/midcast/aftercast/job-specific usage of the value.
	classes.CustomClass = nil
end

-----------------------------------------------------------------------------------------------------------
-- Hooks for non-action events.
-----------------------------------------------------------------------------------------------------------

-- Called when the player's status changes.
function status_change(newStatus, oldStatus)
	local eventArgs = {handled = false}
	if job_status_change then
		job_status_change(newStatus, oldStatus, eventArgs)
	end
	-- Handle with a globally defined function if not handled by the individual job
	if not eventArgs.handled then
		if user_status_change then
			user_status_change(newStatus, oldStatus, eventArgs)
		end
	end
	-- Handle equipping default gear if the job didn't mark this as handled.
	if not eventArgs.handled then
		handle_equipping_gear(newStatus)
	end
end

-- Called when a player gains or loses a buff.
function buff_change(buff, gain)
	local eventArgs = {handled = false}
	if buff == 'Sleep' and gain and buffactive['Stoneskin'] then
		--If slept, drop stoneskin if a DOT is active to wake up
		if buffactive['Sublimation: Active'] or dotActive() then
			send_command('cancel stoneskin')
		end
	elseif player.main_job == "BLM" and buff == "Mana Wall" and not gain then
		enable('feet')		-- Unlock feet when Mana Wall buff is lost.
		handle_equipping_gear(player.status)
	elseif buff == 'Sublimation: Complete' and gain then
		add_to_chat(204, 'Sublimation is done charging!')
	elseif buff == 'Light Arts' and gain then
		state.arts = 'LA'
	elseif buff == 'Dark Arts' and gain then
		state.arts = 'DA'
	else
		if state.Buff[buff] ~= nil then state.Buff[buff] = gain end
	end
	
	if job_buff_change then
		job_buff_change(buff, gain, eventArgs)
	end
	-- Handle with a globally defined function if not handled by the individual job
	if not eventArgs.handled then
		if buff:lower() == 'weakness' then
			if gain then	send_command('timers create "Weakness" 300 up abilities/00255.png')
			else			send_command('timers delete "Weakness"')
			end
		end
	end
end

--Called when the player's sub job changes
function sub_job_change(newSubjob, oldSubjob)
	execute_if_available(refresh_keybindings)
end

-- Called when a player gains or loses a pet.
function pet_change(pet, gain)
	local eventArgs = {handled = false}
	if job_pet_change then
		job_pet_change(pet, gain, eventArgs)
	end
	-- Equip default gear if not handled by the job.
	if not eventArgs.handled then
		handle_equipping_gear(player.status)
	end
end

-- Called when the player's pet's status changes, and after pet_change when the pet is released.
-- As such, don't automatically handle gear equips.  Only do so if directed to do so by the job.
function pet_status_change(newStatus, oldStatus)
	local eventArgs = {handled = false}
	if job_pet_status_change then
		job_pet_status_change(newStatus, oldStatus, eventArgs)
	end
end

-----------------------------------------------------------------------------------------------------------
-- Generalized functions for selecting and equipping gear sets.
-----------------------------------------------------------------------------------------------------------

-- Central point to call to equip gear based on status.
-- @param playerStatus: player status that defines what should be equipped
-- @param petStatus: pet status that defines what should be equipped
function handle_equipping_gear(playerStatus, petStatus)
	local eventArgs = {handled = false}
	-- Allow jobs to override this code
	if job_handle_equipping_gear then
		job_handle_equipping_gear(playerStatus, eventArgs)
	end
	-- Equip default gear if job didn't handle it.
	if not eventArgs.handled then
		equip_gear_by_status(playerStatus)
	end
end

-- Function to wrap logic for equipping gear on aftercast, status change, or user update.
-- @param status: The current or new player status that determines what sort of gear to equip.
function equip_gear_by_status(status)
	if _global.debug_mode then
		add_to_chat(123,'Debug: Equip gear for status ['..tostring(status)..'], HP='..tostring(player.hp))
	end
	equip(get_gear_for_status(status))
end

function get_gear_for_status(status)
	-- If status not defined, treat as idle.  Asserts that HP is positive (i.e., alive)
	if (status == nil or status == '') and player.hp > 0 then
		return get_current_idle_set()
	elseif status == 'Idle' then
		return get_current_idle_set()
	elseif status == 'Engaged' then
		return get_current_melee_set()
	elseif status == 'Resting' then
		return get_current_resting_set()
	end
end

-----------------------------------------------------------------------------------------------------------
-- Functions for constructing default sets.
-----------------------------------------------------------------------------------------------------------

-- Get the default precast gear set.
function get_default_precast_set(spell, action, spellMap, eventArgs)
	local equipSet = {}
	if spell.action_type == 'Magic' then
		equipSet = sets.precast.FC											-- Fast cast on precast

		if classes.CustomClass and equipSet[classes.CustomClass] then		equipSet = equipSet[classes.CustomClass]
		elseif equipSet[spell.english] then									equipSet = equipSet[spell.english]
		elseif spellMap and equipSet[spellMap] then							equipSet = equipSet[spellMap]
		elseif equipSet[spell.skill] then									equipSet = equipSet[spell.skill]
		elseif equipSet[spell.type] then									equipSet = equipSet[spell.type]
		end
		equipSet = incorporate_subset(equipSet, state.CastingMode)			-- Check for specialized casting modes for any given set selection.
		if sets.precast.FC[spell.element] ~= nil then
			equipSet = set_combine(equipSet, sets.precast.FC[spell.element])
		end
	elseif spell.action_type == 'Ranged Attack' then
		if player.main_job == 'RNG' then									--Equip snapshot gear & TP ammo
			equipSet = set_combine(sets.precast.ranged, {ammo=gear[state.OffenseMode..'_ammo_RA']})
			--equip(sets.precast.ranged, {ammo=gear[state.OffenseMode..'_ammo_RA']})
		else
			equipSet = sets.precast.RangedAttack
			-- Custom class modification
			if classes.CustomClass then
				equipSet = incorporate_subset(equipSet, classes.CustomClass)
			end
			equipSet = incorporate_subset(equipSet, state.RangedMode)		-- Check for specific mode for ranged attacks (eg: Acc, Att, etc)

			for _,group in ipairs(classes.CustomRangedGroups) do
				equipSet = incorporate_subset(equipSet, group)
			end
		end
	elseif spell.action_type == 'Ability' then
		if spell.type == 'JobAbility' then
			-- Generic job abilities are under sets.precast.JA, and must be named.
			equipSet = combine_if_defined(equipSet, sets.precast.JA[spell.english])
		elseif spell.type == 'WeaponSkill' then
			--sets.wsBase[sam/other][state.OffenseMode][state.RangedMode][wsmod[spell.english]]
			
			if player.main_job == 'RNG' then
				equipSet = build_equipSet(spell, 'WS')
			else
				if elemental_weaponskills[spell.english] ~= nil then
					equipSet = sets.wsBase.Magic
					if weatherPermits(spell.element) and options.useObi then
						equipSet = combine_if_available(equipSet, 'waist', gear_map.Obi[spell.element])
					end
				else
					equipSet = sets.wsBase
				end
				
				if player.sub_job == 'SAM' then
					equipSet = incorporate_subset(equipSet, 'sam')
				else
					equipSet = incorporate_subset(equipSet, 'other')
				end
				equipSet = incorporate_subset(equipSet, state.OffenseMode)
				equipSet = incorporate_subset(equipSet, wsmod[spell.english])
				equipSet = incorporate_subset(equipSet, spell.english)
				equipSet = combine_ftp_gear(equipSet, spell)
			end
		else
			-- All other ability types, such as Waltz, Jig, Scholar, etc.
			-- These may use the generic type, or be refined for the individual action, either by name or by spell map.
			if sets.precast[spell.type] then
				equipSet = sets.precast[spell.type]
				if equipSet[spell.english] then
					equipSet = equipSet[spell.english]
				elseif equipSet[spellMap] then
					equipSet = equipSet[spellMap]
				end
				if classes.CustomClass then
					equipSet = incorporate_subset(equipSet, classes.CustomClass)
				end
			elseif classes.CustomClass and sets.precast[classes.CustomClass] then
				equipSet = sets.precast[classes.CustomClass]
			elseif sets.precast[spellMap] then
				equipSet = sets.precast[spellMap]
			end
		end
	elseif spell.action_type == 'Item' then	--Ignore
	end

	return equipSet
end

-- Get the default midcast gear set.
-- This builds on sets.midcast.
function get_default_midcast_set(spell, action, spellMap, eventArgs)
	local equipSet = {}

	if spell.action_type == 'Magic' then
		equipSet = sets.midcast.FastRecast
		refresh_arts()
		
		if spell.type == 'BardSong' and player.main_job == 'BRD' then
			local songType = get_song_class(spell)													--Buff/debuff/dummy
			if songType == 'DaurdablaDummy' then
				equipSet = combine_if_defined(equipSet, sets.midcast.SongRecast)
				equipSet = combine_if_available(equipSet, 'range', 'Terpander')
			else
				local instrumentSkill = get_instrument_type(spellMap)
				equipSet = combine_if_defined(equipSet, sets.midcast.Singing)						--Equip base singing gear
				equipSet = combine_if_defined(equipSet, sets.midcast[instrumentSkill])				--Equip gear based on skill of instrument
				equipSet = combine_if_defined(equipSet, sets.midcast[songType])						--Equip gear based on buff/debuff
				equipSet = combine_if_defined(equipSet, sets.midcast[spellMap])						--Equip gear based on song
				if state.DaurdablaMode == 'Daurdabla' then
					equipSet = combine_if_available(equipSet, 'range', 'Terpander')
				else
					equipSet = combine_if_available(equipSet, 'range', gear.Instruments[spellMap])	--Equip the proper instrument
				end
			end
			state.DaurdablaMode = 'None'
		elseif spell.skill == 'Dark Magic' then
			equipSet = standard_magic_combines(equipSet, spell, spellMap, 'DarkMagic')
		elseif spell.skill == 'Healing Magic' then
			equipSet = standard_magic_combines(equipSet, spell, spellMap, 'HealingMagic')
			
			if spellMap == 'Cure' then
				if player.status == 'Engaged' then
					equipSet = combine_if_defined(equipSet, sets.midcast.Cure.Engaged)
				end
				if spell.target.type == 'SELF' then
					equipSet = combine_if_defined(equipSet, sets.midcast.Cure.Self)
				end
				if S{world.day_element , world.weather_element}:contains(spell.element) then
					equipSet = combine_if_available(equipSet, 'waist', 'Korin Obi')
				end
			end
		elseif spell.skill == 'Divine Magic' then
			equipSet = standard_magic_combines(equipSet, spell, spellMap, 'DivineMagic')
			
			if (spellMap == 'Banish' or spellMap == 'Holy') and sets.midcast.DivineMagic then
				equipSet = combine_if_defined(equipSet, sets.midcast.DivineMagic.Nuke)
			end
		elseif spell.skill == 'Elemental Magic' then
			--equipSet = standard_magic_combines(equipSet, spell, spellMap, 'ElementalMagic')
			equipSet = combine_if_defined(equipSet, sets.midcast.MagicAccuracy)
			equipSet = combine_if_defined(equipSet, sets.midcast.ElementalMagic)
	
			--TODO: Add [state.CastingMode] and High/Low tier sets
			
			if weatherPermits(spell.element) then
				if spellMap ~= 'Helix' and options.useObi then
					equipSet = combine_if_available(equipSet, 'waist', gear_map.Obi[spell.element])
				end
				if options.useTwilightCape then
					equipSet = combine_if_available(equipSet, 'back', 'Twilight Cape')
				end
				if buffactive['Klimaform'] and player.main_job == 'SCH' then
					equipSet = combine_if_available(equipSet, 'feet', "Savant's Loafers +1")
					equipSet = combine_if_available(equipSet, 'feet', "Savant's Loafers +2")
				end
			end
			equipSet = combine_if_defined(equipSet, sets.midcast.ElementalMagic[spell.element])
		elseif spell.skill == 'Enfeebling Magic' then
			equipSet = standard_magic_combines(equipSet, spell, spellMap, 'EnfeeblingMagic')
			--If the spell has variable potency, equip gear that enhances potency
			if var_potency_enfeebs[spell.english] and sets.midcast.EnfeeblingMagic then
				equipSet = combine_if_defined(equipSet, sets.midcast.EnfeeblingMagic.Potency)
				equipSet = combine_if_defined(equipSet, sets.midcast.EnfeeblingMagic.Potency[state.CastingMode])
			end
			if player.main_job == 'RDM' and buffactive['Saboteur'] then
				equipSet = combine_if_defined(equipSet, sets.precast.JA['Saboteur'])
			end			
		elseif spell.skill == 'Enhancing Magic' then
			--equipSet = standard_magic_combines(equipSet, spell, spellMap, 'EnhancingMagic')
			equipSet = combine_if_defined(equipSet, sets.midcast.EnhancingMagic)
			if sets.midcast.EnhancingMagic then
				equipSet = combine_if_defined(equipSet, sets.midcast.EnhancingMagic[spellMap])
				equipSet = combine_if_defined(equipSet, sets.midcast.EnhancingMagic[spell.english])
			end
			equipSet = combine_if_defined(equipSet, sets.midcast[spellMap])
			equipSet = combine_if_defined(equipSet, sets.midcast[spell.english])
			if sets.midcast.EnhancingMagic then
				equipSet = combine_if_defined(equipSet, sets.midcast.EnhancingMagic[state.arts])
			end

			equipSet = combine_if_defined(equipSet, sets.midcast.EnhancingMagic.Duration)
			if buffactive['Composure'] and spell.target.type ~= 'SELF' then
				equipSet = combine_if_defined(equipSet, sets.midcast.EnhancingMagic.Duration.ComposureOther)
			end
			if spell.english == 'Phalanx II' then
				equipSet = combine_if_defined(equipSet, sets.midcast['Phalanx II'])
			end
		elseif spell.skill == 'Ninjutsu' then
			if spellMap == 'Utsusemi' then
				equipSet = combine_if_defined(equipSet, sets.midcast.Utsusemi)
			elseif spellMap == 'NinEnfeeb' or spellMap == 'NinNuke' then
				equipSet = combine_if_defined(equipSet, sets.midcast.MagicAccuracy)
				if player.main_job == 'NIN' then				
					equipSet = combine_if_defined(equipSet, sets.midcast.Ninjutsu)
					if spellMap == 'NinNuke' then
						equipSet = combine_if_defined(equipSet, sets.midcast.Ninjutsu.Nuke)
						if weatherPermits(spell.element) and options.useObi then
							equipSet = combine_if_available(equipSet, 'waist', gear_map.Obi[spell.element])
						end
						equipSet = combine_if_defined(equipSet, sets.midcast.Ninjutsu.Nuke[spell.element])
					end
				end
			end
		else
			add_to_chat(122, 'Using default rule set for '..spell.english..'.')
			equipSet = sets.midcast
			
			-- Set determination ordering: Custom class > Class mapping > Specific spell name > Skill > Spell type
			if classes.CustomClass and equipSet[classes.CustomClass] then
				equipSet = equipSet[classes.CustomClass]
			elseif equipSet[spell.english] then
				equipSet = equipSet[spell.english]
			elseif spellMap and equipSet[spellMap] then
				equipSet = equipSet[spellMap]
			elseif equipSet[spell.skill] and not (classes.NoSkillSpells:contains(spell.english) or classes.NoSkillSpells:contains(spellMap)) then
				equipSet = equipSet[spell.skill]
			elseif equipSet[spell.type] then
				equipSet = equipSet[spell.type]
			end
			equipSet = incorporate_subset(equipSet, state.CastingMode)		-- Check for specialized casting modes for any given set selection.
		end
	elseif spell.action_type == 'Ranged Attack' then
		if player.main_job == 'RNG' or player.main_job == 'COR' then
			equipSet = build_equipSet(nil, 'TP')
			--equipSet = get_current_baseSet()['tp']
			--equipSet = incorporate_subset(equipSet, 'tp')
			--equipSet = set_combine(sets.tpBase, equipSet)
		else
			equipSet = sets.midcast.ranged
		end
	elseif spell.action_type == 'Ability' then
		if sets.midcast[spell.type] then
			equipSet = sets.midcast[spell.type]
			if equipSet[spell.english] then
				equipSet = equipSet[spell.english]
			elseif spellMap and equipSet[spellMap] then
				equipSet = equipSet[spellMap]
			end
			if classes.CustomClass then
				equipSet = incorporate_subset(equipSet, classes.CustomClass)
			end
		elseif classes.CustomClass and sets.midcast[classes.CustomClass] then
			equipSet = sets.midcast[classes.CustomClass]
		elseif sets.midcast[spell.english] then
			equipSet = sets.midcast[spell.english]
		elseif sets.midcast[spellMap] then
			equipSet = sets.midcast[spellMap]
		end
	elseif spell.action_type == 'Item' then
	end
	return equipSet
end

-- Get the default pet midcast gear set. This is built in sets.midcast.Pet.
function get_default_pet_midcast_set(spell, action, spellMap, eventArgs)
	local equipSet = {}
	-- Set selection ordering: Custom class > Specific spell name > Class mapping > Spell type
	if sets.midcast.Pet then
		equipSet = sets.midcast.Pet
		
		if classes.CustomClass and equipSet[classes.CustomClass] then	equipSet = equipSet[classes.CustomClass]
		elseif equipSet[spell.english] then								equipSet = equipSet[spell.english]
		elseif spellMap and equipSet[spellMap] then						equipSet = equipSet[spellMap]
		elseif equipSet[spell.type] then								equipSet = equipSet[spell.type]
		end
		equipSet = incorporate_subset(equipSet, state.CastingMode)		-- Check for specialized casting modes for any given set selection.
	end
	return equipSet
end

-- Returns the appropriate idle set based on current state.
-- Set construction order (all of which are optional): sets.idle[idleScope][state.IdleMode][Pet][CustomIdleGroups]
function get_current_idle_set()
	local idleSet = sets.idle
	local idleScope
	
	idleSet = incorporate_subset(idleSet, state.OffenseMode)
	
	if buffactive.weakness then						idleScope = 'Weak'
	elseif areas.Cities:contains(world.area) then	idleScope = 'Town'
	else											idleScope = 'Field'
	end
	idleSet = incorporate_subset(idleSet, idleScope)
	
	if (pet.isvalid or state.Buff.Pet) and idleSet.Pet then
		idleSet = idleSet.Pet
		
		if pet.status == 'Engaged' and idleSet.Engaged then
			idleSet = idleSet.Engaged
		end
	end

	for _,group in ipairs(classes.CustomIdleGroups) do
		idleSet = incorporate_subset(idleSet, group)
	end
	idleSet = apply_defense(idleSet)
	idleSet = apply_kiting(idleSet)

	if buffactive['Sublimation: Activated'] then
		idleSet = combine_if_defined(idleSet, sets.idle.sublimation)
	end
	if player.mpp < 80 then
		idleSet = combine_if_defined(idleSet, sets.idle.lowMP)
		if (world.time >= (18*60) or world.time <= (6*60)) then
			idleSet = combine_if_defined(idleSet, sets.idle.lowMP_night)
		else
			idleSet = combine_if_defined(idleSet, sets.idle.lowMP_day)
		end
	end
	
	idleSet = combine_if_defined(idleSet, sets.idle[state.IdleMode])	--Apply movement speed+ last
	
	if customize_idle_set then
		idleSet = customize_idle_set(idleSet)
	end
	return idleSet
end


-- Returns the appropriate melee set based on current state.
-- Set construction order (all sets after sets.engaged are optional):
--   sets.engaged[state.CombatForm][state.CombatWeapon][state.OffenseMode][state.DefenseMode][classes.CustomMeleeGroups (any number)]
function get_current_melee_set()
	local meleeSet = sets.engaged
	
	if state.CombatForm and meleeSet[state.CombatForm] then
		meleeSet = meleeSet[state.CombatForm]
	end
	if state.CombatWeapon and meleeSet[state.CombatWeapon] then
		meleeSet = meleeSet[state.CombatWeapon]
	end
	meleeSet = incorporate_subset(meleeSet, state.OffenseMode)
	--meleeSet = set_combine(meleeSet, meleeSet[state.OffenseMode][state.AccuracyMode])
	meleeSet = incorporate_subset(meleeSet, state.AccuracyMode)
	meleeSet = incorporate_subset(meleeSet, state.DefenseMode)

	for _,group in ipairs(classes.CustomMeleeGroups) do
		meleeSet = incorporate_subset(meleeSet, group)
	end
	meleeSet = apply_defense(meleeSet)
	meleeSet = apply_kiting(meleeSet)

	if customize_melee_set then
		meleeSet = customize_melee_set(meleeSet)
	end
	return meleeSet
end


-- Returns the appropriate resting set based on current state.
function get_current_resting_set()
	local restingSet = {}
	if sets.resting[state.RestingMode] then
		restingSet = sets.resting[state.RestingMode]
	else
		restingSet = sets.resting
	end
	return restingSet
end

-----------------------------------------------------------------------------------------------------------
-- Functions for optional supplemental gear overriding the default sets defined above.
-----------------------------------------------------------------------------------------------------------

-- Function to apply any active defense set on top of the supplied set
-- @param baseSet: The set that any currently active defense set will be applied on top of. (gear set table)
function apply_defense(baseSet)
	if state.Defense.Active then
		local defenseSet
		local defMode

		if state.Defense.Type == 'Physical' then
			defMode = state.Defense.PhysicalMode

			if sets.defense[state.Defense.PhysicalMode] then
				defenseSet = sets.defense[state.Defense.PhysicalMode]
			else
				defenseSet = sets.defense
			end
		else
			defMode = state.Defense.MagicalMode

			if sets.defense[state.Defense.MagicalMode] then
				defenseSet = sets.defense[state.Defense.MagicalMode]
			else
				defenseSet = sets.defense
			end
		end

		for _,group in ipairs(classes.CustomDefenseGroups) do
			defenseSet = incorporate_subset(defenseSet, group)
		end
		baseSet = set_combine(baseSet, defenseSet)
	end
	return baseSet
end


-- Function to add kiting gear on top of the base set if kiting state is true.
-- @param baseSet : The gear set that the kiting gear will be applied on top of.
function apply_kiting(baseSet)
	if state.Kiting then
		if sets.Kiting then
			baseSet = set_combine(baseSet, sets.Kiting)
		end
	end
	return baseSet
end