--------------------------------------------------------------------------------
--[[
	Adapted from Mote's GearSwap files by Ragnarok.Lorand
	Mappings, lists and sets to describe game relationships that aren't
	easily determinable otherwise.
--]]
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--		Song buff enhancements on instruments and equipment
--------------------------------------------------------------------------------
instruments = {}
instruments.effects = {
	["Angel's Flute"] = {['Prelude']=1},	["Angel's Flute +1"] = {['Prelude']=2},	["Apollo's Flute"] = {['Minuet']=3},
	["Cornette"] = {['Minuet']=1},		["Cornette +1"] = {['Minuet']=2},	["Cornette +2"] = {['Minuet']=2},
	["Cradle Horn"] = {['Lullaby']=2},	["Crumhorn"] = {['Carol']=1},		["Crumhorn +1"] = {['Carol']=2},
	["Crumhorn +2"] = {['Carol']=2},	["Eminent Flute"] = {['All']=2},	["Faerie Piccolo"] = {['March']=2},
	["Flute +1"] = {['Requiem']=1},		["Flute +2"] = {['Requiem']=1},		["Forefront Flute"] = {['All']=2},
	["Gemshorn"] = {['Mambo']=1},		["Gemshorn +1"] = {['Mambo']=2},	["Gjallarhorn"] = {['All']=4},
	["Hamelin Flute"] = {['Requiem']=2},	["Harlequin's Horn"] = {['Mazurka']=2},	["Hellish Bugle"] = {['Mambo']=1},
	["Hellish Bugle +1"] = {['Mambo']=2},	["Homestead Flute"] = {['All']=2},	["Horn"] = {['Elegy']=1},
	["Horn +1"] = {['Elegy']=2},		["Iron Ram Horn"] = {['March']=1},	["Kingdom Horn"] = {['March']=1},
	["Linos"] = {['All']=1},		["Mary's Horn"] = {['Lullaby']=1},	["Millennium Horn"] = {['All']=2},
	["Ney"] = {['Finale']=2},		["Piccolo"] = {['Threnody']=1},		["Piccolo +1"] = {['Threnody']=2},
	["Requiem Flute"] = {['Requiem']=4},	["San D'Orian Horn"] = {['March']=1},	["Shofar"] = {['Requiem']=2},
	["Shofar +1"] = {['Requiem']=3},	["Siren Flute"] = {['Requiem']=2},	["Storm Fife"] = {['Ballad']=1},
	["Traversiere"] = {['Madrigal']=1},	["Traversiere +1"] = {['Madrigal']=2},	["Traversiere +2"] = {['Madrigal']=2},
	["Angel Lyre"] = {['Hymnus']=2},	["Crooner's Cithara"] = {['Ballad']=1},	["Cythara Anglica"] = {['Virelai']=1},
	["Ebony Harp"] = {['Paeon']=1},		["Ebony Harp +1"] = {['Paeon']=2},	["Ebony Harp +2"] = {['Paeon']=2},
	["Harp"] = {['Minne']=1},		["Harp +1"] = {['Minne']=2},		["Maple Harp +1"] = {['Minne']=1},
	["Military Harp"] = {['Finale']=2},	["Mythic Harp"] = {['Etude']=1},	["Mythic Harp +1"] = {['Etude']=2},
	["Nursemaid's Harp"] = {['Lullaby']=2},	["Oneiros Harp"] = {['Paeon']=3},	["Cythara Anglica +1"] = {['Virelai']=2},
	["Rose Harp"] = {['Etude']=1},		["Rose Harp +1"] = {['Etude']=2},	["Royal Spearman's Horn"] = {['March']=1},
	["Sorrowful Harp"] = {['Threnody']=3},						["Cantabank's Horn"] = {['Madrigal']=3, ['Prelude']=3},
	["Mass Chalemie"] = {['Hymnus']=3, ['Scherzo']=1},				["Pan's Horn"] = {['Finale']=3, ['Lullaby']=3},
	["Syrinx"] = {['Elegy']=3, ['Minne']=3},					["Langeleik"] = {['March']=3, ['Etude']=3},
	["Vihuela"] = {['Mambo']=3, ['Mazurka']=3}
}

brdGearEffects = {
	["Aoidos' Hongreline +2"] = {['All']=1, ['Minuet']=1},
	["Aoidos' Calot +2"] = {['Madrigal']=1},	["Aoidos' Cothurnes +2"] = {['Scherzo']=1},
	["Aoidos' Manchettes +2"] = {['March']=1},	["Aoidos' Matinee"] = {['All']=1},
	["Aoidos' Rhingrave +2"] = {['Ballad']=1},	["Brioso Cuffs"] = {['Lullaby']=1},
	["Brioso Roundlet"] = {['Paeon']=1},		["Brioso Roundlet +1"] = {['Paeon']=1},
	["Brioso Slippers"] = {['All']=1},		["Brioso Slippers +1"] = {['All']=1.1},
	["Carnwenhan"] = {['All']=1},			["Legato Dagger"] = {['All']=0.5},
	["Marduk's Shalwar +1"] = {['All']=1}
}

--------------------------------------------------------------------------------
--	Elemental mappings for element relationships and certian types of spells.
--------------------------------------------------------------------------------
elements = {}
elements.list = S{'Light','Dark','Fire','Ice','Wind','Earth','Lightning','Water'}

