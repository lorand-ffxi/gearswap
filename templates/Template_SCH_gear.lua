-----------------------------------------------------------------------------------------------------------
--[[
	Author: Ragnarok.Lorand
--]]
-----------------------------------------------------------------------------------------------------------

function init_gear_sets()
	--============================================================
	--			Precast sets
	--============================================================
	gear.KlimaformFeet = "Arbatel Loafers"
	sets.impact = {body="Twilight Cloak"}	--This is just to remind me to get it from the Porter Moogle
	
	sets.precast.JA['Rapture'] =		{}
	sets.precast.JA['Ebullience'] =		{}
	sets.precast.JA['Penury'] =		{}
	sets.precast.JA['Parsimony'] =		{}
	sets.precast.JA['Tabula Rasa'] =	{}
	sets.precast.JA['Perpetuance'] =	{}
	sets.precast.JA['Immanence'] =		{}
	sets.precast.JA['Addendum: White'] =	{}
	sets.precast.JA['Addendum: Black'] =	{}
	sets.precast.JA['Altruism'] =		{}
	sets.precast.JA['Focalization'] =	{}
	
	sets.precast.FC = {}
	sets.precast.FC.EnhancingMagic = {}
	sets.precast.FC.Cure = {}
	sets.precast.FC.Curaga = sets.precast.FC.Cure
	sets.precast.FC.Grimoire = {}
	sets.precast.FC.Weather = {}
	sets.precast.FC.Lightning = {}

	--============================================================
	
	sets.precast.WS = {}
	
	--============================================================
	--			Midcast sets
	--============================================================
	sets.midcast.FastRecast = {}

	sets.midcast.HealingMagic = {}
	sets.midcast.HealingMagic.LA = {}
	
	sets.midcast.Cursna = {}
	
	sets.midcast.Cure = {}
	sets.midcast.Cure.with_buff = {}
	sets.midcast.Curaga = sets.midcast.Cure

	sets.midcast.EnhancingMagic = {}
	sets.midcast.EnhancingMagic.LA = {}
	
	sets.midcast.Aquaveil = {}
	sets.midcast.Stoneskin = {}
	sets.midcast.Regen = {}
	sets.midcast.Klimaform = {}

	sets.midcast.MagicAccuracy = {}
	
	sets.midcast.EnfeeblingMagic = {}
	sets.midcast.EnfeeblingMagic.DA = {}
	sets.midcast.EnfeeblingMagic.LA = {}

	sets.midcast.DarkMagic = {}
	sets.midcast.DarkMagic.DA = {}
	
	sets.midcast.DarkMagic.Stun = {}
	
	sets.midcast.DarkMagic.Stun.MediumAcc = {}
	
	sets.midcast.DarkMagic.Stun.HighAcc = {}
	
	sets.midcast.DarkMagic.Stun.Resistant = combineSets({},sets.midcast.DarkMagic.Stun.HighAcc)
	
	sets.midcast.DivineMagic = {}
	sets.midcast.DivineMagic.LA = {}
	
	sets.midcast.ElementalMagicSkill = {}
	sets.midcast.ElementalMagicSkill.DA = {}
	
	sets.midcast.ElementalMagic = {}
	sets.midcast.ElementalMagic.LowTier = {}
	sets.midcast.ElementalMagic.HighTier = {}
	sets.midcast.ElementalMagic.Earth = {}
	
	sets.midcast.ElementalMagic.MediumAcc = {}
	sets.midcast.ElementalMagic.HighAcc = {}
	sets.midcast.ElementalMagic.Proc = {}
	
	sets.midcast.ElementalEnfeeble = {}
	
	sets.midcast.DivineMagic = {}
	sets.midcast.DivineMagic.Nuke = {}
	sets.midcast.DivineMagic.Nuke.with_buff = {}
	
	--============================================================
	--			Other sets
	--============================================================
	
	sets.resting = {}
	
	sets.idle = {}
	
	sets.idle.CapFarm = {}
	
	sets.idle.MDT = {}
	sets.idle.with_buff = {}
	
	sets.idle.lowMP =	{}
	sets.idle.lowMP_night =	{}
	sets.idle.lowMP_day =	{}
	
	sets.idle.with_buff['sublimation: activated'] = {}
	sets.idle.with_buff['doom'] = {}
	sets.idle.with_buff['reive mark'] = {}
	
	sets.defense.PDT = {}
	sets.defense.MDT = {}

	--============================================================
	
	sets.engaged = {}
	sets.engaged.with_buff = {}
	sets.engaged.with_buff['doom'] = {}
	sets.engaged.with_buff['reive mark'] = {}
end
