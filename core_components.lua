--==============================================================================
--[[
	Author: Ragnarok.Lorand
	GearSwap core components
--]]
--==============================================================================

function init()
	_libs = _libs or {}
	_libs.lists = _libs.lists or require('lists')
	res = res or gearswap.res
	
	include('packet_handling')	--Required for haste tier detection
	chars = require('chat/chars')	--Required for using special characters in delayed messages
	slips = require('slips')	--Required for notifying which items need to be fetched from the porter moogle
	winraw = gearswap._G.windower	--Required for direct access to windower functions
	winraw.register_event('incoming chunk', parse_buff_info)
	
	include('utility_functions')	--Load utility_functions.lua (defines misc functions)
	include('defaults')		--Load defaults.lua
	define_defaults()		--Define some default sets & set up variable modes
	
	include('set_operations')	--Load set_operations.lua (advanced set combination functions)
	include('spell_utilities')	--Load spell_utilities.lua (cure & timer handling)
	include('pet_utilities')	--Load pet_utilities.lua (pet handling)
	include('mappings')		--Load mappings.lua (provides generalizations for spells and abilities)
	
	info = require('../info/info_share')	--Load addons\info\info_shared.lua for functions to print information accessed directly from windower
	
	-- Load gear from a job-specific file
	if load_user_gear(player.main_job) then
		if init_gear_sets then init_gear_sets() end
		process_slip_gear()
	end
	
	load_user_settings()		--Attempt to load user settings
	if use_user_settings then
		use_user_settings()	--Use the loaded settings
	else
		echo('WARNING: settings_'..player.name..'.lua not found.')
	end
end

init()	--Execute init()

--==============================================================================
--			Spell / Ability Handling
--==============================================================================

--[[
	Called when an action has been flagged as not possible to perform.
--]]
function filtered_action(spell)
	local tname = (spell.target.type == 'MONSTER') and '<t>' or spell.target.name
	if gearswap.addendum_white[spell.id] and (not buff_active('Addendum: White')) then
		cancel_spell()
		if stratagems_available() then
			windower.send_command('gs c scholar light; wait 1.75; input /ma "'..spell.en..'" '..tname)
		else
			atc(122, "Cancelled "..spell.en..".  Addendum: White is required, but there are no available stratagems.")
		end
	elseif gearswap.addendum_black[spell.id] and (not buff_active('Addendum: Black'))then
		cancel_spell()
		if stratagems_available() then
			windower.send_command('gs c scholar dark; wait 1.75; input /ma "'..spell.en..'" '..tname)
		else
			atc(122, "Cancelled "..spell.en..".  Addendum: Black is required, but there are no available stratagems.")
		end
	else
		atc(166, '[Unhandled] Unable to perform filtered action: '..spell.english)
	end
end

--[[
	Called when GearSwap intercepts the original text input, but before the
	game has done any processing on it. In particular, it hasn't initiated
	target selection for <st*> target types.
--]]
function pretarget(spell)
	if (spell.target == nil) then return end
	if S{'PLAYER', 'SELF'}:contains(spell.target.type) and debuff_to_na[spell.en] then
		local tname = spell.target.name
		if (spell.target.name == player.name) then
			local ptarg = windower.ffxi.get_mob_by_target()
			if (ptarg ~= nil) and (ptarg.name ~= player.name) and (ptarg.in_alliance or not ptarg.is_npc) then
				tname = '<t>'
			end
		end
		windower.send_command('input /ma "'..debuff_to_na[spell.en]..'" '..tname)
	elseif (spell.en == 'Phalanx') and (spell.target.type == 'PLAYER') and (spell.target.type ~= 'SELF') then
		windower.send_command('input /ma "Phalanx II" '..spell.target.name)
	else
		return
	end
	cancel_spell()
end

--[[
	Called after the text command has been processed (and target selected),
	but before the packet gets pushed out.  Equip any gear that should be
	on before the spell or ability is used.
--]]
function precast(spell)
	if (spell.type == 'Trust') then
		return
	elseif modify_spell(spell) or modify_cure(spell) or not_possible_to_use(spell) then
		cancel_spell()
		return
	end
	
	local notOverwritable = S{'Stoneskin', 'Sneak', 'Spectral Jig'}
	if notOverwritable:contains(spell.en) and (spell.target.name == player.name) then
		if (spell.en == 'Spectral Jig') then
			windower.send_command('cancel Sneak')
		else
			windower.send_command('wait 0.5; cancel '..spell.en)
		end
	end
	
	--Perform checks prior to execution of the command
	if (player.main_job == 'BRD') and (spell.type == 'BardSong') then
		atc(122, 'Casting '..spell.en..' in mode: '..modes.Daurdabla)
		-- Auto-Pianissimo
		if (spell.target.type == 'PLAYER') and (not spell.target.charmed) and (not buff_active('Pianissimo')) then
			cancel_spell()
			windower.send_command('input /ja "Pianissimo" <me>; wait 1.25; input /ma "'..spell.en..'" '..spell.target.name)
			return
		end
	elseif S{'RNG','COR'}:contains(player.main_job) then
		local check_ammo
		--Choose which ammo should be verified
		if (spell.type == 'WeaponSkill') and bow_gun_weaponskills:contains(spell.en) then
			check_ammo = gear[modes.offense..'_ammo_WS']
		elseif (spell.action_type == 'Ranged Attack') then
			check_ammo = gear[modes.offense..'_ammo_RA']
		end
		
		if check_ammo then		--Verify that ammunition is available
			if (not player.inventory[check_ammo]) then
				atc(104, 'No ammo available for that action.')
				cancel_spell()
				return
			end
			if (player.inventory[check_ammo].count <= options.ammo_warning_limit) and
			   (player.inventory[check_ammo].count > 1) and (not state.warned) then
				atc(104, '******************************')
				atc(104, '*****  LOW AMMO WARNING  *****')
				atc(104, '******************************')
				state.warned = true
			elseif (player.inventory[check_ammo].count > options.ammo_warning_limit) and state.warned then
				state.warned = false
			end
		end
	end
	
	if weapSwapJobs:contains(player.main_job) then
		if noWeapSwapSets:contains(modes.offense) then
			disable('main', 'sub')
		else
			enable('main', 'sub')
		end
	end
	equip(get_precast_set(spell))
