--------------------------------------------------------------------------------
--[[
	Author: Ragnarok.Lorand
--]]
--------------------------------------------------------------------------------

function init_gear_sets()
	--============================================================
	--			Precast sets
	--============================================================
	sets.precast.JA['Hundred Fists'] = {}
	sets.precast.JA['Boost'] = {}
	sets.precast.JA['Dodge'] = {}
	sets.precast.JA['Focus'] = {}
	sets.precast.JA['Counterstance'] = {}
	sets.precast.JA['Footwork'] = {}	-- Tantra+2: Raises attack bonus from 100/1024 to 152/1024
	sets.precast.JA['Formless Strikes'] = {}
	sets.precast.JA['Mantra'] = {}
	sets.precast.JA['Impetus'] = {}
	sets.precast.JA['Invigorate'] = {}
	
	sets.precast.JA['Chi Blast'] = {}
	sets.precast.JA['Chakra'] = {}

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
	
	sets.midcast.FastRecast = combineSets(sets.precast.FC, {})

	--============================================================
	--			Other sets
	--============================================================
	
	sets.buffs['doom'] = {}
	
	sets.idle = {}
	sets.idle.with_buff = {}
	sets.idle.with_buff['doom'] = {}
	sets.idle.with_buff['reive mark'] = {}
	
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
	
	sets.engaged.Tank = {}
	
	sets.engaged.Tank.MediumAcc = {}
	
	sets.engaged.Tank.HighAcc = {}
	
	sets.engaged.with_buff['doom'] = {}
	sets.engaged.with_buff['reive mark'] = {}
end
