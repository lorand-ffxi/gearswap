function init_gear_sets()
	gear.Gun = "Hgafircian +2"
	gear['Gun_ammo'] = "Adlivun Bullet"
	gear['Gun_ammo_RA'] = "Adlivun Bullet"
	gear['Gun_ammo_WS'] = "Adlivun Bullet"
	gear.QDbullet = "Animikii Bullet"
	
	sets.precast.JA['Triple Shot'] = {}
	sets.precast.JA['Random Deal'] = {}

	sets.precast.CorsairRoll = {}
	sets.precast.CorsairRoll["Caster's Roll"] = set_combine(sets.precast.CorsairRoll, {})
	sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {})
	sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {})
	sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {})
	sets.precast.CorsairRoll["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {})
	
	sets.precast.FC = {
		main="",	sub="",		range="",	ammo="",
		head="",	neck="",	ear1="",	ear2="",
		body="",	hands="",	ring1="",	ring2="",
		back="",	waist="",	legs="",	feet=""
	}
	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})

	--============================================================

	sets.precast.ranged = {}
	
	--============================================================
	--			TP & WS sets
	--============================================================
	
	sets.wsBase = {}
	
	sets.wsBase.STR = {}
	sets.wsBase.AGI = {}
	sets.wsBase.DEX = {}
	sets.wsBase.STRAGI = {}
	
	sets.tpBase = {}
	
	
	-- Midcast Sets
	sets.midcast.FastRecast = {}
		
	-- Specific spells
	sets.midcast.Utsusemi = sets.midcast.FastRecast

	sets.midcast.CorsairShot = {}

	--========================[Gun]===============================
	sets.Gun = {}
	sets.Gun.other = {}
	
	--============================================================

	sets.midcast.FastRecast = {}
	sets.midcast.Utsusemi = sets.midcast.FastRecast
	
	sets.midcast.Cure = {}
	sets.midcast.Cure.with_buff = {}
	sets.midcast.Cure.with_buff['reive mark'] = {}
	
	--============================================================
	--			Other sets
	--============================================================
	sets.resting = {}
	
	sets.idle = {}
	sets.idle.with_buff = {}
	sets.idle.with_buff['doom'] = {}
	sets.idle.with_buff['reive mark'] = {}
	
	sets.defense.DT = {}
	sets.defense.PDT = set_combine(sets.defense.Evasion, sets.defense.DT, {})
	sets.defense.MDT = set_combine(sets.defense.Evasion, sets.defense.DT, {})
	
	sets.Kiting = {}
	
	sets.engaged = {}
	sets.engaged.with_buff = {}
	sets.engaged.with_buff['doom'] = {}
	sets.engaged.with_buff['reive mark'] = {}
	
	sets.Melee = {}
	sets.Melee.tp = sets.engaged
end