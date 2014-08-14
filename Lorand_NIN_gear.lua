-----------------------------------------------------------------------------------------------------------
--[[
	Author: Ragnarok.Lorand
	
	Gorgets needed: BREEZE & SHADOW & LIGHT

	Slips:
		2:	Brutal Earring, Loq. Earring
		3: 	Twilight Torque
		10:	Iga+2 Body/Hands/Feet
		15:	Hachiya Hands/Feet
		16:	Hachiya+1 Body/Legs
		17:	Mochizuki Head/Body/Hands/Legs
		18:	Mochizuki+1 Feet

	<legs>Iga Hakama +2</legs>	Adds Counter to Yonin when shadows are down
--]]
-----------------------------------------------------------------------------------------------------------

function init_gear_sets()
	--============================================================
	--					Precast sets
	--============================================================
	sets.precast.JA['Mijin Gakure'] = {legs="Mochizuki Hakama +1"}

	sets.precast.Waltz = {
		head="Uk'uxkaj Cap",		neck="Dualism Collar",
		body="Hachiya Chainmail +1",hands="Buremte Gloves",	ring1="Asklepian Ring",		ring2="Terrasoul Ring",
		back="Iximulew Cape",		waist="Warwolf Belt",	legs="Hachiya Hakama +1",	feet="Mochizuki Kyahan +1"
	}
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.precast.Step = set_combine(sets.engaged, {
		body="Mochizuki Chainmail +1"
	})
	
	sets.precast.Ranged = {
		head="Uk'uxkaj Cap",
		hands="Manibozho Gloves"
	}
	
	sets.precast.FC = {					--25%
		ammo="Impatiens",				--Q+2%4
		head="Anwig Salade",			--5%
		neck="Orunmila's Torque",		--5%
		ear1="Loquacious Earring",		--2%
		hands="Thaumas Gloves",			--4%
		ring1="Prolix Ring",			--2%
		ring2="Veneficium Ring",		--Q+1%
		legs="Quiahuiz Trousers",		--3%
		feet="Suzaku's Sune-Ate"		--4%
	}
	
	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {	--40%
		neck="Magoraga Bead Necklace",	--10%
		body="Mochizuki Chainmail +1",	--10%
	})

	--============================================================
	--sets.wsBase[magic][sam/other][state.OffenseMode][state.RangedMode][wsmod[spell.en]]
	sets.wsBase = {
		ammo="Yetshila",
		head="Uk'uxkaj Cap",			neck="Asperity Necklace",	ear1="Bladeborn Earring",	ear2="Steelflash Earring",
		body="Mochizuki Chainmail +1",	hands="Mochizuki Tekko +1",	ring1="Rajas Ring",			ring2="Epona's Ring",
		back="Yokaze Mantle",			waist="Anguinus Belt",		legs="Quiahuiz Trousers",	feet="Mochizuki Kyahan +1"
	}
	
	sets.wsBase.Acc = {}
	sets.wsBase.Acc.DEX = {}
	sets.wsBase.Acc.AGI = {}
	
	sets.wsBase.STR = {
		head="Ejekamal Mask",
		body="Hachiya Chainmail +1",
		legs="Hachiya Hakama +1",
	}
	
	sets.wsBase.DEX = {
		body="Shneddick Tabard +1",
		legs="Kaabnax Trousers"
	}
	
	sets.wsBase.STRDEX = {
		body="Shneddick Tabard +1",
		legs="Kaabnax Trousers"
	}
	
	sets.wsBase.AGI = {
		ring1="Stormsoul Ring",
		feet="Daihanshi Habaki"
	}
	
	sets.wsBase.Magic = {
		ammo="Dosis Tathlum",
		head="Mochizuki Hatsuburi +1",	neck="Stoicheion Medal",	ear1="Hecate's Earring",	ear2="Friomisi Earring",
		body="Shneddick Tabard +1",		hands="Mochizuki Tekko +1",	ring1="Fenrir Ring +1",		ring2="Acumen Ring",
		back="Toro Cape",				legs="Shneddick Tights +1",	feet="Hachiya Kyahan"
	}
	
	--============================================================
	--					Midcast sets
	--============================================================
	
	sets.midcast.FastRecast = {
		ammo="Impatiens",
		head="Otronif Mask +1",		neck="Orunmila's Torque",	ear1="Loquacious Earring",	ear2="Ethereal Earring",
		body="Otronif Harness +1",	hands="Mochizuki Tekko +1",	ring1="Prolix Ring",		ring2="Diamond Ring",
		back="Mujin Mantle",		waist="Flume Belt",			legs="Quiahuiz Trousers",	feet="Otronif Boots +1"
	}
	sets.midcast.Utsusemi = {feet="Iga Kyahan +2"}

	sets.midcast.MagicAccuracy = {
		head="Hachiya Hatsuburi",	neck="Stoicheion Medal",	ear1="Lifestorm Earring",	ear2="Psystorm Earring",
		ring1="Perception Ring",	ring2="Balrahn's Ring",
		back="Yokaze Mantle",		feet="Shneddick Boots +1"
	}
	
	sets.midcast.Ninjutsu = {
		head="Hachiya Hatsuburi",
		feet="Mochizuki Kyahan +1"
	}
	
	sets.midcast.Ninjutsu.Nuke = {
		ammo="Dosis Tathlum",
		head="Mochizuki Hatsuburi +1",	neck="Stoicheion Medal",	ear1="Hecate's Earring",	ear2="Friomisi Earring",
		body="Shneddick Tabard +1",		hands="Iga Tekko +2",		ring1="Fenrir Ring +1",		ring2="Acumen Ring",
		back="Toro Cape",				legs="Shneddick Tights +1",	feet="Hachiya Kyahan"
	}
	
	sets.midcast.RangedAttack = {
		head="Uk'uxkaj Cap",			neck="Ocachi Gorget",		ear1="Clearview Earring",
		body="Mochizuki Chainmail +1",	hands="Hachiya Tekko",		ring1="Longshot Ring",		ring2="Paqichikaji Ring",
		back="Yokaze Mantle",			waist="Sveltesse Gouriz",	legs="Hachiya Hakama +1",	feet="Mochizuki Kyahan +1"
	}
	
	--============================================================
	--					Other sets
	--============================================================
	
	sets.idle = {
		ammo="Demonry Stone",
		head="Ocelomeh Headpiece +1",	neck="Orochi Nodowa",		ear1="Novia Earring",		ear2="Ethereal Earring",
		body="War Shinobi Gi",			hands="Mochizuki Tekko +1",	ring1="Defending Ring",		ring2="Sheltered Ring",
		back="Repulse Mantle",			waist="Flume Belt",			legs="Hachiya Hakama +1",	feet="Danzo Sune-Ate"
	}
	sets.idle.speedy = select_movement()
	sets.idle.with_buff['Migawari'] = {body="Iga Ningi +2"}
	sets.idle.with_buff['Doom'] = {ring1="Saida Ring", ring2="Saida Ring"}
	
	-- Defense sets
	sets.defense.Evasion = {
		head="Otronif Mask +1",			neck="Torero Torque",		ear1="Novia Earring",		ear2="Ethereal Earring",
		body="Hachiya Chainmail +1",	hands="Otronif Gloves +1",	ring1="Defending Ring",		ring2="Alert Ring",
		back="Ik Cape",					waist="Sveltesse Gouriz",	legs="Hachiya Hakama +1",	feet="Otronif Boots +1"
	}
	
	sets.defense.DT = {
		neck="Twilight Torque",
		ring1="Defending Ring",	ring2="Dark Ring"
	}
	
	sets.defense.PDT = set_combine(sets.defense.DT, {	--PDT-37%
		head="Otronif Mask +1",		
		body="Otronif Harness +1",	hands="Otronif Gloves +1",	
		back="Repulse Mantle",		waist="Flume Belt",			legs="Otronif Brais +1",	feet="Otronif Boots +1"
	})
	sets.defense.MDT = set_combine(sets.defense.DT, {	--MDT-16%, MDB+17
		ammo="Demonry Stone",
		head="Otronif Mask +1",		ear1="Merman's Earring",	ear2="Merman's Earring",
		body="Hachiya Chainmail +1",hands="Otronif Gloves +1",
		back="Tuilha Cape",			legs="Hachiya Hakama +1",	feet="Mochizuki Kyahan +1"
	})

	sets.DayMovement = {feet="Danzo Sune-Ate"}
	sets.NightMovement = {feet="Hachiya Kyahan"}
	
	--============================================================
	
	sets.engaged = {}
	
	sets.engaged.with_buff['Migawari'] = {body="Iga Ningi +2"}
	sets.engaged.with_buff['Doom'] = {ring1="Saida Ring", ring2="Saida Ring"}
	
	sets.engaged.HasteII = {
		ammo="Yetshila",
		head="Uk'uxkaj Cap",			neck="Asperity Necklace",	ear1="Bladeborn Earring",	ear2="Steelflash Earring",
		body="Mochizuki Chainmail +1",	hands="Mochizuki Tekko +1",	ring1="Rajas Ring",			ring2="Epona's Ring",
		back="Atheling Mantle",			waist="Patentia Sash",		legs="Mochizuki Hakama +1",	feet="Otronif Boots +1"
	}
	--sets.engaged.HasteII_HasteSamba = {
	sets.engaged.HasteII_Acc = {
		ammo="Fire Bomblet",
		head="Ejekamal Mask",			neck="Asperity Necklace",	ear1="Bladeborn Earring",	ear2="Steelflash Earring",
		body="Mochizuki Chainmail +1",	hands="Otronif Gloves +1",	ring1="Rajas Ring",			ring2="Epona's Ring",
		back="Yokaze Mantle",			waist="Patentia Sash",		legs="Mochizuki Hakama +1",	feet="Mochizuki Kyahan +1"
	}

	sets.engaged['HasteII++'] = {
		ammo="Yetshila",
		head="Uk'uxkaj Cap",			neck="Asperity Necklace",	ear1="Bladeborn Earring",	ear2="Steelflash Earring",
		body="Mochizuki Chainmail +1",	hands="Mochizuki Tekko +1",	ring1="Rajas Ring",			ring2="Epona's Ring",
		back="Atheling Mantle",			waist="Patentia Sash",		legs="Hachiya Hakama +1",	feet="Mochizuki Kyahan +1"
	}
	sets.engaged['HasteII++_Acc'] = {
		ammo="Fire Bomblet",
		head="Ejekamal Mask",			neck="Asperity Necklace",	ear1="Bladeborn Earring",	ear2="Steelflash Earring",
		body="Mochizuki Chainmail +1",	hands="Otronif Gloves +1",	ring1="Rajas Ring",			ring2="Epona's Ring",
		back="Yokaze Mantle",			waist="Patentia Sash",		legs="Hachiya Hakama +1",	feet="Mochizuki Kyahan +1"
	}
	
	sets.engaged.HasteI = {
		ammo="Yetshila",
		head="Iga Zukin +2",			neck="Asperity Necklace",	ear1="Dudgeon Earring",		ear2="Heartseeker Earring",
		body="Mochizuki Chainmail +1",	hands="Mochizuki Tekko +1",	ring1="Rajas Ring",			ring2="Epona's Ring",
		back="Atheling Mantle",			waist="Patentia Sash",		legs="Mochizuki Hakama +1",	feet="Mochizuki Kyahan +1"
	}
	sets.engaged.HasteI.Higher = {
		back="Yokaze Mantle"
	}
	
	sets.engaged.HasteI_HasteSamba = {
		ammo="Yetshila",
		head="Uk'uxkaj Cap",			neck="Asperity Necklace",	ear1="Dudgeon Earring",		ear2="Heartseeker Earring",
		body="Hachiya Chainmail +1",	hands="Mochizuki Tekko +1",	ring1="Rajas Ring",			ring2="Epona's Ring",
		back="Atheling Mantle",			waist="Patentia Sash",		legs="Mochizuki Hakama +1",	feet="Mochizuki Kyahan +1"
	}
	sets.engaged.HasteI_HasteSamba.Higher = {
		head="Ejekamal Mask",
		hands="Otronif Gloves +1",
		back="Yokaze Mantle"
	}
	
	sets.engaged.Acc = {
		ammo="Fire Bomblet",
		head="Mochizuki Hatsuburi +1",	neck="Ziel Charm",			ear1="Dudgeon Earring",		ear2="Heartseeker Earring",
		body="Mochizuki Chainmail +1",	hands="Otronif Gloves +1",	ring1="Rajas Ring",			ring2="Mars's Ring",
		back="Yokaze Mantle",			waist="Anguinus Belt",		legs="Hachiya Hakama +1",	feet="Mochizuki Kyahan +1"
	}
	
	sets.engaged.Tank = {
		ammo="Yetshila",
		head="Ejekamal Mask",		neck="Twilight Torque",		ear1="Dudgeon Earring",		ear2="Heartseeker Earring",
		body="Hachiya Chainmail +1",hands="Otronif Gloves +1",	ring1="Defending Ring",		ring2="Rajas Ring",
		back="Yokaze Mantle",		waist="Patentia Sash",		legs="Mochizuki Hakama +1",	feet="Otronif Boots +1"
	}
end