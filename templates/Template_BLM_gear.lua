--------------------------------------------------------------------------------
--[[
	Author: Ragnarok.Lorand
--]]
--------------------------------------------------------------------------------

function init_gear_sets()
	--============================================================
	--			Precast sets
	--============================================================
	sets.impact = {body="Twilight Cloak"}	--This is just to remind me to get it from the Porter Moogle
	
	sets.precast.JA['Mana Wall'] = {}
	sets.precast.JA['Manafont'] = {}
	sets.precast.JA['Convert'] = {}
	
	sets.precast.FC = {}

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

	sets.midcast.Cure = {}
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
	
	sets.midcast.BardSong = {}

	sets.midcast.ElementalMagic = {}
	sets.midcast.ElementalMagic.LowTier = {}
	sets.midcast.ElementalMagic.HighTier = {}
	sets.midcast.ElementalMagic.Earth = {}
	
	sets.midcast.ElementalMagic.MediumAcc = {}
	sets.midcast.ElementalMagic.HighAcc = {}
	sets.midcast.ElementalMagic.Proc = {}
	
	sets.midcast.ElementalEnfeeble = {}
	--============================================================
	--			Other sets
	--============================================================
	
	sets.resting = {}
	
	sets.idle = {}
	sets.idle.lowMP = {}
	sets.idle.lowMP_night =	{}
	sets.idle.lowMP_day = {}
	
	-- Defense sets
	sets.defense.PDT = sets.idle
	sets.defense.MDT = sets.idle
	
	sets.buffs['Mana Wall'] = {}

	sets.engaged = {}
end
