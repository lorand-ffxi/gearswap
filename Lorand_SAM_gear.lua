-----------------------------------------------------------------------------------------------------------
--[[
	Author: Ragnarok.Lorand
	
	Slips:
		3:	Rose Strap, Twilight Helm/Mail/Torque
		10:	Unkai+2 Head/Hands/Legs/Feet
		15:	Wakido Head/Body/Hands/Legs/Feet
		17:	Sakonji Hands/Legs/Feet
		18: Sakonji+1 Head/Body
--]]
-----------------------------------------------------------------------------------------------------------

function init_gear_sets()
	--============================================================
	--					Precast sets
	--============================================================
	sets.precast.JA.Meditate = {head="Wakido Kabuto",hands="Sakonji Kote"}
	sets.precast.JA['Warding Circle'] = {head="Wakido Kabuto"}
	sets.precast.JA['Blade Bash'] = {hands="Sakonji Kote"}
	sets.precast.JA.Seigan = {head="Unkai Kabuto +2"}
	sets.precast.JA.Sekkanoki = {hands="Unkai Kote +2"}
	sets.precast.JA.Sengikori = {feet="Unkai Sune-ate +2"}

	sets.precast.FC = {				--20%
		neck="Orunmila's Torque",	--5%
		ear1="Loquacious Earring",	--2%
		body="Nuevo Coselete",		--5%
		hands="Buremte Gloves",		--3%
		ring1="Prolix Ring",		--2%
		ring2="Veneficium Ring",	--Q+1%
		feet="Ejekamal Boots"		--3%
	}
	
	sets.precast.Waltz = {
		head="Otronif Mask +1",
		body="Gorney Haubert +1",	hands="Gorney Moufles +1",	ring1="Asklepian Ring",		ring2="Terrasoul Ring",
		back="Iximulew Cape",		waist="Warwolf Belt",		legs="Gorney Brayettes +1",	feet="Otronif Boots +1"
	}
	sets.precast.Waltz['Healing Waltz'] = {}
	
	sets.precast.Ranged = {		--9%
		head="Otomi Helm",		--2%
		body="Nuevo Coselete",	--5%
		hands="Buremte Gloves",	--2%
	}
	
	--============================================================
	--sets.wsBase[magic][sam/other][state.OffenseMode][state.RangedMode][wsmod[spell.en]]
	sets.wsBase = {
		ammo="Potestas Bomblet",
		head="Otomi Helm",			neck="Asperity Necklace",	ear1="Bladeborn Earring",	ear2="Steelflash Earring",
		body="Gorney Haubert +1",	hands="Wakido Kote",		ring1="Rajas Ring",			ring2="Pyrosoul Ring",
		back="Atheling Mantle",		waist="Windbuffet Belt",	legs="Gorney Brayettes +1",	feet="Ejekamal Boots"
	}

	sets.wsBase['4-Hit'] = {
		ammo="Potestas Bomblet",
		head="Yaoyotl Helm",	neck="Asperity Necklace",	ear1="Bladeborn Earring",	ear2="Steelflash Earring",
		body="Phorcys Korazin",	hands="Otronif Gloves +1",	ring1="Rajas Ring",			ring2="Pyrosoul Ring",
		back="Takaha Mantle",	waist="Windbuffet Belt",	legs="Otronif Brais +1",	feet="Whirlpool Greaves"
	}
	
	sets.wsBase['5-Acc'] = {
		ammo="Potestas Bomblet",
		head="Otomi Helm",			neck="Asperity Necklace",	ear1="Bladeborn Earring",	ear2="Steelflash Earring",
		body="Gorney Haubert +1",	hands="Buremte Gloves",		ring1="Rajas Ring",			ring2="Pyrosoul Ring",
		back="Takaha Mantle",		waist="Windbuffet Belt",	legs="Gorney Brayettes +1",	feet="Ejekamal Boots"
	}
	
	sets.wsBase.magic = {
		ring1="Fenrir Ring +1",		ring2="Acumen Ring",
	}
	
	--============================================================
	--					Midcast sets
	--============================================================

	sets.midcast.FastRecast = {
		neck="Orunmila's Torque",	ear1="Loquacious Earring",
		hands="Buremte Gloves",		ring1="Prolix Ring",		ring2="Diamond Ring",	--Diamond Ring aug: 2% interrupt rate down
		back="Mujin Mantle",		waist="Cetl Belt",
	}
	
	--============================================================
	--					Other sets
	--============================================================
	
	sets.resting = {}
	
	sets.idle = {
		ammo="Demonry Stone",
		head={"Twilight Helm", "Yaoyotl Helm"},
		neck="Orochi Nodowa",	ear1="Novia Earring",	ear2="Ethereal Earring",
		body={"Sakonji Domaru +1", "Otronif Harness +1"},
		hands={"Sakonji Kote", "Otronif Gloves +1"},
		ring1="Defending Ring",	ring2="Sheltered Ring",
		back="Repulse Mantle",	waist="Flume Belt",		legs="Otronif Brais +1",feet="Ejekamal Boots"
	}
	sets.idle.speedy = {feet="Danzo Sune-Ate"}
	sets.idle.Reraise = {
		head="Twilight Helm",
		body="Twilight Mail",
		feet="Danzo Sune-Ate"
	}
	sets.idle.with_buff = {}
	sets.idle.with_buff['doom'] = {ring1="Saida Ring", ring2="Saida Ring"}
	
	sets.defense.DT = {	--DT-5%, PDT-10%, MDT-7%	=> PDT-15%, MDT-12%
		neck="Twilight Torque",
		ring1="Defending Ring",		ring2="Dark Ring"
	}
	
	sets.defense.PDT = set_combine(sets.defense.DT, {	--PDT-22% + DT => PDT-37%
		head="Otronif Mask +1",	
		body="Otronif Harness +1",	hands="Otronif Gloves +1",	
		back="Repulse Mantle",		waist="Flume Belt",			legs="Otronif Brais +1",	feet="Otronif Boots +1"
	})
	sets.defense.MDT = set_combine(sets.defense.DT, {	--MDT-4% + DT => MDT-16%, MDB+19
		ammo="Demonry Stone",
		head="Otronif Mask +1",		ear1="Merman's Earring",	ear2="Merman's Earring",
		body="Otronif Harness +1",	hands="Buremte Gloves",
		back="Tuilha Cape",			waist="Flume Belt",			legs="Otronif Brais +1",	feet="Otronif Boots +1"
	})

	sets.defense.Reraise = {head="Twilight Helm",body="Twilight Mail"}
	
	sets.Kiting = {feet="Danzo Sune-ate"}

	sets.Reraise = {head="Twilight Helm",body="Twilight Mail"}

	--============================================================
	
	sets.engaged.with_buff = {}
	sets.engaged.with_buff['doom'] = {ring1="Saida Ring", ring2="Saida Ring"}
	sets.engaged.with_buff['hasso'] = {head="Yaoyotl Helm", legs="Unkai Haidate +2"}
	
	sets.engaged['5-Hit'] = {
		main="Amanomurakumo",		sub="Pole Grip",			ammo="Potestas Bomblet",
		head="Otomi Helm",			neck="Asperity Necklace",	ear1="Bladeborn Earring",	ear2="Steelflash Earring",
		body="Gorney Haubert +1",	hands="Otronif Gloves +1",	ring1="Rajas Ring",			ring2="Tyrant's Ring",
		back="Atheling Mantle",		waist="Windbuffet Belt",	legs="Otronif Brais +1",	feet="Ejekamal Boots"
	}
	
	sets.engaged['5-Acc'] = {
		main="Amanomurakumo",		sub="Pole Grip",			ammo="Potestas Bomblet",
		head="Sakonji Kabuto +1",	neck="Agasaya's Collar",	ear1="Bladeborn Earring",	ear2="Steelflash Earring",
		body="Gorney Haubert +1",	hands="Buremte Gloves",		ring1="Rajas Ring",			ring2="Mars's Ring",
		back="Takaha Mantle",		waist="Goading Belt",		legs="Otronif Brais +1",	feet="Ejekamal Boots"
	}
	
	sets.engaged['4-Hit'] = {
		main="Amanomurakumo",		sub="Rose Strap",			ammo="Hagneia Stone",
		head="Sakonji Kabuto +1",	neck="Asperity Necklace",	ear1="Bladeborn Earring",	ear2="Steelflash Earring",
		body="Sakonji Domaru +1",	hands="Otronif Gloves +1",	ring1="Rajas Ring",			ring2="Tyrant's Ring",
		back="Takaha Mantle",		waist="Goading Belt",		legs="Otronif Brais +1",	feet="Otronif Boots +1"
	}
	
	sets.buffs['Meikyou Shisui'] = {feet="Sakonji Sune-Ate"}
end