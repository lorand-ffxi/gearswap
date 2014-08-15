-----------------------------------------------------------------------------------------------------------
--[[
	Author: Ragnarok.Lorand
	GearSwap utility functions that are related to specific spells or abilities.
--]]
-----------------------------------------------------------------------------------------------------------

local buffList = T(require('res/buffs'))
local cnums = {['Cure'] = 1, ['Cure II'] = 2, ['Cure III'] = 3, ['Cure IV'] = 4, ['Cure V'] = 5, ['Cure VI'] = 6}
local ncures = {[1] = '"Cure"', [2] = '"Cure II"', [3] = '"Cure III"', [4] = '"Cure IV"', [5] = '"Cure V"', [6] = '"Cure VI"'}
local strat_charge_time = {[1]=240,[2]=120,[3]=80,[4]=60,[5]=48}

--[[
	Lower the tier of the cure spell being cast if the spell target's HP warrants it.
	Returns true when the spell is changed, otherwise false.
--]]
function modify_cure(spell)
	if not modes.ConserveMP then return false end
	local cnum = cnums[spell.name]
	if (cnum == nil) or (cnum == 1) then return false end
	local potency = vars.CurePotency[cnum]
	
	local targ = get_ally_info(spell.target.name)
	if targ == nil then return false end
	local hpMissing = (targ.hp/(targ.hpp/100)) - targ.hp
	local ncnum = cnum
	if hpMissing < potency then
		local pdelta = potency - vars.CurePotency[ncnum-1]
		local threshold = potency - (pdelta * 0.5)
		while hpMissing < threshold do
			ncnum = ncnum - 1
			if ncnum > 1 then
				potency = vars.CurePotency[ncnum]
				pdelta = potency - vars.CurePotency[ncnum-1]
				threshold = potency - (pdelta * 0.5)
			else
				threshold = 0
			end
		end
	end
	if ncnum == cnum then return false end
	
	windower.send_command('input /ma '..ncures[ncnum]..' '..spell.target.name)
	return true
end

--[[
	Initiates a timer that gives 15 and 5 second warnings before a crowd control spell will wear off.
--]]
function initSleepTimer(spell, spellMap)
	local durations = {['Break'] = 30, ['Sleep I'] = 60, ['Sleep II'] = 90}
	local duration, mtext
	if spell.interrupted then
		return
	elseif durations[spellMap] ~= nil then
		duration = durations[spellMap]
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
	windower.send_command('wait '..(duration-15)..mtext..'15 seconds '..string.char(0x81, 0xA3))
	windower.send_command('wait '..(duration-5)..mtext..'5 seconds '..string.char(0x81, 0xA3))
end

--[[
	Allows the use of stratagems that are called by effect rather than name, allowing the same
	macros to be used for both Light and Dark arts.
	Usage: gs c scholar <stratagem>
--]]
function handle_strategems(cmdParams)
	if not cmdParams[1] then
		windower.add_to_chat(123,'Error: No strategem command given.')
		return
	elseif not S{player.main_job, player.sub_job}:contains('SCH') then
		windower.add_to_chat(123,'You cannot use stratagems without having Scholar as your main or sub job.')
		return
	end
	local stratagem = cmdParams[1]:lower()
	
	local magicType = 'None'
	if buffactive['Light Arts'] or buffactive['Addendum: White'] then
		magicType = 'White Magic'
	elseif buffactive['Dark Arts']  or buffactive['Addendum: Black'] then
		magicType = 'Black Magic'
	end
	
	local stratagems = {
		['White Magic'] = {
			['dark']	=	'input /ja "Dark Arts" <me>',	['light']	=	'input /ja "Addendum: White" <me>',	['cost']	=	'input /ja Penury <me>',
			['speed']	=	'input /ja Celerity <me>',		['aoe']		=	'input /ja Accession <me>',			['power']	=	'input /ja Rapture <me>',
			['accuracy']=	'input /ja Altruism <me>',		['enmity']	=	'input /ja Tranquility <me>',		['duration']=	'input /ja Perpetuance <me>',	
		},
		['Black Magic'] = {
			['light']	=	'input /ja "Light Arts" <me>',	['dark']	=	'input /ja "Addendum: Black" <me>',	['cost']	=	'@input /ja Parsimony <me>',
			['speed']	=	'input /ja Alacrity <me>',		['aoe']		=	'input /ja Manifestation <me>',		['power']	=	'@input /ja Ebullience <me>',
			['accuracy']=	'input /ja Focalization <me>',	['enmity']	=	'input /ja Equanimity <me>',
		},
		['None'] = {['light'] = 'input /ja "Light Arts" <me>', ['dark'] = 'input /ja "Dark Arts" <me>'}
	}
	local messages = {
		['cost']	=	' spell will cost 50% less MP.',	['speed']	=	' spell will cast 50% faster.',		['aoe']		=	' spell will affect multiple targets.',
		['duration']=	' spell will last twice as long.',	['accuracy']=	' spell will be more accurate.',	['enmity']	=	' spell will generate less enmity.',
	}
	
	if stratagems[magicType] ~= nil then
		if stratagems[magicType][stratagem] ~= nil then
			windower.send_command(stratagems[magicType][stratagem])
		else
			windower.add_to_chat(123,'Error: Unknown strategem ['..strategem..']')
		end
	else
		windower.add_to_chat(123,'You must activate Light or Dark Arts before you can use a stratagem.')
	end
	
	if messages[stratagem] ~= nil then
		windower.add_to_chat(207, 'Your next '..magicType..messages[stratagem])
	elseif stratagem == 'power' then
		local effectTexts = {['Black Magic']='20%',	['White Magic']='50%'}
		windower.add_to_chat(207, 'Your next '..magicType..' spell will be '..effectTexts[magicType]..' more potent.')
	end
