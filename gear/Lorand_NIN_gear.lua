-----------------------------------------------------------------------------------------------------------
--[[
    Author: Ragnarok.Lorand

    <legs>Iga Hakama +2</legs>  Adds Counter to Yonin when shadows are down
--]]
-----------------------------------------------------------------------------------------------------------

function refresh_gear_sets()
    if modes.tank then
        safe_set(sets.precast.JA, sets.Enmity)
    else
        safe_set(sets.precast.JA, {}, true)
    end
end

function init_gear_sets()
    gear.ambuDEXcape = {name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10'}}
    
    sets.Enmity = {                 --39
        neck="Invidia Torque",      --5
        ear1="Friomisi Earring",    --2
        hands="Macabre Gauntlets",  --6
        ring1="Provocare Ring",     --5
        ring2="Eihwaz Ring",        --5
        back="Earthcry Mantle",     --7
        waist="Warwolf Belt",       --3
        feet="Mochizuki Kyahan +1"  --6
    }
    --============================================================
    --          Precast sets
    --============================================================
    
    sets.precast.JA['Mijin Gakure'] = {legs="Mochizuki Hakama +1"}
    
    sets.precast.Flourish1 = sets.precast.JA
    --Stun; Magic Accuracy
    sets.precast.Flourish1['Violent Flourish'] = {
        neck="Sanctity Necklace",    ear1="Lifestorm Earring",   ear2="Psystorm Earring",
        hands="Taeon Gloves",       ring1="Sangoma Ring",       ring2="Perception Ring",
        back=gear.ambuDEXcape,      waist="Ovate Rope",
        feet=gear.taeonDWfeet
    }
    
    sets.precast.Waltz = {
        head="Uk'uxkaj Cap",            neck="Dualism Collar",
        body="Hachiya Chainmail +1",    hands="Buremte Gloves", ring1="Asklepian Ring",     ring2="Terrasoul Ring",
        back="Iximulew Cape",           waist="Warwolf Belt",   legs="Desultor Tassets",    feet="Mochizuki Kyahan +1"
    }

    sets.precast.Step = combineSets(sets.engaged, {
        body="Mochizuki Chainmail +1"
    })
    
    sets.precast.Ranged = {
        ammo="Suppa Shuriken",
        head="Uk'uxkaj Cap",
        hands="Manibozho Gloves"
    }
    
    sets.precast.FC = {                 --%
        ammo="Impatiens",               --Q+2%4
        head="Herculean Helm",          --7%
        neck="Orunmila's Torque",       --5%
        ear1="Loquacious Earring",      --2%
        body="Taeon Tabard",            --4%
        hands={"Thaumas Gloves", "Buremte Gloves"},--4/3%
        ring1="Prolix Ring",            --2%
        ring2="Veneficium Ring",        --Q+1%
        legs="Quiahuiz Trousers",       --3%
        feet="Suzaku's Sune-Ate"        --4%
    }
    
    sets.precast.FC.Utsusemi = {        --40%
        neck="Magoraga Bead Necklace",  --10%
        body="Mochizuki Chainmail +1",  --10%
    }

    --============================================================
    --sets.wsBase[magic][sam/other][state.OffenseMode][state.RangedMode][wsmod[spell.en]]
    sets.wsBase = {                                                                     ammo="Happo Shuriken +1",
        head=gear.taeonTAhead,  neck="Asperity Necklace",   ear1="Bladeborn Earring",   ear2="Steelflash Earring",
        body="Qaaxo Harness",   hands="Herculean Gloves",   ring1="Rajas Ring",         ring2="Epona's Ring",
        back=gear.ambuDEXcape,  waist="Windbuffet Belt +1", legs=gear.taeonTAlegs,      feet="Herculean Boots"
    }
    sets.wsBase.DEX = {}    --feet="Hizamaru Sune-Ate +1"
    sets.wsBase.STR = {}
    sets.wsBase.STRDEX = {}
    sets.wsBase.AGI = {ring1="Stormsoul Ring"}
    
    sets.wsBase.MediumAcc = {
        body="Hizamaru Haramaki +1",    hands="Hizamaru Kote +1",   ring2="Chirich Ring"
    }
    sets.wsBase.MediumAcc.DEX = {feet="Hizamaru Sune-Ate +1"}
    sets.wsBase.MediumAcc.AGI = {}
    
    sets.wsBase.HighAcc = {
        head="Hizamaru Somen +1",
        body="Hizamaru Haramaki +1",    hands="Hizamaru Kote +1",       ring2="Chirich Ring",
        waist="Anguinus Belt",          legs="Hizamaru Hizayoroi +1",   feet="Hizamaru Sune-Ate +1"
    }
    sets.wsBase.HighAcc.DEX = {feet="Hizamaru Sune-Ate +1"}
    sets.wsBase.HighAcc.AGI = {}
    
    sets.wsBase.Magic = {       ammo="Dosis Tathlum",
        head="Mochizuki Hatsuburi +1",  neck="Sanctity Necklace",    ear1="Hecate's Earring",    ear2="Friomisi Earring",
        body="Qaaxo Harness",           hands="Mochizuki Tekko +1", ring1="Fenrir Ring +1",     ring2="Acumen Ring",
        back="Toro Cape",                                           legs="Shneddick Tights +1", feet="Hachiya Kyahan"
    }
    
    --============================================================
    --          Midcast sets
    --============================================================
    
    sets.midcast.FastRecast = {     ammo="Impatiens",
        head="Otronif Mask +1",     neck="Orunmila's Torque",   ear1="Loquacious Earring",  ear2="Ethereal Earring",
        body="Taeon Tabard",        hands="Mochizuki Tekko +1", ring1="Prolix Ring",        ring2="Diamond Ring",
        back="Mujin Mantle",        waist="Flume Belt",         legs="Otronif Brais +1",    feet="Otronif Boots +1"
    }
    sets.midcast.Utsusemi = {back="Andartia's Mantle", feet="Hattori Kyahan"}

    sets.midcast.MagicAccuracy = {
        head="Hachiya Hatsuburi",   neck="Sanctity Necklace",    ear1="Lifestorm Earring",   ear2="Psystorm Earring",
        ring1="Perception Ring",    ring2="Sangoma Ring",
        back="Yokaze Mantle",       waist="Ovate Rope"
    }
    
    sets.midcast.Ninjutsu = {
        head="Hachiya Hatsuburi",
        feet="Mochizuki Kyahan +1"
    }
    
    sets.midcast.Ninjutsu.Nuke = {          ammo="Dosis Tathlum",
        head="Mochizuki Hatsuburi +1",  neck="Sanctity Necklace",    ear1="Hecate's Earring",    ear2="Friomisi Earring",
        body="Qaaxo Harness",           hands="Iga Tekko +2",       ring1="Fenrir Ring +1",     ring2="Acumen Ring",
        back="Toro Cape",                                           legs="Shneddick Tights +1", feet="Hachiya Kyahan"
    }
    sets.midcast.Ninjutsu.Nuke.with_buff = {}
    
    sets.midcast.RangedAttack = {
        head="Uk'uxkaj Cap",            neck="Ocachi Gorget",       ear1="Clearview Earring",
        body="Mochizuki Chainmail +1",  hands="Hachiya Tekko",      ring1="Longshot Ring",      ring2="Paqichikaji Ring",
        back="Yokaze Mantle",           waist="Sveltesse Gouriz",   legs="Pursuer's Pants",     feet="Mochizuki Kyahan +1"
    }
    
    --============================================================
    --          Other sets
    --============================================================
    
    sets.weapons.Main = {main="Kikoku", sub="Tancho +1"}
    sets.weapons.Reverse = {main="Tancho +1", sub="Kikoku"}
    sets.weapons.OAT = {main="Kikoku", sub="Taikogane"}
    sets.weapons.Reive = {main="Kikoku", sub="Senkutanto"}
    sets.weapons.Sword = {main="Usonmunku", sub="Tancho +1"}
    sets.weapons.Dagger = {main="Sabebus", sub="Tancho +1"}
    
    sets.idle = {
        ammo="Demonry Stone",
        head="Ocelomeh Headpiece +1",   neck="Sanctity Necklace",   ear1="Brachyura Earring",       ear2="Ethereal Earring",
        body="Hizamaru Haramaki +1",    hands="Umuthi Gloves",      ring1="Defending Ring",         ring2="Shneddick Ring",
        back="Repulse Mantle",          waist="Flume Belt",         legs="Hizamaru Hizayoroi +1",   feet="Hizamaru Sune-Ate +1"
        --feet="Hachiya Kyahan"
    }
    sets.idle.indoors = {ammo="Happo Shuriken +1", head="Ptica Headgear"}
    sets.idle.CapFarm = {back="Mecistopins Mantle"}
    sets.idle.with_buff = {}
    sets.idle.with_buff['migawari'] = {body="Hattori Ningi"}
    sets.idle.with_buff['reive mark'] = {neck="Ygnas's Resolve +1"}
    
    -- Defense sets
    sets.defense.Evasion = {
        head="Otronif Mask +1",         neck="Torero Torque",       ear1="Novia Earring",       ear2="Ethereal Earring",
        body="Hachiya Chainmail +1",    hands="Otronif Gloves +1",  ring1="Defending Ring",     ring2="Alert Ring",
        back="Ik Cape",                 waist="Sveltesse Gouriz",   legs="Hachiya Hakama +1",   feet="Otronif Boots +1"
    }
    
    sets.defense.DT = {
        neck="Twilight Torque",
        ring1="Defending Ring", ring2="Dark Ring"
    }
    
    sets.defense.PDT = combineSets(sets.defense.DT, {   --PDT-37%
        head="Otronif Mask +1",     
        body="Otronif Harness +1",  hands="Otronif Gloves +1",  
        back="Repulse Mantle",      waist="Flume Belt",     legs="Otronif Brais +1",    feet="Otronif Boots +1"
    })
    sets.defense.MDT = combineSets(sets.defense.DT, {   --MDT-16%, MDB+17
        ammo="Demonry Stone",
        head="Otronif Mask +1", ear1="Merman's Earring",    ear2="Merman's Earring",
        body="Qaaxo Harness",   hands="Umuthi Gloves",
        back="Tuilha Cape",
        legs=gear.taeonTAlegs,
        feet=gear.taeonDWfeet
    })
    
    --============================================================
    
    sets.engaged.with_buff['migawari'] = {body="Hattori Ningi"}
    sets.engaged.with_buff['reive mark'] = {neck="Ygnas's Resolve +1"}
    
    sets.engaged.Tank = {
        ammo="Happo Shuriken +1",
        head="Otronif Mask +1",         neck="Twilight Torque",     ear1="Bladeborn Earring",   ear2="Steelflash Earring",
        body="Mochizuki Chainmail +1",  hands="Otronif Gloves +1",  ring1="Defending Ring",     ring2="Rajas Ring",
        back="Yokaze Mantle",           waist="Patentia Sash",      legs="Mochizuki Hakama +1", feet="Otronif Boots +1"
    }
    
    sets.engaged.auto = {                                                                   ammo="Happo Shuriken +1",
        head="Ptica Headgear",          neck="Asperity Necklace",   ear1="Dudgeon Earring", ear2="Heartseeker Earring",
        body="Mochizuki Chainmail +1",  hands="Herculean Gloves",    ring1="Rajas Ring",     ring2="Epona's Ring",
        back=gear.ambuDEXcape,          waist="Windbuffet Belt +1", legs=gear.taeonTAlegs,  feet="Hizamaru Sune-Ate +1"
    }
    sets.engaged.auto['na'] =   {
        waist="Patentia Sash",
        legs="Mochizuki Hakama +1",
    }
    sets.engaged.auto['I'] =    {
        legs="Mochizuki Hakama +1",
    }
    sets.engaged.auto['I+'] =   {}
    sets.engaged.auto['II'] =   {
        head=gear.taeonTAhead
    }
    sets.engaged.auto['II+'] =  {
        head=gear.taeonTAhead,
        ear1="Bladeborn Earring",   ear2="Steelflash Earring",
        body="Qaaxo Harness",
    }
    
    sets.engaged.auto.MediumAcc = {
        neck="Agitator's Collar",
        ring2="Chirich Ring",
    }
    sets.engaged.auto.HighAcc = {
        neck="Iqabi Necklace",
        --hands="Hizamaru Kote +1",
        ring2="Chirich Ring",
        waist="Anguinus Belt"
    }
    
    sets.engaged.CrazyAccuracy = {                                                                  ammo="Happo Shuriken +1",
        head="Hizamaru Somen +1",       neck="Iqabi Necklace",      ear1="Bladeborn Earring",       ear2="Steelflash Earring",
        body="Hizamaru Haramaki +1",    hands="Hizamaru Kote +1",   ring1="Rajas Ring",             ring2="Chirich Ring",
        back=gear.ambuDEXcape,          waist="Anguinus Belt",      legs="Hizamaru Hizayoroi +1",   feet="Hizamaru Sune-Ate +1"
    }
    
    refresh_gear_sets()
end