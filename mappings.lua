-----------------------------------------------------------------------------------------------------------
-- Adapted from Mote's GearSwap files by Ragnarok.Lorand
-- Mappings, lists and sets to describe game relationships that aren't easily determinable otherwise.
-----------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------
-- Instrument lists for String and Wind types
-----------------------------------------------------------------------------------------------------------
instruments = {}
instruments.string = S{
	"Angel Lyre", "Camaraderie Harp", "Crooner's Cithara", "Cythara Anglica", "Cythara Anglica +1", "Daurdabla",
	"Ebony Harp", "Ebony Harp +1", "Ebony Harp +2", "Harp", "Harp +1", "Lamia Harp", "Langeleik", "Maple Harp", "Maple Harp +1",
	"Military Harp", "Mythic Harp", "Mythic Harp +1", "Nursemaid's Harp", "Oneiros Harp", "Pyf Harp", "Rose Harp", "Rose Harp +1",
	"Sorrowful Harp", "Terpander", "Vihuela"
}
instruments.wind = S{
	"Angel's Flute", "Angel's Flute +1", "Apollo's Flute", "Cantabank's Horn", "Cornette", "Cornette +1", "Cornette +2", "Cradle Horn",
	"Crumhorn", "Crumhorn +1", "Crumhorn +2", "Dynamis Horn", "Eminent Flute", "Faerie Piccolo", "Flute", "Flute +1", "Flute +2",
	"Forefront Flute", "Frenzy Fife", "Gemshorn", "Gemshorn +1", "Gjallarhorn", "Hamelin Flute", "Harlequin's Horn", "Hellish Bugle", "Hellish Bugle +1",
	"Homestead Flute", "Horn", "Horn +1", "Iron Ram Horn", "Kingdom Horn", "Linos", "Mary's Horn", "Mass Chalemie", "Millennium Horn", "Ney", "Oliphant",
	"Pan's Horn", "Piccolo", "Piccolo +1", "Pyrrhic Horn", "Relic Horn", "Requiem Flute", "Ryl.Spr. Horn", "San D'Orian Horn", "Shofar", "Shofar +1",
	"Siren Flute", "Storm Fife", "Syrinx", "Traversiere", "Traversiere +1", "Traversiere +2"
}

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

-----------------------------------------------------------------------------------------------------------
-- Elemental mappings for element relationships and certian types of spells.
-----------------------------------------------------------------------------------------------------------
elements = {}
elements.list = S{'Light','Dark','Fire','Ice','Wind','Earth','Lightning','Water'}

elements.nuke_of = {['Light']='Banish',['Dark']=nil,['Fire']='Fire',['Ice']='Blizzard',['Wind']='Aero',['Earth']='Stone',['Lightning']='Thunder',['Water']='Water'}
elements.nukega_of = {['Light']='Banishga',['Dark']=nil,['Fire']='Firaga',['Ice']='Blizzaga',['Wind']='Aeroga',['Earth']='Stonega',['Lightning']='Thundaga',['Water']='Waterga'}
elements.nukeja_of = {['Light']=nil,['Dark']=nil,['Fire']='Firaja',['Ice']='Blizzaja',['Wind']='Aeroja',['Earth']='Stoneja',['Lightning']='Thundaja',['Water']='Waterja'}
elements.weak_to = {['Light']='Dark',['Dark']='Light',['Fire']='Ice',['Ice']='Wind',['Wind']='Earth',['Earth']='Lightning',['Lightning']='Water',['Water']='Fire'}
elements.strong_to = {['Light']='Dark',['Dark']='Light',['Fire']='Water',['Ice']='Fire',['Wind']='Ice',['Earth']='Wind',['Lightning']='Earth',['Water']='Lightning'}
elements.storm_of = {['Light']="Aurorastorm",['Dark']="Voidstorm",['Fire']="Firestorm",['Ice']="Hailstorm",['Wind']="Windstorm",['Earth']="Sandstorm",['Lightning']="Thunderstorm",['Water']="Rainstorm"}
elements.spirit_of = {['Light']="Light Spirit",['Dark']="Dark Spirit",['Fire']="Fire Spirit",['Ice']="Ice Spirit",['Wind']="Air Spirit",['Earth']="Earth Spirit",['Lightning']="Thunder Spirit",['Water']="Water Spirit"}

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