end

--[[
	Builds midcast set immediately after precast() call.
	Both sets are sent simultaneously; the packet contains precastgear:action:midcastgear.
	It should take effect regardless of the spell cast speed.
--]]
function midcast(spell)
	if (spell.type == 'Trust') then
		return
	elseif (spell.en == 'Utsusemi: Ichi') and (not spell.interrupted) then
		windower.send_command('wait 2; cancel 66; cancel 446')
	end
	equip(get_midcast_set(spell))
end

--[[
	Called upon action completion (i.e., casting finished, ws landed, casting interrupted, etc)
--]]
function aftercast(spell)
	if modes.noIdle then
		atc(104, 'WARNING: Did not equip idle set (modes.noIdle is ON)')
		return
	elseif (spell.en == 'Unknown Interrupt') then
		return
	elseif spell.interrupted then
		-- Delay update so aftercast equip will actually be worn.
		windower.send_command('wait 0.6;gs c update')
	else
		local spellMap = spell_maps[spell.en]
		initSleepTimer(spell, spellMap)	--Does nothing if not a sleep spell
		if (player.main_job == 'BLM') and (spell.en == 'Mana Wall') then
			if (player.equipment.feet == 'Goetia Sabots +2') then
				disable('feet')
			end
		elseif (player.main_job == 'BRD') and (spell.type == 'BardSong') then
			if spell.target and (spell.target.type:upper() == 'SELF') then
				adjust_Timers(spell, spellMap)
			end
		end
		equip(get_gear_for_status(player.status))
	end
end

--==============================================================================
--			Event Reactions
--==============================================================================

--[[
	Called when the player's status changes.
	(Idle / Engaged / Dead / Engaged dead / Event / Chocobo / Resting / 
	Locked / Crafting / Sitting / Kneeling / Fishing*)
--]]
function status_change(new, old)
	update()
end

--[[
	Called when the player gains or loses a buff.
--]]
function buff_change(buff, gain)
	if sets.buffs[buff] ~= nil then
		if gain then
			equip(sets.buffs[buff])
			for slot,_ in pairs(sets.buffs[buff]) do
				disable(slot)
			end
		else
			for slot,_ in pairs(sets.buffs[buff]) do
				enable(slot)
			end
		end
	end
	
	if (buff:lower() == 'march') and (not gain) then			--March wore off
		if (buffactive['march'] ~= nil) then				--There's still an active March
			if (buffs.March1 ~= nil) and (buffs.March2 ~= nil) then	--Both Marches were active
				if (buffs.March1 < buffs.March2) then		--March1 was cast before March2
					buffs.March1 = nil			--March1 wore off
				else						--March2 was cast before March1
					buffs.March2 = nil			--March2 wore off
				end
			elseif (buffs.March1 ~= nil) then			--March1 was active
				buffs.March1 = nil				--March1 wore off
			else							--March2 was active
				buffs.March2 = nil				--March2 wore off
			end
		else								--There are no active March buffs
			buffs.March1 = nil					--March1 wore off
			buffs.March2 = nil					--March2 wore off
		end
	elseif (buff:lower() == 'sleep') and gain and buff_active('Stoneskin') then
		--TODO: Account for active DoT spells on self
		if buff_active('Sublimation: Activated') then
			windower.send_command('cancel stoneskin')
		end
	elseif (player.main_job == 'BLM') and (buff == 'Mana Wall') and (not gain) then
		enable('feet')		-- Unlock feet when Mana Wall buff is lost.
		equip(get_gear_for_status(player.status))
	elseif buff == 'Sublimation: Complete' and gain then
		atc(204, 'Sublimation is done charging!')
	end
	
	if (buff:lower() == 'weakness') then
		if gain then	send_command('timers create "Weakness" 300 up abilities/00255.png')
		else		send_command('timers delete "Weakness"')
		end
	elseif (S{'haste','march','sublimation: activated'}:contains(buff:lower())) then
		if not (modes.noIdle) then
			update()
		end
	end
end

--[[
	Called when the player's main job changes.
--]]
function main_job_change(new, old)
	use_user_settings()
end

--[[
	Called when the player's sub job changes.
--]]
function sub_job_change(new, old)
	use_user_settings()
end

--------------------------------------------------------------------------------
--	Gear set building functions
--------------------------------------------------------------------------------

function get_sub_type()
	return (player.sub_job == 'SAM') and 'sam' or 'other'
end

