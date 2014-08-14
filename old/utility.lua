-----------------------------------------------------------------------------------------------------------
-- Adapted from Mote's GearSwap files by Ragnarok.Lorand
-- 
-- General utility functions that can be used by any job files.  Outside the scope of what the main
-- include file deals with.
-----------------------------------------------------------------------------------------------------------

function execute_if_available(func)
	if func then
		func()
	end
end

function incorporate_subset(baseSet, subSet)
	if baseSet[subSet] ~= nil then
		return set_combine(baseSet, baseSet[subSet])
	else
		return baseSet
	end
end

function combine_if_defined(baseSet, addSet)
	if addSet then
		baseSet = set_combine(baseSet, addSet)
	end
	return baseSet
end

function combine_if_available(baseSet, slot, item)
	local itemSet = {[slot] = item}
	if isAvailable(item) then
		baseSet = set_combine(baseSet, itemSet)
	end
	return baseSet
end

function combine_first_available(baseSet, items)
	for _,item in pairs(items) do
		for slot,piece in pairs(item) do
			if isAvailable(piece) then
				baseSet = set_combine(baseSet, item)
				return baseSet
			end
		end
	end
	return baseSet
end

function standard_magic_combines(baseSet, spell, spellMap, spellType)
	baseSet = combine_if_defined(baseSet, sets.midcast.MagicAccuracy)
	baseSet = combine_if_defined(baseSet, sets.midcast.spellType)
	if sets.midcast.spellType then
		baseSet = combine_if_defined(baseSet, sets.midcast.spellType[spellMap])
		baseSet = combine_if_defined(baseSet, sets.midcast.spellType[spell.en])
	end
	baseSet = combine_if_defined(baseSet, sets.midcast[spellMap])
	baseSet = combine_if_defined(baseSet, sets.midcast[spell.en])
	if sets.midcast.spellType then
		baseSet = combine_if_defined(baseSet, sets.midcast.spellType[state.arts])
	end
	return baseSet
end

function get_fishing_gear()
	local fishSet = {}
	local fishingGear = {
		rods={{range="Ebisu Fishing Rod"},{range="Lu Shang's Fishing Rod"}},
		hats={{head="Trainee's Spectacles"},{head="Rain Hat"}},
		necklaces={{neck="Fisher's Torque"}},
		shirts={{body="Fisherman's Smock"},{body="Fisherman's Apron"},{body="Angler's Tunica"},{body="Fisherman's Tunica"}},
		gloves={{hands="Angler's Gloves"},{hands="Fisherman's Gloves"}},
		belts={{waist="Fisher's Rope"}},
		pants={{legs="Angler's Hose"},{legs="Fisherman's Hose"}},
		shoes={{feet="Waders"},{feet="Angler's Boots"},{feet="Fisherman's Boots"}}
	}
	
	for slot,items in pairs(fishingGear) do
		fishSet = combine_first_available(fishSet, items)
	end
	
	fishSet = combine_if_available(fishSet, 'ring1', 'Noddy Ring')
	fishSet = combine_if_available(fishSet, 'ring2', 'Puffin Ring')
	return fishSet
end

function isAvailable(item)
	return player.inventory[item] or player.wardrobe[item]
end

function weatherPermits(element)
	return buffactive[elements.storm_of[element]] or element == world.day_element or element == world.weather_element
end

function equip_if_available(slot, item)
	local itemSet = {}
	itemSet[slot] = item
	if isAvailable(item) then
		equip(itemSet)
		return true
	end
	return false
end

function equip_if_defined(set)
	if set then
		equip(set)
	end
end

function combine_ftp_gear(baseSet, spell)
	if options.use_ftp_neck then
		baseSet = set_combine(baseSet, get_ftp_gear('neck', spell))
	end
	if options.use_ftp_waist then
		baseSet = set_combine(baseSet, get_ftp_gear('waist', spell))
	end
	return baseSet
end

function get_ftp_gear(slot, spell)
	local ws_elements = S{}:
		union(skillchain_elements[spell.skillchain_a]):
		union(skillchain_elements[spell.skillchain_b]):
		union(skillchain_elements[spell.skillchain_c])
	
	for ele,i in pairs(ws_elements) do
		if isAvailable(gear_map.ftp[slot][ele]) then
			return {[slot] = gear_map.ftp[slot][ele]}
		end
	end
	return {}
