-----------------------------------------------------------------------------------------------------------
--[[
	Author: Ragnarok.Lorand
	
	Slips:
--]]
-----------------------------------------------------------------------------------------------------------

function init_gear_sets()
	--============================================================
	--			Precast sets
	--============================================================
	sets.precast.JA['Mana Wall'] = {}
	sets.precast.JA['Manafont'] = {}
	sets.precast.JA['Convert'] = {}
	
	sets.precast.FC = {}

	sets.precast.FC.EnhancingMagic = {}
	sets.precast.FC.ElementalMagic = {}
	sets.precast.FC.Cure = {}
	sets.precast.FC.Curaga = sets.precast.FC.Cure

	--============================================================
	
	sets.wsBase = {}
	sets.wsBase.Magic = {}
	
	--============================================================
	--			Midcast sets
	--============================================================
	sets.midcast.FastRecast = {}

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
	sets.midcast.DivineMagic.Nuke = {}
	sets.midcast.DivineMagic.Nuke.with_buff = {}
	
	sets.midcast.BardSong = {}

	sets.midcast.ElementalMagic = {}
	sets.midcast.ElementalMagic.with_buff = {}
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
	
	sets.idle.with_buff = {}
	
	-- Defense sets
	sets.defense.PDT = sets.idle
	sets.defense.MDT = sets.idle
	
	sets.buffs['Mana Wall'] = {}

	sets.engaged = {}
	sets.engaged.with_buff = {}
end