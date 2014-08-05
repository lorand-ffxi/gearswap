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
		body="Hagondes Coat +1",		hands="Hagondes Cuffs",
		back="Swith Cape",				waist="Cetl Belt",		legs="Weatherspoon Pants +1",	feet="Weatherspoon Souliers +1"
	}

	sets.midcast.Cure = {
		main="Arka IV",			sub="Achaq Grip",
		neck="Fylgja Torque",	ear2="Star Earring",
		hands="Bokwus Gloves",	ring1="Aqua Ring",	ring2="Solemn Ring",
		back="Oretania's Cape",
	}
	sets.midcast.Curaga = sets.midcast.Cure

	sets.midcast.EnhancingMagic = {
		neck="Colossus's Torque",
		waist="Cascade Belt"
	}
	sets.midcast.Aquaveil = {waist="Emphatikos Rope"}
	sets.midcast.Stoneskin = {waist="Siegel Sash"}

	sets.midcast.MagicAccuracy = {
		main="Lehbrailg +2",	sub="Mephitis Grip",		ammo="Kalboron Stone",
		head="Kaabnax Hat",	neck="Stoicheion Medal",	ear1="Lifestorm Earring",	ear2="Psystorm Earring",
		body="Praeco Doublet",	hands="Hagondes Cuffs",		ring1="Perception Ring",
		back="Bane Cape",		legs="Artsieq Hose",		feet="Bokwus Boots"
	}
	
	sets.midcast.EnfeeblingMagic = {}
		
	sets.midcast.ElementalEnfeeble = sets.midcast.EnfeeblingMagic

	sets.midcast.DarkMagic = {
		feet="Goetia Sabots +2"
	}

	-- Elemental Magic sets are default for handling low-tier nukes.
	sets.midcast.ElementalMagic = {
		main="Lehbrailg +2",		sub="Bugard Strap +1",		ammo="Witchstone",
		head="Buremte Hat",			neck="Stoicheion Medal",	ear1="Hecate's Earring",	ear2="Friomisi Earring",
		body="Hagondes Coat +1",	hands="Otomi Gloves",		ring1="Spiral Ring",		ring2="Acumen Ring",
		back="Bane Cape",			waist="Cognition Belt",		legs="Hagondes Pants +1",	feet="Weatherspoon Souliers +1"
	}

	sets.midcast.ElementalMagic.Resistant = sets.midcast.ElementalMagic
	sets.midcast.ElementalMagic.Proc = sets.midcast.FastRecast

	--============================================================
	--					Other sets
	--============================================================
	
	sets.resting = {
		main="Chatoyant Staff",
		ammo="Clarus Stone",
		legs="Nisse Slacks",
		feet="Chelona Boots"
	}
	
	-- Idle sets
	sets.idle = {
		main="Terra's Staff",		sub="Achaq Grip",			ammo="Kalboron Stone",
		head="Kaabnax Hat",		neck="Twilight Torque",		ear1="Novia Earring",	ear2="Star Earring",
		body="Hagondes Coat +1",	hands="Serpentes Cuffs",	ring1="Dark Ring",		ring2="Dark Ring",
		back="Cheviot Cape",		waist="Emphatikos Rope",	legs="Nares Trews",		feet="Serpentes Sabots"
	}
	sets.idle.Speedy = {feet="Herald's Gaiters"}
	
	sets.defense.PDT = sets.idle
	sets.defense.MDT = sets.idle
	sets.Kiting = {}

	sets.buff['Mana Wall'] = {feet="Goetia Sabots +2"}
	
	sets.engaged = {}
end