end

function equip_ftp_gear(slot, spell)
	local ws_elements = S{}:
		union(skillchain_elements[spell.skillchain_a]):
		union(skillchain_elements[spell.skillchain_b]):
		union(skillchain_elements[spell.skillchain_c])
	
	for ele,i in pairs(ws_elements) do
		if equip_if_available(slot, gear_map.ftp[slot][ele]) then
			return
		end
	end
end

function not_possible_to_use(spell)
	--TODO: Cancel spell/ability if a debilitating debuff such as Sleep is active
	if spell.action_type == 'Ability' then
		--TODO: Cancel ability if Amnesia is active
		local abil_recasts = windower.ffxi.get_ability_recasts()
		if spell.type == 'WeaponSkill' then
			if player.tp < 1000 and player.status == 'Engaged' then
				add_to_chat(166, 'Cancelling '..spell.en..' because TP is too low ('..player.tp..').')
				return true
			end
		elseif spell.type == 'Scholar' then
			if update_stratagem_count() == 0 then
				add_to_chat(166, 'Cancelling '..spell.en..' because there are currently no stratagems available for use.')
				return true
			elseif buffactive[spell.en] then
				add_to_chat(166, 'Cancelling '..spell.en..' because it is already active.')
				return true
			end
		elseif abil_recasts[spell.recast_id] and abil_recasts[spell.recast_id] > 0 then
			add_to_chat(166, 'Unable to use '..spell.english..' at this time. ['..(abil_recasts[spell.recast_id])..'s remaining]')
			return true
		end
	elseif spell.action_type == 'Magic' then
		local spell_recasts = windower.ffxi.get_spell_recasts()
		if spell_recasts[spell.id] > 0 then
			add_to_chat(166, 'Unable to cast '..spell.english..' at this time. ['..(spell_recasts[spell.id]/100)..'s remaining]')
			return true
		elseif spell.target.charmed and spell.en:contains('Cur') then
			add_to_chat(166, 'Cancelling '..spell.en..' because '..spell.target.name..' is currently charmed.')
			return true
		elseif spell.en:contains('Utsusemi') then
			if buffactive['Copy Image (3)'] or buffactive['Copy Image (4+)'] then
				add_to_chat(57, 'Cancelled '..spell.en..' because 3 or more shadows are still active.')
				return true
			end
		end
	end
	return false
end

function refresh_arts()
	if buffactive['Light Arts'] or buffactive['Addendum: White'] then
		state.arts = 'LA'
	elseif buffactive['Dark Arts'] or buffactive['Addendum: Black'] then
		state.arts = 'DA'
	end
end

function update_stratagem_count()
	-- local recastTime = windower.ffxi.get_ability_recasts()[231] or 0
	-- local stratsUsed = (recastTime/strat_charge_time[state.max_stratagems]):ceil()
	-- state.stratagems = state.max_stratagems - stratsUsed
	-- return state.stratagems
	state.stratagems = get_available_stratagem_count()
	return state.stratagems
end

--[[
	Calculates and returns the maximum number of SCH stratagems available for use.
--]]
function get_max_stratagem_count()
	if S{player.main_job, player.sub_job}:contains('SCH') then
		local lvl = player.main_job == 'SCH' and player.main_job_level or player.sub_job_level
		return math.floor(((lvl  - 10) / 20) + 1)
	else
		return 0
	end
end

--[[
	Calculates the number of SCH stratagems that are currently available for use.
	Calculated from the combined recast timer for stratagems and the maximum number of stratagems
	that are available.  The recast time for each stratagem charge corresponds directly with the
	maximum number of stratagems that can be used.  The table that links these is strat_charge_time,
	and is defined in mappings.lua.
--]]
function get_available_stratagem_count()
	local recastTime = windower.ffxi.get_ability_recasts()[231] or 0
	local maxStrats = get_max_stratagem_count()
	if maxStrats == 0 then return 0 end
	local stratsUsed = (recastTime/strat_charge_time[maxStrats]):ceil()
	return maxStrats - stratsUsed