elements.nuke_of = {['Light']='Banish',['Dark']=nil,['Fire']='Fire',['Ice']='Blizzard',['Wind']='Aero',['Earth']='Stone',['Lightning']='Thunder',['Water']='Water'}
elements.nukega_of = {['Light']='Banishga',['Dark']=nil,['Fire']='Firaga',['Ice']='Blizzaga',['Wind']='Aeroga',['Earth']='Stonega',['Lightning']='Thundaga',['Water']='Waterga'}
elements.nukeja_of = {['Light']=nil,['Dark']=nil,['Fire']='Firaja',['Ice']='Blizzaja',['Wind']='Aeroja',['Earth']='Stoneja',['Lightning']='Thundaja',['Water']='Waterja'}
elements.weak_to = {['Light']='Dark',['Dark']='Light',['Fire']='Ice',['Ice']='Wind',['Wind']='Earth',['Earth']='Lightning',['Lightning']='Water',['Water']='Fire'}
elements.strong_to = {['Light']='Dark',['Dark']='Light',['Fire']='Water',['Ice']='Fire',['Wind']='Ice',['Earth']='Wind',['Lightning']='Earth',['Water']='Lightning'}
elements.storm_of = {['Light']="Aurorastorm",['Dark']="Voidstorm",['Fire']="Firestorm",['Ice']="Hailstorm",['Wind']="Windstorm",['Earth']="Sandstorm",['Lightning']="Thunderstorm",['Water']="Rainstorm"}
elements.spirit_of = {['Light']="Light Spirit",['Dark']="Dark Spirit",['Fire']="Fire Spirit",['Ice']="Ice Spirit",['Wind']="Air Spirit",['Earth']="Earth Spirit",['Lightning']="Thunder Spirit",['Water']="Water Spirit"}
elements.avatar_of = {['Light']="Carbuncle",['Dark']="Fenrir",['Fire']="Ifrit",['Ice']="Shiva",['Wind']="Garuda",['Earth']="Titan",['Lightning']="Ramuh",['Water']="Leviathan"}

storms = S{"Aurorastorm", "Voidstorm", "Firestorm", "Sandstorm", "Rainstorm", "Windstorm", "Hailstorm", "Thunderstorm"}

skillchain_elements = {}
skillchain_elements.Light =		S{'Light','Fire','Wind','Lightning'}
skillchain_elements.Dark =		S{'Dark','Ice','Earth','Water'}
skillchain_elements.Fusion =		S{'Light','Fire'}
skillchain_elements.Fragmentation =	S{'Wind','Lightning'}
skillchain_elements.Distortion =	S{'Ice','Water'}
skillchain_elements.Gravitation =	S{'Dark','Earth'}
skillchain_elements.Transfixion =	S{'Light'}
skillchain_elements.Compression =	S{'Dark'}
skillchain_elements.Liquification =	S{'Fire'}
skillchain_elements.Induration =	S{'Ice'}
skillchain_elements.Detonation =	S{'Wind'}
skillchain_elements.Scission =		S{'Earth'}
skillchain_elements.Impaction =		S{'Lightning'}
skillchain_elements.Reverberation =	S{'Water'}

-- list of weaponskills that use ammo
bow_gun_weaponskills = S{"Flaming Arrow","Piercing Arrow","Dulling Arrow","Sidewinder","Blast Arrow","Arching Arrow","Empyreal Arrow","Refulgent Arrow","Apex Arrow","Namas Arrow","Jishnu's Radiance","Hot Shot","Split Shot","Sniper Shot","Slug Shot","Blast Shot","Heavy Shot","Detonator","Numbing Shot","Last Stand","Coronach","Trueflight","Leaden Salute","Wildfire"}

-- list of weaponskills that can be used at greater than melee range
ranged_weaponskills = S{"Flaming Arrow","Piercing Arrow","Dulling Arrow","Sidewinder","Arching Arrow","Empyreal Arrow","Refulgent Arrow","Apex Arrow","Namas Arrow","Jishnu's Radiance","Hot Shot","Split Shot","Sniper Shot","Slug Shot","Heavy Shot","Detonator","Last Stand","Coronach","Trueflight","Leaden Salute","Wildfire","Myrkr"}

