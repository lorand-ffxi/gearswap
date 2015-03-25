--------------------------------------------------------------------------------
--[[
	Author: Ragnarok.Lorand
--]]
--------------------------------------------------------------------------------

function init_gear_sets()
	--============================================================
	--			Precast sets
	--============================================================
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
		head="Uk'uxkaj Cap",	neck="Love Torque",		ear2="Delta Earring",
		body="Iuitl Vest +1",	hands="Plunderer's Armlets +1",	ring1="Rajas Ring",		ring2="Thundersoul Ring",
		back="Kayapa Cape",	waist="Chiner's Belt",		legs="Kaabnax Trousers",	feet="Iuitl Gaiters +1"
	}

	sets.precast.JA['Trick Attack'] = {
		head="Uk'uxkaj Cap",	neck="Hope Torque",		ear2="Suppanomimi",
		body="Iuitl Vest +1",	hands="Iuitl Wristbands +1",	ring1="Stormsoul Ring",		ring2="Blobnag Ring",
		back="Ik Cape",		waist="Sveltesse Gouriz",	legs="Kaabnax Trousers",	feet="Iuitl Gaiters +1"
	}

	sets.precast.Waltz = {
		head="Uk'uxkaj Cap",
		body="Iuitl Vest +1",	hands="Plunderer's Armlets +1",	ring2="Spiral Ring",
		back="Iximulew Cape",	waist="Warwolf Belt",		legs="Shneddick Tights +1",	feet="Iuitl Gaiters +1"
	}
	sets.precast.Waltz['Healing Waltz'] = {}
	
	--============================================================
	
	sets.precast.FC = {
		head={"Haruspex Hat","Anwig Salade"},		--5%
		neck="Orunmila's Torque",	--5%
		ear1="Loquacious Earring",	--2%
		body="Taeon Tabard",		--4%
		hands="Thaumas Gloves",		--4%
		ring1="Prolix Ring",		--2%
		ring2="Veneficium Ring",	--Q+1%
		legs="Enif Cosciales"		--7%
	}
	sets.precast.FC.Utsusemi = {neck="Magoraga Bead Necklace"}

	--============================================================
	
	--Snapshot
	sets.precast.ranged = {
		hands="Iuitl Wristbands +1",
		legs="Nahtirah Trousers",
	}

	sets.wsBase = {
		head="Taeon Chapeau",	neck="Asperity Necklace",	ear1="Steelflash Earring",	ear2="Bladeborn Earring",
		body="Qaaxo Harness",	hands="Plunderer's Armlets +1",	ring1="Rajas Ring",		ring2="Epona's Ring",
		back="Atheling Mantle",	waist="Anguinus Belt",		legs="Taeon Tights",		feet="Plunderer's Poulaines"
	}
	
	sets.wsBase.DEX = {
		head="Taeon Chapeau"
	}
	
	sets.wsBase.MediumAcc = {
		hands="Buremte Gloves",
		legs="Kaabanax Trousers"
	}
	sets.wsBase.HighAcc = {
		head="Whirlpool Mask",	neck="Peacock Amulet",		ear1="Dudgeon Earring",		ear2="Heartseeker Earring",
		body="Iuitl Vest +1",	hands="Plunderer's Armlets +1",	ring1="Rajas Ring",		ring2="Epona's Ring",
		back="Canny Cape",	waist="Anguinus Belt",		legs="Taeon Tights",		feet="Iuitl Gaiters +1"
	}

	sets.wsBase.Magic = {
		neck="Stoicheion Medal",	ear1="Hecate's Earring",	ear2="Friomisi Earring",
		ring1="Fenrir Ring +1",		ring2="Acumen Ring",
		back="Toro Cape",		legs="Shneddick Tights +1"
	}
	
	--============================================================
	--			Midcast sets
	--============================================================
	
	sets.midcast.FastRecast = {
		head="Taeon Chapeau",	neck="Orunmila's Torque",	ear1="Loquacious Earring",
		body="Iuitl Vest +1",	hands="Buremte Gloves",		ring1="Prolix Ring",		ring2="Diamond Ring",	--Diamond Ring aug: 2% interrupt rate down
		back="Mujin Mantle",	waist="Cetl Belt",		legs="Kaabnax Trousers",	feet="Iuitl Gaiters +1"
	}
	sets.midcast.Utsusemi = {back="Mujin Mantle"}

	sets.midcast.ranged = {
		head="Taeon Chapeau",	neck="Ocachi Gorget",		ear1="Clearview Earring",	ear2="Volley Earring",
		body="Iuitl Vest +1",	hands="Iuitl Wristbands +1",	ring1="Paqichikaji Ring",	ring2="Longshot Ring",
		back="Libeccio Mantle",	waist="Sveltesse Gouriz",	legs="Nahtirah Trousers",	feet="Pillager's Poulaines"
	}
	sets.midcast.ranged.TH = sets.TreasureHunter
	
	--============================================================
	--			Other sets
	--============================================================
	
	sets.weapons.Other = {}
	sets.weapons.TH = {main='Sandung',sub='Jugo Kukri',range="Raider's Boomerang"}
	sets.weapons.DD = {main='Izhiikoh',sub='Jugo Kukri',range="Raider's Boomerang"}
	sets.weapons.Accuracy = {main='Izhiikoh',sub='Jugo Kukri',ammo='Honed Tathlum'}
	sets.weapons.THAcc = {main='Izhiikoh',sub='Sandung',ammo='Honed Tathlum'}
	
	sets.resting = {}
	
	sets.idle = {												--range="Raider's Boomerang",
		head="Ocelomeh Headpiece +1",	neck="Orochi Nodowa",		ear1="Brachyura Earring",	ear2="Ethereal Earring",
		body="Qaaxo Harness",		hands="Plunderer's Armlets +1",	ring1="Defending Ring",		ring2="Shneddick Ring",
		back="Repulse Mantle",		waist="Flume Belt",		legs="Taeon Tights",		feet="Iuitl Gaiters +1"
	}
	sets.idle.with_buff = {}
	sets.idle.with_buff['doom'] = {ring1="Saida Ring", ring2="Saida Ring"}
	sets.idle.with_buff['reive mark'] = {neck="Ygnas's Resolve +1"}
	
	sets.defense.Evasion = {
		head="Taeon Chapeau",	neck="Torero Torque",		ear1="Novia Earring",	ear2="Ethereal Earring",
		body="Qaaxo Harness",	hands="Plunderer's Armlets +1",	ring1="Defending Ring",	ring2="Alert Ring",
		back="Canny Cape",	waist="Sveltesse Gouriz",	legs="Taeon Tights",	feet="Iuitl Gaiters +1"
	}

	sets.defense.DT = combineSets(sets.defense.Evasion,{	--DT-15%, PDT-12%, MDT-10%	=> PDT-27%, MDT-25%
		head="Ejekamal Mask",		neck="Twilight Torque",
		body="Iuitl Vest +1",		ring1="Defending Ring",		ring2="Dark Ring",
		legs="Kaabnax Trousers"
	})
	
	sets.defense.PDT = combineSets(sets.defense.DT, {	--PDT-12% + DT => PDT-39%
		hands="Umuthi Gloves",
		back="Repulse Mantle",		waist="Flume Belt",	feet="Iuitl Gaiters +1"
	})

	sets.defense.MDT = combineSets(sets.defense.DT, {	--MDT-4% + DT => MDT-29%, MDB+23
		ear1="Merman's Earring",	ear2="Merman's Earring",
		hands="Iuitl Wristbands +1",
		back="Tuilha Cape",		waist="Flume Belt",		feet="Iuitl Gaiters +1"
	})
	
	sets.engaged = {									--range="Raider's Boomerang",
		head="Taeon Chapeau",	neck="Asperity Necklace",	ear1="Dudgeon Earring",	ear2="Heartseeker Earring",
		body="Qaaxo Harness",	hands="Plunderer's Armlets +1",	ring1="Rajas Ring",	ring2="Epona's Ring",
		back="Atheling Mantle",	waist="Patentia Sash",		legs="Taeon Tights",	feet="Taeon Boots"
	}
	sets.engaged.with_buff = {}
	sets.engaged.with_buff['doom'] = {ring1="Saida Ring", ring2="Saida Ring"}
	sets.engaged.with_buff['reive mark'] = {neck="Ygnas's Resolve +1"}
	
	sets.engaged.MediumAcc = {								--range="Raider's Boomerang",
		head="Taeon Chapeau",	neck="Asperity Necklace",	ear1="Dudgeon Earring",	ear2="Heartseeker Earring",
		body="Iuitl Vest +1",	hands="Plunderer's Armlets +1",	ring1="Rajas Ring",	ring2="Epona's Ring",
		back="Canny Cape",	waist="Patentia Sash",		legs="Taeon Tights",	feet="Taeon Boots"
	}
	
	sets.engaged.HighAcc = {					--range=nil,		ammo="Honed Tathlum",
		head="Whirlpool Mask",	neck="Peacock Amulet",		ear1="Dudgeon Earring",	ear2="Heartseeker Earring",
		body="Iuitl Vest +1",	hands="Plunderer's Armlets +1",	ring1="Rajas Ring",	ring2="Epona's Ring",
		back="Canny Cape",	waist="Anguinus Belt",		legs="Taeon Tights",	feet="Taeon Boots"
	}
	
	sets.engaged.TH = {									--range="Raider's Boomerang",
		head="Taeon Chapeau",	neck="Asperity Necklace",	ear1="Dudgeon Earring",	ear2="Heartseeker Earring",
		body="Qaaxo Harness",	hands="Plunderer's Armlets +1",	ring1="Rajas Ring",	ring2="Epona's Ring",
		back="Canny Cape",	waist="Patentia Sash",		legs="Taeon Tights",	feet="Raider's Poulaines +2"
	}
end