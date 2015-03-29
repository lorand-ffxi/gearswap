--------------------------------------------------------------------------------
--[[
	Author: Ragnarok.Lorand
--]]
--------------------------------------------------------------------------------

function init_gear_sets()
	--============================================================
	--			Precast sets
	--============================================================
	sets.precast.JA['Charm'] = {}
	sets.precast.JA['Reward'] = {}
	sets.precast.JA['Tame'] = {}

	sets.precast.Waltz = {}
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.precast.Step = {}
	
	--============================================================
	
	-- Fast cast sets for spells
	sets.precast.FC = {}
	sets.precast.FC.Utsusemi = {}
	
	--============================================================
	
	sets.wsBase = {}
	sets.wsBase.MediumAcc = {}
	sets.wsBase.HighAcc = {}

	sets.wsBase.Magic = {}
	
	--============================================================
	--			Midcast sets
	--============================================================
	
	sets.midcast.FastRecast = {}

	--============================================================
	--			Other sets
	--============================================================
	
	sets.buffs['doom'] = {}
	
	sets.idle = {}
	sets.idle.with_buff = {}
	sets.idle.with_buff['doom'] = {}
	sets.idle.with_buff['reive mark'] = {}
	
	sets.idle.with_pet = {}
	
	sets.resting = {}
	
	sets.defense.DT = {}
	sets.defense.PDT = combineSets(sets.defense.DT, {})
	sets.defense.MDT = combineSets(sets.defense.DT, {})
	
	sets.defense.HP = sets.defense.PDT

	--============================================================
	
	sets.weapons.Main = {}
	
	sets.engaged = {}
	
	sets.engaged.MediumAcc = {}
	
	sets.engaged.HighAcc = {}
	sets.engaged.with_buff = {}
	sets.engaged.with_buff['doom'] = {}
	sets.engaged.with_buff['reive mark'] = {}
end