wsmod = {
	--Archery
	["Jishnu's Radiance"] = 'DEX',	["Namas Arrow"] = 'STRAGI',	["Apex Arrow"] = 'AGI',		["Refulgent Arrow"] = 'STR',	
	["Empyreal Arrow"] = 'STRAGI',	["Arching Arrow"] = 'STRAGI',	["Blast Arrow"] = 'STRAGI',	["Sidewinder"] = 'STRAGI',
	["Dulling Arrow"] = 'STRAGI',	["Piercing Arrow"] = 'STRAGI',	["Flaming Arrow"] = 'STRAGI',
	--Marksmanship
	["Wildfire"] = 'AGI',		["Leaden Salute"] = 'AGI',	["Trueflight"] = 'AGI',		["Coronach"] = 'AGIDEX',		
	["Last Stand"] = 'AGI',		["Numbing Shot"] = 'AGI',	["Detonator"] = 'AGI',		["Heavy Shot"] = 'AGI',
	["Blast Shot"] = 'AGI',		["Slug Shot"] = 'AGI',		["Sniper Shot"] = 'AGI',	["Split Shot"] = 'AGI',
	["Hot Shot"] = 'AGI',
	--Katana
	["Blade: Hi"] = 'AGI',		["Blade: Kamu"] = 'STRINT',	["Blade: Metsu"] = 'DEX',	["Blade: Shun"] = 'DEX',
	["Blade: Yu"] = 'DEXINT',	["Blade: Ku"] = 'STRDEX',	["Blade: Ten"] = 'STRDEX',	["Blade: Jin"] = 'STRDEX',
	["Blade: Ei"] = 'STRINT',	["Blade: Chi"] = 'STRINT',	["Blade: To"] = 'STRINT',	["Blade: Teki"] = 'STRINT',
	["Blade: Retsu"] = 'STRDEX',	["Blade: Rin"] = 'STRDEX',
	--Great Katana
	["Tachi: Fudo"] = 'STR',	["Tachi: Rana"] = 'STR',	["Tachi: Kaiten"] = 'STR',	["Tachi: Shoha"] = 'STR',
	["Tachi: Ageha"] = 'STRCHR',	["Tachi: Kasha"] = 'STR',	["Tachi: Gekko"] = 'STR',	["Tachi: Yukikaze"] = 'STR',
	["Tachi: Koki"] = 'STRMND',	["Tachi: Jinpu"] = 'STR',	["Tachi: Kagero"] = 'STR',	["Tachi: Goten"] = 'STR',
	["Tachi: Hobaku"] = 'STR',	["Tachi: Enpi"] = 'STR',
	--Hand-to-hand
	["Victory Smite"] = 'STR',	["Stringing Pummel"] = 'STRVIT',["Ascetic's Fury"] = 'STRVIT',	["Final Heaven"] = 'VIT',
	["Shijin Spiral"] = 'DEX',	["Tornado Kick"] = 'STRVIT',	["Asuran Fists"] = 'STRVIT',	["Dragon Kick"] = 'STRDEX',
	["Howling Fist"] = 'STRDEX',	["Spinning Attack"] = 'STR',	["Raging Fists"] = 'STRDEX',	["Backhand Blow"] = 'STRDEX',
	["One Inch Punch"] = 'VIT',	["Shoulder Tackle"] = 'VIT',	["Combo"] = 'STRDEX',
	--Sword
	["Fast Blade"] = 'STRDEX',	["Burning Blade"] = 'STRINT',	["Red Lotus Blade"] = 'STRINT',	["Flat Blade"] = 'STR',
	["Shining Blade"] = 'STRMND',	["Seraph Blade"] = 'STRMND',	["Circle Blade"] = 'STR',	["Spirits Within"] = 'HP',
	["Vorpal Blade"] = 'STR',	["Swift Blade"] = 'STRMND',	["Savage Blade"] = 'STRMND',	["Knights of Round"] = 'STRMND',
	["Death Blossom"] = 'STRMND',	["Atonement"] = 'Enmity',	["Expiacion"] = 'STRDEXINT',	["Sanguine Blade"] = 'STRMND',
	["Chant du Cygne"] = 'DEX',	["Requiescat"] = 'MND',
	--Dagger
	["Wasp Sting"] = 'DEX',		["Gust Slash"] = 'DEXINT',	["Shadow Stitch"] = 'CHR',	["Viper Bite"] = 'DEX',
	["Cyclone"] = 'DEXINT',		["Energy Steal"] = 'MND',	["Energy Drain"] = 'MND',	["Dancing Edge"] = 'DEXCHR',
	["Shark Bite"] = 'DEXAGI',	["Evisceration"] = 'DEX',	["Mercy Stroke"] = 'STR',	["Mandalic Stab"] = 'DEX',
	["Mordant Rime"] = 'DEXCHR',	["Pyrrhic Kleos"] = 'STRDEX',	["Aeolian Edge"] = 'DEXINT',	["Rudra's Storm"] = 'DEX',
	["Exenterator"] = 'AGI',
	--Club
	["Shining Strike"] = 'STRMND',	["Seraph Strike"] = 'STRMND',	["Brainshaker"] = 'STR',	["Starlight"] = 'Skill',
	["Moonlight"] = 'Skill',	["Skullbreaker"] = 'STR',	["True Strike"] = 'STR',	["Judgment"] = 'STRMND',
	["Hexa Strike"] = 'STRMND',	["Black Halo"] = 'STRMND',	["Randgrith"] = 'STRMND',	["Mystic Boon"] = 'STRMND',
	["Flash Nova"] = 'STRMND',	["Dagan"] = 'HPMP',		["Realmrazer"] = 'MND',		["Exudiation"] = 'INTMND',
	--Staff
	["Heavy Swing"] = 'STR',	["Rock Crusher"] = 'STRINT',	["Earth Crusher"] = 'STRINT',	["Starburst"] = 'STRMND',
	["Sunburst"] = 'STRMND',	["Shell Crusher"] = 'STR',	["Full Swing"] = 'STR',		["Spirit Taker"] = 'INTMND',
	["Retribution"] = 'STRMND',	["Gates of Tartarus"] = 'INT',	["Vidohunir"] = 'INT',		["Garland of Bliss"] = 'STRMND',
	["Omniscience"] = 'MND',	["Cataclysm"] = 'STRINT',	["Myrkr"] = 'MP',		["Shattersoul"] = 'INT',
	--Polearm
	["Double Thrust"] = 'STRDEX',	["Thunder Thrust"] = 'STRINT',	["Raiden Thrust"] = 'STRINT',	["Leg Sweep"] = 'STR',
	["Penta Thrust"] = 'STRDEX',	["Vorpal Thrust"] = 'STRAGI',	["Skewer"] = 'STR',		["Wheeling Thrust"] = 'STR',
	["Impulse Drive"] = 'STR',	["Geirskogul"] = 'DEX',		["Drakesbane"] = 'STR',		["Sonic Thrust"] = 'STRDEX',
	["Stardiver"] = 'STR',		["Camlann's Torment"] = 'STRVIT',
	--Scythe
	["Slice"] = 'STR',		["Dark Harvest"] = 'STRINT',	["Shadow of Death"] = 'STRINT',	["Nightmare Scythe"] = 'STRMND',
	["Spinning Scythe"] = 'STR',	["Vorpal Scythe"] = 'STR',	["Guillotine"] = 'STRMND',	["Cross Reaper"] = 'STRMND',
	["Spiral Hell"] = 'STRINT',	["Catastrophe"] = 'STRINT',	["Insurgency"] = 'STRINT',	["Infernal Scythe"] = 'STRINT',
	["Quietus"] = 'STRMND',		["Entropy"] = 'INT',
	--Great Axe
	["Shield Break"] = 'STRVIT',	["Iron Tempest"] = 'STR',	["Sturmwind"] = 'STR',		["Armor Break"] = 'STRVIT',
	["Keen Edge"] = 'STR',		["Weapon Break"] = 'STRVIT',	["Raging Rush"] = 'STR',	["Full Break"] = 'STRVIT',
	["Steel Cyclone"] = 'STRVIT',	["Metatron Torment"] = 'STR',	["King's Justice"] = 'STR',	["Fell Cleave"] = 'STR',
	["Ukko's Fury"] = 'STR',	["Upheaval"] = 'VIT',
	--Axe
	["Raging Axe"] = 'STR',		["Smash Axe"] = 'STR',		["Gale Axe"] = 'STR',		["Avalanche Axe"] = 'STR',
	["Spinning Axe"] = 'STR',	["Rampage"] = 'STR',		["Calamity"] = 'STRVIT',	["Mistral Axe"] = 'STR',
	["Decimation"] = 'STR',		["Onslaught"] = 'DEX',		["Primal Rend"] = 'DEXCHR',	["Bora Axe"] = 'DEX',
	["Cloudsplitter"] = 'STRMND',	["Ruinator"] = 'STR',
	--Great Sword
	["Hard Slash"] = 'STR',		["Power Slash"] = 'STRVIT',	["Frostbite"] = 'STRINT',	["Freezebite"] = 'STRINT',
	["Shockwave"] = 'STRMND',	["Crescent Moon"] = 'STR',	["Sickle Moon"] = 'STRAGI',	["Spinning Slash"] = 'STRINT',
	["Ground Strike"] = 'STRINT',	["Scourge"] = 'STRVIT',		["Herculean Slash"] = 'VIT',	["Torcleaver"] = 'VIT',
	["Resolution"] = 'STR',		["Dimidiation"] = 'DEX',
}

