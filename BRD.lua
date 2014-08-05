-----------------------------------------------------------------------------------------------------------
--[[
	Author: Ragnarok.Lorand
	
	Songs can be cast with normal gear/instruments, normal gear + Terpander/Daurdabla,
	or fast recast gear + Terpander/Daurdabla.
	
	When the maximum number of active songs has been reached, the new song will always take the place of
	the one with the lowest remaining duration.  Exploiting this, you can cast a 3rd song with
	Terpander/Daurdabla without any duration enhancing gear, and then overwrite it right away with a more
	desirable song while wearing duration enhancing / potency gear (and instrument).
	
	To cycle modes:				gs c cycle daurdabla
	To set a specific mode:		gs c set daurdabla Daurdabla
	
	Example usage in a macro, using Terpander/Daurdabla with normal gear:
	/console gs c set daurdabla Daurdabla
	/ma "Mage's Ballad" <stpc>
	
	Example usage in a macro, using Terpander/Daurdabla without duration enhancing gear:
	/console gs c set daurdabla Dummy
	/ma "Army's Paeon" <stpc>
	
	All macros should be written with <stpc> because Pianissimo will automatically be used when the target
	is a player other than yourself.
--]]
-----------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
	include('mage_utils.lua')
	include('include.lua')
end

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
	set_modes()
	refresh_keybindings()
	send_command('bind @2 gs c cycle DaurdablaMode')
	send_command('bind ^` input /ja "Nightingale" <me>')
	send_command('bind !` input /ja "Troubadour" <me>')
	
	gear.Instruments = {}
	gear.Instruments.MultiSong = "Terpander"
	
	--Define the number of extra songs that are available
	if gear.Instruments.MultiSong == "Terpander" then
		info.DaurdablaSongs = 1
	elseif gear.Instruments.MultiSong == "Daurdabla" then
		info.DaurdablaSongs = 2
	else
		info.DaurdablaSongs = 0
	end
	
	state.AutoDaurdabla = false		--Try to use Daurdabla when not explicitly ordered to
end

-------------------------------------------------------------------------------------------------------------------
-- Job- versions of event handlers, allowing overriding default handling.
-------------------------------------------------------------------------------------------------------------------

function get_instrument_type(spellMap)
	local i = gear.Instruments[spellMap]
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
		if state.CastingMode == 'Resistant' then
			return 'ResistantSongDebuff'
		else
			return 'SongDebuff'
		end
	elseif state.DaurdablaMode == 'Dummy' then
		return 'DaurdablaDummy'
	else
		return 'SongBuff'
	end
end

-------------------------------------------------------------------------------------------------------------------
-- Hooks for Daurdabla mode handling.
-------------------------------------------------------------------------------------------------------------------

-- Request job-specific mode tables.
-- Return true on the third returned value to indicate an error: that we didn't recognize the requested field.
function job_get_mode_list(field)
	if field == 'Daurdabla' then
		if player.inventory.daurdabla or player.inventory.terpander then
			return options.DaurdablaModes, state.DaurdablaMode
		end
	end
end

-- Set job-specific mode values.
-- Return true if we recognize and set the requested field.
function job_set_mode(field, val)
	if field == 'Daurdabla' then
		state.DaurdablaMode = val
		return true
	end
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Function to create custom buff-remaining timers with the Timers plugin,
-- keeping only the actual valid songs rather than spamming the default
-- buff remaining timers.
function adjust_Timers(spell, action, spellMap)
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
		if player.equipment.range == gear.Instruments.MultiSong then
			maxsongs = maxsongs + info.DaurdablaSongs
		end
		if buffactive['Clarion Call'] then
			maxsongs = maxsongs+1
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

function get_song_mult(spellName, spellMap)
	local mult = 1
	if player.equipment.range == "Eminent Flute"		then mult = mult + 0.2 end
	if player.equipment.range == "Daurdabla"			then mult = mult + 0.3 end -- change to 0.25 with 90 Daur
	if player.equipment.range == "Gjallarhorn"			then mult = mult + 0.4 end -- change to 0.3 with 95 Gjall
	
	
	if player.equipment.main == "Carnwenhan"			then mult = mult + 0.1 end -- 0.1 for 75, 0.4 for 95, 0.5 for 99/119
	if player.equipment.main == "Legato Dagger"			then mult = mult + 0.1 end
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
	-- Tweak for inaccuracies in cast vs aftercast timing
	--mult = mult - 0.05
	local totalDuration = mult*120
	return totalDuration
end

function daur_song_gap()
	if player.inventory.daurdabla or player.inventory.terpander then
		-- Figure out how many songs we can maintain.
		local maxsongs = 2 + info.DaurdablaSongs
		local activesongs = table.length(timer_reg)
		
		-- If we already have at least 2 songs on, but not enough to max out
		-- on possible Daur songs, flag us as Daur-ready.
		if activesongs >= 2 and activesongs < maxsongs then
			return true
		end
	end
	
	return false
end