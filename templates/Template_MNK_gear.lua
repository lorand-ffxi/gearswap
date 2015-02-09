function init_gear_sets()
	--============================================================
	--			Precast sets
	--============================================================
	sets.precast.JA['Hundred Fists'] = {}
	sets.precast.JA['Boost'] = {}
	sets.precast.JA['Dodge'] = {}
	sets.precast.JA['Focus'] = {}
	sets.precast.JA['Counterstance'] = {}
	sets.precast.JA['Footwork'] = {}
	sets.precast.JA['Formless Strikes'] = {}
	sets.precast.JA['Mantra'] = {}
	sets.precast.JA['Impetus'] = {}
	sets.precast.JA['Invigorate'] = {}
	
	sets.precast.JA['Chi Blast'] = {}
	sets.precast.JA['Chakra'] = {}

	sets.precast.Waltz = {}
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.precast.Step = {}
	
	--============================================================
	
	-- Fast cast sets for spells
	sets.precast.FC = {
		main="",	sub="",		range="",	ammo="",
		head="",	neck="",	ear1="",	ear2="",
		body="",	hands="",	ring1="",	ring2="",
		back="",	waist="",	legs="",	feet=""
	}
	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})
	
	--============================================================
	
	sets.wsBase = {}
	sets.wsBase.Acc = {}

	sets.wsBase.Magic = {}
	
	--============================================================
	--			Midcast sets
	--============================================================
	
	sets.midcast.FastRecast = set_combine(sets.precast.FC, {})

	--============================================================
	--			Other sets
	--============================================================
	
	sets.buffs['doom'] = {}
	
	sets.idle = {}
	sets.idle.with_buff = {}
	sets.idle.with_buff['doom'] = {}
	sets.idle.with_buff['reive mark'] = {}
	
	sets.resting = sets.idle
	
	sets.defense.DT = {}
	sets.defense.PDT = set_combine(sets.defense.DT, {})
	sets.defense.MDT = set_combine(sets.defense.DT, {})
	
	sets.defense.HP = sets.defense.PDT

	--============================================================
	
	sets.engaged.with_buff['doom'] = {}
	sets.engaged.with_buff['reive mark'] = {}
	
	sets.engaged.HitYouBastard = {}
	
	sets.engaged.Normal_A = {}
	
	sets.engaged.Normal_B = {}
	
	sets.engaged.Normal_C = {}

	sets.engaged.Tank = {}
	
	sets.engaged.TankAcc = {}
	
	sets.engaged.HitMoar = {}
	
	sets.engaged.Mix = {}
end