-----------------------------------------------------------------------------------------------------------
--[[
	Author: Ragnarok.Lorand
	
	Slips:
		2:	Blood Legs, Loq. Earring
		3: 	Twilight Torque/Cape
		6:	Hands
		8:	Neck/Back
		10:	Legs/Hands/Feet
		15: Hat/Body/Legs
--]]
-----------------------------------------------------------------------------------------------------------

function init_gear_sets()
	--============================================================
	--					Precast sets
	--============================================================
	sets.precast.JA['Chainspell'] = {body="Duelist's Tabard +2"}
	
	sets.precast.Waltz = {}
	sets.precast.Waltz['Healing Waltz'] = {}
	
	-- Fast Cast caps at 80%
	sets.precast.FC = {					--30% + v
		head="Nares Cap",				--10%
		neck="Orunmila's Torque",		--5%
		ear1="Loquacious Earring",		--2%
		hands="Gendewitha Gages +1",	--7%
		ring1="Prolix Ring",			--2%
		ring2="Veneficium Ring",		--Q+1%
		back="Swith Cape",				--3%
		waist="Witful Belt",			--3%
		legs="Artsieq Hose",			--5%
		feet="Chelona Boots"			--4%
	}

	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
	
	--============================================================
	
	sets.wsBase = {}

	
	--============================================================
	--					Midcast sets
	--============================================================
	
	sets.midcast.FastRecast = {
		neck="Orunmila's Torque",
	}

	sets.midcast.Cure = {
		main="Arka IV",
		head="Gendewitha Caubeen +1",	ear1="Roundel Earring",			ear2="Novia Earring",
		body="Gendewitha Bliaut",		hands="Weatherspoon Cuffs +1",	ring1="Sirona's Ring",	ring2="Solemn Ring",
		back="Oretania's Cape",			waist="Emphatikos Rope",		legs="Atrophy Tights",	feet="Atrophy Boots"
	}
	sets.midcast.Curaga = sets.midcast.Cure

	sets.midcast.EnhancingMagic = {}

	sets.midcast.Refresh = {legs="Estoqueur's Fuseau +2"}
	sets.midcast.Stoneskin = {waist="Siegel Sash"}
	
	sets.midcast.EnfeeblingMagic = {}

	sets.midcast['Dia III'] = set_combine(sets.midcast.EnfeeblingMagic, {head="Duelist's Chapeau +2"})
	sets.midcast['Slow II'] = set_combine(sets.midcast.EnfeeblingMagic, {head="Duelist's Chapeau +2"})
	
	sets.midcast.ElementalMagic = {
		ring1="Fenrir Ring +1",		ring2="Acumen Ring",
	}

	sets.midcast.Impact = set_combine(sets.midcast.ElementalMagic, {head=empty,body="Twilight Cloak"})

	sets.midcast.DarkMagic = {}

	sets.midcast.EnhancingDuration = {hands="Atrophy Gloves +1",back="Estoqueur's Cape",feet="Estoqueur's Houseaux +2"}
		
	sets.buff.ComposureOther = {
		head="Estoqueur's Chappel +2",
		body="Estoqueur's Sayon +2",	hands="Estoqueur's Gantherots +2",
		legs="Estoqueur's Fuseau +2",	feet="Estoqueur's Houseaux +2"
	}

	sets.buff.Saboteur = {hands="Estoqueur's Gantherots +2"}
	
	--============================================================
	--					Other sets
	--============================================================
	
	sets.resting = {}
	
	sets.idle = {}
	sets.idle.speedy = {}
	sets.idle.with_buff = {}
	sets.idle.with_buff['Doom'] = {ring1="Saida Ring", ring2="Saida Ring"}
	
	sets.defense.PDT = {}
	sets.defense.MDT = {}

	sets.Kiting = {legs="Blood Cuisses"}

	sets.engaged = {}
	sets.engaged.with_buff = {}
	sets.engaged.with_buff['Doom'] = {ring1="Saida Ring", ring2="Saida Ring"}
end