end

function correspondsWithActiveArts(spell)
	if spell.type == 'WhiteMagic' then
		return (buffactive['Light Arts'] or buffactive['Addendum: White'])
	elseif spell.type == 'BlackMagic' then
		return (buffactive['Dark Arts'] or buffactive['Addendum: Black'])
	else
		return false
	end
end

--[[
	If the given spell is a type of sleep spell, then start a timer to notify when it will wear off
--]]
function initSleepTimer(spell, spellMap)
	local duration, mtext
	if spell.interrupted then			return
	elseif spellMap == 'Break' then		duration = 30
	elseif spellMap == 'Sleep I' then	duration = 60
	elseif spellMap == 'Sleep II' then	duration = 90
	elseif spellMap == 'Lullaby' then
		local songMult = get_song_mult(spellName, spellMap)
		if spell.en == 'Foe Lullaby' or spell.en == 'Horde Lullaby' then
			duration = 30 * songMult
		else
			duration = 60 * songMult
		end
	else
		return
	end
	
	if spell.type == 'WhiteMagic' and buffactive['Perpetuance'] then
		duration = duration * 2
	end
	
	mtext = '; gs c atc 123 '..string.char(0x81, 0xA3)..' '..spell.english..' on '..spell.target.name..' is wearing off in '
	send_command('@wait '..(duration-15)..mtext..'15 seconds '..string.char(0x81, 0xA3))
	send_command('@wait '..(duration-5)..mtext..'5 seconds '..string.char(0x81, 0xA3))
end

--[[
	Rounds a number to the given number of decimal places
	Note: math.round erroneously floors the entire return statement, causing it to always return an integer value
--]]
function round(num, idp)
	local mult = 10^(idp or 0)
	return math.floor(num * mult + 0.5) / mult
end

--[[
	Calculates the player's current movement speed as a percentage of the normal movement speed
--]]
function getMovementSpeed()
	local s = round(player.movement_speed / 5, 2)
	s = (s - 1) * 100
	
	if s == 0 then		return 'Normal'
	elseif s < 0 then	return s..'%'
	else				return '+'..s..'%'
	end
end

--[[
	Called do determine whether or not a debuff that causes damage over time is active
--]]
function dotActive()
	local dots = S{'Poison', 'Dia', 'Bio', 'Burn', 'Choke', 'Frost', 'Rasp', 'Shock', 'Drown'}
	for dot in dots do
		if buffactive[dot] then
			return true
		end
	end
	return false
end

