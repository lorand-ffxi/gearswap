-----------------------------------------------------------------------------------------------------------
--[[
	Author: Ragnarok.Lorand
	
--]]
-----------------------------------------------------------------------------------------------------------


function init_gear_sets()
	sets.weapons = {}
	sets.weapons.Gun = {range="Hgafircian +2",ammo="Adlivun Bullet"}
	-- gear.Gun = "Hgafircian +2"
	-- gear['Gun_ammo'] = "Adlivun Bullet"
	-- gear['Gun_ammo_RA'] = "Adlivun Bullet"
	-- gear['Gun_ammo_WS'] = "Adlivun Bullet"
	
	sets.precast.QuickDraw = {ammo="Animikii Bullet"}
	
	sets.precast.JA['Triple Shot'] = {body="Navarch's Frac +2"}
	sets.precast.JA['Random Deal'] = {body="Commodore Frac"}

	sets.precast.CorsairRoll = {
		head="Commodore Tricorne",	
		hands="Navarch's Gants +2",	ring1="Merirosvo Ring",	ring2="Barataria Ring",
	}
	sets.precast.CorsairRoll["Caster's Roll"] = set_combine(sets.precast.CorsairRoll, {legs="Navarch's Culottes +2"})
	sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {feet="Navarch's Bottes +2"})
	sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {head="Navarch's Tricorne +2"})
	sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {body="Navarch's Frac +2"})
	sets.precast.CorsairRoll["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {hands="Navarch's Gants +2"})
	
	sets.precast.FC = {
		head="Anwig Salade",	neck="Orunmila's Torque",	ear1="Loquacious Earring",
		hands="Thaumas Gloves",	ring1="Prolix Ring"
	}
	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Bead Necklace"})

	--============================================================

	sets.precast.ranged = {
		head="Sylvan Gapette +2",
		body="Arcadian Jerkin",		hands="Iuitl Wristbands +1",
		waist="Impulse Belt",		legs="Arcadian Braccae"
	}
	
	--============================================================
	--					TP & WS sets
	--============================================================
	
	sets.wsBase = {
		neck="Ocachi Gorget",	ear1="Clearview Earring",	ear2="Volley Earring",
		body="Iuitl Vest +1",	ring1="Rajas Ring",
		feet="Iuitl Gaiters +1"
	}
	
	sets.wsBase.STR = {
		head="Ejekamal Mask",
		ring2="Pyrosoul Ring",
		back="Buquwik Cape",		waist="Prosilio Belt",		legs="Shneddick Tights +1"
	}
	sets.wsBase.AGI = {
		head="Uk'uxkaj Cap",
		hands="Iuitl Wristbands +1",	ring1="Blobnag Ring",		ring2="Stormsoul Ring",
		back="Ik Cape",					waist="Sveltesse Gouriz",	legs="Kaabnax Trousers"
	}
	sets.wsBase.DEX = {
		head="Uk'uxkaj Cap",			ear1="Pixie Earring",
		hands="Iuitl Wristbands +1",	ring2="Thundersoul Ring",
		back="Kayapa Cape",				waist="Chiner's Belt",
	}
	sets.wsBase.STRAGI = {
		head="Uk'uxkaj Cap",
		ring2="Pyrosoul Ring",
		waist="Prosilio Belt",		legs="Kaabnax Trousers"
	}
	
	sets.tpBase = {
		head="Navarch's Tricorne",	neck="Ocachi Gorget",		ear1="Clearview Earring",	ear2="Volley Earring",
		body="Iuitl Vest +1",		hands="Manibozho Gloves",	ring1="Paqichikaji Ring",	ring2="Longshot Ring",
		back="Gunslinger's Cape",	waist="Impulse Belt",		legs="Aetosaur Trousers",	feet="Scopuli Nails +1"
	}
	
	
	-- Midcast Sets
	sets.midcast.FastRecast = {
		head="Whirlpool Mask",	neck="Orunmila's Torque",
		body="Iuitl Vest",		hands="Iuitl Wristbands +1",
		legs="Manibozho Brais",	feet="Iuitl Gaiters +1"
	}
		
	-- Specific spells
	sets.midcast.Utsusemi = sets.midcast.FastRecast

	sets.midcast.CorsairShot = {ammo=gear.QDbullet,
		head="Corsair's Tricorne +1",	neck="Stoicheion Medal",	ear1="Friomisi Earring",	ear2="Hecate's Earring",
		body="Laksamana's Frac",		hands="Buremte Gloves",		ring1="Perception Ring",	ring2="Acumen Ring",
		back="Gunslinger's Cape",		waist="Aquiline Belt",		legs="Iuitl Tights",		feet="Navarch's Bottes +2"
	}

	--========================[Gun]===============================
	sets.Gun = {range=gear.Gun,	ammo=gear['Gun_ammo_RA'], neck="Faith Torque"}
	sets.Gun.other = {}
	
	--============================================================

	sets.midcast.FastRecast = {
		head="Ejekamal Mask",
		body="Iuitl Vest +1",	hands="Buremte Gloves",	ring2="Diamond Ring",	--Diamond Ring aug: 2% interrupt rate down
		back="Mujin Mantle",	waist="Cetl Belt",		legs="Kaabnax Trousers",	feet="Iuitl Gaiters +1"
	}
	sets.midcast.Utsusemi = sets.midcast.FastRecast
	
	sets.midcast.Cure = {}
	sets.midcast.Cure.with_buff = {}
	sets.midcast.Cure.with_buff['reive mark'] = {neck="Arciela's Grace +1"}
	
	--============================================================
	--					Other sets
	--============================================================
	sets.resting = {}
	
	sets.idle = {
		head="Ocelomeh Headpiece +1",	neck="Orochi Nodowa",		ear1="Brachyura Earring",		ear2="Ethereal Earring",
		body="Orion Jerkin",			hands="Buremte Gloves",		ring1="Defending Ring",			ring2="Shneddick Ring",
		back="Repulse Mantle",			waist="Flume Belt",			legs="Kaabnax Trousers",		feet="Iuitl Gaiters +1"
	}
	sets.idle.with_buff = {}
	sets.idle.with_buff['doom'] = {ring1="Saida Ring", ring2="Saida Ring"}
	sets.idle.with_buff['reive mark'] = {neck="Ygnas's Resolve +1"}
	
	sets.defense.DT = {	--DT-5%, PDT-10%, MDT-7%	=> PDT-15%, MDT-12%
		neck="Twilight Torque",
		ring1="Defending Ring",		ring2="Dark Ring"
	}
	sets.defense.PDT = set_combine(sets.defense.Evasion, sets.defense.DT, {	--PDT-18% + DT => PDT-33%
		head="Iuitl Headgear",
		body="Iuitl Vest",		hands="Iuitl Wristbands +1",
		back="Repulse Mantle",	waist="Flume Belt",			legs="Iuitl Tights",	feet="Iuitl Gaiters"
	})
	sets.defense.MDT = set_combine(sets.defense.Evasion, sets.defense.DT, {	--MDT-4% + DT => MDT-16%, MDB+19
		head="Ejekamal Mask",	ear1="Merman's Earring",	ear2="Merman's Earring",
		body="Iuitl Vest",		hands="Buremte Gloves",
		back="Tuilha Cape",		waist="Flume Belt",			legs="Kaabnax Trousers",	feet="Iuitl Gaiters"
	})
	
	sets.Kiting = {feet="Orion Socks"}
	
	sets.engaged = {
		head="Ejekamal Mask",	neck="Asperity Necklace",	ear1="Bladeborn Earring",	ear2="Steelflash Earring",
		body="Iuitl Vest",		hands="Buremte Gloves",		ring1="Rajas Ring",			ring2="Epona's Ring",
		back="Atheling Mantle",	waist="Patentia Sash",		legs="Kaabanax Trousers",	feet="Orion Socks"
	}
	sets.engaged.with_buff = {}
	sets.engaged.with_buff['doom'] = {ring1="Saida Ring", ring2="Saida Ring"}
	sets.engaged.with_buff['reive mark'] = {neck="Ygnas's Resolve +1"}
	
	sets.Melee = {}
	sets.Melee.tp = sets.engaged
end