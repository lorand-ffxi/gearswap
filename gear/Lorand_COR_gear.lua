------------------------------------------------------------------------------------------------------------------------
--[[
	Author: Ragnarok.Lorand
--]]
------------------------------------------------------------------------------------------------------------------------

function init_gear_sets()
	sets.weapons = {}
	sets.weapons.Gun = {main="Sabebus",sub="Atoyac",range="Doomsday",ammo="Eminent Bullet",ammo2="Adlivun Bullet"}
	
	sets.enmityDown = {
		neck="Orunmila's Torque",	ear1="Novia Earring",	ear2="Psystorm Earring",
		hands="Iuitl Wristbands +1",	ring1="Prolix Ring",	ring2="Sangoma Ring",
		waist="Elanid Belt",		legs="Laksamana's Trews"
	}
	
	sets.precast.JA['Quick Draw'] = {									ammo="Animikii Bullet",
		head="Corsair's Tricorne +1",	neck="Stoicheion Medal",	ear1="Friomisi Earring",	ear2="Hecate's Earring",
		body="Iuitl Vest +1",		hands="Taeon Gloves",		ring1="Fenrir Ring +1",		ring2="Acumen Ring",
		back="Gunslinger's Cape",	waist="Elanid Belt",		legs="Shneddick Tights +1",	feet="Navarch's Bottes +2"
	}
	--Syntax: sets.precast.CorsairShot[MAB/shot name]
	sets.precast.CorsairShot = {}
	sets.precast.CorsairShot.MAB = {
		ammo="Animikii Bullet",
		head="Corsair's Tricorne +1",	neck="Stoicheion Medal",	ear1="Friomisi Earring",	ear2="Hecate's Earring",
		body="Iuitl Vest +1",		hands="Taeon Gloves",		ring1="Fenrir Ring +1",		ring2="Acumen Ring",
		back="Gunslinger's Cape",	waist="Elanid Belt",		legs="Shneddick Tights +1",	feet="Navarch's Bottes +2"
	}
	
	sets.precast.JA['Triple Shot'] = {body="Navarch's Frac +2"}
	sets.precast.JA['Random Deal'] = {body="Commodore Frac"}

	sets.precast.CorsairRoll = combineSets(sets.enmityDown, {
		head="Commodore Tricorne",
		hands="Navarch's Gants +2",	ring1="Luzaf's Ring",	ring2="Barataria Ring",
	})
	sets.precast.CorsairRoll["Caster's Roll"] =	{legs="Navarch's Culottes +2"}
	sets.precast.CorsairRoll["Courser's Roll"] =	{feet="Navarch's Bottes +2"}
	sets.precast.CorsairRoll["Blitzer's Roll"] =	{head="Navarch's Tricorne +2"}
	sets.precast.CorsairRoll["Tactician's Roll"] =	{body="Navarch's Frac +2"}
	sets.precast.CorsairRoll["Allies' Roll"] =	{hands="Navarch's Gants +2"}
	
	sets.precast.FC = {
		head="Anwig Salade",		neck="Orunmila's Torque",	ear1="Loquacious Earring",
		body="Taeon Tabard",		hands="Thaumas Gloves",		ring1="Prolix Ring",		ring2="Veneficium Ring",
		legs="Quiahuiz Trousers"
	}
	sets.precast.FC.Utsusemi = {neck="Magoraga Bead Necklace"}

	--============================================================

	sets.precast.ranged = {
		head="Uk'uxkaj Cap",
		body="Laksamana's Frac",	hands="Iuitl Wristbands +1",
		back="Navarch's Mantle",	waist="Impulse Belt",		legs="Nahtirah Trousers"
	}
	
	--============================================================
	--			TP & WS sets
	--============================================================
	
	sets.wsBase = {
		head="Taeon Chapeau",		neck="Ocachi Gorget",		ear1="Clearview Earring",	ear2="Volley Earring",
		body="Taeon Tabard",		hands="Iuitl Wristbands +1",	ring1="Longshot Ring",		ring2="Paqichikaji Ring",
		back="Gunslinger's Cape",	waist="Elanid Belt",		legs="Nahtirah Trousers",	feet="Scopuli Nails +1"
	}
	
	sets.wsBase.STR = {
		head="Whirlpool Mask",
		ring1="Rajas Ring",	ring2="Pyrosoul Ring",
		back="Buquwik Cape",	waist="Prosilio Belt"
	}
	sets.wsBase.DEX = {
		ring1="Rajas Ring",	ring2="Thundersoul Ring",
		back="Kayapa Cape",	waist="Chiner's Belt"
	}
	
	sets.wsBase.Magic = {
		head="Taeon Chapeau",		neck="Stoicheion Medal",	ear1="Friomisi Earring",	ear2="Hecate's Earring",
		body="Taeon Tabard",		hands="Taeon Gloves",		ring1="Fenrir Ring +1",		ring2="Acumen Ring",
		back="Gunslinger's Cape",	waist="Fotia Belt",		legs="Shneddick Tights +1",	feet="Taeon Boots"
	}
	
	--============================================================
	--Syntax: sets.midcast.ranged[sam/other][modes.ranged]
	
	sets.midcast.ranged = {
		head="Taeon Chapeau",		neck="Ocachi Gorget",		ear1="Clearview Earring",	ear2="Volley Earring",
		body="Iuitl Vest +1",		hands="Iuitl Wristbands +1",	ring1="Longshot Ring",		ring2="Paqichikaji Ring",
		back="Gunslinger's Cape",	waist="Elanid Belt",		legs="Nahtirah Trousers",	feet="Scopuli Nails +1"
	}
	sets.midcast.ranged.sam = {}
	sets.midcast.ranged.other = {}
	sets.midcast.ranged.other.Accuracy = {
		head="Taeon Chapeau",		neck="Iqabi Necklace",		ear1="Clearview Earring",	ear2="Volley Earring",
		body="Iuitl Vest +1",		hands="Iuitl Wristbands +1",	ring1="Longshot Ring",		ring2="Paqichikaji Ring",
		back="Gunslinger's Cape",	waist="Elanid Belt",		legs="Nahtirah Trousers",	feet="Scopuli Nails +1"
	}
	
	sets.midcast.FastRecast = {
		head="Iuitl Headgear +1",	neck="Orunmila's Torque",	ear1="Loquacious Earring",	ear2="Novia Earring",
		body="Taeon Tabard",		hands="Thaumas Gloves",		ring1="Prolix Ring",		ring2="Veneficium Ring",
		back="Mujin Mantle",		waist="Cetl Belt",		legs="Laksamana's Trews",	feet="Taeon Boots",
	}
	
	sets.midcast.Cure = {}
	
	--============================================================
	--			Other sets
	--============================================================
	sets.resting = {}
	
	sets.idle = {
		head="Ocelomeh Headpiece +1",	neck="Orochi Nodowa",		ear1="Brachyura Earring",	ear2="Ethereal Earring",
		body="Qaaxo Harness",		hands="Umuthi Gloves",		ring1="Defending Ring",		ring2="Shneddick Ring",
		back="Repulse Mantle",		waist="Flume Belt",		legs="Laksamana's Trews",	feet="Iuitl Gaiters +1"
	}
	sets.idle.with_buff = {}
	sets.idle.with_buff['doom'] = {ring1="Saida Ring", ring2="Saida Ring"}
	sets.idle.with_buff['reive mark'] = {neck="Ygnas's Resolve +1"}
	
	sets.defense.DT = {	--DT-5%, PDT-10%, MDT-7%	=> PDT-15%, MDT-12%
		neck="Twilight Torque",
		ring1="Defending Ring",		ring2="Dark Ring"
	}
	sets.defense.PDT = set_combine(sets.defense.Evasion, sets.defense.DT, {	--PDT-18% + DT => PDT-33%
		head="Iuitl Headgear +1",
		body="Iuitl Vest +1",	hands="Iuitl Wristbands +1",
		back="Repulse Mantle",	waist="Flume Belt",		legs="Iuitl Tights +1",	feet="Iuitl Gaiters +1"
	})
	sets.defense.MDT = set_combine(sets.defense.Evasion, sets.defense.DT, {	--MDT-4% + DT => MDT-16%, MDB+19
		head="Ejekamal Mask",	ear1="Merman's Earring",	ear2="Merman's Earring",
		body="Iuitl Vest +1",	hands="Umuthi Gloves",
		back="Tuilha Cape",	waist="Flume Belt",		legs="Kaabnax Trousers",	feet="Iuitl Gaiters +1"
	})
	
	sets.engaged = {
		head="Whirlpool Mask",	neck="Orochi Nodowa",		ear1="Dudgeon Earring",	ear2="Heartseeker Earring",
		body="Qaaxo Harness",	hands="Taeon Gloves",		ring1="Rajas Ring",	ring2="Epona's Ring",
		back="Atheling Mantle",	waist="Windbuffet Belt +1",	legs="Taeon Tights",	feet="Taeon Boots",
	}
	
	sets.engaged.Accuracy = {
		head="Whirlpool Mask",	neck="Orochi Nodowa",	ear1="Dudgeon Earring",	ear2="Heartseeker Earring",
		body="Iuitl Vest +1",	hands="Taeon Gloves",	ring1="Rajas Ring",	ring2="Epona's Ring",
		back="Kayapa Cape",	waist="Anguinus Belt",	legs="Taeon Tights",	feet="Taeon Boots",
	}
	
	sets.engaged.with_buff = {}
	sets.engaged.with_buff['doom'] = {ring1="Saida Ring", ring2="Saida Ring"}
	sets.engaged.with_buff['reive mark'] = {neck="Ygnas's Resolve +1"}
end