elemental_weaponskills = {
	["Flaming Arrow"] = 'Fire',	["Wildfire"] = 'Fire',		["Leaden Salute"] = 'Dark',	["Trueflight"] = 'Light',
	["Split Shot"] = 'Fire',	["Hot Shot"] = 'Fire',		["Blade: Yu"] = 'Water',	["Blade: Ei"] = 'Dark',
	["Blade: Chi"] = 'Earth',	["Blade: To"] = 'Ice',		["Blade: Teki"] = 'Water',	["Tachi: Kagero"] = 'Fire',
	["Tachi: Goten"] = 'Lightning',	["Tachi: Koki"] = 'Light',	["Burning Blade"] = 'Fire',	["Red Lotus Blade"] = 'Fire',
	["Shining Blade"] = 'Light',	["Seraph Blade"] = 'Light',	["Sanguine Blade"] = 'Dark',	["Gust Slash"] = 'Wind',
	["Cyclone"] = 'Wind',		["Energy Steal"] = 'Dark',	["Energy Drain"] = 'Dark',	["Aeolian Edge"] = 'Wind',
	["Shining Strike"] = 'Light',	["Seraph Strike"] = 'Light',	["Flash Nova"] = 'Light',	["Rock Crusher"] = 'Earth',
	["Earth Crusher"] = 'Earth',	["Starburst"] = 'LightDark',	["Sunburst"] = 'LightDark',	["Vidohunir"] = 'Dark',
	["Garland of Bliss"] = 'Light',	["Omniscience"] = 'Dark',	["Cataclysm"] = 'Dark',		["Raiden Thrust"] = 'Lightning',
	["Dark Harvest"] = 'Dark',	["Shadow of Death"] = 'Dark',	["Infernal Scythe"] = 'Dark',	["Thunder Thrust"] = 'Lightning',
	["Primal Rend"] = 'Light',	["Cloudsplitter"] = 'Lightning',["Frostbite"] = 'Ice',		["Freezebite"] = 'Ice',
	["Herculean Slash"] = 'Ice',
}

--------------------------------------------------------------------------------
-- Spell mappings allow defining a general category or description for sets of related spells.
--------------------------------------------------------------------------------

