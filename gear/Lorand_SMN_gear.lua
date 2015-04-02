--------------------------------------------------------------------------------
--[[
	Author: Ragnarok.Lorand
--]]
--------------------------------------------------------------------------------

function init_gear_sets()
	--============================================================
	--			Precast sets
	--============================================================
	sets.precast.FC = {			--54%
		head="Nahtirah Hat",		--10%
		neck="Orunmila's Torque",	--5%
		ear1="Loquacious Earring",	--2%
		body="Marduk's Jubbah +1",	--11%
		hands="Repartie Gloves",	--4%
		ring1="Prolix Ring",		--2%
		back="Swith Cape",		--3%
		waist="Witful Belt",		--3%
		legs="Artsieq Hose",		--5%
		feet="Chelona Boots"		--4%
	}
	
	sets.precast.FC.SummoningMagic = {ammo="Eminent Sachet"}
	
	sets.precast.FC.EnhancingMagic = {	--59%
		waist="Siegel Sash"		--8%
	}
	
	sets.precast.FC.Cure = {		--59%
		main="Tamaxchi",		--0%
		sub="Genbu's Shield",		--8%
		back="Pahtli Cape",		--8%
	}
	
	sets.precast.FC.Lightning = {main="Apamajas I"}
	
	--============================================================
	
	sets.precast.JA['Astral Flow'] = {}
	sets.precast.JA['Elemental Siphon'] = {
		main="Soulscourge",		sub="Elder's Grip",						ammo="Kalboron Stone",
		head="Convoker's Horn",		neck="Caller's Pendant",	ear1="Loquacious Earring",	ear2="Caller's Earring",
		body="Caller's Doublet +2",	hands="Glyphic Bracers",	ring1="Evoker's Ring",		ring2="Sangoma Ring",
		back="Conveyance Cape",		waist="Emphatikos Rope",	legs="Marduk's Shalwar +1",	feet="Caller's Pigaches +2"
	}
	sets.precast.JA['Mana Cede'] = {hands="Caller's Bracers +2"}
	sets.precast.JA["Avatar's Favor"] = {head="Caller's Horn +2"}

	sets.precast.Waltz = {}
	
	--============================================================
	
	sets.wsBase = {}
	
	sets.wsBase.Magic = {}
	
	--============================================================
	--			Midcast sets
	--============================================================
	
	sets.midcast.FastRecast = {}
	
	sets.midcast.MagicAccuracy = {}
	
	--======================== Pet ===============================
	
	sets.midcast.pet.BP = {
		main="Uffrat +2",		sub="Achaq Grip",		ammo="Eminent Sachet",
		head="Convoker's Horn",		neck="Caller's Pendant",	ear2="Caller's Earring",
		body="Convoker's Doublet",	hands="Glyphic Bracers",	ring1="Evoker's Ring",
		back="Conveyance Cape",		waist="Mujin Obi",		legs="Marduk's Shalwar +1",	feet="Convoker's Pigaches"
	}
	sets.midcast.pet.BP.Ward = {}
	sets.midcast.pet.BP.Ward.Buff = {}
	sets.midcast.pet.BP.Ward.Debuff = {
		main="Eminent Pole",
		head="Bokwus Circlet",
		hands="Regimen Mittens",
		feet="Caller's Pigaches +2"
	}
	sets.midcast.pet.BP.Rage = {}
	sets.midcast.pet.BP.Rage.Physical = {
		main="Uffrat +2",
		legs="Caller's Spats +2",
	}
	sets.midcast.pet.BP.Rage.Magical = {
		main="Eminent Pole",
		head="Bokwus Circlet",
		hands="Regimen Mittens",
		feet="Hagondes Sabots +1"
	}
	sets.midcast.pet['White Magic'] = {}
	sets.midcast.pet['Elemental Magic'] = {}

	--====================== Healing =============================
	
	sets.midcast.HealingMagic = {}
	
	sets.midcast.Cure = {
		
	}
	sets.midcast.Curaga = sets.midcast.Cure

	sets.midcast.Cursna = {hands="Hieros Mittens"}

	--====================== Enhancing ===========================
	
	sets.midcast.EnhancingMagic = {
		neck="Colossus's Torque",
		body="Manasa Chasuble",
		waist="Cascade Belt",
	}
	
	sets.midcast.Stoneskin = {
		neck="Stone Gorget",	ear1="Lifestorm Earring",	ear2="Earthcry Earring",
		ring2="Aquasoul Ring",
		back="Tuilha Cape",	waist="Siegel Sash",		legs="Haven Hose"
	}
	sets.midcast.Aquaveil = {waist="Emphatikos Rope"}

	sets.midcast.BarElement = {}

	sets.midcast.Regen = {}
	
	--====================== Offensive ===========================	
	
	sets.midcast.DivineMagic = {}
	sets.midcast.DivineMagic.Nuke = {}
	
	sets.midcast.DarkMagic = {}

	sets.midcast.EnfeeblingMagic = {}
	sets.midcast.EnfeeblingMagic.Potency = {}
	sets.midcast.EnfeeblingMagic.Potency.Resistant = {}
	
	sets.midcast.ElementalMagic = {}
	sets.midcast.ElementalEnfeeble = {}
	
	--============================================================
	--			Other sets
	--============================================================
	
	sets.resting = {
		main="Chatoyant Staff",		sub="Elder's Grip",						ammo="Clarus Stone",
		head="Nahtirah Hat",		neck="Eidolon Pendant",		ear1="Loquacious Earring",	ear2="Relaxing Earring",
		body="Artsieq Jubbah",		hands="Nares Cuffs",		ring1="Fenrir Ring +1",		ring2="Sangoma Ring",
		back="Felicitas Cape",		waist="Emphatikos Rope",	legs="Nares Trews",		feet="Chelona Boots"
	}

	sets.idle = {
		main="Terra's Staff",	sub="Elder's Grip",						ammo="Kalboron Stone",
		head="Convoker's Horn",	neck="Twilight Torque",		ear1="Brachyura Earring",	ear2="Ethereal Earring",
		body="Artsieq Jubbah",	hands="Hagondes Cuffs +1",	ring1="Defending Ring",		ring2="Shneddick Ring",
		back="Repulse Mantle",	waist="Emphatikos Rope",	legs="Artsieq Hose",		feet="Hagondes Sabots +1"
	}
	sets.idle.lowMP = {
		legs="Nares Trews"
	}
	sets.idle.lowMP_night =	{hands="Serpentes Cuffs"}
	sets.idle.lowMP_day = {feet="Serpentes Sabots"}
	
	--[[
		Spirit = 7
		Carbuncle/Cait Sith = 11	-> 7
		Fenrir = 13			-> 9
		Avatar = 15			-> 11
		Avatar's Favor = -4
	--]]
	sets.idle.with_pet = {
		neck="Caller's Pendant",
		hands="Regimen Mittens",
		waist="Mujin Obi",		legs="Convoker's Spats",
	}
	sets.idle.with_pet.perp7 = {		--p-8
		hands="Hagondes Cuffs",		--p-5
		feet="Artsieq Boots"		--p-3
	}
	sets.idle.with_pet.perp9 = {		--p-9
		hands="Hagondes Cuffs",		--p-5
		feet="Convoker's Pigaches"	--p-4
	}
	sets.idle.with_pet.perp11 = {		--p-13
		body="Caller's Doublet +2",	--p-4
		hands="Hagondes Cuffs",		--p-5
		feet="Convoker's Pigaches"	--p-4
	}
	sets.idle.with_pet.perp13 = {		--p-13
		body="Caller's Doublet +2",	--p-4
		hands="Hagondes Cuffs",		--p-5
		feet="Convoker's Pigaches"	--p-4
	}
	sets.idle.with_pet.perp15 = {		--p-14, r+1
		body="Caller's Doublet +2",	--p-4
		hands="Hagondes Cuffs",		--p-5
		ring1="Evoker's Ring",		--p-1
		legs="Nares Trews",		--r+1
		feet="Convoker's Pigaches"	--p-4
	}
	sets.idle.with_pet.Spirit = sets.idle.with_pet.perp7
	sets.idle.with_pet.Avatar = sets.idle.with_pet.perp15
	sets.idle.with_favor = {head="Caller's Horn +2"}
	
	sets.idle.with_buff = {}
	sets.idle.with_buff['doom'] = {ring1="Saida Ring", ring2="Saida Ring"}
	
	sets.defense.DT = {
		head="Kaabnax Hat",	neck="Twilight Torque",
		ring1="Defending Ring",	ring2="Dark Ring",
	}
	sets.defense.PDT = combineSets(sets.defense.DT, {
	})
	sets.defense.MDT = combineSets(sets.defense.DT, {
	})
	
	sets.engaged = {
		main="Scepter Staff",	sub="Pole Grip",						ammo="Jukukik Feather",
		head="Telchine Cap",	neck="Asperity Necklace",	ear1="Bladeborn Earring",	ear2="Steelflash Earring",
		body="Helios Jacket",	hands="Telchine Gloves",	ring1="Rajas Ring",		ring2="K'ayres Ring",
		back="Kayapa Cape",	waist="Goading Belt",		legs="Telchine Braconi",	feet="Telchine Pigaches"
	}
	sets.engaged.with_buff = {}
	sets.engaged.with_buff['doom'] = {ring1="Saida Ring", ring2="Saida Ring"}
end