-----------------------------------------------------------------------------------------------------------
--[[
	Author: Ragnarok.Lorand
--]]
-----------------------------------------------------------------------------------------------------------

function init_gear_sets()
	--============================================================
	--					Precast sets
	--============================================================
	sets.precast.FC = {
		main="Lehbrailg +2",		ammo="Incantor Stone",
		head="Nares Cap",			neck="Orison Locket",	ear2="Loquacious Earring",
		hands="Gendewitha Gages +1",
		back="Swith Cape",			legs="Artsieq Hose",	feet="Chelona Boots"
	}
	
	sets.precast.FC.EnhancingMagic = {waist="Siegel Sash"}	
	sets.precast.FC.HealingMagic = {legs="Orison Pantaloons +2"}
	sets.precast.FC.Cure = {back="Pahtli Cape"}
	sets.precast.FC.Curaga = sets.precast.FC.Cure
	sets.precast.FC.StatusRemoval = {legs="Orison Pantaloons +2"}
	
	--============================================================

	sets.precast.Waltz = {
		head="Kaabnax Hat",
		body="Gendewitha Bilaut +1",	hands="Gendewitha Gages +1",	ring1="Spiral Ring",	ring2="Sirona's Ring",
		back="Swith Cape",			legs="Gendewitha Spats",		feet="Uk'uxkaj Boots"
	}
	
	--============================================================
	
	sets.wsBase = {
		ammo="Flame Sachet",
		head="Buremte Hat",			neck="Asperity Necklace",		ear1="Bladeborn Earring",	ear2="Steelflash Earring",
		body="Gendewitha Bilaut +1",	hands="Gendewitha Gages +1",	ring1="Rajas Ring",			ring2="Spiral Ring",
		back="Buquwik Cape",		waist="Cascade Belt",			legs="Gendewitha Spats",	feet="Uk'uxkaj Boots"
	}

	--============================================================
	--					Midcast sets
	--============================================================
	
	sets.midcast.FastRecast = {
		ammo="Clarus Stone",
		head="Gendewitha Caubeen +1",	neck="Orison Locket",		ear1="Novia Earring",		ear2="Loquacious Earring",
		body="Theophany Briault",	hands="Gendewitha Gages +1",
		back="Ogapepo Cape",		waist="Cetl Belt",			legs="Piety Pantaloons",	feet="Theophany Duckbills"
	}
	
	sets.midcast.MagicAccuracy = {
		main="Lehbrailg +2",	sub="Mephitis Grip",			ammo="Kalboron Stone",
		head="Kaabnax Hat",	neck="Stoicheion Medal",		ear1="Lifestorm Earring",	ear2="Psystorm Earring",
		body="Praeco Doublet",	hands="Gendewitha Gages +1",	ring1="Perception Ring",
		back="Ogapepo Cape",	legs="Artsieq Hose",			feet="Bokwus Boots"
	}

	--====================== Healing =============================
	
	sets.midcast.HealingMagic = {
		body="Orison Bliaud +2",	hands="Theophany Mitts",	ring1="Ephedra Ring",	ring2="Sirona's Ring",
		legs="Piety Pantaloons"
	}
	
	sets.midcast.Cure = {
		main="Tamaxchi",			sub="Genbu's Shield",	ammo="Incantor Stone",
		head="Gendewitha Caubeen +1",	neck="Fylgja Torque",	ear1="Novia Earring",			ear2="Orison Earring",
		body="Orison Bliaud +2",	hands="Bokwus Gloves",	ring1="Solemn Ring",			ring2="Sirona's Ring",
		back="Mending Cape",		waist="Cetl Belt",		legs="Orison Pantaloons +2",	feet="Theophany Duckbills",
	}
	sets.midcast.Curaga = sets.midcast.Cure

	sets.midcast.Cure.Engaged = {
		body="Gendewitha Bilaut +1",
		legs="Nares Trews",			feet="Piety Duckbills"
	}

	sets.midcast.Cursna = {
		neck="Malison Medallion",
		ring1="Ephedra Ring",		ring2="Ephedra Ring",
		back="Mending Cape",		legs="Theophany Pantaloons",	feet="Gendewitha Galoshes"
	}

	sets.midcast.StatusRemoval = {
		head="Orison Cap +2"
	}
	
	sets.midcast.StatusRemoval['Divine Caress'] = {
		hands="Orison Mitts +2",
		back="Mending Cape"
	}

	--====================== Enhancing ===========================
	
	sets.midcast.EnhancingMagic = {
		waist="Cascade Belt",	legs="Piety Pantaloons",	feet="Orison Duckbills +2"
	}
	
	sets.midcast.Stoneskin = {
		ammo="Aqua Sachet",
		neck="Stone Gorget",	ear1="Lifestorm Earring",	ear2="Earthcry Earring",
		ring1="Solemn Ring",	ring2="Aqua Ring",
		back="Tuilha Cape",		waist="Siegel Sash",		legs="Haven Hose"
	}
	sets.midcast.Auspice = {feet="Orison Duckbills +2"}
	sets.midcast.Aquaveil = {waist="Emphatikos Rope"}

	sets.midcast.BarElement = {
		head="Orison Cap +2",
		body="Orison Bliaud +2",	hands="Orison Mitts +2",
		legs="Piety Pantaloons",	feet="Orison Duckbills +2"
	}

	sets.midcast.Regen = {
		body="Cleric's Briault",	hands="Orison Mitts +2",
		legs="Theophany Pantaloons"
	}
	
	sets.midcast.Protectra = {
		ring2="Sheltered Ring",
		feet="Piety Duckbills"
	}
	sets.midcast.Shellra = {
		ring2="Sheltered Ring",
		legs="Piety Pantaloons"
	}
	
	--====================== Offensive ===========================	
	
	sets.midcast.DivineMagic = {
		legs="Theophany Pantaloons"
	}
				
	sets.midcast.DivineMagic.Nuke = {
		main="Lehbrailg +2",			sub="Achaq Grip",			ammo="Witchstone",
		head="Buremte Hat",				neck="Stoicheion Medal",	ear1="Hecate's Earring",	ear2="Friomisi Earring",
		body="Weatherspoon Robe +1",	hands="Otomi Gloves",		ring1="Solemn Ring",		ring2="Acumen Ring",
		back="Toro Cape",				waist="Cascade Belt",		legs="Gendewitha Spats",	feet="Weatherspoon Souliers +1"
	}
	
	sets.midcast.DarkMagic = {}

	sets.midcast.EnfeeblingMagic = {
		main="Lehbrailg +2",
		sub="Mephitis Grip",
		body="Theophany Briault",
		hands="Cleric's Mitts",
		feet="Theophany Duckbills"
	}
	sets.midcast.EnfeeblingMagic.Potency = {
		ring2="Solemn Ring",
		waist="Cascade Belt",			feet="Uk'uxkaj Boots"
	}
	sets.midcast.EnfeeblingMagic.Potency.Resistant = {}
	sets.midcast.EnfeeblingMagic.Potency.Normal = {
		ammo="Aqua Sachet",
		head="Kaabnax Hat",			ear1="Lifestorm Earring",	ear2="Star Earring",
		body="Weatherspoon Robe +1",	hands="Gendewitha Gages +1",	ring1="Aqua Ring",
		back="Tuilha Cape",				legs="Weatherspoon Pants +1",
	}
	
	sets.midcast.ElementalMagic = {
		main="Lehbrailg +2",			sub="Bugard Strap +1",		ammo="Witchstone",
		head="Buremte Hat",				neck="Stoicheion Medal",	ear1="Hecate's Earring",	ear2="Friomisi Earring",
		body="Weatherspoon Robe +1",	hands="Otomi Gloves",		ring1="Snow Ring",			ring2="Acumen Ring",
		back="Toro Cape",				waist="Cognition Belt",		legs="Gendewitha Spats",	feet="Weatherspoon Souliers +1"
	}
	sets.midcast.ElementalMagic.Earth = {neck="Quanpur Necklace"}
	
	--============================================================
	--					Other sets
	--============================================================
	
	sets.resting = {
		main="Boonwell Staff",		sub="Achaq Grip",			ammo="Clarus Stone",
		neck="Eidolon Pendant",
		body="Gendewitha Bilaut +1",	hands="Serpentes Cuffs",
		back="Felicitas Cape",		waist="Austerity Belt",		legs="Nares Trews",		feet="Chelona Boots",
	}

	sets.idle = {
		main="Terra's Staff",			sub="Achaq Grip",			ammo="Incantor Stone",
		head="Kaabnax Hat",				neck="Twilight Torque",		ear1="Novia Earring",		ear2="Star Earring",
		body="Gendewitha Bilaut +1",	hands="Serpentes Cuffs",	ring1="Dark Ring",			ring2="Dark Ring",
		back="Cheviot Cape",			waist="Hierarch Belt",		legs="Piety Pantaloons",	feet="Theophany Duckbills"
	}
	sets.idle.Speedy = {feet="Herald's Gaiters"}
	
	sets.idle.lowMP = {
		main="Owleyes",		sub="Genbu's Shield",
		legs="Nares Trews"
	}
	sets.idle.lowMP_night =	{hands="Serpentes Cuffs"}
	sets.idle.lowMP_day = {feet="Serpentes Sabots"}
	
	sets.defense.DT = {
		neck="Twilight Torque",
		ring1="Dark Ring",
		ring2="Dark Ring",
	}
	sets.defense.PDT = set_combine(sets.defense.DT, {
		main="Terra's Staff",
		body="Gendewitha Bilaut +1",	hands="Gendewitha Gages +1",
		back="Cheviot Cape",		legs="Gendewitha Spats",		feet="Gendewitha Galoshes"
	})
	sets.defense.MDT = set_combine(sets.defense.DT, {})
	
	sets.engaged = {
		--main="Aedold +2",				sub="Genbu's Shield",		
		ammo="Jukukik Feather",
		head="Weatherspoon Corona +1",	neck="Asperity Necklace",	ear1="Bladeborn Earring",		ear2="Steelflash Earring",
		body="Theophany Briault",		hands="Otomi Gloves",		ring1="Rajas Ring",				ring2="Tyrant's Ring",
		back="Buquwik Cape",			waist="Cetl Belt",			legs="Weatherspoon Pants +1",	feet="Weatherspoon Souliers +1"
	}

	-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
	sets.buff['Divine Caress'] = {hands="Orison Mitts +2",back="Mending Cape"}
end