spell_maps = {
	--White Magic
	['Cure']='Cure',		['Cure II']='Cure',		['Cure III']='Cure',		['Cure IV']='Cure',		['Cure V']='Cure',
	['Cure VI']='Cure',		['Cura']='Curaga',		['Cura II']='Curaga',		['Cura III']='Curaga',		['Curaga']='Curaga',
	['Curaga II']='Curaga',		['Curaga III']='Curaga',	['Curaga IV']='Curaga',		['Curaga V']='Curaga',		['Erase']='StatusRemoval',
	['Poisona']='StatusRemoval',	['Paralyna']='StatusRemoval',	['Silena']='StatusRemoval',	['Blindna']='StatusRemoval',	['Cursna']='StatusRemoval',
	['Stona']='StatusRemoval',	['Viruna']='StatusRemoval',	['Barfire']='BarElement',	['Barstone']='BarElement',	['Barwater']='BarElement',
	['Baraero']='BarElement',	['Barblizzard']='BarElement',	['Barthunder']='BarElement',	['Barfira']='BarElement',	['Barstonra']='BarElement',
	['Barwatera']='BarElement',	['Baraera']='BarElement',	['Barblizzara']='BarElement',	['Barthundra']='BarElement',	['Raise']='Raise',
	['Raise II']='Raise',		['Raise III']='Raise',		['Arise']='Raise',		['Reraise']='Reraise',		['Reraise II']='Reraise',
	['Reraise III']='Reraise',	['Protect']='Protect',		['Protect II']='Protect',	['Protect III']='Protect',	['Protect IV']='Protect',
	['Protect V']='Protect',	['Shell']='Shell',		['Shell II']='Shell',		['Shell III']='Shell',		['Shell IV']='Shell',
	['Shell V']='Shell',		['Protectra']='Protectra',	['Protectra II']='Protectra',	['Protectra III']='Protectra',	['Protectra IV']='Protectra',
	['Protectra V']='Protectra',	['Shellra']='Shellra',		['Shellra II']='Shellra',	['Shellra III']='Shellra',	['Shellra IV']='Shellra',
	['Shellra V']='Shellra',	['Regen']='Regen',		['Regen II']='Regen',		['Regen III']='Regen',		['Regen IV']='Regen',
	['Regen V']='Regen',		['Refresh']='Refresh',		['Refresh II']='Refresh',	['Teleport-Holla']='Teleport',	['Teleport-Dem']='Teleport',
	['Teleport-Mea']='Teleport',	['Teleport-Altep']='Teleport',	['Teleport-Yhoat']='Teleport',	['Teleport-Vahzl']='Teleport',	['Recall-Pashh']='Teleport',
	['Recall-Meriph']='Teleport',	['Recall-Jugner']='Teleport',	['Firestorm']='Storm',		['Hailstorm']='Storm',		['Windstorm']='Storm',
	['Sandstorm']='Storm',		['Thunderstorm']='Storm',	['Rainstorm']='Storm',		['Aurorastorm']='Storm',	['Voidstorm']='Storm',
	--Bard Songs
	["Mage's Ballad"]='Ballad',	["Mage's Ballad II"]='Ballad',	["Mage's Ballad III"]='Ballad',	['Raptor Mazurka']='Mazurka',	['Chocobo Mazurka']='Mazurka',
	['Valor Minuet']='Minuet',	['Valor Minuet II']='Minuet',	['Valor Minuet III']='Minuet',	['Valor Minuet IV']='Minuet',	['Valor Minuet V']='Minuet',
	["Knight's Minne"]='Minne',	["Knight's Minne II"]='Minne',	["Knight's Minne III"]='Minne',	["Knight's Minne IV"]='Minne',	["Knight's Minne V"]='Minne',
	['Advancing March']='March',	['Victory March']='March',	['Sword Madrigal']='Madrigal',	['Blade Madrigal']='Madrigal',	["Goddess's Hymnus"]='Hymnus',
	['Sinewy Etude']='Etude',	['Dextrous Etude']='Etude',	['Vivacious Etude']='Etude',	['Quick Etude']='Etude',	['Learned Etude']='Etude',
	['Spirited Etude']='Etude',	['Enchanting Etude']='Etude',	['Herculean Etude']='Etude',	['Uncanny Etude']='Etude',	['Vital Etude']='Etude',
	['Swift Etude']='Etude',	['Sage Etude']='Etude',		['Logical Etude']='Etude',	['Bewitching Etude']='Etude',	["Army's Paeon"]='Paeon',
	["Army's Paeon II"]='Paeon',	["Army's Paeon III"]='Paeon',	["Army's Paeon IV"]='Paeon',	["Army's Paeon V"]='Paeon',	["Army's Paeon VI"]='Paeon',
	['Fire Carol']='Carol',		['Ice Carol']='Carol',		['Wind Carol']='Carol',		['Earth Carol']='Carol',	['Lightning Carol']='Carol',
	['Water Carol']='Carol',	['Light Carol']='Carol',	['Dark Carol']='Carol',		['Fire Carol II']='Carol',	['Ice Carol II']='Carol',
	['Wind Carol II']='Carol',	['Earth Carol II']='Carol',	['Lightning Carol II']='Carol',	['Water Carol II']='Carol',	['Light Carol II']='Carol',
	['Dark Carol II']='Carol',	['Foe Lullaby']='Lullaby',	['Foe Lullaby II']='Lullaby',	['Horde Lullaby']='Lullaby',	['Horde Lullaby II']='Lullaby',
	['Fire Threnody']='Threnody',	['Ice Threnody']='Threnody',	['Wind Threnody']='Threnody',	['Earth Threnody']='Threnody',	['Lightning Threnody']='Threnody',
	['Water Threnody']='Threnody',	['Light Threnody']='Threnody',	['Dark Threnody']='Threnody',	['Battlefield Elegy']='Elegy',	['Carnage Elegy']='Elegy',
	['Foe Requiem']='Requiem',	['Foe Requiem II']='Requiem',	['Foe Requiem III']='Requiem',	['Foe Requiem IV']='Requiem',	['Foe Requiem V']='Requiem',
	['Foe Requiem VI']='Requiem',	['Foe Requiem VII']='Requiem',	["Sentinel's Scherzo"]='Scherzo',['Magic Finale']='Finale',	['Pining Nocturne']='Nocturne',
	["Hunter's Prelude"]='Prelude',	["Archer's Prelude"]='Prelude',	['Sheepfoe Mambo']='Mambo',	['Dragonfoe Mambo']='Mambo',
	--Ninjutsu
	['Utsusemi: Ichi']='Utsusemi',	['Utsusemi: Ni']='Utsusemi',	['Tonko: Ichi']='NinBuff',	['Tonko: Ni']='NinBuff',	['Monomi: Ichi']='NinBuff',
	['Myoshu: Ichi']='NinBuff',	['Migawari: Ichi']='NinBuff',	['Kakka: Ichi']='NinBuff',	['Kurayami: Ichi']='NinEnfeeb',	['Kurayami: Ni']='NinEnfeeb',
	['Hojo: Ichi']='NinEnfeeb',	['Hojo: Ni']='NinEnfeeb',	['Dokumori: Ichi']='NinEnfeeb',	['Jubaku: Ichi']='NinEnfeeb',	['Aisha: Ichi']='NinEnfeeb',
	['Yurin: Ichi']='NinEnfeeb',	['Katon: Ichi']='NinNuke',	['Suiton: Ichi']='NinNuke',	['Raiton: Ichi']='NinNuke',	['Doton: Ichi']='NinNuke',
	['Huton: Ichi']='NinNuke',	['Hyoton: Ichi']='NinNuke',	['Katon: Ni']='NinNuke',	['Suiton: Ni']='NinNuke',	['Raiton: Ni']='NinNuke',
	['Doton: Ni']='NinNuke',	['Huton: Ni']='NinNuke',	['Hyoton: Ni']='NinNuke',	['Katon: San']='NinNuke',	['Suiton: San']='NinNuke',
	['Raiton: San']='NinNuke',	['Doton: San']='NinNuke',	['Huton: San']='NinNuke',	['Hyoton: San']='NinNuke',
	--Offensive Magic
	['Banish']='Banish',		['Banish II']='Banish',		['Banish III']='Banish',	['Banishga']='Banish',		['Banishga II']='Banish',
	['Holy']='Holy',		['Holy II']='Holy',		['Drain']='Drain',		['Drain II']='Drain',		['Aspir']='Aspir',
	['Aspir II']='Aspir',		['Absorb-Str']='Absorb',	['Absorb-Dex']='Absorb',	['Absorb-Vit']='Absorb',	['Absorb-Agi']='Absorb',
	['Absorb-Int']='Absorb',	['Absorb-Mnd']='Absorb',	['Absorb-Chr']='Absorb',	['Absorb-Acc']='Absorb',	['Absorb-TP']='Absorb',
	['Absorb-Attri']='Absorb',	['Burn']='ElementalEnfeeble',	['Frost']='ElementalEnfeeble',	['Choke']='ElementalEnfeeble',	['Rasp']='ElementalEnfeeble',
	['Shock']='ElementalEnfeeble',	['Drown']='ElementalEnfeeble',	['Pyrohelix']='Helix',		['Cryohelix']='Helix',		['Anemohelix']='Helix',
	['Geohelix']='Helix',		['Ionohelix']='Helix',		['Hydrohelix']='Helix',		['Luminohelix']='Helix',	['Noctohelix']='Helix',
	['Break']='Break',		['Breakga']='Break',		['Sleep']='Sleep I',		['Sleepga']='Sleep I',		['Sheep Song']='Sleep I',
	['Sleep II']='Sleep II',	['Sleepga II']='Sleep II',	['Repose']='Sleep II',		['Yawn']='Sleep II',		['Soporific']='Sleep II',
	['Dream Flower']='Sleep II',
	--lolPUP
	['Fire Maneuver']='Maneuver',	['Ice Maneuver']='Maneuver',	['Wind Maneuver']='Maneuver',	['Earth Maneuver']='Maneuver',	['Thunder Maneuver']='Maneuver',
	['Water Maneuver']='Maneuver',	['Light Maneuver']='Maneuver',	['Dark Maneuver']='Maneuver',
	--Geo
	['Indi-Regen']='Indi',		['Indi-Poison']='Indi',		['Indi-Refresh']='Indi',	['Indi-Haste']='Indi',		['Indi-STR']='Indi',
	['Indi-DEX']='Indi',		['Indi-VIT']='Indi',		['Indi-AGI']='Indi',		['Indi-INT']='Indi',		['Indi-MND']='Indi',
	['Indi-CHR']='Indi',		['Indi-Fury']='Indi',		['Indi-Barrier']='Indi',	['Indi-Acumen']='Indi',		['Indi-Fend']='Indi',
	['Indi-Precision']='Indi',	['Indi-Voidance']='Indi',	['Indi-Focus']='Indi',		['Indi-Attunement']='Indi',	['Indi-Wilt']='Indi',
	['Indi-Frailty']='Indi',	['Indi-Fade']='Indi',		['Indi-Malaise']='Indi',	['Indi-Slip']='Indi',		['Indi-Torpor']='Indi',
	['Indi-Vex']='Indi',		['Indi-Languor']='Indi',	['Indi-Slow']='Indi',		['Indi-Paralysis']='Indi',	['Indi-Gravity']='Indi',
	['Geo-Regen']='Geo',		['Geo-Poison']='Geo',		['Geo-Refresh']='Geo',		['Geo-Haste']='Geo',		['Geo-STR']='Geo',
	['Geo-DEX']='Geo',		['Geo-VIT']='Geo',		['Geo-AGI']='Geo',		['Geo-INT']='Geo',		['Geo-MND']='Geo',
	['Geo-CHR']='Geo',		['Geo-Fury']='Geo',		['Geo-Barrier']='Geo',		['Geo-Acumen']='Geo',		['Geo-Fend']='Geo',
	['Geo-Precision']='Geo',	['Geo-Voidance']='Geo',		['Geo-Focus']='Geo',		['Geo-Attunement']='Geo',	['Geo-Wilt']='Geo',
	['Geo-Frailty']='Geo',		['Geo-Fade']='Geo',		['Geo-Malaise']='Geo',		['Geo-Slip']='Geo',		['Geo-Torpor']='Geo',
	['Geo-Vex']='Geo',		['Geo-Languor']='Geo',		['Geo-Slow']='Geo',		['Geo-Paralysis']='Geo',	['Geo-Gravity']='Geo',
	--Cor Shots
	['Fire Shot']='QuickDraw',	['Ice Shot']='QuickDraw',	['Wind Shot']='QuickDraw',	['Earth Shot']='QuickDraw',	['Thunder Shot']='QuickDraw',
	['Water Shot']='QuickDraw',	['Light Shot']='QuickDraw',	['Dark Shot']='QuickDraw',
}

