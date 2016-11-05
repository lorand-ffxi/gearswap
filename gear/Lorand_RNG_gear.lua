--------------------------------------------------------------------------------
--[[
	Author: Ragnarok.Lorand
	Note: Lutian Cape is augmented with STR+1, AGI+5, STP+3, Snapshot+2
	
	Starting TP	Recycle Procs	Hits to 1k	TP/Hit Req
	0		0		4		250
	0		1		4		238
	0		2		4		225
--]]
--------------------------------------------------------------------------------

function init_gear_sets()
	sets.weapons.Gun = {range="Doomsday",ammo="Achiyalabopa Bullet"}
	sets.weapons.Bow = {range="Phaosphaelia",ammo="Achiyalabopa Arrow"}

	--============================================================
	--			Precast sets
	--============================================================
	sets.precast.JA['Double Shot'] =	{head="Sylvan Gapette +2"}
	sets.precast.JA['Camouflage'] =		{body="Orion Jerkin +1"}
	sets.precast.JA['Velocity Shot'] =	{body="Sylvan Caban +2"}
	sets.precast.JA['Flashy Shot'] =	{hands="Arcadian Bracers"}
	sets.precast.JA['Barrage'] =		{hands="Orion Bracers +1"}
	sets.precast.JA['Shadowbind'] =		{hands="Orion Bracers +1"}
	sets.precast.JA['Bounty Shot'] =	{hands="Amini Glovelettes"}
	sets.precast.JA['Eagle Eye Shot'] =	{legs="Arcadian Braccae +1"}
	sets.precast.JA['Sharpshot'] =		{legs="Orion Braccae"}
	sets.precast.JA['Scavenge'] =		{feet="Orion Socks +1"}
	sets.precast.JA['Unlimited Shot'] =	{feet="Sylvan Bottillons +2"}
	
	sets.precast.Waltz = {}
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.precast.FC = {				--25%
		head={"Haruspex Hat","Anwig Salade"},	--8/5%
		neck="Orunmila's Torque",		--5%
		ear1="Loquacious Earring",		--2%
		hands={"Thaumas Gloves", "Buremte Gloves"},	--4/3%
		ring1="Prolix Ring",			--2%
		ring2="Veneficium Ring",		--Q+1%
		legs="Quiahuiz Trousers",		--3%
		feet="Suzaku's Sune-Ate"		--4%
	}
	sets.precast.FC.Utsusemi = {		--30%
		neck="Magoraga Bead Necklace"	--10%
	}

	--============================================================

	sets.precast.ranged = {			--24% Snapshot, 14% Rapid Shot
		head="Sylvan Gapette +2",	--5% Snapshot
		body="Arcadian Jerkin",		--10% Rapid Shot
		hands="Iuitl Wristbands +1",	--5% Snapshot
		back="Lutian Cape",		--2% Snapshot[Augment]
		waist="Impulse Belt",		--3% Snapshot
		legs="Nahtirah Trousers",	--9% Snapshot
	}
	
	--============================================================
	
	sets.ranged = {}
	sets.ranged.maxAcc = {	--	1 AGI = 0.75 Ranged Accuracy
		head="Umbani Cap",		neck="Iqabi Necklace",		ear1="Clearview Earring",	ear2="Volley Earring",
		body="Orion Jerkin +1",		hands="Amini Glovelettes",	ring1="Longshot Ring",		ring2="Paqichikaji Ring",
		back="Lutian Cape",		waist="Elanid Belt",		legs="Arcadian Braccae +1",	feet="Orion Socks +1"
	}
	
	sets.ranged.barrage = combineSets(sets.ranged.maxAcc, {hands="Orion Bracers +1"})
	
	--============================================================
	--			TP & WS sets
	--============================================================
	
	sets.wsBase = {
		head="Umbani Cap",	neck="Ocachi Gorget",		ear1="Clearview Earring",	ear2="Volley Earring",
		body="Orion Jerkin +1",	hands="Iuitl Wristbands +1",	ring1="Rajas Ring",		ring2="Stormsoul Ring",
		back="Lutian Cape",	waist="Fotia Belt",		legs="Nahtirah Trousers",	feet="Orion Socks +1",
	}
	
	sets.wsBase.STR = {ring2="Pyrosoul Ring",back="Buquwik Cape"}
	sets.wsBase.AGI = {}
	sets.wsBase.DEX = {ear1="Pixie Earring",ring2="Thundersoul Ring",back="Kayapa Cape"}
	sets.wsBase.STRAGI = {ring2="Pyrosoul Ring"}
	
	sets.wsBase.Magic = {
		head="Highwing Helm",		neck="Sanctity Necklace",	ear1="Hecate's Earring",	ear2="Friomisi Earring",
		body="Orion Jerkin +1",		hands="Umuthi Gloves",		ring1="Fenrir Ring +1",		ring2="Acumen Ring",
		back="Toro Cape",		waist="Fotia Belt",		legs="Shneddick Tights +1",	feet="Orion Socks +1"
	}
	
	sets.tpBase = {
		head="Arcadian Beret +1",	neck="Ocachi Gorget",		ear1="Clearview Earring",	ear2="Volley Earring",
		body="Orion Jerkin +1",		hands="Amini Glovelettes",	ring1="Longshot Ring",		ring2="Paqichikaji Ring",
		back="Lutian Cape",		waist="Elanid Belt",		legs="Nahtirah Trousers",	feet="Orion Socks +1"
	}
	
	--========================[Bow]===============================
	sets.Bow = combineSets({},sets.weapons[modes.weapon])
	sets.Bow.sam = {}
	sets.Bow.other = {}

	--4-hit /SAM with 1-2 recycle procs
	sets.Bow.sam['r4-hit'] = {main="Mekki Shakki", sub="Rose Strap"}
	sets.Bow.sam['r4-hit'].tp = {
		head="Arcadian Beret +1",	neck="Ocachi Gorget",		ear1="Clearview Earring",	ear2="Volley Earring",
		body="Orion Jerkin +1",		hands="Amini Glovelettes",	ring1="Longshot Ring",		ring2="Paqichikaji Ring",
		back="Lutian Cape",		waist="Elanid Belt",		legs="Nahtirah Trousers",	feet="Orion Socks +1"
	}
	sets.Bow.sam['r4-hit'].tp.MediumAcc = {
		head="Arcadian Beret +1",	neck="Iqabi Necklace",		ear1="Clearview Earring",	ear2="Volley Earring",
		body="Orion Jerkin +1",		hands="Amini Glovelettes",	ring1="Longshot Ring",		ring2="Paqichikaji Ring",
		back="Lutian Cape",		waist="Elanid Belt",		legs="Arcadian Braccae +1",	feet="Orion Socks +1"
	}
	sets.Bow.sam['r4-hit'].tp.HighAcc = sets.ranged.maxAcc
	
	--4-hit /??? with 2 recycle procs
	sets.Bow.other['r4-hit'] = {main="Mekki Shakki", sub="Rose Strap"}
	sets.Bow.other['r4-hit'].tp = {
		head="Arcadian Beret +1",	neck="Ocachi Gorget",		ear1="Clearview Earring",	ear2="Volley Earring",
		body="Orion Jerkin +1",		hands="Amini Glovelettes",	ring1="Rajas Ring",		ring2="Paqichikaji Ring",
		back="Lutian Cape",		waist="Patentia Sash",		legs="Arcadian Braccae +1",	feet="Orion Socks +1"
	}
	sets.Bow.other['r4-hit'].tp.MediumAcc = {
		head="Arcadian Beret +1",	neck="Ocachi Gorget",		ear1="Clearview Earring",	ear2="Volley Earring",
		body="Orion Jerkin +1",		hands="Amini Glovelettes",	ring1="Rajas Ring",		ring2="Paqichikaji Ring",
		back="Lutian Cape",		waist="Patentia Sash",		legs="Arcadian Braccae +1",	feet="Orion Socks +1"
	}	--Nothing I can really change to maintain 4-hit
	sets.Bow.other['r4-hit'].tp.HighAcc = sets.ranged.maxAcc
	
	--========================[Gun]===============================
	sets.Gun = combineSets({},sets.weapons[modes.weapon])
	sets.Gun.sam = {}
	sets.Gun.other = {}
	
	--4-hit /SAM with 1-2 recycle procs
	sets.Gun.sam['r4-hit'] = {main="Mekki Shakki", sub="Rose Strap"}
	sets.Gun.sam['r4-hit'].tp = {
		head="Arcadian Beret +1",	neck="Ocachi Gorget",		ear1="Clearview Earring",	ear2="Volley Earring",
		body="Orion Jerkin +1",		hands="Iuitl Wristbands +1",	ring1="Longshot Ring",		ring2="Paqichikaji Ring",
		back="Lutian Cape",		waist="Elanid Belt",		legs="Nahtirah Trousers",	feet="Orion Socks +1"
	}
	sets.Gun.sam['r4-hit'].tp.MediumAcc = {
		head="Arcadian Beret +1",	neck="Iqabi Necklace",		ear1="Clearview Earring",	ear2="Volley Earring",
		body="Orion Jerkin +1",		hands="Iuitl Wristbands +1",	ring1="Longshot Ring",		ring2="Paqichikaji Ring",
		back="Lutian Cape",		waist="Elanid Belt",		legs="Arcadian Braccae +1",	feet="Orion Socks +1"
	}
	sets.Gun.sam['r4-hit'].tp.HighAcc = combineSets(sets.ranged.maxAcc, {hands="Iuitl Wristbands +1"})
	
	--4-hit /??? with 2 recycle procs
	sets.Gun.other['r4-hit'] = {main="Mekki Shakki", sub="Rose Strap"}
	sets.Gun.other['r4-hit'].tp = {
		head="Arcadian Beret +1",	neck="Ocachi Gorget",		ear1="Clearview Earring",	ear2="Volley Earring",
		body="Orion Jerkin +1",		hands="Amini Glovelettes",	ring1="Rajas Ring",		ring2="Paqichikaji Ring",
		back="Lutian Cape",		waist="Elanid Belt",		legs="Nahtirah Trousers",	feet="Orion Socks +1"
	}
	sets.Gun.other['r4-hit'].tp.MediumAcc = {
		head="Arcadian Beret +1",	neck="Ocachi Gorget",		ear1="Clearview Earring",	ear2="Volley Earring",
		body="Orion Jerkin +1",		hands="Amini Glovelettes",	ring1="Longshot Ring",		ring2="Paqichikaji Ring",
		back="Lutian Cape",		waist="Patentia Sash",		legs="Arcadian Braccae +1",	feet="Orion Socks +1"
	}
	sets.Gun.other['r4-hit'].tp.HighAcc = combineSets(sets.ranged.maxAcc, {hands="Iuitl Wristbands +1"})
	
	--============================================================

	sets.midcast.FastRecast = {
		head="Taeon Chapeau",	neck="Orunmila's Torque",	ear1="Loquacious Earring",
		body="Iuitl Vest +1",	hands="Buremte Gloves",		ring1="Prolix Ring",		ring2="Diamond Ring",	--Diamond Ring aug: 2% interrupt rate down
		back="Mujin Mantle",	waist="Cetl Belt",		legs="Taeon Tights",	feet="Iuitl Gaiters +1"
	}
	
	--============================================================
	--			Other sets
	--============================================================
	sets.resting = {}
	
	sets.idle = {
		head="Ocelomeh Headpiece +1",	neck="Sanctity Necklace",		ear1="Brachyura Earring",	ear2="Ethereal Earring",
		body={"Kirin's Osode", "Orion Jerkin +1"},
		hands="Umuthi Gloves",		ring1="Defending Ring",		ring2="Shneddick Ring",
		back="Repulse Mantle",		waist="Flume Belt",		legs="Arcadian Braccae +1",	feet="Orion Socks +1"
	}
	sets.idle.with_buff = {}
	sets.idle.with_buff['reive mark'] = {neck="Ygnas's Resolve +1"}
	
	sets.defense.DT = {	--DT-5%, PDT-10%, MDT-7%	=> PDT-15%, MDT-12%
		neck="Twilight Torque",
		ring1="Defending Ring",		ring2="Dark Ring"
	}
	sets.defense.PDT = combineSets(sets.defense.DT, {	--PDT-18% + DT => PDT-33%
		head="Iuitl Headgear +1",
		body="Iuitl Vest +1",		hands="Umuthi Gloves",
		back="Repulse Mantle",		waist="Flume Belt",	legs="Iuitl Tights +1",	feet="Iuitl Gaiters +1"
	})
	sets.defense.MDT = combineSets(sets.defense.DT, {	--MDT-4% + DT => MDT-16%, MDB+19
		head="Taeon Chapeau",	ear1="Merman's Earring",	ear2="Merman's Earring",
		body="Iuitl Vest +1",	hands="Umuthi Gloves",
		back="Tuilha Cape",	waist="Flume Belt",		legs="Taeon Tights",	feet="Iuitl Gaiters +1"
	})
	
	sets.engaged = {
		head="Whirlpool Mask",	neck="Asperity Necklace",	ear1="Bladeborn Earring",	ear2="Steelflash Earring",
		body="Qaaxo Harness",	hands="Umuthi Gloves",		ring1="Rajas Ring",		ring2="Epona's Ring",
		back="Bleating Mantle",	waist="Patentia Sash",		legs="Iuitl Tights +1",		feet="Taeon Boots"
	}
	sets.engaged.with_buff = {}
	sets.engaged.with_buff['reive mark'] = {neck="Ygnas's Resolve +1"}
end