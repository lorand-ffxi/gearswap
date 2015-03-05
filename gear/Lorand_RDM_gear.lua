-----------------------------------------------------------------------------------------------------------
--[[
	Author: Ragnarok.Lorand
	
	Slips:
		2:	Loq. Earring
		3: 	Twilight Torque, Impact body
		8:	Estoqueuer's Back
		10:	Estoqueur's+2 (all)
		14:	Nares Hands/Legs
		15: Atrophy Hat/Body/Legs
		17:	Vitivation Hat/Body/Hands
--]]
-----------------------------------------------------------------------------------------------------------

function init_gear_sets()
	--============================================================
	--					Precast sets
	--============================================================
	sets.precast.JA['Chainspell'] = {body="Vitivation Tabard"}
	sets.precast.JA['Saboteur'] = {hands="Estoqueur's Gantherots +2"}
	
	sets.precast.Waltz = {}
	sets.precast.Waltz['Healing Waltz'] = {}
	
	-- Fast Cast caps at 80%
	sets.precast.FC = {					--???
		head="Atrophy Chapeau",			--?10%
		neck="Orunmila's Torque",		--5%
		ear1="Loquacious Earring",		--2%
		body="Vitivation Tabard",		--12%
		hands="Gendewitha Gages +1",	--7%
		ring1="Prolix Ring",			--2%
		ring2="Veneficium Ring",		--Q+1%
		back="Swith Cape",				--3%
		waist="Witful Belt",			--3%
		legs="Artsieq Hose",			--5%
		feet="Chelona Boots"			--4%
	}
	sets.precast.FC.HealingMagic = {
		main="Tamaxchi",	sub="Genbu's Shield",
		back="Pahtli Cape"
	}
	sets.precast.FC.EnhancingMagic = {waist="Siegel Sash"}
	sets.precast.FC.Lightning = {main="Apamajas I"}
	
	--============================================================
	
	sets.wsBase = {}
	sets.wsBase.Magic = {}
	
	--============================================================
	--					Midcast sets
	--============================================================
	
	sets.midcast.FastRecast = {
		ammo="Impatiens",
		head="Nahtirah Hat",		neck="Orunmila's Torque",		ear1="Loquacious Earring",
		body="Vitivation Tabard",	hands="Gendewitha Gages +1",	ring1="Prolix Ring",		ring2="Diamond Ring",
		back="Swith Cape",			waist="Cetl Belt",				legs="Artsieq Hose",		feet="Hagondes Sabots +1"
	}

	sets.midcast.Cure = {
		main="Tamaxchi",				sub="Genbu's Shield",
		ear2="Roundel Earring",	
		hands="Weatherspoon Cuffs +1",	ring2="Aquasoul Ring",
		legs="Atrophy Tights"
	}
	sets.midcast.Cure.with_buff = {}
	sets.midcast.Cure.with_buff['reive mark'] = {neck="Arciela's Grace +1"}
	
	sets.midcast.Curaga = sets.midcast.Cure
	sets.midcast.Cure.Engaged = {
		body="Gendewitha Bliaut +1",	hands="Bokwus Cuffs"
	}
	
	sets.midcast.Cursna = {
		hands="Hieros Mittens",
	}
	
	sets.midcast.EnhancingMagic = {
		body="Vitivation Tabard",	hands="Vitivation Gloves",
		back="Estoqueur's Cape",	waist="Cascade Belt",		legs="Atrophy Tights",	feet="Estoqueur's Houseaux +2"
	}
	sets.midcast.EnhancingMagic.Duration = {
		--hands="Atrophy Gloves",
		back="Estoqueur's Cape",	feet="Estoqueur's Houseaux +2"
	}
	sets.midcast.EnhancingMagic.Duration.ComposureOther = {
		head="Estoqueur's Chappel +2",
		body="Estoqueur's Sayon +2",
		legs="Estoqueur's Fuseau +2"
	}
	
	sets.midcast['Aquaveil'] =		{waist="Emphatikos Rope"}
	sets.midcast['Phalanx II'] =	{hands="Vitivation Gloves"}
	sets.midcast['Refresh'] =		{legs="Estoqueur's Fuseau +2"}
	sets.midcast['Stoneskin'] =		{
		neck="Stone Gorget",	ear2="Earthcry Earring",
		waist="Siegel Sash",	legs="Haven Hose"
	}
	
	--============================================================
	
	sets.midcast.MagicAccuracy = {
		main="Lehbrailg +2",	sub="Mephitis Grip",		ammo="Kalboron Stone",
		head="Nahtirah Hat",	neck="Eddy Necklace",		ear1="Lifestorm Earring",	ear2="Psystorm Earring",
		body="Artsieq Jubbah",	hands="Hagondes Cuffs +1",	ring1="Sangoma Ring",		ring2="Perception Ring",
		back="Ogapepo Cape",	waist="Ovate Rope",			legs="Artsieq Hose",		feet="Artsieq Boots"
	}
	
	sets.midcast.EnfeeblingMagic = {
		head="Vitivation Chapeau",	neck="Enfeebling Torque",
		body="Atrophy Tabard",		hands="Lurid Mitts"
	}
	sets.midcast.EnfeeblingMagic.Saboteur = {hands="Estoqueur's Gantherots +2"}
	
	sets.midcast.EnfeeblingMagic.Potency = {
		neck="Estoqueur's Collar",
		body="Estoqueur's Sayon +2",
		feet="Uk'uxkaj Boots"
	}
	sets.midcast.EnfeeblingMagic.Potency.Resistant = {}
	sets.midcast.EnfeeblingMagic.Potency.Normal = {}
	
	sets.midcast['Dia III'] = {head="Vitivation Chapeau"}
	sets.midcast['Slow II'] = {head="Vitivation Chapeau"}

	--============================================================
	
	sets.midcast.ElementalMagic = {
		main="Venabulum",			sub="Zuuxowu Grip",		ammo="Dosis Tathlum",
		head="Buremte Hat",			neck="Eddy Necklace",	ear1="Hecate's Earring",	ear2="Friomisi Earring",
		body="Hagondes Coat +1",	hands="Otomi Gloves",	ring1="Fenrir Ring +1",		ring2="Acumen Ring",
		back="Toro Cape",			waist="Aswang Sash",	legs="Hagondes Pants +1",	feet="Hagondes Sabots +1"
	}
	sets.midcast.ElementalMagic.LowTier = {}
	sets.midcast.ElementalMagic.HighTier = {}
	sets.midcast.ElementalMagic.Earth = {neck="Quanpur Necklace"}
	
	sets.midcast.ElementalEnfeeble = {
		main="Venabulum",			sub="Mephitis Grip",
		head="Kaabnax Hat",			ear1="Lifestorm Earring",	ear2="Psystorm Earring",
		body="Hagondes Coat +1",	hands="Lurid Mitts",		ring1="Icesoul Ring",		ring2="Diamond Ring",
		back="Toro Cape",			legs="Hagondes Pants +1",	feet="Hagondes Sabots +1"
	}

	sets.midcast.DarkMagic = {
		neck="Dark Torque"
	}
	sets.midcast.Stun = {
		main="Apamajas II",				sub="Mephitis Grip",		ammo="Kalboron Stone",
		head="Atrophy Chapeau +1",		neck="Orunmila's Torque",	ear1="Lifestorm Earring",	ear2="Psystorm Earring",
		body="Vitivation Tabard +1",	hands="Buremte Gloves",		ring1="Perception Ring",
		back="Ogapepo Cape",			waist="Cetl Belt",			legs="Artsieq Hose",		feet="Artsieq Boots"
	}
	
	sets.midcast.DivineMagic = {}
	sets.midcast.DivineMagic.Nuke = {}
	sets.midcast.DivineMagic.Nuke.with_buff = {}
	sets.midcast.DivineMagic.Nuke.with_buff['reive mark'] = {neck="Arciela's Grace +1"}
	
	--============================================================
	--					Other sets
	--============================================================
	
	sets.resting = {
		legs="Nares Trews",
	}
	
	sets.idle = {
		main="Bolelabunga",		sub="Genbu's Shield",					ammo="Demonry Stone",
		head="Vitivation Chapeau",	neck="Twilight Torque",	ear1="Brachyura Earring",	ear2="Ethereal Earring",
		body="Artsieq Jubbah",		hands="Lurid Mitts",	ring1="Defending Ring",		ring2="Shneddick Ring",
		back="Cheviot Cape",		waist="Flume Belt",	legs="Nares Trews",		feet="Serpentes Sabots"
	}
	sets.idle.with_buff = {}
	sets.idle.with_buff['doom'] = {ring1="Saida Ring", ring2="Saida Ring"}
	sets.idle.lowMP = {legs="Nares Trews"}
	sets.idle.lowMP_night =	{hands="Serpentes Cuffs"}
	sets.idle.lowMP_day = {feet="Serpentes Sabots"}
	
	sets.defense.PDT = {}
	sets.defense.MDT = {}

	sets.engaged = {}
	sets.engaged.with_buff = {}
	sets.engaged.with_buff['doom'] = {ring1="Saida Ring", ring2="Saida Ring"}
	sets.engaged.with_buff['reive mark'] = {neck="Ygnas's Resolve +1"}
end