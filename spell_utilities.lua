--------------------------------------------------------------------------------
--[[
	Author: Ragnarok.Lorand
	GearSwap utility functions that are related to specific spells or
	abilities.
--]]
--------------------------------------------------------------------------------

local cure2num = {['Cure'] = 1, ['Cure II'] = 2, ['Cure III'] = 3, ['Cure IV'] = 4, ['Cure V'] = 5, ['Cure VI'] = 6}
local num2cure = {'Cure','Cure II','Cure III','Cure IV','Cure V','Cure VI'}
local strat_charge_time = {240,120,80,60,48}

--[[
	Lower the tier of the cure spell being cast if the spell target's HP warrants it.
	Returns true when the spell is changed, otherwise false.
--]]
function modify_cure(spell)
	if not modes.ConserveMP then return false end
	local cnum = cure2num[spell.name]
	if (cnum == nil) or (cnum == 1) then return false end
	
	--Modify the cure tier based on the amount of HP missing from the cure target
	local targ = get_ally_info(spell.target.name)
	if targ == nil then return false end
	local hpMissing = (targ.hp/(targ.hpp/100)) - targ.hp
	
	local ncnum = get_tier_for_hp(cnum, hpMissing)
	ncnum = get_tier_for_mp(ncnum)
	
	local cspell = gearswap.res.spells:with('en', num2cure[ncnum])
	local crecast = windower.ffxi.get_spell_recasts()[cspell.id] or 0
	if (crecast > 0) and (ncnum > 1) then
		ncnum = ncnum - 1
	end
	if ncnum == cnum then return false end
	
	windower.send_command('input /ma "'..num2cure[ncnum]..'" '..spell.target.name)
	return true
end

--[[
	Returns the cure tier to use to heal the target with the available MP.
--]]
function get_tier_for_mp(cureTier)
	local ncnum = cureTier
	local mpMult = 1
	local grimoire = getGrimoire()
	if grimoire ~= nil then
		if grimoire == 'LA' then
			mpMult = 0.9
			if buff_active('Penury') then
				mpMult = 0.5
			end
		else
			mpMult = 1.1
		end
	end
	
	local spell = gearswap.res.spells:with('en', num2cure[ncnum])
	while (spell.mp_cost * mpMult) > player.mp do
		if ncnum > 1 then
			ncnum = ncnum - 1
			spell = gearswap.res.spells:with('en', num2cure[ncnum])
		end
	end
	return ncnum
end

--[[
	Returns the cure tier to use to adequately heal the spell target without wasting MP.
--]]
function get_tier_for_hp(cureTier, hpMissing)
	if (cureTier == 1) then return cureTier end		--Skip this if the tier is already 1
	local tier = cureTier					--Set the Cure tier to the given tier
	local potency = vars.CurePotency[tier]			--Retrieve the Cure potency for the given tier
	local pdelta = potency - vars.CurePotency[tier-1]	--Calculate the potency difference between this tier and the next lowest tier
	local threshold = potency - (pdelta * 0.5)		--Calculate the value to compare the amount of missing HP to
	while hpMissing < threshold do				--Iterate while the current Cure tier is higher than necessary
		tier = tier - 1						--Decrement the tier
		if tier > 1 then					--If the tier is high enough
			potency = vars.CurePotency[tier]			--Retrieve the Cure potency for the new tier
			pdelta = potency - vars.CurePotency[tier-1]		--Recalculate the potency difference
			threshold = potency - (pdelta * 0.5)			--Recalculate the comparison value
		else							--Otherwise
			threshold = 0						--Break out of the loop
		end
	end
	return tier
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
		if S{'Foe Lullaby','Horde Lullaby'}:contains(spell.en) then
			duration = 30 * songMult
		else
			duration = 60 * songMult
		end
	else
		return
	end
	
	if spell.type == 'WhiteMagic' and buff_active('Perpetuance') then
		duration = duration * 2
	end
	mtext = '; gs c atc 123 <wtriangle> '..spell.english..' on '..spell.target.name..' is wearing off in '
	windower.send_command('wait '..(duration-15)..mtext..'15 seconds <wtriangle>')
	windower.send_command('wait '..(duration-5)..mtext..'5 seconds <wtriangle>')
end

