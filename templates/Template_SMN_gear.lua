--------------------------------------------------------------------------------
--[[
	Author: Ragnarok.Lorand
--]]
--------------------------------------------------------------------------------

function init_gear_sets()
	--============================================================
	--			Precast sets
	--============================================================
	sets.precast.FC = {}
	
	sets.precast.FC.SummoningMagic = {}
	
	sets.precast.FC.EnhancingMagic = {}
	
	sets.precast.FC.Cure = {}
	
	sets.precast.FC.Lightning = {}
	
	--============================================================
	
	sets.precast.JA['Astral Flow'] = {}
	sets.precast.JA['Elemental Siphon'] = {}
	sets.precast.JA['Mana Cede'] = {}
	sets.precast.JA["Avatar's Favor"] = {}

	sets.precast.Waltz = {}
	
	--============================================================
	
	sets.wsBase = {}
	
	sets.wsBase.Magic = {}
	
	--============================================================
	--			Midcast sets
	--============================================================
	
	sets.midcast.FastRecast = {}
	
	sets.midcast.MagicAccuracy = {}
	
	--======================== Pet ===============================
	
	sets.midcast.pet.BP = {}
	sets.midcast.pet.BP.Ward = {}
	sets.midcast.pet.BP.Ward.Buff = {}
	sets.midcast.pet.BP.Ward.Debuff = {}
	sets.midcast.pet.BP.Rage = {}
	sets.midcast.pet.BP.Rage.Physical = {}
	sets.midcast.pet.BP.Rage.Magical = {}
	sets.midcast.pet['White Magic'] = {}
	sets.midcast.pet['Elemental Magic'] = {}

	--====================== Healing =============================
	
	sets.midcast.HealingMagic = {}
	
	sets.midcast.Cure = {}
	sets.midcast.Curaga = sets.midcast.Cure

	sets.midcast.Cursna = {}

	--====================== Enhancing ===========================
	
	sets.midcast.EnhancingMagic = {}
	
	sets.midcast.Stoneskin = {}
	sets.midcast.Aquaveil = {}

	sets.midcast.BarElement = {}

	sets.midcast.Regen = {}
	
	--====================== Offensive ===========================	
	
	sets.midcast.DivineMagic = {}
	sets.midcast.DivineMagic.Nuke = {}
	
	sets.midcast.DarkMagic = {}

	sets.midcast.EnfeeblingMagic = {}
	sets.midcast.EnfeeblingMagic.Potency = {}
	sets.midcast.EnfeeblingMagic.Potency.Resistant = {}
	
	sets.midcast.ElementalMagic = {}
	sets.midcast.ElementalEnfeeble = {}
	
	--============================================================
	--			Other sets
	--============================================================
	
	sets.resting = {}

	sets.idle = {}
	sets.idle.lowMP = {}
	sets.idle.lowMP_night =	{}
	sets.idle.lowMP_day = {}
	
	--[[
		Spirit = 7
		Carbuncle/Cait Sith = 11	-> 7
		Fenrir = 13			-> 9
		Avatar = 15			-> 11
		Avatar's Favor = -4
	--]]
	sets.idle.with_pet = {}
	sets.idle.with_pet.perp7 = {}
	sets.idle.with_pet.perp9 = {}
	sets.idle.with_pet.perp11 = {}
	sets.idle.with_pet.perp13 = {}
	sets.idle.with_pet.perp15 = {}
	sets.idle.with_pet.Spirit = sets.idle.with_pet.perp7
	sets.idle.with_pet.Avatar = sets.idle.with_pet.perp15
	sets.idle.with_favor = {}
	
	sets.idle.with_buff = {}
	sets.idle.with_buff['doom'] = {}
	
	sets.defense.DT = {}
	sets.defense.PDT = combineSets(sets.defense.DT, {})
	sets.defense.MDT = combineSets(sets.defense.DT, {})
	
	sets.engaged = {}
	sets.engaged.with_buff = {}
	sets.engaged.with_buff['doom'] = {}
end
