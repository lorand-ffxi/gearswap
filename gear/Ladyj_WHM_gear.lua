--------------------------------------------------------------------------------
--[[
	Author: Ragnarok.Lorand
--]]
--------------------------------------------------------------------------------

function init_gear_sets()
	--============================================================
	--			Precast sets
	--============================================================
	sets.precast.FC = {			--33%
		main="Marin Staff",		--2%
		ammo="Incantor Stone",		--2%
		head="Nahtirah Hat",		--10%
		neck="Orison Locket",		--5%
		ear1="Loquacious Earring",	--2%
		hands="Gendewitha Gages +1",	--7%
		ring1="Prolix Ring",		--2%
		back="Swith Cape",		--3%
		waist="Witful Belt",		--3%
		feet="Chelona Boots"		--4%
	}
		
	sets.precast.FC.EnhancingMagic = {	--38%
		waist="Siegel Sash"		--8%
	}
	sets.precast.FC.HealingMagic = {	--45%
		legs="Orison Pantaloons +2"	--12%
	}
	sets.precast.FC.Cure = {		--70%
		main="Tamaxchi",		--0%
		sub="Sors Shield",		--5%
		body="Nefer Kalasiris +1",	--12%
		hands="Gendewitha Gages +1",	--12%
		back="Pahtli Cape",		--8%
	}
	
	--============================================================
	
	sets.precast.JA.Benediction = {}
	sets.precast.JA.Martyr = {}

	sets.precast.Waltz = {}
	
	--============================================================
	
	sets.wsBase = {
		ammo="Jukukik Feather",
		head="Telchine Cap",		neck="Asperity Necklace",	ear1="Bladeborn Earring",	ear2="Steelflash Earring",
		body="Telchine Chasuble",	hands="Telchine Gloves",	ring1="Rajas Ring",		ring2="Leviathan Ring +1",
		back="Pahtli Cape",		waist="Windbuffet Belt +1",	legs="Telchine Braconi",	feet="Helios Boots"
	}
	
	sets.wsBase.Magic = {
		ammo="Witchstone",
		head="Telchine Cap",		neck="Eddy Necklace",		ear1="Hecate's Earring",	ear2="Friomisi Earring",
		body="Telchine Chasuble",	hands="Telchine Gloves",	ring1="Strendu Ring",		ring2="Shiva Ring",
		back="Toro Cape",		waist="Windbuffet Belt +1",	legs="Telchine Braconi",	feet="Helios Boots"
	}
	
	--============================================================
	--			Midcast sets
	--============================================================
	
	sets.midcast.FastRecast = {
		main="Marin Staff",	sub="Achaq Grip",						ammo="Incantor Stone",
		head="Nahtirah Hat",	neck="Orison Locket",		ear1="Loquacious Earring",	ear2="Psystorm Earring",
		body="Artsieq Jubbah",	hands="Telchine Gloves",	ring1="Prolix Ring",		ring2="Sangoma Ring",
		back="Swith Cape",	waist="Witful Belt",		legs="Assiduity Pants",		feet="Helios Boots"
	}
	
	sets.midcast.MagicAccuracy = {
		main="Marin Staff",	sub="Mephitis Grip",						ammo="Kalboron Stone",
		head="Nahtirah Hat",	neck="Eddy Necklace",		ear1="Lifestorm Earring",	ear2="Psystorm Earring",
		body="Artsieq Jubbah",	hands="Gendewitha Gages +1",	ring1="Sangoma Ring",		ring2="Leviathan Ring +1",
		back="Ogapepo Cape",	waist="Ovate Rope",		legs="Artsieq Hose",		feet="Artsieq Boots"
	}

	--====================== Healing =============================
	
	sets.midcast.HealingMagic = {
		neck="Colossus's Torque",
		body="Orison Bliaud +2",
		legs="Cleric's Pantaloons"
	}
	
	sets.midcast.Cure = {
		main="Tamaxchi",		sub="Sors Shield",						ammo="Incantor Stone",
		head="Gendewitha Caubeen +1",	neck="Orison Locket",		ear1="Loquacious Earring",	ear2="Roundel Earring",
		body="Orison Bliaud +2",	hands="Telchine Gloves",	ring1="Prolix Ring",		ring2="Leviathan Ring +1",
		back="Swith Cape",		waist="Witful Belt",		legs="Orison Pantaloons +2",	feet="Theophany Duckbills"
	}
	sets.midcast.Curaga = sets.midcast.Cure

	sets.midcast.Cursna = {
		ring1="Ephedra Ring",	ring2="Ephedra Ring",
		back="Mending Cape",	legs="Cleric's Pantaloons",	feet="Gendewitha Galoshes +1"
	}

	sets.midcast.StatusRemoval = {
		head="Orison Cap +2"
	}
	sets.midcast.StatusRemoval['Divine Caress'] = {
		hands="Orison Mitts +1"
	}

	--====================== Enhancing ===========================
	
	sets.midcast.EnhancingMagic = {
		neck="Colossus's Torque",
		body="Telchine Chasuble",	hands="Dynasty Mitts",
		feet="Orison Duckbills +1"
	}
	
	sets.midcast.Stoneskin = {
		ear1="Lifestorm Earring",	ear2="Earthcry Earring",
		ring2="Leviathan Ring +1",
		back="Pahtli Cape",
	}
	sets.midcast.Auspice = {feet="Orison Duckbills +1"}

	sets.midcast.BarElement = {
		head="Orison Cap +2",
		body="Orison Bliaud +2",	hands="Orison Mitts +1",
		legs="Cleric's Pantaloons",	feet="Orison Duckbills +1"
	}

	sets.midcast.Regen = {
		body="Cleric's Briault",	hands="Orison Mitts +1",
	}
	
	sets.midcast.Refresh = {
		back="Grapevine Cape",
	}
	
	sets.midcast.Protectra = {
		feet="Piety Duckbills"
	}
	sets.midcast.Shellra = {
		legs="Piety Pantaloons"
	}
	
	--====================== Offensive ===========================	
	
	sets.midcast.DivineMagic = {
	}
				
	sets.midcast.DivineMagic.Nuke = {
		main="Marin Staff",	sub="Elder's Grip +1",					ammo="Witchstone",
		head="Buremte Hat",	neck="Eddy Necklace",	ear1="Hecate's Earring",	ear2="Friomisi Earring",
		body="Artsieq Jubbah",	hands="Otomi Gloves",	ring1="Strendu Ring",		ring2="Leviathan Ring +1",
		back="Toro Cape",	waist="Witful Belt",	legs="Telchine Braconi",	feet="Helios Boots"
	}
	
	sets.midcast.DarkMagic = {}

	sets.midcast.EnfeeblingMagic = {
	}
	sets.midcast.EnfeeblingMagic.Potency = {
		ring2="Leviathan Ring +1",
	}
	sets.midcast.EnfeeblingMagic.Potency.Resistant = {}
	
	sets.midcast.ElementalMagic = {
		main="Marin Staff",	sub="Elder's Grip +1",					ammo="Witchstone",
		head="Buremte Hat",	neck="Eddy Necklace",	ear1="Hecate's Earring",	ear2="Friomisi Earring",
		body="Artsieq Jubbah",	hands="Otomi Gloves",	ring1="Strendu Ring",		ring2="Shiva Ring",
		back="Toro Cape",	waist="Witful Belt",	legs="Telchine Braconi",	feet="Helios Boots"
	}
	sets.midcast.ElementalMagic.LowTier = {}
	sets.midcast.ElementalMagic.HighTier = {}
	sets.midcast.ElementalMagic.Earth = {neck="Quanpur Necklace"}
	
	sets.midcast.ElementalEnfeeble = {}
	
	--============================================================
	--			Other sets
	--============================================================
	
	sets.resting = {
		main="Bolelabunga",	sub="Sors Shield",					ammo="Kalboron Stone",
		head="Nahtirah Hat",	neck="Orison Locket",	ear1="Loquacious Earring",
		body="Artsieq Jubbah",	hands="Otomi Gloves",	ring1="Sangoma Ring",		ring2="Dark Ring",
		back="Pahtli Cape",	waist="Fucho-no-obi",	legs="Nares Trews",		feet="Chelona Boots"
	}

	sets.idle = {
		main="Bolelabunga",	sub="Sors Shield",					ammo="Incantor Stone",
		head="Nahtirah Hat",	neck="Orison Locket",	ear1="Loquacious Earring",	ear2="Ethereal Earring",
		body="Artsieq Jubbah",	hands="Dynasty Mitts",	ring1="Sangoma Ring",		ring2="Dark Ring",
		back="Aptitude Mantle",	waist="Fucho-no-obi",	legs="Nares Trews",		feet="Gendewitha Galoshes +1"
	}
	sets.idle.lowMP = {legs="Nares Trews"}
	sets.idle.lowMP_night =	{hands="Serpentes Cuffs"}
	sets.idle.lowMP_day = {feet="Serpentes Sabots"}
	
	sets.idle.with_buff = {}
	sets.idle.with_buff['reive mark'] = {neck="Adoulin's Refuge +1"}
	
	sets.defense.DT = {
		ring2="Dark Ring",
	}
	sets.defense.PDT = combineSets(sets.defense.DT, {
	})
	sets.defense.MDT = combineSets(sets.defense.DT, {
	})
	
	sets.engaged = {										ammo="Jukukik Feather",
		head="Nahtirah Hat",	neck="Asperity Necklace",	ear1="Bladeborn Earring",	ear2="Steelflash Earring",
		body="Artsieq Jubbah",	hands="Telchine Gloves",	ring1="Rajas Ring",		ring2="K'ayres Ring",
		back="Aptitude Mantle",	waist="Windbuffet Belt +1",	legs="Telchine Braconi",	feet="Gendewitha Galoshes +1"
	}
	sets.engaged.with_buff = {}
	sets.engaged.with_buff['reive mark'] = {neck="Adoulin's Refuge +1"}
end