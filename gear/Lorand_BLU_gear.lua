--------------------------------------------------------------------------------
--[[
    Author: Ragnarok.Lorand

    Base Set                               40       DD                              60      CW                             60
    Actinic Burst       Refresh     4/8     4       Blazing Bound       Dual Wield   3      Magic Hammer        MAB 1/2     4
    Winds of Promyvion  Refresh     4/8     5       Quadratic Continuum Dual Wield   4      Charged Whisker                 4
    Dream Flower        MAB         1/2     3       Delta Thrust        Dual Wield   2      Ice Break                       3
    Yawn                                    3       Headbutt                         3      Thermal Pulse                   3
    Battery Charge                          3       Empty Thrash        DA/TA        3      Memento Mori        MAB         4
    Animating Wail      Dual Wield          5       Acrid Stream        DA/TA        3      Blood Saber                     2
    Sub-zero Smash      Fast Cast   1/2     4       Asuran Claws                     2          
    Auroral Drape       Fast Cast   1/2     4
    Cocoon                                  1
    Magic Fruit                             3
    Whirl of Rage                           2
    Frypan              HP Boost    1/2     3
--]]
--------------------------------------------------------------------------------

function init_gear_sets()
    --============================================================
    --          Precast sets
    --============================================================
    sets.precast.JA['Burst Affinity'] = {feet="Mavi Basmak +2"}
    sets.precast.JA['Chain Affinity'] = {head="Mavi Kavuk +2"}
    sets.precast.JA['Efflux'] = {legs="Mavi Tayt +2"}
    
    sets.precast.FC = {
        ammo="Impatiens",           --
        head="Haruspex Hat",        --
        neck="Orunmila's Torque",   --5%
        ear1="Loquacious Earring",  --
        body="Taeon Tabard",        --4%
        hands="Thaumas Gloves",     --4%
        ring1="Prolix Ring",        --
        ring2="Veneficium Ring",    --
        back="Swith Cape",          --
        waist="Witful Belt",        --
        legs="Enif Cosciales",      --
        feet="Chelona Boots"        --
    }
    sets.precast.FC.BlueMagic = {
        body="Mavi Mintan +2"       --
    }
    
    sets.precast.FC.EnhancingMagic = {waist="Siegel Sash"}
    sets.precast.FC.Cure = {back="Pahtli Cape"}
    sets.precast.FC.Curaga = sets.precast.FC.Cure

    --============================================================
    
    sets.wsBase = {
        ammo="Honed Tathlum",
        head={name="Taeon Chapeau", augments={'Accuracy+18 Attack+18','"Triple Atk."+2','Crit. hit damage +2%'}},
        neck="Asperity Necklace",
        ear1="Bladeborn Earring",
        ear2="Steelflash Earring",
        body="Qaaxo Harness",
        hands={name="Taeon Gloves", augments={'Accuracy+15 Attack+15','"Triple Atk."+2','DEX+7'}},
        ring1="Rajas Ring",
        ring2="Epona's Ring",
        back="Atheling Mantle",
        waist="Windbuffet Belt +1",
        legs={name="Taeon Tights", augments={'Accuracy+15 Attack+15','"Triple Atk."+2','STR+7 DEX+7'}},
        feet="Jhakri Pigaches"
    }
    sets.wsBase.Magic = {
        ammo="Dosis Tathlum",
        head="Jhakri Coronal",
        neck="Eddy Necklace",
        ear1="Hecate's Earring",
        ear2="Friomisi Earring",
        body="Jhakri Robe",
        hands={name="Helios Gloves", augments={'"Mag.Atk.Bns."+25','Mag. crit. hit dmg. +8%'}},
        ring1="Fenrir Ring +1",
        ring2="Acumen Ring",
        back="Cornflower Cape",
        waist="Aswang Sash",
        legs={name="Hagondes Pants +1", augments={'Phys. dmg. taken -2%','"Mag.Atk.Bns."+17'}},
        feet={name="Helios Boots", augments={'"Mag.Atk.Bns."+24','Magic crit. hit rate +3','Magic burst mdg.+2%'}}
    }
    
    --============================================================
    --          Midcast sets
    --============================================================
    sets.midcast.FastRecast = {
        ammo="Impatiens",
        head={name="Helios Band", augments={'"Mag.Atk.Bns."+18','Spell interruption rate down -3%'}},
        neck="Orunmila's Torque",
        ear1="Loquacious Earring",
        ear2="Novia Earring",
        body={name="Taeon Tabard", augments={'Accuracy+17 Attack+17','Haste+2','STR+6 DEX+6'}},
        hands={name="Buremte Gloves", augments={'Haste+2','"Snapshot"+2','"Fast Cast"+3'}},
        ring1="Prolix Ring",
        ring2={name="Diamond Ring", augments={'INT+2','MND+2','Spell interruption rate down -2%'}},
        back="Swith Cape",
        waist="Witful Belt",
        legs={name="Quiahuiz Trousers", augments={'Phys. dmg. taken -2%','Magic dmg. taken -2%','"Fast Cast"+3'}},
        feet={name="Taeon Boots", augments={'Accuracy+17 Attack+17','"Dual Wield"+5','STR+6 DEX+6'}}
    }

    sets.midcast.Cure = {
        hands="Telchine Gloves",    ring1="Asklepian Ring", ring2="Kunaji Ring",
        waist="Chuq'aba Belt"
    }
    sets.midcast.Cure.with_buff = {}
    sets.midcast.Curaga = sets.midcast.Cure

    sets.midcast.Cursna = {}
    
    sets.midcast.EnhancingMagic = {
        neck="Colossus's Torque",
        body="Telchine Chasuble",
        waist="Cascade Belt"
    }
    sets.midcast.Aquaveil = {waist="Emphatikos Rope"}
    sets.midcast.Stoneskin = {
        neck="Stone Gorget",        ear1="Loquacious Earring",  ear2="Earthcry Earring",
        hands="Telchine Gloves",    ring1="Aquasoul Ring",      ring2="Aqua Ring",
        back="Tuilha Cape",         waist="Siegel Sash",        legs="Haven Hose",      feet="Hagondes Sabots +1"
    }

    sets.midcast.MagicAccuracy = {
        head="Jhakri Coronal",  neck="Eddy Necklace",   ear1="Lifestorm Earring",   ear2="Psystorm Earring",
        body="Jhakri Robe",     hands={name="Hagondes Cuffs +1", augments={'Phys. dmg. taken -1%','Mag. Acc.+6'}},
        ring1="Sangoma Ring",   ring2="Perception Ring",
        back="Cornflower Cape", waist="Ovate Rope",     legs="Jhakri Slops",        feet="Jhakri Pigaches"
    }
    
    sets.midcast.BlueMagic = {
        ammo="Mavi Tathlum",
        back="Cornflower Cape"
    }
    
    sets.midcast.BlueMagic.Physical = { ammo="Honed Tathlum",
        head="Jhakri Coronal",  neck="Asperity Necklace",   ear1="Suppanomimi", ear2="Heartseeker Earring",
        body="Jhakri Robe",     hands="Jhakri Cuffs",       ring1="Rajas Ring", ring2="Mars's Ring",
        back={name="Cornflower Cape", augments={'MP+18','DEX+1','Accuracy+1','Blue Magic skill +9'}},
        waist="Prosilio Belt",  legs="Jhakri Slops",        feet="Jhakri Pigaches"
    }
    sets.midcast.BlueMagic.Physical.AGI = {
        head={name="Taeon Chapeau", augments={'Accuracy+18 Attack+18','"Triple Atk."+2','Crit. hit damage +2%'}},
        neck="Hope Torque",
        ring1="Stormsoul Ring",
        legs={name="Taeon Tights", augments={'Accuracy+15 Attack+15','"Triple Atk."+2','STR+7 DEX+7'}},
        feet={name="Taeon Boots", augments={'Accuracy+17 Attack+17','"Dual Wield"+5','STR+6 DEX+6'}}
    }
    sets.midcast.BlueMagic.Physical.CHR = {}
    sets.midcast.BlueMagic.Physical.DEX = {
        head={name="Taeon Chapeau", augments={'Accuracy+18 Attack+18','"Triple Atk."+2','Crit. hit damage +2%'}},
        neck="Love Torque",
        hands={name="Taeon Gloves", augments={'Accuracy+15 Attack+15','"Triple Atk."+2','DEX+7'}},
        ring2="Thundersoul Ring",
        legs={name="Taeon Tights", augments={'Accuracy+15 Attack+15','"Triple Atk."+2','STR+7 DEX+7'}},
        feet={name="Taeon Boots", augments={'Accuracy+17 Attack+17','"Dual Wield"+5','STR+6 DEX+6'}}
    }
    sets.midcast.BlueMagic.Physical.INT = {
        ring1="Icesoul Ring",   ring2="Diamond Ring",
    }
    sets.midcast.BlueMagic.Physical.MND = {
        ring1="Aqua Ring",  ring2="Aquasoul Ring",
        waist="Cascade Belt",
    }
    sets.midcast.BlueMagic.Physical.STR = {
        neck="Justice Torque",
        hands={name="Taeon Gloves", augments={'Accuracy+25','"Dual Wield"+4','STR+7 DEX+7'}},
        ring2="Pyrosoul Ring",
    }
    sets.midcast.BlueMagic.Physical.VIT = {
        head={name="Taeon Chapeau", augments={'Accuracy+18 Attack+18','"Triple Atk."+2','Crit. hit damage +2%'}},
        body={name="Taeon Tabard", augments={'Accuracy+17 Attack+17','Haste+2','STR+6 DEX+6'}},
        hands={name="Taeon Gloves", augments={'Accuracy+15 Attack+15','"Triple Atk."+2','DEX+7'}},
        ring1="Terrasoul Ring", ring2="Spiral Ring",
        waist="Chuq'aba Belt",
        legs={name="Taeon Tights", augments={'Accuracy+15 Attack+15','"Triple Atk."+2','STR+7 DEX+7'}},
        feet={name="Taeon Boots", augments={'Accuracy+17 Attack+17','"Dual Wield"+5','STR+6 DEX+6'}}
    }
    sets.midcast.BlueMagic.Physical.DEXINT = {
        neck="Love Torque",
        hands={name="Taeon Gloves", augments={'Accuracy+15 Attack+15','"Triple Atk."+2','DEX+7'}},
        ring2="Thundersoul Ring",
        legs={name="Taeon Tights", augments={'Accuracy+15 Attack+15','"Triple Atk."+2','STR+7 DEX+7'}},
    }
    sets.midcast.BlueMagic.Physical.STRAGI = {
        neck="Justice Torque",
        ring2="Pyrosoul Ring",
        waist="Prosilio Belt",  legs="Nahtirah Trousers",   feet="Iuitl Gaiters +1"
    }
    sets.midcast.BlueMagic.Physical.STRDEX = {
        hands={name="Taeon Gloves", augments={'Accuracy+25','"Dual Wield"+4','STR+7 DEX+7'}},
        ring2="Pyrosoul Ring",
        legs={name="Taeon Tights", augments={'Accuracy+15 Attack+15','"Triple Atk."+2','STR+7 DEX+7'}},
        feet={name="Taeon Boots", augments={'Accuracy+17 Attack+17','"Dual Wield"+5','STR+6 DEX+6'}}
    }
    sets.midcast.BlueMagic.Physical.STRINT = {
        ring2="Spiral Ring",
    }
    sets.midcast.BlueMagic.Physical.STRMND = {
        ring2="Pyrosoul Ring",
    }
    sets.midcast.BlueMagic.Physical.STRVIT = {
        hands={name="Taeon Gloves", augments={'Accuracy+25','"Dual Wield"+4','STR+7 DEX+7'}},
        ring2="Spiral Ring",
    }
    sets.midcast.BlueMagic.Physical['Cannonball'] = {   --Uses def instead of att
        head="Whirlpool Mask",  neck="Stone Gorget",
        body="Qaaxo Harness",   hands="Iuitl Wristbands +1",    ring1="Paguroidea Ring",    ring2="Provocare Ring",
        back="Ogapepo Cape",    waist="Cetl Belt",              legs="Nahtirah Trousers",
        feet={name="Taeon Boots", augments={'Accuracy+17 Attack+17','"Dual Wield"+5','STR+6 DEX+6'}}
    }

    sets.midcast.BlueMagic.Magic = {
        ammo="Dosis Tathlum",
        head="Jhakri Coronal",  neck="Eddy Necklace",   ear1="Hecate's Earring",    ear2="Friomisi Earring",
        body="Jhakri Robe",
        hands={name="Helios Gloves", augments={'"Mag.Atk.Bns."+25','Mag. crit. hit dmg. +8%'}},
        ring1="Fenrir Ring +1",
        ring2="Acumen Ring",
        back={name="Cornflower Cape", augments={'MP+18','DEX+1','Accuracy+1','Blue Magic skill +9'}},
        waist="Aswang Sash",
        legs={name="Hagondes Pants +1", augments={'Phys. dmg. taken -2%','"Mag.Atk.Bns."+17'}},
        feet={name="Helios Boots", augments={'"Mag.Atk.Bns."+24','Magic crit. hit rate +3','Magic burst mdg.+2%'}}
    }
    sets.midcast.BlueMagic.Magic.CHR = {}
    sets.midcast.BlueMagic.Magic.DEX = {}
    sets.midcast.BlueMagic.Magic.INT = {}
    sets.midcast.BlueMagic.Magic.MND = {}
    sets.midcast.BlueMagic.Magic.STR = {}
    sets.midcast.BlueMagic.Magic.VIT = {}
    sets.midcast.BlueMagic.Magic.INTMND = {}
    sets.midcast.BlueMagic.Magic.STRDEX = {}
    sets.midcast.BlueMagic.Magic['Blazing Bound'] = {   --Uses MDB instead of MAB
        head="Telchine Cap",    neck="Twilight Torque",     ear1="Merman's Earring",    ear2="Merman's Earring",
        body="Iuitl Vest +1",   hands="Telchine Gloves",    ring1="Defending Ring",     ring2={name="Dark Ring", augments={'Magic dmg. taken -4%','Phys. dmg. taken -5%'}},
        back="Tuilha Cape",
        legs={name="Taeon Tights", augments={'Accuracy+15 Attack+15','"Triple Atk."+2','STR+7 DEX+7'}},
        feet={name="Taeon Boots", augments={'Accuracy+17 Attack+17','"Dual Wield"+5','STR+6 DEX+6'}}
    }
    
    sets.midcast.BlueMagic.Breath = {
        ammo="Mavi Tathlum",
        head="Mirage Keffiyeh", neck="Ardor Pendant"
    }
    
    sets.midcast.EnfeeblingMagic = {}
    sets.midcast.DarkMagic = {}
    sets.midcast.Stun = {}
    sets.midcast.DivineMagic = {}
    sets.midcast.DivineMagic.Nuke = {}
    sets.midcast.DivineMagic.Nuke.with_buff = {}
    sets.midcast.BardSong = {}
    sets.midcast.ElementalMagic = {}
    sets.midcast.ElementalMagic.with_buff = {}
    sets.midcast.ElementalMagic.Earth = {neck="Quanpur Necklace"}
    sets.midcast.ElementalMagic.Resistant = {}
    sets.midcast.ElementalEnfeeble = {}
    --============================================================
    --          Other sets
    --============================================================
    
    sets.weapons.Main = {main="Claidheamh Soluis", sub="Usonmunku"}
    sets.weapons.Magic = {main="Nehushtan", sub="Gabaxorea"}
    
    sets.resting = {                                                                    ammo="Demonry Stone",
        head="Taeon Chapeau",   neck="Eidolon Pendant",     ear1="Loquacious Earring",  ear2="Relaxing Earring",
        body="Jhakri Robe",     hands="Serpentes Cuffs",    ring1="Sangoma Ring",       ring2="Fenrir Ring +1",
        back="Felicitas Cape",  waist="Fucho-no-obi",       legs="Helios Spats",        feet="Chelona Boots"
    }
    
    sets.idle = {                                                                           ammo="Demonry Stone",
        head="Ocelomeh Headpiece +1",   neck="Orochi Nodowa",   ear1="Brachyura Earring",   ear2="Ethereal Earring",
        body="Jhakri Robe",             hands="Umuthi Gloves",  ring1="Defending Ring",     ring2="Shneddick Ring",
        back="Repulse Mantle",          waist="Flume Belt",
        legs={name="Taeon Tights", augments={'Accuracy+15 Attack+15','"Triple Atk."+2','STR+7 DEX+7'}},
        feet={name="Taeon Boots", augments={'Accuracy+17 Attack+17','"Dual Wield"+5','STR+6 DEX+6'}}
    }
    sets.idle.Learn = {hands="Magus Bazubands"}
    sets.idle.lowMP = {waist="Fucho-no-obi", legs="Nares Trews"}
    sets.idle.lowMP_night = {hands="Serpentes Cuffs"}
    sets.idle.lowMP_day = {feet="Serpentes Sabots"}
    
    sets.idle.with_buff = {}
    sets.idle.with_buff['reive mark'] = {neck="Ygnas's Resolve +1"}
    sets.idle.with_buff['doom'] = {ring1="Saida Ring", ring2="Saida Ring"}
    
    -- Defense sets
    sets.defense.PDT = {
        head="Iuitl Headgear +1",   neck="Twilight Torque", ear1="Brachyura Earring",   ear2="Ethereal Earring",
        body="Iuitl Vest +1",       hands="Umuthi Gloves",  ring1="Defending Ring",     ring2={name="Dark Ring", augments={'Magic dmg. taken -4%','Phys. dmg. taken -5%'}},
        back="Repulse Mantle",      waist="Flume Belt",     legs="Iuitl Tights +1",     feet="Iuitl Gaiters +1"
    }
    sets.defense.MDT = {                                                                ammo="Demonry Stone",
        head="Telchine Cap",    neck="Twilight Torque",     ear1="Merman's Earring",    ear2="Merman's Earring",
        body="Iuitl Vest +1",   hands="Telchine Gloves",    ring1="Defending Ring",     ring2={name="Dark Ring", augments={'Magic dmg. taken -4%','Phys. dmg. taken -5%'}},
        back="Tuilha Cape",
        legs={name="Taeon Tights", augments={'Accuracy+15 Attack+15','"Triple Atk."+2','STR+7 DEX+7'}},
        feet={name="Taeon Boots", augments={'Accuracy+17 Attack+17','"Dual Wield"+5','STR+6 DEX+6'}}
    }

    sets.engaged = {
        ammo="Honed Tathlum",
        head={name="Taeon Chapeau", augments={'Accuracy+18 Attack+18','"Triple Atk."+2','Crit. hit damage +2%'}},
        neck="Asperity Necklace",
        ear1="Dudgeon Earring",
        ear2="Heartseeker Earring",
        body="Qaaxo Harness",
        hands={name="Taeon Gloves", augments={'Accuracy+25','"Dual Wield"+4','STR+7 DEX+7'}},
        ring1="Rajas Ring",
        ring2="Epona's Ring",
        back="Atheling Mantle",
        waist="Windbuffet Belt +1",
        legs={name="Taeon Tights", augments={'Accuracy+15 Attack+15','"Triple Atk."+2','STR+7 DEX+7'}},
        feet={name="Taeon Boots", augments={'Accuracy+17 Attack+17','"Dual Wield"+5','STR+6 DEX+6'}}
    }
    sets.engaged.Learn = {
        hands="Magus Bazubands",
    }
    sets.engaged.MediumAcc = {}
    sets.engaged.HighAcc = {}
    
    sets.engaged.with_buff = {}
    sets.engaged.with_buff['reive mark'] = {neck="Ygnas's Resolve +1"}
    sets.engaged.with_buff['doom'] = {ring1="Saida Ring", ring2="Saida Ring"}
end