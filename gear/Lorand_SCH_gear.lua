-----------------------------------------------------------------------------------------------------------
--[[
    Author: Ragnarok.Lorand
--]]
-----------------------------------------------------------------------------------------------------------

function init_gear_sets()
    --============================================================
    --          Precast sets
    --============================================================
    gear.KlimaformFeet = "Arbatel Loafers"
    sets.impact = {body="Twilight Cloak"}   --This is just to remind me to get it from the Porter Moogle
    
    sets.precast.JA['Rapture'] =            {head="Savant's Bonnet +2"}
    sets.precast.JA['Ebullience'] =         {head="Savant's Bonnet +2"}
    sets.precast.JA['Penury'] =             {legs="Savant's Pants +2"}
    sets.precast.JA['Parsimony'] =          {legs="Savant's Pants +2"}
    sets.precast.JA['Tabula Rasa'] =        {legs="Pedagogy Pants"}
    sets.precast.JA['Perpetuance'] =        {hands="Savant's Bracers +2"}
    sets.precast.JA['Immanence'] =          {hands="Savant's Bracers +2"}
    sets.precast.JA['Addendum: White'] =    {body="Savant's Gown +2"}
    sets.precast.JA['Addendum: Black'] =    {body="Savant's Gown +2"}
    sets.precast.JA['Altruism'] =           {head="Pedagogy Mortarboard +1"}
    sets.precast.JA['Focalization'] =       {head="Pedagogy Mortarboard +1"}
    
    sets.precast.FC = {             --52%   |   42% / 62%
        main="Marin Staff +1",      --3%
        ammo="Incantor Stone",      --2%
        head="Nahtirah Hat",        --10%
        neck="Orunmila's Torque",   --5%
        ear1="Loquacious Earring",  --2%
        body="Anhur Robe",          --10%
        hands="Gendewitha Gages +1",--7%
        ring1="Prolix Ring",        --2%
        ring2="Veneficium Ring",    --Q+1%
        back="Swith Cape",          --3%
        waist="Witful Belt",        --3%
        legs="Artsieq Hose",        --5%
        feet="Pedagogy Loafers +1"  --6%
    }
    sets.precast.FC.EnhancingMagic = {  --57%   |   47% / 67%
        waist="Siegel Sash"             --8%
    }
    sets.precast.FC.Cure = {            --57%   |   47% / 67%
        back="Pahtli Cape"              --8%
    }
    sets.precast.FC.Curaga = sets.precast.FC.Cure
    sets.precast.FC.Grimoire = {        --65%
        head="Pedagogy Mortarboard +1", --11% grimoire FC
        feet="Academic's Loafers"       --8% grimoire FC
    }
    sets.precast.FC.Weather = {         --(80%)
        feet="Pedagogy Loafers +1"      --16% addition to Celerity/Alacrity (50%)
    }
    sets.precast.FC.Lightning = {main="Apamajas I"}

    --============================================================
    
    sets.wsBase = {
    }
    sets.wsBase.Magic = {
    }
    
    --============================================================
    --          Midcast sets
    --============================================================
    sets.midcast.FastRecast = {
        main="Marin Staff +1",      ammo="Impatiens",
        head="Kaabnax Hat",        neck="Orunmila's Torque",
        body="Hagondes Coat +1",    hands="Gendewitha Gages +1",
        legs="Hagondes Pants +1",   feet="Hagondes Sabots +1"
    }

    sets.midcast.HealingMagic = {
        body="Pedagogy Gown",
        feet="Pedagogy Loafers +1"
    }
    sets.midcast.HealingMagic.LA = {
        legs="Academic's Pants +1"      --18 Divine/Enfeebling/Enhancing/Healing Skill
    }
    
    sets.midcast.Cursna = {
        hands="Hieros Mittens",
    }
    
    sets.midcast.Cure = {
        main="Tamaxchi",                sub="Genbu's Shield",                                   ammo="Impatiens",
        head="Gendewitha Caubeen +1",   neck="Orunmila's Torque",   ear1="Lifestorm Earring",   ear2="Novia Earring",
        body="Gendewitha Bliaut +1",    hands="Telchine Gloves",    ring1="Prolix Ring",        ring2="Veneficium Ring",
        back="Ogapepo Cape",            waist="Witful Belt",        legs="Artsieq Hose",        feet="Pedagogy Loafers +1"
    }
    sets.midcast.Cure.with_buff = {}
    sets.midcast.Curaga = sets.midcast.Cure

    sets.midcast.EnhancingMagic = {
        main="Coeus",               sub="Achaq Grip",           ammo="Savant's Treatise",
        head="Savant's Bonnet +2",  neck="Colossus's Torque",
        body="Pedagogy Gown",
        waist="Cascade Belt"
    }
    sets.midcast.EnhancingMagic.LA = {
        legs="Academic's Pants +1"      --18 Divine/Enfeebling/Enhancing/Healing Skill
    }
    sets.midcast.EnhancingMagic.with_buff = {}
    sets.midcast.EnhancingMagic.with_buff[469] = {hands="Savant's Bracers +2"}  --Perpetuance
    
    sets.midcast.Aquaveil = {waist="Emphatikos Rope"}
    sets.midcast.Stoneskin = {
        neck="Stone Gorget",        ear1="Loquacious Earring",  ear2="Earthcry Earring",
        hands="Telchine Gloves",    ring1="Aquasoul Ring",      ring2="Aqua Ring",
        back="Tuilha Cape",         waist="Siegel Sash",        legs="Haven Hose",      feet="Hagondes Sabots +1"
    }
    sets.midcast.Regen = {
        main="Coeus",           sub="Achaq Grip",
        head="Savant's Bonnet +2"
    }
    sets.midcast.Klimaform = {
        feet="Arbatel Loafers"
    }

    sets.midcast.MagicAccuracy = {
        main="Marin Staff +1",  sub="Clerisy Strap",                                    ammo="Kalboron Stone",
        head="Artsieq Hat",     neck="Eddy Necklace",       ear1="Lifestorm Earring",   ear2="Psystorm Earring",
        body="Jhakri Robe +1",  hands="Hagondes Cuffs +1",  ring1="Sangoma Ring",       ring2="Perception Ring",
        back="Ogapepo Cape",    waist="Ovate Rope",         legs="Artsieq Hose",        feet="Artsieq Boots"
    }
    
    sets.midcast.EnfeeblingMagic = {
        neck="Enfeebling Torque",
        hands="Lurid Mitts",
        feet="Uk'uxkaj Boots"
    }
    sets.midcast.EnfeeblingMagic.DA = {
        body="Academic's Gown +1"       --18 Elemental/Enfeebling/Dark Skill
    }
    sets.midcast.EnfeeblingMagic.LA = {
        legs="Academic's Pants +1"      --18 Divine/Enfeebling/Enhancing/Healing Skill
    }

    sets.midcast.DarkMagic = {
        neck="Dark Torque",
        back="Bookworm's Cape", legs="Pedagogy Pants"
    }
    sets.midcast.DarkMagic.DA = {
        body="Academic's Gown +1"       --18 Elemental/Enfeebling/Dark Skill
    }
    
    sets.midcast.DarkMagic.Stun = {
        main="Apamajas II",         sub="Clerisy Strap",                                        ammo="Incantor Stone",
        head="Nahtirah Hat",        neck="Orunmila's Torque",       ear1="Lifestorm Earring",   ear2="Psystorm Earring",
        body="Academic's Gown +1",  hands="Gendewitha Gages +1",    ring1="Sangoma Ring",       ring2="Perception Ring",
        back="Ogapepo Cape",        waist="Witful Belt",            legs="Artsieq Hose",        feet="Artsieq Boots"
    }
    
    sets.midcast.DarkMagic.Stun.MediumAcc = {
        main="Apamajas II",     sub="Clerisy Strap",                                            ammo="Kalboron Stone",
        head="Artsieq Hat",     neck="Dark Torque",             ear1="Lifestorm Earring",   ear2="Psystorm Earring",
        body="Artsieq Jubbah",  hands="Gendewitha Gages +1",    ring1="Sangoma Ring",       ring2="Perception Ring",
        back="Ogapepo Cape",    waist="Witful Belt",            legs="Artsieq Hose",        feet="Artsieq Boots"
    }
    
    sets.midcast.DarkMagic.Stun.HighAcc = { --m.acc+423, dark magic skill + 7
        main="Marin Staff +1",  sub="Clerisy Strap",                                    ammo="Kalboron Stone",
        head="Artsieq Hat",     neck="Dark Torque",         ear1="Lifestorm Earring",   ear2="Psystorm Earring",
        body="Artsieq Jubbah",  hands="Hagondes Cuffs +1",  ring1="Sangoma Ring",       ring2="Perception Ring",
        back="Ogapepo Cape",    waist="Ovate Rope",         legs="Artsieq Hose",        feet="Artsieq Boots"
    }
    
    sets.midcast.DarkMagic.Stun.Resistant = combineSets({},sets.midcast.DarkMagic.Stun.HighAcc)
    
    sets.midcast.DivineMagic = {}
    sets.midcast.DivineMagic.LA = {
        legs="Academic's Pants +1"      --18 Divine/Enfeebling/Enhancing/Healing Skill
    }
    
    sets.midcast.ElementalMagicSkill = {
        head="Pedagogy Mortarboard +1",
        back="Bookworm's Cape",     legs="Pedagogy Pants",  feet="Arbatel Loafers"
    }
    sets.midcast.ElementalMagicSkill.DA = {
        body="Academic's Gown +1"       --18 Elemental/Enfeebling/Dark Skill
    }
    
    sets.midcast.ElementalMagic = {
        main="Keraunos",            sub="Zuuxowu Grip",                                 ammo="Dosis Tathlum",
        head="Buremte Hat",         neck="Eddy Necklace",   ear1="Hecate's Earring",    ear2="Friomisi Earring",
        body="Jhakri Robe +1",      hands="Otomi Gloves",   ring1="Fenrir Ring +1",     ring2="Acumen Ring",
        back="Bookworm's Cape",     waist="Aswang Sash",    legs="Hagondes Pants +1",   feet="Helios Boots"
    }
    sets.midcast.ElementalMagic.LowTier = {
        main="Keraunos",            sub="Zuuxowu Grip",                                 ammo="Dosis Tathlum",
        head="Buremte Hat",         neck="Eddy Necklace",   ear1="Hecate's Earring",    ear2="Friomisi Earring",
        body="Jhakri Robe +1",      hands="Helios Gloves",  ring1="Fenrir Ring +1",     ring2="Acumen Ring",
        back="Bookworm's Cape",     waist="Tengu-no-Obi",   legs="Hagondes Pants +1",   feet="Umbani Boots"
    }
    sets.midcast.ElementalMagic.HighTier = {
        main="Keraunos",            sub="Elder's Grip +1",                              ammo="Witchstone",
        head="Jhakri Coronal",      neck="Eddy Necklace",   ear1="Hecate's Earring",    ear2="Friomisi Earring",
        body="Jhakri Robe +1",      hands="Helios Gloves",  ring1="Fenrir Ring +1",     ring2="Acumen Ring",
        back="Bookworm's Cape",     waist="Aswang Sash",    legs="Hagondes Pants +1",   feet="Helios Boots"
    }
    sets.midcast.ElementalMagic.Earth = {neck="Quanpur Necklace"}
    
    sets.midcast.ElementalMagic.MediumAcc = {
        main="Keraunos",        sub="Clerisy Strap",                                    ammo="Savant's Treatise",
        head="Jhakri Coronal",  neck="Sanctity Necklace",   ear1="Gwati Earring",       ear2="Friomisi Earring",
        body="Jhakri Robe +1",  hands="Jhakri Cuffs",       ring1="Fenrir Ring +1",     ring2="Sangoma Ring",
        back="Bookworm's Cape", waist="Tengu-no-Obi",       legs="Hagondes Pants +1",   feet="Jhakri Pigaches"
    }
    sets.midcast.ElementalMagic.HighAcc = {
        main="Keraunos",        sub="Clerisy Strap",                                    ammo="Savant's Treatise",
        head="Artsieq Hat",     neck="Sanctity Necklace",   ear1="Lifestorm Earring",   ear2="Psystorm Earring",
        body="Jhakri Robe +1",  hands="Jhakri Cuffs",       ring1="Fenrir Ring +1",     ring2="Sangoma Ring",
        back="Bookworm's Cape", waist="Tengu-no-Obi",       legs="Artsieq Hose",        feet="Jhakri Pigaches"
    }
    sets.midcast.ElementalMagic.Proc = {    --Damage is not a priority
        main="Terra's Staff",       sub="Clerisy Strap",                                    ammo="Savant's Treatise",
        head="Artsieq Hat",         neck="Orunmila's Torque",   ear1="Lifestorm Earring",   ear2="Psystorm Earring",
        body="Academic's Gown +1",  hands="Hagondes Cuffs +1",  ring1="Sangoma Ring",       ring2="Perception Ring",
        back="Ogapepo Cape",        waist="Ovate Rope",         legs="Artsieq Hose",        feet="Artsieq Boots"
    }
    
    sets.midcast.ElementalEnfeeble = {}
    
    sets.midcast.DivineMagic = {}
    sets.midcast.DivineMagic.Nuke = {}
    sets.midcast.DivineMagic.Nuke.with_buff = {}
    
    --============================================================
    --          Other sets
    --============================================================
    
    sets.resting = {
        main="Bolelabunga",     sub="Genbu's Shield",                                   ammo="Homiliary",
        head="Kaabnax Hat",     neck="Eidolon Pendant",     ear1="Loquacious Earring",  ear2="Relaxing Earring",
        body="Jhakri Robe +1",  hands="Nares Cuffs",        ring1="Sangoma Ring",       ring2="Fenrir Ring +1",
        back={"Felicitas Cape","Pahtli Cape"},
        waist="Fucho-no-obi",   legs="Nares Trews",         feet="Chelona Boots"
    }
    
    sets.idle = {
        main="Bolelabunga",                 sub="Genbu's Shield",                                       ammo="Homiliary",
        head="Academic's Mortarboard +1",   neck="Twilight Torque",         ear1="Brachyura Earring",   ear2="Ethereal Earring",
        body="Jhakri Robe +1",              hands="Gendewitha Gages +1",    ring1="Defending Ring",     ring2="Shneddick Ring",
        back="Repulse Mantle",              waist="Fucho-no-obi",           legs="Academic's Pants +1", feet="Gendewitha Galoshes +1"
    }
    
    sets.idle.CapFarm = {back="Mecistopins Mantle"}
    
    sets.idle.MDT = {
        main="Bolelabunga",         sub="Genbu's Shield",                                       ammo="Impatiens",
        head="Artsieq Hat",         neck="Twilight Torque",         ear1="Brachyura Earring",   ear2="Merman's Earring",
        body="Academic's Gown +1",  hands="Gendewitha Gages +1",    ring1="Defending Ring",     ring2="Dark Ring",
        back="Tuilha Cape",         waist="Emphatikos Rope",        legs="Hagondes Pants +1",   feet="Gendewitha Galoshes +1"
    }
    sets.idle.with_buff = {}
    
    sets.idle.lowMP = {waist="Fucho-no-obi", legs="Nares Trews"}
    sets.idle.lowMP_night = {hands="Serpentes Cuffs"}
    sets.idle.lowMP_day =   {feet="Serpentes Sabots"}
    
    sets.idle.with_buff['sublimation: activated'] = {
        head="Academic's Mortarboard +1",
        body="Pedagogy Gown",
        back="Repulse Mantle"
    }
    sets.idle.with_buff['doom'] = {ring1="Saida Ring", ring2="Saida Ring"}
    sets.idle.with_buff['reive mark'] = {neck="Ygnas's Resolve +1"}
    
    sets.defense.PDT = {
        head="Gendewitha Caubeen +1",   neck="Twilight Torque",
        body="Gendewitha Bliaut +1",    hands="Gendewitha Gages +1",    ring1="Defending Ring",     ring2="Dark Ring",
        back="Repulse Mantle",          legs="Hagondes Pants +1",       feet="Gendewitha Galoshes +1"
    }
    sets.defense.MDT = {
        head="Artsieq Hat",         neck="Twilight Torque",     ear1="Merman's Earring",    ear2="Merman's Earring",
        ring1="Defending Ring",     ring2="Dark Ring",
        back="Tuilha Cape"
    }

    --============================================================
    
    sets.engaged = {
        head="Pedagogy Mortarboard +1", neck="Asperity Necklace",   ear1="Bladeborn Earring",   ear2="Steelflash Earring",
        body="Helios Jacket",           hands="Telchine Gloves",    ring1="Rajas Ring",         ring2="Mars's Ring",
        back="Kayapa Cape",             waist="Cetl Belt",          legs="Telchine Braconi",    feet="Gendewitha Galoshes +1"
    }
    sets.engaged.with_buff = {}
    sets.engaged.with_buff['doom'] = {ring1="Saida Ring", ring2="Saida Ring"}
    sets.engaged.with_buff['reive mark'] = {neck="Ygnas's Resolve +1"}
end