--------------------------------------------------------------------------------
--[[
	Author: Ragnarok.Lorand
	Note: Lutian Cape is augmented with STR+2 & STP+2
--]]
--------------------------------------------------------------------------------

function init_gear_sets()
	sets.weapons.Gun = {range="Doomsday",ammo="Achiyalabopa Bullet"}
	sets.weapons.Bow = {range="Phaosphaelia",ammo="Achiyalabopa Arrow"}
	--sets.weapons.XBow = {}

	--============================================================
	--			Precast sets
	--============================================================
	sets.precast.JA['Double Shot'] =	{head="Sylvan Gapette +2"}
	sets.precast.JA['Camouflage'] =		{body="Orion Jerkin +1"}
	sets.precast.JA['Velocity Shot'] =	{body="Sylvan Caban +2"}
	sets.precast.JA['Flashy Shot'] =	{hands="Arcadian Bracers"}
	sets.precast.JA['Barrage'] =		{hands="Orion Bracers"}
	sets.precast.JA['Shadowbind'] =		{hands="Orion Bracers"}
	sets.precast.JA['Bounty Shot'] =	{hands="Sylvan Glovelettes +2"}
	sets.precast.JA['Eagle Eye Shot'] =	{legs="Arcadian Braccae"}
	sets.precast.JA['Sharpshot'] =		{legs="Orion Braccae"}
	sets.precast.JA['Scavenge'] =		{feet="Orion Socks +1"}
	sets.precast.JA['Unlimited Shot'] =	{feet="Sylvan Botillons +2"}
	
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

	sets.precast.ranged = {			--22% Snapshot, 14% Rapid Shot
		head="Sylvan Gapette +2",	--5% Snapshot
		body="Arcadian Jerkin",		--10% Rapid Shot
		hands="Iuitl Wristbands +1",	--5% Snapshot
		waist="Impulse Belt",		--3% Snapshot
		legs="Nahtirah Trousers",	--9% Snapshot
		feet="Arcadian Socks"		--4% Rapid Shot
	}
	
	--============================================================
	--			TP & WS sets
	--============================================================
	
	sets.wsBase = {
		head="Arcadian Beret +1",	neck="Ocachi Gorget",		ear1="Clearview Earring",	ear2="Volley Earring",
		body="Orion Jerkin +1",		hands="Iuitl Wristbands +1",	ring1="Rajas Ring",		ring2="Stormsoul Ring",
		back="Lutian Cape",		waist="Fotia Belt",		legs="Nahtirah Trousers",	feet="Orion Socks +1"
	}
	
	sets.wsBase.STR = {ring2="Pyrosoul Ring",back="Buquwik Cape"}
	sets.wsBase.AGI = {head="Uk'uxkaj Cap",ring1="Blobnag Ring",ring2="Stormsoul Ring"}
	sets.wsBase.DEX = {head="Uk'uxkaj Cap",ear1="Pixie Earring",ring2="Thundersoul Ring",back="Kayapa Cape"}
	sets.wsBase.STRAGI = {head="Uk'uxkaj Cap",ring2="Pyrosoul Ring",back="Sylvan Chlamys"}
	
	sets.wsBase.Magic = {
		head="Highwing Helm",		neck="Stoicheion Medal",	ear1="Hecate's Earring",	ear2="Friomisi Earring",
		body="Orion Jerkin +1",		hands="Umuthi Gloves",		ring1="Fenrir Ring +1",		ring2="Acumen Ring",
		back="Toro Cape",		waist="Fotia Belt",		legs="Shneddick Tights +1",	feet="Orion Socks +1"
	}
	
	sets.tpBase = {
		head="Arcadian Beret +1",	neck="Ocachi Gorget",		ear1="Clearview Earring",	ear2="Volley Earring",
		body="Orion Jerkin +1",		hands="Manibozho Gloves",	ring1="Longshot Ring",		ring2="Paqichikaji Ring",
		back="Lutian Cape",		waist="Scout's Belt",		legs="Nahtirah Trousers",	feet="Orion Socks +1"
	}
	
	--========================[Bow]===============================
	sets.Bow = combineSets({},sets.weapons[modes.weapon])
	sets.Bow.sam = {}
	sets.Bow.other = {}

	--4-hit /SAM with 2 recycle procs
	sets.Bow.sam['r4-hit'] = {main="Mekki Shakki", sub="Rose Strap"}
	sets.Bow.sam['r4-hit'].tp = {waist="Patentia Sash"}

	sets.Bow.sam.acc = {main="Hurlbat", sub={"Antican Axe", "Legion Scutum"}}
	sets.Bow.sam.acc.tp = {neck="Hope Torque",hands="Iuitl Wristbands +1",legs="Iuitl Tights +1"}
	
	--4-hit /??? with 2 recycle procs
	sets.Bow.other['r4-hit'] = {main="Mekki Shakki", sub="Rose Strap"}
	sets.Bow.other['r4-hit'].tp = {
		hands="Sylvan Glovelettes +2",	ring1="Rajas Ring",	ring2="K'ayres Ring",
		waist="Patentia Sash",		legs="Iuitl Tights +1"
	}
	
	sets.Bow.other.acc = {main="Hurlbat", sub={"Antican Axe", "Legion Scutum"}}
	sets.Bow.other.acc.tp = {neck="Hope Torque",hands="Iuitl Wristbands +1",legs="Iuitl Tights +1"}
	
	--========================[Gun]===============================
	sets.Gun = combineSets({},sets.weapons[modes.weapon])
	sets.Gun.sam = {}
	sets.Gun.other = {}
	
	--4-hit /SAM with 2 recycle procs
	sets.Gun.sam['r4-hit'] = {main="Mekki Shakki", sub="Rose Strap"}
	sets.Gun.sam['r4-hit'].tp = {waist="Patentia Sash"}

	sets.Gun.sam.acc = {main="Hurlbat", sub={"Antican Axe", "Legion Scutum"}}
	sets.Gun.sam.acc.tp = {neck="Faith Torque",hands="Iuitl Wristbands +1",legs="Iuitl Tights +1"}
	
	--4-hit /??? with 2 recycle procs
	sets.Gun.other['r4-hit'] = {main="Mekki Shakki", sub="Rose Strap"}
	sets.Gun.other['r4-hit'].tp = {
		hands="Manibozho Gloves",	ring1="Rajas Ring",	ring2="K'ayres Ring",
		back="Sylvan Chlamys",		waist="Patentia Sash",	legs="Iuitl Tights +1"
	}
	
	sets.Gun.other.acc = {main="Hurlbat", sub={"Antican Axe", "Legion Scutum"}}
	sets.Gun.other.acc.tp = {neck="Faith Torque",hands="Iuitl Wristbands +1",legs="Iuitl Tights +1"}
	
	--============================================================

	sets.midcast.FastRecast = {
		head="Ejekamal Mask",	neck="Orunmila's Torque",	ear1="Loquacious Earring",
		body="Iuitl Vest +1",	hands="Buremte Gloves",		ring1="Prolix Ring",		ring2="Diamond Ring",	--Diamond Ring aug: 2% interrupt rate down
		back="Mujin Mantle",	waist="Cetl Belt",		legs="Kaabnax Trousers",	feet="Iuitl Gaiters +1"
	}
	
	--============================================================
	
	sets.ranged = {}
	sets.ranged.maxAcc = {	--	1 AGI = 0.75 Ranged Accuracy
		head="Arcadian Beret +1",	neck="Ocachi Gorget",		ear1="Clearview Earring",	ear2="Volley Earring",
		body="Orion Jerkin +1",		hands="Iuitl Wristbands +1",	ring1="Longshot Ring",		ring2="Paqichikaji Ring",
		back="Lutian Cape",		waist="Scout's Belt",		legs="Iuitl Tights +1",		feet="Orion Socks +1"
	}
	
	sets.ranged.barrage = combineSets(sets.ranged.maxAcc, {hands="Orion Bracers"})
	
	--============================================================
	--			Other sets
	--============================================================
	sets.resting = {}
	
	sets.idle = {
		head="Ocelomeh Headpiece +1",	neck="Orochi Nodowa",		ear1="Brachyura Earring",	ear2="Ethereal Earring",
		body={"Kirin's Osode", "Orion Jerkin +1"},
		hands="Umuthi Gloves",		ring1="Defending Ring",		ring2="Shneddick Ring",
		back="Repulse Mantle",		waist="Flume Belt",		legs="Kaabnax Trousers",	feet="Orion Socks +1"
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
		head="Ejekamal Mask",	ear1="Merman's Earring",	ear2="Merman's Earring",
		body="Iuitl Vest +1",	hands="Umuthi Gloves",
		back="Tuilha Cape",	waist="Flume Belt",		legs="Kaabnax Trousers",	feet="Iuitl Gaiters +1"
	})
	
	sets.engaged = {
		head="Whirlpool Mask",	neck="Asperity Necklace",	ear1="Dudgeon Earring",	ear2="Heartseeker Earring",
		body="Qaaxo Harness",	hands="Umuthi Gloves",		ring1="Rajas Ring",	ring2="Epona's Ring",
		back="Atheling Mantle",	waist="Patentia Sash",		legs="Iuitl Tights +1",	feet="Taeon Boots"
	}
	sets.engaged.with_buff = {}
	sets.engaged.with_buff['reive mark'] = {neck="Ygnas's Resolve +1"}
end