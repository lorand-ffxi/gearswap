function init_gear_sets()
	gear.Gun = "Hgafircian +2"
	gear['Gun_ammo'] = "Achiyalabopa Bullet"
	gear['Gun_ammo_RA'] = "Achiyalabopa Bullet"
	gear['Gun_ammo_WS'] = "Achiyalabopa Bullet"
	gear.Bow = "Phaosphaelia"
	gear['Bow_ammo'] = "Achiyalabopa Arrow"
	gear['Bow_ammo_WS'] = "Achiyalabopa Arrow"
	gear['Bow_ammo_RA'] = "Achiyalabopa Arrow"
	gear.Accuracy = "Bocluamni +2"
	gear['Accuracy_ammo'] = "Eminent Arrow"
	gear['Accuracy_ammo_WS'] = "Eminent Arrow"
	gear['Accuracy_ammo_RA'] = "Eminent Arrow"
	--============================================================
	--			Precast sets
	--============================================================
	sets.precast.JA['Double Shot'] =	{}
	sets.precast.JA['Camouflage'] =		{}
	sets.precast.JA['Velocity Shot'] =	{}
	sets.precast.JA['Flashy Shot'] =	{}
	sets.precast.JA['Barrage'] =		{}
	sets.precast.JA['Shadowbind'] =		{}
	sets.precast.JA['Bounty Shot'] =	{}
	sets.precast.JA['Eagle Eye Shot'] =	{}
	sets.precast.JA['Sharpshot'] =		{}
	sets.precast.JA['Scavenge'] =		{}
	sets.precast.JA['Unlimited Shot'] =	{}
	
	sets.precast.Waltz = {}
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.precast.FC = {
		main="",	sub="",		range="",	ammo="",
		head="",	neck="",	ear1="",	ear2="",
		body="",	hands="",	ring1="",	ring2="",
		back="",	waist="",	legs="",	feet=""
	}
	sets.precast.FC.Utsusemi = {}

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
	
	--========================[Bow]===============================
	sets.Bow = {}
	sets.Bow.sam = {}
	sets.Bow.other = {}
	
	--5-hit dependent upon 2 recycle procs
	sets.Bow.sam['r5-hit'] = {}
	sets.Bow.sam['r5-hit'].tp = {}

	--5-hit with no requirements
	sets.Bow.sam['5-hit'] = {}
	sets.Bow.sam['5-hit'].tp = {}
	
	--5-hit with more attack
	sets.Bow.sam['a5-hit'] = {}
	sets.Bow.sam['a5-hit'].tp = {}
	
	--4-hit dependent upon 1 recycle proc
	sets.Bow.sam['r4-hit'] = {}
	sets.Bow.sam['r4-hit'].tp = {}
	
	--5-hit dependent upon 2 recycle procs
	sets.Bow.other['r5-hit'] = {}

	--5-hit with no requirements
	sets.Bow.other['5-hit'] = {}
	sets.Bow.other['5-hit'].tp = {}
	
	--Cibitshavore 5-hit dependent upon 1 recycle proc
	sets.Bow.other['c:5-hit(1r)'] = {}
	sets.Bow.other['c:5-hit(1r)'].tp = {}
	
	--Cibitshavore 5-hit with no requirements
	sets.Bow.other['c:5-hit(0r)'] = {}
	sets.Bow.other['c:5-hit(0r)'].tp = {}
	
	sets.Bow.other.acc = {}
	sets.Bow.other.acc.tp = {}
	
	--========================[Gun]===============================
	sets.Gun = {}
	sets.Gun.sam = {}
	sets.Gun.other = {}
	
	--5-hit with subjob SAM
	sets.Gun.sam['5-hit'] = {}
	
	--5-hit with subjob SAM; more attack
	sets.Gun.sam['a5-hit'] = {}
	sets.Gun.sam['a5-hit'].tp = {}
	
	--4-hit with subjob SAM
	sets.Gun.sam['4-hit'] = {}
	sets.Gun.sam['4-hit'].tp = {}
	
	--5-hit with subjob other than SAM
	sets.Gun.other['5-hit'] = {}
	sets.Gun.other['5-hit'].tp = {}
	
	sets.Gun.other['acc'] = {}
	sets.Gun.other['acc'].tp = {}
	
	sets.Melee = {}
	sets.Melee.sam = {}
	sets.Melee.other = {}
	
	--============================================================

	sets.midcast.FastRecast = {}
	
	--============================================================
	
	sets.ranged = {}
	
	sets.ranged.maxAcc = {}
	
	sets.ranged.maxAcc.Gun = {}
	sets.ranged.maxAcc.Bow = {}
	
	sets.ranged.barrage = set_combine(sets.ranged.maxAcc, {})
	
	
	sets.Accuracy = {}
	sets.Accuracy.sam = {}
	sets.Accuracy.other = {}
	sets.Accuracy.sam.Accuracy = {}
	sets.Accuracy.other.Accuracy = {}
	
	--============================================================
	--			Other sets
	--============================================================
	sets.resting = {}
	
	sets.idle = {}
	sets.idle.with_buff = {}
	sets.idle.with_buff['reive mark'] = {}
	
	sets.defense.DT = {}
	sets.defense.PDT = set_combine(sets.defense.Evasion, sets.defense.DT, {})
	sets.defense.MDT = set_combine(sets.defense.Evasion, sets.defense.DT, {})
	
	sets.engaged = {}
	sets.engaged.with_buff = {}
	sets.engaged.with_buff['reive mark'] = {}
	sets.Melee = {}
	sets.Melee.tp = sets.engaged
end