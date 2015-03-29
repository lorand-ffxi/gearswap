-----------------------------------------------------------------------------------------------------------
--[[
	Author: Ragnarok.Lorand

	<legs>Iga Hakama +2</legs>	Adds Counter to Yonin when shadows are down
--]]
-----------------------------------------------------------------------------------------------------------

function init_gear_sets()
	--============================================================
	--			Precast sets
	--============================================================
	sets.precast.JA['Mijin Gakure'] = {}

	sets.precast.Waltz = {}
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.precast.Step = combineSets(sets.engaged, {})
	
	sets.precast.Ranged = {}
	
	sets.precast.FC = {}
	
	sets.precast.FC.Utsusemi = {}

	--============================================================
	--sets.wsBase[magic][sam/other][state.OffenseMode][state.RangedMode][wsmod[spell.en]]
	sets.wsBase = {}
	
	sets.wsBase.Acc = {}
	sets.wsBase.Acc.DEX = {}
	sets.wsBase.Acc.AGI = {}
	
	sets.wsBase.STR = {}
	sets.wsBase.DEX = {}
	sets.wsBase.STRDEX = {}
	sets.wsBase.AGI = {}
	
	sets.wsBase.Magic = {}
	
	--============================================================
	--			Midcast sets
	--============================================================
	
	sets.midcast.FastRecast = {}
	sets.midcast.Utsusemi = {}

	sets.midcast.MagicAccuracy = {}
	
	sets.midcast.Ninjutsu = {}
	
	sets.midcast.Ninjutsu.Nuke = {}
	sets.midcast.Ninjutsu.Nuke.with_buff = {}
	
	sets.midcast.RangedAttack = {}
	
	--============================================================
	--			Other sets
	--============================================================
	
	sets.weapons.Main = {}
	sets.weapons.OAT = {}
	sets.weapons.Reive = {}
	
	sets.idle = {}
	sets.idle.with_buff = {}
	sets.idle.with_buff['migawari'] = {}
	sets.idle.with_buff['reive mark'] = {}
	
	-- Defense sets
	sets.defense.Evasion = {}
	
	sets.defense.DT = {}
	
	sets.defense.PDT = combineSets(sets.defense.DT, {})
	sets.defense.MDT = combineSets(sets.defense.DT, {})
	
	--============================================================
	
	sets.engaged.with_buff['migawari'] = {}
	sets.engaged.with_buff['reive mark'] = {}
	
	sets.engaged.Tank = {}
	
	sets.engaged.auto = {}
	sets.engaged.auto['na'] =	{}
	sets.engaged.auto['I'] =	{}
	sets.engaged.auto['I+'] =	{}
	sets.engaged.auto['II'] =	{}
	sets.engaged.auto['II+'] =	{}
	
	sets.engaged.auto_acc = {}
	sets.engaged.auto_acc['na'] =	{}
	sets.engaged.auto_acc['I'] =	{}
	sets.engaged.auto_acc['I+'] =	{}
	sets.engaged.auto_acc['II'] =	{}
	sets.engaged.auto_acc['II+'] =	{}
	
	sets.engaged.CrazyAccuracy = {}
end
