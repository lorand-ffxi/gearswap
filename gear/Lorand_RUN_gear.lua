function init_gear_sets()
	sets.Enmity = {}
	--============================================================
	--			Precast sets
	--============================================================
	sets.precast.JA = sets.Enmity
	sets.precast.JA['Lunge'] = {
		head="Chelona Hat +1",		neck="Eddy Necklace",	ear1="Hecate's Earring",	ear2="Friomisi Earring",
		back="Evasionist's Cape",	legs="Iuitl Tights",	feet="Weatherspoon Souliers +1"
	}
	sets.precast.JA['Swipe'] = {
		head="Chelona Hat +1",		neck="Eddy Necklace",	ear1="Hecate's Earring",	ear2="Friomisi Earring",
		back="Evasionist's Cape",	legs="Iuitl Tights",	feet="Weatherspoon Souliers +1"
	}
	sets.precast.JA['Vallation'] =	{body="Runeist coat", legs="Futhark trousers"}
	sets.precast.JA['Battuta'] =	{head="Futhark bandeau"}
	sets.precast.JA['Gambit'] =	{hands="Runeist Mitons +1"}
	sets.precast.JA['Pflug'] =	{head="Runeist bottes"}
	sets.precast.JA['Liement'] =	{body="Futhark Coat +1"}
	sets.precast.JA['Sforzo'] =	{body="Futhark Coat +1"}
	sets.precast.JA['Swordplay'] =	{hands="Futhark Mitons"}
	sets.precast.JA['Rayke'] =	{feet="Futhark Boots"}
	
	sets.precast.Waltz = {}
	sets.precast.Waltz['Healing Waltz'] = {}

	--============================================================
	
	sets.precast.FC = {										ammo="Impatiens",
		head="Runeist Bandeau",	neck="Magoraga Beads",		ear1="Loquacious Earring",
		body="Futhark Coat +1",	hands="Shneddick Gloves +1",	ring2="Veneficium Ring",
		back="Swith Cape",	waist="Twilight Belt",		legs="Iuitl Tights",		feet="Chelona Boots"
	}
	sets.precast.FC.EnhancingMagic = {
		ear2="Brachyura Earring",	waist="Siegel Sash"
	}
	
	--============================================================
       
	sets.wsBase = {}
	--STR
	sets.wsBase['Resolution'] = {									ammo="Aqreqaq Bomblet",
		head="Ejekamal Mask",	neck="Bull Necklace",		ear1="Flame Pearl",		ear2="Flame Pearl",
		body="Futhark Coat +1",	hands="Runeist Mitons +1",	ring1="Pyrosoul ring",		ring2="Pyrosoul ring",
		back="Buquwik Cape",	waist="Pipilaka Belt",		legs="Runeist Trousers +1",	feet="Shneddick Boots +1"
	}
	--STR
	sets.wsBase['Requiescat'] = {										ammo="Aqreqaq Bomblet",
		head="Shneddick Chapeau +1",	neck="Bull Necklace",		ear1="Steelflash earring",	ear2="Bladeborn earring",
		body="Espial Gambison",		hands="Runeist Mitons +1",	ring1="Epona's ring",		ring2="Ramuh Ring +1",
		back="Buquwik Cape",		waist="Shadow Belt",		legs="Iuitl Tights",		feet="Weatherspoon Souliers +1"
	}
	--DEX
	sets.wsBase['Dimidiation'] = {}

	sets.wsBase.magic = {											ammo="Aqreqaq Bomblet",
		head="Chelona Hat +1",		neck="Eddy Necklace",		ear1="Hecate's Earring",	ear2="Friomisi Earring",
		body="Espial Gambison",		hands="Runeist Mitons +1",	ring1="Epona's ring",		ring2="Ramuh Ring +1",
		back="Evasionist's Cape",	waist="Shadow Belt",		legs="Iuitl Tights",		feet="Weatherspoon Souliers +1"
	}
	
	--============================================================
	--						Midcast sets
	--============================================================
	sets.midcast.Enmity = sets.Enmity
	
	sets.midcast.FastRecast = {}
	
	sets.midcast.MagicAccuracy = {}
	
	sets.midcast.DivineMagic = {}
	
	sets.midcast.Cure = {}
	
	sets.midcast.Cure.Self = {}
	sets.midcast.Cure.with_buff = {}
	
	sets.midcast.EnhancingMagic = {
		neck="Enhancing Torque",	ear1="Loquacious Earring",	ear2="Earthcry earring",
		body="Espial Gambison",		hands="Shneddick Gloves +1",	ring1="Ramuh Ring +1",	ring2="Veneficium Ring",
		waist="Siegel sash",		legs="Futhark Trousers"
	}
	sets.midcast.Protect = {}
	sets.midcast.Shell = {}
	
	
	--============================================================
	--			Other sets
	--============================================================
	
	sets.weapons = {}
	sets.weapons.GS = {main="Aettir",sub="Pole Grip"}
	sets.weapons.DualSS = {main="Buramenk'ah", sub="Xiutleato"}
	sets.weapons.DualAS = {main="Antican Axe", sub="Xiutleato"}
	
	sets.Reraise = {}
	
	sets.resting = {}
	
	sets.idle = {
		head="Ocelomeh Headpiece +1",	neck="Wiglen Gorget",		ear1="Steelflash Earring",	ear2="Bladeborn earring",
		body="Runeist Coat",		hands="Shneddick Gloves +1",	ring1="Paguroidea Ring",	ring2="Sheltered Ring",
		back="Iximulew Cape",		waist="Windbuffet Belt",	legs="Runeist Trousers +1",	feet="Weatherspoon Souliers +1"
	}
	
	sets.idle.with_buff = {}
	
	sets.idle.PDT = {}
	sets.idle.MDT = {}
	
	sets.defense.DT = {}
	sets.defense.PDT = {}
	sets.defense.MDT = {}
	
	sets.engaged = {}
	sets.engaged.with_buff = {}
	
	sets.engaged.Standard = {										ammo="Vanir Battery",
		head="Whirlpool Mask",		neck="Asperity necklace",	ear1="Steelflash earring",	ear2="Bladeborn earring",
		body="Futhark Coat +1",		hands="Runeist Mitons +1",	ring1="Epona's ring",		ring2="Beeline ring",
		back="Atheling mantle",		waist="Windbuffet belt",	legs="Runeist Trousers +1",	feet="Weatherspoon Souliers +1"
	}
	sets.engaged.PDT = {											ammo="Vanir Battery",
		head="Futhark Bandeau",		neck="Twilight Torque",		ear1="Steelflash earring",	ear2="Bladeborn earring",
		body="Futhark Coat +1",		hands="Umuthi Gloves",
		back="Iximulew Cape",		waist="Flume Belt",		legs="Runeist Trousers +1",	feet="Thurandaut Boots +1"
	}
	sets.engaged.MDT = {											ammo="Vanir Battery",
		head="Shneddick Chapeau +1",	neck="Twilight Torque",		ear1="Merman's earring",	ear2="Merman's earring",
		body="Futhark Coat +1",		hands="Runeist Mitons +1",	ring1="Minerva's Ring",		ring2="Shadow Ring",
		back="Engulfer Cape",		waist="Windbuffet Belt",	legs="Iuitl Tights",		feet="Weatherspoon Souliers +1"
	}
	sets.engaged.Qaaxo = {											ammo="Vanir Battery",
		head="Iuitl Headgear",		neck="Asperity necklace",	ear1="Steelflash earring",	ear2="Bladeborn earring",
		body="Qaaxo Harness",		hands="Qaaxo Mitaines",		ring1="Epona's ring",		ring2="Rajas ring",
		back="Atheling mantle",		waist="Windbuffet belt",	legs="Runeist Trousers +1",	feet="Qaaxo Leggings"
	}
	sets.engaged.AccFull = {										ammo="Honed Tathlum",
		head="Whirlpool Mask",		neck="Peacock Charm",		ear1="Steelflash earring",	ear2="Heartseeker earring",
		body="Qaaxo Harness",		hands="Qaaxo Mitaines",		ring1="Oneiros Annulet",	ring2="Enlivened Ring",
		back="Evasionist's Cape",	waist="Anguinus Belt",		legs="Kaabnax Trousers",	feet="Qaaxo Leggings"
	}
end