--[[
	Assembles the precast set for the given spell/ability.
--]]
function get_precast_set(spell)
	local precastSet = {}
	local status = player.status:lower()
	local spellMap = spell_maps[spell.en]
	
	if spell.action_type == 'Magic' then
		precastSet = combineSets(precastSet, sets.precast.FC)
		precastSet = combineSets(precastSet, sets.precast.FC, spell.type)
		precastSet = combineSets(precastSet, sets.precast.FC, spell.skill:stripchars(' '))
		precastSet = combineSets(precastSet, sets.precast.FC, spell.element)
		precastSet = combineSets(precastSet, sets.precast.FC, spellMap)
		precastSet = combineSets(precastSet, sets.precast.FC, spell.en)
		precastSet = combineSets(precastSet, sets.precast.FC, modes.casting)
		precastSet = combineSets(precastSet, sets.precast.FC, status)
	elseif spell.action_type == 'Ranged Attack' then
		--Equip snapshot gear & TP ammo
		precastSet = combineSets(sets.precast.ranged, {ammo=gear[modes.offense..'_ammo_RA']})
	elseif spell.action_type == 'Ability' then
		if spell.type == 'JobAbility' then
			precastSet = combineSets(precastSet, sets.precast.JA, spell.en)
		elseif spell.type == 'WeaponSkill' then
			--sets.wsBase[sam/other][modes.offense][state.RangedMode][wsmod[spell.english]]
			if S{'RNG', 'COR'}:contains(player.main_job) then
				precastSet = combineSets(precastSet, sets[modes.offense])
				precastSet = combineSets(precastSet, sets[modes.offense], get_sub_type())
				precastSet = combineSets(precastSet, sets[modes.offense], get_sub_type(), modes.ranged)
				precastSet = combineSets(precastSet, sets[modes.offense], get_sub_type(), modes.ranged, 'ws')
				precastSet = combineSets(precastSet, {ammo=gear[modes.offense..'_ammo_WS']})
				
				local wsSet = sets.wsBase
				wsSet = combineSets(wsSet, sets.wsBase, wsmod[spell.en])
				wsSet = combineSets(wsSet, sets.wsBase, wsmod[spell.en], spell.en)
				wsSet = combineSets(wsSet, get_ftp_set(spell))
				
				precastSet = combineSets(wsSet, precastSet)
			else
				if (elemental_weaponskills[spell.english] ~= nil) then
					precastSet = sets.wsBase.Magic
					if weatherPermits(spell.element) and options.useObi then
						precastSet = combineSets(precastSet, {waist=getObi(spell.element)})
					end
				else
					precastSet = sets.wsBase
				end
				precastSet = combineSets(precastSet, sets.wsBase, get_sub_type())
				precastSet = combineSets(precastSet, sets.wsBase, get_sub_type(), modes.offense)
				precastSet = combineSets(precastSet, sets.wsBase, get_sub_type(), modes.offense, wsmod[spell.en])
				precastSet = combineSets(precastSet, sets.wsBase, get_sub_type(), modes.offense, wsmod[spell.en], spell.en)
				precastSet = combineSets(precastSet, get_ftp_set(spell))
				
				for buff,_ in pairs(buffactive) do
					precastSet = combineSets(precastSet, sets.ws, 'with_buff', buff)
				end
			end
		else
			-- All other ability types, such as Waltz, Jig, Scholar, etc.
			-- These may use the generic type, or be refined for the individual action, either by name or by spell map.
			precastSet = combineSets(precastSet, sets.precast, spell.type)
			precastSet = combineSets(precastSet, sets.precast, spellMap)
			precastSet = combineSets(precastSet, sets.precast, spell.en)
		end
	end
	
	if (player.main_job == 'SCH') then
		if matchesGrimoire(spell) then
			precastSet = combineSets(precastSet, sets.precast.FC.Grimoire)		--FastCast/Haste +8%
		end
		if buff_active('Celerity','Alacrity') then
			if buff_active(elements.storm_of[spell.element]) or (spell.element == world.weather_element) then
				precastSet = combineSets(precastSet, sets.precast.FC.Weather)	--FastCast/Haste +15%
			end
		end
	elseif (player.main_job == 'THF') and (modes.treasure == 'TH') then
		precastSet = combineSets(precastSet, sets.TreasureHunter)
	end

	if (spell.en == 'Impact') then
		precastSet = combineSets(precastSet, {body='Twilight Cloak'})
		precastSet.head = nil
	end
	return precastSet
end

function get_standard_magic_set(baseSet, spell, spellMap, spellType)
	local castSet = {}
	castSet = combineSets(castSet, baseSet)
	castSet = combineSets(castSet, sets.midcast.MagicAccuracy)
	castSet = combineSets(castSet, sets.midcast, spellType)
	castSet = combineSets(castSet, sets.midcast, spellType, modes.casting)
	castSet = combineSets(castSet, sets.midcast, spellType, getGrimoire())
	castSet = combineSets(castSet, sets.midcast, spellType, getGrimoire(), modes.casting)
	castSet = combineSets(castSet, sets.midcast, spellType, spellMap)
	castSet = combineSets(castSet, sets.midcast, spellType, spellMap, modes.casting)
	castSet = combineSets(castSet, sets.midcast, spellType, spell.en)
	castSet = combineSets(castSet, sets.midcast, spellType, spell.en, modes.casting)
	castSet = combineSets(castSet, sets.midcast, spellMap)
	castSet = combineSets(castSet, sets.midcast, spellMap, modes.casting)
	castSet = combineSets(castSet, sets.midcast, spell.en)
	castSet = combineSets(castSet, sets.midcast, spell.en, modes.casting)
	return castSet
end