-----------------------------------------------------------------------------------------------------------
-- Spell mappings allow defining a general category or description for sets of related spells.
-----------------------------------------------------------------------------------------------------------

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
	['Break'] = 'Break',		['Breakga'] = 'Break',		['Sleep'] = 'Sleep I',		['Sleepga'] = 'Sleep I',	['Sheep Song'] = 'Sleep I',
	['Sleep II'] = 'Sleep II',	['Sleepga II'] = 'Sleep II',	['Repose'] = 'Sleep II',	['Yawn'] = 'Sleep II',		['Soporific'] = 'Sleep II',
	['Dream Flower'] = 'Sleep II',
	--lolPUP
	['Fire Maneuver']='Maneuver',	['Ice Maneuver']='Maneuver',	['Wind Maneuver']='Maneuver',	['Earth Maneuver']='Maneuver',	['Thunder Maneuver']='Maneuver',
	['Water Maneuver']='Maneuver',	['Light Maneuver']='Maneuver',	['Dark Maneuver']='Maneuver',
}

no_skill_spells_list = S{'Haste','Refresh','Regen','Protect','Protectra','Shell','Shellra','Raise','Reraise','Cursna','Sneak','Invisible','Deodorize'}
var_potency_enfeebs = S{'Slow','Slow II','Paralyze','Paralyze II','Addle'}

blu_statmap = {["Acrid Stream"]="MND",["Amorphic Spikes"]="DEXINT",["Asuran Claws"]="STRDEX",["Barbed Crescent"]="DEX",["Battle Dance"]="STR",["Benthic Typhoon"]="AGI",["Blastbomb"]="INT",["Blazing Bound"]="STR",["Blitzstrahl"]="INTMND",["Bludgeon"]="CHR",["Body Slam"]="VIT",["Bomb Toss"]="INT",["Cannonball"]="STRVIT",["Charged Whisker"]="DEX",["Claw Cyclone"]="DEX",["Corrosive Ooze"]="INT",["Cursed Sphere"]="INT",["Dark Orb"]="INT",["Death Ray"]="INTMND",["Death Scissors"]="STR",["Delta Thrust"]="STRVIT",["Diffusion Ray"]="MND",["Dimensional Death"]="STR",["Disseverment"]="STRDEX",["Empty Thrash"]="STR",["Everyone's Grudge"]="MND",["Eyes on Me"]="CHR",["Feather Storm"]="AGI",["Firespit"]="INTMND",["Foot Kick"]="STRDEX",["Frenetic Rip"]="STRDEX",["Frypan"]="STRMND",["Gates of Hades"]="STRDEX",["Glutinous Dart"]="STRVIT",["Goblin Rush"]="STRDEX",["Grand Slam"]="VIT",["Head Butt"]="STRINT",["Heavy Strike"]="STR",["Helldive"]="AGI",["Hydro Shot"]="AGI",["Hysteric Barrage"]="DEX",["Ice Break"]="INT",["Jet Stream"]="AGI",["Leafstorm"]="STR",["Maelstrom"]="INTMND",["Magic Hammer"]="MND",["Mandibular Bite"]="STRINT",["Mind Blast"]="MND",["Mysterious Light"]="CHR",["Pinecone Bomb"]="STRAGI",["Power Attack"]="VIT",["Quad. Continuum"]="STRVIT",["Quadrastrike"]="STR",["Queasyshroom"]="INT",["Rail Cannon"]="MND",["Ram Charge"]="STRMND",["Regurgitation"]="MND",["Sandspin"]="INT",["Screwdriver"]="STRMND",["Seedspray"]="DEX",["Sickle Slash"]="DEX",["Sinker Drill"]="DEX",["Smite of Rage"]="STRDEX",["Spinal Cleave"]="STR",["Spiral Spin"]="AGI",["Sprout Smack"]="VIT",["Sub-zero Smash"]="VIT",["Sudden Lunge"]="AGI",["Tail Slap"]="STRVIT",["Terror Touch"]="DEXINT",["Thermal Pulse"]="VIT",["Thrashing Assault"]="STRDEX",["Thunderbolt"]="INTMND",["Tourbillion"]="STRMND",["Uppercut"]="STR",["Vanity Dive"]="DEX",["Vertical Cleave"]="STR",["Water Bomb"]="INTMND",["Whirl of Rage"]="STRMND",["Wild Oats"]="AGI"}
blu_typemap = {["Amplification"]="Buff",["Animating Wail"]="Buff",["Auroral Drape"]="Enfeeb",["Awful Eye"]="Enfeeb",["Bad Breath"]="Breath",["Barrier Tusk"]="Buff",["Battery Charge"]="Buff",["Chaotic Eye"]="Enfeeb",["Cimicine Discharge"]="Enfeeb",["Cocoon"]="Buff",["Cold Wave"]="Enfeeb",["Diamondhide"]="Buff",["Dream Flower"]="Enfeeb",["Enervation"]="Enfeeb",["Erratic Flutter"]="Buff",["Exuviation"]="Buff",["Fantod"]="Buff",["Feather Barrier"]="Buff",["Filamented Hold"]="Enfeeb",["Flying Hip Press"]="Breath",["Frightful Roar"]="Enfeeb",["Frost Breath"]="Breath",["Harden Shell"]="Buff",["Healing Breeze"]="Heal",["Heat Breath"]="Breath",["Hecatomb Wave"]="Breath",["Infrasonics"]="Enfeeb",["Light of Penance"]="Enfeeb",["Lowing"]="Enfeeb",["Magic Barrier"]="Buff",["Magic Fruit"]="Heal",["Magnetite Cloud"]="Breath",["Memento Mori"]="Buff",["Metallic Body"]="Buff",["Mortal Ray"]="Enfeeb",["Nature's Meditation"]="Buff",["Occultation"]="Buff",["Orcish Counterstance"]="Buff",["Plenilune Embrace"]="Heal",["Poison Breath"]="Breath",["Pollen"]="Heal",["Pyric Bulwark"]="Buff",["Radiant Breath"]="Breath",["Reactor Cool"]="Buff",["Refueling"]="Buff",["Regeneration"]="Buff",["Restoral"]="Heal",["Saline Coat"]="Buff",["Sandspray"]="Enfeeb",["Sheep Song"]="Enfeeb",["Soporific"]="Enfeeb",["Thunder Breath"]="Breath",["Triumphant Roar"]="Buff",["Vapor Spray"]="Breath",["Venom Shell"]="Enfeeb",["Warm-Up"]="Buff",["White Wind"]="Heal",["Wind Breath"]="Breath",["Winds of Promyvion"]="Buff",["Yawn"]="Enfeeb",["Zephyr Mantle"]="Buff"}

