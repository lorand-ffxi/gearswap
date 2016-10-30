--------------------------------------------------------------------------------
--[[
    Author: Ragnarok.Lorand
--]]
--------------------------------------------------------------------------------

function init_gear_sets()
    gear.pldJSEback = {name="Weard Mantle", augments={'VIT+1','DEX+4','Enmity+5','Phalanx +3'}}
    gear.acroEnmityLegs = {name="Acro Breeches", augments={'Accuracy+8 Attack+8','Enmity+9'}}
    gear.acroDAlegs = {name="Acro Breeches", augments={'Attack+10','"Dbl.Atk."+3','STR+4 AGI+4'}}

    sets.Enmity = {                     --74
        head="Hero's Galea",            --8
        neck="Invidia Torque",          --5
        ear1="Friomisi Earring",        --2
        ear2="Trux Earring",            --5
        body="Creed Cuirass +2",        --10
        --hands="Yorium Gauntlets",       --13
        hands={name="Yorium Gauntlets", augments={'Enmity+9'}},
        ring1="Provocare Ring",         --5
        ring2="Eihwaz Ring",            --5
        back="Earthcry Mantle",         --7
        waist="Creed Baudrier",         --5
        --legs="Caballarius Breeches +1", --7
        legs={name="Acro Breeches", augments={'Accuracy+8 Attack+8','Enmity+9'}},
        feet="Creed Sabatons +2"        --7
    }
    --============================================================
    --          Precast sets
    --============================================================
    sets.precast.JA = sets.Enmity
    sets.precast.JA['Invincible'] = {legs="Caballarius Breeches +1"}
    sets.precast.JA['Holy Circle'] = {feet="Reverence Leggings +1"}
    sets.precast.JA['Shield Bash'] = {
        ear1="Creed Earring",               ear2="Knightly Earring",
        hands="Caballarius Gauntlets +1",   ring2="Fenian Ring",
        feet="Reverence Leggings +1"
    }
    sets.precast.JA['Sentinel'] = {feet="Caballarius Leggings +1"}
    sets.precast.JA['Rampart'] = {head="Caballarius Coronet +1"}
    sets.precast.JA['Fealty'] = {body="Caballarius Surcoat +1"}
    sets.precast.JA['Divine Emblem'] = {feet="Creed Sabatons +2"}
    sets.precast.JA['Chivalry'] = {hands="Caballarius Gauntlets +1"}    -- MP recovered = TP×0.5 + TP×0.015×MND
    
    sets.precast.Waltz = {
        head="Reverence Coronet +1",    neck="Invidia Torque",              ear1="Creed Earring",           ear2="Friomisi Earring",
        body="Reverence Surcoat +1",    hands="Caballarius Gauntlets +1",   ring1="Asklepian Ring",         ring2="Eihwaz Ring",
        back="Earthcry Mantle",         waist="Creed Baudrier",             legs="Caballarius Breeches +1", feet="Caballarius Leggings +1"
    }
    sets.precast.Waltz['Healing Waltz'] = {}

    --============================================================
    
    sets.precast.FC = {             --35%
        ammo="Incantor Stone",      --2%
        head="Cizin Helm +1",       --5%
        neck="Orunmila's Torque",   --5%
        ear1="Loquacious Earring",  --2%
        body="Nuevo Coselete",      --5%
        hands="Buremte Gloves",     --3%
        ring1="Prolix Ring",        --2%
        ring2="Veneficium Ring",    --Q+1%
        legs="Enif Cosciales",      --8%
        feet="Ejekamal Boots"       --3%
    }
    sets.precast.FC.EnhancingMagic = {waist="Siegel Sash"}
        
    --============================================================
       
    sets.wsBase = {
        ammo="Jukukik Feather",
        head="Yaoyotl Helm",
        neck="Asperity Necklace",
        ear1="Bladeborn Earring",   ear2="Steelflash Earring",
        body="Xaddi Mail",
        --hands="Cizin Mufflers +1",
        hands={name="Cizin Mufflers +1", augments={'Phys. dmg. taken -1%','"Dbl.Atk."+1'}},
        ring1="Rajas Ring",         ring2="Mars's Ring",
        back="Atheling Mantle",
        waist="Windbuffet Belt +1",
        legs="Sulevia's Cuisses",
        feet={name="Acro Leggings", augments={'Accuracy+19','"Store TP"+3','STR+2 AGI+2'}}
        --legs="Cizin Breeches +1",
        --feet="Ejekamal Boots"
    }
    sets.wsBase.DEX = {ring2="Thundersoul Ring"}
    sets.wsBase.STR = {ring2="Pyrosoul Ring"}

    sets.wsBase.MediumAcc = {
        body="Sulevia's Platemail"
    }
    sets.wsBase.HighAcc = {
        body="Sulevia's Platemail"
    }
    
    sets.wsBase.magic = {
        ammo="Dosis Tathlum",
        neck="Sanctity Necklace",    ear1="Hecate's Earring",    ear2="Friomisi Earring",
        ring1="Fenrir Ring +1",     ring2="Acumen Ring",
        back="Toro Cape"
    }
    
    --============================================================
    --          Midcast sets
    --============================================================
    sets.midcast.Enmity = sets.Enmity
    
    sets.midcast.FastRecast = {     --NOTE: Have not re-evaluated yet
        ammo="Incantor Stone",
        head="Cizin Helm +1",           neck="Orunmila's Torque",   ear1="Loquacious Earring",      ear2="Knightly Earring",
        body="Reverence Surcoat +1",    hands="Yorium Gauntlets",   ring1="Prolix Ring",            ring2="Eihwaz Ring",
        back="Earthcry Mantle",         waist="Cetl Belt",          legs="Caballarius Breeches +1", feet="Ejekamal Boots"
    }
    
    sets.midcast.MagicAccuracy = {
        ring1="Balrahn's Ring", ring2="Perception Ring"
    }
    
    sets.midcast.DivineMagic = {    --Haste+23%, FC+9%, Enmity+61
        ammo="Incantor Stone",
        head="Cizin Helm +1",           neck="Invidia Torque",              ear1="Friomisi Earring",        ear2="Knightly Earring",
        body="Reverence Surcoat +1",    hands="Caballarius Gauntlets +1",   ring1="Provocare Ring",         ring2="Eihwaz Ring",
        back="Earthcry Mantle",         waist="Creed Baudrier",             legs="Caballarius Breeches +1", feet="Creed Sabatons +2"
    }
    
    sets.midcast.Cure = {   --Enmity+56, Haste+23%, FC+5%, Interrupt-10%, Cure+7%
        ammo="Impatiens",
        head="Cizin Helm +1",           neck="Invidia Torque",      ear1="Hospitaler Earring",      ear2="Knightly Earring",
        body="Reverence Surcoat +1",    hands="Macabre Gauntlets",  ring1="Provocare Ring",         ring2="Eihwaz Ring",
        back="Fierabras's Mantle",      waist="Creed Baudrier",     legs="Caballarius Breeches +1", feet="Caballarius Leggings +1"
    }
    
    sets.midcast.Cure.Self = {  --Enmity+33, Haste+29%, FC+8%, Interrupt-10%, Cure+7%, Cure received+31%
        ammo="Impatiens",
        head="Cizin Helm +1",           neck="Invidia Torque",  ear1="Hospitaler Earring",      ear2="Knightly Earring",
        body="Reverence Surcoat +1",    hands="Buremte Gloves", ring1="Kunaji Ring",            ring2="Asklepian Ring",
        back="Fierabras's Mantle",      waist="Chuq'aba Belt",  legs="Reverence Breeches +1",   feet="Caballarius Leggings +1"
    }
    sets.midcast.Cure.with_buff = {}
    
    sets.midcast.EnhancingMagic = { --Enmity+43, Haste+23%, FC+7%, Interrupt-10%, Enhancing Skill+25, Enhancing duration+9
        ammo="Impatiens",
        head="Cizin Helm +1",   neck="Colossus's Torque",       ear1="Friomisi Earring",        ear2="Knightly Earring",
        body="Shabti Cuirass",  hands="Reverence Gauntlets +1", ring1="Provocare Ring",         ring2="Eihwaz Ring",
        back="Earthcry Mantle", waist="Cascade Belt",           legs="Reverence Breeches +1",   feet="Caballarius Leggings +1"
    }
    sets.midcast.Protect = {ring1="Sheltered Ring"}
    sets.midcast.Shell = {ring1="Sheltered Ring"}

    --============================================================
    --          Other sets
    --============================================================
    
    sets.weapons.Aegis = {main="Tanmogayi +1",sub="Aegis"}
    sets.weapons.Priwen = {main="Tanmogayi +1",sub="Priwen"}
    
    sets.Reraise = {head="Twilight Helm", body="Twilight Mail"}
    
    sets.resting = {                                                                                    ammo="Homiliary",
        head="Caballarius Coronet +1",  neck="Coatl Gorget +1",         ear1="Brachyura Earring",       ear2="Relaxing Earring",
        body="Ares' Cuirass +1",        hands="Sulevia's Gauntlets",    ring1="Defending Ring",         ring2="Eihwaz Ring",
        back=gear.pldJSEback,           waist="Fucho-no-obi",           legs="Reverence Breeches +1",   feet="Reverence Leggings +1"
    }
    
    sets.idle = {                                                                                       ammo="Homiliary",
        head="Sulevia's Mask",          neck="Coatl Gorget +1",         ear1="Brachyura Earring",       ear2="Ethereal Earring",
        body="Reverence Surcoat +1",    hands="Sulevia's Gauntlets",    ring1="Defending Ring",         ring2="Shneddick Ring",
        back=gear.pldJSEback,           waist="Fucho-no-obi",           legs="Sulevia's Cuisses",       feet="Reverence Leggings +1"
    }
    sets.idle.indoors = {body="Ares' Cuirass +1"}
    sets.idle.reraise = {head="Twilight Helm",   body="Twilight Mail"}
    sets.idle.with_buff = {}
    sets.idle.with_buff['doom'] = {ring1="Saida Ring", ring2="Saida Ring", legs="Shabti Cuisses"}
    sets.idle.with_buff['reive mark'] = {neck="Ygnas's Resolve +1"}
    
    sets.idle.PDT = {                                                                                   ammo="Bibiki Seashell",
        head=gear.souveranHeadC,        neck="Twilight Torque",         ear1="Creed Earring",           ear2="Oneiros Earring",
        body="Reverence Surcoat +1",    hands="Sulevia's Gauntlets",    ring1="Defending Ring",         ring2=gear.darkRing1,
        back="Shadow Mantle",           waist="Flume Belt",             legs="Caballarius Breeches +1", feet="Reverence Leggings +1"
    }
    
    sets.idle.MDT = {                                                                               ammo="Demonry Stone",
        head=gear.souveranHeadC,        neck="Twilight Torque",         ear1="Merman's Earring",    ear2="Oneiros Earring",
        body="Reverence Surcoat +1",    hands="Reverence Gauntlets +1", ring1="Defending Ring",     ring2="Archon Ring",
        back=gear.pldJSEback,           waist="Creed Baudrier",         legs="Sulevia's Cuisses",   feet="Caballarius Leggings +1"
    }
    
    sets.defense.DT = {                                                                             ammo="Angha Gem",
        head="Sulevia's Mask",          neck="Twilight Torque",         ear1="Creed Earring",       ear2="Oneiros Earring",
        body="Reverence Surcoat +1",    hands="Sulevia's Gauntlets",    ring1="Defending Ring",     ring2=gear.darkRing1,
        back=gear.pldJSEback,           waist="Flume Belt",             legs="Sulevia's Cuisses",   feet="Reverence Leggings +1"
    }
    
    sets.defense.PDT = {                                                                                ammo="Bibiki Seashell",
        head=gear.souveranHeadC,        neck="Twilight Torque",         ear1="Creed Earring",           ear2="Oneiros Earring",
        body="Reverence Surcoat +1",    hands="Sulevia's Gauntlets",    ring1="Defending Ring",         ring2=gear.darkRing1,
        back="Shadow Mantle",           waist="Flume Belt",             legs="Caballarius Breeches +1", feet="Reverence Leggings +1"
    }

    sets.defense.MDT = {                                                                            ammo="Demonry Stone",
        head=gear.souveranHeadC,        neck="Twilight Torque",         ear1="Merman's Earring",    ear2="Oneiros Earring",
        body="Reverence Surcoat +1",    hands="Reverence Gauntlets +1", ring1="Defending Ring",     ring2="Archon Ring",
        back=gear.pldJSEback,           waist="Creed Baudrier",         legs="Sulevia's Cuisses",   feet="Caballarius Leggings +1"
    }
    
    sets.engaged = {}
    sets.engaged.MediumAcc = {}
    sets.engaged.HighAcc = {}
    
    sets.engaged.Tankish = {                                                                    ammo="Hasty Pinion +1",
        head="Sulevia's Mask",      neck="Agitator's Collar",       ear1="Bladeborn Earring",   ear2="Steelflash Earring",
        body="Sulevia's Platemail", hands="Sulevia's Gauntlets",    ring1="Defending Ring",     ring2="K'ayres Ring",
        back=gear.pldJSEback,       waist="Pya'ekue Belt",          legs=gear.odysseanAccLegs,  feet=gear.acroAccLegs
    }
    sets.engaged.Tankish.MediumAcc = {body="Sulevia's Platemail", ring2="Enlivened Ring"}
    sets.engaged.Tankish.HighAcc = {body="Sulevia's Platemail", ring2="Enlivened Ring"}
    
    sets.engaged.DD = {                                                                 ammo="Jukukik Feather",
        head="Yaoyotl Helm",    neck="Asperity Necklace",   ear1="Bladeborn Earring",   ear2="Steelflash Earring",
        body=gear.xaddiBody,    hands=gear.cizinHands,      ring1="Rajas Ring",         ring2="K'ayres Ring",
        back="Atheling Mantle", waist="Sweordfaetels",      legs=gear.odysseanAccLegs,  feet=gear.acroAccLegs
    }
    sets.engaged.DD.daytime = {ammo="Tengu-no-Hane"}
    sets.engaged.DD.MediumAcc = {
        head="Yaoyotl Helm",    neck="Sanctity Necklace",       ear1="Bladeborn Earring",   ear2="Steelflash Earring",
        body=gear.xaddiBody,    hands="Sulevia's Gauntlets",    ring1="Rajas Ring",         ring2="Chirich Ring",
        back=gear.pldJSEback,   waist="Goading Belt",           legs=gear.odysseanAccLegs,  feet=gear.acroAccLegs
    }
    sets.engaged.DD.MediumAcc.daytime = {ammo="Tengu-no-Hane"}
    sets.engaged.DD.HighAcc = {
        head="Yaoyotl Helm",        neck="Iqabi Necklace",          ear1="Heartseeker Earring", ear2="Steelflash Earring",
        body="Sulevia's Platemail", hands="Sulevia's Gauntlets",    ring1="Enlivened Ring",     ring2="Chirich Ring",
        back=gear.pldJSEback,       waist="Pya'ekue Belt",          legs=gear.odysseanAccLegs,  feet=gear.acroAccLegs
    }
    
    sets.engaged.with_buff = {}
    sets.engaged.with_buff['doom'] = {ring1="Saida Ring", ring2="Saida Ring", legs="Shabti Cuisses"}
    sets.engaged.with_buff['reive mark'] = {neck="Ygnas's Resolve +1"}
    
    sets.engaged.TankP = {                                                                          ammo="Angha Gem",
        head="Sulevia's Mask",          neck="Twilight Torque",         ear1="Bladeborn Earring",   ear2="Steelflash Earring",
        body="Reverence Surcoat +1",    hands="Sulevia's Gauntlets",    ring1="Defending Ring",     ring2="Chirich Ring",
        back=gear.pldJSEback,           waist="Pya'ekue Belt",          legs=gear.odysseanAccLegs,  feet=gear.cizinPDTfeet
    }
    sets.engaged.TankP.MediumAcc = {}
    sets.engaged.TankP.HighAcc = {}
    
    sets.engaged.TankM = {                                                                          ammo="Hasty Pinion +1",
        head="Sulevia's Mask",          neck="Twilight Torque",         ear1="Merman's Earring",    ear2="Merman's Earring",
        body="Reverence Surcoat +1",    hands="Sulevia's Gauntlets",    ring1="Defending Ring",     ring2="Chirich Ring",
        back=gear.pldJSEback,           waist="Pya'ekue Belt",          legs=gear.odysseanAccLegs,  feet="Caballarius Leggings +1"
    }
    sets.engaged.TankM.MediumAcc = {}
    sets.engaged.TankM.HighAcc = {}
    
    sets.engaged.TankMix = {                                                                        ammo="Hasty Pinion +1",
        head="Sulevia's Mask",          neck="Twilight Torque",         ear1="Steelflash Earring",  ear2="Bladeborn Earring",
        body="Caballarius Surcoat +1",  hands="Sulevia's Gauntlets",    ring1="Defending Ring",     ring2="Chirich Ring",
        back=gear.pldJSEback,           waist="Pya'ekue Belt",          legs="Sulevia's Cuisses",   feet="Caballarius Leggings +1"
    }
    sets.engaged.TankMix.MediumAcc = {}
    sets.engaged.TankMix.HighAcc = {}
    
    sets.buffs.doom = {ring1="Saida Ring", ring2="Saida Ring", legs="Shabti Cuisses"}
    sets.buffs.Cover = {head="Reverence Coronet +1", body="Caballarius Surcoat +1"}
end