-----------------------------------------------------------------------------------------------------------
--[[
	Author: Ragnarok.Lorand

	Slips:										|	/NIN
		3:	Twilight Torque
		10:	Tantra+2 Body/Feet
		14:	Thaumas Coat						|	Gloves
		15:	Anchorite's Head/Body/Hands/Legs/Feet
		17:	Hesychast's Body/Legs/Feet
		18:	Hestchast's+1 Hands
--]]
-----------------------------------------------------------------------------------------------------------

function init_gear_sets()
	--============================================================
	--					Precast sets
	--============================================================
	sets.precast.JA['Hundred Fists'] = {	legs="Hesychast's Hose"}
	sets.precast.JA['Boost'] = {			hands="Anchorite's Gloves"}
	sets.precast.JA['Dodge'] = {			feet="Anchorite's Gaiters +1"}
	sets.precast.JA['Focus'] = {			head="Anchorite's Crown"}
	sets.precast.JA['Counterstance'] = {	feet="Hesychast's Gaiters"}
	sets.precast.JA['Footwork'] = {			feet="Tantra Gaiters +2"}			-- Tantra+2: Raises attack bonus from 100/1024 to 152/1024
	sets.precast.JA['Formless Strikes'] = {	body="Hesychast's Cyclas"}
	sets.precast.JA['Mantra'] = {			feet="Hesychast's Gaiters"}
	sets.precast.JA['Impetus'] = {			body="Tantra Cyclas +2"}
	sets.precast.JA['Invigorate'] = {		hands="Hesychast's Gloves +1"}
	
	sets.precast.JA['Chi Blast'] = {
		head="Uk'uxkaj Cap",
		body="Otronif Harness +1",	hands="Hesychast's Gloves +1",
		back="Tuilha Cape",			legs="Quiahuiz Trousers",		feet="Anchorite's Gaiters +1"
	}
	sets.precast.JA['Chakra'] = {
		ammo="Bibiki Seashell",
		head="Uk'uxkaj Cap",		ear1="Soil Pearl",				ear2="Kemas Earring",
		body="Anchorite's Cyclas",	hands="Hesychast's Gloves +1",	ring1="Terrasoul Ring",		ring2="Spiral Ring",
		back="Iximulew Cape",		waist="Warwolf Belt",			legs="Quiahuiz Trousers",	feet="Otronif Boots +1"
	}

	sets.precast.Waltz = {
		ammo="Bibiki Seashell",
		head="Uk'uxkaj Cap",		ear1="Soil Pearl",				ear2="Kemas Earring",
		body="Otronif Harness +1",	hands="Hesychast's Gloves +1",	ring1="Terrasoul Ring",	ring2="Asklepian Ring",
		back="Ixmulew Cape",		waist="Warwolf Belt",			legs="Kaabnax Trousers",feet="Otronif Boots +1"
	}
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.precast.Step = {}
	
	--============================================================
	
	-- Fast cast sets for spells
	sets.precast.FC = {
		head="Anwig Salade",	neck="Orunmila's Torque",	ear1="Loquacious Earring",
		hands="Thaumas Gloves",	ring1="Prolix Ring"
	}
	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Bead Necklace"})
	
	--============================================================
	
	sets.wsBase = {
		ammo="Potestas Bomblet",
		head="Uk'uxkaj Cap",		neck="Asperity Necklace",		ear1="Bladeborn Earring",	ear2="Steelflash Earring",
		body="Otronif Harness +1",	hands="Hesychast's Gloves +1",	ring1="Rajas Ring",			ring2="Epona's Ring",
		back="Atheling Mantle",		waist="Windbuffet Belt",		legs="Otronif Brais +1",	feet="Manibozho Boots"
	}
	sets.wsBase.Acc = {ammo="Honed Tathlum"}

	sets.wsBase.Magic = {
		ammo="Dosis Tathlum",
		neck="Stoicheion Medal",	ear1="Hecate's Earring",	ear2="Friomisi Earring",
		ring1="Fenrir Ring +1",		ring2="Acumen Ring",
		back="Toro Cape",			legs="Shneddick Tights"
	}
	
	--============================================================
	--					Midcast sets
	--============================================================
	
	sets.midcast.FastRecast = set_combine(sets.precast.FC, {
		head="Otronif Mask +1",		neck="Orunmila's Torque",
		body="Otronif Harness +1",	hands="Hesychast's Gloves +1",
		back="Mujin Mantle",		waist="Black Belt",				legs="Kaabnax Trousers",	feet="Hesychast's Gaiters"
	})

	--============================================================
	--					Other sets
	--============================================================
	
	sets.idle = {
		ammo="Demonry Stone",
		head="Ocelomeh Headpiece +1",	neck="Orochi Nodowa",	ear1="Novia Earring",	ear2="Ethereal Earring",
		body="Hesychast's Cyclas",		hands="Garden Bangles",	ring1="Defending Ring",	ring2="Sheltered Ring",
		back="Repulse Mantle",			waist="Black Belt",		legs="Otronif Brais +1",feet="Otronif Boots +1"
	}
	sets.idle.Speedy = set_combine(sets.idle, {feet="Hermes' Sandals +1"})
	
	sets.resting = sets.idle
	
	sets.defense.DT = {	--DT-5%, PDT-10%, MDT-7%	=> PDT-15%, MDT-12%
		neck="Twilight Torque",
		ring1="Defending Ring",		ring2="Dark Ring"
	}
	
	sets.defense.PDT = set_combine(sets.defense.DT, {	--PDT-23% + DT => PDT-38%
		head="Otronif Mask +1",	
		body="Otronif Harness +1",	hands="Otronif Gloves +1",	
		back="Repulse Mantle",		waist="Black Belt",		legs="Otronif Brais +1",	feet="Otronif Boots +1"
	})
	sets.defense.MDT = set_combine(sets.defense.DT, {	--MDT-4% + DT => MDT-16%, MDB+19
		ammo="Demonry Stone",
		head="Otronif Mask +1",	ear1="Merman's Earring",		ear2="Merman's Earring",
		body="Otronif Harness",	hands="Hesychast's Gloves +1",
		back="Tuilha Cape",		waist="Black Belt",				legs="Otronif Brais +1",	feet="Otronif Boots"
	})
	
	sets.defense.HP = sets.defense.PDT

	sets.Kiting = {feet="Hermes' Sandals +1"}

	--============================================================
	
	sets.engaged = {
		ammo="Potestas Bomblet",
		head="Uk'uxkaj Cap",	neck="Asperity Necklace",		ear1="Bladeborn Earring",	ear2="Steelflash Earring",
		body="Thaumas Coat",	hands="Hesychast's Gloves +1",	ring1="Rajas Ring",			ring2="Epona's Ring",
		back="Atheling Mantle",	waist="Windbuffet Belt",		legs="Otronif Brais +1",	feet="Anchorite's Gaiters +1"
	}
	
	sets.engaged.Normal_A = {
		ammo="Potestas Bomblet",
		head="Uk'uxkaj Cap",	neck="Asperity Necklace",		ear1="Bladeborn Earring",	ear2="Steelflash Earring",
		body="Thaumas Coat",	hands="Hesychast's Gloves +1",	ring1="Rajas Ring",			ring2="Epona's Ring",
		back="Atheling Mantle",	waist="Windbuffet Belt",		legs="Otronif Brais +1",	feet="Anchorite's Gaiters +1"
	}
	
	sets.engaged.Normal_B = {
		ammo="Honed Tathlum",
		head="Uk'uxkaj Cap",		neck="Asperity Necklace",		ear1="Bladeborn Earring",	ear2="Steelflash Earring",
		body="Otronif Harness +1",	hands="Hesychast's Gloves +1",	ring1="Rajas Ring",			ring2="Epona's Ring",
		back="Atheling Mantle",		waist="Windbuffet Belt",		legs="Otronif Brais +1",	feet="Anchorite's Gaiters +1"
	}

	sets.engaged.Tank = {
		ammo="Demonry Stone",
		head="Otronif Mask +1",		neck="Twilight Torque",		ear1="Bladeborn Earring",	ear2="Steelflash Earring",
		body="Otronif Harness +1",	hands="Otronif Gloves +1",	ring1="Defending Ring",		ring2="Rajas Ring",
		back="Anchoret's Mantle",	waist="Black Belt",			legs="Otronif Brais +1",	feet="Otronif Boots +1"
	}
	
	sets.engaged.TankAcc = {
		ammo="Honed Tathlum",
		head="Ejekamal Mask",		neck="Twilight Torque",		ear1="Bladeborn Earring",	ear2="Steelflash Earring",
		body="Otronif Harness +1",	hands="Otronif Gloves +1",	ring1="Defending Ring",		ring2="Rajas Ring",
		back="Anchoret's Mantle",	waist="Black Belt",			legs="Kaabnax Trousers",	feet="Otronif Boots +1"
	}
	
	sets.engaged.HitMoar = {
		ammo="Honed Tathlum",
		head="Ejekamal Mask",			neck="Asperity Necklace",		ear1="Bladeborn Earring",	ear2="Steelflash Earring",
		body="Otronif Harness +1",		hands="Hesychast's Gloves +1",	ring1="Rajas Ring",			ring2="Epona's Ring",
		back="Anchoret's Mantle",		waist="Anguinus Belt",			legs="Kaabnax Trousers",	feet="Anchorite's Gaiters +1"
	}
	
	sets.engaged.Mix = {
		ammo="Honed Tathlum",
		head="Uk'uxkaj Cap",		neck="Asperity Necklace",		ear1="Bladeborn Earring",	ear2="Steelflash Earring",
		body="Otronif Harness +1",	hands="Hesychast's Gloves +1",	ring1="Rajas Ring",			ring2="Epona's Ring",
		back="Anchoret's Mantle",	waist="Windbuffet Belt",		legs="Kaabnax Trousers",	feet="Anchorite's Gaiters +1"
	}

	-- Footwork combat form
	sets.engaged.Footwork = sets.engaged
	sets.engaged.Footwork.Acc = sets.engaged.Footwork
end