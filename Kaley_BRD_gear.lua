-----------------------------------------------------------------------------------------------------------
--[[
	Author: Ragnarok.Lorand
	
	Slips:
		1:	Marduk's Body
		2:	Loq Earring, Musical Earring
		3:	Twilight Torque
		8:	Aoidos' Matinee
		10:	Aoidos' (all)
		14:	Nares Cap/Hands/Legs
		15:	Brioso (all)
	<var name="WindInstruments">Iron Ram Horn|Pan's Horn|Harlequin's Horn|Cornette|Syrinx|Apollo's Flute|Shofar|Hellish Bugle +1|Crumhorn|Traversiere +1</var>
	<var name="StringInstruments">Terpander|Oneiros Harp|Crooner's Cithara|Vihuela|Sorrowful Harp</var>
	
--]]
-----------------------------------------------------------------------------------------------------------

function init_gear_sets()
	--============================================================
	--					Instruments
	--============================================================
	gear.Instruments.Ballad = "Eminent Flute"
	gear.Instruments.Carol = "Eminent Flute"
	gear.Instruments.Elegy = "Syrinx"
	gear.Instruments.Etude = "Eminent Flute"
	gear.Instruments.Finale = "Pan's Horn"
	gear.Instruments.Lullaby = "Pan's Horn"
	gear.Instruments.Madrigal = "Cantabank's Horn"
	gear.Instruments.Mambo = "Vihuela"
	gear.Instruments.March = "Eminent Flute"
	gear.Instruments.Mazurka = "Vihuela"
	gear.Instruments.Minne = "Syrinx"
	gear.Instruments.Minuet = "Apollo's Flute"
	gear.Instruments.Paeon = "Eminent Flute"
	gear.Instruments.Prelude = "Cantabank's Horn"
	gear.Instruments.Requiem = "Eminent Flute"
	gear.Instruments.Scherzo = "Terpander"
	gear.Instruments.Threnody = "Eminent Flute"
	
	--============================================================
	--					Precast sets
	--============================================================
	sets.precast.FC = {
		ammo="Impatiens",
		head="Nares Cap",		ear1="Loquacious Earring",
		body="Marduk's Jubbah",	hands="Gendewitha Gages",	ring1="Prolix Ring",
		back="Swith Cape",		waist="Witful Belt",		legs="Artsieq Hose",	feet="Chelona Boots"
	}

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {
		back="Pahtli Cape"
	})

	sets.precast.FC.EnhancingMagic = set_combine(sets.precast.FC, {
		waist="Siegel Sash"
	})

	sets.precast.FC.BardSong = set_combine(sets.precast.FC, {
		main="Felibre's Dague",		--6%
		head="Aoidos' Calot +2",	--12%
		neck="Aoidos' Matinee",		--3%
		body="Praeco Doublet",		--10%
		hands="Gendewitha Gages +1",--7%
		ear2="Aoidos' Earring",		--2%
		legs="Gendewitha Spats +1",	--6%
		feet="Bokwus Boots",		--6%
	})

	sets.precast.FC.Daurdabla = set_combine(sets.precast.FC.BardSong, {
		range="Terpander"
	})
	
	sets.precast.JA.Nightingale = 	{feet="Bard's Slippers +2"}
	sets.precast.JA.Troubadour = 	{}
	sets.precast.JA['Soul Voice'] =	{legs="Bard's Cannions +2"}

	--============================================================
	
	sets.precast.Waltz = {}
	sets.precast.WS = {}
	
	--============================================================
	--					Midcast sets
	--============================================================
	sets.midcast.FastRecast = set_combine(sets.precast.FC, {
		head="Kaabnax Hat",
		hands="Otomi Gloves",
		waist="Cetl Belt"
	})
	
	--============================================================
	
	sets.midcast.Ballad =	{legs="Aoidos' Rhingrave +2"}
	--sets.midcast.Lullaby =	{hands="Brioso Cuffs"}
	sets.midcast.Madrigal =	{head="Aoidos' Calot +2"}
	sets.midcast.March =	{hands="Aoidos' Manchettes +2"}
	sets.midcast.Minuet =	{body="Aoidos' Hongreline +2"}
	--sets.midcast.Paeon =	{head="Brioso Roundlet"}
	sets.midcast.Scherzo =	{feet="Aoidos' Cothurnes +2"}
	
	sets.midcast.MagicAccuracy = {
		main="Lehbrailg +2",
		head="Kaabnax Hat",		neck="Eddy Necklace",
		ring1="Sangoma Ring",		ring2="Perception Ring",
		legs="Artsieq Hose"
	}
	
	sets.midcast.Singing = set_combine(sets.midcast.MagicAcc, {
		head="Bard's Roundlet +2",		neck="Aoidos' Matinee",			ear2="Musical Earring",
		body="Aoidos' Hongreline +2",	hands="Brioso Cuffs",
		back="Swith Cape",				legs="Aoidos' Rhingrave +2",	feet="Brioso Slippers"
	})
	
	sets.midcast.Wind = {
		hands="Aoidos' Manchettes +2",
		legs="Brioso Cannions",			feet="Brioso Slippers"
	}
	
	sets.midcast.String = {
		head="Brioso Roundlet",
		body="Brioso Justaucorps",		hands="Aoidos' Manchettes +2",
		feet="Bihu Slippers"
	}
	
	sets.midcast.SongBuff = {
		main="Legato Dagger",			sub="Genbu's Shield",
		neck="Aoidos' Matinee",
		body="Aoidos' Hongreline +2",
		feet="Brioso Slippers"
	}
	
	sets.midcast.SongDebuff = {				-- For song debuffs (duration primary, accuracy secondary)
		main="Lehbrailg +2",
		sub="Mephitis Grip",
		head="Kaabnax Hat",
	}

	sets.midcast.ResistantSongDebuff = {	-- For song debuffs (accuracy primary, duration secondary)
	}

	sets.midcast.SongRecast = {}

	sets.midcast.Daurdabla = {
		range="Terpander"
	}

	-- Dummy song with Daurdabla; minimize duration to make it easy to overwrite.
	sets.midcast.DaurdablaDummy = {
		range="Terpander"
	}


	--============================================================
		
	
	sets.midcast.EnhancingMagic = {
		neck="Colossus's Torque",
		waist="Cascade Belt"
	}
	
	sets.midcast.EnhancingMagic.Aquaveil = {
		waist="Emphatikos Rope"
	}

	sets.midcast.Cure = {
		main="Arka IV",
		sub="Achaq Grip",
		head="Gendewitha Caubeen +1",
		neck="Fylgja Torque +1",
		ear1="Novia Earring",
		ear2="Star Earring",
		body="Gendewitha Bliaut +1",
		hands="Weatherspoon Cuffs",
		ring1="Aquasoul Ring",
		ring2="Aqua Ring",
		back="Oretania's Cape",
		waist="Cascade Belt",
		legs="Gendewitha Spats"
	}
	sets.midcast.Cure.with_buff = {}
	sets.midcast.Cure.with_buff['reive mark'] = {neck="Arciela's Grace +1"}
	
	sets.midcast.Stoneskin = {
		ear1="Star Earring",
		ear2="Earthcry Earring",
		neck="Stone Gorget",
		ring1="Aqua Ring",
		ring2="Aquasoul Ring",
		back="Tuilha Cape",
		waist="Siegel Sash",
		legs="Haven Hose"
	}
	
	sets.midcast.HealingMagic = {}
	sets.midcast.Cursna = set_combine(sets.midcast.HealingMagic, {
		neck="Malison Medallion",ring1="Ephedra Ring",ring2="Ephedra Ring"
	})
	
	--============================================================
	--					Other sets
	--============================================================
	
	sets.resting = {
		main="Boonwell Staff",
		body="Gendewitha Bliaut +1",
		legs="Nares Trews",
		feet="Chelona Boots +1"
	}
	
	sets.defense.DT = {}
	sets.defense.PDT = set_combine(sets.defense.DT, {
	})
	sets.defense.MDT = set_combine(sets.defense.DT, {
	})
	
	sets.idle = {
		main="Terra's Staff",		sub="Achaq Grip",
		head="Kaabnax Hat",		neck="Twilight Torque",		ear1="Novia Earring",	ear2="Ethereal Earring",
		body="Gendewitha Bliaut +1",	hands="Gendewitha Gages +1",ring1="Dark Ring",	ring2="Shneddick Ring",
		back="Cheviot Cape",		waist="Flume Belt",			legs="Nares Trews",		feet="Bihu Slippers"
	}
	sets.idle.Speedy = {}
	
	sets.idle.with_buff = {}
	sets.idle.with_buff['doom'] = {ring1="Saida Ring", ring2="Saida Ring"}
	
	sets.engaged = {}
	sets.engaged.with_buff = {}
	sets.engaged.with_buff['doom'] = {ring1="Saida Ring", ring2="Saida Ring"}
end