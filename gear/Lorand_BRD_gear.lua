--------------------------------------------------------------------------------
--[[
    Author: Ragnarok.Lorand
    
    Songs can be cast with normal gear/instruments, normal gear +
    Terpander/Daurdabla, or fast recast gear + Terpander/Daurdabla.
    
    When the maximum number of active songs has been reached, the new song will
    always take the place of the one with the lowest remaining duration.
    Exploiting this, you can cast a 3rd song with Terpander/Daurdabla without
    any duration enhancing gear, and then overwrite it right away with a more
    desirable song while wearing duration enhancing / potency gear (and
    instrument).
    
    To cycle modes:             gs c cycle Daurdabla
    To set a specific mode:     gs c set Daurdabla Daurdabla
    
    Example usage in a macro, using Terpander/Daurdabla with normal gear:
    /console gs c set daurdabla Daurdabla
    /ma "Mage's Ballad" <stpc>
    
    Example macro, using Terpander/Daurdabla without duration enhancing gear:
    /console gs c set Daurdabla Dummy
    /ma "Army's Paeon" <stpc>
    
    All macros should be written with <stpc> because Pianissimo will
    automatically be used when the target is a player other than yourself.
--]]
--------------------------------------------------------------------------------

function init_gear_sets()
    --============================================================
    --          Instruments
    --============================================================
    gear.instruments.multiSong = "Terpander"    --Adds an additional song effect
    gear.instruments.default = "Linos"          --All Songs +3 (+1 with +2 augment)
    gear.instruments.Requiem = "Requiem Flute"  --Requiem +4
    
    --============================================================
    --          Precast sets
    --============================================================
    sets.precast.FC = {                             --55%
        main="Marin Staff +1",                      --3%
        head="Nahtirah Hat",                        --10%
        neck="Orunmila's Torque",                   --5%
        ear1="Loquacious Earring",                  --2%
        body="Marduk's Jubbah +1",                  --11%
        hands="Gendewitha Gages +1",                --7%
        ring1="Prolix Ring",                        --2%
        ring2="Veneficium Ring",                    --Q+1%
        back="Swith Cape",                          --3%
        waist="Witful Belt",                        --3%
        legs="Artsieq Hose",                        --5%
        feet={"Chelona Boots", "Suzaku's Sune-Ate"} --4%
    }

    sets.precast.FC.Cure = {        --65%
        main="Felibre's Dague",     --0%
        sub="Genbu's Shield",       --8%
        back="Pahtli Cape"          --8%
    }
    sets.precast.FC.EnhancingMagic = {  --60%
        waist="Siegel Sash"             --8%
    }

    sets.precast.FC.BardSong = {        --72%
        main="Felibre's Dague",         --6%
        sub="Genbu's Shield",           --0%
        head="Aoidos' Calot +2",        --12%
        neck="Orunmila's Torque",       --5%
        ear1="Loquacious Earring",      --2%
        ear2="Aoidos' Earring",         --2%
        body="Marduk's Jubbah +1",      --11%
        hands="Gendewitha Gages +1",    --11%   (song spellcasting time -4% augment)
        ring1="Prolix Ring",            --2%
        ring2="Veneficium Ring",        --Q+1%
        back="Swith Cape",              --3%
        waist="Witful Belt",            --3%
        legs="Gendewitha Spats +1",     --8%    (song spellcasting time -3% augment)
        feet="Bihu Slippers"            --7%
    }
    
    sets.precast.FC.Lightning = {main="Apamajas I"}
    
    sets.precast.JA.Nightingale =   {feet="Bihu Slippers"}
    sets.precast.JA.Troubadour =    {body="Bihu Justaucorps"}
    sets.precast.JA['Soul Voice'] = {legs="Bihu Cannions"}

    --============================================================
    
    sets.precast.Waltz = {}
    sets.wsBase = {
        head="Highwing Helm",       neck="Asperity Necklace",   ear1="Bladeborn Earring",   ear2="Steelflash Earring",
        body="Bihu Justaucorps",    hands="Umuthi Gloves",      ring1="Rajas Ring",         ring2="Mars's Ring",
        back="Atheling Mantle",     waist="Windbuffet Belt +1", legs="Telchine Braconi",    feet="Gendewitha Galoshes +1",
    }
    sets.wsBase.Magic = {
        head="Highwing Helm",   neck="Sanctity Necklace",    ear1="Friomisi Earring",    ear2="Hecate's Earring",
        body="Artsieq Jubbah",  hands="Otomi Gloves",       ring1="Fenrir Ring +1",     ring2="Acumen Ring",
        back="Toro Cape",       waist="Tengu-no-Obi",       legs="Telchine Braconi",    feet="Gendewitha Galoshes +1",
    }
    
    --============================================================
    --          Midcast sets
    --============================================================
    sets.midcast.FastRecast = {
        range="empty",              ammo="empty",
        head="Nahtirah Hat",        neck="Orunmila's Torque",       ear1="Loquacious Earring",
        body="Marduk's Jubbah +1",  hands="Gendewitha Gages +1",    ring1="Prolix Ring",
        back="Swith Cape",          waist="Cetl Belt",              legs="Artsieq Hose",        feet="Gendewitha Galoshes +1"
    }
    
    --============================================================
    
    sets.midcast.Ballad =   {legs="Aoidos' Rhingrave +2"}
    sets.midcast.Lullaby =  {hands="Brioso Cuffs"}
    sets.midcast.Madrigal = {head="Aoidos' Calot +2"}
    sets.midcast.March =    {hands="Aoidos' Manchettes +2"}
    sets.midcast.Minuet =   {body="Aoidos' Hongreline +2"}
    sets.midcast.Paeon =    {head="Brioso Roundlet"}
    sets.midcast.Scherzo =  {feet="Aoidos' Cothurnes +2"}
    
    sets.midcast.Singing = {
        head="Bihu Roundlet",           neck="Aoidos' Matinee", ear2="Musical Earring",
        body="Brioso Justaucorps",      hands="Brioso Cuffs",
        legs="Aoidos' Rhingrave +2",    feet="Brioso Slippers"
    }
    
    sets.midcast.Wind = {
        hands="Aoidos' Manchettes +2",
        body="Aoidos' Hongreline +2",   hands="Aoidos' Manchettes +2",
        back="Rhapsode's Cape",         legs="Brioso Cannions",         feet="Brioso Slippers"
    }
    
    sets.midcast.String = {
        head="Brioso Roundlet",
        body="Brioso Justaucorps",  hands="Aoidos' Manchettes +2",
        feet="Bihu Slippers"
    }
    
    --This set is for extending party song buff duration
    sets.midcast.SongDuration = {       --Song duration + 45%
        main="Legato Dagger",           --5%
        sub="Genbu's Shield",           --n/a
        neck="Aoidos' Matinee",         --10%
        body="Aoidos' Hongreline +2",   --10%
        legs="Marduk's Shalwar +1",     --10%
        feet="Brioso Slippers"          --10%
    }
    
    sets.midcast.SongBuff = sets.midcast.SongDuration
    
    --This set is for Daurdabla/Terpander dummy songs
    sets.midcast.SongRecast = {
        main="Felibre's Dague",     sub="Genbu's Shield",
        head="Nahtirah Hat",        neck="Orunmila's Torque",   ear1="Loquacious Earring",  ear2="Novia Earring",
        body="Marduk's Jubbah +1",  hands="Buremte Gloves",     ring1="Prolix Ring",
        back="Swith Cape",          waist="Witful Belt",        legs="Artsieq Hose",        feet="Gendewitha Galoshes +1"
    }
    
    sets.midcast.MagicAccuracy = {
        main="Marin Staff +1",  sub="Mephitis Grip",
        head="Artsieq Hat",     neck="Sanctity Necklace",    ear1="Lifestorm Earring",   ear2="Psystorm Earring",
        body="Artsieq Jubbah",  hands="Lurid Mitts",        ring1="Sangoma Ring",       ring2="Perception Ring",
        back="Rhapsode's Cape", waist="Ovate Rope",         legs="Artsieq Hose",        feet="Artsieq Boots"
    }
    
    -- For song debuffs (duration primary, accuracy secondary)
    sets.midcast.SongDebuff = {
        neck="Aoidos' Matinee",
        legs="Marduk's Shalwar +1", feet="Brioso Slippers"
    }

    -- For song debuffs (accuracy primary, duration secondary)
    sets.midcast.SongDebuff.Resistant = sets.midcast.MagicAccuracy

    --============================================================      
    
    sets.midcast.EnhancingMagic = {
        neck="Colossus's Torque",
        body="Telchine Chasuble",
        waist="Cascade Belt"
    }
    sets.midcast.Aquaveil = {waist="Emphatikos Rope"}
    
    sets.midcast.Stoneskin = {
        neck="Stone Gorget",    ear1="Star Earring",    ear2="Earthcry Earring",
        ring1="Aqua Ring",      ring2="Aquasoul Ring",
        back="Tuilha Cape",     waist="Siegel Sash",    legs="Haven Hose"
    }
    
    sets.midcast.HealingMagic = {}
    sets.midcast.Cursna = {
        hands="Hieros Mittens",
    }
    
    sets.midcast.Cure = {
        main="Arka IV",                 sub="Achaq Grip",           range="Linos",
        head="Gendewitha Caubeen +1",   neck="Orunmila's Torque",   ear1="Novia Earring",   ear2="Star Earring",
        body="Gendewitha Bliaut +1",    hands="Telchine Gloves",    ring1="Prolix Ring",    ring2="Sangoma Ring",
        back="Swith Cape",              waist="Witful Belt",        legs="Artsieq Hose",    feet="Bihu Slippers"
    }
    
    sets.midcast.DivineMagic = {}
    sets.midcast.DarkMagic = {}
    sets.midcast.ElementalMagic = {}
    
    --============================================================
    --          Other sets
    --============================================================
    
    --sets.weapons.Melee = {main="Izhiikoh",sub="Genbu's Shield"}
    sets.weapons.Melee = {main="Izhiikoh", sub="Atoyac"}
    
    sets.resting = {
        main="Chatoyant Staff",         sub="Elder's Grip",                                     ammo="Kalboron Stone",
        head="Nahtirah Hat",            neck="Eidolon Pendant",     ear1="Loquacious Earring",  ear2="Relaxing Earring",
        body="Gendewitha Bliaut +1",    hands="Nares Cuffs",        ring1="Defending Ring",     ring2="Sheltered Ring",
        back="Felicitas Cape",          waist="Emphatikos Rope",    legs="Nares Trews",         feet="Chelona Boots"
    }
    
    sets.defense.DT = {
        neck="Twilight Torque",
        ring1="Defending Ring",     ring2="Dark Ring",
    }
    sets.defense.PDT = combineSets(sets.defense.DT, {
    })
    sets.defense.MDT = combineSets(sets.defense.DT, {
    })
    
    sets.idle = {
        main="Terra's Staff",           sub="Achaq Grip",               range="Oneiros Harp",
        head="Kaabnax Hat",             neck="Twilight Torque",         ear1="Brachyura Earring",   ear2="Ethereal Earring",
        body="Gendewitha Bliaut +1",    hands="Gendewitha Gages +1",    ring1="Defending Ring",     ring2="Shneddick Ring",
        back="Repulse Mantle",          waist="Flume Belt",             legs="Bihu Cannions",       feet="Bihu Slippers"
    }
    sets.idle.lowMP =   {legs="Nares Trews"}
    sets.idle.lowMP_night = {hands="Serpentes Cuffs"}
    sets.idle.with_buff = {}
    sets.idle.with_buff['doom'] = {ring1="Saida Ring", ring2="Saida Ring"}
    
    sets.engaged = {
        range="Oneiros Harp",    head="Highwing Helm",  neck="Asperity Necklace", ear1="Dudgeon Earring",       ear2="Heartseeker Earring",
        body="Bihu Justaucorps", hands="Umuthi Gloves", ring1="Rajas Ring",       ring2="Mars's Ring",
        back="Atheling Mantle",  waist="Cetl Belt",     legs="Telchine Braconi",  feet="Gendewitha Galoshes +1",
    }
    
    sets.engaged.HighAcc = {
        head="Highwing Helm",                   neck={"Iqabi Necklace","Asperity Necklace"},
        ear1="Bladeborn Earring",               ear2="Steelflash Earring",
        body="Bihu Justaucorps",                hands="Umuthi Gloves",                          ring1="Rajas Ring",     ring2="Mars's Ring",
        back={"Kayapa Cape","Atheling Mantle"}, waist={"Anguinus Belt","Windbuffet Belt +1"},   
        legs="Telchine Braconi",                feet="Gendewitha Galoshes +1"
    }
    sets.engaged.with_buff = {}
    sets.engaged.with_buff['doom'] = {ring1="Saida Ring", ring2="Saida Ring"}
    sets.engaged.with_buff['reive mark'] = {neck="Ygnas's Resolve +1"}
end