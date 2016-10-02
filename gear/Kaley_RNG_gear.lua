--------------------------------------------------------------------------------
--[[
	Author: Ragnarok.Lorand
--]]
--------------------------------------------------------------------------------

function init_gear_sets()
	sets.weapons.Gun = {range="Doomsday",ammo="Achiyalabopa Bullet"}
	sets.weapons.Bow = {range="Phaosphaelia",ammo="Achiyalabopa Arrow"}

	--============================================================
	--			Precast sets
	--============================================================
	sets.precast.JA['Double Shot'] =	{}
	sets.precast.JA['Camouflage'] =		{}
	sets.precast.JA['Velocity Shot'] =	{}
	sets.precast.JA['Flashy Shot'] =	{}
	sets.precast.JA['Barrage'] =		{}
	sets.precast.JA['Shadowbind'] =		{}
	sets.precast.JA['Bounty Shot'] =	{}
	sets.precast.JA['Eagle Eye Shot'] =	{}
	sets.precast.JA['Sharpshot'] =		{}
	sets.precast.JA['Scavenge'] =		{}
	sets.precast.JA['Unlimited Shot'] =	{}
	
	sets.precast.Waltz = {}

	sets.precast.FC = {				--25%
		head="Ejekamal Mask",			--3%
		neck="Jeweled Collar",			--2%
		ear1="Loquacious Earring",		--2%
		hands={"Thaumas Gloves", "Buremte Gloves"},	--4/3%
		ring1="Prolix Ring",			--2%
	}
	sets.precast.FC.Utsusemi = {
		neck="Magoraga Bead Necklace"	--10%
	}

	--============================================================

	sets.precast.ranged = {			--
		hands="Buremte Gloves",		--2% Snapshot
		legs="Nahtirah Trousers",	--9% Snapshot
	}
	
	--============================================================
	--			TP & WS sets
	--============================================================
	
	sets.wsBase = {
		head="Umbani Cap",	neck="Ocachi Gorget",	ear1="Volley Earring",
		body="Taeon Tabard",	hands="Qaaxo Mitaines",	ring1="Paqichikaji Ring",	ring2="Arewe Ring",
		back="Lutian Cape",	waist="Elanid Belt",	legs="Nahtirah Trousers",	feet="Taeon Boots"
	}
	
	sets.wsBase.STR = {}
	sets.wsBase.AGI = {}
	sets.wsBase.DEX = {ear1="Pixie Earring"}
	sets.wsBase.STRAGI = {}
	
	sets.wsBase.Magic = {
		head="Umbani Cap",	neck="Sanctity Necklace",	ear1="Friomisi Earring",	ear2="Hecate's Earring",
		body="Taeon Tabard",	hands="Taeon Gloves",		ring1="Paqichikaji Ring",	ring2="Acumen Ring",
		back="Toro Cape",	waist="Elanid Belt",		legs="Shneddick Tights +1",	feet="Taeon Boots"
	}
	
	sets.tpBase = {
		head="Arcadian Beret +1",	neck="Ocachi Gorget",	ear1="Volley Earring",
		body="Taeon Tabard",		hands="Qaaxo Mitaines",	ring1="Paqichikaji Ring",	ring2="Arewe Ring",
		back="Lutian Cape",		waist="Elanid Belt",	legs="Nahtirah Trousers",	feet="Taeon Boots"
	}
	
	--========================[Bow]===============================
	sets.Bow = combineSets({},sets.weapons[modes.weapon])
	sets.Bow.sam = {}
	sets.Bow.other = {}

	--4-hit /SAM with 2 recycle procs
	sets.Bow.sam['r4-hit'] = {}
	sets.Bow.sam['r4-hit'].tp = {}

	sets.Bow.sam.acc = {main="Hurlbat", sub={"Antican Axe", "Legion Scutum"}}
	sets.Bow.sam.acc.tp = {}
	
	--4-hit /??? with 2 recycle procs
	sets.Bow.other['r4-hit'] = {}
	sets.Bow.other['r4-hit'].tp = {
	}
	
	sets.Bow.other.acc = {main="Hurlbat", sub={"Antican Axe", "Legion Scutum"}}
	sets.Bow.other.acc.tp = {}
	
	--========================[Gun]===============================
	sets.Gun = combineSets({},sets.weapons[modes.weapon])
	sets.Gun.sam = {}
	sets.Gun.other = {}
	
	--4-hit /SAM with 2 recycle procs
	sets.Gun.sam['r4-hit'] = {}
	sets.Gun.sam['r4-hit'].tp = {}

	sets.Gun.sam.acc = {main="Hurlbat", sub={"Antican Axe", "Legion Scutum"}}
	sets.Gun.sam.acc.tp = {}
	
	--4-hit /??? with 2 recycle procs
	sets.Gun.other['r4-hit'] = {}
	sets.Gun.other['r4-hit'].tp = {
	}
	
	sets.Gun.other.acc = {main="Hurlbat", sub={"Antican Axe", "Legion Scutum"}}
	sets.Gun.other.acc.tp = {}
	
	--============================================================

	sets.midcast.FastRecast = {
	}
	
	--============================================================
	
	sets.ranged = {}
	sets.ranged.maxAcc = {	--	1 AGI = 0.75 Ranged Accuracy
		head="Umbani Cap",	neck="Iqabi Necklace",	ear1="Volley Earring",
		body="Taeon Tabard",	hands="Qaaxo Mitaines",	ring1="Paqichikaji Ring",	ring2="Arewe Ring",
		back="Lutian Cape",	waist="Elanid Belt",	legs="Taeon Tights",		feet="Taeon Boots"
	}
	
	sets.ranged.barrage = combineSets(sets.ranged.maxAcc, {hands="Orion Bracers"})
	
	--============================================================
	--			Other sets
	--============================================================
	sets.resting = {}
	
	sets.idle = {
		head="Arcadian Beret +1",	neck="Twilight Torque",	ear1="Novia Earring",	ear2="Ethereal Earring",
		body="Taeon Tabard",		hands="Taeon Gloves",	ring1="Dark Ring",	ring2="Shneddick Ring",
		back="Repulse Mantle",		waist="Elanid Belt",	legs="Taeon Tights",	feet="Taeon Boots"
	}
	
	sets.defense.DT = {	--DT-5%, PDT-10%, MDT-7%	=> PDT-15%, MDT-12%
	}
	sets.defense.PDT = combineSets(sets.defense.DT, {	--PDT-18% + DT => PDT-33%
	})
	sets.defense.MDT = combineSets(sets.defense.DT, {	--MDT-4% + DT => MDT-16%, MDB+19
	})
	
	sets.engaged = {
		head="Ejekamal Mask",	neck="Asperity Necklace",	ear1="Dudgeon Earring",	ear2="Heartseeker Earring",
		body="Taeon Tabard",	hands="Taeon Gloves",		ring1="Rajas Ring",	ring2="Epona's Ring",
		back="Atheling Mantle",	waist="Cetl Belt",		legs="Taeon Tights",	feet="Taeon Boots"
	}
end