--------------------------------------------------------------------------------
--[[
	Author: Ragnarok.Lorand
	
	Songs can be cast with normal gear/instruments, normal gear +
	Terpander/Daurdabla, or fast recast gear + Terpander/Daurdabla.
	
	When the maximum number of active songs has been reached, the new song will
	always take the place of the one with the lowest remaining duration.
	Exploiting this, you can cast a 3rd song with Terpander/Daurdabla without
	any duration enhancing gear, and then overwrite it right away with a more
	desirable song while wearing duration enhancing / potency gear (and
	instrument).
	
	To cycle modes:			gs c cycle Daurdabla
	To set a specific mode:		gs c set Daurdabla Daurdabla
	
	Example usage in a macro, using Terpander/Daurdabla with normal gear:
	/console gs c set daurdabla Daurdabla
	/ma "Mage's Ballad" <stpc>
	
	Example macro, using Terpander/Daurdabla without duration enhancing gear:
	/console gs c set Daurdabla Dummy
	/ma "Army's Paeon" <stpc>
	
	All macros should be written with <stpc> because Pianissimo will
	automatically be used when the target is a player other than yourself.
	
	Gear layering order:
	
	if it's a dummy song {
	    sets.midcast.SongRecast
	    range=gear.instruments.multiSong
	} else if it's a normal song {
	    activeInstrument = gear.instruments.default
	    using daur/terp: activeInstrument = gear.instruments.multiSong
	    otherwise: activeInstrument = gear.instruments[spellMap] (if it exists)

	    if song is Threnody/Requiem/Lullaby/Elegy/Finale/Nocturne {
		sets.midcast.MagicAccuracy
	    } else {
		sets.midcast.Singing
		sets.midcast[instrumentSkill]
	    }

	    if not Finale {
		sets.midcast[SongDebuff/DaurdablaDummy/SongBuff]
		sets.midcast[SongDebuff/DaurdablaDummy/SongBuff][modes.casting]
		if troubadour is on: sets.midcast.SongDuration
	    }
	    
	    sets.midcast[spellMap]
	    sets.midcast[spellMap][modes.casting]
	    range=activeInstrument
	}
--]]
--------------------------------------------------------------------------------

function init_gear_sets()
	--============================================================
	--			Instruments
	--============================================================
	gear.instruments.multiSong = "Terpander"	--Adds an additional song effect
	gear.instruments.default = "Linos"		--All Songs +3 (+1 with +2 augment)
	gear.instruments.Requiem = "Requiem Flute"	--Requiem +4
	
	--============================================================
	--			Precast sets
	--============================================================
	sets.precast.FC = {}

	sets.precast.FC.Cure = {}
	sets.precast.FC.EnhancingMagic = {}

	sets.precast.FC.BardSong = {}
	
	sets.precast.FC.Lightning = {}
	
	sets.precast.JA.Nightingale = 	{}
	sets.precast.JA.Troubadour = 	{}
	sets.precast.JA['Soul Voice'] =	{}

	--============================================================
	
	sets.precast.Waltz = {}
	sets.wsBase = {}
	sets.wsBase.Magic = {}
	
	--============================================================
	--			Midcast sets
	--============================================================
	sets.midcast.FastRecast = {}
	
	--============================================================
	
	sets.midcast.Ballad =	{}
	sets.midcast.Lullaby =	{}
	sets.midcast.Madrigal =	{}
	sets.midcast.March =	{}
	sets.midcast.Minuet =	{}
	sets.midcast.Paeon =	{}
	sets.midcast.Scherzo =	{}
	
	sets.midcast.Singing = {}
	
	sets.midcast.Wind = {}
	
	sets.midcast.String = {}
	
	--This set is for extending party song buff duration
	sets.midcast.SongDuration = {}
	
	sets.midcast.SongBuff = sets.midcast.SongDuration
	
	--This set is for Daurdabla/Terpander dummy songs
	sets.midcast.SongRecast = {}
	
	sets.midcast.MagicAccuracy = {}
	
	-- For song debuffs (duration primary, accuracy secondary)
	sets.midcast.SongDebuff = {}

	-- For song debuffs (accuracy primary, duration secondary)
	sets.midcast.SongDebuff.Resistant = sets.midcast.MagicAccuracy

	--============================================================		
	
	sets.midcast.EnhancingMagic = {}
	sets.midcast.Aquaveil = {}
	
	sets.midcast.Stoneskin = {}
	
	sets.midcast.HealingMagic = {}
	sets.midcast.Cursna = {}
	
	sets.midcast.Cure = {}
	
	sets.midcast.DivineMagic = {}
	sets.midcast.DarkMagic = {}
	sets.midcast.ElementalMagic = {}
	
	--============================================================
	--			Other sets
	--============================================================
	
	sets.resting = {}
	
	sets.defense.DT = {}
	sets.defense.PDT = combineSets(sets.defense.DT, {})
	sets.defense.MDT = combineSets(sets.defense.DT, {})
	
	sets.idle = {}
	sets.idle.lowMP =	{}
	sets.idle.lowMP_night =	{}
	sets.idle.with_buff = {}
	sets.idle.with_buff['doom'] = {}
	
	sets.engaged = {}
	sets.engaged.with_buff = {}
	sets.engaged.with_buff['doom'] = {}
	sets.engaged.with_buff['reive mark'] = {}
end