spirits = S{"LightSpirit", "DarkSpirit", "FireSpirit", "EarthSpirit", "WaterSpirit", "AirSpirit", "IceSpirit", "ThunderSpirit"}
avatars = S{"Carbuncle", "Fenrir", "Diabolos", "Ifrit", "Titan", "Leviathan", "Garuda", "Shiva", "Ramuh", "Odin", "Alexander", "Cait Sith"}
bps = {}
bps.magical = S{'Inferno','Earthen Fury','Tidal Wave','Aerial Blast','Diamond Dust','Judgment Bolt','Searing Light','Howling Moon','Ruinous Omen','Fire II','Stone II','Water II','Aero II','Blizzard II','Thunder II','Fire IV','Stone IV','Water IV','Aero IV','Blizzard IV','Thunder IV','Thunderspark','Burning Strike','Meteorite','Nether Blast','Flaming Crush','Meteor Strike','Heavenly Strike','Wind Blade','Geocrush','Grand Fall','Thunderstorm','Holy Mist','Lunar Bay','Night Terror','Level ? Holy'}
bps.nuke = S{'Fire II','Stone II','Water II','Aero II','Blizzard II','Thunder II','Fire IV','Stone IV','Water IV','Aero IV','Blizzard IV','Thunder IV'}
bps.heal = S{'Healing Ruby','Healing Ruby II','Whispering Wind','Spring Water'}

