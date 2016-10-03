--------------------------------------------------------------------------------
--[[
    Author: Ragnarok.Lorand
--]]
--------------------------------------------------------------------------------

include('organizer-lib')

function init_gear_sets()
    --============================================================
    --          Precast sets
    --============================================================
    sets.precast.JA['Provoke'] = {    legs="Hesychast's Hose +1"}
    

    sets.precast.Waltz = {}
    sets.precast.Waltz['Healing Waltz'] = {}

    sets.precast.Step = {}
    
    --============================================================
    
    -- Fast cast sets for spells
    sets.precast.FC = {}
    sets.precast.FC.Utsusemi = {}
    
    --============================================================
    
    sets.wsBase = {}
    sets.wsBase.MediumAcc = {}
    sets.wsBase.HighAcc = {}

    sets.wsBase.Magic = {}
    
    --============================================================
    --          Midcast sets
    --============================================================
    
    sets.midcast.FastRecast = {}

    --============================================================
    --          Other sets
    --============================================================
    
    sets.buffs['doom'] = {}
    
    sets.idle = {
    }
    sets.idle.with_buff = {}
    sets.idle.with_buff['doom'] = {}
    sets.idle.with_buff['reive mark'] = {}
    
    sets.resting = {}
    
    sets.defense.DT = {
    }
    sets.defense.PDT = combineSets(sets.defense.DT, {
    })
    sets.defense.MDT = combineSets(sets.defense.DT, {
    })
    
    sets.defense.HP = sets.defense.PDT

    --============================================================
    
    sets.weapons.Main = {main={"Brass Axe", "Bone Axe"}, sub="Chocobo Shield +1"}
    
    sets.engaged = {
    }
    
    sets.engaged.MediumAcc = {
    }
    
    sets.engaged.HighAcc = {
    }
    
    sets.engaged.Tank = {
    }
    
    sets.engaged.Tank.MediumAcc = {
    }
    
    sets.engaged.Tank.HighAcc = {
    }
    sets.engaged.with_buff = {}
    sets.engaged.with_buff['doom'] = {}
    sets.engaged.with_buff['reive mark'] = {}
end