end

--[[
	Returns true if the proper grimoire is in use for the given spell, false otherwise.
--]]
function matchesGrimoire(spell)
	if spell.type == 'WhiteMagic' then
		return (buffactive['Light Arts'] or buffactive['Addendum: White'])
	elseif spell.type == 'BlackMagic' then
		return (buffactive['Dark Arts'] or buffactive['Addendum: Black'])
	else
		return false
	end
end

function weatherPermits(element)
	return buffactive[elements.storm_of[element]] or element == world.day_element or element == world.weather_element
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

--[[
	Returns the table from resources that contains information about the first buff from the given list
	that was found in the list of active buffs.  If none of the given buffs are active, it returns nil.
--]]
function buff_active(...)
	local args = {...}
	for _,arg in ipairs(args) do
		if buffactive[arg] then
			return buffList:with('en', arg)
		end
	end
	return nil
end

--[[
	Returns true if it is not currently possible to perform the given action, false otherwise.
	When an action cannot be used, a message explaining the reason is added to the chat log.
--]]
function not_possible_to_use(spell)
	local activeDebuff = buff_active('Sleep', 'Petrification', 'Charm', 'Terror', 'Lullaby', 'Stun')
	if activeDebuff then
		--add_to_chat(166, 'Cancelling '..spell.name..' because you are '..activeDebuff..'.')
		windower.add_to_chat(166, 'Cancelling '..spell.name..' because you are '..activeDebuff.enl..'.')
		return true
	end
	
	if spell.action_type == 'Ability' then
		if buffactive['Amnesia'] then
			windower.add_to_chat(166, 'Cancelling '..spell.en..' because you are amnesic.')
			return true
		end
		local abil_recasts = windower.ffxi.get_ability_recasts()
		if spell.type == 'WeaponSkill' then
			if player.tp < 1000 and player.status == 'Engaged' then
				windower.add_to_chat(166, 'Cancelling '..spell.en..' because TP is too low ('..player.tp..').')
				return true
			end
		elseif spell.type == 'Scholar' then
			if get_available_stratagem_count() == 0 then
				windower.add_to_chat(166, 'Cancelling '..spell.en..' because there are currently no stratagems available for use.')
				return true
			elseif buffactive[spell.en] then
				windower.add_to_chat(166, 'Cancelling '..spell.en..' because it is already active.')
				return true
			end
		elseif abil_recasts[spell.recast_id] and abil_recasts[spell.recast_id] > 0 then
			windower.add_to_chat(166, 'Unable to use '..spell.english..' at this time. ['..(abil_recasts[spell.recast_id])..'s remaining]')
			return true
		end
	elseif spell.action_type == 'Magic' then
		if buff_active('Silence', 'Mute') then
			windower.add_to_chat(123, string.char(0x81, 0xA3)..' Cancelling '..spell.en..' because you are silenced. '..string.char(0x81, 0xA3))
			return true
		end
		local spell_recasts = windower.ffxi.get_spell_recasts()
		if spell_recasts[spell.id] > 0 then
			windower.add_to_chat(166, 'Unable to cast '..spell.english..' at this time. ['..(spell_recasts[spell.id]/100)..'s remaining]')
			return true
		elseif spell.target.charmed and spell.en:contains('Cur') then
			windower.add_to_chat(166, 'Cancelling '..spell.en..' because '..spell.target.name..' is currently charmed.')
			return true
		elseif spell.en:contains('Utsusemi') then
			if buffactive['Copy Image (3)'] or buffactive['Copy Image (4+)'] then
				windower.add_to_chat(57, 'Cancelled '..spell.en..' because 3 or more shadows are still active.')
				return true
			end
		end
	end
	return false
