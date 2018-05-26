-----------------------------------------------------------------------------------------------------------
--[[
	Author: Ragnarok.Lorand
--]]
-----------------------------------------------------------------------------------------------------------

function init_gear_sets()
	--============================================================
	--			Instruments
	--============================================================
	gear.instruments.multiSong = "Terpander"	--Adds an additional song effect
	gear.instruments.default = "Linos"		    --All Songs +2 (+1 with +1 augment)
	gear.instruments.Elegy = "Syrinx"
	gear.instruments.Finale = "Pan's Horn"
	gear.instruments.Lullaby = "Pan's Horn"
	gear.instruments.Madrigal = "Cantabank's Horn"
	gear.instruments.Mambo = "Vihuela"
	gear.instruments.Mazurka = "Vihuela"
	gear.instruments.Minne = "Syrinx"
	gear.instruments.Minuet = "Apollo's Flute"
	gear.instruments.Prelude = "Cantabank's Horn"
	
	--============================================================
	--			Precast sets
	--============================================================
	sets.precast.FC = {			--37%
		main="Marin Staff",		--2%
		head="Nares Cap",		--10%
		neck="Jeweled Collar",		--2%
		ear1="Loquacious Earring",	--2%
		hands="Gendewitha Gages +1",	--7%
		ring1="Prolix Ring",		--2%
		back="Swith Cape",		--3%
		legs="Artsieq Hose",		--5%
		feet="Chelona Boots"		--4%
	}
	
	sets.precast.FC.BardSong = {		--59%
		main="Felibre's Dague",		--6%
		sub="Genbu's Shield",		--0%
		head="Aoidos' Calot +2",	--12%
		neck="Aoidos' Matinee",		--3%
		ear1="Loquacious Earring",	--2%
		body="Sha'ir Manteel",		--12%
		hands="Gendewitha Gages +1",	--7%
		ring1="Prolix Ring",		--2%
		back="Swith Cape",		--3%
		legs="Gendewitha Spats +1",	--6% (song spellcasting time -1% augment)
		feet="Bokwus Boots",		--6%
	}

	sets.precast.FC.Cure = {
		sub="Genbu's Shield",
		back="Pahtli Cape"
	}
	sets.precast.FC.EnhancingMagic = {waist="Siegel Sash"}
	
	--sets.precast.JA.Nightingale = 	{feet="Bihu Slippers"}
	--sets.precast.JA.Troubadour = 	{body="Bihu Justaucorps"}
	--sets.precast.JA['Soul Voice'] =	{legs="Bihu Cannions"}

	--============================================================
	
	sets.precast.Waltz = {}
	sets.precast.WS = {}
	
	--============================================================
	--			Midcast sets
	--============================================================
	sets.midcast.FastRecast = {
		main="Marin Staff",		sub="Achaq Grip",
		head="Gendewitha Caubeen +1",	neck="Jeweled Collar",	ear1="Loquacious Earring",	ear2="Novia Earring",
		body="Artsieq Jubbah",		hands="Otomi Gloves",	ring1="Prolix Ring",		ring2="Sangoma Ring",
		back="Swith Cape",		waist="Cetl Belt",	legs="Artsieq Hose",		feet="Gendewitha Galoshes +1"
	}
	
	--============================================================
	
	sets.midcast.Ballad =	{legs="Aoidos' Rhingrave +2"}
	--sets.midcast.Lullaby =	{hands="Brioso Cuffs"}
	sets.midcast.Madrigal =	{head="Aoidos' Calot +2"}
	sets.midcast.March =	{hands="Aoidos' Manchettes +2"}
	sets.midcast.Minuet =	{body="Aoidos' Hongreline +2"}
	--sets.midcast.Paeon =	{head="Brioso Roundlet"}
	sets.midcast.Scherzo =	{feet="Aoidos' Cothurnes +2"}
	
	sets.midcast.MagicAccuracy = {
		main="Marin Staff",		sub="Mephitis Grip",
		head="Weatherspoon Corona +1",	neck="Sanctity Necklace",	ear1="Lifestorm Earring",	ear2="Psystorm Earring",
		body="Artsieq Jubbah",		hands="Gendewitha Gages +1",	ring1="Sangoma Ring",		ring2="Perception Ring",
		back="Rhapsode's Cape",		waist="Ovate Rope",		legs="Artsieq Hose",		feet="Bokwus Boots"
	}
	
	sets.midcast.Singing = {
		body="Aoidos' Hongreline +2",	hands="Aoidos' Manchettes +2",
		legs="Aoidos' Rhingrave +2",
	}
	
	sets.midcast.Wind = {
		body="Aoidos' Hongreline +2",	hands="Aoidos' Manchettes +2",
		back="Rhapsode's Cape",		feet="Bokwus Boots"
	}
	
	sets.midcast.String = {
		hands="Aoidos' Manchettes +2",
	}
	
	--This set is for extending party song buff duration
	sets.midcast.SongBuff = {	--Song duration + 25%
		main="Legato Dagger",		--5%
		sub="Genbu's Shield",		--n/a
		neck="Aoidos' Matinee",		--10%
		body="Aoidos' Hongreline +2",	--10%
	}
	
	--This set is for Daurdabla/Terpander dummy songs
	sets.midcast.SongRecast = {
		main="Felibre's Dague",		sub="Genbu's Shield",
		head="Gendewitha Caubeen +1",	neck="Jeweled Collar",	ear1="Loquacious Earring",	ear2="Novia Earring",
		hands="Buremte Gloves",		ring1="Prolix Ring",
		back="Swith Cape",		waist="Cetl Belt",	legs="Artsieq Hose",		feet="Gendewitha Galoshes +1"
	}
	
	-- For song debuffs (duration primary, accuracy secondary)
	sets.midcast.SongDebuff = {
		neck="Aoidos' Matinee",
	}

	-- For song debuffs (accuracy primary, duration secondary)
	sets.midcast.SongDebuff.Resistant = sets.midcast.MagicAccuracy

	--============================================================
		
	sets.midcast.EnhancingMagic = {
		body="Hyksos Robe",
		waist="Cascade Belt"
	}
	sets.midcast.Aquaveil = {waist="Emphatikos Rope"}

	sets.midcast.Cure = {
		main="Arka IV",			sub="Achaq Grip",
		head="Gendewitha Caubeen +1",	neck="Jeweled Collar",	ear1="Novia Earring",	ear2="Star Earring",
		body="Gendewitha Bliaut +1",	hands="Bokwus Gloves",	ring1="Prolix Ring",	ring2="Sangoma Ring",
		back="Swith Cape",		waist="Cetl Belt",	legs="Artsieq Hose",	feet="Gendewitha Galoshes +1"
	}
	sets.midcast.Cure.with_buff = {}
	sets.midcast.Cure.with_buff['reive mark'] = {neck="Arciela's Grace +1"}
	
	sets.midcast.Stoneskin = {
		neck="Stone Gorget",	ear1="Star Earring",	ear2="Earthcry Earring",
		ring1="Aqua Ring",	ring2="Aquasoul Ring",
		back="Tuilha Cape",	waist="Siegel Sash",	legs="Shedir Seraweels"
	}
	sets.midcast['Aquaveil'] =	{waist="Emphatikos Rope", legs="Shedir Seraweels"}
	
	sets.midcast.HealingMagic = {}
	sets.midcast.Cursna = {
		neck="Malison Medallion",ring1="Ephedra Ring",ring2="Ephedra Ring"
	}
	
	--============================================================
	--			Other sets
	--============================================================
	
	sets.resting = {
		main="Boonwell Staff",	sub="Achaq Grip",
		head="Kaabnax Hat",	neck="Eidolon Pendant",		ear1="Loquacious Earring",	ear2="Star Earring",
		body="Artsieq Jubbah",	hands="Otomi Gloves",		ring1="Prolix Ring",		ring2="Sangoma Ring",
		back="Felicitas Cape",	waist="Shinjutsu-no-obi",	legs="Nares Trews",		feet="Chelona Boots"
	}
	
	sets.defense.DT = {}
	sets.defense.PDT = set_combine(sets.defense.DT, {
	})
	sets.defense.MDT = set_combine(sets.defense.DT, {
	})
	
	sets.idle = {
		main="Terra's Staff",	sub="Achaq Grip",		range="Linos",
		head="Kaabnax Hat",	neck="Loricate Torque",		ear1="Novia Earring",	ear2="Ethereal Earring",
		body="Artsieq Jubbah",	hands="Gendewitha Gages +1",	ring1="Dark Ring",	ring2="Shneddick Ring",
		back="Cheviot Cape",	waist="Emphatikos Rope",	legs="Artsieq Hose",	feet="Gendewitha Galoshes +1"
	}
	sets.idle.lowMP =	{legs="Nares Trews"}
	sets.idle.lowMP_day =	{feet="Serpentes Sabots"}
	sets.idle.lowMP_night =	{hands="Serpentes Cuffs"}
	
	sets.engaged = {}
end