--[[
	Handle use of stratagems by effect, regardless of which Arts is active
	Use: gs c scholar <stratagem>
--]]
function handle_strategems(cmdParams)
	if not cmdParams[2] then
		add_to_chat(123,'Error: No strategem command given.')
		return
	end
	local strategem = cmdParams[2]:lower()
	local magicType
	
	if buffactive['Light Arts'] or buffactive['Addendum: White'] then
		magicType = 'White Magic'
		if strategem == 'cost' then				send_command('@input /ja Penury <me>')
		elseif strategem == 'speed' then		send_command('@input /ja Celerity <me>')
		elseif strategem == 'aoe' then			send_command('@input /ja Accession <me>')
		elseif strategem == 'power' then		send_command('@input /ja Rapture <me>')
		elseif strategem == 'duration' then		send_command('@input /ja Perpetuance <me>')
		elseif strategem == 'accuracy' then		send_command('@input /ja Altruism <me>')
		elseif strategem == 'enmity' then		send_command('@input /ja Tranquility <me>')
		elseif strategem == 'light' then		send_command('@input /ja "Addendum: White" <me>')
		elseif strategem == 'dark' then			send_command('@input /ja "Dark Arts" <me>')
		else									add_to_chat(123,'Error: Unknown strategem ['..strategem..']') return
		end
	elseif buffactive['Dark Arts']  or buffactive['Addendum: Black'] then
		magicType = 'Black Magic'
		if strategem == 'cost' then				send_command('@input /ja Parsimony <me>')
		elseif strategem == 'speed' then		send_command('@input /ja Alacrity <me>')
		elseif strategem == 'aoe' then			send_command('@input /ja Manifestation <me>')
		elseif strategem == 'power' then		send_command('@input /ja Ebullience <me>')
		elseif strategem == 'duration' then		add_to_chat(122,'Error: Dark Arts does not have a duration strategem.') return
		elseif strategem == 'accuracy' then		send_command('@input /ja Focalization <me>')
		elseif strategem == 'enmity' then		send_command('@input /ja Equanimity <me>')
		elseif strategem == 'dark' then			send_command('@input /ja "Addendum: Black" <me>')
		elseif strategem == 'light' then		send_command('@input /ja "Light Arts" <me>')
		else									add_to_chat(123,'Error: Unknown strategem ['..strategem..']') return
		end
	else
		if strategem == 'dark' then				send_command('@input /ja "Dark Arts" <me>')
		elseif strategem == 'light' then		send_command('@input /ja "Light Arts" <me>')
		else									add_to_chat(123,'No arts has been activated yet.')
		end
		return
	end
	
	if strategem == 'cost' then					add_to_chat(207, 'Your next '..magicType..' spell will cost 50% less MP.')
	elseif strategem == 'speed' then			add_to_chat(207, 'Your next '..magicType..' spell will cast 50% faster.')
	elseif strategem == 'aoe' then				add_to_chat(207, 'Your next '..magicType..' spell will affect multiple targets.')
	elseif strategem == 'power' then
		local effectText
		if magicType == 'Black Magic' then		effectText = '20%'
		elseif magicType == 'White Magic' then	effectText = '50%'
		end
		add_to_chat(207, 'Your next '..magicType..' spell will be '..effectText..' more potent.')
	elseif strategem == 'duration' then			add_to_chat(207, 'Your next '..magicType..' spell will last twice as long.')
	elseif strategem == 'accuracy' then			add_to_chat(207, 'Your next '..magicType..' spell will be more accurate.')
	elseif strategem == 'enmity' then			add_to_chat(207, 'Your next '..magicType..' spell will generate less enmity.')
	end
end

-- Called when this job file is unloaded (eg: job change)
function file_unload()
	if binds_on_unload then binds_on_unload() end
end

-----------------------------------------------------------------------------------------------------------
-- Buff-cancelling utility functions.
-----------------------------------------------------------------------------------------------------------

local cancel_spells_to_check = S{'Sneak', 'Spectral Jig', 'Trance', 'Monomi: Ichi', 'Utsusemi: Ichi'}
local cancel_types_to_check = S{'Waltz', 'Samba'}

-- Function to cancel buffs if they'd conflict with using the spell you're attempting.
function cancel_conflicting_buffs(spell, action, spellMap, eventArgs)
	if cancel_spells_to_check:contains(spell.english) or cancel_types_to_check:contains(spell.type) then
		if spell.action_type == 'Ability' then
			local abil_recasts = windower.ffxi.get_ability_recasts()
			if abil_recasts[spell.index] > 0 then
				add_to_chat(123,'Cancel abort: Ability waiting on recast.')
				eventArgs.cancel = true
				return
			end
		elseif spell.action_type == 'Magic' then
			local spell_recasts = windower.ffxi.get_spell_recasts()
			if spell_recasts[spell.index] > 0 then
				add_to_chat(123,'Cancel abort: Spell waiting on recast.')
				eventArgs.cancel = true
				return
			end
		end
		
		if spell.english == 'Spectral Jig' and buffactive.sneak then
			cast_delay(0.2)
			send_command('cancel sneak')
		elseif spell.english == 'Sneak' and spell.target.type == 'SELF' and buffactive.sneak then
			send_command('cancel sneak')
		elseif (spell.english == 'Trance' or spell.type=='Waltz') and buffactive['saber dance'] then
			cast_delay(0.2)
			send_command('cancel saber dance')
		elseif spell.type=='Samba' and buffactive['fan dance'] then
			cast_delay(0.2)
			send_command('cancel fan dance')
		elseif spell.english:startswith('Monomi') then
			send_command('@wait 1.7;cancel sneak')
		elseif spell.english == 'Utsusemi: Ichi' then
			send_command('@wait 1.7;cancel copy image*')
		end
	end
end

