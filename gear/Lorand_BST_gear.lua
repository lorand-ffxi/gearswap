--------------------------------------------------------------------------------
--[[
	Author: Ragnarok.Lorand
--]]
--------------------------------------------------------------------------------

function init_gear_sets()
	--============================================================
	--			Precast sets
	--============================================================
	sets.precast.JA['Charm'] = {	--Modified by CHR
		head="Beast Helm",
		body="Beast Jackcoat",	hands="Beast Gloves",
		legs="Beast Trousers",	feet="Beast Gaiters"
	}
	sets.precast.JA['Reward'] = {	--Modified by MND
		ammo="Pet Food Epsilon Biscuit",
		body="Beast Jackcoat",
		feet="Beast Gaiters"
	}
	sets.precast.JA['Tame'] = {	--Modified by INT
		head="Beast Helm"
	}

	sets.precast.Waltz = {}

	sets.precast.Step = {}
	
	--============================================================
	
	sets.precast.FC = {}
	
	--============================================================
	
	sets.wsBase = {
		head="Voyager Sallet",	neck="Iqabi Necklace",
		body="Beast Jackcoat",	hands="Gothic Gauntlets",	ring1="Sniper's Ring",	ring2="Rajas Ring",
		legs="Beast Trousers",	feet="Gothic Sabatons",
	}

	sets.wsBase.Magic = {}
	
	--============================================================
	--			Midcast sets
	--============================================================
	
	sets.midcast.FastRecast = {
		head="Patroclus's Helm",
		ring2="Blitz Ring",
		waist="Swift Belt",
	}

	--============================================================
	--			Other sets
	--============================================================
	
	sets.idle = {										ammo="Bibiki Seashell",
		head="Patroclus's Helm",	neck="Iqabi Necklace",	ear1="Reraise Earring",	ear2="Cassie Earring",
		body="Beast Jackcoat",		hands="Beast Gloves",	ring1="Sniper's Ring",	ring2="Blitz Ring",
		back="Behemoth Mantle",		waist="Swift Belt",	legs="Beast Trousers",	feet="Beast Gaiters"
	}
	--sets.idle.with_pet = {ammo="Pet Food Eta",}
	
	sets.resting = {}
	
	sets.defense.DT = {}
	sets.defense.PDT = {}
	sets.defense.MDT = {}
	
	sets.defense.HP = sets.defense.PDT

	--============================================================
	
	sets.weapons.Main = {main="Darksteel Axe",sub="Tungi"}
	
	sets.engaged = {									ammo="Bibiki Seashell",
		head="Patroclus's Helm",	neck="Iqabi Necklace",	ear1="Reraise Earring",	ear2="Cassie Earring",
		body="Beast Jackcoat",		hands="Beast Gloves",	ring1="Sniper's Ring",	ring2="Blitz Ring",
		back="Behemoth Mantle",		waist="Swift Belt",	legs="Beast Trousers",	feet="Beast Gaiters"
	}
end