--[[
	Allows the use of stratagems that are called by effect rather than name, allowing the same
	macros to be used for both Light and Dark arts.
	Usage: gs c scholar <stratagem>
--]]
function handle_strategems(cmdParams)
	if not cmdParams[1] then
		atc(123,'Error: No strategem command given.')
		return
	elseif not S{player.main_job, player.sub_job}:contains('SCH') then
		atc(123,'You cannot use stratagems without having Scholar as your main or sub job.')
		return
	end
	local stratagem = cmdParams[1]:lower()
	
	local magicType = 'None'
	if buff_active('Light Arts', 'Addendum: White') then
		magicType = 'White Magic'
	elseif buff_active('Dark Arts', 'Addendum: Black') then
		magicType = 'Black Magic'
	end
	
	local stratagems = {
		['White Magic'] = {
			['dark']=	'input /ja "Dark Arts" <me>',	['light']=	'input /ja "Addendum: White" <me>',	['cost']=	'input /ja Penury <me>',
			['speed']=	'input /ja Celerity <me>',	['aoe']	=	'input /ja Accession <me>',		['power']=	'input /ja Rapture <me>',
			['accuracy']=	'input /ja Altruism <me>',	['enmity']=	'input /ja Tranquility <me>',		['duration']=	'input /ja Perpetuance <me>',	
		},
		['Black Magic'] = {
			['light']=	'input /ja "Light Arts" <me>',	['dark']=	'input /ja "Addendum: Black" <me>',	['cost']=	'input /ja Parsimony <me>',
			['speed']=	'input /ja Alacrity <me>',	['aoe']	=	'input /ja Manifestation <me>',		['power']=	'input /ja Ebullience <me>',
			['accuracy']=	'input /ja Focalization <me>',	['enmity']=	'input /ja Equanimity <me>',		['ws']=		'input /ja Immanence <me>'
		},
		['None'] = {['light']=	'input /ja "Light Arts" <me>',	['dark']=	'input /ja "Dark Arts" <me>'}
	}
	local messages = {
		['cost']=	' spell will cost 50% less MP.',	['speed']=	' spell will cast 50% faster.',		['aoe']	=	' spell will affect multiple targets.',
		['duration']=	' spell will last twice as long.',	['accuracy']=	' spell will be more accurate.',	['enmity']=	' spell will generate less enmity.',
	}
	
	if (stratagems[magicType] ~= nil) then
		if (stratagems[magicType][stratagem] ~= nil) then
			windower.send_command(stratagems[magicType][stratagem])
		else
			atc(123,'Error: Unknown strategem ['..tostring(strategem)..']')
		end
	else
		atc(123,'You must activate Light or Dark Arts before you can use a stratagem.')
	end
	
	if (messages[stratagem] ~= nil) then
		atc(207, 'Your next '..magicType..messages[stratagem])
	elseif (stratagem == 'power') then
		local effectTexts = {['Black Magic']='20%',['White Magic']='50%'}
		atc(207, 'Your next '..magicType..' spell will be '..effectTexts[magicType]..' more potent.')
	end
end

--[[
	Returns true if the proper grimoire is in use for the given spell, false otherwise.
--]]
function matchesGrimoire(spell)
	if (spell.type == 'WhiteMagic') then
		return getGrimoire() == 'LA'
	elseif (spell.type == 'BlackMagic') then
		return getGrimoire() == 'DA'
	else
		return false
	end
end

function getGrimoire()
	if buff_active('Light Arts', 'Addendum: White') then
		return 'LA'
	elseif buff_active('Dark Arts', 'Addendum: Black') then
		return 'DA'
	else
		return nil
	end
end

function weatherPermits(element)
	return buff_active(elements.storm_of[element]) or (element == world.day_element) or (element == world.weather_element)
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

function stratagems_available()
	return get_available_stratagem_count() > 0
end

--[[
	Returns the table from resources that contains information about the
	first buff from the given list that was found in the list of active
	buffs.  If none of the given buffs are active, it returns nil.
--]]
function buff_active(...)
	local args = S{...}:map(string.lower)
	for _,buffid in pairs(player.buffs) do
		local buff = gearswap.res.buffs[buffid]
		if args:contains(buff.en:lower()) then
			return buff
		end
	end
	return nil
end

function modify_spell(spell)
	if ((player.main_job == 'WHM') and modes.autoCaress) then
		if (spell_maps[spell.en] == 'StatusRemoval') and (not S{'Erase', 'Esuna'}:contains(spell.en)) then
			local xrecast = getRecast('Divine Caress') or -1
			if (not buff_active('Divine Caress')) and (xrecast == 0) then
				windower.send_command('input /ja "Divine Caress" <me>; wait 1.25; input /ma "'..spell.en..'" '..spell.target.name)
				return true
			end
		end
	elseif (player.main_job == 'NIN') and options.autoSan then	--Swap Ni for San
		if (spell.id == 339) and Assert.has_learned(res.spells[340]) then
			local rc = getRecast('Utsusemi: San') or -1
			if (rc == 0) then
				windower.send_command('input /ma "Utsusemi: San" <me>')
				return true
			end
		end
	end
	return false
end

function getRecast(spell)
	local xtype = nil
	local xid = nil
	if type(spell) == 'table' then
		xtype = spell.action_type
		xid = spell.recast_id
	elseif type(spell) == 'string' then
		local xspell = gearswap.res.spells:with('en', spell)
		local xabil = gearswap.res.ability_recasts:with('en', spell)
		if xspell ~= nil then
			xtype = 'Magic'
			xid = xspell.id
		elseif xabil ~= nil then
			xtype = 'Ability'
			xid = xabil.id
		end
	end
	if (xtype == nil) or (xid == nil) then return nil end
	local xtime = nil
	if xtype == 'Ability' then
		xtime = windower.ffxi.get_ability_recasts()[xid]
	elseif xtype == 'Magic' then
		xtime =  windower.ffxi.get_spell_recasts()[xid]
	end
	
	return xtime
