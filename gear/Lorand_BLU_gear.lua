--------------------------------------------------------------------------------
--[[
    Author: Ragnarok.Lorand
--]]
--------------------------------------------------------------------------------

function init_gear_sets()
    gear.ambuDDcape = {name="Rosmerta's Cape", augments={'Accuracy+20 Attack+20','"Dbl.Atk."+10'}}
    gear.ambuSTPcape = {name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10'}}
    gear.jseCape = {name="Cornflower Cape", augments={'MP+18','DEX+1','Accuracy+1','Blue Magic skill +9'}}
    gear.nehushtan1 = {name="Nehushtan", augments={'Accuracy+5','"Dbl.Atk."+3'}}
    gear.nehushtan2 = {name="Nehushtan", augments={}}

    --============================================================
    --          Precast sets
    --============================================================
    sets.precast.JA['Burst Affinity'] = {feet="Mavi Basmak +2"}
    sets.precast.JA['Chain Affinity'] = {head="Mavi Kavuk +2"}
    sets.precast.JA['Efflux'] = {back=gear.ambuDDcape, legs="Mavi Tayt +2"}
    
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
    
    sets.wsBase = {                                                                     ammo="Honed Tathlum",
        head=gear.taeonTAhead,  neck="Asperity Necklace",   ear1="Bladeborn Earring",   ear2="Steelflash Earring",
        body="Qaaxo Harness",   hands=gear.hercHands,       ring1="Rajas Ring",         ring2="Epona's Ring",
        back=gear.ambuDDcape,   waist="Windbuffet Belt +1", legs=gear.hercLegs,         feet=gear.hercCritFeet
    }
    sets.wsBase.Magic = {                                                               ammo="Dosis Tathlum",
        head="Jhakri Coronal",  neck="Eddy Necklace",       ear1="Hecate's Earring",    ear2="Friomisi Earring",
        body="Jhakri Robe +1",  hands=gear.heliosMABhands,  ring1="Fenrir Ring +1",     ring2="Acumen Ring",
        back="Cornflower Cape", waist="Aswang Sash",        legs="Hagondes Pants +1",   feet=gear.heliosMABfeet
    }
    sets.wsBase["Chant du Cygne"] = {                                                   ammo="Jukukik Feather",
        head=gear.taeonTAhead,  neck="Asperity Necklace",   ear1="Bladeborn Earring",   ear2="Steelflash Earring",
        body="Jhakri Robe +1",  hands=gear.hercHands,       ring1="Thundersoul Ring",   ring2="Epona's Ring",
        back=gear.ambuDDcape,   waist="Fotia Belt",         legs=gear.hercLegs,         feet=gear.hercCritFeet
    }
    
    --============================================================
    --          Midcast sets
    --============================================================
    sets.midcast.FastRecast = {                                                         ammo="Impatiens",
        head=gear.hercHead,     neck="Orunmila's Torque",   ear1="Loquacious Earring",  ear2="Novia Earring",
        body="Taeon Tabard",    hands="Buremte Gloves",     ring1="Prolix Ring",        ring2=gear.diamondRing,
        back="Swith Cape",      waist="Witful Belt",        legs=gear.hercLegs,         feet=gear.hercCritFeet
    }

    sets.midcast.Cure = {
        hands="Telchine Gloves",    ring1="Asklepian Ring", ring2="Kunaji Ring",
        back="Solemnity Cape",      waist="Chuq'aba Belt"
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
        head="Jhakri Coronal",  neck="Sanctity Necklace",   ear1="Lifestorm Earring",   ear2="Psystorm Earring",
        body="Jhakri Robe +1",  hands={name="Hagondes Cuffs +1", augments={'Phys. dmg. taken -1%','Mag. Acc.+6'}},
        ring1="Sangoma Ring",   ring2="Perception Ring",
        back="Cornflower Cape", waist="Ovate Rope",         legs="Jhakri Slops +1",     feet="Jhakri Pigaches +1"
    }
    
    sets.midcast.BlueMagic = {
        ammo="Mavi Tathlum",
        back="Cornflower Cape"
    }
    
    sets.midcast.BlueMagic['Sudden Lunge'] = {                                          ammo="Honed Tathlum",
        head=gear.hercHead,     neck="Orunmila's Torque",   ear1="Loquacious Earring",  ear2="Gwati Earring",
        body="Jhakri Robe +1",  hands="Jhakri Cuffs +1",    ring1="Sangoma Ring",       ring2="Enlivened Ring",
        back=gear.jseCape,      waist="Hurch'lan Sash",     legs="Jhakri Slops +1",        feet=gear.hercAccFeet
    }
    
    sets.midcast.BlueMagic.Buff = {
        ammo="Mavi Tathlum",
        head="Luhlaza Keffiyeh",
        body="Assimilator's Jubbah +1", hands="Mavi Bazubands +2",
        back=gear.jseCape,              legs="Mavi Tayt +2",        feet="Luhlaza Charuqs +1"
    }
    
    sets.midcast.BlueMagic.Physical = {                                             ammo="Honed Tathlum",
        head="Jhakri Coronal",  neck="Asperity Necklace",   ear1="Suppanomimi",     ear2="Heartseeker Earring",
        body="Jhakri Robe +1",  hands="Jhakri Cuffs +1",    ring1="Rajas Ring",     ring2="Mars's Ring",
        back=gear.jseCape,      waist="Prosilio Belt",      legs="Jhakri Slops +1", feet="Jhakri Pigaches +1"
    }
    sets.midcast.BlueMagic.Physical.AGI = {
        head=gear.hercHead,
        neck="Hope Torque",
        ring1="Stormsoul Ring",
        legs=gear.hercLegs,
        feet=gear.hercAccFeet
    }
    sets.midcast.BlueMagic.Physical.CHR = {}
    sets.midcast.BlueMagic.Physical.DEX = {
        head=gear.hercHead,
        neck="Love Torque",
        hands=gear.hercHands,
        ring2="Thundersoul Ring",
        legs=gear.hercLegs,
        feet=gear.hercAccFeet
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
        hands=gear.taeonDWhands,
        ring2="Pyrosoul Ring",
    }
    sets.midcast.BlueMagic.Physical.VIT = {
        head=gear.taeonTAhead,
        body=gear.taeonHasteBody,
        hands=gear.taeonTAhands,
        ring1="Terrasoul Ring", ring2="Spiral Ring",
        waist="Chuq'aba Belt",
        legs=gear.taeonTAlegs,
        feet=gear.taeonDWfeet
    }
    sets.midcast.BlueMagic.Physical.DEXINT = {
        neck="Love Torque",
        hands=gear.taeonTAhands,
        ring2="Thundersoul Ring",
        legs=gear.taeonTAlegs,
    }
    sets.midcast.BlueMagic.Physical.STRAGI = {
        neck="Justice Torque",
        ring2="Pyrosoul Ring",
        waist="Prosilio Belt",  legs="Nahtirah Trousers",   feet="Iuitl Gaiters +1"
    }
    sets.midcast.BlueMagic.Physical.STRDEX = {
        hands=gear.taeonDWhands,
        ring2="Pyrosoul Ring",
        legs=gear.taeonTAlegs,
        feet=gear.taeonDWfeet
    }
    sets.midcast.BlueMagic.Physical.STRINT = {
        ring2="Spiral Ring",
    }
    sets.midcast.BlueMagic.Physical.STRMND = {
        ring2="Pyrosoul Ring",
    }
    sets.midcast.BlueMagic.Physical.STRVIT = {
        hands=gear.taeonDWhands,
        ring2="Spiral Ring",
    }
    sets.midcast.BlueMagic.Physical['Cannonball'] = {   --Uses def instead of att
        head="Whirlpool Mask",  neck="Stone Gorget",
        body="Qaaxo Harness",   hands="Iuitl Wristbands +1",    ring1="Paguroidea Ring",    ring2="Provocare Ring",
        back="Ogapepo Cape",    waist="Cetl Belt",              legs="Nahtirah Trousers",
        feet=gear.taeonDWfeet
    }

    sets.midcast.BlueMagic.Magic = {                                                    ammo="Dosis Tathlum",
        head="Jhakri Coronal",  neck="Eddy Necklace",       ear1="Hecate's Earring",    ear2="Friomisi Earring",
        body="Jhakri Robe +1",  hands=gear.heliosMABhands,  ring1="Fenrir Ring +1",     ring2="Acumen Ring",
        back=gear.jseCape,      waist="Aswang Sash",        legs=gear.hagondesPants,    feet=gear.heliosMABfeet
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
        body="Iuitl Vest +1",   hands="Telchine Gloves",    ring1="Defending Ring",     ring2=gear.darkRing1,
        back="Tuilha Cape",                                 legs=gear.taeonTAlegs,      feet=gear.taeonDWfeet
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
    
    sets.weapons.Main = {main="Tanmogayi +1", sub="Claidheamh Soluis"}
    sets.weapons.OAT = {main="Tanmogayi +1", sub="Xiutleato"}
    sets.weapons.Magic = {main=gear.nibiruClub1, sub="Bolelabunga"}
    
    sets.resting = {                                                                    ammo="Demonry Stone",
        head="Taeon Chapeau",   neck="Eidolon Pendant",     ear1="Loquacious Earring",  ear2="Relaxing Earring",
        body="Jhakri Robe +1",  hands="Serpentes Cuffs",    ring1="Sangoma Ring",       ring2="Fenrir Ring +1",
        back="Felicitas Cape",  waist="Fucho-no-obi",       legs="Helios Spats",        feet="Chelona Boots"
    }
    
    sets.idle = {                                                                       ammo="Demonry Stone",
        head=gear.hercHead,     neck="Sanctity Necklace",   ear1="Brachyura Earring",   ear2="Ethereal Earring",
        body="Jhakri Robe +1",  hands="Umuthi Gloves",      ring1="Defending Ring",     ring2="Shneddick Ring",
        back="Repulse Mantle",  waist="Flume Belt",         legs=gear.hercLegs,         feet=gear.hercCritFeet
    }
    sets.idle.DT = {                                                                        ammo="Bibiki Seashell",
        head="Iuitl Headgear +1",   neck="Twilight Torque",     ear1="Brachyura Earring",   ear2="Ethereal Earring",
        body="Jhakri Robe +1",      hands="Umuthi Gloves",      ring1="Defending Ring",     ring2="Shneddick Ring",
        back="Repulse Mantle",      waist="Flume Belt",         legs=gear.hercLegs,         feet=gear.hercCritFeet
    }
    sets.idle.Learn = {hands="Magus Bazubands"}
    sets.idle.CapFarm = {back="Mecistopins Mantle"}
    sets.idle.lowMP = {waist="Fucho-no-obi", legs="Nares Trews"}
    sets.idle.lowMP_night = {hands="Serpentes Cuffs"}
    sets.idle.lowMP_day = {feet="Serpentes Sabots"}
    
    sets.idle.with_buff = {}
    sets.idle.with_buff['reive mark'] = {neck="Ygnas's Resolve +1"}
    sets.idle.with_buff['doom'] = {ring1="Saida Ring", ring2="Saida Ring"}
    
    -- Defense sets
    sets.defense.PDT = {    ammo="Bibiki Seashell",
        head="Iuitl Headgear +1",   neck="Twilight Torque", ear1="Novia Earring",   ear2="Ethereal Earring",
        body="Iuitl Vest +1",       hands="Umuthi Gloves",  ring1="Defending Ring", ring2=gear.darkRing1,
        back="Repulse Mantle",      waist="Flume Belt",     legs=gear.hercLegs,     feet=gear.hercAccFeet
    }
    sets.defense.MDT = {                                                                ammo="Demonry Stone",
        head="Telchine Cap",    neck="Twilight Torque",     ear1="Merman's Earring",    ear2="Merman's Earring",
        body="Iuitl Vest +1",   hands="Telchine Gloves",    ring1="Defending Ring",     ring2=gear.darkRing1,
        back="Tuilha Cape",                                 legs=gear.hercLegs,         feet=gear.hercAccFeet
    }

    sets.engaged = {                                                                ammo="Hasty Pinion +1",
        head=gear.hercHead,     neck="Asperity Necklace",   ear1="Dudgeon Earring", ear2="Heartseeker Earring",
        body="Jhakri Robe +1",  hands=gear.taeonDWhands,    ring1="Rajas Ring",     ring2="Epona's Ring",
        back=gear.ambuDDcape,   waist="Windbuffet Belt +1", legs=gear.hercLegs,     feet=gear.taeonDWfeet
    }
    sets.engaged.Learn = {
        hands="Magus Bazubands",
    }
    sets.engaged.MediumAcc = {}
    sets.engaged.HighAcc = {}
    
    sets.engaged.auto = {                                                           ammo="Hasty Pinion +1",
        head=gear.hercHead,     neck="Asperity Necklace",   ear1="Dudgeon Earring", ear2="Heartseeker Earring",
        body="Jhakri Robe +1",  hands=gear.taeonDWhands,    ring1="Rajas Ring",     ring2="Epona's Ring",
        back=gear.ambuSTPcape,   waist="Windbuffet Belt +1", legs=gear.hercLegs,     feet=gear.taeonDWfeet
    }
    sets.engaged.auto['na'] =   {
    }
    sets.engaged.auto['I'] =    {
    }
    sets.engaged.auto['I+'] =   {
    }
    sets.engaged.auto['II'] =   {
        hands=gear.hercHands
    }
    sets.engaged.auto['II+'] =  {
        hands=gear.hercHands,
        feet=gear.hercCritFeet
    }
    
    sets.engaged.auto.MediumAcc = {
        neck="Sanctity Necklace",
        ring2="Chirich Ring",
        legs="Adhemar Kecks"
    }
    sets.engaged.auto.HighAcc = {   ammo="Honed Tathlum",
        neck="Sanctity Necklace",
        ring1="Mars's Ring",        ring2="Chirich Ring",
        waist="Hurch'lan Sash",     legs="Adhemar Kecks"
    }
    
    sets.engaged.CrazyAccuracy = {                                                      ammo="Honed Tathlum",
        head=gear.hercHead,     neck="Sanctity Necklace",   ear1="Steelflash Earring",  ear2="Heartseeker Earring",
        body="Jhakri Robe +1",  hands=gear.hercHands,       ring1="Mars's Ring",        ring2="Chirich Ring",
        back=gear.ambuSTPcape,  waist="Hurch'lan Sash",     legs="Adhemar Kecks",       feet=gear.hercAccFeet
    }
    
    sets.engaged.with_buff = {}
    sets.engaged.with_buff['reive mark'] = {neck="Ygnas's Resolve +1"}
    sets.engaged.with_buff['doom'] = {ring1="Saida Ring", ring2="Saida Ring"}
end