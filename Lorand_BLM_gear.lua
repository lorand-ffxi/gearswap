-----------------------------------------------------------------------------------------------------------
--[[
	Author: Ragnarok.Lorand
	
	Slips:
		2:	Loquacious Earring
		3:	Twilight Torque/Cape
		10:	Goetia+2 Head/Feet
		15:	Spaekona's Body/Legs
--]]
-----------------------------------------------------------------------------------------------------------

function init_gear_sets()
	--============================================================
	--					Precast sets
	--============================================================
	sets.precast.JA['Mana Wall'] = {feet="Goetia Sabots +2"}
	sets.precast.JA['Manafont'] = {body="Sorcerer's Coat +2"}
	sets.precast.JA['Convert'] = {}
	
	sets.precast.FC = {
		ammo="Impatiens",
		head="Nahtirah Hat",		neck="Orunmila's Torque",	ear1="Loquacious Earring",
		hands="Repartie Gloves",	ring1="Prolix Ring",		ring2="Veneficium Ring",
		back="Swith Cape",			waist="Witful Belt",		legs="Artsieq Hose",		feet="Chelona Boots"
	}

	sets.precast.FC.EnhancingMagic = {waist="Siegel Sash"}
	sets.precast.FC.ElementalMagic = {head="Goetia Petasos +2"}
	sets.precast.FC.Lightning = {main="Apamajas I"}
	sets.precast.FC.Cure = {
		main="Tamaxchi",	sub="Genbu's Shield",
		back="Pahtli Cape"
	}
	sets.precast.FC.Curaga = sets.precast.FC.Cure

	--============================================================
	
	sets.wsBase = {}
	sets.wsBase.Magic = {}
	
	--============================================================
	--					Midcast sets
	--============================================================
	sets.midcast.FastRecast = {
		ammo="Impatiens",
		head="Nahtirah Hat",		neck="Orunmila's Torque",	ear1="Loquacious Earring",
		body="Hagondes Coat +1",	hands="Otomi Gloves",		ring1="Prolix Ring",
		back="Swith Cape",			waist="Witful Belt",		legs="Artsieq Hose",		feet="Bokwus Boots"
	}

	sets.midcast.Cure = {
		main="Tamaxchi",			sub="Genbu's Shield",			ammo="Impatiens",
		head="Nahtirah Hat",		neck="Orunmila's Torque",		ear1="Roundel Earring",	ear2="Star Earring",
		body="Hagondes Coat +1",	hands="Weatherspoon Cuffs +1",	ring1="Aquasoul Ring",	ring2="Aqua Ring",
		back="Oretania's Cape",		waist="Witful Belt",			legs="Nares Trews",		feet="Hagondes Sabots +1"
	}
	sets.midcast.Curaga = sets.midcast.Cure

	sets.midcast.EnhancingMagic = {
		neck="Colossus's Torque",
		body="Hyksos Robe",			
		waist="Cascade Belt"
	}
	sets.midcast.Aquaveil = {waist="Emphatikos Rope"}
	sets.midcast.Stoneskin = {
		neck="Stone Gorget",			ear1="Loquacious Earring",	ear2="Earthcry Earring",
		hands="Weatherspoon Cuffs +1",	ring1="Aquasoul Ring",		ring2="Aqua Ring",
		back="Tuilha Cape",				waist="Siegel Sash",		legs="Haven Hose",		feet="Hagondes Sabots +1"
	}

	sets.midcast.MagicAccuracy = {
		main="Kaladanda",		sub="Mephitis Grip",		ammo="Kalboron Stone",
		head="Kaabnax Hat",		neck="Stoicheion Medal",	ear1="Lifestorm Earring",	ear2="Psystorm Earring",
		body="Spaekona's Coat",	hands="Lurid Mitts",		ring1="Balrahn's Ring",		ring2="Perception Ring",
		back="Bane Cape",		waist="Aswang Sash",		legs="Artsieq Hose",		feet="Bokwus Boots"
	}
	
	sets.midcast.EnfeeblingMagic = {
		neck="Enfeebling Torque"
	}
		
	sets.midcast.ElementalEnfeeble = sets.midcast.EnfeeblingMagic

	sets.midcast.DarkMagic = {
		neck="Dark Torque",
		legs="Spaekona's Tonban",
		feet="Goetia Sabots +2"
	}

	sets.midcast.Stun = {
		main="Apamajas II",			sub="Mephitis Grip",	ammo="Kalboron Stone",
		head="Nahtirah Hat",			neck="Dark Torque",		ear1="Lifestorm Earring",	ear2="Psystorm Earring",
		body="Spaekona's Coat",		hands="Otomi Gloves",	ring1="Sangoma Ring",		ring2="Perception Ring",
		back="Ogapepo Cape",		waist="Witful Belt",	legs="Artsieq Hose",		feet="Bokwus Boots"
	}

	sets.midcast.BardSong = {}

	sets.midcast.ElementalMagic = {
		main="Kaladanda",			sub="Zuuxowu Grip",			ammo="Dosis Tathlum",
		head="Buremte Hat",			neck="Stoicheion Medal",	ear1="Hecate's Earring",	ear2="Friomisi Earring",
		body="Hagondes Coat +1",	hands="Otomi Gloves",		ring1="Fenrir Ring +1",		ring2="Acumen Ring",
		back="Bane Cape",			waist="Aswang Sash",		legs="Hagondes Pants +1",	feet="Hagondes Sabots +1"
	}
	sets.midcast.ElementalMagic.Earth = {neck="Quanpur Necklace"}
	
	--============================================================
	--					Other sets
	--============================================================
	
	sets.resting = {
		main="Chatoyant Staff",		sub="Elder's Grip",			ammo="Kalboron Stone",
		head="Kaabnax Hat",			neck="Eidolon Pendant",		ear1="Loquacious Earring",	ear2="Relaxing Earring",
		body="Hagondes Coat +1",	hands="Nares Cuffs",		ring1="Dark Ring",			ring2="Sheltered Ring",
		back="Felicitas Cape",		waist="Emphatikos Rope",	legs="Nares Trews",			feet="Chelona Boots"
	}
	
	sets.idle = {
		main="Terra's Staff",		sub="Elder's Grip",			ammo="Impatiens",
		head="Kaabnax Hat",			neck="Twilight Torque",		ear1="Novia Earring",	ear2="Ethereal Earring",
		body="Artsieq Jubbah",		hands="Yaoyotl Gloves",		ring1="Defending Ring",	ring2="Sheltered Ring",
		back="Cheviot Cape",		waist="Emphatikos Rope",	legs="Artsieq Hose",	feet="Serpentes Sabots"
	}
	sets.idle.speedy = {feet="Herald's Gaiters"}
	sets.idle.lowMP = {
		--main="Owleyes",		sub="Genbu's Shield",
		legs="Nares Trews"
	}
	sets.idle.lowMP_night =	{hands="Serpentes Cuffs"}
	sets.idle.lowMP_day = {feet="Serpentes Sabots"}
	
	sets.idle.with_buff = {}
	
	-- Defense sets
	sets.defense.PDT = sets.idle
	sets.defense.MDT = sets.idle
	
	sets.buffs['Mana Wall'] = {feet="Goetia Sabots +2"}

	sets.engaged = {}
	sets.engaged.with_buff = {}
end