debuff_to_na = {['Blind']='Blindna',['Paralyze']='Paralyna',['Poison']='Poisona',['Silence']='Silena'}

-----------------------------------------------------------------------------------------------------------
-- Tables to specify general area groupings.  Creates the 'areas' table to be referenced in job files.
-- Zone names provided by world.area/world.zone are currently in all-caps, so defining the same way here.
-----------------------------------------------------------------------------------------------------------
areas = {}

-- City areas for town gear and behavior.
areas.Cities = S{
	"Ru'Lude Gardens","Upper Jeuno","Lower Jeuno","Port Jeuno",
	"Port Windurst","Windurst Waters","Windurst Woods","Windurst Walls","Heavens Tower",
	"Port San d'Oria","Northern San d'Oria","Southern San d'Oria",
	"Port Bastok","Bastok Markets","Bastok Mines","Metalworks",
	"Aht Urhgan Whitegate","Nashmau","Tavanazian Safehold","Norg","Kazham",
	"Selbina","Mhaura","Eastern Adoulin","Western Adoulin"
}
-- Adoulin areas, where Ionis will grant special stat bonuses.
areas.Adoulin = S{
	"Yahse Hunting Grounds","Ceizak Battlegrounds","Foret de Hennetiel","Morimar Basalt Fields",
	"Yorcia Weald","Yorcia Weald [U]","Cirdas Caverns","Cirdas Caverns [U]",
	"Marjami Ravine","Kamihr Drifts","Sih Gates","Moh Gates",
	"Dho Gates","Woh Gates","Rala Waterways","Rala Waterways [U]",
	"Outer Ra'Kaznar","Outer Ra'Kaznar [U]"
}

-----------------------------------------------------------------------------------------------------------
-- Lists of certain NPCs.
-----------------------------------------------------------------------------------------------------------
npcs = {}
npcs.Trust = S{'Ayame','Naji','Nanaa Mihgo','Tenzen','Volker','Zeid','Ajido-Marujido','Shantotto','Curilla','Excenmille','Trion','Valaineral','Kupipi','Mihli Aliapoh','Joachim','Lion'}

-----------------------------------------------------------------------------------------------------------
-- Mappings for elemental gear
-----------------------------------------------------------------------------------------------------------
gear_map = {}