-----------------------------------------------------------------------------------------------------------
-- Utility functions for changing target types and spells in an automatic manner.
-----------------------------------------------------------------------------------------------------------

-- Utility function for automatically adjusting the waltz spell being used to match the HP needs.
-- Handle spell changes before attempting any precast stuff.
-- Returns two values on completion:
-- 1) bool of whether the original spell was cancelled
-- 2) bool of whether the spell was changed to something new
function refine_waltz(spell, action, spellMap, eventArgs)
	if spell.type ~= 'Waltz' then return end
	if spell.name == "Healing Waltz" or spell.name == "Divine Waltz" or spell.name == "Divine Waltz II" then return end

	local newWaltz = spell.english
	local waltzID
	local missingHP
	
	if spell.target.type == "SELF" then
		missingHP = player.max_hp - player.hp
	elseif spell.target.isallymember then
		local target = find_player_in_alliance(spell.target.name)
		local est_max_hp = target.hp / (target.hpp/100)
		missingHP = math.floor(est_max_hp - target.hp)
	end
	
	-- If we can estimate missing HP, we can adjust the preferred tier used.
	if missingHP ~= nil then
		if missingHP < 40 and spell.target.name == player.name then
			add_to_chat(122,'Full HP!')
			eventArgs.cancel = true
			return
		elseif player.main_job == 'DNC' then
			if missingHP < 200 then			newWaltz = 'Curing Waltz'
				waltzID = 190
			elseif missingHP < 600 then		newWaltz = 'Curing Waltz II'	
				waltzID = 191
			elseif missingHP < 1100 then	newWaltz = 'Curing Waltz III'
				waltzID = 192
			elseif missingHP < 1500 then	newWaltz = 'Curing Waltz IV'
				waltzID = 193
			else							newWaltz = 'Curing Waltz V'
				waltzID = 311
			end
		elseif player.sub_job == 'DNC' then
			if missingHP < 150 then			newWaltz = 'Curing Waltz'
				waltzID = 190
			elseif missingHP < 300 then		newWaltz = 'Curing Waltz II'
				waltzID = 191
			else							newWaltz = 'Curing Waltz III'
				waltzID = 192
			end
		else
			return
		end
	end

	local waltzTPCost = {['Curing Waltz'] = 200, ['Curing Waltz II'] = 350, ['Curing Waltz III'] = 500, ['Curing Waltz IV'] = 650, ['Curing Waltz V'] = 800}
	local tpCost = waltzTPCost[newWaltz]
	
	local downgrade
	-- Downgrade the spell to what we can afford
	if player.tp < tpCost and not buffactive.trance then
		if player.tp < 200 then
			add_to_chat(122, 'Insufficient TP ['..tostring(player.tp)..']. Cancelling.')
			eventArgs.cancel = true
			return
		elseif player.tp < 350 then	newWaltz = 'Curing Waltz'
		elseif player.tp < 500 then	newWaltz = 'Curing Waltz II'
		elseif player.tp < 650 then	newWaltz = 'Curing Waltz III'
		elseif player.tp < 800 then	newWaltz = 'Curing Waltz IV'
		end
		downgrade = 'Insufficient TP ['..tostring(player.tp)..']. Downgrading to '..newWaltz..'.'
	end
	
	if newWaltz ~= spell.english then
		send_command('@input /ja "'..newWaltz..'" '..tostring(spell.target.raw))
		if downgrade then add_to_chat(122, downgrade) end
		eventArgs.cancel = true
		return
	end

	if missingHP > 0 then
		add_to_chat(122,'Trying to cure '..tostring(missingHP)..' HP using '..newWaltz..'.')
	end
end

