-----------------------------------------------------------------------------------------------------------
--[[
	Author: Ragnarok.Lorand
	GearSwap core components
--]]
-----------------------------------------------------------------------------------------------------------

function init()
	include('utility_functions')
	include('defaults')
	define_defaults()
	
	include('set_operations')
	include('spell_utilities')
	include('mappings')
	
	load_user_gear(player.main_job)				-- Load gear from a job-specific file
	set_modes()
	set_keybinds()
	if init_gear_sets then init_gear_sets() end
end

init()

-----------------------------------------------------------------------------------------------------------
--	Spell / ability handling
-----------------------------------------------------------------------------------------------------------

--[[
	Called when an action has been flagged as not possible to perform.
--]]
function filtered_action(spell)
	if spell.type == 'WhiteMagic' and buffactive['Light Arts'] and gearswap.addendum_white[spell.id] then
		cancel_spell()
		if get_available_stratagem_count() > 0 then
			windower.send_command('input /ja "Addendum: White" <me>; wait 1.75; input /ma "'..spell.name..'" '..spell.target.name)
		else
			windower.add_to_chat(122, "Cancelled "..spell.name..".  Addendum: White is required, but there are no available stratagems.")
		end
	elseif spell.type == 'BlackMagic' and buffactive['Dark Arts'] and gearswap.addendum_black[spell.id] then
		local retryTarget
		if spell.target.type == 'MONSTER' then
			retryTarget = '<t>'
		else
			retryTarget = spell.target.name
		end
		cancel_spell()
		if get_available_stratagem_count() > 0 then
			windower.send_command('input /ja "Addendum: Black" <me>; wait 1.75; input /ma "'..spell.name..'" '..retryTarget)
		else
			windower.add_to_chat(122, "Cancelled "..spell.name..".  Addendum: Black is required, but there are no available stratagems.")
		end
	else
		windower.add_to_chat(166, 'Unhandled filtered action: '..spell.english)
	end
end

--[[
	Called when GearSwap intercepts the original text input, but before the game has done any processing on it.
	In particular, it hasn't initiated target selection for <st*> target types.
--]]
function pretarget(spell)
	if spell.target == nil then return end
	if S{'PLAYER', 'SELF'}:contains(spell.target.type) and debuff_to_na[spell.english] then
		local spellTarget = spell.target.name
		if spell.target.name == player.name then
			local ptarg = windower.ffxi.get_mob_by_target()
			if (ptarg ~= nil) and (ptarg.name ~= player.name) and (ptarg.in_alliance or not ptarg.is_npc) then
				spellTarget = '<t>'
			end
		end
		windower.send_command('input /ma "'..debuff_to_na[spell.english]..'" '..spellTarget)
	elseif spell.english == 'Phalanx' and spell.target.type == 'PLAYER' and spell.target.type ~= 'SELF' then
		windower.send_command('input /ma "Phalanx II" '..spell.target.name)
	elseif S{'Haste'}:contains(spell.english) and player.main_job == 'RDM' then
		windower.send_command('input /ma "Haste II" '..spell.target.name)
	elseif S{'Flurry'}:contains(spell.english) and player.main_job == 'RDM' then
		windower.send_command('input /ma "Flurry II" '..spell.target.name)
	else
		return
	end
	cancel_spell()
end

