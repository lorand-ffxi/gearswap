--------------------------------------------------------------------------------
--[[
	Author: Ragnarok.Lorand
--]]
--------------------------------------------------------------------------------

function init_gear_sets()
	--============================================================
	--			Precast sets
	--============================================================
	sets.precast.JA['Call Beast'] = {hands="Monster Gloves"}
	sets.precast.JA['Charm'] = {	--Modified by CHR
		head="Monster Helm",
		body="Monster Jackcoat",	hands="Monster Gloves",
		legs="Beast Trousers",		feet="Monster Gaiters"
	}
	sets.precast.JA['Reward'] = {	--Modified by MND
		ammo="Pet Food Eta",
		head="Iuitl Headgear +1",	ear1="Lifestorm Earring",	ear2="Novia Earring",
		body="Beast Jackcoat",		hands="Regimen Mittens",	ring1="Perception Ring",	ring2="Prolix Ring",
		back="Tuilha Cape",		legs="Taeon Tights",		feet="Monster Gaiters"
	}
	sets.precast.JA['Tame'] = {	--Modified by INT
		head="Beast Helm"
	}
	sets.precast.JA['Sic'] = {hands="Ferine Manoplas +2"}
	sets.precast.JA['Ready'] = {hands="Ferine Manoplas +2"}
	sets.precast.JA['Spur'] = {feet="Ferine Ocreae +2"}
	
	sets.precast.Waltz = {}
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.precast.Step = {}
    
    sets.midcast.pet['Ready'] = {}
	
	--============================================================
	
	-- Fast cast sets for spells
	sets.precast.FC = {										ammo="Impatiens",
		head="Anwig Salade",	neck="Orunmila's Torque",	ear1="Loquacious Earring",
		body="Taeon Tabard",	hands="Buremte Gloves",		ring1="Prolix Ring",		ring2="Veneficium Ring",
		feet="Ejekamal Boots"
	}
	sets.precast.FC.Utsusemi = {neck="Magoraga Bead Necklace"}
	
	--============================================================
	
	sets.wsBase = {											ammo="Jukukik Feather",
		head="Highwing Helm",	neck="Asperity Necklace",	ear1="Bladeborn Earring",	ear2="Steelflash Earring",
		body="Xaddi Mail",	hands="Taeon Gloves",		ring1="Rajas Ring",		ring2="Epona's Ring",
		back="Atheling Mantle",	waist="Fotia Belt",		legs="Taeon Tights",		feet="Whirlpool Greaves"
	}
	sets.wsBase.MediumAcc = {}
	sets.wsBase.HighAcc = {}

	sets.wsBase.Magic = {							ammo="Dosis Tathlum",
		neck="Sanctity Necklace",	ear1="Hecate's Earring",	ear2="Friomisi Earring",
		ring1="Fenrir Ring +1",		ring2="Acumen Ring",
		back="Toro Cape"
	}
	
	--============================================================
	--			Midcast sets
	--============================================================
	
	sets.midcast.FastRecast = {}

	--============================================================
	--			Other sets
	--============================================================
	
	sets.buffs['doom'] = {ring1="Saida Ring", ring2="Saida Ring"}
	
	sets.idle = {											ammo="Demonry Stone",
		head="Ocelomeh Headpiece +1",	neck="Twilight Torque",	ear1="Brachyura Earring",	ear2="Ethereal Earring",
		body="Kirin's Osode",		hands="Umuthi Gloves",	ring1="Defending Ring",		ring2="Shneddick Ring",
		back="Repulse Mantle",		waist="Nierenschutz",	legs="Taeon Tights",		feet="Whirlpool Greaves",
	}
	sets.idle.with_buff = {}
	sets.idle.with_buff['doom'] = {ring1="Saida Ring", ring2="Saida Ring"}
	sets.idle.with_buff['reive mark'] = {neck="Ygnas's Resolve +1"}
	
	sets.idle.with_pet = {
		ammo="Pet Food Eta",
	}
	
	sets.resting = {}
	
	sets.defense.DT = {	--DT-15%, PDT-5%, MDT-4%	=> PDT-20%, MDT-19%
		neck="Twilight Torque",
		ring1="Defending Ring",		ring2="Dark Ring"
	}
	sets.defense.PDT = combineSets(sets.defense.DT, {
	})
	sets.defense.MDT = combineSets(sets.defense.DT, {
	})
	
	sets.defense.HP = sets.defense.PDT

	--============================================================
	
	sets.weapons.Main = {main="Kumbhakarna",sub="Hunahpu"}
	
	sets.engaged = {									ammo="Jukukik Feather",
		head="Highwing Helm",	neck="Asperity Necklace",	ear1="Dudgeon Earring",	ear2="Heartseeker Earring",
		body="Xaddi Mail",	hands="Regimen Mittens",	ring1="Rajas Ring",	ring2="Epona's Ring",
		back="Atheling Mantle",	waist="Patentia Sash",		legs="Taeon Tights",	feet="Taeon Boots"
	}
	
	sets.engaged.MediumAcc = {								ammo="Jukukik Feather",
		head="Yaoyotl Helm",	neck="Agitator's Collar",	ear1="Dudgeon Earring",	ear2="Heartseeker Earring",
		body="Xaddi Mail",	hands="Taeon Gloves",		ring1="Rajas Ring",	ring2="Epona's Ring",
		back="Atheling Mantle",	waist="Patentia Sash",		legs="Taeon Tights",	feet="Taeon Boots"
	}
	
	sets.engaged.HighAcc = {							ammo="Jukukik Feather",
		head="Yaoyotl Helm",	neck="Peacock Amulet",	ear1="Dudgeon Earring",	ear2="Heartseeker Earring",
		body="Xaddi Mail",	hands="Taeon Gloves",	ring1="Rajas Ring",	ring2="Mars's Ring",
		back="Kayapa Cape",	waist="Anguinus Belt",	legs="Taeon Tights",	feet="Taeon Boots"
	}
	sets.engaged.with_buff = {}
	sets.engaged.with_buff['doom'] = {ring1="Saida Ring", ring2="Saida Ring"}
	sets.engaged.with_buff['reive mark'] = {neck="Ygnas's Resolve +1"}
end