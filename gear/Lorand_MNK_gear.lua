--------------------------------------------------------------------------------
--[[
	Author: Ragnarok.Lorand
--]]
--------------------------------------------------------------------------------

function init_gear_sets()
	--============================================================
	--			Precast sets
	--============================================================
	sets.precast.JA['Hundred Fists'] = {	legs="Hesychast's Hose +1"}
	sets.precast.JA['Boost'] = {		hands="Anchorite's Gloves"}
	sets.precast.JA['Dodge'] = {		feet="Anchorite's Gaiters +1"}
	sets.precast.JA['Focus'] = {		head="Anchorite's Crown"}
	sets.precast.JA['Counterstance'] = {	feet="Hesychast's Gaiters"}
	sets.precast.JA['Footwork'] = {		feet="Tantra Gaiters +2"}	-- Tantra+2: Raises attack bonus from 100/1024 to 152/1024
	sets.precast.JA['Formless Strikes'] = {	body="Hesychast's Cyclas"}
	sets.precast.JA['Mantra'] = {		feet="Hesychast's Gaiters"}
	sets.precast.JA['Impetus'] = {		body="Tantra Cyclas +2"}
	sets.precast.JA['Invigorate'] = {	hands="Hesychast's Gloves +1"}
	
	sets.precast.JA['Chi Blast'] = {
		head="Uk'uxkaj Cap",
		body="Otronif Harness +1",	hands="Hesychast's Gloves +1",
		back="Tuilha Cape",		legs="Quiahuiz Trousers",		feet="Anchorite's Gaiters +1"
	}
	sets.precast.JA['Chakra'] = {
		ammo="Bibiki Seashell",
		head="Uk'uxkaj Cap",		ear1="Soil Pearl",		ear2="Kemas Earring",
		body="Anchorite's Cyclas",	hands="Hesychast's Gloves +1",	ring1="Terrasoul Ring",		ring2="Spiral Ring",
		back="Iximulew Cape",		waist="Warwolf Belt",		legs="Quiahuiz Trousers",	feet="Otronif Boots +1"
	}

	sets.precast.Waltz = {
		ammo="Bibiki Seashell",
		head="Uk'uxkaj Cap",		ear1="Soil Pearl",		ear2="Kemas Earring",
		body="Otronif Harness +1",	hands="Hesychast's Gloves +1",	ring1="Terrasoul Ring",		ring2="Asklepian Ring",
		back="Ixmulew Cape",		waist="Warwolf Belt",		legs="Kaabnax Trousers",	feet="Otronif Boots +1"
	}
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.precast.Step = {}
	
	--============================================================
	
	-- Fast cast sets for spells
	sets.precast.FC = {
		head="Anwig Salade",		neck="Orunmila's Torque",	ear1="Loquacious Earring",
		body="Taeon Tabard",		hands="Thaumas Gloves",		ring1="Prolix Ring"		ring2="Veneficium Ring",
		legs="Quiahuiz Trousers",	feet="Suzaku's Sune-Ate"
	}
	sets.precast.FC.Utsusemi = {neck="Magoraga Bead Necklace"}
	
	--============================================================
	
	sets.wsBase = {											ammo="Potestas Bomblet",
		head="Highwing Helm",	neck="Asperity Necklace",	ear1="Bladeborn Earring",	ear2="Steelflash Earring",
		body="Qaaxo Harness",	hands="Taeon Gloves",		ring1="Rajas Ring",		ring2="Epona's Ring",
		back="Atheling Mantle",	waist="Fotia Belt",		legs="Otronif Brais +1",	feet="Manibozho Boots"
	}
	sets.wsBase.MediumAcc = {ammo="Honed Tathlum",head="Whirlpool Mask"}
	sets.wsBase.HighAcc = {ammo="Honed Tathlum",head="Whirlpool Mask",back="Anchoret's Mantle",feet="Taeon Boots"}

	sets.wsBase.Magic = {							ammo="Dosis Tathlum",
		neck="Stoicheion Medal",	ear1="Hecate's Earring",	ear2="Friomisi Earring",
		ring1="Fenrir Ring +1",		ring2="Acumen Ring",
		back="Toro Cape"
	}
	
	--============================================================
	--			Midcast sets
	--============================================================
	
	sets.midcast.FastRecast = combineSets(sets.precast.FC, {
		head="Otronif Mask +1",		neck="Orunmila's Torque",
		body="Otronif Harness +1",	hands="Hesychast's Gloves +1",
		back="Mujin Mantle",		waist="Black Belt",			legs="Kaabnax Trousers",	feet="Hesychast's Gaiters"
	})

	--============================================================
	--			Other sets
	--============================================================
	
	sets.buffs['doom'] = {ring1="Saida Ring", ring2="Saida Ring"}
	
	sets.idle = {											ammo="Demonry Stone",
		head="Ocelomeh Headpiece +1",	neck="Orochi Nodowa",	ear1="Brachyura Earring",	ear2="Ethereal Earring",
		body={"Hesychast's Cyclas", "Kirin's Osode", "Qaaxo Harness"},
		hands="Garden Bangles",		ring1="Defending Ring",	ring2="Shneddick Ring",
		back="Repulse Mantle",		waist="Black Belt",	legs={"Hesychast's Hose +1", "Otronif Brais +1"},
		feet="Sokushitsu Sune-Ate"
	}
	sets.idle.with_buff = {}
	sets.idle.with_buff['doom'] = {ring1="Saida Ring", ring2="Saida Ring"}
	sets.idle.with_buff['reive mark'] = {neck="Ygnas's Resolve +1"}
	
	sets.resting = {}
	
	sets.defense.DT = {	--DT-15%, PDT-5%, MDT-4%	=> PDT-20%, MDT-19%
		neck="Twilight Torque",
		ring1="Defending Ring",		ring2="Dark Ring"
	}
	sets.defense.PDT = combineSets(sets.defense.DT, {	--PDT-25% + DT => PDT-45%
		head="Otronif Mask +1",			--4%
		body="Otronif Harness +1",		--3%
		hands="Otronif Gloves +1",		--4%
		back="Repulse Mantle",			--4%
		waist="Black Belt",			--5%
		legs="Otronif Brais +1",		--2%
		feet="Otronif Boots +1"			--3%
	})
	sets.defense.MDT = combineSets(sets.defense.DT, {	--MDT-6% + DT => MDT-25%, MDB+24
		ammo="Demonry Stone",			--MDB+2
		head="Ejekamal Mask",			--2%, MDB+3
		ear1="Merman's Earring",		--2%
		ear2="Merman's Earring",		--2%
		body="Qaaxo Harness",			--MDB+6
		hands="Hesychast's Gloves +1",		--MDB+1
		back="Tuilha Cape",			--MDB+4
		waist="Black Belt",			--n/a
		legs="Hesychast's Hose +1",		--MDB+3
		feet="Daihanshi Habaki"			--MDB+5
	})
	
	sets.defense.HP = sets.defense.PDT

	--============================================================
	
	sets.weapons.Main = {main="Tinhaspa"}
	
	sets.engaged = {										ammo="Potestas Bomblet",
		head="Highwing Helm",	neck="Asperity Necklace",	ear1="Bladeborn Earring",	ear2="Steelflash Earring",
		body="Qaaxo Harness",	hands="Taeon Gloves",		ring1="Rajas Ring",		ring2="Epona's Ring",
		back="Atheling Mantle",	waist="Windbuffet Belt +1",	legs="Hesychast's Hose +1",	feet="Sokushitsu Sune-Ate"
	}
	
	sets.engaged.MediumAcc = {										ammo="Honed Tathlum",
		head="Whirlpool Mask",		neck="Asperity Necklace",	ear1="Bladeborn Earring",	ear2="Steelflash Earring",
		body="Qaaxo Harness",		hands="Hesychast's Gloves +1",	ring1="Rajas Ring",		ring2="Epona's Ring",
		back="Anchoret's Mantle",	waist="Windbuffet Belt +1",	legs="Hesychast's Hose +1",	feet="Sokushitsu Sune-Ate"
	}
	
	sets.engaged.HighAcc = {										ammo="Honed Tathlum",
		head="Whirlpool Mask",		neck="Peacock Amulet",		ear1="Bladeborn Earring",	ear2="Steelflash Earring",
		body="Otronif Harness +1",	hands="Hesychast's Gloves +1",	ring1="Rajas Ring",		ring2="Epona's Ring",
		back="Anchoret's Mantle",	waist="Anguinus Belt",		legs="Hesychast's Hose +1",	feet="Taeon Boots"
	}
	
	sets.engaged.Tank = {											ammo="Demonry Stone",
		head="Otronif Mask +1",		neck="Twilight Torque",		ear1="Bladeborn Earring",	ear2="Steelflash Earring",
		body="Otronif Harness +1",	hands="Otronif Gloves +1",	ring1="Defending Ring",		ring2="Rajas Ring",
		back="Anchoret's Mantle",	waist="Black Belt",		legs="Otronif Brais +1",	feet="Otronif Boots +1"
	}
	
	sets.engaged.Tank.MediumAcc = {										ammo="Honed Tathlum",
		head="Whirlpool Mask",		neck="Twilight Torque",		ear1="Bladeborn Earring",	ear2="Steelflash Earring",
		body="Otronif Harness +1",	hands="Otronif Gloves +1",	ring1="Defending Ring",		ring2="Rajas Ring",
		back="Anchoret's Mantle",	waist="Anguinus Belt",		legs="Hesychast's Hose +1",	feet="Otronif Boots +1"
	}
	
	sets.engaged.Tank.HighAcc = {										ammo="Honed Tathlum",
		head="Whirlpool Mask",		neck="Twilight Torque",		ear1="Bladeborn Earring",	ear2="Steelflash Earring",
		body="Otronif Harness +1",	hands="Otronif Gloves +1",	ring1="Defending Ring",		ring2="Rajas Ring",
		back="Anchoret's Mantle",	waist="Anguinus Belt",		legs="Hesychast's Hose +1",	feet="Otronif Boots +1"
	}
	
	sets.engaged.with_buff['doom'] = {ring1="Saida Ring", ring2="Saida Ring"}
	sets.engaged.with_buff['reive mark'] = {neck="Ygnas's Resolve +1"}
end