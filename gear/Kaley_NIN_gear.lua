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
	sets.midcast.Ninjutsu.Nuke.with_buff = {}
	sets.midcast.Ninjutsu.Nuke.with_buff['reive mark'] = {neck="Arciela's Grace +1"}
	
	sets.midcast.RangedAttack = {
		body="Mochizuki Chainmail",
		back="Yokaze Mantle",		legs="Ninja Hakama +1"
	}

	--============================================================
	--					Other sets
	--============================================================
	
	sets.idle = {
		range="Wingcutter",
        head="Otronif Mask +1",         neck="Twilight Torque", ear1="Novia Earring",       ear2="Ethereal Earring",
        body="Hachiya Chainmail +1",    hands="Macabre Gauntlets",
        ring1={name="Dark Ring", augments={'Phys. dmg. taken -5%','Breath dmg. taken -4%','Magic dmg. taken -3%'}},
        ring2="Shneddick Ring",
        back="Repulse Mantle",          waist="Chuq'aba Belt",  legs="Mochizuki Hakama +1", feet="Hachiya Kyahan"
	}
    sets.idle.chef = {
        main="Hocho",               sub="Trainee Knife",
        head="Midras's Helm +1",    neck="Culinarian's Torque",
        ring1="Artificer's Ring",
    }
	sets.idle.with_buff = {}
	sets.idle.with_buff['doom'] = {ring1="Saida Ring", ring2="Saida Ring"}
	
	sets.defense.DT = {
		neck="Twilight Torque",
		ring1="Dark Ring",		ring2="Dark Ring"
	}
	
	sets.defense.PDT = set_combine(sets.defense.DT, {
	})
	sets.defense.MDT = set_combine(sets.defense.DT, {
	})

	--============================================================
	
	sets.engaged = {                                                range="Wingcutter",
        head="Otronif Mask +1",         neck="Asperity Necklace",   ear1="Dudgeon Earring",     ear2="Heartseeker Earring",
        body="Hachiya Chainmail +1",    hands="Otronif Gloves +1",  ring1="Rajas Ring",         ring2="Epona's Ring",
        back="Yokaze Mantle",           waist="Anguinus Belt",      legs="Mochizuki Hakama +1", feet="Taeon Boots",
	}
	sets.engaged.with_buff = {}
	sets.engaged.with_buff['doom'] = {ring1="Saida Ring", ring2="Saida Ring"}
	
	sets.engaged.Mix = set_combine(sets.engaged, {
	})
	
	sets.engaged.Acc = set_combine(sets.engaged.Mix, {
	})
	
	sets.engaged.Tank = {
	}

	sets.buffs.Migawari = {body="Iga Ningi +2"}
end