-----------------------------------------------------------------------------------------------------------
-- Author: Ragnarok.Lorand
-----------------------------------------------------------------------------------------------------------

-- Define sets and vars used by this job file.
function init_gear_sets()
	--============================================================
	--					Precast sets
	--============================================================
	sets.precast.JA['Mana Wall'] = {feet="Goetia Sabots +2"}
	sets.precast.JA['Manafont'] = {body="Sorcerer's Coat +2"}
	sets.precast.JA['Convert'] = {}
	
	sets.precast.FC = {
		main="Lehbrailg +2",
		head="Nares Cap",		neck="Jeweled Collar",	lear="Loquacious Earring",
		hands="Repartie Gloves",
		back="Swith Cape",		legs="Artsieq Hose",	feet="Chelona Boots"
	}

	sets.precast.FC.EnhancingMagic = {waist="Siegel Sash"}
	sets.precast.FC.ElementalMagic = {neck="Stoicheion Medal"}
	sets.precast.FC.Cure = {back="Pahtli Cape"}
	sets.precast.FC.Curaga = sets.precast.FC.Cure

	--============================================================
	
	sets.precast.WS = {}
	
	--============================================================
	--					Midcast sets
	--============================================================
	sets.midcast.FastRecast = {
		head="Weatherspoon Corona +1",	neck="Jeweled Collar",	lear="Loquacious Earring",
		body="Hagondes Coat +1",		hands="Hagondes Cuffs +1",
		back="Swith Cape",				waist="Cetl Belt",		legs="Artsieq Hose",	feet="Hagondes Sabots +1"
	}

	sets.midcast.Cure = {
		main="Arka IV",			sub="Achaq Grip",
		neck="Fylgja Torque",	ear2="Star Earring",
		hands="Bokwus Gloves",	ring1="Aqua Ring",	ring2="Solemn Ring",
		back="Oretania's Cape",
	}
	sets.midcast.Cure.with_buff = {}
	sets.midcast.Cure.with_buff['reive mark'] = {neck="Arciela's Grace +1"}
	sets.midcast.Curaga = sets.midcast.Cure

	sets.midcast.Cursna = {
		neck="Malison Medallion",
		hands="Hieros Mittens",		ring1="Ephedra Ring",	ring2="Ephedra Ring"
	}
	
	sets.midcast.EnhancingMagic = {
		neck="Colossus's Torque",
		waist="Cascade Belt"
	}
	sets.midcast.Aquaveil = {waist="Emphatikos Rope"}
	sets.midcast.Stoneskin = {waist="Siegel Sash"}

	sets.midcast.MagicAccuracy = {
		main="Lehbrailg +2",	sub="Mephitis Grip",		ammo="Kalboron Stone",
		head="Kaabnax Hat",		neck="Eddy Necklace",		ear1="Lifestorm Earring",	ear2="Psystorm Earring",
		body="Praeco Doublet",	hands="Hagondes Cuffs +1",	ring1="Sangoma Ring",		ring2="Perception Ring",
		back="Bane Cape",		waist="Ovate Rope",			legs="Artsieq Hose",		feet="Bokwus Boots"
	}
	
	sets.midcast.EnfeeblingMagic = {}
		
	sets.midcast.ElementalEnfeeble = sets.midcast.EnfeeblingMagic

	sets.midcast.DarkMagic = {
		feet="Goetia Sabots +2"
	}

	-- Elemental Magic sets are default for handling low-tier nukes.
	sets.midcast.ElementalMagic = {
		main="Lehbrailg +2",		sub="Bugard Strap +1",		ammo="Witchstone",
		head="Buremte Hat",			neck="Eddy Necklace",		ear1="Hecate's Earring",	ear2="Friomisi Earring",
		body="Hagondes Coat +1",	hands="Otomi Gloves",		ring1="Spiral Ring",		ring2="Acumen Ring",
		back="Bane Cape",			waist="Cognition Belt",		legs="Hagondes Pants +1",	feet="Hagondes Sabots +1"
	}
	sets.midcast.ElementalMagic.with_buff = {}
	sets.midcast.ElementalMagic.with_buff['reive mark'] = {neck="Arciela's Grace +1"}
	sets.midcast.ElementalMagic.Resistant = sets.midcast.ElementalMagic
	sets.midcast.ElementalMagic.Proc = sets.midcast.FastRecast

	sets.midcast.DivineMagic = {}
	sets.midcast.DivineMagic.Nuke = {}
	sets.midcast.DivineMagic.Nuke.with_buff = {}
	sets.midcast.DivineMagic.Nuke.with_buff['reive mark'] = {neck="Arciela's Grace +1"}
	
	--============================================================
	--					Other sets
	--============================================================
	
	sets.resting = {
		main="Chatoyant Staff",	ammo="Clarus Stone",
		legs="Nisse Slacks",	feet="Chelona Boots"
	}
	
	-- Idle sets
	sets.idle = {
		main="Terra's Staff",	sub="Achaq Grip",			ammo="Kalboron Stone",
		head="Kaabnax Hat",		neck="Twilight Torque",		ear1="Novia Earring",	ear2="Star Earring",
		body="Artsieq Jubbah",	hands="Hagondes Cuffs +1",	ring1="Dark Ring",		ring2="Shneddick Ring",
		back="Cheviot Cape",	waist="Emphatikos Rope",	legs="Nares Trews",		feet="Hagondes Sabots +1"
	}
	sets.idle.lowMP = {legs="Nares Trews"}
	sets.idle.lowMP_night =	{hands="Serpentes Cuffs"}
	sets.idle.lowMP_day = {feet="Serpentes Sabots"}
	sets.idle.with_buff = {}
	sets.idle.with_buff['reive mark'] = {neck="Arciela's Grace +1"}
	
	sets.defense.PDT = sets.idle
	sets.defense.MDT = sets.idle

	sets.buffs['mana wall'] = {feet="Goetia Sabots +2"}
	
	sets.engaged = {}
	sets.engaged.with_buff = {}
end