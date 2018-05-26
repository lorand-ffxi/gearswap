--------------------------------------------------------------------------------
--[[
    Author: Ragnarok.Lorand
--]]
--------------------------------------------------------------------------------

function init_gear_sets()
    gear.ambuMABback = {name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','"Mag.Atk.Bns."+10'}}
    gear.ambuMaccBack = {name="Sucellos's Cape", augments={'MND+1','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10'}}
    
    --============================================================
    --          Precast sets
    --============================================================
    sets.precast.JA['Chainspell'] = {body="Vitiation Tabard +1"}
    sets.precast.JA['Saboteur'] = {hands="Estoqueur's Gantherots +2"}
    
    sets.precast.Waltz = {}
    sets.precast.Waltz['Healing Waltz'] = {}
    
    -- Fast Cast caps at 80%; RDM JT: 30%
    sets.precast.FC = {                 --50% + 30% = 80%
        main="Marin Staff +1",             --2%
        head="Atrophy Chapeau +1",      --12%
        ear1="Loquacious Earring",      --2%
        body="Vitiation Tabard +1",    --13%
        hands="Gendewitha Gages +1",    --7%
        ring1="Prolix Ring",            --2%
        back="Swith Cape",              --3%
        legs="Artsieq Hose",            --5%
        feet="Chelona Boots"            --4%
    }
    
    sets.precast.FC.HealingMagic = {
        main="Tamaxchi",    sub="Genbu's Shield",
        back="Pahtli Cape"
    }
    sets.precast.FC.EnhancingMagic = {waist="Siegel Sash"}
    
    --============================================================
    
    sets.wsBase = {
        head="Atrophy Chapeau +1",  neck="Asperity Necklace",   ear1="Bladeborn Earring",   ear2="Steelflash Earring",
        body="Taeon Tabard",        hands="Atrophy Gloves +1",  ring1="Rajas Ring",         ring2="Tyrant's Ring",
        back="Atheling Mantle",     waist="Anguinus Belt",      legs="Telchine Braconi",    feet="Jhakri Pigaches"
    }
    sets.wsBase.MND = {head="Vitiation Chapeau +1",ring2="Aqua Ring",feet="Vitiation Boots +1"}
    
    sets.wsBase.Magic = {                                                               ammo="Witchstone",
        head="Buremte Hat",         neck="Eddy Necklace",   ear1="Hecate's Earring",    ear2="Friomisi Earring",
        body="Hagondes Coat +1",    hands="Otomi Gloves",   ring1="Acumen Ring",        ring2="Spiral Ring",
        back=gear.ambuMABback,      waist="Cognition Belt", legs="Hagondes Pants +1",   feet="Umbani Boots"
    }
    
    --============================================================
    --          Midcast sets
    --============================================================
    
    sets.midcast.FastRecast = {
        head="Atrophy Chapeau +1",      neck="Jeweled Collar",      ear1="Loquacious Earring",  ear2="Novia Earring",
        body="Vitiation Tabard +1",    hands="Gendewitha Gages +1",
        back="Ogapepo Cape",            waist="Cetl Belt",          legs="Artsieq Hose",        feet="Gendewitha Galoshes +1"
    }

    sets.midcast.HealingMagic = {
        body="Vitiation Tabard +1",    ring1="Sirona's Ring",      ring2="Ephedra Ring",
        legs="Atrophy Tights"
    }
    sets.midcast.Cursna = {
        neck="Malison Medallion",
        hands="Hieros Mittens",         ring1="Ephedra Ring",       ring2="Ephedra Ring",
        feet="Gendewitha Galoshes +1"
    }
    
    sets.midcast.Cure = {   --Cure potency > 50%    |   Enmity - 33
        main="Tamaxchi",                sub="Genbu's Shield",   ammo="Clarus Stone",
        head="Gendewitha Caubeen +1",   neck="Jeweled Collar",  ear1="Roundel Earring", ear2="Novia Earring",
        body="Vitiation Tabard +1",    hands="Otomi Gloves",   ring1="Prolix Ring",    ring2="Sirona's Ring",
        back="Ghostfyre Cape",          waist="Cetl Belt",  legs="Atrophy Tights",  feet="Atrophy Boots"
    }
    sets.midcast.Curaga = sets.midcast.Cure
    sets.midcast.Cure.Engaged = {
        body="Gendewitha Bliaut +1",    hands="Bokwus Gloves"
    }
    
    sets.midcast.Cure.with_buff = {}
    sets.midcast.Cure.with_buff['reive mark'] = {neck="Arciela's Grace +1"}
    
    sets.midcast.EnhancingMagic = {
        main="Secespita",               sub="Muse Tariqah",         ammo="Clarus Stone",
        ear1="Loquacious Earring",      ear2="Novia Earring",
        body="Vitiation Tabard +1",    hands="Vitiation Gloves",
        back="Estoqueur's Cape",        waist="Cascade Belt",       legs="Atrophy Tights",  feet="Estoqueur's Houseaux +2"
    }
    sets.midcast.EnhancingMagic.Duration = {
        hands="Atrophy Gloves +1",
        back="Estoqueur's Cape",    feet="Estoqueur's Houseaux +2"
    }
    sets.midcast.EnhancingMagic.Duration.ComposureOther = {
        head="Estoqueur's Chappel +2",
        body="Estoqueur's Sayon +2",
        legs="Estoqueur's Fuseau +2"
    }
    
    sets.midcast['Aquaveil'] =  {waist="Emphatikos Rope", legs="Shedir Seraweels"}
    sets.midcast['Phalanx II'] =    {hands="Vitiation Gloves"}
    sets.midcast['Refresh'] =   {legs="Estoqueur's Fuseau +2"}
    sets.midcast['Stoneskin'] = {
        neck="Stone Gorget",    ear2="Earthcry Earring",
        waist="Siegel Sash",    legs="Shedir Seraweels"
    }
    
    --============================================================
    
    sets.midcast.MagicAccuracy = {
        main="Marin Staff +1",      sub="Mephitis Grip",        ammo="Kalboron Stone",
        head="Atrophy Chapeau +1",  neck="Eddy Necklace",       ear1="Lifestorm Earring",   ear2="Psystorm Earring",
        body="Artsieq Jubbah",      hands="Hagondes Cuffs +1",  ring1="Sangoma Ring",       ring2="Perception Ring",
        back=gear.ambuMaccBack,     waist="Ovate Rope",         legs="Artsieq Hose",        feet="Jhakri Pigaches"
    }
    
    sets.midcast.EnfeeblingMagic = {
        main="Marin Staff +1",      sub="Mephitis Grip",        ammo="Kalboron Stone",
        head="Jhakri Coronal +1",   neck="Sanctity Necklace",   ear1="Lifestorm Earring",   ear2="Psystorm Earring",
        body="Jhakri Robe +1",      hands={name="Chironic Gloves", augments={'Mag. Acc.+16 "Mag.Atk.Bns."+16','Haste+3','Mag. Acc.+6'}},
        ring1="Sangoma Ring",       ring2="Perception Ring",
        back=gear.ambuMaccBack,     waist="Ovate Rope", legs="Jhakri Slops +1",    feet="Vitiation Boots +1"
    }
    sets.midcast.EnfeeblingMagic.Saboteur = {hands="Estoqueur's Gantherots +2"}
    
    sets.midcast.EnfeeblingMagic.Potency = {
        neck="Estoqueur's Collar",
        body="Estoqueur's Sayon +2",    ring2="Solemn Ring",
        waist="Cascade Belt",           feet="Uk'uxkaj Boots"
    }
    
    sets.midcast.EnfeeblingMagic.Potency.Normal = {
        ammo="Aqua Sachet",
        ear2="Star Earring",
        hands="Gendewitha Gages +1",    ring1="Aqua Ring",
        back="Tuilha Cape",
    }
    
    sets.midcast.EnfeeblingMagic.Potency.MediumAcc = {
        main="Marin Staff +1",             sub="Mephitis Grip",                                    ammo="Kalboron Stone",
        head="Vitiation Chapeau +1",   neck="Estoqueur's Collar",  ear1="Lifestorm Earring",   ear2="Star Earring",
        body="Atrophy Tabard +1",       hands="Hagondes Cuffs +1",  ring1="Aqua Ring",          ring2="Solemn Ring",
        back="Tuilha Cape",             waist="Ovate Rope",         legs="Artsieq Hose",        feet="Vitiation Boots +1"
    }
    
    sets.midcast.EnfeeblingMagic.Potency.HighAcc = {
        main="Marin Staff +1",             sub="Mephitis Grip",                                    ammo="Kalboron Stone",
        head="Vitiation Chapeau +1",   neck="Eddy Necklace",       ear1="Lifestorm Earring",   ear2="Psystorm Earring",
        body="Atrophy Tabard +1",       hands="Hagondes Cuffs +1",  ring1="Sangoma Ring",       ring2="Perception Ring",
        back="Ogapepo Cape",            waist="Ovate Rope",         legs="Artsieq Hose",        feet="Vitiation Boots +1"
    }
    
    sets.midcast['Dia III'] = {head="Vitiation Chapeau +1"}
    sets.midcast['Slow II'] = {head="Vitiation Chapeau +1"}
    
    --============================================================
    
    sets.midcast.ElementalMagic = {
        main="Marin Staff +1",         sub="Elder's Grip +1",  ammo="Witchstone",
        head="Buremte Hat",         neck="Eddy Necklace",   ear1="Hecate's Earring",    ear2="Friomisi Earring",
        body="Hagondes Coat +1",    hands="Otomi Gloves",   ring1="Acumen Ring",        ring2="Spiral Ring",
        back=gear.ambuMABback,      waist="Salire Belt",    legs="Hagondes Pants +1",   feet="Jhakri Pigaches"
    }
    sets.midcast.ElementalMagic.LowTier = {
        sub="Zuuxowu Grip",     ammo="Dosis Tathlum",
        back=gear.ambuMABback,  feet="Umbani Boots"
    }
    sets.midcast.ElementalMagic.HighTier = {
        feet="Jhakri Pigaches"
    }
    sets.midcast.ElementalMagic.Earth = {neck="Quanpur Necklace"}
    
    sets.midcast.ElementalMagic.MediumAcc = {
        main="Marin Staff +1",         sub="Elder's Grip +1",
        head="Helios Band",         neck="Eddy Necklace",   ear1="Hecate's Earring",    ear2="Friomisi Earring",
        body="Hagondes Coat +1",    hands="Yaoyotl Gloves", ring1="Acumen Ring",        ring2="Spiral Ring",
        back=gear.ambuMABback,      waist="Salire Belt",    legs="Hagondes Pants +1",   feet="Jhakri Pigaches"
    }
    sets.midcast.ElementalMagic.HighAcc = {
        main="Marin Staff +1",         sub="Clerisy Strap",                                ammo="Kalboron Stone",
        head="Atrophy Chapeau +1",  neck="Eddy Necklace",   ear1="Lifestorm Earring",   ear2="Psystorm Earring",
        body="Atrophy Tabard +1",   hands="Yaoyotl Gloves", ring1="Acumen Ring",        ring2="Sangoma Ring",
        back=gear.ambuMABback,      waist="Salire Belt",    legs="Artsieq Hose",        feet="Jhakri Pigaches"
    }
    sets.midcast.ElementalMagic.Proc = {    --Damage is not a priority
        main="Secespita",               sub="Genbu's Shield",                                       ammo="Kalboron Stone",
        head="Atrophy Chapeau +1",      neck="Jeweled Collar",      ear1="Lifestorm Earring",       ear2="Psystorm Earring",
        body="Vitiation Tabard +1",    hands="Hagondes Cuffs +1",  ring1="Sangoma Ring",           ring2="Perception Ring",
        back="Ogapepo Cape",            waist="Cognition Belt",     legs="Vitiation Tights +1",    feet="Taeon Boots"
    }
    
    sets.midcast.ElementalMagic.with_buff = {}
    sets.midcast.ElementalMagic.with_buff['reive mark'] = {neck="Arciela's Grace +1"}
    
    sets.midcast.ElementalEnfeeble = {
        main="Marin Staff +1",         sub="Clerisy Strap",    ammo="Kalboron Stone",
        head="Atrophy Chapeau +1",  neck="Eddy Necklace",   ear1="Lifestorm Earring",   ear2="Psystorm Earring",
        body="Atrophy Tabard +1",   hands="Yaoyotl Gloves", ring1="Sangoma Ring",       ring2="Spiral Ring",
        back=gear.ambuMABback,      waist="Ovate Rope",     legs="Vitiation Tights +1",feet="Jhakri Pigaches"
    }

    sets.midcast.DarkMagic = {}
    sets.midcast.Stun = {
        main="Apamajas II",             sub="Clerisy Strap",            ammo="Kalboron Stone",
        head="Atrophy Chapeau +1",      neck="Jeweled Collar",          ear1="Lifestorm Earring",   ear2="Psystorm Earring",
        body="Vitiation Tabard +1",    hands="Gendewitha Gages +1",    ring1="Prolix Ring",        ring2="Sangoma Ring",
        back="Ogapepo Cape",            waist="Cetl Belt",              legs="Artsieq Hose",        feet="Vitiation Boots +1"
    }
    
    sets.midcast.DivineMagic = {}
    sets.midcast.DivineMagic.Nuke = {}
    sets.midcast.DivineMagic.Nuke.with_buff = {}
    sets.midcast.DivineMagic.Nuke.with_buff['reive mark'] = {neck="Arciela's Grace +1"}
    
    --============================================================
    --          Other sets
    --============================================================
    
    sets.maxMP = {
        main="Marin Staff +1",             sub="Elder's Grip +1",                                      ammo="Kalboron Stone",
        head="Kaabnax Hat",             neck="Estoqueur's Collar",  ear1="Loquacious Earring",      ear2="Star Earring",
        body="Weatherspoon Robe +1",    hands="Otomi Gloves",       ring1="Sangoma Ring",           ring2="Bifrost Ring",
        back="Pahtli Cape",             waist="Shinjutsu-no-obi",   legs="Estoqueur's Fuseau +2",   feet="Atrophy Boots"
    }
    
    sets.resting = combineSets(sets.maxMP, {
        main="Boonwell Staff",          ammo="Homiliary",
        head="Vitiation Chapeau +1",   neck="Eidolon Pendant",
        body="Artsieq Jubbah",          hands="Serpentes Cuffs",
        back="Felicitas Cape",          waist="Austerity Belt",     legs="Nares Trews", feet="Chelona Boots"
    })
    
    sets.idle = {
        main="Bolelabunga",             sub="Genbu's Shield",       ammo="Homiliary",
        head="Vitiation Chapeau +1",   neck="Twilight Torque",     ear1="Novia Earring",           ear2="Ethereal Earring",
        body="Jhakri Robe +1",          hands="Hagondes Cuffs +1",
        ring1={name="Dark Ring", augments={'Phys. dmg. taken -5%','Breath dmg. taken -4%','Magic dmg. taken -3%'}},
        ring2="Shneddick Ring",
        back="Cheviot Cape",            waist="Fucho-no-obi",       legs="Vitiation Tights +1",    feet="Carmine Greaves"
    }
    sets.idle.CapFarm = {back="Mecistopins Mantle"}
    
    sets.idle.oldschool = {
        main="Terra's Staff",           sub="Elder's Grip +1",  ammo="Homiliary",
        head="Vitiation Chapeau +1",   neck="Twilight Torque", ear1="Novia Earring",   ear2="Ethereal Earring",
        body="Jhakri Robe +1",          hands="Jhakri Cuffs +1",   ring1={name="Dark Ring", augments={'Phys. dmg. taken -5%','Breath dmg. taken -4%','Magic dmg. taken -3%'}},
        ring2="Shneddick Ring",
        back="Mecistopins Mantle",      waist="Fucho-no-obi",   legs="Crimson Cuisses", feet="Jhakri Pigaches"
    }
    
    sets.idle.with_buff = {}
    sets.idle.with_buff['reive mark'] = {neck="Arciela's Grace +1"}
    
    sets.idle.Melee = {                                             ammo="Homiliary",
        head="Vitiation Chapeau +1",   neck="Twilight Torque",     ear1="Novia Earring",           ear2="Ethereal Earring",
        body="Jhakri Robe +1",          hands="Hagondes Cuffs +1",  ring1="Dark Ring",              ring2="Shneddick Ring",
        back="Cheviot Cape",            waist="Flume Belt",         legs="Vitiation Tights +1",    feet="Gendewitha Galoshes +1"
    }
    sets.idle.lowMP = {waist="Fucho-no-obi", legs="Nares Trews"}
    sets.idle.lowMP_night = {hands="Serpentes Cuffs"}
    sets.idle.lowMP_day = {feet="Serpentes Sabots"}
    
    sets.minHp = combineSets(sets.naked, {
        ear1="Graiai Earring",
        ring1="Bifrost Ring",   ring2="Serket Ring",
        back="Swith Cape"
    })
    sets.maxHp = combineSets(sets.naked, {
        sub="Genbu's Shield",
        head="Vitiation Chapeau +1",   neck="Estoqueur's Collar",  ear2="Ethereal Earring",
        body="Vitiation Tabard +1",    hands="Hagondes Cuffs +1",  ring1="Kunaji Ring",    ring2="Meridian Ring",
        back="Ebullient Cape",          legs="Nares Trews",         feet="Atrophy Boots"
    })

    sets.defense.DT = {
        neck="Twilight Torque",
        ring1="Dark Ring",      ring2="Dark Ring"
    }
    sets.defense.PDT = combineSets(sets.defense.DT, {
        main="Terra's Staff",
        hands="Hagondes Cuffs +1",
        back="Cheviot Cape",        waist="Flume Belt"
    })
    sets.defense.MDT = combineSets(sets.defense.DT, {})

    sets.engaged = {
        head="Vitiation Chapeau +1",   neck="Asperity Necklace",   ear1="Bladeborn Earring",   ear2="Steelflash Earring",
        body="Taeon Tabard",            hands="Atrophy Gloves +1",  ring1="Rajas Ring",         ring2="Tyrant's Ring",
        back="Atheling Mantle",         waist="Cetl Belt",          legs="Taeon Tights",        feet="Taeon Boots"
    }
    
    sets.engaged.MediumAcc = {ammo="Jukukik Feather"}
    sets.engaged.HighAcc = {ammo="Jukukik Feather"}
    
    sets.engaged.DW = {
        head="Vitiation Chapeau +1",   neck="Asperity Necklace",   ear1="Dudgeon Earring", ear2="Heartseeker Earring",
        body="Taeon Tabard",            hands="Atrophy Gloves +1",  ring1="Rajas Ring",     ring2="Tyrant's Ring",
        back="Atheling Mantle",         waist="Cetl Belt",          legs="Taeon Tights",    feet="Taeon Boots"
    }
    sets.engaged.DW.MediumAcc = {ammo="Jukukik Feather"}
    sets.engaged.DW.HighAcc = {ammo="Jukukik Feather"}
end
