function init_gear_sets()
	sets.Enmity = {}
	--============================================================
	--			Precast sets
	--============================================================
	sets.precast.JA = sets.Enmity
	sets.precast.JA['Invincible'] = {}
	sets.precast.JA['Holy Circle'] = {}
	sets.precast.JA['Shield Bash'] = {}
	sets.precast.JA['Sentinel'] = {}
	sets.precast.JA['Rampart'] = {}
	sets.precast.JA['Fealty'] = {}
	sets.precast.JA['Divine Emblem'] = {}
	sets.precast.JA['Chivalry'] = {}
	
	sets.precast.Waltz = {}
	sets.precast.Waltz['Healing Waltz'] = {}

	--============================================================
	
	sets.precast.FC = {
		main="",	sub="",		range="",	ammo="",
		head="",	neck="",	ear1="",	ear2="",
		body="",	hands="",	ring1="",	ring2="",
		back="",	waist="",	legs="",	feet=""
	}
	sets.precast.FC.EnhancingMagic = {}
		
	--============================================================
       
	sets.wsBase = {}
	
	sets.wsBase.DEX = {}
	sets.wsBase.STR = {}

	sets.wsBase.magic = {}
	
	--============================================================
	--			Midcast sets
	--============================================================
	sets.midcast.Enmity = sets.Enmity
	
	sets.midcast.FastRecast = {}
	
	sets.midcast.MagicAccuracy = {}
	
	sets.midcast.DivineMagic = {}
	
	sets.midcast.Cure = {}
	
	sets.midcast.Cure.Self = {}
	sets.midcast.Cure.with_buff = {}
	
	sets.midcast.EnhancingMagic = {}
	sets.midcast.Protect = {}
	sets.midcast.Shell = {}

	--============================================================
	--			Other sets
	--============================================================
		
	sets.Reraise = {}
	
	sets.resting = {}
	
	sets.idle = {}
	sets.idle.Showoff = {}
	sets.idle.with_buff = {}
	sets.idle.with_buff['doom'] = {}
	sets.idle.with_buff['reive mark'] = {}
	
	sets.idle.PDT = {}
	
	sets.idle.MDT = {}
	
	sets.defense.DT = {}
	
	sets.defense.PDT = {}

	sets.defense.MDT = {}
	
	sets.engaged = {}
	
	sets.engaged.with_buff = {}
	sets.engaged.with_buff['doom'] = {}
	sets.engaged.with_buff['reive mark'] = {}
	
	sets.engaged.TankP = {}
	
	sets.engaged.TankM = {}
	
	sets.engaged.TankMix = {}
	
	sets.engaged.Shield = {}
	
	sets.buffs.doom = {}
	sets.buffs.Cover = {}
end