end

function get_instrument_type(spellMap)
	local i = gear.instruments[spellMap]
	if instruments.string:contains(i) then
		return 'String'
	elseif instruments.wind:contains(i) then
		return 'Wind'
	else
		return 'Singing'
	end
end

-- Determine the custom class to use for the given song.
function get_song_class(spell)
	if spell.targets:contains('Enemy') then
		if modes.casting == 'Resistant' then
			return 'ResistantSongDebuff'
		else
			return 'SongDebuff'
		end
	elseif modes.Daurdabla == 'Dummy' then
		return 'DaurdablaDummy'
	else
		return 'SongBuff'
	end
end

function get_song_mult(spellName, spellMap)
	local mult = 1
	if player.equipment.range == "Eminent Flute"		then mult = mult + 0.2 end
	if player.equipment.range == "Daurdabla"			then mult = mult + 0.3 end -- change to 0.25 with 90 Daur
	if player.equipment.range == "Gjallarhorn"			then mult = mult + 0.4 end -- change to 0.3 with 95 Gjall
	
	
	if player.equipment.main == "Carnwenhan"			then mult = mult + 0.1 end -- 0.1 for 75, 0.4 for 95, 0.5 for 99/119
	if player.equipment.main == "Legato Dagger"			then mult = mult + 0.05 end
	if player.equipment.neck == "Aoidos' Matinee"		then mult = mult + 0.1 end
	if player.equipment.body == "Aoidos' Hongreline +2"	then mult = mult + 0.1 end
	if player.equipment.legs == "Marduk's Shalwar +1"	then mult = mult + 0.1 end
	if player.equipment.feet == "Brioso Slippers"		then mult = mult + 0.1 end
	if player.equipment.feet == "Brioso Slippers +1"	then mult = mult + 0.11 end
	
	if spellMap == 'Ballad'		and player.equipment.range == "Crooner's Cithara"		then mult = mult + 0.1 end
	if spellMap == 'Ballad'		and player.equipment.legs == "Aoidos' Rhingrave +2"		then mult = mult + 0.1 end
	if spellMap == 'Carol'		and player.equipment.range == "Crumhorn"				then mult = mult + 0.1 end
	if spellMap == 'Carol'		and player.equipment.range == "Crumhorn +1"				then mult = mult + 0.2 end
	if spellMap == 'Elegy'		and player.equipment.range == "Syrinx"					then mult = mult + 0.3 end
	if spellMap == 'Etude'		and player.equipment.range == "Rose Harp"				then mult = mult + 0.1 end
	if spellMap == 'Etude'		and player.equipment.range == "Rose Harp +1"			then mult = mult + 0.2 end
	if spellMap == 'Finale'		and player.equipment.range == "Pan's Horn"				then mult = mult + 0.3 end
	if spellMap == 'Lullaby'	and player.equipment.range == "Pan's Horn"				then mult = mult + 0.3 end
	if spellMap == 'Lullaby'	and player.equipment.hands == "Brioso Cuffs"			then mult = mult + 0.1 end
	if spellMap == 'Madrigal'	and player.equipment.range == "Traversiere +1"			then mult = mult + 0.2 end
	if spellMap == 'Madrigal'	and player.equipment.range == "Cantabank's Horn"		then mult = mult + 0.3 end
	if spellMap == 'Madrigal'	and player.equipment.head == "Aoidos' Calot +2"			then mult = mult + 0.1 end
	if spellMap == 'Mambo'		and player.equipment.range == "Vihuela"					then mult = mult + 0.3 end
	if spellMap == 'March'		and player.equipment.range == "Iron Ram Horn"			then mult = mult + 0.2 end
	if spellMap == 'March'		and player.equipment.hands == "Aoidos' Manchettes +2"	then mult = mult + 0.1 end
	if spellMap == 'Mazurka'	and player.equipment.range == "Vihuela"					then mult = mult + 0.3 end
	if spellMap == 'Minne'		and player.equipment.range == "Syrinx"					then mult = mult + 0.3 end
	if spellMap == 'Minuet'		and player.equipment.range == "Apollo's Flute"			then mult = mult + 0.3 end
	if spellMap == 'Minuet'		and player.equipment.body == "Aoidos' Hongreline +2"	then mult = mult + 0.1 end	--Note: gives Minuet+1 in addition to all songs duration+
	if spellMap == 'Paeon'		and player.equipment.range == "Oneiros Harp"			then mult = mult + 0.3 end
	if spellMap == 'Paeon'		and player.equipment.head == "Brioso Roundlet"			then mult = mult + 0.1 end
	if spellMap == 'Paeon'		and player.equipment.head == "Brioso Roundlet +1"		then mult = mult + 0.1 end
	if spellMap == 'Prelude'	and player.equipment.range == "Cantabank's Horn"		then mult = mult + 0.3 end
	if spellMap == 'Requiem'	and player.equipment.range == "Requiem Flute"			then mult = mult + 0.4 end
	if spellMap == 'Scherzo'	and player.equipment.feet == "Aoidos' Cothurnes +2"		then mult = mult + 0.1 end
	if spellMap == 'Threnody'	and player.equipment.range == "Sorrowful Harp"			then mult = mult + 0.3 end

	if buffactive.Troubadour then
		mult = mult*2
	end
	if spellName == "Sentinel's Scherzo" then
		if buffactive['Soul Voice'] then
			mult = mult*2
		elseif buffactive['Marcato'] then
			mult = mult*1.5
		end
	end
	return mult
