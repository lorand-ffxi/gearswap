function init_gear_sets()
	--============================================================
	--			Precast sets
	--============================================================
	sets.TreasureHunter = {}
	
	sets.precast.JA['Collaborator'] = {}
	sets.precast.JA['Accomplice'] = {}
	sets.precast.JA['Flee'] = {}
	sets.precast.JA['Hide'] = {}
	sets.precast.JA['Conspirator'] = {}
	sets.precast.JA['Steal'] = {}
	sets.precast.JA['Despoil'] = {}
	sets.precast.JA['Perfect Dodge'] = {}
	sets.precast.JA['Feint'] = {}
	sets.precast.JA["Assassin's Charge"] = {}

	sets.precast.JA['Sneak Attack'] = {}

	sets.precast.JA['Trick Attack'] = {}

	sets.precast.Waltz = {}
	sets.precast.Waltz['Healing Waltz'] = {}
	
	--============================================================
	
	sets.precast.FC = {
		main="",	sub="",		range="",	ammo="",
		head="",	neck="",	ear1="",	ear2="",
		body="",	hands="",	ring1="",	ring2="",
		back="",	waist="",	legs="",	feet=""
	}
	sets.precast.FC.Utsusemi = {}

	--============================================================
	
	--Snapshot
	sets.precast.ranged = {}

	sets.wsBase = {}
	
	sets.wsBase.DEX = {}
	
	sets.wsBase.Acc = {}

	sets.wsBase.Magic = {}
	
	--============================================================
	--			Midcast sets
	--============================================================
	
	sets.midcast.FastRecast = {}
	sets.midcast.Utsusemi = {}

	sets.midcast.ranged = {}
	sets.midcast.ranged.TH = sets.TreasureHunter
	
	--============================================================
	--			Other sets
	--============================================================
	
	sets.resting = {}
	
	sets.idle = {}
	sets.idle.with_buff = {}
	sets.idle.with_buff['doom'] = {}
	sets.idle.with_buff['reive mark'] = {}
	
	sets.defense.Evasion = {}

	sets.defense.DT = {}
	
	sets.defense.PDT = combineSets(sets.defense.Evasion, sets.defense.DT, {})

	sets.defense.MDT = combineSets(sets.defense.Evasion, sets.defense.DT, {})
	
	sets.engaged = {}
	sets.engaged.with_buff = {}
	sets.engaged.with_buff['doom'] = {}
	sets.engaged.with_buff['reive mark'] = {}
	
	sets.engaged.Acc = {}
	
	sets.engaged.TH = {}
end