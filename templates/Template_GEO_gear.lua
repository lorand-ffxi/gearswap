--------------------------------------------------------------------------------
--[[
	Author: Ragnarok.Lorand
--]]
--------------------------------------------------------------------------------

function init_gear_sets()
	--============================================================
	--			Precast sets
	--============================================================
	sets.impact = {}	--This is just to remind me to get it from the Porter Moogle
	
	sets.precast.FC = {}

	sets.precast.FC.Geomancy = {}
	
	sets.precast.FC.EnhancingMagic = {}
	sets.precast.FC.ElementalMagic = {}
	sets.precast.FC.Lightning = {}
	sets.precast.FC.Cure = {}
	sets.precast.FC.Curaga = sets.precast.FC.Cure

	--============================================================
	
	sets.wsBase = {}
	sets.wsBase.Magic = {}
	
	--============================================================
	--			Midcast sets
	--============================================================
	sets.midcast.FastRecast = {}

	sets.midcast.Geomancy = {}
	sets.midcast.Geomancy.Indi = {}
	sets.midcast.Geomancy.Geo = {}
	
	sets.midcast.Cure = {}
	sets.midcast.Cure.with_buff = {}
	sets.midcast.Curaga = sets.midcast.Cure

	sets.midcast.Cursna = {}
	
	sets.midcast.EnhancingMagic = {}
	sets.midcast.Aquaveil = {}
	sets.midcast.Stoneskin = {}

	sets.midcast.MagicAccuracy = {}
	
	sets.midcast.EnfeeblingMagic = {}

	sets.midcast.DarkMagic = {}
	sets.midcast.Stun = {}

	sets.midcast.DivineMagic = {}

	sets.midcast.ElementalMagic = {}
	sets.midcast.ElementalMagic.Earth = {}
	
	sets.midcast.ElementalMagic.Resistant = {}
	
	sets.midcast.ElementalEnfeeble = {}
	--============================================================
	--			Other sets
	--============================================================
	
	sets.resting = {}
	
	sets.idle = {}
	sets.idle.lowMP = {}
	sets.idle.lowMP_night =	{}
	sets.idle.lowMP_day = {}
	
	sets.idle.with_pet = {}
	sets.idle.with_pet.Luopan = {}
	
	-- Defense sets
	sets.defense.DT = {}
	sets.defense.PDT = combineSets(sets.defense.DT, {})
	sets.defense.MDT = combineSets(sets.defense.DT, {})

	sets.engaged = {}
end
