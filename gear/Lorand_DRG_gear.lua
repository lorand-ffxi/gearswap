--------------------------------------------------------------------------------
--[[
	Author: Ragnarok.Lorand
--]]
--------------------------------------------------------------------------------

function init_gear_sets()
	--============================================================
	--			Precast sets
	--============================================================
	sets.precast.JA['Spirit Link'] = {hands="Lancer's Vambraces +2"}
	sets.precast.JA.Jump = {
		ammo="Hagneia Stone",
		head="Yaoyotl Helm",	neck="Asperity Necklace",	ear1="Bladeborn Earring",	ear2="Steelflash Earring",
		body="Xaddi Mail",	hands="Taeon Gloves",		ring1="Rajas Ring",		ring2="K'ayres Ring",
		back="Atheling Mantle",	waist="Anguinus Belt",		legs="Cizin Breeches +1",	feet="Cizin Greaves +1"
	}	
	sets.precast.JA['High Jump'] = combineSets(sets.precast.JA.Jump, {})
	sets.precast.JA['Super Jump'] = combineSets(sets.precast.JA.Jump, {})
	sets.precast.JA['Spirit Jump'] = combineSets(sets.precast.JA.Jump, {legs="Lancer's Cuissots +2", feet="Lancer's Schynbalds +2"})
	sets.precast.JA['Soul Jump'] = combineSets(sets.precast.JA.Jump, {legs="Lancer's Cuissots +2"})
	
	sets.precast.FC = {
		head="Cizin Helm +1",	neck="Orunmila's Torque",	ear1="Loquacious Earring",
		body="Nuevo Coselete",	hands="Buremte Gloves",		ring1="Prolix Ring",	ring2="Veneficium Ring",
		legs="Enif Cosciales",	feet="Ejekamal Boots"
	}
	
	sets.precast.Waltz = {}
	sets.precast.Waltz['Healing Waltz'] = {}
	sets.precast.Ranged = {}
	
	--============================================================
	--sets.wsBase[magic][sam/other][state.OffenseMode][state.RangedMode][wsmod[spell.en]]
	sets.wsBase = {											ammo="Potestas Bomblet",
		head="Highwing Helm",	neck="Asperity Necklace",	ear1="Bladeborn Earring",	ear2="Steelflash Earring",
		body="Phorcys Korazin",	hands="Taeon Gloves",		ring1="Rajas Ring",		ring2="K'ayres Ring",
		back="Atheling Mantle",	waist="Fotia Belt",		legs="Cizin Breeches +1",	feet="Whirlpool Greaves"
	}
	
	sets.wsBase.magic = {
		ammo="Dosis Tathlum",
		ring1="Fenrir Ring +1",		ring2="Acumen Ring",
	}
	
	--============================================================
	--			Midcast sets
	--============================================================

	sets.midcast.FastRecast = {
		neck="Orunmila's Torque",	ear1="Loquacious Earring",
		hands="Buremte Gloves",		ring1="Prolix Ring",		ring2="Diamond Ring",	--Diamond Ring aug: 2% interrupt rate down
		waist="Cetl Belt",
	}
	
	sets.midcast.Cure = {}
	sets.midcast.Cure.with_buff = {}
	sets.midcast.Cure.with_buff['reive mark'] = {neck="Arciela's Grace +1"}
	
	--============================================================
	--			Other sets
	--============================================================
	
	sets.weapons.Main = {main="Qatsunoci +2",sub="Pole Grip"}
	
	sets.engaged = {										ammo="Potestas Bomblet",
		head="Highwing Helm",	neck="Asperity Necklace",	ear1="Bladeborn Earring",	ear2="Steelflash Earring",
		body="Xaddi Mail",	hands="Taeon Gloves",		ring1="Rajas Ring",		ring2="K'ayres Ring",
		back="Atheling Mantle",	waist="Windbuffet Belt +1",	legs="Cizin Breeches +1",	feet="Whirlpool Greaves"
	}
	
	sets.engaged.MediumAcc = {									ammo="Potestas Bomblet",
		head="Yaoyotl Helm",	neck="Peacock Amulet",		ear1="Bladeborn Earring",	ear2="Steelflash Earring",
		body="Xaddi Mail",	hands="Taeon Gloves",		ring1="Rajas Ring",		ring2="K'ayres Ring",
		back="Updraft Mantle",	waist="Windbuffet Belt +1",	legs="Cizin Breeches +1",	feet="Whirlpool Greaves"
	}
	
	sets.engaged.HighAcc = {									ammo="Potestas Bomblet",
		head="Yaoyotl Helm",	neck="Peacock Amulet",		ear1="Bladeborn Earring",	ear2="Steelflash Earring",
		body="Xaddi Mail",	hands="Taeon Gloves",		ring1="Rajas Ring",		ring2="K'ayres Ring",
		back="Updraft Mantle",	waist="Anguinus Belt",		legs="Cizin Breeches +1",	feet="Whirlpool Greaves"
	}
	
	sets.engaged.with_buff = {}
	sets.engaged.with_buff['doom'] = {ring1="Saida Ring", ring2="Saida Ring"}
	sets.engaged.with_buff['reive mark'] = {neck="Ygnas's Resolve +1"}

	--============================================================
	
	sets.resting = {}
	
	sets.idle = {										ammo="Demonry Stone",
		head="Highwing Helm",	neck="Orochi Nodowa",	ear1="Brachyura Earring",	ear2="Ethereal Earring",
		body="Xaddi Mail",	hands="Umuthi Gloves",	ring1="Defending Ring",		ring2="Shneddick Ring",
		back="Repulse Mantle",	waist="Nierenschutz",	legs="Cizin Breeches +1",	feet="Whirlpool Greaves"
	}
	sets.idle.with_buff = {}
	sets.idle.with_buff['doom'] = {ring1="Saida Ring", ring2="Saida Ring"}
	sets.idle.with_buff['reive mark'] = {neck="Ygnas's Resolve +1"}
	
	sets.defense.DT = {	--DT-18%, PDT-5%, MDT-4%	=> PDT-23%, MDT-22%
		neck="Twilight Torque",
		ring1="Defending Ring",		ring2="Dark Ring",
		waist="Nierenschutz"
	}
	
	sets.defense.PDT = set_combine(sets.defense.DT, {	--PDT-19% + DT => PDT-39%
		head="Cizin Helm +1",
		body="Cizin Mail +1",	hands="Cizin Mufflers +1",	
		back="Repulse Mantle",	waist="Flume Belt",			legs="Cizin Breeches +1",	feet="Cizin Greaves +1"
	})
	sets.defense.MDT = set_combine(sets.defense.DT, {	--MDT-4% + DT => MDT-26%, MDB+18
		ammo="Demonry Stone",
		head="Cizin Helm +1",	ear1="Merman's Earring",	ear2="Merman's Earring",
		body="Cizin Mail +1",	hands="Cizin Mufflers +1",
		back="Tuilha Cape",	legs="Cizin Breeches +1",	feet="Whirlpool Greaves"
	})
end