--[[
	Called after the text command has been processed (and target selected), but before the packet gets pushed out.
	Equip any gear that should be on before the spell or ability is used.
--]]
function precast(spell)
	if modify_cure(spell) or not_possible_to_use(spell) then
		cancel_spell()
		return
	end
	
	local notOverwritable = S{'Stoneskin', 'Sneak', 'Spectral Jig'}
	if notOverwritable:contains(spell.name) and (spell.target.name == player.name) then
		if spell.name == 'Spectral Jig' then
			windower.send_command('cancel Sneak')
		else
			windower.send_command('wait 0.5; cancel '..spell.name)
		end
	end
	
	--Perform checks prior to execution of the command
	if player.main_job == 'BRD' and spell.type == 'BardSong' then
		windower.add_to_chat(122, "Casting "..spell.name.." in mode: "..state.DaurdablaMode)
		-- Auto-Pianissimo
		if spell.target.type == 'PLAYER' and not spell.target.charmed and not state.Buff['Pianissimo'] then
			cancel_spell()
			windower.send_command('input /ja "Pianissimo" <me>; wait 1.25; input /ma "'..spell.name..'" '..spell.target.name)
			return
		end
	elseif S{'RNG', 'COR'}:contains(player.main_job) then
		local check_ammo
		--Choose which ammo should be verified
		if spell.type == 'WeaponSkill' and bow_gun_weaponskills:contains(spell.name) then
			check_ammo = gear[modes.offense..'_ammo_WS']
		elseif spell.action_type == 'Ranged Attack' then
			check_ammo = gear[modes.offense..'_ammo_RA']
		end
		
		if check_ammo then		--Verify that ammunition is available
			if not player.inventory[check_ammo] then
				windower.add_to_chat(104, 'No ammo available for that action.')
				cancel_spell()
				return
			end
			if player.inventory[check_ammo].count <= options.ammo_warning_limit and
			   player.inventory[check_ammo].count > 1 and not state.warned then
				windower.add_to_chat(104, '*******************************')
				windower.add_to_chat(104, '*****  LOW AMMO WARNING *****')
				windower.add_to_chat(104, '*******************************')
				state.warned = true
			elseif player.inventory[check_ammo].count > options.ammo_warning_limit and state.warned then
				state.warned = false
			end
		end
	end
	
	if S{'WHM', 'BLM', 'RDM', 'SCH', 'BRD'}:contains(player.main_job) then
		if S{'Melee', 'Skillup'}:contains(modes.offense) then
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
	if spell.name == 'Utsusemi: Ichi' and not spell.interrupted then
		windower.send_command('wait 2; cancel 66; cancel 446')
	end
	equip(get_midcast_set(spell))
	
	if spell.name == 'Impact' then
		equip({head='empty', body='Twilight Cloak'})
	end
end

--[[
	Called upon action completion (i.e., casting finished, ws landed, casting interrupted, etc)
--]]
function aftercast(spell)
	if spell.name == 'Unknown Interrupt' then return end
	local spellMap = spell_maps[spell.name]
	
	if not spell.interrupted then
		initSleepTimer(spell, spellMap)
		if player.main_job == "BLM" then
			if spell.name == 'Mana Wall' and player.equipment.feet == "Goetia Sabots +2" then
				disable('feet')
			end
		elseif player.main_job == "BRD" then
			if spell.type == 'BardSong' and spell.target then
				if spell.target.type and spell.target.type:upper() == 'SELF' then
					adjust_Timers(spell, spellMap)
				end
			end
		end
	end
	
	if spell.interrupted then
		windower.send_command('wait 0.6;gs c update')	-- Delay update so aftercast equip will actually be worn.
	else
		equip(get_gear_for_status(player.status))
	end
end

-----------------------------------------------------------------------------------------------------------
--	Event reactions
-----------------------------------------------------------------------------------------------------------

