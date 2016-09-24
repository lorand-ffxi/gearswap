-----------------------------------------------------------------------------------------------------------
--[[
    Author: Ragnarok.Lorand
--]]
-----------------------------------------------------------------------------------------------------------

function init_gear_sets()
    --============================================================
    --                  Precast sets
    --============================================================
    sets.precast.FC = {             --
        main="Marin Staff +1",      --3%
        sub="Clerisy Strap",        --2%
        ammo="Incantor Stone",      --2%
        head="Nares Cap",           --10%
        neck="Orison Locket",       --5%
        ear2="Loquacious Earring",  --2%
        hands="Gendewitha Gages +1",--7%
        ring1="Prolix Ring",        --2%
        back="Swith Cape",          --3%
        waist="Witful Belt",
        legs="Artsieq Hose",        --5%
        feet="Chelona Boots"        --4%
    }
    
    sets.precast.FC.EnhancingMagic = {
        waist="Siegel Sash"
    }       
    sets.precast.FC.HealingMagic = {    --?%
        legs="Ebers Pantaloons"         --12%
    }
    sets.precast.FC.Cure = {    --60%
        main="Tamaxchi",        --n/a
        sub="Genbu's Shield",   --8%
        back="Pahtli Cape"      --8%
    }
    sets.precast.FC.Curaga = sets.precast.FC.Cure
    
    --============================================================

    sets.precast.Waltz = {
        head="Kaabnax Hat",
        body="Gendewitha Bliaut +1",    hands="Gendewitha Gages +1",    ring1="Spiral Ring",    ring2="Sirona's Ring",
        back="Swith Cape",      legs="Gendewitha Spats +1", feet="Uk'uxkaj Boots"
    }
    
    --============================================================
    
    sets.wsBase = {
        ammo="Flame Sachet",
        head="Buremte Hat",             neck="Asperity Necklace",       ear1="Bladeborn Earring",   ear2="Steelflash Earring",
        body="Gendewitha Bliaut +1",    hands="Gendewitha Gages +1",    ring1="Rajas Ring",         ring2="Spiral Ring",
        back="Buquwik Cape",            waist="Cascade Belt",           legs="Gendewitha Spats +1", feet="Uk'uxkaj Boots"
    }
    
    sets.wsBase.Magic = {
        ammo="Witchstone",
        head="Buremte Hat",     neck="Stoicheion Medal",    ear1="Hecate's Earring",    ear2="Friomisi Earring",
        body="Artsieq Jubbah",  hands="Otomi Gloves",       ring2="Acumen Ring",
        back="Toro Cape",       legs="Gendewitha Spats +1", feet="Gendewitha Galoshes +1"
    }

    --============================================================
    --                  Midcast sets
    --============================================================
    
    sets.midcast.FastRecast = {
        main="Marin Staff +1",          sub="Clerisy Strap",                                    ammo="Clarus Stone",
        head="Gendewitha Caubeen +1",   neck="Orison Locket",           ear1="Novia Earring",   ear2="Loquacious Earring",
        body="Piety Briault",           hands="Gendewitha Gages +1",    ring1="Prolix Ring",    ring2="Sangoma Ring",
        back="Ogapepo Cape",            waist="Witful Belt",            legs="Artsieq Hose",    feet="Theophany Duckbills +1"
    }
    
    sets.midcast.MagicAccuracy = {
        main="Marin Staff +1",      sub="Clerisy Strap",            ammo="Kalboron Stone",
        head="Inyanga Tiara +1",    neck="Eddy Necklace",           ear1="Lifestorm Earring",   ear2="Psystorm Earring",
        body="Artsieq Jubbah",      hands="Inyanga Dastanas +1",    ring1="Sangoma Ring",       ring2="Perception Ring",
        back="Ogapepo Cape",        waist="Ovate Rope",             legs="Artsieq Hose",        feet="Inyanga Crackows +1"
    }

    --====================== Healing =============================
    
    sets.midcast.HealingMagic = {
        body="Ebers Bliaud",    hands="Inyanga Dastanas +1",    ring1="Ephedra Ring",   ring2="Sirona's Ring",
        back="Mending Cape",    legs="Piety Pantaloons"
    }
    
    sets.midcast.Cure = {
        main="Tamaxchi",                sub="Genbu's Shield",   ammo="Incantor Stone",
        head="Gendewitha Caubeen +1",   neck="Orison Locket",   ear1="Novia Earring",       ear2="Orison Earring",
        body="Ebers Bliaud",            hands="Bokwus Gloves",  ring1="Prolix Ring",        ring2="Sirona's Ring",
        back="Mending Cape",            waist="Witful Belt",    legs="Ebers Pantaloons",    feet="Theophany Duckbills +1"
    }
    sets.midcast.Curaga = sets.midcast.Cure

    sets.midcast.Cure.Engaged = {
        body="Gendewitha Bliaut +1",
        legs="Nares Trews",     feet="Piety Duckbills"
    }
    sets.midcast.Cure.with_buff = {}
    sets.midcast.Cure.with_buff['reive mark'] = {neck="Arciela's Grace +1"}
    
    sets.midcast.Cursna = {
        neck="Malison Medallion",
        hands="Hieros Mittens",     ring1="Ephedra Ring",           ring2="Ephedra Ring",
        back="Mending Cape",        legs="Theophany Pantaloons",    feet="Gendewitha Galoshes +1"
    }

    sets.midcast.StatusRemoval = {
        head="Orison Cap +2"
    }
    
    sets.midcast.StatusRemoval['Divine Caress'] = {
        hands="Orison Mitts +2",
        back="Mending Cape"
    }

    --====================== Enhancing ===========================
    
    sets.midcast.EnhancingMagic = {
        waist="Cascade Belt",   legs="Piety Pantaloons",    feet="Orison Duckbills +2"
    }
    
    sets.midcast.Stoneskin = {
        ammo="Aqua Sachet",
        neck="Stone Gorget",    ear1="Lifestorm Earring",   ear2="Earthcry Earring",
        ring1="Solemn Ring",    ring2="Aqua Ring",
        back="Tuilha Cape",     waist="Siegel Sash",        legs="Shedir Seraweels"
    }
    sets.midcast.Auspice = {feet="Orison Duckbills +2"}
    sets.midcast.Aquaveil = {waist="Emphatikos Rope", legs="Shedir Seraweels"}

    sets.midcast.BarElement = {
        head="Orison Cap +2",
        body="Ebers Bliaud",    hands="Orison Mitts +2",
        legs="Piety Pantaloons",    feet="Orison Duckbills +2"
    }

    sets.midcast.Regen = {
        head="Inyanga Tiara +1", 
        body="Piety Briault",       hands="Orison Mitts +2",
        legs="Theophany Pantaloons"
    }
    
    sets.midcast.Protectra = {feet="Piety Duckbills"}
    sets.midcast.Shellra = {legs="Piety Pantaloons"}
    
    --====================== Offensive ===========================  
    
    sets.midcast.DivineMagic = {
        legs="Theophany Pantaloons"
    }
                
    sets.midcast.DivineMagic.Nuke = {
        main="Marin Staff +1",  sub="Zuuxowu Grip",                                 ammo="Dosis Tathlum",
        head="Buremte Hat",     neck="Eddy Necklace",   ear1="Hecate's Earring",    ear2="Friomisi Earring",
        body="Artsieq Jubbah",  hands="Otomi Gloves",   ring1="Perception Ring",    ring2="Acumen Ring",
        back="Toro Cape",       waist="Salire Belt",    legs="Telchine Braconi",    feet="Umbani Boots"
    }
    sets.midcast.DivineMagic.Nuke.with_buff = {}
    sets.midcast.DivineMagic.Nuke.with_buff['reive mark'] = {neck="Arciela's Grace +1"}
    
    sets.midcast.DarkMagic = {}

    sets.midcast.EnfeeblingMagic = {
        feet="Theophany Duckbills +1"
    }
    sets.midcast.EnfeeblingMagic.Potency = {}
    sets.midcast.EnfeeblingMagic.Potency.Resistant = {}
    sets.midcast.EnfeeblingMagic.Potency.Normal = {}
    
    sets.midcast.ElementalMagic = {
        main="Marin Staff +1",  sub="Elder's Grip +1",                                  ammo="Witchstone",
        head="Helios Band",     neck="Eddy Necklace",       ear1="Hecate's Earring",    ear2="Friomisi Earring",
        body="Artsieq Jubbah",  hands="Yaoyotl Gloves",     ring1="Sangoma Ring",       ring2="Acumen Ring",
        back="Toro Cape",       waist="Salire Belt",        legs="Telchine Braconi",    feet="Umbani Boots"
    }
    sets.midcast.ElementalMagic.LowTier = {
        main="Marin Staff +1",  sub="Zuuxowu Grip",                                 ammo="Dosis Tathlum",
        head="Buremte Hat",     neck="Eddy Necklace",   ear1="Hecate's Earring",    ear2="Friomisi Earring",
        body="Artsieq Jubbah",  hands="Otomi Gloves",   ring1="Sangoma Ring",       ring2="Acumen Ring",
        back="Toro Cape",       waist="Salire Belt",    legs="Telchine Braconi",    feet="Umbani Boots"
    }
    sets.midcast.ElementalMagic.HighTier = {}
    sets.midcast.ElementalMagic.with_buff = {}
    sets.midcast.ElementalMagic.with_buff['reive mark'] = {neck="Arciela's Grace +1"}
    sets.midcast.ElementalMagic.Earth = {neck="Quanpur Necklace"}
    
    --============================================================
    --                  Other sets
    --============================================================
    
    sets.maxMP = {
        main="Marin Staff +1",          sub="Elder's Grip +1",                                  ammo="Kalboron Stone",
        head="Kaabnax Hat",             neck="Orison Locket",       ear1="Loquacious Earring",  ear2="Star Earring",
        body="Weatherspoon Robe +1",    hands="Otomi Gloves",       ring1="Sangoma Ring",       ring2="Bifrost Ring",
        back="Pahtli Cape",             waist="Shinjutsu-no-obi",   legs="Helios Spats",        feet="Theophany Duckbills +1"
    }
    
    sets.resting = {
        main="Boonwell Staff",  sub="Achaq Grip",           ammo="Homiliary",
        neck="Eidolon Pendant",
        body="Artsieq Jubbah",  hands="Serpentes Cuffs",
        back="Felicitas Cape",  waist="Austerity Belt",     legs="Nares Trews",     feet="Chelona Boots",
    }

    sets.idle = {
        main="Bolelabunga",         sub="Genbu's Shield",                                   ammo="Homiliary",
        head="Inyanga Tiara +1",    neck="Twilight Torque",         ear1="Novia Earring",   ear2="Ethereal Earring",
        body="Artsieq Jubbah",      hands="Inyanga Dastanas +1",
        ring1={name="Dark Ring", augments={'Phys. dmg. taken -5%','Breath dmg. taken -4%','Magic dmg. taken -3%'}},
        ring2="Shneddick Ring",
        back="Repulse Mantle",        waist="Fucho-no-obi",           legs="Assiduity Pants",    feet="Inyanga Crackows +1"
    }
    sets.idle.CapFarm = {back="Mecistopins Mantle"}
    
    sets.idle.with_buff = {}
    sets.idle.with_buff['reive mark'] = {neck="Arciela's Grace +1"}
    
    sets.idle.lowMP = {waist="Fucho-no-obi"}
    sets.idle.lowMP_night = {hands="Serpentes Cuffs"}
    sets.idle.lowMP_day = {feet="Serpentes Sabots"}
    
    sets.defense.DT = {
        neck="Twilight Torque",
        ring1="Dark Ring",
        ring2="Dark Ring",
    }
    sets.defense.PDT = {
        main="Bolelabunga",             sub="Genbu's Shield",
        head="Hike Khat",               neck="Twilight Torque",     ear1="Novia Earring",           ear2="Ethereal Earring",
        hands="Gendewitha Gages +1",    ring1={name="Dark Ring", augments={'Phys. dmg. taken -5%'}},
        back="Cheviot Cape",            legs="Gendewitha Spats +1", feet="Gendewitha Galoshes +1"
    }
    sets.defense.MDT = {
        head="Inyanga Tiara +1",    neck="Twilight Torque",         ear1="Novia Earring",   ear2="Ethereal Earring",
        body="Artsieq Jubbah",      hands="Inyanga Dastanas +1",
        ring1={name="Dark Ring", augments={'Phys. dmg. taken -5%'}},
        ring2={name="Dark Ring", augments={'Phys. dmg. taken -5%','Breath dmg. taken -4%','Magic dmg. taken -3%'}},
        back="Tuilha Cape",         legs="Assiduity Pants",         feet="Inyanga Crackows +1"
    }
    
    sets.engaged = {                                                                                ammo="Jukukik Feather",
        head="Gendewitha Caubeen +1",   neck="Asperity Necklace",       ear1="Bladeborn Earring",   ear2="Steelflash Earring",
        body="Artsieq Jubbah",          hands="Inyanga Dastanas +1",    ring1="Rajas Ring",         ring2="Tyrant's Ring",
        back="Buquwik Cape",            waist="Cetl Belt",              legs="Telchine Braconi",    feet="Gendewitha Galoshes +1",
    }
    sets.engaged.with_buff = {}
    
    sets.engaged.MediumAcc = {}
    sets.engaged.HighAcc = {}
    
    sets.engaged.Skillup = {
        ammo="Jukukik Feather",
        head="Gendewitha Caubeen +1",   neck="Asperity Necklace",   ear1="Bladeborn Earring",       ear2="Steelflash Earring",
        body="Artsieq Jubbah",          hands="Otomi Gloves",       ring1="Rajas Ring",             ring2="Adler Ring",
        back="Kayapa Cape",             waist="Cetl Belt",          legs="Gendewitha Spats +1",     feet="Gendewitha Galoshes +1"
        -- head="Temachtiani Headband", neck="Asperity Necklace",   ear1="Bladeborn Earring",   ear2="Steelflash Earring",
        -- body="Artsieq Jubbah",           hands="Otomi Gloves",       ring1="Rajas Ring",         ring2="Tyrant's Ring",
        -- back="Buquwik Cape",         waist="Cetl Belt",          legs="Temachtiani Pants",   feet="Temachtiani Boots"
    }
end