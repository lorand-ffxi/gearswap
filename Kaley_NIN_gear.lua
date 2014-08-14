-----------------------------------------------------------------------------------------------------------
-- Author: Ragnarok.Lorand
-----------------------------------------------------------------------------------------------------------

function init_gear_sets()
	--============================================================
	--					Precast sets
	--============================================================
	sets.precast.JA['Mijin Gakure'] = {legs="Mochizuki Hakama"}

	sets.precast.Waltz = {
		head="Uk'uxkaj Cap",
		body="Hachiya Chainmail +1",	hands="Outrider Mittens",	ring1="Spiral Ring",
		back="Iximulew Cape",			waist="Warwolf Belt",		legs="Outrider Hose",	feet="Otronif Boots"
	}
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.precast.Step = {
		head="Ejekamal Mask",		neck="Ziel Charm",
		body="Mochizuki Chainmail",	hands="Otronif Gloves",	ring2="Adler Ring",
		back="Yokaze Mantle",		waist="Anguinus Belt",	legs="Kaabnax Trousers",	feet="Mochizuki Kyahan"
	}
	
	sets.precast.FC = {
		neck="Magoraga Bead Necklace",	ear1="Loquacious Earring",
		body="Mochizuki Chainmail",		hands="Mochizuki Tekko"
	}
	
	--============================================================
	
	sets.wsBase = {
		head="Uk'uxkaj Cap",			neck="Asperity Necklace",	ear1="Bladeborn Earring",	ear2="Brutal Earring",
		body="Hachiya Chainmail +1",	hands="Mochizuki Tekko",	ring1="Rajas Ring",			ring2="Epona's Ring",
		back="Yokaze Mantle",			waist="Anguinus Belt",		legs="Quiahuiz Trousers",	feet="Mochizuki Kyahan"
	}
	
	sets.wsBase.Magic = {
		neck="Stoicheion Medal",	ear1="Hecate's Earring",	ear2="Friomisi Earring",
		back="Toro Cape"
	}
	
	--============================================================
	--					Midcast sets
	--============================================================
	
	sets.midcast.FastRecast = {
		head="Ejekamal Mask",			neck="Twilight Torque",	ear1="Loquacious Earring",
		body="Hachiya Chainmail +1",	hands="Mochizuki Tekko",
		back="Yokaze Mantle",			waist="Cetl Belt",		legs="Kaabnax Trousers",	feet="Otronif Boots"
	}
	sets.midcast.Utsusemi = set_combine(sets.midcast.SelfNinjutsu, {feet="Iga Kyahan +2"})

	sets.midcast.MagicAccuracy = {
		neck="Stoicheion Medal",	ear1="Lifestorm Earring",	ear2="Psystorm Earring",
		ring1="Perception Ring",
		back="Yokaze Mantle",		feet="Hachiya Kyahan"
	}
	
	sets.midcast.Ninjutsu = {
		feet="Mochizuki Kyahan"
	}
	
	sets.midcast.Ninjutsu.Nuke = {
		ear1="Hecate's Earring",	ear2="Friomisi Earring",
		hands="Iga Tekko +2",		ring2="Acumen Ring"
	}
	
	sets.midcast.RangedAttack = {
		body="Mochizuki Chainmail",
		back="Yokaze Mantle",		legs="Ninja Hakama +1"
	}

	--============================================================
	--					Other sets
	--============================================================
	
	sets.idle = {
		ammo="Jukukik Feather",
		head="Ejekamal Mask",			neck="Twilight Torque",		ear1="Novia Earring",		ear2="Suppanomimi",
		body="Hachiya Chainmail +1",	hands="Mochizuki Tekko",	ring1="Dark Ring",			ring2="Dark Ring",
		back="Yokaze Mantle",			waist="Flume Belt",			legs="Mochizuki Hakama",	feet="Danzo Sune-Ate"
	}
	sets.idle.speedy = {feet="Danzo Sune-Ate"}
	sets.idle.with_buff = {}
	sets.idle.with_buff['Doom'] = {ring1="Saida Ring", ring2="Saida Ring"}
	
	sets.defense.DT = {
		neck="Twilight Torque",
		ring1="Dark Ring",		ring2="Dark Ring"
	}
	
	sets.defense.PDT = set_combine(sets.defense.DT, {	--PDT-37%
		back="Iximulew Cape",		waist="Flume Belt"
	})
	sets.defense.MDT = set_combine(sets.defense.DT, {	--MDT-16%, MDB+17
		head="Ejekamal Mask",
		body="Hachiya Chainmail +1",
		back="Tuilha Cape",			legs="Kaabnax Trousers",	feet="Otronif Boots"
	})

	sets.DayMovement = {feet="Danzo Sune-Ate"}
	sets.NightMovement = {feet="Hachiya Kyahan"}
	sets.Kiting = select_movement()

	--============================================================
	
	sets.engaged = {
		ammo="Jukukik Feather",
		head="Uk'uxkaj Cap",		neck="Asperity Necklace",	ear1="Brutal Earring",		ear2="Suppanomimi",
		body="Hachiya Chainmail +1",hands="Mochizuki Tekko",	ring1="Rajas Ring",			ring2="Epona's Ring",
		back="Yokaze Mantle",		waist="Cetl Belt",			legs="Mochizuki Hakama",	feet="Mochizuki Kyahan"
	}
	sets.engaged.with_buff = {}
	sets.engaged.with_buff['Doom'] = {ring1="Saida Ring", ring2="Saida Ring"}
	
	sets.engaged.Mix = set_combine(sets.engaged, {
		head="Ejekamal Mask",
		body="Mochizuki Chainmail",	hands="Otronif Gloves"
	})
	
	sets.engaged.Acc = set_combine(sets.engaged.Mix, {
		neck="Ziel Charm",
		ring2="Adler Ring",
		waist="Anguinus Belt",	legs="Kaabnax Trousers"
	})
	
	sets.engaged.Tank = {
		ammo="Jukukik Feather",
		head="Uk'uxkaj Cap",		neck="Twilight Torque",		ear1="Brutal Earring",		ear2="Suppanomimi",
		body="Hachiya Chainmail +1",hands="Mochizuki Tekko",	ring1="Rajas Ring",			ring2="Dark Ring",
		back="Yokaze Mantle",		waist="Cetl Belt",			legs="Mochizuki Hakama",	feet="Mochizuki Kyahan"
	}

	sets.buff.Migawari = {body="Iga Ningi +2"}
	--sets.buff.Doomed = {ring2="Saida Ring"}
	sets.buff.Yonin = {}
	sets.buff.Innin = {}
end