gear_map.Obi = {['Light']='Korin Obi', ['Dark']='Anrin Obi', ['Fire']='Karin Obi', ['Ice']='Hyorin Obi', ['Wind']='Furin Obi', ['Earth']='Dorin Obi', ['Lightning']='Rairin Obi', ['Water']='Suirin Obi'}
gear_map.Gorget = {['Light']='Light Gorget', ['Dark']='Shadow Gorget', ['Fire']='Flame Gorget', ['Ice']='Snow Gorget', ['Wind']='Breeze Gorget', ['Earth']='Soil Gorget', ['Lightning']='Thunder Gorget', ['Water']='Aqua Gorget'}
gear_map.Belt = {['Light']='Light Belt', ['Dark']='Shadow Belt', ['Fire']='Flame Belt', ['Ice']='Snow Belt', ['Wind']='Breeze Belt', ['Earth']='Soil Belt', ['Lightning']='Thunder Belt', ['Water']='Aqua Belt'}
gear_map.FastcastStaff = {['Light']='Arka I', ['Dark']='Xsaeta I', ['Fire']='Atar I', ['Ice']='Vourukasha I', ['Wind']='Vayuvata I', ['Earth']='Vishrava I', ['Lightning']='Apamajas I', ['Water']='Haoma I', ['Thunder']='Apamajas I'}
gear_map.RecastStaff = {['Light']='Arka II', ['Dark']='Xsaeta II', ['Fire']='Atar II', ['Ice']='Vourukasha II', ['Wind']='Vayuvata II', ['Earth']='Vishrava II', ['Lightning']='Apamajas II', ['Water']='Haoma II', ['Thunder']='Apamajas II'}

gear_map.ftp = {}
gear_map.ftp['neck'] = {['Light']='Light Gorget', ['Dark']='Shadow Gorget', ['Fire']='Flame Gorget', ['Ice']='Snow Gorget', ['Wind']='Breeze Gorget', ['Earth']='Soil Gorget', ['Lightning']='Thunder Gorget', ['Water']='Aqua Gorget'}
gear_map.ftp['waist'] = {['Light']='Light Belt', ['Dark']='Shadow Belt', ['Fire']='Flame Belt', ['Ice']='Snow Belt', ['Wind']='Breeze Belt', ['Earth']='Soil Belt', ['Lightning']='Thunder Belt', ['Water']='Aqua Belt'}

