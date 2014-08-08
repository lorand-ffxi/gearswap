-----------------------------------------------------------------------------------------------------------
--[[
	Author: Ragnarok.Lorand
	
	Gorgets needed: BREEZE & LIGHT

	Slips:
		2:	Love/Hope Torque, Homam Legs, Loq Earring, Brutal Earring
		3: 	Twilight Torque
		8:	Boomerang
		10:	Raider's Legs/Feet
		14:	Qaaxo Harness
		15:	Pillager's Feet
		17:	Plunderer's Hands/Feet
--]]
-----------------------------------------------------------------------------------------------------------

function init_gear_sets()
	--============================================================
	--					Precast sets
	--============================================================
	sets.NormalWeapons = {
		--main="Sandung",	sub="Leisilonu +2",
	}
	sets.TreasureHunter = {
		hands="Plunderer's Armlets +1",
		feet="Raider's Poulaines +2"
	}
	
	sets.precast.JA['Collaborator'] = {}
	sets.precast.JA['Accomplice'] = {}
	sets.precast.JA['Flee'] = {feet="Pillager's Poulaines"}
	sets.precast.JA['Hide'] = {}
	sets.precast.JA['Conspirator'] = {}
	sets.precast.JA['Steal'] = {feet="Pillager's Poulaines"}
	sets.precast.JA['Despoil'] = {legs="Raider's Culottes +2",feet="Raider's Poulaines +2"}
	sets.precast.JA['Perfect Dodge'] = {hands="Plunderer's Armlets +1"}
	sets.precast.JA['Feint'] = {}
	sets.precast.JA["Assassin's Charge"] = {feet="Plunderer's Poulaines"}

	sets.precast.JA['Sneak Attack'] = {
		head="Uk'uxkaj Cap",		neck="Love Torque",				ear2="Delta Earring",
		body="Shneddick Tabard +1",	hands="Shneddick Gloves +1",	ring1="Rajas Ring",			ring2="Thundersoul Ring",
		back="Kayapa Cape",			waist="Warwolf Belt",			legs="Kaabnax Trousers",	feet="Shneddick Boots +1"
	}

	sets.precast.JA['Trick Attack'] = {
		head="Uk'uxkaj Cap",		neck="Hope Torque",				ear2="Suppanomimi",
		body="Shneddick Tabard +1",	hands="Iuitl Wristbands +1",	ring1="Stormsoul Ring",		ring2="Blobnag Ring",
		back="Ik Cape",				waist="Sveltesse Gouriz",		legs="Kaabnax Trousers",	feet="Shneddick Boots +1"
	}

	sets.precast.Waltz = {
		head="Uk'uxkaj Cap",
		body="Shneddick Tabard +1",	hands="Plunderer's Armlets +1",	ring2="Spiral Ring",
		back="Iximulew Cape",		waist="Warwolf Belt",			legs="Shneddick Tights +1",	feet="Shneddick Boots +1"
	}
	sets.precast.Waltz['Healing Waltz'] = {}
	
	--============================================================
	
	sets.precast.FC = {
		head="Anwig Salade",		--5%
		neck="Orunmila's Torque",	--5%
		ear1="Loquacious Earring",	--2%
		hands="Thaumas Gloves",		--4%
		ring1="Prolix Ring",		--2%
		ring2="Veneficium Ring",	--Q+1%
		legs="Enif Cosciales"		--7%
	}
	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Bead Necklace"})

	--============================================================
	
	--Snapshot
	sets.precast.RangedAttack = {hands="Iuitl Wristbands +1"}

	sets.wsBase = {
		head="Iuitl Headgear +1",	neck="Asperity Necklace",		ear1="Steelflash Earring",	ear2="Bladeborn Earring",
		body="Iuitl Vest +1",		hands="Plunderer's Armlets +1",	ring1="Rajas Ring",			ring2="Epona's Ring",
		back="Atheling Mantle",	waist="Anguinus Belt",			legs="Quiahuiz Trousers",	feet="Plunderer's Poulaines"
	}
	
	sets.wsBase.Acc = {
		head="Ejekamal Mask",
		hands="Buremte Gloves",
		legs="Kaabanax Trousers"
	}

	sets.wsBase.Magic = {
		neck="Stoicheion Medal",	ear1="Hecate's Earring",	ear2="Friomisi Earring",
		back="Toro Cape",			legs="Shneddick Tights +1"
	}
	
	sets.wsBase['Aeolian Edge'] = sets.precast.WS.Magic
	
	
	--============================================================
	--					Midcast sets
	--============================================================
	
	sets.midcast.FastRecast = {
		head="Ejekamal Mask",	neck="Orunmila's Torque",	ear1="Loquacious Earring",
		body="Iuitl Vest +1",		hands="Buremte Gloves",		ring1="Prolix Ring",		ring2="Diamond Ring",	--Diamond Ring aug: 2% interrupt rate down
		back="Mujin Mantle",	waist="Cetl Belt",			legs="Kaabnax Trousers",	feet="Iuitl Gaiters"
	}
	
	sets.midcast.Utsusemi = {
		back="Mujin Mantle"
	}

	sets.midcast.RangedAttack = {
		head="Uk'uxkaj Cap",	neck="Hope Torque",		ear1="Clearview Earring",	ear2="Volley Earring",
		body="Iuitl Vest +1",		hands="Buremte Gloves",	ring2="Longshot Ring",
		back="Kayapa Cape",		waist="Patentia Sash",	legs="Iuitl Tights",		feet="Iuitl Gaiters"
	}
	sets.midcast.RangedAttack.TH = set_combine(sets.midcast.RangedAttack, sets.TreasureHunter)
	sets.midcast.RangedAttack.Acc = set_combine(sets.midcast.RangedAttack, {
		ring1="Blobnag Ring",
		feet="Pillager's Poulaines"
	})
	
	--============================================================
	--					Other sets
	--============================================================
	
	sets.resting = {}
	
	sets.idle = {
		range="Raider's Boomerang",
		head="Ocelomeh Headpiece +1",	neck="Orochi Nodowa",			ear1="Novia Earring",		ear2="Ethereal Earring",
		body="Qaaxo Harness",			hands="Plunderer's Armlets +1",	ring1="Defending Ring",		ring2="Sheltered Ring",
		back="Repulse Mantle",			waist="Flume Belt",				legs="Kaabnax Trousers",	feet="Pillager's Poulaines"
	}
	sets.idle.Speedy = set_combine(sets.idle, {feet="Skadi's Jambeaux +1"})

	sets.defense.Evasion = {
		head="Shneddick Chapeau +1",	neck="Torero Torque",			ear1="Novia Earring",		ear2="Ethereal Earring",
		body="Shneddick Tabard +1",		hands="Plunderer's Armlets +1",	ring1="Dark Ring",			ring2="Alert Ring",
		back="Ik Cape",					waist="Sveltesse Gouriz",		legs="Kaabnax Trousers",	feet="Shneddick Boots +1"
	}

	sets.defense.DT = {	--DT-5%, PDT-10%, MDT-7%	=> PDT-15%, MDT-12%
		neck="Twilight Torque",
		ring1="Dark Ring",		ring2="Dark Ring"
	}
	
	sets.defense.PDT = set_combine(sets.defense.Evasion, sets.defense.DT, {	--PDT-18% + DT => PDT-33%
		head="Iuitl Headgear +1",
		body="Iuitl Vest +1",		hands="Iuitl Wristbands +1",
		back="Repulse Mantle",		waist="Flume Belt",				legs="Iuitl Tights",	feet="Iuitl Gaiters"
	})

	sets.defense.MDT = set_combine(sets.defense.Evasion, sets.defense.DT, {	--MDT-4% + DT => MDT-16%, MDB+19
		head="Ejekamal Mask",	ear1="Merman's Earring",	ear2="Merman's Earring",
		body="Iuitl Vest +1",	hands="Buremte Gloves",
		back="Tuilha Cape",		waist="Flume Belt",			legs="Kaabnax Trousers",	feet="Iuitl Gaiters"
	})
	
	sets.engaged = {
		range="Raider's Boomerang",
		head="Iuitl Headgear +1",	neck="Asperity Necklace",		ear1="Dudgeon Earring",		ear2="Heartseeker Earring",
		body="Qaaxo Harness",		hands="Plunderer's Armlets +1",	ring1="Rajas Ring",			ring2="Epona's Ring",
		back="Atheling Mantle",		waist="Patentia Sash",			legs="Iuitl Tights",		feet="Plunderer's Poulaines"
	}
	
	sets.engaged.Acc = {
		range="Raider's Boomerang",
		head="Ejekamal Mask",		neck="Asperity Necklace",		ear1="Dudgeon Earring",		ear2="Heartseeker Earring",
		body="Shneddick Tabard +1",	hands="Plunderer's Armlets +1",	ring1="Rajas Ring",			ring2="Epona's Ring",
		back="Atheling Mantle",		waist="Patentia Sash",			legs="Iuitl Tights",		feet="Plunderer's Poulaines"
	}
	
	sets.engaged.TH = {
		range="Raider's Boomerang",
		head="Uk'uxkaj Cap",	neck="Asperity Necklace",		ear1="Dudgeon Earring",		ear2="Heartseeker Earring",
		body="Qaaxo Harness",	hands="Plunderer's Armlets +1",	ring1="Rajas Ring",			ring2="Epona's Ring",
		back="Canny Cape",		waist="Patentia Sash",			legs="Kaabnax Trousers",	feet="Raider's Poulaines +2"
	}

	sets.buff.Doomed = {ring1="Saida Ring",ring2="Saida Ring"}
end