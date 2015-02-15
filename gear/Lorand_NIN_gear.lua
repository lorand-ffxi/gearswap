-----------------------------------------------------------------------------------------------------------
--[[
	Author: Ragnarok.Lorand
	
	Gorgets needed: BREEZE & SHADOW & LIGHT

	Slips:
		2:	Brutal Earring, Loq. Earring
		3: 	Twilight Torque
		10:	Iga+2 Head/Body/Feet
		15:	Hachiya Hands/Feet
		16:	Hachiya+1 Body/Legs
		18:	Mochizuki+1 Head/Body/Hands/Legs/Feet

	<legs>Iga Hakama +2</legs>	Adds Counter to Yonin when shadows are down
--]]
-----------------------------------------------------------------------------------------------------------

function init_gear_sets()
	--============================================================
	--			Precast sets
	--============================================================
	sets.precast.JA['Mijin Gakure'] = {legs="Mochizuki Hakama +1"}

	sets.precast.Waltz = {
		head="Uk'uxkaj Cap",		neck="Dualism Collar",
		body="Hachiya Chainmail +1",	hands="Buremte Gloves",	ring1="Asklepian Ring",		ring2="Terrasoul Ring",
		back="Iximulew Cape",		waist="Warwolf Belt",	legs="Hachiya Hakama +1",	feet="Mochizuki Kyahan +1"
	}
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.precast.Step = combineSets(sets.engaged, {
		body="Mochizuki Chainmail +1"
	})
	
	sets.precast.Ranged = {
		ammo="Suppa Shuriken",
		head="Uk'uxkaj Cap",
		hands="Manibozho Gloves"
	}
	
	sets.precast.FC = {				--25%
		ammo="Impatiens",			--Q+2%4
		head="Anwig Salade",			--5%
		neck="Orunmila's Torque",		--5%
		ear1="Loquacious Earring",		--2%
		hands={"Thaumas Gloves", "Buremte Gloves"},--4%
		ring1="Prolix Ring",			--2%
		ring2="Veneficium Ring",		--Q+1%
		legs="Quiahuiz Trousers",		--3%
		feet="Suzaku's Sune-Ate"		--4%
	}
	
	sets.precast.FC.Utsusemi = {		--40%
		neck="Magoraga Bead Necklace",	--10%
		body="Mochizuki Chainmail +1",	--10%
	}

	--============================================================
	--sets.wsBase[magic][sam/other][state.OffenseMode][state.RangedMode][wsmod[spell.en]]
	sets.wsBase = {											ammo="Happo Shuriken +1",
		head="Uk'uxkaj Cap",	neck="Asperity Necklace",	ear1="Bladeborn Earring",	ear2="Steelflash Earring",
		body="Qaaxo Harness",	hands="Mochizuki Tekko +1",	ring1="Rajas Ring",		ring2="Epona's Ring",
		back="Yokaze Mantle",	waist="Windbuffet Belt +1",	legs="Otronif Brais +1",	feet="Mochizuki Kyahan +1"
	}
	
	sets.wsBase.Acc = {}
	sets.wsBase.Acc.DEX = {}
	sets.wsBase.Acc.AGI = {}
	
	sets.wsBase.STR = {head="Whirlpool Mask",legs="Hachiya Hakama +1",}
	sets.wsBase.DEX = {legs="Kaabnax Trousers"}
	sets.wsBase.STRDEX = {legs="Kaabnax Trousers"}
	sets.wsBase.AGI = {ring1="Stormsoul Ring",feet="Daihanshi Habaki"}
	
	sets.wsBase.Magic = {											ammo="Dosis Tathlum",
		head="Mochizuki Hatsuburi +1",	neck="Stoicheion Medal",	ear1="Hecate's Earring",	ear2="Friomisi Earring",
		body="Qaaxo Harness",		hands="Mochizuki Tekko +1",	ring1="Fenrir Ring +1",		ring2="Acumen Ring",
		back="Toro Cape",		legs="Shneddick Tights +1",	feet="Hachiya Kyahan"
	}
	
	--============================================================
	--			Midcast sets
	--============================================================
	
	sets.midcast.FastRecast = {										ammo="Impatiens",
		head="Otronif Mask +1",		neck="Orunmila's Torque",	ear1="Loquacious Earring",	ear2="Ethereal Earring",
		body="Otronif Harness +1",	hands="Mochizuki Tekko +1",	ring1="Prolix Ring",		ring2="Diamond Ring",
		back="Mujin Mantle",		waist="Flume Belt",		legs="Quiahuiz Trousers",	feet="Otronif Boots +1"
	}
	sets.midcast.Utsusemi = {feet="Iga Kyahan +2"}

	sets.midcast.MagicAccuracy = {
		head="Hachiya Hatsuburi",	neck="Stoicheion Medal",	ear1="Lifestorm Earring",	ear2="Psystorm Earring",
		ring1="Perception Ring",	ring2="Sangoma Ring",
		back="Yokaze Mantle",		waist="Ovate Rope",
	}
	
	sets.midcast.Ninjutsu = {
		head="Hachiya Hatsuburi",
		feet="Mochizuki Kyahan +1"
	}
	
	sets.midcast.Ninjutsu.Nuke = {										ammo="Dosis Tathlum",
		head="Mochizuki Hatsuburi +1",	neck="Stoicheion Medal",	ear1="Hecate's Earring",	ear2="Friomisi Earring",
		body="Qaaxo Harness",		hands="Iga Tekko +2",		ring1="Fenrir Ring +1",		ring2="Acumen Ring",
		back="Toro Cape",		legs="Shneddick Tights +1",	feet="Hachiya Kyahan"
	}
	sets.midcast.Ninjutsu.Nuke.with_buff = {}
	
	sets.midcast.RangedAttack = {
		head="Uk'uxkaj Cap",		neck="Ocachi Gorget",		ear1="Clearview Earring",
		body="Mochizuki Chainmail +1",	hands="Hachiya Tekko",		ring1="Longshot Ring",		ring2="Paqichikaji Ring",
		back="Yokaze Mantle",		waist="Sveltesse Gouriz",	legs="Hachiya Hakama +1",	feet="Mochizuki Kyahan +1"
	}
	
	--============================================================
	--			Other sets
	--============================================================
	
	sets.idle = {												ammo="Demonry Stone",
		head="Ocelomeh Headpiece +1",	neck="Orochi Nodowa",		ear1="Brachyura Earring",	ear2="Ethereal Earring",
		body="Kirin's Osode",		hands={"Mochizuki Tekko +1", "Otronif Gloves +1"},
		ring1="Defending Ring",		ring2="Shneddick Ring",
		back="Repulse Mantle",		waist="Flume Belt",		legs={"Hachiya Hakama +1", "Otronif Brais +1"},
		feet="Hachiya Kyahan"
	}
	sets.idle.with_buff = {}
	sets.idle.with_buff['migawari'] = {body="Iga Ningi +2"}
	sets.idle.with_buff['reive mark'] = {neck="Ygnas's Resolve +1"}
	
	-- Defense sets
	sets.defense.Evasion = {
		head="Otronif Mask +1",		neck="Torero Torque",		ear1="Novia Earring",		ear2="Ethereal Earring",
		body="Hachiya Chainmail +1",	hands="Otronif Gloves +1",	ring1="Defending Ring",		ring2="Alert Ring",
		back="Ik Cape",			waist="Sveltesse Gouriz",	legs="Hachiya Hakama +1",	feet="Otronif Boots +1"
	}
	
	sets.defense.DT = {
		neck="Twilight Torque",
		ring1="Defending Ring",	ring2="Dark Ring"
	}
	
	sets.defense.PDT = combineSets(sets.defense.DT, {	--PDT-37%
		head="Otronif Mask +1",		
		body="Otronif Harness +1",	hands="Otronif Gloves +1",	
		back="Repulse Mantle",		waist="Flume Belt",		legs="Otronif Brais +1",	feet="Otronif Boots +1"
	})
	sets.defense.MDT = combineSets(sets.defense.DT, {	--MDT-16%, MDB+17
		ammo="Demonry Stone",
		head="Otronif Mask +1",		ear1="Merman's Earring",	ear2="Merman's Earring",
		body="Hachiya Chainmail +1",	hands="Otronif Gloves +1",
		back="Tuilha Cape",		legs="Hachiya Hakama +1",	feet="Mochizuki Kyahan +1"
	})
	
	--============================================================
	
	sets.engaged.with_buff['migawari'] = {body="Iga Ningi +2"}
	sets.engaged.with_buff['reive mark'] = {neck="Ygnas's Resolve +1"}
	
	sets.engaged.Tank = {											ammo="Happo Shuriken +1",
		head="Otronif Mask +1",		neck="Twilight Torque",		ear1="Bladeborn Earring",	ear2="Steelflash Earring",
		body="Mochizuki Chainmail +1",	hands="Otronif Gloves +1",	ring1="Defending Ring",		ring2="Rajas Ring",
		back="Yokaze Mantle",		waist="Patentia Sash",		legs="Mochizuki Hakama +1",	feet="Otronif Boots +1"
	}
	
	sets.engaged.auto = {											ammo="Happo Shuriken +1",
		neck="Asperity Necklace",
		body="Mochizuki Chainmail +1",	hands="Mochizuki Tekko +1",	ring1="Rajas Ring",		ring2="Epona's Ring",
		back="Atheling Mantle",		waist="Patentia Sash",		legs="Mochizuki Hakama +1",	feet="Mochizuki Kyahan +1"
	}
	sets.engaged.auto['na'] =	{head="Iga Zukin +2", ear1="Dudgeon Earring", ear2="Heartseeker Earring"}
	sets.engaged.auto['I'] =	{head="Iga Zukin +2", ear1="Dudgeon Earring", ear2="Heartseeker Earring"}
	sets.engaged.auto['I+'] =	{head="Uk'uxkaj Cap", ear1="Dudgeon Earring", ear2="Heartseeker Earring", body="Hachiya Chainmail +1"}
	sets.engaged.auto['II'] =	{head="Uk'uxkaj Cap", ear1="Bladeborn Earring", ear2="Steelflash Earring", feet="Otronif Boots +1"}
	sets.engaged.auto['II+'] =	{head="Uk'uxkaj Cap", ear1="Bladeborn Earring", ear2="Steelflash Earring", legs="Hachiya Hakama +1"}
	
	sets.engaged.auto_acc = {									ammo="Happo Shuriken +1",
		neck="Asperity Necklace",
		body="Mochizuki Chainmail +1",	ring1="Rajas Ring",	ring2="Epona's Ring",
		back="Yokaze Mantle",		waist="Patentia Sash",	legs="Mochizuki Hakama +1",	feet="Mochizuki Kyahan +1"
	}
	sets.engaged.auto_acc['na'] =	{head="Iga Zukin +2", ear1="Dudgeon Earring", ear2="Heartseeker Earring", hands="Mochizuki Tekko +1"}
	sets.engaged.auto_acc['I'] =	{head="Iga Zukin +2", ear1="Dudgeon Earring", ear2="Heartseeker Earring", hands="Mochizuki Tekko +1"}
	sets.engaged.auto_acc['I+'] =	{head="Whirlpool Mask", ear1="Dudgeon Earring", ear2="Heartseeker Earring", body="Hachiya Chainmail +1", hands="Otronif Gloves +1"}
	sets.engaged.auto_acc['II'] =	{head="Whirlpool Mask", ear1="Bladeborn Earring", ear2="Steelflash Earring", hands="Otronif Gloves +1"}
	sets.engaged.auto_acc['II+'] =	{head="Whirlpool Mask", ear1="Bladeborn Earring", ear2="Steelflash Earring", hands="Otronif Gloves +1", legs="Hachiya Hakama +1"}
	
	sets.engaged.CrazyAccuracy = {										ammo="Happo Shuriken +1",
		head="Whirlpool Mask",		neck="Agitator's Collar",	ear1="Bladeborn Earring",	ear2="Steelflash Earring",
		body="Mochizuki Chainmail +1",	hands="Otronif Gloves +1",	ring1="Rajas Ring",		ring2="Mars's Ring",
		back="Yokaze Mantle",		waist="Anguinus Belt",		legs="Hachiya Hakama +1",	feet="Mochizuki Kyahan +1"
	}
	
	sets.engaged.Acc = {											ammo="Happo Shuriken +1",
		head="Mochizuki Hatsuburi +1",	neck="Ziel Charm",		ear1="Dudgeon Earring",		ear2="Heartseeker Earring",
		body="Mochizuki Chainmail +1",	hands="Otronif Gloves +1",	ring1="Rajas Ring",		ring2="Mars's Ring",
		back="Yokaze Mantle",		waist="Anguinus Belt",		legs="Hachiya Hakama +1",	feet="Mochizuki Kyahan +1"
	}
end