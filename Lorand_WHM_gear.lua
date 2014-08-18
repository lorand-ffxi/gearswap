-----------------------------------------------------------------------------------------------------------
--[[
	Author: Ragnarok.Lorand
	
	Slips:	
		1:	Marduk Body
		10:	Head/Body/Hands/Legs/Feet
		14:	Nares Hands/Legs
		15:	Theophany Head/Body/Legs
--]]
-----------------------------------------------------------------------------------------------------------

function init_gear_sets()
	--============================================================
	--					Precast sets
	--============================================================
	sets.precast.FC = {				--48%
		ammo="Incantor Stone",		--2%
		head="Nahtirah Hat",		--10%
		neck="Orunmila's Torque",	--5%
		ear1="Loquacious Earring",	--2%
		body="Marduk's Jubbah",		--5%
		hands="Gendewitha Gages +1",--7%
		ring1="Prolix Ring",		--2%
		back="Swith Cape",			--3%
		waist="Witful Belt",		--3%
		legs="Artsieq Hose",		--5%
		feet="Chelona Boots"		--4%
	}
		
	sets.precast.FC.EnhancingMagic = {	--53%
		waist="Siegel Sash"			--8%
	}
	sets.precast.FC.HealingMagic = {	--55%
		legs="Orison Pantaloons +2"	--12%
	}
	sets.precast.FC.Cure = {		--68%
		main="Tamaxchi",			--0%
		sub="Genbu's Shield",		--8%
		back="Pahtli Cape",			--8%
	}
	
	sets.precast.FC.Lightning = {main="Apamajas I"}
	
	--============================================================
	
	sets.precast.JA.Benediction = {body="Cleric's Briault +2"}
	sets.precast.JA.Martyr = {hands="Piety Mitts"}

	sets.precast.Waltz = {}
	
	--============================================================
	
	sets.wsBase = {
		ammo="Jukukik Feather",
		head="Gendewitha Caubeen +1",	neck="Asperity Necklace",		ear1="Bladeborn Earring",	ear2="Steelflash Earring",
		body="Weatherspoon Robe +1",	hands="Gendewitha Gages +1",	ring1="Rajas Ring",			ring2="Mars's Ring",
		back="Buquwik Cape",			waist="Windbuffet Belt",		legs="Gendewitha Spats +1",	feet="Uk'uxkaj Boots"
	}
	
	sets.wsBase.Magic = {
		ammo="Dosis Tathlum",
		head="Buremte Hat",		neck="Eddy Necklace",	ear1="Hecate's Earring",	ear2="Friomisi Earring",
		body="Artsieq Jubbah",	hands="Otomi Gloves",	ring1="Fenrir Ring +1",		ring2="Acumen Ring",
		back="Toro Cape",		waist="Aswang Sash",	legs="Gendewitha Spats +1",	feet="Theophany Duckbills"
	}
	
	--============================================================
	--					Midcast sets
	--============================================================
	
	sets.midcast.FastRecast = {
		main="Venabulum",			sub="Achaq Grip",			ammo="Impatiens",
		head="Nahtirah Hat",		neck="Orunmila's Torque",	ear1="Loquacious Earring",	ear2="Novia Earring",
		body="Theophany Briault",	hands="Otomi Gloves",		ring1="Prolix Ring",		ring2="Diamond Ring",
		back="Swith Cape",			waist="Witful Belt",		legs="Artsieq Hose",		feet="Theophany Duckbills"
	}
	
	sets.midcast.MagicAccuracy = {
		main="Lehbrailg +2",	sub="Mephitis Grip",	ammo="Kalboron Stone",
		head="Kaabnax Hat",		neck="Eddy Necklace",	ear1="Lifestorm Earring",	ear2="Psystorm Earring",
		body="Artsieq Jubbah",	hands="Lurid Mitts",	ring1="Sangoma Ring",		ring2="Perception Ring",
		back="Ogapepo Cape",	waist="Aswang Sash",	legs="Artsieq Hose",		feet="Bokwus Boots"
	}

	--====================== Healing =============================
	
	sets.midcast.HealingMagic = {
		neck="Colossus's Torque",
		body="Orison Bliaud +2",		hands="Theophany Mitts",
		legs="Cleric's Pantaloons +2"
	}
	
	sets.midcast.Cure = {
		main="Tamaxchi",				sub="Genbu's Shield",			ammo="Incantor Stone",
		head="Gendewitha Caubeen +1",	neck="Orunmila's Torque",		ear1="Loquacious Earring",		ear2="Roundel Earring",
		body="Orison Bliaud +2",		hands="Weatherspoon Cuffs +1",	ring1="Prolix Ring",			ring2="Aquasoul Ring",
		back="Swith Cape",				waist="Cetl Belt",				legs="Orison Pantaloons +2",	feet="Theophany Duckbills"
	}
	sets.midcast.Curaga = sets.midcast.Cure
	sets.midcast.Cure.Engaged = sets.midcast.Cure

	sets.midcast.Cursna = {
		legs="Theophany Pantaloons"
	}

	sets.midcast.StatusRemoval = {
		head="Orison Cap +2"
	}
	sets.midcast.StatusRemoval['Divine Caress'] = {
		hands="Orison Mitts +2"
	}

	--====================== Enhancing ===========================
	
	sets.midcast.EnhancingMagic = {
		neck="Colossus's Torque",
		body="Manasa Chasuble",		hands="Dynasty Mitts",
		waist="Cascade Belt",		legs="Cleric's Pantaloons +2",	feet="Orison Duckbills +2"
	}
	
	sets.midcast.Stoneskin = {
		neck="Stone Gorget",	ear1="Lifestorm Earring",	ear2="Earthcry Earring",
		ring2="Aquasoul Ring",
		back="Tuilha Cape",		waist="Siegel Sash",		legs="Haven Hose"
	}
	sets.midcast.Auspice = {feet="Orison Duckbills +2"}
	sets.midcast.Aquaveil = {waist="Emphatikos Rope"}

	sets.midcast.BarElement = {
		head="Orison Cap +2",
		body="Orison Bliaud +2",		hands="Orison Mitts +2",
		legs="Cleric's Pantaloons +2",	feet="Orison Duckbills +2"
	}

	sets.midcast.Regen = {
		body="Cleric's Briault +2",	hands="Orison Mitts +2",
		legs="Theophany Pantaloons"
	}
	
	sets.midcast.Protectra = {
		ring2="Sheltered Ring",
	}
	sets.midcast.Shellra = {
		ring2="Sheltered Ring",
	}
	
	--====================== Offensive ===========================	
	
	sets.midcast.DivineMagic = {
		hands="Piety Mitts",
		legs="Theophany Pantaloons"
	}
				
	sets.midcast.DivineMagic.Nuke = {
		main="Venabulum",		sub="Zuuxowu Grip",		ammo="Dosis Tathlum",
		head="Buremte Hat",		neck="Eddy Necklace",	ear1="Hecate's Earring",	ear2="Friomisi Earring",
		body="Artsieq Jubbah",	hands="Otomi Gloves",	ring1="Fenrir Ring +1",		ring2="Acumen Ring",
		back="Toro Cape",		waist="Cascade Belt",	legs="Gendewitha Spats +1",	feet="Weatherspoon Souliers +1"
	}
	
	sets.midcast.DarkMagic = {}

	sets.midcast.EnfeeblingMagic = {
		main="Lehbrailg +2",	sub="Mephitis Grip",
		body="Theophany Briault",
		feet="Theophany Duckbills"
	}
	sets.midcast.EnfeeblingMagic.Potency = {
		ring2="Aquasoul Ring",
		waist="Cascade Belt",	feet="Uk'uxkaj Boots"
	}
	sets.midcast.EnfeeblingMagic.Potency.Resistant = {}
	sets.midcast.EnfeeblingMagic.Potency.Normal = {}
	
	sets.midcast.ElementalMagic = {
		main="Venabulum",				sub="Zuuxowu Grip",			ammo="Dosis Tathlum",
		head="Buremte Hat",				neck="Eddy Necklace",		ear1="Hecate's Earring",	ear2="Friomisi Earring",
		body="Weatherspoon Robe +1",	hands="Otomi Gloves",		ring1="Fenrir Ring +1",		ring2="Acumen Ring",
		back="Toro Cape",				waist="Aswang Sash",		legs="Gendewitha Spats +1",	feet="Uk'uxkaj Boots"
	}
	sets.midcast.ElementalMagic.Earth = {neck="Quanpur Necklace"}
	
	--============================================================
	--					Other sets
	--============================================================
	
	sets.resting = {
		main="Chatoyant Staff",			sub="Elder's Grip",			ammo="Kalboron Stone",
		head="Nahtirah Hat",			neck="Eidolon Pendant",		ear1="Loquacious Earring",	ear2="Relaxing Earring",
		body="Gendewitha Bilaut +1",	hands="Nares Cuffs",		ring1="Defending Ring",		ring2="Sheltered Ring",
		back="Felicitas Cape",			waist="Emphatikos Rope",	legs="Nares Trews",			feet="Chelona Boots"
	}

	sets.idle = {
		main="Terra's Staff",	sub="Elder's Grip",			ammo="Incantor Stone",
		head="Nahtirah Hat",	neck="Twilight Torque",		ear1="Novia Earring",	ear2="Ethereal Earring",
		body="Artsieq Jubbah",	hands="Dynasty Mitts",		ring1="Defending Ring",	ring2="Sheltered Ring",
		back="Cheviot Cape",	waist="Emphatikos Rope",	legs="Artsieq Hose",	feet="Serpentes Sabots"
	}
	sets.idle.speedy = {feet="Herald's Gaiters"}
	sets.idle.lowMP = {
		--main="Owleyes",		sub="Genbu's Shield",
		legs="Nares Trews"
	}
	sets.idle.lowMP_night =	{hands="Serpentes Cuffs"}
	sets.idle.lowMP_day = {feet="Serpentes Sabots"}
	
	sets.idle.with_buff = {}
	
	sets.defense.DT = {}
	sets.defense.PDT = combineSets(sets.defense.DT, {
	})
	sets.defense.MDT = combineSets(sets.defense.DT, {
	})
	
	sets.engaged = {
		ammo="Jukukik Feather",
		head="Nahtirah Hat",	neck="Asperity Necklace",	ear1="Bladeborn Earring",	ear2="Steelflash Earring",
		body="Artsieq Jubbah",	hands="Otomi Gloves",		ring1="Rajas Ring",			ring2="K'ayres Ring",
		back="Bukuwik Cape",	waist="Cetl Belt",			legs="Artsieq Hose",		feet="Theophany Duckbills"
	}
	sets.engaged.with_buff = {}
end