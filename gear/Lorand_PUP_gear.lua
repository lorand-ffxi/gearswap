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
    sets.precast.JA['Repair'] = {ear2="Guignol Earring"}

    sets.precast.Waltz = {
        legs="Desultor Tassets"
    }
    sets.precast.Waltz['Healing Waltz'] = {}

    sets.precast.Step = {}
    
    --============================================================
    
    -- Fast cast sets for spells
    sets.precast.FC = {
        head=gear.hercHead,         neck="Orunmila's Torque",   ear1="Loquacious Earring",
        body=gear.taeonHasteBody,   hands="Thaumas Gloves",     ring1="Prolix Ring",        ring2="Veneficium Ring",
        back="Ogapepo Cape",        legs="Quiahuiz Trousers",   feet="Chelona Boots"
    }
    sets.precast.FC.Utsusemi = {neck="Magoraga Bead Necklace"}
    
    --============================================================
    
    sets.wsBase = {
        head="Hizamaru Somen +1",       neck="Sanctity Necklace",   ear1="Steelflash Earring",      ear2="Bladeborn Earring",
        body="Hizamaru Haramaki +1",    hands=gear.hercHands,       ring1="Rajas Ring",             ring2="Epona's Ring",
        back="Dispersal Mantle",        waist="Windbuffet Belt +1", legs="Hizamaru Hizayoroi +1",   feet=gear.nagaAccFeet
    }
    sets.wsBase.MediumAcc = {}
    sets.wsBase.HighAcc = {}

    sets.wsBase.Magic = {                                   ammo="Dosis Tathlum",
        head="Highwing Helm",   neck="Sanctity Necklace",    ear1="Hecate's Earring",    ear2="Friomisi Earring",
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
    
    sets.idle = {                                                   range="Divinator",
        head=gear.hercHead,             neck="Sanctity Necklace",   ear1="Brachyura Earring",   ear2="Ethereal Earring",
        body="Hizamaru Haramaki +1",    hands=gear.hercHands,       ring1="Defending Ring",     ring2="Shneddick Ring",
        back="Repulse Mantle",          waist="Hurch'lan Sash",     legs=gear.hercLegs,         feet=gear.hercCritFeet
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
    
    sets.weapons.Main = {main="Denouements"}
    
    sets.engaged = {                                                range="Divinator",
        head="Hizamaru Somen +1",       neck="Asperity Necklace",   ear1="Steelflash Earring",  ear2="Bladeborn Earring",
        body="Hizamaru Haramaki +1",    hands="Regimen Mittens",    ring1="Rajas Ring",         ring2="Epona's Ring",
        back="Dispersal Mantle",        waist="Hurch'lan Sash",     legs=gear.hercLegs,         feet=gear.hercCritFeet
    }
    
    sets.engaged.MediumAcc = {
        neck="Sanctity Necklace",
        ring2="Chirich Ring"
    }
    
    sets.engaged.HighAcc = {
        neck="Iqabi Necklace",
        ring2="Chirich Ring",
        legs="Hizamaru Hizayoroi +1",   feet=gear.hercAccFeet
    }
    
    sets.engaged.with_buff = {}
    sets.engaged.with_buff['doom'] = {ring1="Saida Ring", ring2="Saida Ring"}
    sets.engaged.with_buff['reive mark'] = {neck="Ygnas's Resolve +1"}
end