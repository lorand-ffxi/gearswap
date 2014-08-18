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
--[[
	Author: Ragnarok.Lorand
	
	Slips:
		1:	Marduk's Body
		2:	Loq Earring, Musical Earring
		3:	Twilight Torque
		8:	Aoidos' Matinee/Earring
		10:	Aoidos' (all)
		14:	Nares Hands/Legs, Marduk's+1 Legs
		15:	Brioso (all)
		17:	Bihu (all)
--]]
-----------------------------------------------------------------------------------------------------------

function init_gear_sets()
	--============================================================
	--					Instruments
	--============================================================
	gear.instruments.multiSong = "Terpander"
	gear.instruments.default = "Eminent Flute"
	
	gear.instruments.Ballad		= "Crooner's Cithara"
	gear.instruments.Carol		= "Crumhorn +1"
	gear.instruments.Elegy		= "Syrinx"
	gear.instruments.Etude		= "Rose Harp +1"
	gear.instruments.Finale		= "Pan's Horn"
	gear.instruments.Lullaby	= "Pan's Horn"
	gear.instruments.Madrigal	= "Cantabank's Horn"
	gear.instruments.Mambo		= "Vihuela"
	gear.instruments.March		= "Iron Ram Horn"
	gear.instruments.Mazurka	= "Vihuela"
	gear.instruments.Minne		= "Syrinx"
	gear.instruments.Minuet		= "Apollo's Flute"
	gear.instruments.Paeon		= "Oneiros Harp"
	gear.instruments.Prelude	= "Cantabank's Horn"
	gear.instruments.Requiem	= "Requiem Flute"
	gear.instruments.Scherzo	= "Terpander"
	gear.instruments.Threnody	= "Sorrowful Harp"
	
	--============================================================
	--					Precast sets
	--============================================================
	sets.precast.FC = {				--46%
		head="Nahtirah Hat",		--10%
		neck="Orunmila's Torque",	--5%
		ear1="Loquacious Earring",	--2%
		body="Marduk's Jubbah",		--5%
		hands="Gendewitha Gages +1",--7%
		ring1="Prolix Ring",		--2%
		ring2="Veneficium Ring",	--Q+1%
		back="Swith Cape",			--3%
		waist="Witful Belt",		--3%
		legs="Artsieq Hose",		--5%
		feet="Chelona Boots"		--4%
	}

	sets.precast.FC.Cure = {		--54%
		main="Felibre's Dague",		--0%
		sub="Genbu's Shield",		--8%
		back="Pahtli Cape"			--8%
	}
	sets.precast.FC.EnhancingMagic = {	--46%
		waist="Siegel Sash"			--8%
	}

	sets.precast.FC.BardSong = {	--73%
		main="Felibre's Dague",		--6%
		sub="Genbu's Shield",		--0%
		head="Aoidos' Calot +2",	--12%
		neck="Orunmila's Torque",	--5%
		ear1="Loquacious Earring",	--2%
		ear2="Aoidos' Earring",		--2%
		body="Sha'ir Manteel",		--12%
		hands="Gendewitha Gages +1",--11%	(song spellcasting time -4% augment)
		ring1="Prolix Ring",		--2%
		ring2="Veneficium Ring",	--Q+1%
		back="Swith Cape",			--3%
		waist="Witful Belt",		--3%
		legs="Gendewitha Spats +1",	--8%	(song spellcasting time -3% augment)
		feet="Bihu Slippers"		--7%
	}
	
	sets.precast.FC.Lightning = {main="Apamajas I"}
	
	sets.precast.JA.Nightingale = 	{feet="Bihu Slippers"}
	sets.precast.JA.Troubadour = 	{body="Bihu Justaucorps"}
	sets.precast.JA['Soul Voice'] =	{legs="Bihu Cannions"}

	--============================================================
	
	sets.precast.Waltz = {}
	sets.wsBase = {}
	sets.wsBase.Magic = {}
	
	--============================================================
	--					Midcast sets
	--============================================================
	sets.midcast.FastRecast = {
		range="empty",			ammo="empty",
		head="Kaabanax Hat",	neck="Orunmila's Torque",		ear1="Loquacious Earring",
		body="Marduk's Jubbah",	hands="Gendewitha Gages +1",	ring1="Prolix Ring",
		back="Swith Cape",		waist="Cetl Belt",				legs="Artsieq Hose",	feet="Chelona Boots"
	}
	
	--============================================================
	
	sets.midcast.Ballad =	{legs="Aoidos' Rhingrave +2"}
	sets.midcast.Lullaby =	{hands="Brioso Cuffs"}
	sets.midcast.Madrigal =	{head="Aoidos' Calot +2"}
	sets.midcast.March =	{hands="Aoidos' Manchettes +2"}
	sets.midcast.Minuet =	{body="Aoidos' Hongreline +2"}
	sets.midcast.Paeon =	{head="Brioso Roundlet"}
	sets.midcast.Scherzo =	{feet="Aoidos' Cothurnes +2"}
	
	sets.midcast.Singing = {
		head="Bihu Roundlet",			neck="Aoidos' Matinee",			ear2="Musical Earring",
		body="Brioso Justaucorps",		hands="Brioso Cuffs",
		legs="Aoidos' Rhingrave +2",	feet="Brioso Slippers"
	}
	
	sets.midcast.Wind = {
		hands="Aoidos' Manchettes +2",
		body="Aoidos' Hongreline +2",	hands="Aoidos' Manchettes +2",
		back="Rhapsode's Cape",			legs="Brioso Cannions",			feet="Brioso Slippers"
	}
	
	sets.midcast.String = {
		head="Brioso Roundlet",
		body="Brioso Justaucorps",		hands="Aoidos' Manchettes +2",
		feet="Bihu Slippers"
	}
	
	--This set is for extending party song buff duration
	sets.midcast.SongBuff = {	--Song duration + 45%
		main="Legato Dagger",			--5%
		sub="Genbu's Shield",			--n/a
		neck="Aoidos' Matinee",			--10%
		body="Aoidos' Hongreline +2",	--10%
		legs="Marduk's Shalwar +1",		--10%
		feet="Brioso Slippers"			--10%
	}
	
	--This set is for Daurdabla/Terpander dummy songs
	sets.midcast.SongRecast = {
		main="Felibre's Dague",			sub="Genbu's Shield",
		head="Gendewitha Caubeen +1",	neck="Orunmila's Torque",	ear1="Loquacious Earring",	ear2="Novia Earring",
		body="Marduk's Jubbah",			hands="Buremte Gloves",		ring1="Prolix Ring",
		back="Swith Cape",				waist="Witful Belt",		legs="Artsieq Hose",		feet="Bihu Slippers"
	}
	
	sets.midcast.MagicAcc = {
		main="Lehbrailg +2",		sub="Mephitis Grip",
		head="Bihu Roundlet",		neck="Stoicheion Medal",	ear1="Lifestorm Earring",	ear2="Psystorm Earring",
		body="Brioso Justaucorps",	hands="Lurid Mitts",		ring1="Balrahn's Ring",		ring2="Perception Ring",
		back="Rhapsode's Cape",		legs="Bihu Cannions",		feet="Bokwus Boots"
	}
	
	sets.midcast.SongDebuff = {				-- For song debuffs (duration primary, accuracy secondary)
		main="Lehbrailg +2",		sub="Mephitis Grip",
		neck="Aoidos' Matinee",
		body="Brioso Justaucorps",
		legs="Marduk's Shalwar +1",	feet="Brioso Slippers"
	}

	sets.midcast.ResistantSongDebuff = {	-- For song debuffs (accuracy primary, duration secondary)
	}

	--============================================================		
	
	sets.midcast.EnhancingMagic = {
		neck="Colossus's Torque",
		body="Hyksos Robe",
		waist="Cascade Belt"
	}
	sets.midcast.Aquaveil = {waist="Emphatikos Rope"}
	
	sets.midcast.Stoneskin = {
		neck="Stone Gorget",	ear1="Star Earring",	ear2="Earthcry Earring",
		ring1="Aqua Ring",		ring2="Aquasoul Ring",
		back="Tuilha Cape",		waist="Siegel Sash",	legs="Haven Hose"
	}
	
	sets.midcast.HealingMagic = {}
	sets.midcast.Cursna = {
		neck="Malison Medallion",
		ring1="Ephedra Ring",		ring2="Ephedra Ring"
	}
	
	sets.midcast.Cure = {
		main="Arka IV",					sub="Achaq Grip",
		head="Gendewitha Caubeen +1",	neck="Orunmila's Torque",		ear1="Novia Earring",		ear2="Star Earring",
		body="Gendewitha Bliaut +1",	hands="Weatherspoon Cuffs +1",	ring1="Aquasoul Ring",		ring2="Aqua Ring",
		back="Oretania's Cape",			waist="Cascade Belt",			legs="Gendewitha Spats +1",	feet="Bihu Slippers"
	}
	
	--============================================================
	--					Other sets
	--============================================================
	
	sets.resting = {
		main="Chatoyant Staff",			sub="Elder's Grip",			ammo="Kalboron Stone",
		head="Nahtirah Hat",			neck="Eidolon Pendant",		ear1="Loquacious Earring",	ear2="Relaxing Earring",
		body="Gendewitha Bilaut +1",	hands="Nares Cuffs",		ring1="Defending Ring",		ring2="Sheltered Ring",
		back="Felicitas Cape",			waist="Emphatikos Rope",	legs="Nares Trews",			feet="Chelona Boots"
	}
	
	sets.defense.DT = {}
	sets.defense.PDT = combineSets(sets.defense.DT, {
	})
	sets.defense.MDT = combineSets(sets.defense.DT, {
	})
	
	sets.idle = {
		main="Terra's Staff",			sub="Achaq Grip",				range="Oneiros Harp",
		head="Kaabnax Hat",				neck="Twilight Torque",			ear1="Novia Earring",	ear2="Ethereal Earring",
		body="Gendewitha Bilaut +1",	hands="Gendewitha Gages +1",	ring1="Defending Ring",	ring2="Sheltered Ring",
		back="Cheviot Cape",			waist="Flume Belt",				legs="Bihu Cannions",	feet="Bihu Slippers"
	}
	sets.idle.lowMP =		{legs="Nares Trews"}
	sets.idle.lowMP_night =	{hands="Serpentes Cuffs"}
	sets.idle.speedy =		{feet="Aoidos' Cothurnes +2"}
	sets.idle.with_buff = {}
	
	sets.engaged = {
		main="Leisilonu +2",
		head="Kaabanax Hat",		neck="Asperity Necklace",	ear1="Bladeborn Earring",	ear2="Steelflash Earring",
		body="Bihu Justaucorps",	hands="Otomi Gloves",		ring1="Rajas Ring",			ring2="Mars's Ring",
		back="Atheling Mantle",		waist="Cetl Belt",			legs="Bihu Cannions",		feet="Brioso Slippers"
	}
	sets.engaged.with_buff = {}
end