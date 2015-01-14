-----------------------------------------------------------------------------------------------------------
--[[
	Author: Ragnarok.Lorand
	
	Slips:
		2:	Blood legs, Enif Cosciales, Loq. Earring
		3:	Twilight Helm/Body
		8:	Creed Collar/Earring/Baudrier
		10:	Creed+2 Body/Feet
		16:	Reverence+1 (all)
		18:	Caballarius+1 (all)
--]]
-----------------------------------------------------------------------------------------------------------

function init_gear_sets()
	sets.Enmity = {	--68
		head="Hero's Galea",		neck="Invidia Torque",			ear2="Friomisi Earring",
		body="Creed Cuirass +2",	hands="Tjukurrpa Gauntlets",	ring1="Eihwaz Ring",			ring2="Provocare Ring",
		back="Earthcry Mantle",		waist="Creed Baudrier",			legs="Caballarius Breeches +1",	feet="Creed Sabatons +2"
	}
	--============================================================
	--					Precast sets
	--============================================================
	sets.precast.JA = sets.Enmity
	sets.precast.JA['Invincible'] = {legs="Caballarius Breeches +1"}
	sets.precast.JA['Holy Circle'] = {feet="Reverence Leggings +1"}
	sets.precast.JA['Shield Bash'] = {
		ear1="Creed Earring",
		hands="Caballarius Gauntlets +1",	ring2="Fenian Ring",
		feet="Reverence Leggings +1"
	}
	sets.precast.JA['Sentinel'] = {feet="Caballarius Leggings +1"}
	sets.precast.JA['Rampart'] = {head="Caballarius Coronet +1"}
	sets.precast.JA['Fealty'] = {body="Caballarius Surcoat +1"}
	sets.precast.JA['Divine Emblem'] = {feet="Creed Sabatons +2"}
	sets.precast.JA['Chivalry'] = {hands="Caballarius Gauntlets +1"}
	
	sets.precast.Waltz = {
		head="Reverence Coronet +1",	neck="Invidia Torque",				ear1="Creed Earring",			ear2="Friomisi Earring",
		body="Reverence Surcoat +1",	hands="Caballarius Gauntlets +1",	ring1="Eihwaz Ring",			ring2="Asklepian Ring",
		back="Earthcry Mantle",			waist="Creed Baudrier",				legs="Caballarius Breeches +1",	feet="Caballarius Leggings +1"
	}
	sets.precast.Waltz['Healing Waltz'] = {}

	--============================================================
	
	sets.precast.FC = {				--35%
		ammo="Incantor Stone",		--2%
		head="Cizin Helm +1",		--5%
		neck="Orunmila's Torque",	--5%
		ear2="Loquacious Earring",	--2%
		body="Nuevo Coselete",		--5%
		hands="Buremte Gloves",		--3%
		ring1="Prolix Ring",		--2%
		ring2="Veneficium Ring",	--Q+1%
		legs="Enif Cosciales",		--8%
		feet="Ejekamal Boots"		--3%
	}
	sets.precast.FC.EnhancingMagic = {waist="Siegel Sash"}
		
	--============================================================
       
	sets.wsBase = {
		ammo="Jukukik Feather",
		head="Otomi Helm",			neck="Asperity Necklace",	ear1="Bladeborn Earring",	ear2="Steelflash Earring",
		body="Gorney Haubert +1",	hands="Cizin Mufflers +1",	ring1="Rajas Ring",			ring2="Mars's Ring",
		back="Atheling Mantle",		waist="Windbuffet Belt +1",	legs="Cizin Breeches +1",	feet="Ejekamal Boots"
	}
	
	sets.wsBase.DEX = {ring2="Thundersoul Ring"}
	sets.wsBase.STR = {ring2="Pyrosoul Ring"}

	sets.wsBase.magic = {
		ammo="Dosis Tathlum",
		neck="Stoicheion Medal",	ear1="Hecate's Earring",	ear2="Friomisi Earring",
		ring1="Fenrir Ring +1",		ring2="Acumen Ring",
		back="Toro Cape"
	}
	
	--============================================================
	--					Midcast sets
	--============================================================
	sets.midcast.Enmity = sets.Enmity
	
	sets.midcast.FastRecast = {		--NOTE: Have not re-evaluated yet
		ammo="Incantor Stone",
		head="Cizin Helm +1",			neck="Orunmila's Torque",		ear1="Creed Earring",			ear2="Loquacious Earring",
		body="Reverence Surcoat +1",	hands="Caballarius Gauntlets +1",	ring1="Prolix Ring",			ring2="Eihwaz Ring",
		back="Earthcry Mantle",			waist="Cetl Belt",				legs="Caballarius Breeches +1",	feet="Ejekamal Boots"
	}
	
	sets.midcast.MagicAccuracy = {
		ring1="Balrahn's Ring", ring2="Perception Ring"
	}
	
	sets.midcast.DivineMagic = {	--Haste+23%, FC+9%, Enmity+61
		ammo="Incantor Stone",
		head="Cizin Helm +1",			neck="Invidia Torque",			ear1="Friomisi Earring",		ear2="Loquacious Earring",
		body="Reverence Surcoat +1",	hands="Caballarius Gauntlets +1",	ring1="Eihwaz Ring",			ring2="Provocare Ring",
		back="Earthcry Mantle",			waist="Creed Baudrier",			legs="Caballarius Breeches +1",	feet="Creed Sabatons +2"
	}
	
	sets.midcast.Cure = {	--Enmity+56, Haste+23%, FC+5%, Interrupt-10%, Cure+7%
		ammo="Impatiens",
		head="Cizin Helm +1",			neck="Invidia Torque",			ear1="Hospitaler Earring",		ear2="Friomisi Earring",
		body="Reverence Surcoat +1",	hands="Reverence Gauntlets +1",	ring1="Eihwaz Ring",			ring2="Provocare Ring",
		back="Fierabras's Mantle",		waist="Creed Baudrier",			legs="Caballarius Breeches +1",	feet="Caballarius Leggings +1"
	}
	
	sets.midcast.Cure.Self = {	--Enmity+33, Haste+29%, FC+8%, Interrupt-10%, Cure+7%, Cure received+31%
		ammo="Impatiens",
		head="Cizin Helm +1",			neck="Invidia Torque",	ear1="Hospitaler Earring",	ear2="Oneiros Earring",
		body="Reverence Surcoat +1",	hands="Buremte Gloves",	ring1="Kunaji Ring",		ring2="Asklepian Ring",
		back="Fierabras's Mantle",		waist="Chuq'aba Belt",	legs="Reverence Breeches +1",	feet="Caballarius Leggings +1"
	}

	sets.midcast.EnhancingMagic = {	--Enmity+43, Haste+23%, FC+7%, Interrupt-10%, Enhancing Skill+25, Enhancing duration+9
		ammo="Impatiens",
		head="Cizin Helm +1",	neck="Colossus's Torque",		ear1="Friomisi Earring",		ear2="Loquacious Earring",
		body="Shabti Cuirass",	hands="Reverence Gauntlets +1",	ring1="Eihwaz Ring",			ring2="Provocare Ring",
		back="Earthcry Mantle",	waist="Cascade Belt",			legs="Reverence Breeches +1",		feet="Caballarius Leggings +1"
	}
	sets.midcast.Protect = {ring1="Sheltered Ring"}
	sets.midcast.Shell = {ring1="Sheltered Ring"}

	--============================================================
	--					Other sets
	--============================================================
		
	sets.Reraise = {head="Twilight Helm", body="Twilight Mail"}
	
	sets.resting = {
		head="Twilight Helm",			neck="Creed Collar",			ear2="Relaxing Earring",
		body="Twilight Mail",			ring1="Paguroidea Ring",
		legs="Reverence Breeches +1",	feet="Reverence Leggings +1"
	}
	
	sets.idle = {
		ammo="Angha Gem",
		head="Twilight Helm",	neck="Creed Collar",			ear1="Creed Earring",			ear2="Ethereal Earring",
		body="Twilight Mail",	hands="Reverence Gauntlets +1",	ring1="Defending Ring",			ring2="Sheltered Ring",
		back="Weard Mantle",	waist="Nierenschutz",			legs="Reverence Breeches +1",	feet="Caballarius Leggings +1"
	}
	sets.idle.speedy = {legs="Blood Cuisses"}
	sets.idle.Showoff = {
		head="Reverence Coronet +1",	body="Caballarius Surcoat +1",	legs="Blood Cuisses"
	}
	sets.idle.with_buff = {}
	
	sets.idle.PDT = {	--51% PDT, 41% MDT
		ammo="Angha Gem",
		head="Reverence Coronet +1",	neck="Twilight Torque",			ear1="Creed Earring",		ear2="Ethereal Earring",
		body="Reverence Surcoat +1",	hands="Reverence Gauntlets +1",	ring1="Defending Ring",		ring2="Eihwaz Ring",
		back="Weard Mantle",			waist="Flume Belt",				legs="Cizin Breeches +1",	feet="Cizin Greaves +1"
	}
	
	sets.idle.MDT = {	--50% MDT, 45% PDT
		ammo="Demonry Stone",
		head="Reverence Coronet +1",	neck="Twilight Torque",			ear1="Merman's Earring",	ear2="Merman's Earring",
		body="Reverence Surcoat +1",	hands="Reverence Gauntlets +1",	ring1="Defending Ring",		ring2="Eihwaz Ring",
		back="Weard Mantle",			waist="Nierenschutz",			legs="Cizin Breeches +1",	feet="Caballarius Leggings +1"
	}
	
	sets.defense.DT = {	--DT-37%~41/42%(dark ring)
		--sub="Priwen"
		neck="Twilight Torque",			ear1="Creed Earring",
		body="Caballarius Surcoat +1",	ring1="Defending Ring",		ring2="Dark Ring",
		back="Weard Mantle",			waist="Nierenschutz"
	}
	
	sets.defense.PDT = {	--51% PDT, 41% MDT
		ammo="Angha Gem",
		head="Reverence Coronet +1",	neck="Twilight Torque",			ear1="Creed Earring",		ear2="Ethereal Earring",
		body="Reverence Surcoat +1",	hands="Reverence Gauntlets +1",	ring1="Defending Ring",		ring2="Eihwaz Ring",
		back="Weard Mantle",			waist="Flume Belt",				legs="Cizin Breeches +1",	feet="Cizin Greaves +1"
	}

	sets.defense.MDT = {	--50% MDT, 45% PDT
		ammo="Demonry Stone",
		head="Reverence Coronet +1",	neck="Twilight Torque",			ear1="Merman's Earring",	ear2="Merman's Earring",
		body="Reverence Surcoat +1",	hands="Reverence Gauntlets +1",	ring1="Defending Ring",		ring2="Eihwaz Ring",
		back="Weard Mantle",			waist="Nierenschutz",			legs="Cizin Breeches +1",	feet="Caballarius Leggings +1"
	}
	
	sets.engaged = {
		ammo="Jukukik Feather",
		head="Otomi Helm",			neck="Asperity Necklace",	ear1="Bladeborn Earring",	ear2="Steelflash Earring",
		body="Gorney Haubert +1",	hands="Cizin Mufflers +1",	ring1="Rajas Ring",			ring2="K'ayres Ring",
		back="Atheling Mantle",		waist="Windbuffet Belt +1",	legs="Cizin Breeches +1",	feet="Ejekamal Boots"
	}
	
	sets.engaged.with_buff = {}
	
	sets.engaged.TankP = {	--50% PDT, 34% MDT
		ammo="Angha Gem",
		head="Reverence Coronet +1",	neck="Twilight Torque",			ear1="Creed Earring",		ear2="Ethereal Earring",
		body="Caballarius Surcoat +1",	hands="Cizin Mufflers +1",		ring1="Defending Ring",		ring2="Eihwaz Ring",
		back="Weard Mantle",			waist="Cetl Belt",				legs="Cizin Breeches +1",	feet="Cizin Greaves +1"
	}
	
	sets.engaged.TankM = {	--50% MDT, 38% PDT
		ammo="Demonry Stone",
		head="Reverence Coronet +1",	neck="Twilight Torque",			ear1="Merman's Earring",	ear2="Merman's Earring",
		body="Reverence Surcoat +1",	hands="Reverence Gauntlets +1",	ring1="Defending Ring",		ring2="Eihwaz Ring",
		back="Weard Mantle",			waist="Nierenschutz",			legs="Cizin Breeches +1",	feet="Caballarius Leggings +1"
	}
	
	sets.engaged.TankMix = {	--45% PDT, 44% MDT
		ammo="Angha Gem",
		head="Reverence Coronet +1",	neck="Twilight Torque",			ear1="Creed Earring",		ear2="Ethereal Earring",
		body="Caballarius Surcoat +1",	hands="Reverence Gauntlets +1",	ring1="Defending Ring",		ring2="Eihwaz Ring",
		back="Weard Mantle",			waist="Cetl Belt",				legs="Cizin Breeches +1",	feet="Caballarius Leggings +1"
	}
	
	sets.engaged.Shield = {}
	
	sets.buffs.doom = {ring1="Saida Ring", ring2="Saida Ring", legs="Shabti Cuisses"}
	sets.buffs.Cover = {head="Reverence Coronet +1", body="Caballarius Surcoat +1"}
end