-- Function to allow for automatic adjustment of the spell target type based on preferences.
function auto_change_target(spell, action, spellMap)
	-- Do not modify target for spells where we get <lastst> or <me>.
	if spell.target.raw == ('<lastst>') or spell.target.raw == ('<me>') then
		return
	end
	
	local eventArgs = {handled = false, PCTargetMode = state.PCTargetMode, SelectNPCTargets = state.SelectNPCTargets}

	-- Allow the job to do custom handling, or override the default values.
	-- They can completely handle it, or set one of the secondary eventArgs vars to selectively override the default state vars.
	if job_auto_change_target then
		job_auto_change_target(spell, action, spellMap, eventArgs)
	end
	
	if eventArgs.handled then return end
	
	local pcTargetMode = eventArgs.PCTargetMode
	local selectNPCTargets = eventArgs.SelectNPCTargets
	local validPlayers = S{'Self', 'Player', 'Party', 'Ally', 'NPC'}
	local intersection = spell.targets * validPlayers
	local canUseOnPlayer = not intersection:empty()
	
	local newTarget
	
	-- For spells that we can cast on players:
	if canUseOnPlayer and pcTargetMode ~= 'default' then
		if pcTargetMode == 'stal' then		-- Use <stal> if possible, otherwise fall back to <stpt>.
			if spell.targets.Ally then
				newTarget = '<stal>'
			elseif spell.targets.Party then
				newTarget = '<stpt>'
			end
		elseif pcTargetMode == 'stpt' then	-- Even ally-possible spells are limited to the current party.
			if spell.targets.Ally or spell.targets.Party then
				newTarget = '<stpt>'
			end
		elseif pcTargetMode == 'stpc' then	-- If it's anything other than a self-only spell, can change to <stpc>.
			if spell.targets.Player or spell.targets.Party or spell.targets.Ally or spell.targets.NPC then
				newTarget = '<stpc>'
			end
		end
	-- For spells that can be used on enemies:
	elseif spell.targets and spell.targets.Enemy and selectNPCTargets then
		-- Note: this means macros should be written for <t>, and it will change to <stnpc>
		-- if the flag is set.  It won't change <stnpc> back to <t>.
		newTarget = '<stnpc>'
	end
	
	-- If a new target was selected and is different from the original, call the change function.
	if newTarget and newTarget ~= spell.target.raw then
		change_target(newTarget)
	end
end

-----------------------------------------------------------------------------------------------------------
-- Environment utility functions.
-----------------------------------------------------------------------------------------------------------

-- Function to get the current weather intensity: 0 for none, 1 for single weather, 2 for double weather.
function get_weather_intensity()
	if world.weather_id <= 3 then
		return 0
	else
		return (world.weather_id % 2) + 1
	end
end

-----------------------------------------------------------------------------------------------------------
-- Utility functions for including local user files.
-----------------------------------------------------------------------------------------------------------

-- Attempt to load user gear files in place of default gear sets.
-- Return true if one exists and was loaded.
function load_user_gear(job)
	if not job then return false end
	-- filename format example for user-local files: whm_gear.lua, or playername_whm_gear.lua
	local filenames = {player.name..'_'..job..'_gear.lua', job..'_gear.lua'}
	return optional_include(filenames)
end

-- Attempt to include user-globals.  Return true if it exists and was loaded.
function load_user_globals()
	local filenames = {'globals.lua'}
	return optional_include(filenames)
end

-- Optional version of include().  If file does not exist, does not attempt to load, and does not throw an error.
-- filenames takes an array of possible file names to include and checks each one.
function optional_include(filenames)
	for _,v in pairs(filenames) do
		local path = gearswap.pathsearch({v})
		if path then
			include(v)
			return true
		end
	end
end

-----------------------------------------------------------------------------------------------------------
-- Utility functions for vars or other data manipulation.
-----------------------------------------------------------------------------------------------------------

-- Attempt to locate a specified name within the current alliance.
function find_player_in_alliance(name)
	for i,v in ipairs(alliance) do
		for k,p in ipairs(v) do
			if p.name == name then
				return p
			end
		end
	end
end

-- Invert a table such that the keys are values and the values are keys.
-- Use this to look up the index value of a given entry.
function invert_table(t)
	if t == nil then error('Attempting to invert table, received nil.', 2) end
	local i={}
	for k,v in pairs(t) do 
		i[v] = k
	end
	return i
end

-- Gets sub-tables based on baseSet from the string str that may be in dot form
-- (eg: baseSet=sets, str='precast.FC', this returns sets.precast.FC).
function get_expanded_set(baseSet, str)
	local cur = baseSet
	for i in str:gmatch("[^.]+") do
		cur = cur[i]
	end
	return cur
end