--[[
	Assembles the midcast set for the given spell/ability.
--]]
function get_midcast_set(spell)
	local midcastSet = {}
	local status = player.status:lower()
	local targType = spell.target.type:lower()
	local spellMap = spell_maps[spell.en]
	
	if spell.action_type == 'Magic' then
		--The base layer of gear for all spells in midcast is a set to reduce recast delay
		midcastSet = combineSets(midcastSet, sets.midcast.FastRecast)
		
		if spell.type == 'BardSong' and player.main_job == 'BRD' then
			--Determine the type of song being cast via spell_utilities.lua.get_song_class(spell)
			--Valid types include SongDebuff, DaurdablaDummy, and SongBuff
			local songType = get_song_class(spell)
			
			if songType == 'DaurdablaDummy' then
				--Equip Daudabla/Terpander and gear that reduces recast time but does not enhance buff duration
				midcastSet = combineSets(midcastSet, sets.midcast.SongRecast)
				midcastSet = combineSets(midcastSet, {range=gear.instruments.multiSong})
			else
				--Determine the instrument that will be used to cast the song
				local activeInstrument = gear.instruments.default
				if modes.Daurdabla == 'Daurdabla' then
					--It is assumed that Daurdabla/Terpander is in the player's inventory if they are using this mode
					activeInstrument = gear.instruments.multiSong
				elseif (gear.instruments[spellMap] ~= nil) and isAvailable(gear.instruments[spellMap]) then
					--If the instrument that should be used is not defined or not in inventory, this falls back on the default instrument
					activeInstrument = gear.instruments[spellMap]
				end
				
				--Determine the skill used by the instrument that will be used to cast the song via spell_utilities.lua.get_instrument_type(i)
				--The mapping of skill to instrument is done in mappings.lua, and the instruments that should be used for each song should be
				--defined in Playername_BRD_gear.lua
				local instrumentSkill = get_instrument_type(activeInstrument)
				if S{'Threnody','Requiem','Lullaby','Elegy','Finale','Nocturne'}:contains(spellMap) then
					midcastSet = combineSets(midcastSet, sets.midcast.MagicAccuracy)
				else
					--Layer on skill gear for singing, then for the type of instrument being used to cast the song.
					midcastSet = combineSets(midcastSet, sets.midcast.Singing)					--Equip base singing gear
					midcastSet = combineSets(midcastSet, sets.midcast, instrumentSkill)				--Equip gear based on skill of instrument
				end
				--Layer on magic accuracy or duration enhancing gear based on the type of song being cast
				if not S{'Finale'}:contains(spellMap) then
					midcastSet = combineSets(midcastSet, sets.midcast, songType)					--Equip gear based on buff/debuff
					midcastSet = combineSets(midcastSet, sets.midcast, songType, modes.casting)					
					if buff_active('Troubadour') then
						midcastSet = combineSets(midcastSet, sets.midcast.SongDuration)
					end
				end
				--Layer on gear that directly enhances the song being cast
				midcastSet = combineSets(midcastSet, sets.midcast, spellMap)						--Equip gear based on song
				midcastSet = combineSets(midcastSet, sets.midcast, spellMap, modes.casting)
				
				--Finally, layer on the instrument that will be used.
				midcastSet = combineSets(midcastSet, {range=activeInstrument})
			end
			--Automatically disables Daurdabla mode so that the user doesn't have to after casting a song in that mode
			modes.Daurdabla = 'None'
		elseif spell.skill == 'Dark Magic' then
			midcastSet = get_standard_magic_set(midcastSet, spell, spellMap, 'DarkMagic')
		elseif spell.skill == 'Healing Magic' then
			midcastSet = get_standard_magic_set(midcastSet, spell, spellMap, 'HealingMagic')
			midcastSet = combineSets(midcastSet, sets.midcast.spellMap, status)
			midcastSet = combineSets(midcastSet, sets.midcast.spellMap, targType)
			if (spellMap == 'Cure') then
				if weatherPermits(spell.element)then			
					midcastSet = combineSets(midcastSet, {waist=getObi(spell.element)})
				end
				for buff,_ in pairs(buffactive) do
					midcastSet = combineSets(midcastSet, sets.midcast.Cure, 'with_buff', buff)
				end
			end
		elseif spell.skill == 'Divine Magic' then
			midcastSet = get_standard_magic_set(midcastSet, spell, spellMap, 'DivineMagic')
			if S{'Banish', 'Holy'}:contains(spellMap) then
				midcastSet = combineSets(midcastSet, sets.midcast.DivineMagic.Nuke)
				if weatherPermits(spell.element) and options.useObi then
					midcastSet = combineSets(midcastSet, {waist=getObi(spell.element)})
				end
				for buff,_ in pairs(buffactive) do
					midcastSet = combineSets(midcastSet, sets.midcast.DivineMagic, 'with_buff', buff)
				end
			end
			midcastSet = combineSets(midcastSet, sets.midcast.DivineMagic, modes.casting)
		elseif spell.skill == 'Elemental Magic' then
			midcastSet = get_standard_magic_set(midcastSet, spell, spellMap, 'ElementalMagic')
			--TODO: Add High/Low tier sets
			
			if weatherPermits(spell.element) then
				if spellMap ~= 'Helix' and options.useObi then
					midcastSet = combineSets(midcastSet, {waist=getObi(spell.element)})
				end
				if options.useTwilightCape then
					midcastSet = combineSets(midcastSet, {back='Twilight Cape'})
				end
				if buff_active('Klimaform') and player.main_job == 'SCH' then
					midcastSet = combineSets(midcastSet, {feet={"Savant's Loafers +2", "Savant's Loafers +1"}})
				end
			end
			midcastSet = combineSets(midcastSet, sets.midcast.ElementalMagic, spell.element)
			midcastSet = combineSets(midcastSet, sets.midcast.ElementalMagic, modes.casting)
			
			for buff,_ in pairs(buffactive) do
				midcastSet = combineSets(midcastSet, sets.midcast.ElementalMagic, 'with_buff', buff)
			end
		elseif spell.skill == 'Enfeebling Magic' then
			midcastSet = get_standard_magic_set(midcastSet, spell, spellMap, 'EnfeeblingMagic')
		
			--If the spell has variable potency, equip gear that enhances potency
			if var_potency_enfeebs[spell.english] and sets.midcast.EnfeeblingMagic then
				midcastSet = combineSets(midcastSet, sets.midcast.EnfeeblingMagic, 'Potency')
				midcastSet = combineSets(midcastSet, sets.midcast.EnfeeblingMagic, 'Potency', modes.casting)
			end
			if player.main_job == 'RDM' and buff_active('Saboteur') then
				midcastSet = combineSets(midcastSet, sets.precast.JA, 'Saboteur')
			end
			midcastSet = combineSets(midcastSet, sets.midcast.EnfeeblingMagic, modes.casting)
		elseif spell.skill == 'Enhancing Magic' then
			midcastSet = combineSets(midcastSet, sets.midcast.EnhancingMagic)
			midcastSet = combineSets(midcastSet, sets.midcast.EnhancingMagic, getGrimoire())
			midcastSet = combineSets(midcastSet, sets.midcast.EnhancingMagic.Duration)
			midcastSet = combineSets(midcastSet, sets.midcast.EnhancingMagic, spellMap)
			midcastSet = combineSets(midcastSet, sets.midcast.EnhancingMagic, spell.en)
			midcastSet = combineSets(midcastSet, sets.midcast, spellMap)
			midcastSet = combineSets(midcastSet, sets.midcast, spell.en)
			
			if buff_active('Composure') and spell.target.type ~= 'SELF' then
				midcastSet = combineSets(midcastSet, sets.midcast.EnhancingMagic.Duration.ComposureOther)
			end
			if spell.en == 'Phalanx II' then
				midcastSet = combineSets(midcastSet, sets.midcast, spell.en)
			end
		elseif spell.skill == 'Blue Magic' then
			local bluType = (spell.element == -1) and 'Physical' or 'Magic'
			if bluType == 'Magic' then
				if (blu_typemap[spell.en] == 'Breath') then
					midcastSet = combineSets(midcastSet, sets.midcast.MagicAccuracy)
					midcastSet = combineSets(midcastSet, sets.midcast.BlueMagic)
					midcastSet = combineSets(midcastSet, sets.midcast.BlueMagic.Magic)
					midcastSet = combineSets(midcastSet, sets.midcast.BlueMagic.Breath)
				elseif (blu_typemap[spell.en] == 'Buff') then
					midcastSet = combineSets(midcastSet, sets.midcast.FastRecast)
					midcastSet = combineSets(midcastSet, sets.midcast.BlueMagic)
				elseif (blu_typemap[spell.en] == 'Enfeeb') then
					midcastSet = combineSets(midcastSet, sets.midcast.MagicAccuracy)
					midcastSet = combineSets(midcastSet, sets.midcast.BlueMagic)
				elseif (blu_typemap[spell.en] == 'Heal') then
					midcastSet = combineSets(midcastSet, sets.midcast.Cure)
				else
					midcastSet = combineSets(midcastSet, sets.midcast.MagicAccuracy)
					midcastSet = combineSets(midcastSet, sets.midcast.BlueMagic)
					midcastSet = combineSets(midcastSet, sets.midcast.BlueMagic.Magic)
				end
			elseif bluType == 'Physical' then
				midcastSet = combineSets(midcastSet, sets.midcast.BlueMagic)
				midcastSet = combineSets(midcastSet, sets.midcast.BlueMagic.Physical)
				midcastSet = combineSets(midcastSet, sets.midcast.BlueMagic.Physical[blu_statmap[spell.en]])
			end
		elseif spell.skill == 'Ninjutsu' then
			if spellMap == 'Utsusemi' then
				midcastSet = combineSets(midcastSet, sets.midcast.Utsusemi)
			elseif spellMap == 'NinEnfeeb' or spellMap == 'NinNuke' then
				midcastSet = combineSets(midcastSet, sets.midcast.MagicAccuracy)
				midcastSet = combineSets(midcastSet, sets.midcast.Ninjutsu)
				if spellMap == 'NinNuke' then
					midcastSet = combineSets(midcastSet, sets.midcast, 'Ninjutsu', 'Nuke')
					if weatherPermits(spell.element) and options.useObi then
						midcastSet = combineSets(midcastSet, {waist=getObi(spell.element)})
					end
					midcastSet = combineSets(midcastSet, sets.midcast, 'Ninjutsu', 'Nuke', spell.element)
					
					for buff,_ in pairs(buffactive) do
						midcastSet = combineSets(midcastSet, sets.midcast.Ninjutsu.Nuke, 'with_buff', buff)
					end
				end
			end
		elseif spell.skill == 'Summoning Magic' then
			--Precast set is fine here
		elseif spell.skill == 'Geomancy' then
			midcastSet = combineSets(midcastSet, sets.midcast.Geomancy)
			if spell.en:startswith('Indi-') then
				midcastSet = combineSets(midcastSet, sets.midcast.Geomancy, 'Indi')
			elseif spell.en:startswith('Geo-') then
				midcastSet = combineSets(midcastSet, sets.midcast.Geomancy, 'Geo')
			else
				atc(123,'Error: Unknown Geomancy spell type')
			end
		else
			atc(122, 'Using default rule set for '..spell.english..' [skill: '..spell.skill..'][type: '..spell.type..'][action type: '..spell.action_type..']')
			midcastSet = combineSets(midcastSet, sets.midcast)
			midcastSet = combineSets(midcastSet, sets.midcast, spell.type)
			midcastSet = combineSets(midcastSet, sets.midcast, spell.skill)
			midcastSet = combineSets(midcastSet, sets.midcast, spellMap)
			midcastSet = combineSets(midcastSet, sets.midcast, spell.en)
		end
	elseif spell.action_type == 'Ranged Attack' then
		if S{'RNG', 'COR'}:contains(player.main_job) then
			if buff_active('Barrage') then
				midcastSet = combineSets(midcastSet, sets.ranged.barrage)
			else
				midcastSet = combineSets(midcastSet, sets[modes.offense])
				midcastSet = combineSets(midcastSet, sets[modes.offense], get_sub_type())
				midcastSet = combineSets(midcastSet, sets[modes.offense], get_sub_type(), modes.ranged)
				midcastSet = combineSets(midcastSet, sets[modes.offense], get_sub_type(), modes.ranged, 'tp')
				midcastSet = combineSets(midcastSet, {ammo=gear[modes.offense..'_ammo_WS']})
				midcastSet = combineSets(sets.tpBase, midcastSet)
			end
		else
			midcastSet = sets.midcast.ranged
			midcastSet = combineSets(midcastSet, sets.midcast.ranged, modes.ranged)
		end
	elseif spell.action_type == 'Ability' then
		midcastSet = combineSets(midcastSet, sets.midcast, spell.type)
		midcastSet = combineSets(midcastSet, sets.midcast, spell.type, spellMap)
		midcastSet = combineSets(midcastSet, sets.midcast, spell.type, spell.en)
		midcastSet = combineSets(midcastSet, sets.midcast, spellMap)
		midcastSet = combineSets(midcastSet, sets.midcast, spell.en)
	end
	
	if (player.main_job == 'THF') and (modes.treasure == 'TH') then
		midcastSet = combineSets(midcastSet, sets.TreasureHunter)
	elseif (spell.en == 'Impact') then
		midcastSet = combineSets(midcastSet, {body='Twilight Cloak'})
		midcastSet.head = nil
	end
	return midcastSet
