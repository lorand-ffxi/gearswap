--------------------------------------------------------------------------------
--[[
	Author: Ragnarok.Lorand
--]]
--------------------------------------------------------------------------------

function init_gear_sets()
	sets.weapons.Gun = {}
	sets.weapons.Bow = {}
	--sets.weapons.XBow = {}

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

	sets.precast.FC = {}
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
	
	sets.wsBase.Magic = {}
	
	sets.tpBase = {}
	
	--========================[Bow]===============================
	sets.Bow = combineSets({},sets.weapons[modes.weapon])
	sets.Bow.sam = {}
	sets.Bow.other = {}

	--4-hit /SAM with 2 recycle procs
	sets.Bow.sam['r4-hit'] = {}
	sets.Bow.sam['r4-hit'].tp = {}

	sets.Bow.sam.acc = {}}
	sets.Bow.sam.acc.tp = {}
	
	--4-hit /??? with 2 recycle procs
	sets.Bow.other['r4-hit'] = {}
	sets.Bow.other['r4-hit'].tp = {}
	
	sets.Bow.other.acc = {}}
	sets.Bow.other.acc.tp = {}
	
	--========================[Gun]===============================
	sets.Gun = combineSets({},sets.weapons[modes.weapon])
	sets.Gun.sam = {}
	sets.Gun.other = {}
	
	--4-hit /SAM with 2 recycle procs
	sets.Gun.sam['r4-hit'] = {}
	sets.Gun.sam['r4-hit'].tp = {}

	sets.Gun.sam.acc = {}}
	sets.Gun.sam.acc.tp = {}
	
	--4-hit /??? with 2 recycle procs
	sets.Gun.other['r4-hit'] = {}
	sets.Gun.other['r4-hit'].tp = {}
	
	sets.Gun.other.acc = {}}
	sets.Gun.other.acc.tp = {}
	
	--============================================================

	sets.midcast.FastRecast = {}
	
	--============================================================
	
	sets.ranged = {}
	sets.ranged.maxAcc = {}
	
	sets.ranged.barrage = combineSets(sets.ranged.maxAcc, {})
	
	--============================================================
	--			Other sets
	--============================================================
	sets.resting = {}
	
	sets.idle = {}
	sets.idle.with_buff = {}
	sets.idle.with_buff['reive mark'] = {}
	
	sets.defense.DT = {}
	sets.defense.PDT = combineSets(sets.defense.DT, {})
	sets.defense.MDT = combineSets(sets.defense.DT, {})
	
	sets.engaged = {}
	sets.engaged.with_buff = {}
	sets.engaged.with_buff['reive mark'] = {}
end