end

--[[
	Returns true if it is not currently possible to perform the given action, false otherwise.
	When an action cannot be used, a message explaining the reason is added to the chat log.
--]]
function not_possible_to_use(spell)
	local activeDebuff = buff_active('Sleep', 'Petrification', 'Charm', 'Terror', 'Lullaby', 'Stun')
	if activeDebuff then
		atc(166, 'Cancelling '..spell.name..' because you are '..activeDebuff.enl..'.')
		return true
	end
	
	if spell.action_type == 'Ability' then
		if buff_active('Amnesia') then
			atc(166, 'Cancelling '..spell.en..' because you are amnesic.')
			return true
		end
		local abil_recasts = windower.ffxi.get_ability_recasts()
		if spell.type == 'WeaponSkill' then
			if player.tp < 1000 and player.status == 'Engaged' then
				atc(166, 'Cancelling '..spell.en..' because TP is too low ('..player.tp..').')
				return true
			end
		elseif spell.type == 'Scholar' then
			if get_available_stratagem_count() == 0 then
				atc(166, 'Cancelling '..spell.en..' because there are currently no stratagems available for use.')
				return true
			elseif buff_active(spell.en) then
				atc(166, 'Cancelling '..spell.en..' because it is already active.')
				return true
			end
		elseif (spell.type == 'Monster') and (player.main_job == 'BST') then
			local rctime = 30 - player.merits.sic_recast
			local remtime = abil_recasts[spell.recast_id] - (rctime * 2)
			if abil_recasts[spell.recast_id] and (remtime > 0) then
				atc(166, 'Unable to use '..spell.english..' at this time. Insufficient charges available. ['..remtime..'s remaining]')
				return true
			end
		elseif (spell.type == 'CorsairShot') then
			local rctime = 60 - player.merits.quick_draw_recast
			local remtime = abil_recasts[spell.recast_id] - rctime
			if abil_recasts[spell.recast_id] and (remtime > 0) then
				atc(166, 'Unable to use '..spell.english..' at this time. Insufficient charges available. ['..remtime..'s remaining]')
				return true
			end
		elseif abil_recasts[spell.recast_id] and abil_recasts[spell.recast_id] > 0 then
			atc(166, 'Unable to use '..spell.english..' at this time. ['..(abil_recasts[spell.recast_id])..'s remaining]')
			return true
		end
	elseif spell.action_type == 'Magic' then
		if buff_active('Silence', 'Mute') then
			atc(123, string.char(0x81, 0xA3)..' Cancelling '..spell.en..' because you are silenced. '..string.char(0x81, 0xA3))
			return true
		end
		local spell_recasts = windower.ffxi.get_spell_recasts()
		if spell_recasts[spell.id] > 0 then
			atc(166, 'Unable to cast '..spell.english..' at this time. ['..(spell_recasts[spell.id]/100)..'s remaining]')
			return true
		elseif (spell.target.charmed and not spell.target.is_npc) and spell.en:contains('Cur') then
			atc(166, 'Cancelling '..spell.en..' because '..spell.target.name..' is currently charmed.')
			return true
		elseif spell.en:contains('Utsusemi') then
			if buff_active('Copy Image (3)', 'Copy Image (4+)') then
				atc(57, 'Cancelled '..spell.en..' because 3 or more shadows are still active.')
				return true
			end
		end
	end
	return false
end

--[[
	Checks the given instrument name against lists of known instruments and returns the type.
	Valid types include String and Wind
--]]
function get_instrument_type(i)
	local item = res.items:with('en', i)
	if (item ~= nil) and (item.skill ~= nil) then
		if (item.skill == 41) then
			return 'String'
		elseif (item.skill == 42) then
			return 'Wind'
		end
	end
	return 'Singing'
end

function get_song_mult(spellName, spellMap)
	local mult = 1
	local instrumentEffects = instruments.effects[player.equipment.range]
	if (instrumentEffects ~= nil) then
		local val = instrumentEffects[spellMap] or instrumentEffects['All'] or 0
		mult = mult + (val/10)
	end
	
	for s,i in pairs(player.equipment) do
		if i ~= nil then
			local gearEffects = brdGearEffects[i]
			if gearEffects ~= nil then
				local aVal = gearEffects['All'] or 0
				local sVal = gearEffects[spellMap] or 0
				mult = mult + (aVal/10) + (sVal/10)
			end
		end
	end

	if buffactive.Troubadour then
		mult = mult*2
	end
	if spellName == "Sentinel's Scherzo" then
		if buff_active('Soul Voice') then
			mult = mult*2
		elseif buff_active('Marcato') then
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
		if buff_active('Clarion Call') then
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