end

--[[
	Returns the gear set for the given status
--]]
function get_gear_for_status(status)
	if player.main_job == 'THF' then
		local thfSet = {}
		if buff_active('Sneak Attack') then
			thfSet = combineSets(thfSet, sets.precast.JA['Sneak Attack'])
		elseif buff_active('Trick Attack') then
			thfSet = combineSets(thfSet, sets.precast.JA['Trick Attack'])
		end
		if modes.treasure == 'TH' then
			thfSet = combineSets(thfSet, sets.TreasureHunter)
		end
	end
	
	-- If status not defined, treat as idle.  Asserts that HP is positive (i.e., alive)
	if (status == nil or status == '') and player.hp > 0 then
		return get_idle_set()
	elseif status == 'Idle' then
		return get_idle_set()
	elseif status == 'Engaged' then
		return get_melee_set()
	elseif status == 'Resting' then
		return get_resting_set()
	end
end

--[[
	Assembles the player's idle set with an optional baseSet.
--]]
function get_idle_set(baseSet)
	local idleSet = combineSets(baseSet, sets.idle)	
	idleSet = combineSets(idleSet, sets.idle[modes.offense])
	idleSet = combineSets(idleSet, sets.idle[modes.defense])
	
	if player.mpp < 80 then
		idleSet = combineSets(idleSet, sets.idle.lowMP)
		if (world.time >= (18*60) or world.time <= (6*60)) then
			idleSet = combineSets(idleSet, sets.idle.lowMP_night)
		else
			idleSet = combineSets(idleSet, sets.idle.lowMP_day)
		end
	end
	idleSet = combineSets(idleSet, sets.idle[modes.idle])
	
	if (world.time >= (17*60) or world.time <= (6*60)) then
		idleSet = combineSets(idleSet, sets.idle.night)
	else
		idleSet = combineSets(idleSet, sets.idle.day)
	end
	
	if player.main_job == 'RNG' then
		local rngSet = {}
		rngSet = combineSets(rngSet, sets[modes.offense])
		rngSet = combineSets(rngSet, sets[modes.offense], get_sub_type())
		rngSet = combineSets(rngSet, sets[modes.offense], get_sub_type(), state.RangedMode)
		idleSet = combineSets(idleSet, rngSet)
	elseif player.main_job == 'THF' then
		if modes.treasure == 'TH' then
			idleSet = combineSets(idleSet, sets.TreasureHunter)
		end
	elseif pet.isvalid then
		idleSet = combineSets(idleSet, sets.idle.with_pet, get_pet_type())
		if S{player.main_job,player.sub_job}:contains('SMN') then
			idleSet = combineSets(idleSet, sets.idle.with_pet, 'perp'..tostring(get_perp_cost()))
		end
		idleSet = combineSets(idleSet, sets.idle.with_pet, pet.name)
		
		if S{player.main_job,player.sub_job}:contains('SMN') and buff_active("Avatar's Favor") then
			idleSet = combineSets(idleSet, sets.idle.with_favor)
		end
	end
	
	for buff,_ in pairs(buffactive) do
		idleSet = combineSets(idleSet, sets.idle, 'with_buff', buff)
	end
	
	if (modes.defense ~= nil) or (modes.defense ~= 'normal') then
		idleSet = combineSets(idleSet, sets.defense[modes.defense])
	end
	
	return idleSet