-----------------------------------------------------------------------------------------------------------
--	Elemental spell damage information
-----------------------------------------------------------------------------------------------------------
magic_stats = {
	['Stone'] =		{V=10,L1=50,M0=2,  L2=100,M50=1,L3=200,M3=0,Max_N=1},
	['Water'] =		{V=25,L1=50,M0=1.8,L2=100,M50=1,L3=200,M3=0,Max_N=1},
	['Aero'] =		{V=40,L1=50,M0=1.6,L2=100,M50=1,L3=200,M3=0,Max_N=1},
	['Fire'] =		{V=55,L1=50,M0=1.4,L2=100,M50=1,L3=200,M3=0,Max_N=1},
	['Blizzard'] =		{V=70,L1=50,M0=1.2,L2=100,M50=1,L3=200,M3=0,Max_N=1},
	['Thunder'] =		{V=85,L1=50,M0=1,  L2=100,M50=1,L3=200,M3=0,Max_N=1},

	['Stone II'] =		{V=100,L1=50,M0=3,  L2=100,M50=2,  L3=200,M3=1,Max_N=1},
	['Water II'] =		{V=120,L1=50,M0=2.8,L2=100,M50=1.9,L3=200,M3=1,Max_N=1},
	['Aero II'] =		{V=140,L1=50,M0=2.6,L2=100,M50=1.8,L3=200,M3=1,Max_N=1},
	['Fire II'] =		{V=160,L1=50,M0=2.4,L2=100,M50=1.7,L3=200,M3=1,Max_N=1},
	['Blizzard II'] =	{V=180,L1=50,M0=2.2,L2=100,M50=1.6,L3=200,M3=1,Max_N=1},
	['Thunder II'] =	{V=200,L1=50,M0=2,  L2=100,M50=1.5,L3=200,M3=1,Max_N=1},

	['Stone III'] =		{V=200,L1=50,M0=4,  L2=100,M50=3,  L3=200,M3=2,   Max_N=1},
	['Water III'] =		{V=230,L1=50,M0=3.7,L2=100,M50=2.9,L3=200,M3=1.95,Max_N=1},
	['Aero III'] =		{V=260,L1=50,M0=3.4,L2=100,M50=2.8,L3=200,M3=1.9, Max_N=1},
	['Fire III'] =		{V=290,L1=50,M0=3.1,L2=100,M50=2.7,L3=200,M3=1.85,Max_N=1},
	['Blizzard III'] =	{V=320,L1=50,M0=2.8,L2=100,M50=2.6,L3=200,M3=1.8, Max_N=1},
	['Thunder III'] =	{V=350,L1=50,M0=2.5,L2=100,M50=2.5,L3=200,M3=1.75,Max_N=1},

	['Stone IV'] =		{V=400,L1=50,M0=5,  L2=100,M50=4,  L3=200,M3=3,   Max_N=1},
	['Water IV'] =		{V=440,L1=50,M0=4.7,L2=100,M50=3.9,L3=200,M3=2.95,Max_N=1},
	['Aero IV'] =		{V=480,L1=50,M0=4.4,L2=100,M50=3.8,L3=200,M3=2.9, Max_N=1},
	['Fire IV'] =		{V=520,L1=50,M0=4.2,L2=100,M50=3.7,L3=200,M3=2.85,Max_N=1},
	['Blizzard IV'] =	{V=560,L1=50,M0=3.9,L2=100,M50=3.6,L3=200,M3=2.8, Max_N=1},
	['Thunder IV'] =	{V=600,L1=50,M0=3.6,L2=100,M50=3.5,L3=200,M3=2.75,Max_N=1},

	['Stone V'] =		{V=650,L1=50,M0=6,  L2=100,M50=5,   L3=200,M3=4,   Max_N=1},
	['Water V'] =		{V=700,L1=50,M0=5.6,L2=100,M50=4.74,L3=200,M3=3.95,Max_N=1},
	['Aero V'] =		{V=750,L1=50,M0=5.2,L2=100,M50=4.5, L3=200,M3=3.9, Max_N=1},
	['Fire V'] =		{V=800,L1=50,M0=4.8,L2=100,M50=4.24,L3=200,M3=3.85,Max_N=1},
	['Blizzard V'] =	{V=850,L1=50,M0=4.4,L2=100,M50=4,   L3=200,M3=3.8, Max_N=1},
	['Thunder V'] =		{V=900,L1=50,M0=4,  L2=100,M50=3.74,L3=200,M3=3.75,Max_N=1},

	['Quake'] =		{V=700,L1=50,M0=2,L2=100,M50=2,L3=200,M3=2,Max_N=1},
	['Flood'] =		{V=700,L1=50,M0=2,L2=100,M50=2,L3=200,M3=2,Max_N=1},
	['Tornado'] =		{V=700,L1=50,M0=2,L2=100,M50=2,L3=200,M3=2,Max_N=1},
	['Flare'] =		{V=700,L1=50,M0=2,L2=100,M50=2,L3=200,M3=2,Max_N=1},
	['Freeze'] =		{V=700,L1=50,M0=2,L2=100,M50=2,L3=200,M3=2,Max_N=1},
	['Burst'] =		{V=700,L1=50,M0=2,L2=100,M50=2,L3=200,M3=2,Max_N=1},
	['Impact'] =		{V=700,L1=50,M0=2,L2=100,M50=2,L3=200,M3=2,Max_N=1},

	['Quake II'] =		{V=800, L1=50,M0=2,L2=100,M50=2.00,L3=200,M3=2.0,Max_N=1},
	['Flood II'] =		{V=800, L1=50,M0=2,L2=100,M50=2.00,L3=200,M3=2.0,Max_N=1},
	['Tornado II'] =	{V=800, L1=50,M0=2,L2=100,M50=2.00,L3=200,M3=2.0,Max_N=1},
	['Flare II'] =		{V=800, L1=50,M0=2,L2=100,M50=2.00,L3=200,M3=2.0,Max_N=1},
	['Freeze II'] =		{V=800, L1=50,M0=2,L2=100,M50=2.00,L3=200,M3=2.0,Max_N=1},
	['Burst II'] =		{V=800, L1=50,M0=2,L2=100,M50=2.00,L3=200,M3=2.0,Max_N=1},
	['Comet'] =		{V=1000,L1=50,M0=4,L2=100,M50=3.75,L3=200,M3=3.5,Max_N=1},

	['Stonega'] =		{V=60, L1=50,M0=3.0,L2=100,M50=2.0,L3=200,M3=1.00,Max_N=10},
	['Waterga'] =		{V=80, L1=50,M0=2.8,L2=100,M50=1.9,L3=200,M3=1.00,Max_N=10},
	['Aeroga'] =		{V=100,L1=50,M0=2.6,L2=100,M50=1.8,L3=200,M3=1.00,Max_N=10},
	['Firaga'] =		{V=120,L1=50,M0=2.4,L2=100,M50=1.7,L3=200,M3=1.00,Max_N=10},
	['Blizzaga'] =		{V=160,L1=50,M0=2.2,L2=100,M50=1.6,L3=200,M3=1.00,Max_N=10},
	['Thundaga'] =		{V=200,L1=50,M0=2.0,L2=100,M50=1.5,L3=200,M3=1.00,Max_N=10},

	['Stonega II'] =	{V=250,L1=50,M0=4.0,L2=100,M50=3.0,L3=200,M3=2.00,Max_N=10},
	['Waterga II'] =	{V=280,L1=50,M0=3.7,L2=100,M50=2.9,L3=200,M3=1.95,Max_N=10},
	['Aeroga II'] =		{V=310,L1=50,M0=3.4,L2=100,M50=2.8,L3=200,M3=1.90,Max_N=10},
	['Firaga II'] =		{V=340,L1=50,M0=3.1,L2=100,M50=2.7,L3=200,M3=1.85,Max_N=10},
	['Blizzaga II'] =	{V=370,L1=50,M0=2.8,L2=100,M50=2.6,L3=200,M3=1.80,Max_N=10},
	['Thundaga II'] =	{V=400,L1=50,M0=2.5,L2=100,M50=2.5,L3=200,M3=1.75,Max_N=10},

	['Stonega III'] =	{V=500,L1=50,M0=5.0,L2=100,M50=4.0,L3=200,M3=3.00,Max_N=10},
	['Waterga III'] =	{V=540,L1=50,M0=4.7,L2=100,M50=3.9,L3=200,M3=2.95,Max_N=10},
	['Aeroga III'] =	{V=580,L1=50,M0=4.4,L2=100,M50=3.8,L3=200,M3=2.90,Max_N=10},
	['Firaga III'] =	{V=620,L1=50,M0=4.2,L2=100,M50=3.7,L3=200,M3=2.85,Max_N=10},
	['Blizzaga III'] =	{V=660,L1=50,M0=3.9,L2=100,M50=3.6,L3=200,M3=2.80,Max_N=10},
	['Thundaga III'] =	{V=700,L1=50,M0=3.6,L2=100,M50=3.5,L3=200,M3=2.75,Max_N=10},

	['Stoneja'] =		{V=750, L1=50,M0=6.0,L2=100,M50=5.00,L3=200,M3=4.00,Max_N=10},
	['Waterja'] =		{V=800, L1=50,M0=5.6,L2=100,M50=4.75,L3=200,M3=3.95,Max_N=10},
	['Aeroja'] =		{V=850, L1=50,M0=5.2,L2=100,M50=4.50,L3=200,M3=3.90,Max_N=10},
	['Firaja'] =		{V=900, L1=50,M0=4.8,L2=100,M50=4.25,L3=200,M3=3.85,Max_N=10},
	['Blizzaja'] =		{V=950, L1=50,M0=4.4,L2=100,M50=4.00,L3=200,M3=3.80,Max_N=10},
	['Thundaja'] =		{V=1000,L1=50,M0=4.0,L2=100,M50=3.75,L3=200,M3=3.75,Max_N=10},

	['Geohelix'] =		{V=0,L1=75,M0=1.1,L2=85,M50=0.75,L3=200,M3=0.5,Max_N=1},
	['Hydrohelix'] =	{V=0,L1=75,M0=1.1,L2=85,M50=0.75,L3=200,M3=0.5,Max_N=1},
	['Anemohelix'] =	{V=0,L1=75,M0=1.1,L2=85,M50=0.75,L3=200,M3=0.5,Max_N=1},
	['Pyrohelix'] =		{V=0,L1=75,M0=1.1,L2=85,M50=0.75,L3=200,M3=0.5,Max_N=1},
	['Cryohelix'] =		{V=0,L1=75,M0=1.1,L2=85,M50=0.75,L3=200,M3=0.5,Max_N=1},
	['Ionohelix'] =		{V=0,L1=75,M0=1.1,L2=85,M50=0.75,L3=200,M3=0.5,Max_N=1},
	['Luminohelix'] =	{V=0,L1=75,M0=1.1,L2=85,M50=0.75,L3=200,M3=0.5,Max_N=1},
	['Noctohelix'] =	{V=0,L1=75,M0=1.1,L2=85,M50=0.75,L3=200,M3=0.5,Max_N=1},
}