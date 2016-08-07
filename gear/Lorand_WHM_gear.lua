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
	
	sets.precast.FC = {			--54%
		ammo="Incantor Stone",		--2%
		head="Nahtirah Hat",		--10%
		neck="Orunmila's Torque",	--5%
		ear1="Loquacious Earring",	--2%
		body="Marduk's Jubbah +1",	--11%
		hands="Gendewitha Gages +1",	--7%
		ring1="Prolix Ring",		--2%
		back="Swith Cape",		--3%
		waist="Witful Belt",		--3%
		legs="Artsieq Hose",		--5%
		feet="Chelona Boots"		--4%
	}
		
	sets.precast.FC.EnhancingMagic = {	--53%
		waist="Siegel Sash"		--8%
	}
	sets.precast.FC.HealingMagic = {	--55%
		legs="Orison Pantaloons +2"	--12%
	}
	sets.precast.FC.Cure = {		--68%
		main="Tamaxchi",		--0%
		sub="Genbu's Shield",		--8%
		back="Pahtli Cape",		--8%
	}
	
	sets.precast.FC.Lightning = {main="Apamajas I"}
	
	--============================================================
	
	sets.precast.JA.Benediction = {body="Piety Briault"}
	sets.precast.JA.Martyr = {hands="Piety Mitts"}

	sets.precast.Waltz = {}
	
	--============================================================
	
	sets.wsBase = {
		ammo="Jukukik Feather",
		head="Telchine Cap",		neck="Asperity Necklace",	ear1="Bladeborn Earring",	ear2="Steelflash Earring",
		body="Theophany Briault +1",	hands="Dynasty Mitts",		ring1="Rajas Ring",		ring2="Pyrosoul Ring",
		back="Buquwik Cape",		waist="Windbuffet Belt +1",	legs="Telchine Braconi",	feet="Gendewitha Galoshes +1"
	}
	
	sets.wsBase.Magic = {
		ammo="Dosis Tathlum",
		head="Buremte Hat",	neck="Eddy Necklace",	ear1="Hecate's Earring",	ear2="Friomisi Earring",
		body="Artsieq Jubbah",	hands="Otomi Gloves",	ring1="Fenrir Ring +1",		ring2="Acumen Ring",
		back="Toro Cape",	waist="Aswang Sash",	legs="Gendewitha Spats +1",	feet="Theophany Duckbills"
	}
	
	--============================================================
	--			Midcast sets
	--============================================================
	
	sets.midcast.FastRecast = {
		main="Venabulum",		sub="Achaq Grip",						ammo="Impatiens",
		head="Nahtirah Hat",		neck="Orunmila's Torque",	ear1="Loquacious Earring",	ear2="Novia Earring",
		body="Theophany Briault +1",	hands="Otomi Gloves",		ring1="Prolix Ring",		ring2="Diamond Ring",
		back="Swith Cape",		waist="Witful Belt",		legs="Artsieq Hose",		feet="Theophany Duckbills"
	}
	
	sets.midcast.MagicAccuracy = {
		main="Lehbrailg +2",	sub="Mephitis Grip",					ammo="Kalboron Stone",
		head="Nahtirah Hat",	neck="Eddy Necklace",	ear1="Lifestorm Earring",	ear2="Psystorm Earring",
		body="Artsieq Jubbah",	hands="Lurid Mitts",	ring1="Sangoma Ring",		ring2="Perception Ring",
		back="Ogapepo Cape",	waist="Ovate Rope",	legs="Artsieq Hose",		feet="Artsieq Boots"
	}

	--====================== Healing =============================
	
	sets.midcast.HealingMagic = {
		neck="Colossus's Torque",
		body="Orison Bliaud +2",	hands="Theophany Mitts",
		legs="Piety Pantaloons"
	}
	
	sets.midcast.Cure = {
		main="Tamaxchi",		sub="Genbu's Shield",						ammo="Incantor Stone",
		head="Gendewitha Caubeen +1",	neck="Orunmila's Torque",	ear1="Loquacious Earring",	ear2="Roundel Earring",
		body="Orison Bliaud +2",	hands="Telchine Gloves",	ring1="Prolix Ring",		ring2="Aquasoul Ring",
		back="Swith Cape",		waist="Cetl Belt",		legs="Orison Pantaloons +2",	feet="Theophany Duckbills"
	}
	sets.midcast.Curaga = sets.midcast.Cure

	sets.midcast.Cursna = {
		hands="Hieros Mittens",
		legs="Theophany Pantaloons",	feet="Gendewitha Galoshes +1"
	}

	sets.midcast.StatusRemoval = {
		head="Orison Cap +2"
	}
	sets.midcast.StatusRemoval['Divine Caress'] = {
		hands="Orison Mitts +2"
	}

	--====================== Enhancing ===========================
	
	sets.midcast.EnhancingMagic = {
		neck="Colossus's Torque",
		body="Telchine Chasuble",	hands="Dynasty Mitts",
		waist="Cascade Belt",		legs="Piety Pantaloons",	feet="Orison Duckbills +2"
	}
	
	sets.midcast.Stoneskin = {
		neck="Stone Gorget",	ear1="Lifestorm Earring",	ear2="Earthcry Earring",
		ring2="Aquasoul Ring",
		back="Tuilha Cape",	waist="Siegel Sash",		legs="Haven Hose"
	}
	sets.midcast.Auspice = {feet="Orison Duckbills +2"}
	sets.midcast.Aquaveil = {waist="Emphatikos Rope"}

	sets.midcast.BarElement = {
		head="Orison Cap +2",
		body="Orison Bliaud +2",	hands="Orison Mitts +2",
		legs="Piety Pantaloons",	feet="Orison Duckbills +2"
	}

	sets.midcast.Regen = {
		body="Piety Briault",		hands="Orison Mitts +2",
		legs="Theophany Pantaloons"
	}
	
	sets.midcast.Protectra = {
		ring2="Sheltered Ring",
		feet="Piety Duckbills"
	}
	sets.midcast.Shellra = {
		ring2="Sheltered Ring",
		legs="Piety Pantaloons"
	}
	
	--====================== Offensive ===========================	
	
	sets.midcast.DivineMagic = {
		--hands="Piety Mitts",
		--legs="Theophany Pantaloons"
	}
				
	sets.midcast.DivineMagic.Nuke = {
		main="Venabulum",	sub="Zuuxowu Grip",					ammo="Dosis Tathlum",
		head="Buremte Hat",	neck="Eddy Necklace",	ear1="Hecate's Earring",	ear2="Friomisi Earring",
		body="Artsieq Jubbah",	hands="Otomi Gloves",	ring1="Fenrir Ring +1",		ring2="Acumen Ring",
		back="Toro Cape",	waist="Cascade Belt",	legs="Gendewitha Spats +1",	feet="Gendewitha Galoshes +1"
	}
	
	sets.midcast.DarkMagic = {}

	sets.midcast.EnfeeblingMagic = {
		main="Lehbrailg +2",		sub="Mephitis Grip",
		body="Theophany Briault +1",
		--feet="Theophany Duckbills"
	}
	sets.midcast.EnfeeblingMagic.Potency = {
		ring2="Aquasoul Ring",
		waist="Cascade Belt",	feet="Uk'uxkaj Boots"
	}
	sets.midcast.EnfeeblingMagic.Potency.Resistant = {}
	
	sets.midcast.ElementalMagic = {
		main="Venabulum",	sub="Zuuxowu Grip",					ammo="Dosis Tathlum",
		head="Buremte Hat",	neck="Eddy Necklace",	ear1="Hecate's Earring",	ear2="Friomisi Earring",
		body="Artsieq Jubbah",	hands="Otomi Gloves",	ring1="Fenrir Ring +1",		ring2="Acumen Ring",
		back="Toro Cape",	waist="Aswang Sash",	legs="Gendewitha Spats +1",	feet="Gendewitha Galoshes +1"
	}
	sets.midcast.ElementalMagic.LowTier = {}
	sets.midcast.ElementalMagic.HighTier = {}
	sets.midcast.ElementalMagic.Earth = {neck="Quanpur Necklace"}
	
	sets.midcast.ElementalEnfeeble = {}
	
	--============================================================
	--			Other sets
	--============================================================
	
	sets.resting = {
		main="Chatoyant Staff",		sub="Elder's Grip",						ammo="Kalboron Stone",
		head="Nahtirah Hat",		neck="Eidolon Pendant",		ear1="Loquacious Earring",	ear2="Relaxing Earring",
		body="Gendewitha Bliaut +1",	hands="Nares Cuffs",		ring1="Defending Ring",		ring2="Sheltered Ring",
		back="Felicitas Cape",		waist="Fucho-no-obi",	legs="Nares Trews",		feet="Chelona Boots"
	}

	sets.idle = {
		main="Bolelabunga",	sub="Genbu's Shield",						ammo="Incantor Stone",
		head="Nahtirah Hat",	neck="Twilight Torque",		ear1="Brachyura Earring",	ear2="Ethereal Earring",
		body={"Theophany Briault +1", "Artsieq Jubbah"},
		hands="Dynasty Mitts",	ring1="Defending Ring",		ring2="Shneddick Ring",
		back="Repulse Mantle",	waist="Fucho-no-obi",	legs="Artsieq Hose",		feet="Gendewitha Galoshes +1"
	}
	
	sets.idle.CapFarm = {back="Mecistopins Mantle"}
	sets.idle.lowMP = {waist="Fucho-no-obi", legs="Nares Trews"}
	sets.idle.lowMP_night =	{hands="Serpentes Cuffs"}
	sets.idle.lowMP_day = {feet="Serpentes Sabots"}
	
	sets.idle.with_buff = {}
	sets.idle.with_buff['doom'] = {ring1="Saida Ring", ring2="Saida Ring"}
	
	sets.defense.DT = {
		head="Kaabnax Hat",	neck="Twilight Torque",
		ring1="Defending Ring",	ring2="Dark Ring",
	}
	sets.defense.PDT = combineSets(sets.defense.DT, {
		main="Terra's Staff",
		head="Kaabnax Hat",
		body="Gendewitha Bliaut +1",	hands="Gendewitha Gages +1",
		back="Repulse Mantle",		legs="Gendewitha Spats +1"
	})
	sets.defense.MDT = combineSets(sets.defense.DT, {
		main="Chatoyant Staff",
		ear1="Merman's Earring",	ear2="Merman's Earring",
		body="Gendewitha Bliaut +1",	hands="Dynasty Mitts",
		back="Tuilha Cape",		legs="Gendewitha Spats +1",	feet="Uk'uxkaj Boots"
	})
	
	sets.engaged = {										ammo="Jukukik Feather",
		head="Telchine Cap",	neck="Asperity Necklace",	ear1="Dudgeon Earring",		ear2="Heartseeker Earring",
		body="Helios Jacket",	hands="Telchine Gloves",	ring1="Rajas Ring",		ring2="Mars's Ring",
		back="Kayapa Cape",	waist="Cetl Belt",		legs="Telchine Braconi",	feet="Gendewitha Galoshes +1"
	}
	sets.engaged.with_buff = {}
	sets.engaged.with_buff['doom'] = {ring1="Saida Ring", ring2="Saida Ring"}
	sets.engaged.with_buff['reive mark'] = {neck="Ygnas's Resolve +1"}
end