end

--[[
	Calculates the sum of active Haste effects.
	Return values:
	na  : 0%
	I   : 5% - 19%
	I+  : 20% - 28%
	II  : 29% - 35%
	II+ : 36%+
--]]
function get_haste_mod()
	buffs = buffs or {}
	--Equipment haste caps at 25% (256/1024)
	
	--Magic haste caps at 43.75% (448/1024)
	local msum = 0
	if (buffs.Refueling ~= nil) then
		msum = msum + 10
	elseif (buffactive[33] ~= nil) then
		local htier = buffs.Haste or 1	--Haste: 150/1024 = 15%
		msum = msum + (htier * 15)	--Haste II: 307/1024 = 30%
	end
	if (buffactive[580] ~= nil) then
		msum = msum + 30		--Indi/Geo-Haste: 28% + ~1%/+1 Geomancy
	end
	if (buff_active('March')) then
		--If a BRD doesn't have at least March+3, they REALLY suck.
		--Each March+1 = +16/1024 haste & duration
		local marchCount = buffactive['march'] or 0
		if (marchCount > 1) then
			msum = msum + 25	--11+14 = 25%
		elseif (buffs.March2 ~= nil) then
			msum = msum + 14	--96+48/1024 = 14%
		else
			msum = msum + 11	--64+48/1024 = 11%
		end
	end
	if (buffactive[228]) then
		msum = msum + 20		--400 skill Embrava
	end
	msum = (msum < 44) and msum or 44
	
	--JA haste caps at 25% (256/1024)
	local jsum = 0
	if (buff_active('Haste Samba')) then	--5% JA haste
		if (player.main_job == 'DNC') then
			jsum = jsum + player.merits.haste_samba_effect
		end
		jsum = jsum + 5
	end
	if (buff_active('Last Resort')) and (player.main_job == 'DRK') then
		jsum = jsum + 15 + (player.merits.desperate_blows * 2)
	end
	if buff_active('Hasso') and (player.equipment.main ~= nil) then
		local weap = res.items:with('en',player.equipment.main)
		if (#(weap.slots) == 1) then
			jsum = jsum + 10
			if (player.equipment.legs == 'Unkai Haidate +2') then
				jsum = jsum + 2.5
			elseif (player.equipment.legs == 'Unkai Haidate +1') then
				jsum = jsum + 1.5
			end
			if (player.equipment.hands == 'Wakido Kote +1') then
				jsum = jsum + 0	--Unknown effect
			elseif (player.equipment.hands == 'Wakido Kote') then
				jsum = jsum + 0	--Unknown effect
			end
		end
	end
	jsum = (jsum < 25) and jsum or 25

	local hsum = msum + jsum
	if (hsum > 35) then
		return 'II+'
	elseif (hsum > 28) then
		return 'II'
	elseif (hsum > 19) then
		return 'I+'
	elseif (hsum > 4) then
		return 'I'
	else
		return 'na'
	end
end

--[[
	Assembles the player's melee set with an optional baseSet.
--]]
function get_melee_set(baseSet)
	local meleeSet = combineSets(baseSet, sets.engaged)
	meleeSet = combineSets(meleeSet, sets.engaged[modes.offense])
	if (S{'auto','auto_acc'}:contains(modes.offense)) then
		meleeSet = combineSets(meleeSet, sets.engaged[modes.offense], get_haste_mod())
	end
	meleeSet = combineSets(meleeSet, sets.engaged[modes.defense])
	meleeSet = combineSets(meleeSet, sets.engaged[modes.defense], modes.accuracy)
	meleeSet = combineSets(meleeSet, sets.engaged, modes.offense, modes.accuracy)
	meleeSet = combineSets(meleeSet, sets.engaged[modes.accuracy])
	
	for buff,_ in pairs(buffactive) do
		--atc(1, '[Engaged] Buffactive: '..tostring(buff))
		meleeSet = combineSets(meleeSet, sets.engaged, 'with_buff', buff)
	end
	
	if (modes.defense ~= nil) or (modes.defense ~= 'normal') then
		meleeSet = combineSets(meleeSet, sets.defense[modes.defense])
	end
	
	if player.main_job == 'THF' then
		if modes.treasure == 'TH' then
			meleeSet = combineSets(meleeSet, sets.TreasureHunter)
		end
	end
	return meleeSet
end

--[[
	Assembles the player's resting set with an optional baseSet.
--]]
function get_resting_set(baseSet)
	local restSet = combineSets(baseSet, sets.resting)
	return restSet
end

--------------------------------------------------------------------------------
--	Custom command handling
--------------------------------------------------------------------------------

function self_command(args)
	local args = args
	if type(args) == 'string' then
		args = T(args:split(' '))
		if #args == 0 then return end
	end
	local command = table.remove(args, 1)
	execute_command(command, args)
end

function execute_command(command, args)
	local cmd = command:lower()
	if executable_commands[cmd] ~= nil then
		executable_commands[cmd](args)
	else
		atc(123, '[ERROR] Unknown command: '..command)
	end
end

function equip_set(args)
	local eset
	if args[1] then
		eset = args[1]:lower()
	end
	
	if eset then
		if eset == 'engaged' then
			equip(get_gear_for_status('Engaged'))
		elseif eset == 'idle' then
			equip(get_gear_for_status('Idle'))
		end
	end
end

function update(args)
	if weapSwapJobs:contains(player.main_job) then
		if noWeapSwapSets:contains(modes.offense) then
			disable('main', 'sub')
		else
			enable('main', 'sub')
		end
	end
	
	local equipSet = get_gear_for_status(player.status)
	equipSet = combineSets(equipSet, sets.weapons, modes.weapon)
	equip(equipSet)

	if (args ~= nil) and (args[1] == 'user') then
		display_current_state()
	end
end
	
function cycle_mode(args)
	local mode = args[1]
	if mode ~= nil then
		cycleMode(mode)
	end
	atc(1, tostring(mode)..' mode is now '..tostring(modes[mode]))
	update()
end

function set_mode(args)
	local mode = args[1]
	local opt = args[2]
	if (mode ~= nil) and (opt ~= nil) then
		setMode(mode, opt)
	end
	atc(1, tostring(mode)..' mode is now '..tostring(modes[mode]))
	update()
end

function reset_mode(args)
	local mode = args[1]
	if mode ~= nil then
		modes[mode] = nil
		cycleMode(mode)
	end
	atc(1, tostring(mode)..' mode is now '..tostring(modes[mode]))
	update()
end

function toggle_mode(args)
	local mode = args[1]
	if mode ~= nil then
		modes[mode] = not modes[mode]
	end
	atc(1, tostring(mode)..' mode is now '..tostring(modes[mode]))
	update()
end

function activate_mode(args)
	local mode = args[1]
	if mode ~= nil then
		modes[mode] = true
	end
	atc(1, tostring(mode)..' mode is now '..tostring(modes[mode]))
	update()
end

--[[
	Equip gear as if the given spell or ability was used.
	Syntax: //gs c show <spell/ability name> <precast/midcast>
	If pre/mid is undefined, then it defaults to precast for abilities and midcast for spells.
--]]
function show_set(args)
	local text = table.concat(args, ' ')
	local timing = nil
	if text:lower() == 'engaged' then
		equip(get_melee_set())
		return
	elseif text:endswith('precast') then
		timing = 'precast'
		text = text:sub(1, #text-7)
	elseif text:endswith('midcast') then
		timimg = 'midcast'
		text = text:sub(1, #text-7)
	end
	text:trim()
	
	local action = res.spells:with('en',text)
	if (action == nil) then
		action = res.job_abilities:with('en',text)
		action = action or res.weapon_skills:with('en',text)
		action.action_type = "Ability"
		timing = timing or 'precast'
	else
		action.action_type = "Magic"
		timing = timing or 'midcast'
	end
	
	if (action ~= nil) then
		local equipset
		if timing == 'precast' then
			equipset = get_precast_set(action)
		elseif timing == 'midcast' then
			equipset = get_midcast_set(action)
		end
		info.print_table(equipset, timing..' set for '..text)
		equip(equipset)
	else
		atc(166, 'Unable to determine set to equip for '..table.concat(args, ' '))
	end
end

--------------------------------------------------------------------------------
--	Pet Stuff
--------------------------------------------------------------------------------

function pet_midcast(spell)
	local pmcset = {}
	--info.print_table(spell, 'Pet Midcast Spell')
	local ptype = get_pet_type()
	if (ptype == 'Avatar') then
		pmcset = combineSets(pmcset, sets.midcast.pet.BP)
		if (spell.type == 'BloodPactRage') then
			pmcset = combineSets(pmcset, sets.midcast.pet.BP.Rage)
			if bps.magical:contains(spell.en) then
				pmcset = combineSets(pmcset, sets.midcast.pet.BP.Rage.Magical)
				if bps.nuke:contains(spell.en) then
					pmcset = combineSets(pmcset, sets.midcast.pet['Elemental Magic'])
				end
			else
				pmcset = combineSets(pmcset, sets.midcast.pet.BP.Rage.Physical)
			end
		elseif (spell.type == 'BloodPactWard') then
			pmcset = combineSets(pmcset, sets.midcast.pet.BP.Ward)
			if spell.targets:contains('Enemy') then
				pmcset = combineSets(pmcset, sets.midcast.pet.BP.Ward.Debuff)
			else
				if bps.heal:contains(spell.en) then
					pmcset = combineSets(pmcset, sets.midcast.pet['White Magic'])
				else
					pmcset = combineSets(pmcset, sets.midcast.pet.BP.Ward.Buff)
				end
			end
		else
			atc(123, 'Unknown Avatar action type')
		end
	else
		atc(123, 'Unknown pet type')
	end
	equip(pmcset)
end

function pet_aftercast(spell)
	update()
end

--[[
	Called when a player gains or loses a pet.
--]]
function pet_change(pet, gain)
	update()
end

--[[
	Called when the player's pet's status changes, and after pet_change when the pet is released.
	As such, don't automatically handle gear equips.  Only do so if directed to do so by the job.
--]]
function pet_status_change(new, old)
end

function info_func(args)
	if info == nil then
		atc(3,'Unable to parse info.  Windower/addons/info/info_shared.lua was unable to be loaded.')
		atc(3,'If you would like to use this function, please visit https://github.com/lorand-ffxi/addons to download it.')
		return
	end
	local cmd = args[1]		--Take the first element as the command
	if (#args > 1) then		--If there were more args provided
		table.remove(args, 1)	--Remove the first from the list of args
	end
	info.process_input(cmd, args)
end

executable_commands = {
	['atc']    =	addToChat,	['scholar']   =	handle_strategems,	['show']     =	show_set,
	['update'] =	update,		['cycle']     =	cycle_mode,		['set']      =	set_mode,
	['reset']  =	reset_mode,	['toggle']    =	toggle_mode,		['activate'] =	activate_mode,
	['equip']  =	equip_set,	['info']      =	info_func,		['slips']    =	process_slip_gear,
	['smn']    =	handle_smn,	['inv_check'] =	process_inventory_gear
}