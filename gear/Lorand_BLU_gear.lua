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
    
    sets.wsBase = {                                                                             ammo="Honed Tathlum",
        head="Iuitl Headgear +1",   neck="Asperity Necklace",       ear1="Bladeborn Earring",   ear2="Steelflash Earring",
        body="Qaaxo Harness",       hands="Iuitl Wristbands +1",    ring1="Rajas Ring",         ring2="Epona's Ring",
        back="Atheling Mantle",     waist="Windbuffet Belt +1",     legs="Quiahuiz Trousers",   feet="Manibozho Boots"
    }
    sets.wsBase.Magic = {                                                                   ammo="Dosis Tathlum",
        head="Hagondes Hat +1",     neck="Eddy Necklace",       ear1="Hecate's Earring",    ear2="Friomisi Earring",
        body="Hagondes Coat +1",    hands="Hagondes Cuffs +1",  ring1="Fenrir Ring +1",     ring2="Acumen Ring",
        back="Cornflower Cape",     waist="Aswang Sash",        legs="Hagondes Pants +1",   feet="Hagondes Sabots +1"
    }
    
    --============================================================
    --          Midcast sets
    --============================================================
    sets.midcast.FastRecast = {                                                             ammo="Impatiens",
        head="Iuitl Headgear +1",   neck="Orunmila's Torque",   ear1="Loquacious Earring",  ear2="Novia Earring",
        body="Hagondes Coat +1",    hands="Hagondes Cuffs +1",  ring1="Prolix Ring",        ring2="Diamond Ring",
        back="Swith Cape",          waist="Witful Belt",        legs="Enif Cosciales",      feet="Hagondes Sabots +1"
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
        head="Hagondes Hat +1",     neck="Eddy Necklace",       ear1="Lifestorm Earring",   ear2="Psystorm Earring",
        body="Hagondes Coat +1",    hands="Hagondes Cuffs +1",  ring1="Sangoma Ring",       ring2="Perception Ring",
        back="Cornflower Cape",     waist="Ovate Rope",         legs="Iuitl Tights +1",     feet="Iuitl Gaiters +1"
    }
    
    sets.midcast.BlueMagic = {
        ammo="Mavi Tathlum",
        back="Cornflower Cape"
    }
    
    sets.midcast.BlueMagic.Physical = {
        head="Uk'uxkaj Cap",    neck="Justice Torque",          ear1="Heartseeker Earring", ear2="Steelflash Earring",
        body="Iuitl Vest +1",   hands="Iuitl Wristbands +1",    ring1="Rajas Ring",         ring2="Mars's Ring",
        back="Cornflower Cape", waist="Anguinus Belt",          legs="Iuitl Tights +1",     feet="Iuitl Gaiters +1"
    }
    sets.midcast.BlueMagic.Physical.AGI = {
        ear2="Suppanomimi",
        ring2="Stormsoul Ring",
        back="Ik Cape",         waist="Sveltesse Gouriz",   legs="Nahtirah Trousers"
    }
    sets.midcast.BlueMagic.Physical.CHR = {
        body="Hagondes Coat +1",    hands="Telchine Gloves",
        back="Swith Cape",          legs="Hagondes Pants +1",       feet="Hagondes Sabots +1"
    }
    sets.midcast.BlueMagic.Physical.DEX = {
        ammo="Jukukik Feather",
        neck="Love Torque",         ear1="Pixie Earring",
        ring2="Thundersoul Ring",
        back="Kayapa Cape",         waist="Warwolf Belt"
    }
    sets.midcast.BlueMagic.Physical.INT = {
        ear2="Psystorm Earring",
        body="Hagondes Coat +1",    hands="Telchine Gloves",    ring1="Icesoul Ring",   ring2="Spiral Ring",
        legs="Hagondes Pants +1",   feet="Hagondes Sabots +1"
    }
    sets.midcast.BlueMagic.Physical.MND = {
        ear1="Lifestorm Earring",
        body="Hagondes Coat +1",    hands="Hagondes Cuffs +1",  ring2="Aquasoul Ring",
        waist="Cascade Belt",       legs="Hagondes Pants +1",   feet="Hagondes Sabots +1"
    }
    sets.midcast.BlueMagic.Physical.STR = {
        head="Whirlpool Mask",
        ring2="Pyrosoul Ring",
        back="Buquwik Cape",    waist="Prosilio Belt",  legs="Nahtirah Trousers",   feet="Iuitl Gaiters +1"
    }
    sets.midcast.BlueMagic.Physical.VIT = {
        head="Whirlpool Mask",
        ring1="Terrasoul Ring", ring2="Spiral Ring",
        back="Iximulew Cape",   waist="Chuq'aba Belt",  legs="Nahtirah Trousers",   feet="Iuitl Gaiters +1"
    }
    sets.midcast.BlueMagic.Physical.DEXINT = {
        neck="Love Torque",     ear1="Pixie Earring",       ear2="Psystorm Earring",
        ring2="Spiral Ring",
        waist="Warwolf Belt",   legs="Hagondes Pants +1",   feet="Hagondes Sabots +1"
    }
    sets.midcast.BlueMagic.Physical.STRAGI = {
        head="Whirlpool Mask",
        ring2="Pyrosoul Ring",
        waist="Prosilio Belt",  legs="Nahtirah Trousers",   feet="Iuitl Gaiters +1"
    }
    sets.midcast.BlueMagic.Physical.STRDEX = {
        ear1="Pixie Earring",
        ring2="Pyrosoul Ring",
        waist="Warwolf Belt",   legs="Nahtirah Trousers",   feet="Iuitl Gaiters +1"
    }
    sets.midcast.BlueMagic.Physical.STRINT = {
        ear2="Psystorm Earring",
        body="Hagondes Coat +1",    hands="Hagondes Cuffs +1",  ring2="Spiral Ring",
        waist="Prosilio Belt",      legs="Nahtirah Trousers",   feet="Hagondes Sabots +1"
    }
    sets.midcast.BlueMagic.Physical.STRMND = {
        ear1="Lifestorm Earring",
        body="Hagondes Coat +1",    ring2="Pyrosoul Ring",
        waist="Prosilio Belt",      legs="Nahtirah Trousers",   feet="Hagondes Sabots +1"       
    }
    sets.midcast.BlueMagic.Physical.STRVIT = {
        head="Whirlpool Mask",
        ring2="Spiral Ring",
        waist="Chuq'aba Belt",  legs="Nahtirah Trousers",   feet="Iuitl Gaiters +1"
    }
    sets.midcast.BlueMagic.Physical['Cannonball'] = {   --Uses def instead of att
        head="Whirlpool Mask",  neck="Stone Gorget",
        body="Qaaxo Harness",   hands="Iuitl Wristbands +1",    ring1="Paguroidea Ring",    ring2="Spiral Ring",
        back="Ogapepo Cape",    waist="Cetl Belt",              legs="Nahtirah Trousers",   feet="Iuitl Gaiters +1"
    }

    sets.midcast.BlueMagic.Magic = {
        ammo="Dosis Tathlum",
        head="Hagondes Hat +1",     neck="Eddy Necklace",       ear1="Hecate's Earring",    ear2="Friomisi Earring",
        body="Hagondes Coat +1",    hands="Hagondes Cuffs +1",  ring1="Fenrir Ring +1",     ring2="Acumen Ring",
        back="Cornflower Cape",     waist="Aswang Sash",        legs="Hagondes Pants +1",   feet="Hagondes Sabots +1"
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
        head="Hagondes Hat +1",
        body="Hagondes Coat +1",    hands="Hagondes Cuffs +1",
        legs="Hagondes Pants +1",   feet="Hagondes Sabots +1"
    }
    
    sets.midcast.BlueMagic.Breath = {
        ammo="Mavi Tathlum",
        head="Mirage Keffiyeh"
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
    
    sets.resting = {
        head="Hagondes Hat +1",     neck="Eidolon Pendant",     ear1="Loquacious Earring",  ear2="Relaxing Earring",
        body="Hagondes Coat +1",    hands="Serpentes Cuffs",    ring1="Sangoma Ring",       ring2="Fenrir Ring +1",
        back="Felicitas Cape",      waist="Emphatikos Rope",    legs="Hagondes Pants +1",   feet="Chelona Boots"
    }
    
    sets.idle = {
        ammo="Demonry Stone",
        head="Ocelomeh Headpiece +1",   neck="Orochi Nodowa",           ear1="Brachyura Earring",   ear2="Ethereal Earring",
        body="Hagondes Coat +1",        hands="Iuitl Wristbands +1",    ring1="Defending Ring",     ring2="Shneddick Ring",
        back="Repulse Mantle",          waist="Flume Belt",             legs="Hagondes Pants +1",   feet="Iuitl Gaiters +1"
    }
    sets.idle.lowMP = {legs="Nares Trews"}
    sets.idle.lowMP_night = {hands="Serpentes Cuffs"}
    sets.idle.lowMP_day = {feet="Serpentes Sabots"}
    
    sets.idle.with_buff = {}
    sets.idle.with_buff['reive mark'] = {neck="Ygnas's Resolve +1"}
    
    -- Defense sets
    sets.defense.PDT = sets.idle
    sets.defense.MDT = sets.idle

    sets.engaged = {
        ammo="Honed Tathlum",
        head="Whirlpool Mask",  neck="Asperity Necklace",       ear1="Bladeborn Earring",   ear2="Steelflash Earring",
        body="Qaaxo Harness",   hands="Iuitl Wristbands +1",    ring1="Rajas Ring",         ring2="Epona's Ring",
        back="Atheling Mantle", waist="Windbuffet Belt +1",     legs="Iuitl Tights +1",     feet="Iuitl Gaiters +1"
    }
    sets.engaged.Learn = {
        ammo="Honed Tathlum",
        head="Whirlpool Mask",  neck="Ziel Charm",          ear1="Bladeborn Earring",   ear2="Steelflash Earring",
        body="Iuitl Vest +1",   hands="Magus Bazubands",   ring1="Rajas Ring",          ring2="Mars's Ring",
        back="Kayapa Cape",     waist="Anguinus Belt",      legs="Iuitl Tights +1",     feet="Iuitl Gaiters +1"
    }
    
    sets.engaged.Learn1 = {
        ammo="Honed Tathlum",
        head="Whirlpool Mask",  neck="Asperity Necklace",   ear1="Bladeborn Earring",   ear2="Steelflash Earring",
        body="Qaaxo Harness",   hands="Magus Bazubands",    ring1="Rajas Ring",         ring2="Epona's Ring",
        back="Atheling Mantle", waist="Windbuffet Belt +1", legs="Iuitl Tights +1",     feet="Iuitl Gaiters +1"
    }
    sets.engaged.with_buff = {}
    sets.engaged.with_buff['reive mark'] = {neck="Ygnas's Resolve +1"}
end