end

-- Function to calculate the duration of a song based on the equipment used to cast it.
-- Called from adjust_Timers(), which is only called on aftercast().
function calculate_duration(spellName, spellMap)
	local mult = get_song_mult(spellName, spellMap) - 0.05
	local totalDuration = mult*120
	return totalDuration
end

--[[
	Function to create custom buff-remaining timers with the Timers plugin, keeping only the actual
	valid songs rather than spamming the default buff remaining timers.
--]]
function adjust_Timers(spell, spellMap)
	local t = os.time()
	
	-- Eliminate songs that have already expired from our local list.
	local tempreg = {}
	for i,v in pairs(timer_reg) do
		if v < t then tempreg[i] = true end
	end
	for i,v in pairs(tempreg) do
		timer_reg[i] = nil
	end
	
	local dur = calculate_duration(spell.name, spellMap)
	if timer_reg[spell.name] then
		-- Can delete timers that have less than 120 seconds remaining, since
		-- the new version of the song will overwrite the old one.
		-- Otherwise create a new timer counting down til we can overwrite.
		if (timer_reg[spell.name] - t) <= 120 then
			send_command('timers delete "'..spell.name..'"')
			timer_reg[spell.name] = t + dur
			send_command('timers create "'..spell.name..'" '..dur..' down')
		end
	else
		-- Figure out how many songs we can maintain.
		local maxsongs = 2
		if player.equipment.range == gear.instruments.multiSong then
			if gear.instruments.multiSong == 'Terpander' then
				maxsongs = maxsongs + 1
			else
				maxsongs = maxsongs + 2
			end
		end
		if buffactive['Clarion Call'] then
			maxsongs = maxsongs + 1
		end
		-- If we have more songs active than is currently apparent, we can still overwrite
		-- them while they're active, even if not using appropriate gear bonuses (ie: Daur).
		if maxsongs < table.length(timer_reg) then
			maxsongs = table.length(timer_reg)
		end
		
		-- Create or update new song timers.
		if table.length(timer_reg) < maxsongs then
			timer_reg[spell.name] = t+dur
			send_command('timers create "'..spell.name..'" '..dur..' down')
		else
			local rep,repsong
			for i,v in pairs(timer_reg) do
				if t+dur > v then
					if not rep or rep > v then
						rep = v
						repsong = i
					end
				end
			end
			if repsong then
				timer_reg[repsong] = nil
				send_command('timers delete "'..repsong..'"')
				timer_reg[spell.name] = t+dur
				send_command('timers create "'..spell.name..'" '..dur..' down')
			end
		end
	end
end