------------------------------------------------------------------------------------------------------------------------
--[[
	Author: Ragnarok.Lorand
--]]
------------------------------------------------------------------------------------------------------------------------

function init_gear_sets()
	--==============================================================================================================
	--						Precast sets
	--==============================================================================================================
	
	sets.precast.Samba = {head="Dancer's Tiara"}
	sets.precast.Jig = {legs="Etoile Tights", feet="Dancer's Toe Shoes +1"}
	
	sets.precast.Waltz = {											ammo="Bibiki Seashell",
		head="Etoile Tiara",		neck="Orunmila's Torque",	ear1="Roundel Earring",		ear2="Novia Earring",
		body="Dancer's Casaque",	hands="Umuthi Gloves",		ring1="Terrasoul Ring",		ring2="Spiral Ring",
		back="Toetapper Mantle",	waist="Fotia Belt",		legs="Nahtirah Trousers",	feet="Taeon Boots"
	}	-- Waltz Potency + 25%
	
	sets.precast.Step = {										ammo="Honed Tathlum",
		head="Whirlpool Mask",		neck="Iqabi Necklace",	ear1="Heartseeker Earring",	ear2="Steelflash Earring",
		body="Iuitl Vest +1",		hands="Taeon Gloves",	ring1="Rajas Ring",		ring2="Mars's Ring",
		back="Toetapper Mantle",	waist="Anguinus Belt",	legs="Taeon Tights",		feet="Taeon Boots"
	}
	sets.precast.Step['Feather Step'] = {feet="Charis Toe Shoes +2"}
	
	sets.precast.Flourish1 = {	--Animated, Desperate, Violent;	offensive - use Magic Acc
		neck="Sanctity Necklace",	ear1="Lifestorm Earring",	ear2="Psystorm Earring",
		hands="Taeon Gloves",		ring1="Sangoma Ring",		ring2="Perception Ring",
		legs="Iuitl Tights +1",		feet="Iuitl Gaiters +1"
	}
	sets.precast.Flourish1['Violent Flourish'] = {body="Etoile Casaque"}
	
	sets.precast.Flourish2 = {}	--Wild, Building, Reverse
	sets.precast.Flourish2['Reverse Flourish'] = {hands="Charis Bangles +2"}
	
	sets.precast.Flourish3 = {}	--Climactic, Striking, Ternary
	sets.precast.Flourish3['Climactic Flourish'] = {head="Charis Tiara +2"}
	sets.precast.Flourish3['Striking Flourish'] = {body="Charis Casaque +2"}
	
	--==============================================================================================================
	
	sets.precast.FC = {											ammo="Impatiens",
		head="Haruspex Hat",		neck="Orunmila's Torque",	ear1="Loquacious Earring",
		body="Taeon Tabard",		hands="Thaumas Gloves",		ring1="Prolix Ring",		ring2="Veneficium Ring",
		legs="Quiahuiz Trousers"
	}
	sets.precast.FC.Utsusemi = {neck="Magoraga Bead Necklace"}

	--==============================================================================================================
	
	sets.precast.ranged = {}

	sets.wsBase = {											ammo="Potestas Bomblet",
		head="Taeon Chapeau",	neck="Asperity Necklace",	ear1="Bladeborn Earring",	ear2="Steelflash Earring",
		body="Qaaxo Harness",	hands="Taeon Gloves",		ring1="Rajas Ring",		ring2="Epona's Ring",
		back="Bleating Mantle",	waist="Fotia Belt",		legs="Taeon Tights",		feet="Taeon Boots",
	}

	sets.wsBase.Magic = {										ammo="Dosis Tathlum",
		head="Highwing Helm",	neck="Sanctity Necklace",	ear1="Friomisi Earring",	ear2="Hecate's Earring",
		body="Taeon Tabard",	hands="Taeon Gloves",		ring1="Fenrir Ring +1",		ring2="Acumen Ring",
		back="Toro Cape",	waist="Fotia Belt",		legs="Shneddick Tights +1",	feet="Taeon Boots"
	}
	
	--==============================================================================================================
	--						Midcast sets
	--==============================================================================================================
	
	sets.midcast.FastRecast = {									ammo="Impatiens",
		head="Taeon Chapeau",	neck="Orunmila's Torque",	ear1="Loquacious Earring",	ear2="Novia Earring",
		body="Taeon Tabard",	hands="Umuthi Gloves",		ring1="Prolix Ring",		ring2="Veneficium Ring",
		back="Repulse Mantle",	waist="Flume Belt",		legs="Quiahuiz Trousers",	feet="Iuitl Gaiters +1"
	}
	sets.midcast.Utsusemi = {back="Mujin Mantle"}

	sets.midcast.ranged = {}
	
	--==============================================================================================================
	--						Other sets
	--==============================================================================================================
	
	sets.weapons.Other = {}
	sets.weapons.OAT = {main='Izhiikoh',sub='Atoyac'}
	sets.weapons.Accuracy = {main='Izhiikoh',sub='Sabebus'}
	
	sets.resting = {}
	
	sets.idle = {											ammo="Demonry Stone",
		head="Ocelomeh Headpiece +1",	neck="Sanctity Necklace",	ear1="Brachyura Earring",	ear2="Ethereal Earring",
		body="Qaaxo Harness",		hands="Umuthi Gloves",	ring1="Defending Ring",		ring2="Shneddick Ring",
		back="Repulse Mantle",		waist="Flume Belt",	legs="Taeon Tights",		feet="Iuitl Gaiters +1",
	}
	sets.idle.with_buff = {}
	sets.idle.with_buff['doom'] = {ring1="Saida Ring", ring2="Saida Ring"}
	sets.idle.with_buff['reive mark'] = {neck="Ygnas's Resolve +1"}
	
	sets.defense.Evasion = {
		head="Taeon Chapeau",		neck="Torero Torque",		ear1="Novia Earring",	ear2="Ethereal Earring",
		body="Qaaxo Harness",		hands="Umuthi Gloves",		ring1="Defending Ring",	ring2="Dark Ring",
		back="Toetapper Mantle",	waist="Sveltesse Gouriz",	legs="Taeon Tights",	feet="Taeon Boots"
	}

	sets.defense.DT = combineSets(sets.defense.Evasion,{
		neck="Twilight Torque",
		body="Iuitl Vest +1",	ring1="Defending Ring",	ring2="Dark Ring"
	})
	
	sets.defense.PDT = combineSets(sets.defense.DT, {
		head="Iuitl Headgear +1",
		hands="Umuthi Gloves",
		back="Repulse Mantle",		waist="Flume Belt",	legs="Iuitl Tights +1",	feet="Iuitl Gaiters +1"
	})

	sets.defense.MDT = combineSets(sets.defense.DT, {			ammo="Demonry Stone",
		head="Iuitl Headgear +1",	ear1="Merman's Earring",	ear2="Merman's Earring",
		hands="Umuthi Gloves",
		back="Tuilha Cape",		legs="Iuitl Tights +1",		feet="Iuitl Gaiters +1"
	})

	--==============================================================================================================
	
	sets.engaged.with_buff['doom'] = {ring1="Saida Ring", ring2="Saida Ring"}
	sets.engaged.with_buff['reive mark'] = {neck="Ygnas's Resolve +1"}
	
	--[[	dnc DW base: 30%
		charis necklace: 3%	earrings: 7%	sash: 5%	taeon feet: 7%
		52% - only need to worry in II+
	--]]
	sets.engaged.auto = {									ammo="Potestas Bomblet",
		head="Taeon Chapeau",	neck="Charis Necklace",	ear1="Heartseeker Earring",	ear2="Dudgeon Earring",
		body="Qaaxo Harness",	hands="Taeon Gloves",	ring1="Rajas Ring",		ring2="Epona's Ring",
		back="Bleating Mantle",	waist="Patentia Sash",	legs="Taeon Tights",		feet="Taeon Boots"
	}
	sets.engaged.auto['na'] =	{}	--25% haste, 72% DW max
	sets.engaged.auto['I'] =	{}	--40% haste, 67% DW max
	sets.engaged.auto['I+'] =	{}	--50% haste, 60% DW max
	sets.engaged.auto['II'] =	{}	--55% haste, 56% DW max
	--65%+ haste, 43% or less max DW
	sets.engaged.auto['II+'] =	{neck="Asperity Necklace", ear1="Bladeborn Earring", ear2="Steelflash Earring"}
	
	sets.engaged.auto_acc = {									ammo="Honed Tathlum",
		head="Taeon Chapeau",		neck="Charis Necklace",	ear1="Heartseeker Earring",	ear2="Dudgeon Earring",
		body="Iuitl Vest +1",		hands="Taeon Gloves",	ring1="Rajas Ring",		ring2="Epona's Ring",
		back="Toetapper Mantle",	waist="Patentia Sash",	legs="Taeon Tights",		feet="Taeon Boots"
	}
	sets.engaged.auto_acc['na'] =	{}
	sets.engaged.auto_acc['I'] =	{}
	sets.engaged.auto_acc['I+'] =	{}
	sets.engaged.auto_acc['II'] =	{}
	sets.engaged.auto_acc['II+'] =	{neck="Asperity Necklace", ear1="Bladeborn Earring", ear2="Steelflash Earring"}
	
	sets.engaged.CrazyAccuracy = {									ammo="Honed Tathlum",
		head="Whirlpool Mask",		neck="Iqabi Necklace",	ear1="Heartseeker Earring",	ear2="Dudgeon Earring",
		body="Iuitl Vest +1",		hands="Taeon Gloves",	ring1="Rajas Ring",		ring2="Mars's Ring",
		back="Toetapper Mantle",	waist="Anguinus Belt",	legs="Taeon Tights",		feet="Taeon Boots"
	}
end