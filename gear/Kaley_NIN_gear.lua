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
		body="Mochizuki Chainmail +1",	hands="Otronif Gloves",	ring2="Adler Ring",
		back="Yokaze Mantle",		waist="Anguinus Belt",	legs="Kaabnax Trousers",	feet="Mochizuki Kyahan"
	}
	
	sets.precast.FC = {
		neck="Magoraga Bead Necklace",	ear1="Loquacious Earring",
		body="Mochizuki Chainmail +1",		hands="Mochizuki Tekko"
	}
	
	--============================================================
	
	sets.wsBase = {                                                                         ammo="Happo Shuriken",
        head="Hizamaru Somen",      neck="Asperity Necklace",   ear1="Bladeborn Earring",   ear2="Steelflash Earring",
        body="Hizamaru Haramaki",   hands="Hizamaru Kote",      ring1="Rajas Ring",         ring2="Epona's Ring",
        back="Yokaze Mantle",       waist="Anguinus Belt",      legs="Hizamaru Hizayoroi",  feet="Taeon Boots"
	}
	
	sets.wsBase.Magic = {
		neck="Sanctity Necklace",	ear1="Hecate's Earring",	ear2="Friomisi Earring",
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
		neck="Sanctity Necklace",	ear1="Lifestorm Earring",	ear2="Psystorm Earring",
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
		body="Mochizuki Chainmail +1",
		back="Yokaze Mantle",		legs="Ninja Hakama +1"
	}

	--============================================================
	--					Other sets
	--============================================================
	
    sets.weapons.Main = {main="Tancho", sub="Jushimatsu"}
    sets.weapons.OAT = {main="Tancho", sub="Taikogane"}
    sets.weapons.Reive = {main="Tancho", sub="Senkutanto"}
    sets.weapons.Dagger = {main="Atoyac", sub="Jushimatsu"}
    
    sets.cooking = {
        main="Hocho",
        neck="Culinarian's Torque",
        ring1="Craftmaster's Ring",
        ring2="Craftkeeper's Ring",
        feet="Hachiya Kyahan"
    }
    
	sets.idle = {                                                                       ammo="Happo Shuriken",
        head="Hizamaru Somen",      neck="Twilight Torque", ear1="Novia Earring",       ear2="Ethereal Earring",
        body="Hizamaru Haramaki",   hands="Hizamaru Kote",  ring1=gear.darkRing1,       ring2="Shneddick Ring",
        back="Repulse Mantle",      waist="Chuq'aba Belt",  legs="Hizamaru Hizayoroi",  feet="Hachiya Kyahan"
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

	sets.engaged = {                                                                            ammo="Happo Shuriken",
        head="Hizamaru Somen",          neck="Asperity Necklace",   ear1="Dudgeon Earring",     ear2="Heartseeker Earring",
        body="Mochizuki Chainmail +1",  hands="Hizamaru Kote",      ring1="Rajas Ring",         ring2="Epona's Ring",
        back="Yokaze Mantle",           waist="Anguinus Belt",      legs="Hizamaru Hizayoroi",  feet="Taeon Boots"
	}
	sets.engaged.with_buff = {}
	sets.engaged.with_buff['doom'] = {ring1="Saida Ring", ring2="Saida Ring"}
	
    sets.engaged.Tank = {}
    
    sets.engaged.auto = {}
    sets.engaged.auto['na'] =   {
    }
    sets.engaged.auto['I'] =    {
    }
    sets.engaged.auto['I+'] =   {}
    sets.engaged.auto['II'] =   {
    }
    sets.engaged.auto['II+'] =  {
    }
    
    sets.engaged.auto.MediumAcc = {
    }
    sets.engaged.auto.HighAcc = {
    }
    
    sets.engaged.CrazyAccuracy = {}
    

	sets.buffs.Migawari = {body="Iga Ningi +2"}
end