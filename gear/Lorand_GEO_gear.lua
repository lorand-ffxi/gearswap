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
	
	sets.precast.FC = {
		body="Anhur Robe",
	}

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
	sets.midcast.Geomancy.Indi = {
		head="Artsieq Hat"	--proof of concept
	}
	sets.midcast.Geomancy.Geo = {
		head="Hagondes Hat +1"	--proof of concept
	}
	
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
	
	sets.idle = {
		main="Terra's Staff",	sub="Elder's Grip",						ammo="Kalboron Stone",
		head="Nahtirah Hat",	neck="Twilight Torque",		ear1="Brachyura Earring",	ear2="Ethereal Earring",
		body="Artsieq Jubbah",	hands="Hagondes Cuffs +1",	ring1="Defending Ring",		ring2="Shneddick Ring",
		back="Repulse Mantle",	waist="Emphatikos Rope",	legs="Artsieq Hose",		feet="Hagondes Sabots +1"
	}
	sets.idle.lowMP = {legs="Nares Trews"}
	sets.idle.lowMP_night =	{hands="Serpentes Cuffs"}
	sets.idle.lowMP_day = {feet="Serpentes Sabots"}
	
	sets.idle.with_pet = {}
	sets.idle.with_pet.Luopan = {
		body="Hagondes Coat +1"
	}
	
	-- Defense sets
	sets.defense.DT = {
		head="Kaabnax Hat",	neck="Twilight Torque",
		ring1="Defending Ring",	ring2="Dark Ring",
	}
	sets.defense.PDT = combineSets(sets.defense.DT, {
	})
	sets.defense.MDT = combineSets(sets.defense.DT, {
	})

	sets.engaged = {}
end