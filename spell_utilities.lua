-----------------------------------------------------------------------------------------------------------
--[[
	Author: Ragnarok.Lorand
	GearSwap utility functions that are related to specific spells or abilities.
--]]
-----------------------------------------------------------------------------------------------------------

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
	send_command('@wait '..(duration-15)..mtext..'15 seconds '..string.char(0x81, 0xA3))
	send_command('@wait '..(duration-5)..mtext..'5 seconds '..string.char(0x81, 0xA3))
end

--[[
	Allows the use of stratagems that are called by effect rather than name, allowing the same
	macros to be used for both Light and Dark arts.
	Usage: gs c scholar <stratagem>
--]]
function handle_strategems(cmdParams)
	if not cmdParams[2] then
		add_to_chat(123,'Error: No strategem command given.')
		return
	elseif not S{player.main_job, player.sub_job}:contains('SCH') then
		add_to_chat(123,'You cannot use stratagems without having Scholar as your main or sub job.')
		return
	end
	local strategem = cmdParams[2]:lower()
	
	local magicType = 'None'
	if buffactive['Light Arts'] or buffactive['Addendum: White'] then
		magicType = 'White Magic'
	elseif buffactive['Dark Arts']  or buffactive['Addendum: Black'] then
		magicType = 'Black Magic'
	end
	
	local stratagems = {
		['White Magic'] = {
			['dark']	=	'@input /ja "Dark Arts" <me>',	['light']	=	'@input /ja "Addendum: White" <me>',	['cost']	=	'@input /ja Penury <me>',
			['speed']	=	'@input /ja Celerity <me>',		['aoe']		=	'@input /ja Accession <me>',			['power']	=	'@input /ja Rapture <me>',
			['accuracy']=	'@input /ja Altruism <me>',		['enmity']	=	'@input /ja Tranquility <me>',			['duration']=	'@input /ja Perpetuance <me>',	
		},
		['Black Magic'] = {
			['light']	=	'@input /ja "Light Arts" <me>',	['dark']	=	'@input /ja "Addendum: Black" <me>',	['cost']	=	'@input /ja Parsimony <me>',
			['speed']	=	'@input /ja Alacrity <me>',		['aoe']		=	'@input /ja Manifestation <me>',		['power']	=	'@input /ja Ebullience <me>',
			['accuracy']=	'@input /ja Focalization <me>',	['enmity']	=	'@input /ja Equanimity <me>',
		},
		['None'] = {
			['light']	=	'@input /ja "Light Arts" <me>',	['dark']	=	'@input /ja "Dark Arts" <me>',
		},
	}
	local messages = {
		['cost']	=	' spell will cost 50% less MP.',	['speed']	=	' spell will cast 50% faster.',			['aoe']		=	' spell will affect multiple targets.',
		['duration']=	' spell will last twice as long.',	['accuracy']=	' spell will be more accurate.',		['enmity']	=	' spell will generate less enmity.',
	}
	
	if stratagems[magicType] ~= nil then
		if stratagems[magicType][stratagem] ~= nil then
			send_command(stratagems[magicType][stratagem])
		else
			add_to_chat(123,'Error: Unknown strategem ['..strategem..']')
		end
	else
		add_to_chat(123,'You must activate Light or Dark Arts before you can use a stratagem.')
	end
	
	if messages[stratagem] ~= nil then
		add_to_chat(207, 'Your next '..magicType..messages[stratagem])
	elseif stratagem == 'power' then
		local effectTexts = {['Black Magic']='20%',	['White Magic']='50%'}
		add_to_chat(207, 'Your next '..magicType..' spell will be '..effectTexts[magicType]..' more potent.')
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
function buffactive(...)
	local args = {...}
	for _,arg in ipairs(args) do
		if buffactive[arg] then
			local buff = res.buffs:with('name', arg)
			return buff
		end
	end
	return nil
end

--[[
	Returns true if it is not currently possible to perform the given action, false otherwise.
	When an action cannot be used, a message explaining the reason is added to the chat log.
--]]
function not_possible_to_use(spell)
	local activeDebuff = buffactive('Sleep', 'Petrification', 'Charm', 'Terror', 'Lullaby')
	if activeDebuff ~= nil then
		add_to_chat(166, 'Cancelling '..spell.name..' because you are '..activeDebuff.enl..'.')
		return true
	end
	
	if spell.action_type == 'Ability' then
		if buffactive['Amnesia'] then
			add_to_chat(166, 'Cancelling '..spell.en..' because you are amnesic.')
			return true
		end
		local abil_recasts = windower.ffxi.get_ability_recasts()
		if spell.type == 'WeaponSkill' then
			if player.tp < 1000 and player.status == 'Engaged' then
				add_to_chat(166, 'Cancelling '..spell.en..' because TP is too low ('..player.tp..').')
				return true
			end
		elseif spell.type == 'Scholar' then
			if get_available_stratagem_count() == 0 then
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
		if buffactive('Silence', 'Mute') then
			add_to_chat(123, string.char(0x81, 0xA3)..' Cancelling '..spell.en..' because you are silenced. '..string.char(0x81, 0xA3))
			return true
		end
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