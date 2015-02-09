function init_gear_sets()
	--============================================================
	--			Precast sets
	--============================================================
	sets.precast.JA['Spirit Link'] = {}
	sets.precast.JA.Jump = {}	
	sets.precast.JA['High Jump'] = combineSets(sets.precast.JA.Jump, {})
	sets.precast.JA['Super Jump'] = combineSets(sets.precast.JA.Jump, {})
	sets.precast.JA['Spirit Jump'] = combineSets(sets.precast.JA.Jump, {})
	sets.precast.JA['Soul Jump'] = combineSets(sets.precast.JA.Jump, {})
	
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
	
	sets.wsBase.magic = {}
	
	--============================================================
	--			Midcast sets
	--============================================================

	sets.midcast.FastRecast = {}
	
	sets.midcast.Cure = {}
	sets.midcast.Cure.with_buff = {}
	sets.midcast.Cure.with_buff['reive mark'] = {}
	
	--============================================================
	--			Other sets
	--============================================================
	
	sets.engaged = {}
	
	sets.engaged.with_buff = {}
	sets.engaged.with_buff['doom'] = {}
	sets.engaged.with_buff['reive mark'] = {}

	--============================================================
	
	sets.resting = {}
	
	sets.idle = {}
	sets.idle.with_buff = {}
	sets.idle.with_buff['doom'] = {}
	sets.idle.with_buff['reive mark'] = {}
	
	sets.defense.DT = {}
	
	sets.defense.PDT = set_combine(sets.defense.DT, {})
	sets.defense.MDT = set_combine(sets.defense.DT, {})
end