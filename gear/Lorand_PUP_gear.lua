--------------------------------------------------------------------------------
--[[
    Author: Ragnarok.Lorand
--]]
--------------------------------------------------------------------------------

function init_gear_sets()
    --============================================================
    --          Precast sets
    --============================================================
    sets.precast.JA['Activate'] = {}

    sets.precast.Waltz = {
    }
    sets.precast.Waltz['Healing Waltz'] = {}

    sets.precast.Step = {}
    
    --============================================================
    
    -- Fast cast sets for spells
    sets.precast.FC = {
        head="Anwig Salade",        neck="Orunmila's Torque",   ear1="Loquacious Earring",
        body="Taeon Tabard",        hands="Thaumas Gloves",     ring1="Prolix Ring",        ring2="Veneficium Ring",
        legs="Quiahuiz Trousers",   feet="Suzaku's Sune-Ate"
    }
    sets.precast.FC.Utsusemi = {neck="Magoraga Bead Necklace"}
    
    --============================================================
    
    sets.wsBase = {
    }
    sets.wsBase.MediumAcc = {}
    sets.wsBase.HighAcc = {}

    sets.wsBase.Magic = {                                   ammo="Dosis Tathlum",
        head="Highwing Helm",   neck="Stoicheion Medal",    ear1="Hecate's Earring",    ear2="Friomisi Earring",
        hands="Taeon Gloves",   ring1="Fenrir Ring +1",     ring2="Acumen Ring",
        back="Toro Cape",       waist="Fotia Belt",         legs="Shneddick Tights +1",
    }
    
    --============================================================
    --          Midcast sets
    --============================================================
    
    sets.midcast.FastRecast = {
    }

    --============================================================
    --          Other sets
    --============================================================
    
    sets.buffs['doom'] = {ring1="Saida Ring", ring2="Saida Ring"}
    
    sets.idle = {
        range="Divinator",
        head="Ocelomeh Headpiece +1",
        neck="Orochi Nodowa",
        ear1="Brachyura Earring",
        ear2="Ethereal Earring",
        body="Qaaxo Harness",
        hands={name="Otronif Gloves +1", augments={'Phys. dmg. taken -4%','Attack+6'}},
        ring1="Defending Ring",
        ring2="Shneddick Ring",
        back="Repulse Mantle",
        waist="Hurch'lan Sash",
        legs={name="Taeon Tights", augments={'Accuracy+15 Attack+15','"Triple Atk."+2','STR+7 DEX+7'}},
        feet={name="Otronif Boots +1", augments={'Phys. dmg. taken -3%','Attack+6'}}
    }
    sets.idle.with_buff = {}
    sets.idle.with_buff['doom'] = {ring1="Saida Ring", ring2="Saida Ring"}
    sets.idle.with_buff['reive mark'] = {neck="Ygnas's Resolve +1"}
    
    sets.resting = {}
    
    sets.defense.DT = { --DT-15%, PDT-5%, MDT-4%    => PDT-20%, MDT-19%
        neck="Twilight Torque",
        ring1="Defending Ring",     ring2="Dark Ring"
    }
    sets.defense.PDT = combineSets(sets.defense.DT, {
    })
    sets.defense.MDT = combineSets(sets.defense.DT, {
    })
    
    sets.defense.HP = sets.defense.PDT

    --============================================================
    
    sets.weapons.Main = {main="Tinhaspa"}
    
    sets.engaged = {
        range="Divinator",
        head={name="Taeon Chapeau", augments={'Accuracy+18 Attack+18','"Triple Atk."+2','Crit. hit damage +2%'}},
        neck="Asperity Necklace",
        ear1="Steelflash Earring",
        ear2="Bladeborn Earring",
        body="Qaaxo Harness",
        hands="Regimen Mittens",
        ring1="Rajas Ring",
        ring2="Epona's Ring",
        back="Dispersal Mantle",
        waist="Hurch'lan Sash",
        legs={name="Taeon Tights", augments={'Accuracy+15 Attack+15','"Triple Atk."+2','STR+7 DEX+7'}},
        feet={name="Taeon Boots", augments={'Accuracy+17 Attack+17','"Dual Wield"+5','STR+6 DEX+6'}}
    }
    
    sets.engaged.MediumAcc = {
        body="Taeon Tabard",
        ring2="Enlivened Ring"
    }
    
    sets.engaged.HighAcc = {
        head={name="Taeon Chapeau", augments={'Accuracy+18 Attack+18','"Triple Atk."+2','Crit. hit damage +2%'}},
        neck="Iqabi Necklace",
        ear1="Steelflash Earring",
        ear2="Bladeborn Earring",
        body={name="Taeon Tabard", augments={'Accuracy+17 Attack+17','Haste+2','STR+6 DEX+6'}},
        hands={name="Taeon Gloves", augments={'Accuracy+25','"Dual Wield"+4','STR+7 DEX+7'}},
        ring1="Rajas Ring",
        ring2="Enlivened Ring",
        back="Dispersal Mantle",
        waist="Hurch'lan Sash",
        legs={name="Taeon Tights", augments={'Accuracy+15 Attack+15','"Triple Atk."+2','STR+7 DEX+7'}},
        feet={name="Taeon Boots", augments={'Accuracy+17 Attack+17','"Dual Wield"+5','STR+6 DEX+6'}}
    }
    
    sets.engaged.with_buff = {}
    sets.engaged.with_buff['doom'] = {ring1="Saida Ring", ring2="Saida Ring"}
    sets.engaged.with_buff['reive mark'] = {neck="Ygnas's Resolve +1"}
end