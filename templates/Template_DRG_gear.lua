--------------------------------------------------------------------------------
--[[
	Author: Ragnarok.Lorand
--]]
--------------------------------------------------------------------------------

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
	
	sets.precast.FC = {}
	
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
	
	sets.weapons.Main = {}
	
	sets.engaged = {}
	
	sets.engaged.MediumAcc = {}
	
	sets.engaged.HighAcc = {}
	
	sets.engaged.with_buff = {}
	sets.engaged.with_buff['doom'] = {}
	sets.engaged.with_buff['reive mark'] = {}

	--============================================================
	
	sets.pet = {}
	sets.pet.breath = {}
	
	sets.resting = {}
	
	sets.idle = {}
	sets.idle.with_buff = {}
	sets.idle.with_buff['doom'] = {}
	sets.idle.with_buff['reive mark'] = {}
	
	sets.defense.DT = {}
	
	sets.defense.PDT = set_combine(sets.defense.DT, {})
	sets.defense.MDT = set_combine(sets.defense.DT, {})
end
