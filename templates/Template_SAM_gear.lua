function init_gear_sets()
	--============================================================
	--			Precast sets
	--============================================================
	sets.precast.JA.Meditate = {}
	sets.precast.JA['Warding Circle'] = {}
	sets.precast.JA['Blade Bash'] = {}
	sets.precast.JA.Seigan = {}
	sets.precast.JA.Sekkanoki = {}
	sets.precast.JA.Sengikori = {}

	sets.precast.FC = {
		main="",	sub="",		range="",	ammo="",
		head="",	neck="",	ear1="",	ear2="",
		body="",	hands="",	ring1="",	ring2="",
		back="",	waist="",	legs="",	feet=""
	}
	
	sets.precast.Waltz = {}
	sets.precast.Waltz['Healing Waltz'] = {}
	
	sets.precast.Ranged = {}
	
	--============================================================
	--sets.wsBase[magic][sam/other][state.OffenseMode][state.RangedMode][wsmod[spell.en]]
	sets.wsBase = {}

	sets.wsBase['4-Hit'] = {}
	
	sets.wsBase['5-Acc'] = {}
	
	sets.wsBase.magic = {}
	
	sets.wsBase['Apex Arrow'] = {}
	
	--============================================================
	--			Midcast sets
	--============================================================

	sets.midcast.FastRecast = {}
	
	--============================================================
	--			Other sets
	--============================================================
	
	sets.resting = {}
	
	sets.idle = {}
	sets.idle.Reraise = {}
	sets.idle.with_buff = {}
	sets.idle.with_buff['doom'] = {}
	sets.idle.with_buff['reive mark'] = {}
	
	sets.defense.DT = {}
	
	sets.defense.PDT = combineSets(sets.defense.DT, {})
	sets.defense.MDT = combineSets(sets.defense.DT, {})

	sets.defense.Reraise = {}

	sets.Reraise = {}

	--============================================================
	
	sets.engaged.with_buff = {}
	sets.engaged.with_buff['doom'] = {}
	sets.engaged.with_buff['Hasso'] = {}
	sets.engaged.with_buff['reive mark'] = {}
	
	sets.engaged['5-Hit'] = {}
	
	sets.engaged['5-Acc'] = {}
	
	sets.engaged['4-Hit'] = {}
	
	sets.buffs['Meikyou Shisui'] = {}
end