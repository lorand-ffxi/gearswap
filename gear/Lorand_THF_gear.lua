--------------------------------------------------------------------------------
--[[
    Author: Ragnarok.Lorand
--]]
--------------------------------------------------------------------------------

function init_gear_sets()
    gear.jseDWCape = {name="Canny Cape", augments={'DEX+3','AGI+3','"Dual Wield"+4'}}

    --============================================================
    --          Precast sets
    --============================================================
    sets.TreasureHunter = {
        hands="Plunderer's Armlets +1",
        feet="Raider's Poulaines +2"
    }
    
    sets.precast.JA['Collaborator'] = {}
    sets.precast.JA['Accomplice'] = {}
    sets.precast.JA['Flee'] = {feet="Pillager's Poulaines"}
    sets.precast.JA['Hide'] = {}
    sets.precast.JA['Conspirator'] = {}
    sets.precast.JA['Steal'] = {feet="Pillager's Poulaines"}
    sets.precast.JA['Despoil'] = {legs="Raider's Culottes +2", feet="Raider's Poulaines +2"}
    sets.precast.JA['Perfect Dodge'] = {hands="Plunderer's Armlets +1"}
    sets.precast.JA['Feint'] = {}
    sets.precast.JA["Assassin's Charge"] = {feet="Plunderer's Poulaines"}

    sets.precast.JA['Sneak Attack'] = {
        head="Uk'uxkaj Cap",    neck="Love Torque",             ear2="Delta Earring",
        body="Iuitl Vest +1",   hands="Plunderer's Armlets +1", ring1="Rajas Ring",         ring2="Thundersoul Ring",
        back="Kayapa Cape",     waist="Chiner's Belt",          legs=gear.taeonTAlegs,      feet="Iuitl Gaiters +1"
    }

    sets.precast.JA['Trick Attack'] = {
        head="Uk'uxkaj Cap",    neck="Hope Torque",             ear2="Suppanomimi",
        body="Iuitl Vest +1",   hands="Iuitl Wristbands +1",    ring1="Stormsoul Ring",     ring2="Blobnag Ring",
        back="Ik Cape",         waist="Sveltesse Gouriz",
        legs="Pursuer's Pants",
        feet="Iuitl Gaiters +1"
    }

    sets.precast.Waltz = {
        head="Uk'uxkaj Cap",
        body="Iuitl Vest +1",   hands="Plunderer's Armlets +1", ring2="Spiral Ring",
        back="Iximulew Cape",   waist="Warwolf Belt",           legs="Desultor Tassets", feet="Iuitl Gaiters +1"
    }
    
    --============================================================
    
    sets.precast.FC = {
        head=gear.hercHead,         --7%
        neck="Orunmila's Torque",   --5%
        ear1="Loquacious Earring",  --2%
        body="Taeon Tabard",        --4%
        hands="Thaumas Gloves",     --4%
        ring1="Prolix Ring",        --2%
        ring2="Veneficium Ring",    --Q+1%
        legs="Enif Cosciales"       --7%
    }
    sets.precast.FC.Utsusemi = {neck="Magoraga Bead Necklace"}

    --============================================================
    
    --Snapshot
    sets.precast.ranged = {
        hands="Iuitl Wristbands +1",
        legs="Nahtirah Trousers",
        feet="Meghanada Jambeaux"
    }

    sets.wsBase = {
        head=gear.taeonTAhead,  neck="Fotia Gorget",        ear1="Steelflash Earring",  ear2="Bladeborn Earring",
        body="Qaaxo Harness",   hands="Meghanada Gloves",   ring1="Rajas Ring",         ring2="Epona's Ring",
        back="Bleating Mantle", waist="Fotia Belt",         legs=gear.taeonTAlegs,      feet=gear.taeonDWfeet
    }
    
    sets.wsBase.DEX = {}
    
    sets.wsBase.MediumAcc = {
        back="Canny Cape"
    }
    sets.wsBase.HighAcc = {
        body=gear.taeonHasteBody,
        hands="Meghanada Gloves",
        ring2="Mars's Ring",
        back="Kayapa Cape",
        feet="Meghanada Jambeaux"
    }

    sets.wsBase.Magic = {
        head="Highwing Helm",       neck="Sanctity Necklace",    ear1="Hecate's Earring",    ear2="Friomisi Earring",
        hands=gear.hercHands,    ring1="Fenrir Ring +1",     ring2="Acumen Ring",
        back="Toro Cape",           legs="Shneddick Tights +1", feet="Iuitl Gaiters +1"
    }
    
    --============================================================
    --          Midcast sets
    --============================================================
    
    sets.midcast.FastRecast = {
        head="Taeon Chapeau",   neck="Orunmila's Torque",   ear1="Loquacious Earring",
        body="Iuitl Vest +1",   hands="Buremte Gloves",     ring1="Prolix Ring",        ring2="Diamond Ring",   --Diamond Ring aug: 2% interrupt rate down
        back="Mujin Mantle",    waist="Cetl Belt",          legs="Quiahuiz Trousers",   feet="Iuitl Gaiters +1"
    }
    sets.midcast.Utsusemi = {back="Mujin Mantle"}

    sets.midcast.ranged = {
        head="Umbani Cap",
        neck="Iqabi Necklace",
        ear1="Clearview Earring",
        ear2="Volley Earring",
        body="Iuitl Vest +1",
        hands="Meghanada Gloves",
        ring1="Paqichikaji Ring",
        ring2="Longshot Ring",
        back="Kayapa Cape",
        waist="Elanid Belt",
        legs="Pursuer's Pants",
        feet="Meghanada Jambeaux"
    }
    sets.midcast.ranged.TH = sets.TreasureHunter
    
    --============================================================
    --          Other sets
    --============================================================
    
    sets.weapons.Other = {}
    sets.weapons.TH = {main='Sandung',sub='Jugo Kukri +1',range="Raider's Boomerang"}
    sets.weapons.THOAT = {main='Sandung',sub='Atoyac',range="Raider's Boomerang"}
    sets.weapons.OAT = {main='Izhiikoh',sub='Atoyac',range="Raider's Boomerang"}
    sets.weapons.DD = {main='Izhiikoh',sub='Jugo Kukri +1',range="Raider's Boomerang"}
    sets.weapons.Accuracy = {main='Izhiikoh',sub='Sandung',ammo='Honed Tathlum'}
    
    sets.resting = {}
    
    sets.idle = {                                               --range="Raider's Boomerang",
        head=gear.hercHead,             neck="Sanctity Necklace",   ear1="Brachyura Earring",   ear2="Ethereal Earring",
        body="Meghanada Cuirie",
        hands={"Plunderer's Armlets +1", gear.hercHands},
        ring1="Defending Ring",         ring2="Shneddick Ring",
        back="Repulse Mantle",          waist="Flume Belt",         legs=gear.hercLegs,         feet=gear.hercCritFeet
    }
    sets.idle.with_buff = {}
    sets.idle.with_buff['doom'] = {ring1="Saida Ring", ring2="Saida Ring"}
    sets.idle.with_buff['reive mark'] = {neck="Ygnas's Resolve +1"}
    
    sets.defense.Evasion = {
        head="Taeon Chapeau",   neck="Torero Torque",           ear1="Novia Earring",   ear2="Ethereal Earring",
        body="Qaaxo Harness",   hands="Plunderer's Armlets +1", ring1="Defending Ring", ring2="Alert Ring",
        back="Canny Cape",      waist="Sveltesse Gouriz",       legs=gear.hercLegs,     feet=gear.hercAccFeet
    }

    sets.defense.DT = combineSets(sets.defense.Evasion,{    --DT-15%, PDT-12%, MDT-10%  => PDT-27%, MDT-25%
        head="Iuitl Headgear +1",   neck="Twilight Torque",
        body="Iuitl Vest +1",       ring1="Defending Ring",     ring2="Dark Ring",
    })
    
    sets.defense.PDT = combineSets(sets.defense.DT, {   --PDT-12% + DT => PDT-39%
        hands="Umuthi Gloves",
        back="Repulse Mantle",      waist="Flume Belt", feet=gear.hercAccFeet
    })

    sets.defense.MDT = combineSets(sets.defense.DT, {
        ear1="Merman's Earring",    ear2="Merman's Earring",
        hands="Iuitl Wristbands +1",
        back="Tuilha Cape",         legs="Ighwa Trousers",  feet="Iuitl Gaiters +1"
    })
    
    sets.engaged = {
        head=gear.taeonTAhead,  neck="Asperity Necklace",   ear1="Dudgeon Earring", ear2="Heartseeker Earring",
        body="Qaaxo Harness",   hands=gear.taeonDWhands,    ring1="Rajas Ring",     ring2="Epona's Ring",
        back=gear.jseDWCape,    waist="Patentia Sash",      legs=gear.taeonTAlegs,  feet=gear.taeonDWfeet
    }
    
    sets.engaged.auto = {
        head=gear.taeonTAhead,  neck="Asperity Necklace",   ear1="Dudgeon Earring", ear2="Heartseeker Earring",
        body="Qaaxo Harness",   hands=gear.taeonDWhands,    ring1="Rajas Ring",     ring2="Epona's Ring",
        back=gear.jseDWCape,    waist="Patentia Sash",      legs=gear.taeonTAlegs,  feet=gear.taeonDWfeet
    }
    sets.engaged.auto['na'] =   {
    }
    sets.engaged.auto['I'] =    {
    }
    sets.engaged.auto['I+'] =   {
        ear1="Steelflash Earring",
        ear2="Bladeborn Earring",
        hands=gear.hercHands,
        feet=gear.taeonDWfeet
    }
    sets.engaged.auto['II'] =   {
        ear1="Dudgeon Earring",
        ear2="Heartseeker Earring",
        hands=gear.taeonDWhands
    }
    sets.engaged.auto['II+'] =  {
        ear1="Steelflash Earring",
        ear2="Bladeborn Earring",
        hands=gear.hercHands,
        legs=gear.taeonTAlegs,
        feet="Meghanada Jambeaux"
    }
    
    sets.engaged.auto.MediumAcc = {
        body=gear.taeonHasteBody,
        ring2="Chirich Ring",
        legs=gear.adhemarLegsA
    }
    sets.engaged.auto.HighAcc = {
        neck="Iqabi Necklace",
        body=gear.taeonHasteBody,
        ring2="Chirich Ring",
        legs=gear.adhemarLegsA
    }
    
    sets.engaged.with_buff = {}
    sets.engaged.with_buff['doom'] = {ring1="Saida Ring", ring2="Saida Ring"}
    sets.engaged.with_buff['reive mark'] = {neck="Ygnas's Resolve +1"}
    
    sets.engaged.MediumAcc = {
        head=gear.taeonTAhead,      neck="Iqabi Necklace",      ear1="Dudgeon Earring", ear2="Heartseeker Earring",
        body=gear.taeonHasteBody,   hands="Meghanada Gloves",   ring1="Rajas Ring",     ring2="Chirich Ring",
        back=gear.jseDWCape,        waist="Patentia Sash",      legs=gear.adhemarLegsA,  feet=gear.taeonDWfeet
    }
    
    sets.engaged.HighAcc = {
        head=gear.taeonTAhead,      neck="Iqabi Necklace",      ear1="Steelflash Earring",  ear2="Heartseeker Earring",
        body=gear.taeonHasteBody,   hands="Meghanada Gloves",   ring1="Enlivened Ring",     ring2="Chirich Ring",
        back=gear.jseDWCape,        waist="Anguinus Belt",      legs=gear.adhemarLegsA,      feet="Meghanada Jambeaux"
    }
    
    sets.engaged.TH = {
        head=gear.hercHead,         neck="Asperity Necklace",       ear1="Dudgeon Earring", ear2="Heartseeker Earring",
        body=gear.taeonHasteBody,   hands="Plunderer's Armlets +1", ring1="Rajas Ring",     ring2="Epona's Ring",
        back=gear.jseDWCape,        waist="Patentia Sash",          legs=gear.hercLegs,     feet="Raider's Poulaines +2"
    }
    
    --[[{                                 --range="Raider's Boomerang",
        head="Taeon Chapeau",   neck="Asperity Necklace",       ear1="Dudgeon Earring", ear2="Heartseeker Earring",
        body="Qaaxo Harness",   hands="Plunderer's Armlets +1", ring1="Rajas Ring",     ring2="Epona's Ring",
        back="Canny Cape",      waist="Patentia Sash",
        legs={name="Taeon Tights", augments={'Accuracy+15 Attack+15','"Triple Atk."+2','STR+7 DEX+7'}},
        feet="Raider's Poulaines +2"
    }
    --]]
end