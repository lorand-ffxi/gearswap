--------------------------------------------------------------------------------
--[[
	Author: Ragnarok.Lorand
--]]
--------------------------------------------------------------------------------

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

	sets.precast.FC = {}
	
	sets.precast.Waltz = {}
	sets.precast.Waltz['Healing Waltz'] = {}
	
	sets.precast.Ranged = {}
	
	--============================================================
	--sets.wsBase[magic][sam/other][state.OffenseMode][state.RangedMode][wsmod[spell.en]]
	sets.wsBase = {}

	sets.wsBase['4-Hit'] = {}
	
	sets.wsBase.magic = {}
	
	sets.wsBase['Apex Arrow'] = {}
	
	--============================================================
	--			Midcast sets
	--============================================================

	sets.midcast.FastRecast = {}
	
	--============================================================
	--			Other sets
	--============================================================
	
	sets.weapons['4-Hit'] = {}
	sets.weapons['5-Hit'] = {}
	
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
	
	sets.engaged['4-Hit'] = {}
	sets.engaged['4-Hit'].with_buff = {}
	sets.engaged['4-Hit'].with_buff['hasso'] = {}
	
	sets.engaged['5-Hit'] = {}
	
	sets.engaged['5-Acc'] = {}
	
	sets.engaged.with_buff = {}
	sets.engaged.with_buff['doom'] = {}
	sets.engaged.with_buff['reive mark'] = {}
	
	sets.buffs['Meikyou Shisui'] = {}
end
