function init_gear_sets()
	--============================================================
	--			Precast sets
	--============================================================
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
	
	sets.precast.FC = {
		main="",	sub="",		range="",	ammo="",
		head="",	neck="",	ear1="",	ear2="",
		body="",	hands="",	ring1="",	ring2="",
		back="",	waist="",	legs="",	feet=""
	}
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
	sets.midcast.FastRecast = set_combine(sets.precast.FC, {})

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

	sets.midcast.MagicAccuracy = {}
	
	sets.midcast.EnfeeblingMagic = {}
	sets.midcast.EnfeeblingMagic.DA = {}
	sets.midcast.EnfeeblingMagic.LA = {}

	sets.midcast.DarkMagic = {}
	sets.midcast.DarkMagic.DA = {}
	
	sets.midcast.DivineMagic = {}
	sets.midcast.DivineMagic.LA = {}
	
	sets.midcast.ElementalMagicSkill = {}
	sets.midcast.ElementalMagicSkill.DA = {}
	
	sets.midcast.ElementalMagic = {}
	sets.midcast.ElementalMagic.with_buff = {}
	sets.midcast.ElementalMagic.Earth = {}
	
	sets.midcast.ElementalEnfeeble = {}
	
	sets.midcast.DivineMagic = {}
	sets.midcast.DivineMagic.Nuke = {}
	sets.midcast.DivineMagic.Nuke.with_buff = {}
	
	--============================================================
	--			Other sets
	--============================================================
	
	sets.resting = {}
	
	sets.idle = {}
	sets.idle.with_buff = {}
	
	sets.idle.lowMP =		{}
	sets.idle.lowMP_night =	{}
	sets.idle.lowMP_day =	{}
	sets.idle.sublimation = {}
	
	sets.idle.with_buff['sublimation: activated'] = {}
	sets.idle.with_buff['doom'] = {}
	sets.idle.with_buff['reive mark'] = {}
		
	sets.defense.DT = {}
	sets.defense.PDT = set_combine(sets.defense.DT, {})
	sets.defense.MDT = set_combine(sets.defense.DT, {})

	--============================================================
	
	sets.engaged = {}
	sets.engaged.with_buff = {}
	sets.engaged.with_buff['doom'] = {}
	sets.engaged.with_buff['reive mark'] = {}
end