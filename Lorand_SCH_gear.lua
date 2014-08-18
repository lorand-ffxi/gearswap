-----------------------------------------------------------------------------------------------------------
--[[
	Author: Ragnarok.Lorand
	
	Slips:
	2:		Loq. Earring
	3:		Twilight Neck
	10:		Savant+2 All
	14:		Nares Head/Hands/Legs
	15:		Academic's Head/Body/Hands/Legs/Feet
	17:		Pedagogy Legs/Feet
	
--]]
-----------------------------------------------------------------------------------------------------------

function init_gear_sets()
	--============================================================
	--					Precast sets
	--============================================================
	sets.precast.JA['Rapture'] =			{head="Savant's Bonnet +2"}
	sets.precast.JA['Ebullience'] =			{head="Savant's Bonnet +2"}
	sets.precast.JA['Penury'] =				{legs="Savant's Pants +2"}
	sets.precast.JA['Parsimony'] =			{legs="Savant's Pants +2"}
	sets.precast.JA['Tabula Rasa'] =		{legs="Pedagogy Pants"}
	sets.precast.JA['Perpetuance'] =		{hands="Savant's Bracers +2"}
	sets.precast.JA['Immanence'] =			{hands="Savant's Bracers +2"}
	sets.precast.JA['Addendum: White'] =	{body="Savant's Gown +2"}
	sets.precast.JA['Addendum: Black'] =	{body="Savant's Gown +2"}
	sets.precast.JA['Altruism'] =			{head="Pedagogy Mortarboard"}
	sets.precast.JA['Focalization'] =		{head="Pedagogy Mortarboard"}
	
	sets.precast.FC = {					--44%	|	54% / 34%
		ammo="Incantor Stone",			--2%
		head="Nahtirah Hat",			--10%
		neck="Orunmila's Torque",		--5%
		ear1="Loquacious Earring",		--2%
		hands="Gendewitha Gages +1",	--7%
		ring1="Prolix Ring",			--2%
		ring2="Veneficium Ring",		--Q+1%
		back="Swith Cape",				--3%
		waist="Witful Belt",			--3%
		legs="Artsieq Hose",			--5%
		feet="Pedagogy Loafers"			--5%
	}
	sets.precast.FC.EnhancingMagic = {	--49%	|	59% / 39%
		waist="Siegel Sash"				--8%
	}
	sets.precast.FC.Cure = {			--49%	|	59% / 39%
		back="Pahtli Cape"				--8%
	}
	sets.precast.FC.Curaga = 			sets.precast.FC.Cure
	sets.precast.FC.Grimoire = {		--47%	|	57% / ??
		feet="Academic's Loafers"		--8% addition to arts (10%)
	}
	sets.precast.FC.Weather = {			--(80%)
		feet="Pedagogy Loafers"			--15% addition to Celerity/Alacrity (50%)
	}
	sets.precast.FC.Lightning = {main="Apamajas I"}

	--============================================================
	
	sets.precast.WS = {}
	
	--============================================================
	--					Midcast sets
	--============================================================
	sets.midcast.FastRecast = set_combine(sets.precast.FC, {
		ammo="Impatiens",
		head="Kaabnanx Hat",		neck="Orunmila's Torque",
		body="Hagondes Coat +1",	hands="Gendewitha Gages +1",
		legs="Hagondes Pants +1",	feet="Hagondes Sabots +1"
	})

	sets.midcast.HealingMagic = {
		body="Argute Gown +2",
		feet="Pedagogy Loafers"
	}
	sets.midcast.HealingMagic.LA = {
		legs="Academic's Pants"			--18 Divine/Enfeebling/Enhancing/Healing Skill
	}
	
	sets.midcast.Cure = {
		main="Tamaxchi",				sub="Genbu's Shield",			ammo="Impatiens",
		head="Gendewitha Caubeen +1",	neck="Fylgja Torque +1",		ear1="Novia Earring",	ear2="Star Earring",
		body="Hagondes Coat +1",		hands="Weatherspoon Cuffs +1",	ring1="Aquasoul Ring",	ring2="Aqua Ring",
		back="Oretania's Cape",			waist="Witful Belt",			legs="Pedagogy Pants",	feet="Hagondes Sabots +1"
	}
	sets.midcast.Curaga = sets.midcast.Cure

	sets.midcast.EnhancingMagic = {
		main="Coeus",				sub="Achaq Grip",			ammo="Savant's Treatise",
		head="Savant's Bonnet +2",	neck="Colossus's Torque",
		body="Hyksos Robe",
		waist="Cascade Belt"
	}
	sets.midcast.EnhancingMagic.LA = {
		legs="Academic's Pants"			--18 Divine/Enfeebling/Enhancing/Healing Skill
	}
	
	sets.midcast.Aquaveil = {waist="Emphatikos Rope"}
	sets.midcast.Stoneskin = {
		neck="Stone Gorget",			ear1="Loquacious Earring",	ear2="Earthcry Earring",
		hands="Weatherspoon Cuffs +1",	ring1="Aquasoul Ring",		ring2="Aqua Ring",
		back="Tuilha Cape",				waist="Siegel Sash",		legs="Haven Hose",		feet="Hagondes Sabots +1"
	}
	sets.midcast.Regen = {
		main="Coeus",				sub="Achaq Grip",
		head="Savant's Bonnet +2"
	}

	sets.midcast.MagicAccuracy = {
		main="Lehbrailg +2",		sub="Mephitis Grip",		ammo="Kalboron Stone",
		head="Kaabnax Hat",			neck="Stoicheion Medal",	ear1="Lifestorm Earring",	ear2="Psystorm Earring",
		body="Savant's Gown +2",	hands="Lurid Mitts",		ring1="Balrahn's Ring",		ring2="Perception Ring",
		back="Ogapepo Cape",		waist="Aswang Sash",		legs="Artsieq Hose",		feet="Bokwus Boots"
	}
	
	sets.midcast.EnfeeblingMagic = {
		neck="Enfeebling Torque",
		hands="Lurid Mitts",
		feet="Uk'uxkaj Boots"
	}
	sets.midcast.EnfeeblingMagic.DA = {
		body="Academic's Gown"			--18 Elemental/Enfeebling/Dark Skill
	}
	sets.midcast.EnfeeblingMagic.LA = {
		legs="Academic's Pants"			--18 Divine/Enfeebling/Enhancing/Healing Skill
	}
	
	
	sets.midcast.ElementalEnfeeble = sets.midcast.EnfeeblingMagic

	sets.midcast.DarkMagic = {
		neck="Dark Torque",
		back="Bookworm's Cape",	legs="Pedagogy Pants"
	}
	sets.midcast.DarkMagic.DA = {
		body="Academic's Gown"			--18 Elemental/Enfeebling/Dark Skill
	}
	
	sets.midcast.DivineMagic = {}
	sets.midcast.DivineMagic.LA = {
		legs="Academic's Pants"			--18 Divine/Enfeebling/Enhancing/Healing Skill
	}
	
	sets.midcast.ElementalMagicSkill = {
		head="Pedagogy Mortarboard",
		body="Hyksos Robe",
		back="Bookworm's Cape",	legs="Pedagogy Pants",	feet="Savant's Loafers +2"
	}
	sets.midcast.ElementalMagicSkill.DA = {
		body="Academic's Gown"			--18 Elemental/Enfeebling/Dark Skill
	}
	
	sets.midcast.ElementalMagic = {
		main="Venabulum",			sub="Zuuxowu Grip",			ammo="Dosis Tathlum",
		head="Buremte Hat",			neck="Stoicheion Medal",	ear1="Hecate's Earring",	ear2="Friomisi Earring",
		body="Hagondes Coat +1",	hands="Otomi Gloves",		ring1="Fenrir Ring +1",		ring2="Acumen Ring",
		back="Bookworm's Cape",		waist="Aswang Sash",		legs="Hagondes Pants +1",	feet="Hagondes Sabots +1"
	}
	sets.midcast.ElementalMagic.Earth = {neck="Quanpur Necklace"}
	
	--============================================================
	--					Other sets
	--============================================================
	
	sets.resting = {
		main="Chatoyant Staff",	sub="Elder's Grip",			ammo="Kalboron Stone",
		head="Kaabnax Hat",		neck="Eidolon Pendant",		ear1="Loquacious Earring",	ear2="Relaxing Earring",
		body="Academic's Gown",	hands="Nares Cuffs",		ring1="Defending Ring",		ring2="Sheltered Ring",
		back="Felicitas Cape",	waist="Emphatikos Rope",	legs="Nares Trews",			feet="Chelona Boots"
	}
	
	sets.idle = {
		main="Terra's Staff",			sub="Elder's Grip",			ammo="Impatiens",
		head="Academic's Mortarboard",	neck="Twilight Torque",		ear1="Novia Earring",	ear2="Ethereal Earring",
		body="Academic's Gown",			hands="Lurid Mitts",		ring1="Defending Ring",	ring2="Sheltered Ring",
		back="Cheviot Cape",			waist="Emphatikos Rope",	legs="Pedagogy Pants",	feet="Serpentes Sabots"
	}
	sets.idle.speedy = {feet="Herald's Gaiters"}
	sets.idle.with_buff = {}
	sets.idle.with_buff['Doom'] = {ring1="Saida Ring", ring2="Saida Ring"}
	
	sets.idle.lowMP =		{legs="Nares Trews"}
	sets.idle.lowMP_night =	{hands="Serpentes Cuffs"}
	sets.idle.lowMP_day =	{feet="Serpentes Sabots"}
	sets.idle.sublimation = {
		head="Academic's Mortarboard",
		back="Repulse Mantle"
	}
	
	sets.idle.with_buff['Sublimation: Activated'] = {
		head="Academic's Mortarboard",
		back="Repulse Mantle"
	}
		
	sets.defense.DT = {}
	sets.defense.PDT = set_combine(sets.defense.DT, {
	})
	sets.defense.MDT = set_combine(sets.defense.DT, {
	})

	--============================================================
	
	sets.engaged = {
		head="Kaabnax Hat",		neck="Asperity Necklace",	ear1="Bladeborn Earring",	ear2="Steelflash Earring",
		body="Hagondes Coat +1",	hands="Otomi Gloves",		ring1="Rajas Ring",			ring2="Mars's Ring",
		waist="Cetl Belt",			legs="Hagondes Pants +1",	feet="Hagondes Sabots +1"
	}
	sets.engaged.with_buff = {}
	sets.engaged.with_buff['Doom'] = {ring1="Saida Ring", ring2="Saida Ring"}
	
	--============================================================
	
	-- lowTierNukes = S{'Stone', 'Water', 'Aero', 'Fire', 'Blizzard', 'Thunder',
		-- 'Stone II', 'Water II', 'Aero II', 'Fire II', 'Blizzard II', 'Thunder II',
		-- 'Stone III', 'Water III', 'Aero III', 'Fire III', 'Blizzard III', 'Thunder III',
		-- 'Stonega', 'Waterga', 'Aeroga', 'Firaga', 'Blizzaga', 'Thundaga',
		-- 'Stonega II', 'Waterga II', 'Aeroga II', 'Firaga II', 'Blizzaga II', 'Thundaga II'}
end