bps.cure = {['Carbuncle']='Healing Ruby'}
bps.curaga = {['Carbuncle']='Healing Ruby II',['Garuda']='Whispering Wind',['Leviathan']='Spring Water'}
bps.buffoffense = {['Carbuncle']='Glittering Ruby',['Ifrit']='Crimson Howl',['Garuda']='Hastega II',['Ramuh']='Rolling Thunder',['Fenrir']='Ecliptic Growl'}
bps.buffdefense = {['Carbuncle']='Shining Ruby',['Shiva']='Frost Armor',['Garuda']='Aerial Armor',['Titan']='Earthen Ward',['Ramuh']='Lightning Armor',['Fenrir']='Ecliptic Howl',['Diabolos']='Noctoshield',['Cait Sith']='Reraise II'}
bps.buffspecial = {['Shiva']='Crystal Blessing',['Ifrit']='Inferno Howl',['Garuda']='Fleet Wind',['Titan']='Earthen Armor',['Diabolos']='Dream Shroud',['Leviathan']='Soothing Current',['Carbuncle']='Soothing Ruby',['Fenrir']='Heavenward Howl',['Cait Sith']='Raise II'}
bps.debuff1 = {['Shiva']='Diamond Storm',['Ramuh']='Shock Squall',['Leviathan']='Tidal Roar',['Fenrir']='Lunar Cry',['Diabolos']='Pavor Nocturnus',['Cait Sith']='Eerie Eye'}
bps.debuff2 = {['Shiva']='Sleepga',['Leviathan']='Slowga',['Fenrir']='Lunar Roar',['Diabolos']='Somnolence'}
bps.sleep = {['Shiva']='Sleepga',['Diabolos']='Nightmare',['Cait Sith']='Mewing Lullaby'}
bps.nuke2 = {['Ifrit']='Fire II',['Shiva']='Blizzard II',['Garuda']='Aero II',['Titan']='Stone II',['Ramuh']='Thunder II',['Leviathan']='Water II'}
bps.nuke4 = {['Ifrit']='Fire IV',['Shiva']='Blizzard IV',['Garuda']='Aero IV',['Titan']='Stone IV',['Ramuh']='Thunder IV',['Leviathan']='Water IV'}
bps.bp70 = {['Ifrit']='Flaming Crush',['Shiva']='Rush',['Garuda']='Predator Claws',['Titan']='Mountain Buster',['Ramuh']='Volt Strike',['Leviathan']='Spinning Dive',['Carbuncle']='Meteorite',['Fenrir']='Eclipse Bite',['Diabolos']='Nether Blast',['Cait Sith']='Regal Scratch'}
bps.bp75 = {['Ifrit']='Meteor Strike',['Shiva']='Heavenly Strike',['Garuda']='Wind Blade',['Titan']='Crag Throw',['Ramuh']='Thunderstorm',['Leviathan']='Grand Fall',['Carbuncle']='Holy Mist',['Fenrir']='Lunar Bay',['Diabolos']='Night Terror',['Cait Sith']='Level ? Holy'}
bps.astralflow = {['Ifrit']='Inferno',['Shiva']='Diamond Dust',['Garuda']='Aerial Blast',['Titan']='Earthen Fury',['Ramuh']='Judgment Bolt',['Leviathan']='Tidal Wave',['Carbuncle']='Searing Light',['Fenrir']='Howling Moon',['Diabolos']='Ruinous Omen',['Cait Sith']="Altana's Favor"}

smn_cmds = S{'cure','curaga','buffoffense','buffdefense','buffspecial','debuff1','debuff2','sleep','nuke2','nuke4','bp70','bp75','astralflow'}

no_skill_spells_list = S{'Haste','Refresh','Regen','Protect','Protectra','Shell','Shellra','Raise','Reraise','Cursna','Sneak','Invisible','Deodorize'}
var_potency_enfeebs = S{'Slow','Slow II','Paralyze','Paralyze II','Addle'}

blu_statmap = {["Acrid Stream"]="MND",["Amorphic Spikes"]="DEXINT",["Asuran Claws"]="STRDEX",["Barbed Crescent"]="DEX",["Battle Dance"]="STR",["Benthic Typhoon"]="AGI",["Blastbomb"]="INT",["Blazing Bound"]="STR",["Blitzstrahl"]="INTMND",["Bludgeon"]="CHR",["Body Slam"]="VIT",["Bomb Toss"]="INT",["Cannonball"]="STRVIT",["Charged Whisker"]="DEX",["Claw Cyclone"]="DEX",["Corrosive Ooze"]="INT",["Cursed Sphere"]="INT",["Dark Orb"]="INT",["Death Ray"]="INTMND",["Death Scissors"]="STR",["Delta Thrust"]="STRVIT",["Diffusion Ray"]="MND",["Dimensional Death"]="STR",["Disseverment"]="STRDEX",["Empty Thrash"]="STR",["Everyone's Grudge"]="MND",["Eyes on Me"]="CHR",["Feather Storm"]="AGI",["Firespit"]="INTMND",["Foot Kick"]="STRDEX",["Frenetic Rip"]="STRDEX",["Frypan"]="STRMND",["Gates of Hades"]="STRDEX",["Glutinous Dart"]="STRVIT",["Goblin Rush"]="STRDEX",["Grand Slam"]="VIT",["Head Butt"]="STRINT",["Heavy Strike"]="STR",["Helldive"]="AGI",["Hydro Shot"]="AGI",["Hysteric Barrage"]="DEX",["Ice Break"]="INT",["Jet Stream"]="AGI",["Leafstorm"]="STR",["Maelstrom"]="INTMND",["Magic Hammer"]="MND",["Mandibular Bite"]="STRINT",["Mind Blast"]="MND",["Mysterious Light"]="CHR",["Pinecone Bomb"]="STRAGI",["Power Attack"]="VIT",["Quad. Continuum"]="STRVIT",["Quadrastrike"]="STR",["Queasyshroom"]="INT",["Rail Cannon"]="MND",["Ram Charge"]="STRMND",["Regurgitation"]="MND",["Sandspin"]="INT",["Screwdriver"]="STRMND",["Seedspray"]="DEX",["Sickle Slash"]="DEX",["Sinker Drill"]="DEX",["Smite of Rage"]="STRDEX",["Spinal Cleave"]="STR",["Spiral Spin"]="AGI",["Sprout Smack"]="VIT",["Sub-zero Smash"]="VIT",["Sudden Lunge"]="AGI",["Tail Slap"]="STRVIT",["Terror Touch"]="DEXINT",["Thermal Pulse"]="VIT",["Thrashing Assault"]="STRDEX",["Thunderbolt"]="INTMND",["Tourbillion"]="STRMND",["Uppercut"]="STR",["Vanity Dive"]="DEX",["Vertical Cleave"]="STR",["Water Bomb"]="INTMND",["Whirl of Rage"]="STRMND",["Wild Oats"]="AGI"}
blu_typemap = {["Amplification"]="Buff",["Animating Wail"]="Buff",["Auroral Drape"]="Enfeeb",["Awful Eye"]="Enfeeb",["Bad Breath"]="Breath",["Barrier Tusk"]="Buff",["Battery Charge"]="Buff",["Chaotic Eye"]="Enfeeb",["Cimicine Discharge"]="Enfeeb",["Cocoon"]="Buff",["Cold Wave"]="Enfeeb",["Diamondhide"]="Buff",["Dream Flower"]="Enfeeb",["Enervation"]="Enfeeb",["Erratic Flutter"]="Buff",["Exuviation"]="Buff",["Fantod"]="Buff",["Feather Barrier"]="Buff",["Filamented Hold"]="Enfeeb",["Flying Hip Press"]="Breath",["Frightful Roar"]="Enfeeb",["Frost Breath"]="Breath",["Harden Shell"]="Buff",["Healing Breeze"]="Heal",["Heat Breath"]="Breath",["Hecatomb Wave"]="Breath",["Infrasonics"]="Enfeeb",["Light of Penance"]="Enfeeb",["Lowing"]="Enfeeb",["Magic Barrier"]="Buff",["Magic Fruit"]="Heal",["Magnetite Cloud"]="Breath",["Memento Mori"]="Buff",["Metallic Body"]="Buff",["Mortal Ray"]="Enfeeb",["Nature's Meditation"]="Buff",["Occultation"]="Buff",["Orcish Counterstance"]="Buff",["Plenilune Embrace"]="Heal",["Poison Breath"]="Breath",["Pollen"]="Heal",["Pyric Bulwark"]="Buff",["Radiant Breath"]="Breath",["Reactor Cool"]="Buff",["Refueling"]="Buff",["Regeneration"]="Buff",["Restoral"]="Heal",["Saline Coat"]="Buff",["Sandspray"]="Enfeeb",["Sheep Song"]="Enfeeb",["Soporific"]="Enfeeb",["Thunder Breath"]="Breath",["Triumphant Roar"]="Buff",["Vapor Spray"]="Breath",["Venom Shell"]="Enfeeb",["Warm-Up"]="Buff",["White Wind"]="Heal",["Wind Breath"]="Breath",["Winds of Promyvion"]="Buff",["Yawn"]="Enfeeb",["Zephyr Mantle"]="Buff"}

