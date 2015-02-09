function init_gear_sets()
	--============================================================
	--			Precast sets
	--============================================================
	sets.precast.JA['Burst Affinity'] = {}
	sets.precast.JA['Chain Affinity'] = {}
	sets.precast.JA['Efflux'] = {}
	
	sets.precast.FC = {
		main="",	sub="",		range="",	ammo="",
		head="",	neck="",	ear1="",	ear2="",
		body="",	hands="",	ring1="",	ring2="",
		back="",	waist="",	legs="",	feet=""
	}
	sets.precast.FC.BlueMagic = {}
	
	sets.precast.FC.EnhancingMagic = {}
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
	
	sets.midcast.BlueMagic = {}
	
	sets.midcast.BlueMagic.Physical = {}
	sets.midcast.BlueMagic.Physical.AGI = {}
	sets.midcast.BlueMagic.Physical.CHR = {}
	sets.midcast.BlueMagic.Physical.DEX = {}
	sets.midcast.BlueMagic.Physical.INT = {}
	sets.midcast.BlueMagic.Physical.MND = {}
	sets.midcast.BlueMagic.Physical.STR = {}
	sets.midcast.BlueMagic.Physical.VIT = {}
	sets.midcast.BlueMagic.Physical.DEXINT = {}
	sets.midcast.BlueMagic.Physical.STRAGI = {}
	sets.midcast.BlueMagic.Physical.STRDEX = {}
	sets.midcast.BlueMagic.Physical.STRINT = {}
	sets.midcast.BlueMagic.Physical.STRMND = {}
	sets.midcast.BlueMagic.Physical.STRVIT = {}
	sets.midcast.BlueMagic.Physical['Cannonball'] = {}

	sets.midcast.BlueMagic.Magic = {}
	sets.midcast.BlueMagic.Magic.CHR = {}
	sets.midcast.BlueMagic.Magic.DEX = {}
	sets.midcast.BlueMagic.Magic.INT = {}
	sets.midcast.BlueMagic.Magic.MND = {}
	sets.midcast.BlueMagic.Magic.STR = {}
	sets.midcast.BlueMagic.Magic.VIT = {}
	sets.midcast.BlueMagic.Magic.INTMND = {}
	sets.midcast.BlueMagic.Magic.STRDEX = {}
	sets.midcast.BlueMagic.Magic['Blazing Bound'] = {}
	
	sets.midcast.BlueMagic.Breath = {}
	
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
	sets.idle.with_buff['reive mark'] = {}
	
	-- Defense sets
	sets.defense.PDT = sets.idle
	sets.defense.MDT = sets.idle

	sets.engaged = {}
	sets.engaged.Learn = {}
	
	sets.engaged.Learn1 = {}
	sets.engaged.with_buff = {}
	sets.engaged.with_buff['reive mark'] = {}
end