-----------------------------------------------------------------------------------------------------------
--[[
	Author: Ragnarok.Lorand
	
--]]
-----------------------------------------------------------------------------------------------------------

function init_gear_sets()
	--============================================================
	--					Precast sets
	--============================================================
	sets.precast.JA['Chainspell'] = {body="Vitivation Tabard +1"}
	sets.precast.JA['Saboteur'] = {hands="Estoqueur's Gantherots +2"}
	
	sets.precast.Waltz = {}
	sets.precast.Waltz['Healing Waltz'] = {}
	
	-- Fast Cast caps at 80%; RDM JT: 30%
	sets.precast.FC = {					--50% + 30% = 80%
		main="Lehbrailg +2",			--2%
		head="Atrophy Chapeau +1",		--12%
		ear1="Loquacious Earring",		--2%
		body="Vitivation Tabard +1",	--13%
		hands="Gendewitha Gages +1",	--7%
		ring1="Prolix Ring",			--2%
		back="Swith Cape",				--3%
		legs="Artsieq Hose",			--5%
		feet="Chelona Boots"			--4%
	}
	
	sets.precast.FC.HealingMagic = {
		main="Tamaxchi",	sub="Genbu's Shield",
		back="Pahtli Cape"
	}
	sets.precast.FC.EnhancingMagic = {waist="Siegel Sash"}
	
	--============================================================
	
	sets.wsBase = {
		head="Buremte Hat",			neck="Asperity Necklace",	ear1="Bladeborn Earring",	ear2="Steelflash Earring",
		body="Hagondes Coat +1",	hands="Atrophy Gloves",		ring1="Rajas Ring",			ring2="Spiral Ring",
		back="Atheling Mantle",		waist="Anguinus Belt",		legs="Hagondes Pants +1",	feet="Weatherspoon Souliers +1"
	}
	sets.wsBase.Magic = {}
	
	--============================================================
	--					Midcast sets
	--============================================================
	
	sets.midcast.FastRecast = {
		head="Atrophy Chapeau +1",		neck="Jeweled Collar",			ear1="Loquacious Earring",	ear2="Novia Earring",
		body="Vitivation Tabard +1",	hands="Gendewitha Gages +1",
		back="Ogapepo Cape",			waist="Cetl Belt",				legs="Hagondes Pants +1",	feet="Atrophy Boots"
	}

	sets.midcast.HealingMagic = {
		body="Vitivation Tabard +1",	ring1="Sirona's Ring",		ring2="Ephedra Ring",
		legs="Atrophy Tights"
	}
	sets.midcast.Cursna = {
		neck="Malison Medallion",
		hands="Hieros Mittens",		ring1="Ephedra Ring",		ring2="Ephedra Ring",
		feet="Gendewitha Galoshes +1"
	}
	
	sets.midcast.Cure = {	--Cure potency > 50%	|	Enmity - 33
		main="Tamaxchi",				sub="Genbu's Shield",	ammo="Clarus Stone",
		head="Gendewitha Caubeen +1",	neck="Jeweled Collar",	ear1="Roundel Earring",	ear2="Novia Earring",
		body="Vitivation Tabard +1",	hands="Otomi Gloves",	ring1="Prolix Ring",	ring2="Sirona's Ring",
		back="Ghostfyre Cape",			waist="Cetl Belt",		legs="Atrophy Tights",	feet="Atrophy Boots"
	}
	sets.midcast.Curaga = sets.midcast.Cure
	sets.midcast.Cure.Engaged = {
		body="Gendewitha Bliaut +1",	hands="Bokwus Cuffs"
	}
	
	sets.midcast.Cure.with_buff = {}
	sets.midcast.Cure.with_buff['reive mark'] = {neck="Arciela's Grace +1"}
	
	sets.midcast.EnhancingMagic = {
		main="Secespita",				sub="Muse Tariqah",			ammo="Clarus Stone",
		ear1="Loquacious Earring",		ear2="Novia Earring",
		body="Vitivation Tabard +1",	hands="Vitivation Gloves",
		back="Estoqueur's Cape",		waist="Cascade Belt",		legs="Atrophy Tights",	feet="Estoqueur's Houseaux +2"
	}
	sets.midcast.EnhancingMagic.Duration = {
		hands="Atrophy Gloves",
		back="Estoqueur's Cape",	feet="Estoqueur's Houseaux +2"
	}
	sets.midcast.EnhancingMagic.Duration.ComposureOther = {
		head="Estoqueur's Chappel +2",
		body="Estoqueur's Sayon +2",
		legs="Estoqueur's Fuseau +2"
	}
	
	sets.midcast['Aquaveil'] =		{waist="Emphatikos Rope"}
	sets.midcast['Phalanx II'] =	{hands="Vitivation Gloves"}
	sets.midcast['Refresh'] =		{legs="Estoqueur's Fuseau +2"}
	sets.midcast['Stoneskin'] =		{
		neck="Stone Gorget",	ear2="Earthcry Earring",
		waist="Siegel Sash",	legs="Haven Hose"
	}
	
	--============================================================
	
	sets.midcast.MagicAccuracy = {
		main="Lehbrailg +2",			sub="Mephitis Grip",		ammo="Kalboron Stone",
		head="Atrophy Chapeau +1",		neck="Stoicheion Medal",	ear1="Lifestorm Earring",	ear2="Psystorm Earring",
		body="Estoqueur's Sayon +2",	hands="Hagondes Cuffs",		ring1="Perception Ring",
		back="Ogapepo Cape",			legs="Artsieq Hose",		feet="Bokwus Boots"
	}
	
	sets.midcast.EnfeeblingMagic = {
		head="Vitivation Chapeau +1",
		body="Atrophy Tabard",		hands="Estoqueur's Gantherots +2"
	}
	sets.midcast.EnfeeblingMagic.Saboteur = {hands="Estoqueur's Gantherots +2"}
	
	sets.midcast.EnfeeblingMagic.Potency = {
		neck="Estoqueur's Collar",
		body="Estoqueur's Sayon +2",	ring2="Solemn Ring",
		waist="Cascade Belt",			feet="Uk'uxkaj Boots"
	}
	sets.midcast.EnfeeblingMagic.Potency.Resistant = {}
	sets.midcast.EnfeeblingMagic.Potency.Normal = {
		ammo="Aqua Sachet",
		ear2="Star Earring",
		hands="Gendewitha Gages +1",	ring1="Aqua Ring",
		back="Tuilha Cape",				legs="Hagondes Pants +1",
	}
	
	sets.midcast['Dia III'] = {head="Vitivation Chapeau +1"}
	sets.midcast['Slow II'] = {head="Vitivation Chapeau +1"}
	
	--============================================================
	
	sets.midcast.ElementalMagic = {
		main="Lehbrailg +2",		sub="Bugard Strap +1",		ammo="Witchstone",
		head="Buremte Hat",			neck="Stoicheion Medal",	ear1="Hecate's Earring",	ear2="Friomisi Earring",
		body="Hagondes Coat +1",	hands="Otomi Gloves",		ring1="Acumen Ring",		ring2="Spiral Ring",
		back="Toro Cape",			waist="Cognition Belt",		legs="Hagondes Pants +1",	feet="Hagondes Sabots"
	}
	sets.midcast.ElementalMagic.Earth = {neck="Quanpur Necklace"}
	
	sets.midcast.ElementalMagic.with_buff = {}
	sets.midcast.ElementalMagic.with_buff['reive mark'] = {neck="Arciela's Grace +1"}
	
	sets.midcast.ElementalEnfeeble = {
		head="Kaabanax Hat",
		hands="Otomi Gloves",	ring1="Spiral Ring",
		feet="Uk'uxkaj Boots"
	}

	sets.midcast.DarkMagic = {}
	sets.midcast.Stun = {
		main="Apamajas II",				sub="Mephitis Grip",			ammo="Kalboron Stone",
		head="Atrophy Chapeau +1",		neck="Jeweled Collar",			ear1="Lifestorm Earring",	ear2="Psystorm Earring",
		body="Vitivation Tabard +1",
		hands="Buremte Gloves",
		--hands="Gendewitha Gages +1",
		ring1="Prolix Ring",		ring2="Perception Ring",
		back="Ogapepo Cape",			waist="Cetl Belt",				legs="Artsieq Hose",		feet="Bokwus Boots"
	}
	
	sets.midcast.DivineMagic = {}
	sets.midcast.DivineMagic.Nuke = {}
	sets.midcast.DivineMagic.Nuke.with_buff = {}
	sets.midcast.DivineMagic.Nuke.with_buff['reive mark'] = {neck="Arciela's Grace +1"}
	
	--============================================================
	--					Other sets
	--============================================================
	
	sets.maxMP = {
		sub="Achaq Grip",				ammo="Kalboron Stone",
		head="Kaabanax Hat",			neck="Estoqueur's Collar",	ear1="Loquacious Earring",	ear2="Star Earring",
		body="Vitivation Tabard +1",	hands="Otomi Gloves",
		back="Pahtli Cape",				waist="Hierarch Belt",		legs="Artsieq Hose",		feet="Atrophy Boots"
	}
	
	sets.resting = {
		main="Boonwell Staff",			sub="Achaq Grip",		ammo="Clarus Stone",
		head="Vitivation Chapeau +1",	neck="Eidolon Pendant",	hands="Serpentes Cuffs",
		back="Felicitas Cape",			waist="Austerity Belt",	legs="Nares Trews",			feet="Chelona Boots"
	}
	
	sets.idle = {
		main="Terra's Staff",			sub="Achaq Grip",				ammo="Kalboron Stone",
		head="Vitivation Chapeau +1",	neck="Twilight Torque",			ear1="Novia Earring",		ear2="Ethereal Earring",
		body="Artsieq Jubbah",			hands="Gendewitha Gages +1",	ring1="Dark Ring",			ring2="Dark Ring",
		back="Tuilha Cape",				waist="Emphatikos Rope",		legs="Gendewitha Spats +1",	feet="Serpentes Sabots"
	}
	sets.idle.with_buff = {}
	sets.idle.with_buff['reive mark'] = {neck="Arciela's Grace +1"}
	
	sets.idle.Melee = {
		--main="Iztaasu +2",			sub="Beatific Shield",
		ammo="Jukukik Feather",
		head="Vitivation Chapeau +1",	neck="Twilight Torque",		ear1="Novia Earring",	ear2="Ethereal Earring",
		body="Artsieq Jubbah",			hands="Serpentes Cuffs",	ring1="Dark Ring",			ring2="Dark Ring",
		back="Cheviot Cape",			waist="Flume Belt",			legs="Nares Trews",			feet="Serpentes Sabots"
	}
	sets.idle.speedy = {legs="Crimson Cuisses"}
	-- sets.idle.lowMP = {
		-- legs="Nares Trews"
	-- }
	-- sets.idle.lowMP_night =	{hands="Serpentes Cuffs"}
	-- sets.idle.lowMP_day = {feet="Serpentes Sabots"}
	
	
	sets.defense.DT = {
		neck="Twilight Torque",
		ring1="Dark Ring",		ring2="Dark Ring"
	}
	sets.defense.PDT = set_combine(sets.defense.DT, {
		main="Terra's Staff",
		hands="Gendewitha Gages +1",
		back="Cheviot Cape",			waist="Flume Belt"
	})
	sets.defense.MDT = set_combine(sets.defense.DT, {})

	sets.engaged = {
		--main="Iztaasu +2",			sub="Beatific Shield",
		ammo="Jukukik Feather",
		head="Vitivation Chapeau +1",	neck="Asperity Necklace",	ear1="Brutal Earring",	ear2="Suppanomimi",
		body="Hagondes Coat +1",		hands="Atrophy Gloves",		ring1="Rajas Ring",		ring2="Tyrant's Ring",
		back="Atheling Mantle",			waist="Cetl Belt",			legs="Atrophy Tights",	feet="Atrophy Boots"
	}
	sets.engaged.with_buff = {}
	
	sets.engaged.Skillup = {
		ammo="Jukukik Feather",
		head="Temachtiani Headband",	neck="Asperity Necklace",	ear1="Brutal Earring",		ear2="Suppanomimi",
		body="Hagondes Coat +1",		hands="Atrophy Gloves",		ring1="Rajas Ring",			ring2="Tyrant's Ring",
		back="Atheling Mantle",			waist="Cetl Belt",			legs="Temachtiani Pants",	feet="Temachtiani Boots"
	}
end