debuff_to_na = {['Blind']='Blindna',['Paralyze']='Paralyna',['Poison']='Poisona',['Silence']='Silena'}

num2rom = {'I','II','III','IV','V','VI','VII','VIII','IX','X','XI'}

low_tier_nukes = S{'Stone','Water','Aero','Fire','Blizzard','Thunder','Stone II','Water II','Aero II','Fire II','Blizzard II','Thunder II','Stonega','Waterga','Aeroga','Firaga','Blizzaga','Thundaga','Stonera','Watera','Aerora','Fira','Blizzara','Thundara','Geohelix','Hydrohelix','Anemohelix','Pyrohelix','Cryohelix','Ionohelix','Luminohelix','Noctohelix'}

--------------------------------------------------------------------------------
--			Mappings for elemental gear
--------------------------------------------------------------------------------
gear_map = {}

gear_map.Obi = {['Light']='Korin Obi', ['Dark']='Anrin Obi', ['Fire']='Karin Obi', ['Ice']='Hyorin Obi', ['Wind']='Furin Obi', ['Earth']='Dorin Obi', ['Lightning']='Rairin Obi', ['Water']='Suirin Obi'}
gear_map.Gorget = {['Light']='Light Gorget', ['Dark']='Shadow Gorget', ['Fire']='Flame Gorget', ['Ice']='Snow Gorget', ['Wind']='Breeze Gorget', ['Earth']='Soil Gorget', ['Lightning']='Thunder Gorget', ['Water']='Aqua Gorget'}
gear_map.Belt = {['Light']='Light Belt', ['Dark']='Shadow Belt', ['Fire']='Flame Belt', ['Ice']='Snow Belt', ['Wind']='Breeze Belt', ['Earth']='Soil Belt', ['Lightning']='Thunder Belt', ['Water']='Aqua Belt'}
gear_map.FastcastStaff = {['Light']='Arka I', ['Dark']='Xsaeta I', ['Fire']='Atar I', ['Ice']='Vourukasha I', ['Wind']='Vayuvata I', ['Earth']='Vishrava I', ['Lightning']='Apamajas I', ['Water']='Haoma I', ['Thunder']='Apamajas I'}
gear_map.RecastStaff = {['Light']='Arka II', ['Dark']='Xsaeta II', ['Fire']='Atar II', ['Ice']='Vourukasha II', ['Wind']='Vayuvata II', ['Earth']='Vishrava II', ['Lightning']='Apamajas II', ['Water']='Haoma II', ['Thunder']='Apamajas II'}

gear_map.ftp = {}
gear_map.ftp['neck'] = {['Light']='Light Gorget', ['Dark']='Shadow Gorget', ['Fire']='Flame Gorget', ['Ice']='Snow Gorget', ['Wind']='Breeze Gorget', ['Earth']='Soil Gorget', ['Lightning']='Thunder Gorget', ['Water']='Aqua Gorget'}
gear_map.ftp['waist'] = {['Light']='Light Belt', ['Dark']='Shadow Belt', ['Fire']='Flame Belt', ['Ice']='Snow Belt', ['Wind']='Breeze Belt', ['Earth']='Soil Belt', ['Lightning']='Thunder Belt', ['Water']='Aqua Belt'}

ignore_items = S{'Gil','pearlsack','copper A.M.A.N. voucher','flask of holy water','shihei','inoshishinofuda','shikanofuda','chonofuda','flask of echo drops'}