--[[
	Called when the player's status changes.
	[0] = {id=0,en="Idle"},			[1] = {id=1,en="Engaged"},		[2] = {id=2,en="Dead"},			[3] = {id=3,en="Engaged dead"},
	[4] = {id=4,en="Event"},		[5] = {id=5,en="Chocobo"},		[33] = {id=33,en="Resting"},	[34] = {id=34,en="Locked"},
	[44] = {id=44,en="Crafting"},	[47] = {id=47,en="Sitting"},	[48] = {id=48,en="Kneeling"},	[50] = {id=50,en="Fishing"},
	[38] = {id=38,en="Fishing fighting"},			[39] = {id=39,en="Fishing caught"},			[40] = {id=40,en="Fishing broken rod"},
	[41] = {id=41,en="Fishing broken line"},		[42] = {id=42,en="Fishing caught monster"},	[43] = {id=43,en="Fishing lost catch"},
	[51] = {id=51,en="Fishing fighting center"},	[52] = {id=52,en="Fishing fighting right"},	[53] = {id=53,en="Fishing fighting left"},
	[56] = {id=56,en="Fishing rod in water"},		[57] = {id=57,en="Fishing fish on hook"},	[58] = {id=58,en="Fishing caught fish"},
	[59] = {id=59,en="Fishing rod break"},			[60] = {id=60,en="Fishing line break"},		[61] = {id=61,en="Fishing monster catch"},
	[62] = {id=62,en="Fishing no catch or lost"}
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
	
	if buff == 'Sleep' and gain and buffactive['Stoneskin'] then
		--If slept, drop stoneskin if a DOT is active to wake up
		if buffactive['Sublimation: Active'] or dotActive() then
			windower.send_command('cancel stoneskin')
		end
	elseif player.main_job == "BLM" and buff == "Mana Wall" and not gain then
		enable('feet')		-- Unlock feet when Mana Wall buff is lost.
		equip(get_gear_for_status(player.status))
	elseif buff == 'Sublimation: Complete' and gain then
		windower.add_to_chat(204, 'Sublimation is done charging!')
	elseif buff == 'Light Arts' and gain then
		state.arts = 'LA'
	elseif buff == 'Dark Arts' and gain then
		state.arts = 'DA'
	end
	
	if buff:lower() == 'weakness' then
		if gain then	send_command('timers create "Weakness" 300 up abilities/00255.png')
		else			send_command('timers delete "Weakness"')
		end
	end
end

--[[
	Called when the player's main job changes.
--]]
function main_job_change(new, old)
	set_modes()
	set_keybinds()
end

--[[
	Called when the player's sub job changes.
--]]
function sub_job_change(new, old)
	set_modes()
	set_keybinds()
end

-----------------------------------------------------------------------------------------------------------
--	Gear set building functions
-----------------------------------------------------------------------------------------------------------

function get_sub_type()
	if player.sub_job == 'SAM' then
		return 'sam'
	else
		return 'other'
	end
end

--[[
	Assembles the precast set for the given spell/ability.
--]]
function get_precast_set(spell)
	local precastSet = {}
	local status = player.status:lower()
	local spellMap = spell_maps[spell.name]
	
	if spell.action_type == 'Magic' then
		precastSet = sets.precast.FC
		precastSet = combineSets(precastSet, sets.precast.FC, spell.type)
		precastSet = combineSets(precastSet, sets.precast.FC, spell.skill:stripchars(' '))
		precastSet = combineSets(precastSet, sets.precast.FC, spell.element)
		precastSet = combineSets(precastSet, sets.precast.FC, spellMap)
		precastSet = combineSets(precastSet, sets.precast.FC, spell.name)
		precastSet = combineSets(precastSet, sets.precast.FC, modes.casting)
		precastSet = combineSets(precastSet, sets.precast.FC, status)
	elseif spell.action_type == 'Ranged Attack' then
		--Equip snapshot gear & TP ammo
		precastSet = combineSets(sets.precast.ranged, {ammo=gear[modes.offense..'_ammo_RA']})
	elseif spell.action_type == 'Ability' then
		if spell.type == 'JobAbility' then
			precastSet = combineSets(precastSet, sets.precast.JA, spell.name)
		elseif spell.type == 'WeaponSkill' then
			--sets.wsBase[sam/other][modes.offense][state.RangedMode][wsmod[spell.english]]
			if S{'RNG', 'COR'}:contains(player.main_job) then
				precastSet = combineSets(precastSet, sets[modes.offense])
				precastSet = combineSets(precastSet, sets[modes.offense], get_sub_type())
				precastSet = combineSets(precastSet, sets[modes.offense], get_sub_type(), modes.ranged)
				precastSet = combineSets(precastSet, sets[modes.offense], get_sub_type(), modes.ranged, 'ws')
				precastSet = combineSets(precastSet, {ammo=gear[modes.offense..'_ammo_WS']})
				
				local wsSet = sets.wsBase
				wsSet = combineSets(wsSet, sets.wsBase, wsmod[spell.name])
				wsSet = combineSets(wsSet, sets.wsBase, wsmod[spell.name], spell.name)
				wsSet = combineSets(wsSet, get_ftp_set(spell))
				
				precastSet = combineSets(wsSet, precastSet)
			else
				if elemental_weaponskills[spell.english] ~= nil then
					precastSet = sets.wsBase.Magic
					if weatherPermits(spell.element) and options.useObi then
						precastSet = combineSets(precastSet, {waist=gear_map.Obi[spell.element]})
					end
				else
					precastSet = sets.wsBase
				end
				precastSet = combineSets(precastSet, sets.wsBase, get_sub_type())
				precastSet = combineSets(precastSet, sets.wsBase, get_sub_type(), modes.offense)
				precastSet = combineSets(precastSet, sets.wsBase, get_sub_type(), modes.offense, wsmod[spell.name])
				precastSet = combineSets(precastSet, sets.wsBase, get_sub_type(), modes.offense, wsmod[spell.name], spell.name)
				precastSet = combineSets(precastSet,get_ftp_set(spell))
			end
		else
			-- All other ability types, such as Waltz, Jig, Scholar, etc.
			-- These may use the generic type, or be refined for the individual action, either by name or by spell map.
			precastSet = combineSets(precastSet, sets.precast, spell.type)
			precastSet = combineSets(precastSet, sets.precast, spellMap)
			precastSet = combineSets(precastSet, sets.precast, spell.name)
		end
	end
	
	if player.main_job == 'SCH' then
		if matchesGrimoire(spell) then
			precastSet = combineSets(precastSet, sets.precast.FC.Grimoire)		--FastCast/Haste +8%
		end
		if buffactive.Celerity or buffactive.Alacrity then
			if buffactive[elements.storm_of[spell.element]] or spell.element == world.weather_element then
				precastSet = combineSets(precastSet, sets.precast.FC.Weather)	--FastCast/Haste +15%
			end
		end
	elseif player.main_job == 'THF' then
		if modes.treasure == 'TH' then
			precastSet = combineSets(precastSet, sets.TreasureHunter)
		end
	end
	
	return precastSet
end

function get_standard_magic_set(baseSet, spell, spellMap, spellType)
	local castSet = {}
	castSet = combineSets(castSet, baseSet)
	castSet = combineSets(castSet, sets.midcast.MagicAccuracy)
	castSet = combineSets(castSet, sets.midcast, spellType)
	castSet = combineSets(castSet, sets.midcast, spellType, state.arts)
	castSet = combineSets(castSet, sets.midcast, spellType, spellMap, modes.casting)
	castSet = combineSets(castSet, sets.midcast, spellType, spellMap)
	castSet = combineSets(castSet, sets.midcast, spellType, spell.name)
	castSet = combineSets(castSet, sets.midcast, spellMap)
	castSet = combineSets(castSet, sets.midcast, spell.name)
	return castSet
end

--[[
	Assembles the midcast set for the given spell/ability.
--]]
function get_midcast_set(spell)
	local midcastSet = {}
	local status = player.status:lower()
	local targType = spell.target.type:lower()
	local spellMap = spell_maps[spell.name]
	
	if spell.action_type == 'Magic' then
		midcastSet = combineSets(midcastSet, sets.midcast.FastRecast)
		if spell.type == 'BardSong' and player.main_job == 'BRD' then
			local songType = get_song_class(spell)													--Buff/debuff/dummy
			if songType == 'DaurdablaDummy' then
				midcastSet = combineSets(midcastSet, sets.midcast.SongRecast)
				midcastSet = combineSets(midcastSet, {range=gear.instruments.multiSong})
			else
				local instrumentSkill = get_instrument_type(spellMap)
				midcastSet = combineSets(midcastSet, sets.midcast.Singing)							--Equip base singing gear
				midcastSet = combineSets(midcastSet, sets.midcast, instrumentSkill)					--Equip gear based on skill of instrument
				midcastSet = combineSets(midcastSet, sets.midcast, songType)						--Equip gear based on buff/debuff
				midcastSet = combineSets(midcastSet, sets.midcast, spellMap)						--Equip gear based on song
				if state.DaurdablaMode == 'Daurdabla' then
					midcastSet = combineSets(midcastSet, {range=gear.instruments.multiSong})
				else
					if (gear.instruments[spellMap] ~= nil) and isAvailable(gear.instruments[spellMap]) then
						midcastSet = combineSets(midcastSet, {range=gear.instruments[spellMap]})	--Equip the proper instrument
					else
						midcastSet = combineSets(midcastSet, {range=gear.instruments.default})
					end
				end
			end
			state.DaurdablaMode = 'None'
		elseif spell.skill == 'Dark Magic' then
			midcastSet = get_standard_magic_set(midcastSet, spell, spellMap, 'DarkMagic')
		elseif spell.skill == 'Healing Magic' then
			midcastSet = get_standard_magic_set(midcastSet, spell, spellMap, 'HealingMagic')
			midcastSet = combineSets(midcastSet, sets.midcast.spellMap, status)
			midcastSet = combineSets(midcastSet, sets.midcast.spellMap, targType)
			
			if (spellMap == 'Cure') and weatherPermits(spell.element)then			
				midcastSet = combineSets(midcastSet, {waist='Korin Obi'})
			end
		elseif spell.skill == 'Divine Magic' then
			midcastSet = get_standard_magic_set(midcastSet, spell, spellMap, 'DivineMagic')
			
			if S{'Banish', 'Holy'}:contains(spellMap) then
				midcastSet = combineSets(midcastSet, sets.midcast.DivineMagic.Nuke)
				if weatherPermits(spell.element) and options.useObi then
					midcastSet = combineSets(midcastSet, {waist='Korin Obi'})
				end
			end
		elseif spell.skill == 'Elemental Magic' then
			midcastSet = get_standard_magic_set(midcastSet, spell, spellMap, 'ElementalMagic')
			--TODO: Add High/Low tier sets
			
			if weatherPermits(spell.element) then
				if spellMap ~= 'Helix' and options.useObi then
					midcastSet = combineSets(midcastSet, {waist=gear_map.Obi[spell.element]})
				end
				if options.useTwilightCape then
					midcastSet = combineSets(midcastSet, {back='Twilight Cape'})
				end
				if buffactive['Klimaform'] and player.main_job == 'SCH' then
					midcastSet = combineSets(midcastSet, {feet={"Savant's Loafers +2", "Savant's Loafers +1"}})
				end
			end
			midcastSet = combineSets(midcastSet, sets.midcast.ElementalMagic, spell.element)
		elseif spell.skill == 'Enfeebling Magic' then
			midcastSet = get_standard_magic_set(midcastSet, spell, spellMap, 'EnfeeblingMagic')
		
			--If the spell has variable potency, equip gear that enhances potency
			if var_potency_enfeebs[spell.english] and sets.midcast.EnfeeblingMagic then
				midcastSet = combineSets(midcastSet, sets.midcast.EnfeeblingMagic, 'Potency')
				midcastSet = combineSets(midcastSet, sets.midcast.EnfeeblingMagic, 'Potency', modes.casting)
			end
			if player.main_job == 'RDM' and buffactive['Saboteur'] then
				midcastSet = combineSets(midcastSet, sets.precast.JA, 'Saboteur')
			end			
		elseif spell.skill == 'Enhancing Magic' then
			midcastSet = combineSets(midcastSet, sets.midcast.EnhancingMagic)
			midcastSet = combineSets(midcastSet, sets.midcast.EnhancingMagic, state.arts)
			midcastSet = combineSets(midcastSet, sets.midcast.EnhancingMagic.Duration)
			midcastSet = combineSets(midcastSet, sets.midcast.EnhancingMagic, spellMap)
			midcastSet = combineSets(midcastSet, sets.midcast.EnhancingMagic, spell.name)
			midcastSet = combineSets(midcastSet, sets.midcast, spellMap)
			midcastSet = combineSets(midcastSet, sets.midcast, spell.name)
			
			if buffactive['Composure'] and spell.target.type ~= 'SELF' then
				midcastSet = combineSets(midcastSet, sets.midcast.EnhancingMagic.Duration.ComposureOther)
			end
			if spell.name == 'Phalanx II' then
				midcastSet = combineSets(midcastSet, sets.midcast, spell.name)
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
						midcastSet = combineSets(midcastSet, {waist=gear_map.Obi[spell.element]})
					end
					midcastSet = combineSets(midcastSet, sets.midcast, 'Ninjutsu', 'Nuke', spell.element)
				end
			end
		else
			add_to_chat(122, 'Using default rule set for '..spell.english..'.')
			midcastSet = combineSets(midcastSet, sets.midcast)
			midcastSet = combineSets(midcastSet, sets.midcast, spell.type)
			midcastSet = combineSets(midcastSet, sets.midcast, spell.skill)
			midcastSet = combineSets(midcastSet, sets.midcast, spellMap)
			midcastSet = combineSets(midcastSet, sets.midcast, spell.name)
		end
	elseif spell.action_type == 'Ranged Attack' then
		if S{'RNG', 'COR'}:contains(player.main_job) then
			if buffactive['Barrage'] then
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
			equipSet = sets.midcast.ranged
		end
	elseif spell.action_type == 'Ability' then
		midcastSet = combineSets(midcastSet, sets.midcast, spell.type)
		midcastSet = combineSets(midcastSet, sets.midcast, spell.type, spellMap)
		midcastSet = combineSets(midcastSet, sets.midcast, spell.type, spell.name)
		midcastSet = combineSets(midcastSet, sets.midcast, spellMap)
		midcastSet = combineSets(midcastSet, sets.midcast, spell.name)
	end
	
	if player.main_job == 'THF' then
		if modes.treasure == 'TH' then
			midcastSet = combineSets(midcastSet, sets.TreasureHunter)
		end
	end
	return midcastSet
end

--[[
	Returns the gear set for the given status
--]]
function get_gear_for_status(status)
	if player.main_job == 'THF' then
		local thfSet = {}
		if state.Buff['Sneak Attack'] then
			thfSet = combineSets(thfSet, sets.precast.JA['Sneak Attack'])
		elseif state.Buff['Trick Attack'] then
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
	for buff,_ in pairs(buffactive) do
		idleSet = combineSets(idleSet, sets.idle.with_buff[buff])
	end
	if player.mpp < 80 then
		idleSet = combineSets(idleSet, sets.idle.lowMP)
		if (world.time >= (18*60) or world.time <= (6*60)) then
			idleSet = combineSets(idleSet, sets.idle.lowMP_night)
		else
			idleSet = combineSets(idleSet, sets.idle.lowMP_day)
		end
	end
	idleSet = combineSets(idleSet, sets.idle[modes.idle])
	
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
	end
	
	if (modes.defense ~= nil) or (modes.defense ~= 'normal') then
		idleSet = combineSets(idleSet, sets.defense[modes.defense])
	end
	
	return idleSet
end

--[[
	Assembles the player's melee set with an optional baseSet.
--]]
function get_melee_set(baseSet)
	local meleeSet = combineSets(baseSet, sets.engaged)
	meleeSet = combineSets(meleeSet, sets.engaged[modes.offense])
	meleeSet = combineSets(meleeSet, sets.engaged[modes.defense])
	meleeSet = combineSets(meleeSet, sets.engaged[modes.accuracy])
	meleeSet = combineSets(meleeSet, sets.engaged[modes.offense], modes.accuracy)
	meleeSet = combineSets(meleeSet, sets.engaged[modes.defense], modes.accuracy)
	
	for buff,_ in pairs(buffactive) do
		--windower.add_to_chat(1, '[Engaged] Buffactive: '..tostring(buff))
		meleeSet = combineSets(meleeSet, sets.engaged.with_buff[buff])
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

-----------------------------------------------------------------------------------------------------------
--	Custom command handling
-----------------------------------------------------------------------------------------------------------

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
		add_to_chat(123, '[ERROR] Unknown command: '..command)
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
	if S{'WHM', 'BLM', 'RDM', 'SCH', 'BRD'}:contains(player.main_job) then
		if S{'Melee', 'Skillup'}:contains(modes.offense) then
			disable('main', 'sub')
		else
			enable('main', 'sub')
		end
	end
	
	equip(get_gear_for_status(player.status))

	if (args ~= nil) and (args[1] == 'user') then
		display_current_state()
	end
end
	
function cycle_mode(args)
	local mode = args[1]
	if mode ~= nil then
		cycleMode(mode)
	end
	windower.add_to_chat(1, tostring(mode)..' mode is now '..tostring(modes[mode]))
	update()
end

function set_mode(args)
	local mode = args[1]
	local opt = args[2]
	if (mode ~= nil) and (opt ~= nil) then
		setMode(mode, opt)
	end
	windower.add_to_chat(1, tostring(mode)..' mode is now '..tostring(modes[mode]))
	update()
end

function reset_mode(args)
	local mode = args[1]
	if mode ~= nil then
		modes[mode] = nil
		cycleMode(mode)
	end
	windower.add_to_chat(1, tostring(mode)..' mode is now '..tostring(modes[mode]))
	update()
end

function toggle_mode(args)
	local mode = args[1]
	if mode ~= nil then
		modes[mode] = not modes[mode]
	end
	windower.add_to_chat(1, tostring(mode)..' mode is now '..tostring(modes[mode]))
	update()
end

function activate_mode(args)
	local mode = args[1]
	if mode ~= nil then
		modes[mode] = true
	end
	windower.add_to_chat(1, tostring(mode)..' mode is now '..tostring(modes[mode]))
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
	end
	
	if text:endswith('precast') then
		timing = 'precast'
		text = text:sub(1, #text-7)
	elseif text:endswith('midcast') then
		timimg = 'midcast'
		text = text:sub(1, #text-7)
	end
	text:trim()
	
	local action = validabils['english']['/ma']:with('en', text)
	if action == nil then
		action = validabils['english']['/ja']:with('en', text)
		if action == nil then
			action = validabils['english']['/ws']:with('en', text)
		end
		if timing == nil then
			timing = 'precast'
		end
	else
		if timing == nil then
			timing = 'midcast'
		end
	end
	
	if action ~= nil then
		if timing == 'precast' then
			equip(get_precast_set(action))
		elseif timing == 'midcast' then
			equip(get_midcast_set(action))
		end
	else
		windower.add_to_chat(166, 'Unable to determine set to equip for '..table.concat(args, ' '))
	end
end

-----------------------------------------------------------------------------------------------------------
--	Pet Stuff
-----------------------------------------------------------------------------------------------------------

function pet_midcast(spell)
end

function pet_aftercast(spell)
end

--[[
	Called when a player gains or loses a pet.
--]]
function pet_change(pet, gain)
end

--[[
	Called when the player's pet's status changes, and after pet_change when the pet is released.
	As such, don't automatically handle gear equips.  Only do so if directed to do so by the job.
--]]
function pet_status_change(new, old)
end

executable_commands = {
	['atc']		=	addToChat,	['scholar'] =	handle_strategems,	['show']	=	show_set,
	['update']	=	update,		['cycle']	=	cycle_mode,			['set']		=	set_mode,
	['reset']	=	reset_mode,	['toggle']	=	toggle_mode,		['activate']=	activate_mode,
	['equip']	=	equip_set,
}