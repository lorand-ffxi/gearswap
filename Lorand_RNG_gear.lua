-----------------------------------------------------------------------------------------------------------
--[[
	Author: Ragnarok.Lorand
	
	Slips:
		2:	Hope/Faith Torques
		3:	Rose Strap
		6:	Scout's Belt
		8:	Sylvan Chlamys
		10:	Sylvan+2 (all)
		14:	Thaumas Gloves (when /nin)
		15:	Orion (all)
		17:	Arcadian (all)
--]]
-----------------------------------------------------------------------------------------------------------

function init_gear_sets()
	gear.Gun = "Hgafircian +2"
	gear['Gun_ammo'] = "Achiyalabopa Bullet"
	gear['Gun_ammo_RA'] = "Achiyalabopa Bullet"
	gear['Gun_ammo_WS'] = "Achiyalabopa Bullet"
	-- gear['Gun_ammo'] = "Ra'Kaznar Bullet"
	-- gear['Gun_ammo_RA'] = "Adlivun Bullet"
	-- gear['Gun_ammo_WS'] = "Eminent Bullet"
	gear.Bow = "Bocluamni +2"
	gear['Bow_ammo'] = "Eminent Arrow"
	gear['Bow_ammo_WS'] = "Eminent Arrow"
	gear['Bow_ammo_RA'] = "Eminent Arrow"
	gear.Accuracy = "Bocluamni +2"
	gear['Accuracy_ammo'] = "Eminent Arrow"
	gear['Accuracy_ammo_WS'] = "Eminent Arrow"
	gear['Accuracy_ammo_RA'] = "Eminent Arrow"
	--============================================================
	--					Precast sets
	--============================================================
	sets.precast.JA['Double Shot'] =	{head="Sylvan Gapette +2"}
	sets.precast.JA['Camouflage'] =		{body="Orion Jerkin"}
	sets.precast.JA['Velocity Shot'] =	{body="Sylvan Caban +2"}
	sets.precast.JA['Flashy Shot'] =	{hands="Arcadian Bracers"}
	sets.precast.JA['Barrage'] =		{hands="Orion Bracers"}
	sets.precast.JA['Shadowbind'] =		{hands="Orion Bracers"}
	sets.precast.JA['Bounty Shot'] =	{hands="Sylvan Glovelettes +2"}
	sets.precast.JA['Eagle Eye Shot'] =	{legs="Arcadian Braccae"}
	sets.precast.JA['Sharpshot'] =		{legs="Orion Braccae"}
	sets.precast.JA['Scavenge'] =		{feet="Orion Socks"}
	sets.precast.JA['Unlimited Shot'] =	{feet="Sylvan Botillons +2"}
	
	sets.precast.Waltz = {}
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.precast.FC = {				--25%
		head="Anwig Salade",		--5%
		neck="Orunmila's Torque",	--5%
		ear1="Loquacious Earring",	--2%
		--hands="Thaumas Gloves",		--4%
		hands="Buremte Gloves",		--3%
		ring1="Prolix Ring",		--2%
		ring2="Veneficium Ring",	--Q+1%
		legs="Quiahuiz Trousers",	--3%
		feet="Suzaku's Sune-Ate"	--4%
	}
	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {	--30%
		neck="Magoraga Bead Necklace"	--10%
	})

	--============================================================

	sets.precast.ranged = {				--22% Snapshot, 14% Rapid Shot
		head="Sylvan Gapette +2",		--5% Snapshot
		body="Arcadian Jerkin",			--10% Rapid Shot
		hands="Iuitl Wristbands +1",	--5% Snapshot
		waist="Impulse Belt",			--3% Snapshot
		legs="Arcadian Braccae",		--4% Snapshot
		feet="Arcadian Socks"			--4% Rapid Shot
	}
	
	--============================================================
	--					TP & WS sets
	--============================================================
	
	sets.wsBase = {
		neck="Ocachi Gorget",		ear1="Clearview Earring",	ear2="Volley Earring",
		body="Shneddick Tabard +1",	ring1="Rajas Ring",
		feet="Shneddick Boots +1"
	}
	
	sets.wsBase.STR = {
		head="Ejekamal Mask",
		hands="Arcadian Bracers",	ring2="Pyrosoul Ring",
		back="Buquwik Cape",		waist="Prosilio Belt",		legs="Shneddick Tights +1"
	}
	sets.wsBase.AGI = {
		head="Uk'uxkaj Cap",
		hands="Iuitl Wristbands +1",	ring1="Blobnag Ring",		ring2="Stormsoul Ring",
		back="Ik Cape",					waist="Sveltesse Gouriz",	legs="Kaabnax Trousers"
	}
	sets.wsBase.DEX = {
		head="Uk'uxkaj Cap",			ear1="Pixie Earring",
		hands="Shneddick Gloves +1",	ring2="Thundersoul Ring",
		back="Kayapa Cape",				waist="Chiner's Belt",		legs="Kaabnax Trousers"
	}
	sets.wsBase.STRAGI = {
		head="Uk'uxkaj Cap",
		hands="Arcadian Bracers",	ring2="Pyrosoul Ring",
		back="Sylvan Chlamys",		waist="Prosilio Belt",		legs="Kaabnax Trousers"
	}
	
	sets.tpBase = {
		head="Arcadian Beret",	neck="Ocachi Gorget",		ear1="Clearview Earring",	ear2="Volley Earring",
		body="Orion Jerkin",	hands="Manibozho Gloves",	ring1="Paqichikaji Ring",	ring2="Longshot Ring",
		back="Lutian Cape",		waist="Scout's Belt",		legs="Arcadian Braccae",	feet="Orion Socks"
	}
	
	--========================[Bow]===============================
	sets.Bow = {range=gear.Bow, ammo=gear['Bow_ammo_RA'], neck="Hope Torque"}
	sets.Bow.sam = {}
	sets.Bow.other = {}
	
	--5-hit dependent upon 2 recycle procs
	sets.Bow.sam['r5-hit'] = {main="Hurlbat"}
	sets.Bow.sam['r5-hit'].tp = {
		ear2="Volley Earring",
		legs="Aetosaur Trousers"
	}

	--5-hit with no requirements
	sets.Bow.sam['5-hit'] = {main="Mekki Shakki", sub="Rose Strap"}
	sets.Bow.sam['5-hit'].tp = {
		neck="Ocachi Gorget",		ear2="Volley Earring",
		legs="Aetosaur Trousers"
	}
	
	--5-hit with more attack
	sets.Bow.sam['a5-hit'] = {main="Mekki Shakki", sub="Rose Strap"}
	sets.Bow.sam['a5-hit'].tp = {	--18.6 TP/hit
		neck="Ocachi Gorget",		ear2="Volley Earring",
		hands="Arcadian Bracers",	ring1="Rajas Ring"
	}
	
	--4-hit dependent upon 1 recycle proc
	sets.Bow.sam['r4-hit'] = {
		main="Mekki Shakki",			sub="Rose Strap",
		ear2="Volley Earring",
		hands="Sylvan Glovelettes +2",	ring1="Rajas Ring",
		back="Sylvan Chlamys",			legs="Sylvan Bragues +2"
	}
	sets.Bow.sam['r4-hit'].tp = {
		neck="Ocachi Gorget",			ear1="Bladeborn Earring",
	}
	
	--5-hit dependent upon 2 recycle procs
	sets.Bow.other['r5-hit'] = {main="Mekki Shakki", sub="Rose Strap"}

	--5-hit with no requirements
	sets.Bow.other['5-hit'] = {main="Mekki Shakki", sub="Rose Strap"}
	sets.Bow.other['5-hit'].tp = {
		neck="Ocachi Gorget",
		hands="Sylvan Glovelettes +2",
		ring1="Rajas Ring",
		back="Sylvan Chlamys"
	}
	
	--========================[Gun]===============================
	sets.Gun = {range=gear.Gun,	ammo=gear['Gun_ammo_RA'], neck="Faith Torque"}
	sets.Gun.sam = {}
	sets.Gun.other = {}
	
	--5-hit with subjob SAM
	sets.Gun.sam['5-hit'] = {
		main="Hurlbat",
		ear2="Volley Earring"
	}
	
	--5-hit with subjob SAM; more attack
	sets.Gun.sam['a5-hit'] = {main="Hurlbat"}
	sets.Gun.sam['a5-hit'].tp = {
		neck="Ocachi Gorget",		ear2="Volley Earring",
		hands="Arcadian Bracers",	ring1="Rajas Ring"
	}
	
	--4-hit with subjob SAM
	sets.Gun.sam['4-hit'] = {
		main="Mekki Shakki",	sub="Rose Strap",
		ear2="Volley Earring",
		ring1="Rajas Ring"
	}
	sets.Gun.sam['4-hit'].tp = {
		neck="Ocachi Gorget",
		hands="Sylvan Glovelettes +2",
		back="Sylvan Chlamys"
	}
	
	--5-hit with subjob other than SAM
	sets.Gun.other['5-hit'] = {main="Mekki Shakki", sub="Rose Strap"}
	sets.Gun.other['5-hit'].tp = {
		neck="Ocachi Gorget",		ear2="Volley Earring",
		legs="Aetosaur Trousers"
	}
	
	sets.Gun.other['acc'] = {main="Hurlbat", sub="Antican Axe"}
	sets.Gun.other['acc'].tp = {
		neck="Ocachi Gorget",	ear2="Volley Earring",
		body="Iuitl Vest +1",	ring2="Rajas Ring",
		waist="Patentia Sash",	legs="Aetosaur Trousers",	feet="Iuitl Gaiters +1"
	}
	
	sets.Melee = {}
	sets.Melee.sam = {}
	sets.Melee.other = {}
	
	--============================================================

	sets.midcast.FastRecast = {
		head="Ejekamal Mask",	neck="Orunmila's Torque",	ear1="Loquacious Earring",
		body="Iuitl Vest +1",	hands="Buremte Gloves",		ring1="Prolix Ring",		ring2="Diamond Ring",		--Diamond Ring aug: 2% interrupt rate down
		back="Mujin Mantle",	waist="Cetl Belt",			legs="Kaabnax Trousers",	feet="Iuitl Gaiters +1"
	}
	
	--============================================================
	
	sets.ranged = {}
	
	sets.ranged.maxAcc = {	--	1 AGI = 0.75 Ranged Accuracy
		head="Uk'uxkaj Cap",	ear1="Clearview Earring",	ear2="Volley Earring",
		body="Orion Jerkin",	hands="Buremte Gloves",		ring1="Paqichikaji Ring",	ring2="Longshot Ring",
		back="Lutian Cape",		waist="Scout's Belt",		legs="Orion Braccae",		feet="Orion Socks"
	}
	
	sets.ranged.maxAcc.Gun = {neck="Faith Torque"}
	sets.ranged.maxAcc.Bow = {neck="Hope Torque"}
	
	sets.ranged.barrage = set_combine(sets.ranged.maxAcc, {hands="Orion Bracers"})
	
	
	sets.Accuracy = {
		range=gear.Bow,			ammo=gear['Accuracy_ammo_RA'], 
		head="Uk'uxkaj Cap",	neck="Hope Torque",				ear1="Clearview Earring",	ear2="Volley Earring",
		body="Orion Jerkin",	hands="Buremte Gloves",			ring1="Paqichikaji Ring",	ring2="Longshot Ring",
		back="Lutian Cape",		waist="Scout's Belt",			legs="Orion Braccae",		feet="Orion Socks"
	}
	sets.Accuracy.sam = {}
	sets.Accuracy.other = {}
	sets.Accuracy.sam.Accuracy = {}
	sets.Accuracy.other.Accuracy = {}
	
	
	--============================================================
	--					Other sets
	--============================================================
	sets.resting = {}
	
	sets.idle = {
		head="Ocelomeh Headpiece +1",	neck="Orochi Nodowa",		ear1="Novia Earring",			ear2="Ethereal Earring",
		body="Orion Jerkin",			hands="Buremte Gloves",		ring1="Defending Ring",			ring2="Sheltered Ring",
		back="Repulse Mantle",			waist="Flume Belt",			legs="Kaabnax Trousers",		feet="Orion Socks"
	}
	sets.idle.speedy = {feet="Skadi's Jambeaux +1"}
	sets.idle.with_buff = {}
	sets.idle.with_buff['Doom'] = {ring1="Saida Ring", ring2="Saida Ring"}
	
	sets.defense.DT = {	--DT-5%, PDT-10%, MDT-7%	=> PDT-15%, MDT-12%
		neck="Twilight Torque",
		ring1="Defending Ring",		ring2="Dark Ring"
	}
	sets.defense.PDT = set_combine(sets.defense.Evasion, sets.defense.DT, {	--PDT-18% + DT => PDT-33%
		head="Iuitl Headgear +1",
		body="Iuitl Vest +1",		hands="Iuitl Wristbands +1",
		back="Repulse Mantle",		waist="Flume Belt",				legs="Iuitl Tights +1",	feet="Iuitl Gaiters +1"
	})
	sets.defense.MDT = set_combine(sets.defense.Evasion, sets.defense.DT, {	--MDT-4% + DT => MDT-16%, MDB+19
		head="Ejekamal Mask",	ear1="Merman's Earring",	ear2="Merman's Earring",
		body="Iuitl Vest +1",	hands="Buremte Gloves",
		back="Tuilha Cape",		waist="Flume Belt",			legs="Kaabnax Trousers",	feet="Iuitl Gaiters +1"
	})
	
	sets.Kiting = {feet="Orion Socks"}
	
	sets.engaged = {
		head="Ejekamal Mask",	neck="Asperity Necklace",	ear1="Bladeborn Earring",	ear2="Steelflash Earring",
		body="Iuitl Vest +1",	hands="Buremte Gloves",		ring1="Rajas Ring",			ring2="Epona's Ring",
		back="Atheling Mantle",	waist="Patentia Sash",		legs="Kaabanax Trousers",	feet="Orion Socks"
	}
	sets.engaged.with_buff = {}
	sets.engaged.with_buff['Doom'] = {ring1="Saida Ring", ring2="Saida Ring"}
	sets.Melee = {}
	sets.Melee.tp = sets.engaged
end