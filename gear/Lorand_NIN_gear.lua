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
        neck="Stoicheion Medal",    ear1="Lifestorm Earring",   ear2="Psystorm Earring",
        hands="Taeon Gloves",       ring1="Sangoma Ring",       ring2="Perception Ring",
        back="Yokaze Mantle",       waist="Ovate Rope",
        feet={name="Taeon Boots", augments={'Accuracy+17 Attack+17','"Dual Wield"+5','STR+6 DEX+6'}}
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
    
    sets.precast.FC = {                 --29%
        ammo="Impatiens",               --Q+2%4
        head="Anwig Salade",            --5%
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
    sets.wsBase = {
        ammo="Happo Shuriken +1",
        head={name="Taeon Chapeau", augments={'Accuracy+18 Attack+18','"Triple Atk."+2','Crit. hit damage +2%'}},
        neck="Asperity Necklace",
        ear1="Bladeborn Earring",   ear2="Steelflash Earring",
        body="Qaaxo Harness",
        hands="Taeon Gloves",
        ring1="Rajas Ring",         ring2="Epona's Ring",
        back="Yokaze Mantle",
        waist="Windbuffet Belt +1",
        legs={name="Taeon Tights", augments={'Accuracy+15 Attack+15','"Triple Atk."+2','STR+7 DEX+7'}},
        feet={name="Taeon Boots", augments={'Accuracy+17 Attack+17','"Dual Wield"+5','STR+6 DEX+6'}}
    }
    
    sets.wsBase.Acc = {}
    sets.wsBase.Acc.DEX = {}
    sets.wsBase.Acc.AGI = {}
    
    sets.wsBase.STR = {}
    sets.wsBase.DEX = {}
    sets.wsBase.STRDEX = {}
    sets.wsBase.AGI = {ring1="Stormsoul Ring"}
    
    sets.wsBase.Magic = {
        ammo="Dosis Tathlum",
        head="Mochizuki Hatsuburi +1",
        neck="Stoicheion Medal",
        ear1="Hecate's Earring",    ear2="Friomisi Earring",
        body="Qaaxo Harness",
        hands="Mochizuki Tekko +1",
        ring1="Fenrir Ring +1",     ring2="Acumen Ring",
        back="Toro Cape",
        legs="Shneddick Tights +1",
        feet="Hachiya Kyahan"
    }
    
    --============================================================
    --          Midcast sets
    --============================================================
    
    sets.midcast.FastRecast = {
        ammo="Impatiens",
        head="Otronif Mask +1",
        neck="Orunmila's Torque",
        ear1="Loquacious Earring",  ear2="Ethereal Earring",
        body="Otronif Harness +1",
        hands="Mochizuki Tekko +1",
        ring1="Prolix Ring",        ring2="Diamond Ring",
        back="Mujin Mantle",
        waist="Flume Belt",
        legs="Quiahuiz Trousers",
        feet="Otronif Boots +1"
    }
    sets.midcast.Utsusemi = {feet="Hattori Kyahan"}

    sets.midcast.MagicAccuracy = {
        head="Hachiya Hatsuburi",
        neck="Stoicheion Medal",
        ear1="Lifestorm Earring",   ear2="Psystorm Earring",
        ring1="Perception Ring",    ring2="Sangoma Ring",
        back="Yokaze Mantle",
        waist="Ovate Rope"
    }
    
    sets.midcast.Ninjutsu = {
        head="Hachiya Hatsuburi",
        feet="Mochizuki Kyahan +1"
    }
    
    sets.midcast.Ninjutsu.Nuke = {
        ammo="Dosis Tathlum",
        head="Mochizuki Hatsuburi +1",
        neck="Stoicheion Medal",
        ear1="Hecate's Earring",    ear2="Friomisi Earring",
        body="Qaaxo Harness",
        hands="Iga Tekko +2",
        ring1="Fenrir Ring +1",     ring2="Acumen Ring",
        back="Toro Cape",
        legs="Shneddick Tights +1",
        feet="Hachiya Kyahan"
    }
    sets.midcast.Ninjutsu.Nuke.with_buff = {}
    
    sets.midcast.RangedAttack = {
        head="Uk'uxkaj Cap",
        neck="Ocachi Gorget",
        ear1="Clearview Earring",
        body="Mochizuki Chainmail +1",
        hands="Hachiya Tekko",
        ring1="Longshot Ring",      ring2="Paqichikaji Ring",
        back="Yokaze Mantle",
        waist="Sveltesse Gouriz",
        legs="Pursuer's Pants",
        feet="Mochizuki Kyahan +1"
    }
    
    --============================================================
    --          Other sets
    --============================================================
    
    sets.weapons.Main = {main="Kikoku", sub="Tancho +1"}
    sets.weapons.OAT = {main="Kikoku", sub="Taikogane"}
    sets.weapons.Reive = {main="Kikoku", sub="Senkutanto"}
    sets.weapons.Sword = {main="Usonmunku", sub="Tancho +1"}
    sets.weapons.Dagger = {main="Sabebus", sub="Tancho +1"}
    
    sets.idle = {
        ammo="Demonry Stone",
        head="Ocelomeh Headpiece +1",   neck="Orochi Nodowa",   ear1="Brachyura Earring",   ear2="Ethereal Earring",
        body="Kirin's Osode",           hands="Umuthi Gloves",  ring1="Defending Ring",     ring2="Shneddick Ring",
        back="Repulse Mantle",          waist="Flume Belt",     legs={"Hachiya Hakama +1", "Otronif Brais +1"},
        --feet="Hachiya Kyahan"
        feet="Sokushitsu Sune-Ate"
    }
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
        legs={name="Taeon Tights", augments={'Accuracy+15 Attack+15','"Triple Atk."+2','STR+7 DEX+7'}},
        feet={name="Taeon Boots", augments={'Accuracy+17 Attack+17','"Dual Wield"+5','STR+6 DEX+6'}}
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
    
    sets.engaged.auto = {
        ammo="Happo Shuriken +1",
        head="Hattori Zukin",
        neck="Asperity Necklace",
        ear1="Dudgeon Earring",
        ear2="Heartseeker Earring",
        body={name="Mochizuki Chainmail +1", augments={'Enhances "Sange" effect'}},
        hands={name="Taeon Gloves", augments={'Accuracy+15 Attack+15','"Triple Atk."+2','DEX+7'}},
        ring1="Rajas Ring",
        ring2="Epona's Ring",
        back="Atheling Mantle",
        waist="Windbuffet Belt +1",
        legs={name="Taeon Tights", augments={'Accuracy+15 Attack+15','"Triple Atk."+2','STR+7 DEX+7'}},
        feet={name="Taeon Boots", augments={'Accuracy+17 Attack+17','"Dual Wield"+5','STR+6 DEX+6'}}
    }
    sets.engaged.auto['na'] =   {
        waist="Patentia Sash",
        legs={name="Mochizuki Hakama +1", augments={'Enhances "Mijin Gakure" effect'}}
    }
    sets.engaged.auto['I'] =    {
        legs={name="Mochizuki Hakama +1", augments={'Enhances "Mijin Gakure" effect'}}
    }
    sets.engaged.auto['I+'] =   {}
    sets.engaged.auto['II'] =   {
        head={name="Taeon Chapeau", augments={'Accuracy+18 Attack+18','"Triple Atk."+2','Crit. hit damage +2%'}}
    }
    sets.engaged.auto['II+'] =  {
        head={name="Taeon Chapeau", augments={'Accuracy+18 Attack+18','"Triple Atk."+2','Crit. hit damage +2%'}},
        ear1="Bladeborn Earring",   ear2="Steelflash Earring",
        body={name="Qaaxo Harness", augments={'Attack+15','Evasion+15','"Dbl.Atk."+2'}}
    }
    
    sets.engaged.auto.MediumAcc = {
        neck="Agitator's Collar",
        ring2="Mars's Ring",
        back="Yokaze Mantle"
    }
    sets.engaged.auto.HighAcc = {
        neck="Iqabi Necklace",
        ring2="Mars's Ring",
        back="Yokaze Mantle",
        waist="Anguinus Belt"
    }
    
    sets.engaged.CrazyAccuracy = {
        ammo="Happo Shuriken +1",
        head={name="Taeon Chapeau", augments={'Accuracy+18 Attack+18','"Triple Atk."+2','Crit. hit damage +2%'}},
        neck="Iqabi Necklace",
        ear1="Bladeborn Earring",
        ear2="Steelflash Earring",
        body={name="Mochizuki Chainmail +1", augments={'Enhances "Sange" effect'}},
        hands={name="Taeon Gloves", augments={'Accuracy+15 Attack+15','"Triple Atk."+2','DEX+7'}},
        ring1="Rajas Ring",
        ring2="Mars's Ring",
        back={name="Yokaze Mantle", augments={'STR+3','DEX+2','Sklchn.dmg.+1%'}},
        waist="Anguinus Belt",
        legs={name="Taeon Tights", augments={'Accuracy+15 Attack+15','"Triple Atk."+2','STR+7 DEX+7'}},
        feet={name="Taeon Boots", augments={'Accuracy+17 Attack+17','"Dual Wield"+5','STR+6 DEX+6'}}
    }
    
    refresh_gear_sets()
end