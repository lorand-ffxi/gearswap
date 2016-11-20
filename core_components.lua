--==============================================================================
--[[
    Author: Ragnarok.Lorand
    GearSwap core components
--]]
--==============================================================================

function init()
    lor_gs_versions.core_components = '2016-11-20.0'
    show_debug = false
    
    require('lor/lor_utils')
    if not _libs.lor then
        gearswap._G.windower.add_to_chat(39, gearswap._G.windower.to_shift_jis('[ERROR] Required: https://github.com/lorand-ffxi/lor_libs'))
    end
    _libs.lor.req('all', {n='strings',v='2016.08.07'}, {n='argparse',v='2016.09.24'})
    _libs.req('lists', 'sets')
    _libs.req('chat/chars')         --Required for using special characters in delayed messages
    _libs.req('slips')              --Required for notifying which items need to be fetched from the porter moogle
    _libs.req('files')              --Required for loading external files without using require()
    extdata = require('extdata')
    res = res or gearswap.res
    
    Assert = require('assertion')   --Assertion functions
    
    include('packet_handling')                                      --Required for haste tier detection
    include('utility_functions')                                    --Load utility_functions.lua (defines misc functions)
    winraw = gearswap._G.windower                                   --Required for direct access to windower functions
    winraw.register_event('incoming chunk', handle_incoming_chunk)  --Gearswap's overridden version causes errors
    windower.register_event('incoming text', parse_inc_text)        --Need overridden version for reloading
    windower.register_event('outgoing text', parse_out_text)        --Need overridden version for reloading
    
    include('defaults')         --Load defaults.lua
    define_defaults()           --Define some default sets & set up variable modes
    
    include('set_operations')   --Load set_operations.lua (advanced set combination functions)
    include('spell_utilities')  --Load spell_utilities.lua (cure & timer handling)
    include('pet_utilities')    --Load pet_utilities.lua (pet handling)
    include('mappings')         --Load mappings.lua (provides generalizations for spells and abilities)
    include('exporter')         --Load exporter.lua (provides better implementation of gear exporting)
    include('gear_inspection')
    
    trusts = populateTrustList()
    load_auto_defense()
    
    load_user_settings()        --Attempt to load user settings
    if use_user_settings then
        use_user_settings()     --Use the loaded settings
    else
        echo('WARNING: settings_'..player.name..'.lua not found.')
    end
    
    -- Load gear from a job-specific file
    if load_user_gear(player.main_job) then
        if init_gear_sets then init_gear_sets() end --Run the primary function defined in each job-specific lua
        setops.init()                               --Improves processing speed while running
    end
    
    lor.G.collectgarbage()
end

init()  --Execute init()

--==============================================================================
--          Spell / Ability Handling
--==============================================================================

function isBusy()
    local now = os.clock()
    actionEnd = actionEnd or now
    actionStart = actionStart or now
    local busy = (actionEnd < actionStart)
    if busy then
        local lastActionStart = cache('lastActionStart')
        local busyCheckCount = cache('busyCheckCount')
        if (lastActionStart ~= nil) and (lastActionStart == actionStart)then
            if (busyCheckCount ~= nil) and (busyCheckCount > 3) or ((now - actionStart) > 10) then
                return false
            else
                cache('busyCheckCount', busyCheckCount + 1)
            end
        else
            cache('lastActionStart', actionStart)
            cache('busyCheckCount', 0)
        end 
    end
    return busy
end

--[[
    Called when an action has been flagged as not possible to perform.
--]]
function filtered_action(spell)
    local tname = (spell.target.type == 'MONSTER') and '<t>' or spell.target.name
    if (spell.type == 'WhiteMagic') and gearswap.addendum_white[spell.id] and (not buff_active('Addendum: White')) then
        cancel_spell()
        if stratagems_available() then
            windower.send_command('gs c scholar light; wait 1.75; input /ma "'..spell.en..'" '..tname)
        else
            atc(122, "Cancelled "..spell.en..".  Addendum: White is required, but there are no available stratagems.")
        end
    elseif (spell.type == 'BlackMagic') and gearswap.addendum_black[spell.id] and (not buff_active('Addendum: Black'))then
        cancel_spell()
        if stratagems_available() then
            windower.send_command('gs c scholar dark; wait 1.75; input /ma "'..spell.en..'" '..tname)
        else
            atc(122, "Cancelled "..spell.en..".  Addendum: Black is required, but there are no available stratagems.")
        end
    else
        if (spell.type == 'JobAbility') then
            local jas = S(windower.ffxi.get_abilities().job_abilities)
            if not jas:contains(spell.id) then
                cancel_spell()
                atc(122, 'Cancelled '..spell.en..' because you do not currently have access to it.')
            end
        else
            atc(166, '[Unhandled] Unable to perform filtered action: '..spell.english)
            --pprint(spell,spell.en)
        end
    end
end

--[[
    Called when GearSwap intercepts the original text input, but before the
    game has done any processing on it. In particular, it hasn't initiated
    target selection for <st*> target types.
--]]
function pretarget(spell)
    if (spell.target == nil) then return end
    
    if trusts:contains(spell.target.name) then
        local targ = get_ally_info(spell.target.name)
        if (targ ~= nil) then
            change_target(tostring(targ.mob.id))
        end
    end

    if S{'PLAYER', 'SELF'}:contains(spell.target.type) and debuff_to_na[spell.en] then
        local tname = spell.target.name
        if (spell.target.name == player.name) then
            local ptarg = windower.ffxi.get_mob_by_target()
            if (ptarg ~= nil) and (ptarg.name ~= player.name) and (ptarg.in_alliance or not ptarg.is_npc) then
                tname = '<t>'
            end
        end
        windower.send_command('input /ma "'..debuff_to_na[spell.en]..'" '..tname)
    elseif (spell.en == 'Phalanx') and (spell.target.type == 'PLAYER') and (spell.target.type ~= 'SELF') then
        windower.send_command('input /ma "Phalanx II" '..spell.target.name)
    elseif (spell.type == 'CorsairRoll') and buff_active(spell.en) then
        windower.send_command('input /ja "Double-Up" <me>')
    else
        return
    end
    cancel_spell()
end

function shouldCancel(spell, giveReason)
    local cancel = false
    local reason = ''
    if modify_spell(spell) then
        reason = 'modify_spell(spell)'
        cancel = true
    elseif modify_cure(spell) then
        reason = 'modify_cure(spell)'
        cancel = true
    elseif not_possible_to_use(spell) then
        reason = 'not_possible_to_use(spell)'
        cancel = true
    end
    
    if giveReason then
        atc(123,reason)
    end
    return cancel
end

--[[
    Called after the text command has been processed (and target selected),
    but before the packet gets pushed out.  Equip any gear that should be
    on before the spell or ability is used.
--]]
function precast(spell)
    --printTiered(gearswap.command_registry)
    
    if (spell.type == 'Trust') then
        return
    elseif shouldCancel(spell, false) then
        cancel_spell()
        return
    end
    
    if (cache('du time') == -1) then
        cache('last cor roll', nil)
    end
    
    local notOverwritable = S{'Stoneskin', 'Sneak', 'Spectral Jig'}
    if notOverwritable:contains(spell.en) and (spell.target.name == player.name) then
        if (spell.en == 'Spectral Jig') then
            windower.send_command('cancel Sneak')
        else
            windower.send_command('wait 0.5; cancel '..spell.en)
        end
    end
    
    --Perform checks prior to execution of the command
    if (player.main_job == 'BRD') and (spell.type == 'BardSong') then
        atc(122, 'Casting '..spell.en..' in mode: '..modes.Daurdabla)
        -- Auto-Pianissimo
        if (spell.target.type == 'PLAYER') and (not spell.target.charmed) and (not buff_active('Pianissimo')) then
            cancel_spell()
            windower.send_command('input /ja "Pianissimo" <me>; wait 1.25; input /ma "'..spell.en..'" '..spell.target.name)
            return
        end
    elseif S{'RNG','COR'}:contains(player.main_job) then
        local check_ammo        --Choose which ammo should be verified
        if (spell.type == 'WeaponSkill') and bow_gun_weaponskills:contains(spell.en) then
            local weaps = sets.weapons[modes.weapon]
            check_ammo = weaps.ammo2 or weaps.ammo
        elseif (spell.action_type == 'Ranged Attack') then
            check_ammo = sets.weapons[modes.weapon].ammo
        end
        
        if check_ammo then      --Verify that ammunition is available
            if type(check_ammo) == 'table' then
                check_ammo = check_ammo.name
            end
            local itable = player.inventory[check_ammo] or player.wardrobe[check_ammo]
            if (itable == nil) then
                atcfs(39, 'Unable to find ammo for that action: %s', tostring(check_ammo))
                cancel_spell()
                return
            end
            if (itable.count <= options.ammo_warning_limit) and (itable.count > 1) and (not state.warned) then
                local ammo_warning = '*****  LOW AMMO WARNING: %s  *****':format(check_ammo)
                local ammo_bars = '*':rep(#ammo_warning)
                atc(39, ammo_bars)
                atc(39, ammo_warning)
                atc(39, ammo_bars)
                state.warned = true
            elseif (itable.count > options.ammo_warning_limit) and state.warned then
                state.warned = false
            end
        end
    end
    
    if weapSwapJobs:contains(player.main_job) then
        if noWeapSwapSets:contains(modes.offense) then
            disable('main', 'sub')  --Prevent weapon switching for mages when in melee mode
        else
            enable('main', 'sub')   --Allow weapon switching for mages
        end
    end
    
    if (spell.type == 'CorsairRoll') or (spell.en == 'Double-Up') then
        if (spell.type == 'CorsairRoll') then
            cache('last cor roll', spell.en)
        end
        local now = os.clock()
        local du_gain = cache('du time')
        du_gain = (du_gain ~= nil) and du_gain or (now + 1)
        if (spell.en == 'Double-Up') then
            if (du_gain == -1) then
                atc(123,'There are no rolls eligible for Double-Up at this time.')
                cancel_spell()
                return
            end
        end
        
        local last_roll = cache('last cor roll')
        local rinfo = roll_info[last_roll]
        if (rinfo ~= nil) then
            local rname = last_roll..': '
            local lucky = '[Lucky: %s] ':format(rinfo.lucky)
            local unlucky = '[Unlucky: %s] ':format(rinfo.unlucky)
            local desc = rinfo.effect
            local dutime = 45 - (now - du_gain)
            dutime = (dutime < 0) and 0 or dutime
            local dumsg = ' | Double-Up time remaining: %ss':format(roundf(dutime))
            atc(1, rname:colorize(261)..lucky:colorize(339)..unlucky:colorize(349)..desc:colorize(261)..dumsg:colorize(128))
        else
            atcfs(123, 'Error: No roll info stored for %s', spell.en)
        end
    end

    if (spell.skill == 36) and (spell.cast_time < 1) then
        equip(get_midcast_set(spell))   --Use midcast gear for elemental spells with low cast times
    else
        equip(get_precast_set(spell))
    end
end

--[[
    Builds midcast set immediately after precast() call.
    Both sets are sent simultaneously; the packet contains precastgear:action:midcastgear.
    It should take effect regardless of the spell cast speed.
--]]
function midcast(spell)
    if (spell.type == 'Trust') then
        return
    elseif (spell.en == 'Utsusemi: Ichi') and (not spell.interrupted) then
        windower.send_command('wait 2; cancel 66; cancel 446')
    elseif (spell.type == 'CorsairRoll') then
        cache('last cor roll', spell.en)
        cache('du time', os.clock())
    end
    equip(get_midcast_set(spell))
end

--[[
    Called upon action completion (i.e., casting finished, ws landed, casting interrupted, etc)
--]]
function aftercast(spell)
    if modes.noIdle then
        atc(104, 'WARNING: Did not equip idle set (modes.noIdle is ON)')
        return
    elseif (spell.en == 'Unknown Interrupt') then
        return
    elseif spell.interrupted then
        -- Delay update so aftercast equip will actually be worn.
        windower.send_command('wait 0.6;gs c update')
    else
        local spellMap = spell_maps[spell.en]
        initSleepTimer(spell, spellMap) --Does nothing if not a sleep spell
        if (player.main_job == 'BLM') and (spell.en == 'Mana Wall') then
            if (player.equipment.feet == 'Goetia Sabots +2') then
                disable('feet')
            end
        elseif (player.main_job == 'BRD') and (spell.type == 'BardSong') then
            if spell.target and (spell.target.type:upper() == 'SELF') then
                adjust_Timers(spell, spellMap)
            end
        end
        equip(get_gear_for_status(player.status))
    end
end

--==============================================================================
--          Event Reactions
--==============================================================================

--[[
    Called when the player's status changes.
    (Idle / Engaged / Dead / Engaged dead / Event / Chocobo / Resting / 
    Locked / Crafting / Sitting / Kneeling / Fishing*)
--]]
function status_change(new, old)
    update()
    
    if new == 'Engaged' then
        if (player.main_job == 'PUP') and modes.autoDeploy then
            if get_pet_type() ~= nil then
                windower.send_command('input /pet Deploy <t>')
            end
        end
    end
end

--[[
    Called when the player gains or loses a buff.
--]]
function buff_change(buff, gain)
    if sets.buffs[buff] ~= nil then
        if gain then
            equip(sets.buffs[buff])
            for slot,_ in pairs(sets.buffs[buff]) do
                disable(slot)
            end
        else
            for slot,_ in pairs(sets.buffs[buff]) do
                enable(slot)
            end
        end
    end
    
    if (buff:lower() == 'march') and (not gain) then            --March wore off
        buffs = buffs and buffs or {}
        if (buffactive['march'] ~= nil) then                --There's still an active March
            if (buffs.March1 ~= nil) and (buffs.March2 ~= nil) then --Both Marches were active
                if (buffs.March1 < buffs.March2) then       --March1 was cast before March2
                    buffs.March1 = nil          --March1 wore off
                else                        --March2 was cast before March1
                    buffs.March2 = nil          --March2 wore off
                end
            elseif (buffs.March1 ~= nil) then           --March1 was active
                buffs.March1 = nil              --March1 wore off
            else                            --March2 was active
                buffs.March2 = nil              --March2 wore off
            end
        else                                --There are no active March buffs
            buffs.March1 = nil                  --March1 wore off
            buffs.March2 = nil                  --March2 wore off
        end
    elseif (buff:lower() == 'sleep') and gain and buff_active('Stoneskin') then
        --TODO: Account for active DoT spells on self
        if buff_active('Sublimation: Activated') then
            windower.send_command('cancel stoneskin')
        end
    elseif (player.main_job == 'BLM') and (buff == 'Mana Wall') and (not gain) then
        enable('feet')      -- Unlock feet when Mana Wall buff is lost.
        equip(get_gear_for_status(player.status))
    elseif buff == 'Sublimation: Complete' and gain then
        atc(204, 'Sublimation is done charging!')
    elseif (buff:lower() == 'double-up chance') then
        if not gain then
            cache('du time', -1)
        end
    end
    
    if (buff:lower() == 'weakness') then
        if gain then    send_command('timers create "Weakness" 300 up abilities/00255.png')
        else        send_command('timers delete "Weakness"')
        end
    elseif (S{'haste','march','sublimation: activated'}:contains(buff:lower())) then
        if (not midaction()) and (not modes.noIdle) then
            update()
        end
    end
end

--[[
    Called when the player's main job changes.
--]]
function main_job_change(new, old)
    use_user_settings()
end

--[[
    Called when the player's sub job changes.
--]]
function sub_job_change(new, old)
    use_user_settings()
end

--------------------------------------------------------------------------------
--  Gear set building functions
--------------------------------------------------------------------------------

function get_sub_type()
    return (player.sub_job == 'SAM') and 'sam' or 'other'
end

--[[
    Assembles the precast set for the given spell/ability.
--]]
function get_precast_set(spell)
    local precastSet = {}
    local status = player.status:lower()
    local spellMap = spell_maps[spell.en]
    
    if spell.action_type == 'Magic' then
        precastSet = combineSets(precastSet, sets.precast.FC)
        precastSet = combineSets(precastSet, sets.precast.FC, spell.type)
        precastSet = combineSets(precastSet, sets.precast.FC, spell.skill:stripchars(' '))
        precastSet = combineSets(precastSet, sets.precast.FC, spell.element)
        precastSet = combineSets(precastSet, sets.precast.FC, spellMap)
        precastSet = combineSets(precastSet, sets.precast.FC, spell.en)
        precastSet = combineSets(precastSet, sets.precast.FC, modes.casting)
        precastSet = combineSets(precastSet, sets.precast.FC, status)
    elseif spell.action_type == 'Ranged Attack' then
        --Equip snapshot gear & TP ammo
        precastSet = combineSets(precastSet, sets.precast.ranged)
        if S{'RNG','COR'}:contains(player.main_job) then
            precastSet = combineSets(precastSet, {ammo=sets.weapons[modes.weapon].ammo})
        end
    elseif spell.action_type == 'Ability' then
        if (spell.type == 'CorsairRoll') or (spell.en == 'Double-Up') then
            precastSet = combineSets(precastSet, sets.precast.CorsairRoll)
            precastSet = combineSets(precastSet, sets.precast.CorsairRoll, cache('last cor roll'))
        elseif spell.type == 'CorsairShot' then
            precastSet = combineSets(precastSet, sets.precast.CorsairShot)
            if not S{'Light Shot','Dark Shot'}:contains(spell.en) then
                precastSet = combineSets(precastSet, sets.precast.CorsairShot, 'MAB')
            end
            if weatherPermits(spell.element)then        
                precastSet = combineSets(precastSet, {waist=setops.getObi(spell.element)})
            end
            precastSet = combineSets(precastSet, sets.precast.CorsairShot, spell.en)
        elseif spell.type == 'JobAbility' then
            precastSet = combineSets(precastSet, sets.precast.JA, spellMap)
            precastSet = combineSets(precastSet, sets.precast.JA, spell.en)
        elseif spell.type == 'WeaponSkill' then
            --sets.wsBase[sam/other][modes.offense][state.RangedMode][wsmod[spell.english]]
            if S{'RNG'}:contains(player.main_job) then
                precastSet = combineSets(precastSet, sets[modes.offense])
                precastSet = combineSets(precastSet, sets[modes.offense], get_sub_type())
                precastSet = combineSets(precastSet, sets[modes.offense], get_sub_type(), modes.ranged)
                precastSet = combineSets(precastSet, sets[modes.offense], get_sub_type(), modes.ranged, 'ws')
                
                local weaps = sets.weapons[modes.weapon]
                local ws_ammo = weaps.ammo2 or weaps.ammo
                precastSet = combineSets(precastSet, {ammo=ws_ammo})
                
                local wsSet = sets.wsBase
                wsSet = combineSets(wsSet, sets.wsBase, wsmod[spell.en])
                wsSet = combineSets(wsSet, sets.wsBase, wsmod[spell.en], spell.en)
                wsSet = combineSets(wsSet, setops.get_ftp_set(spell))
                
                precastSet = combineSets(precastSet, wsSet)
            else
                if (elemental_weaponskills[spell.english] ~= nil) then
                    precastSet = sets.wsBase.Magic
                    if weatherPermits(spell.element) and options.useObi then
                        precastSet = combineSets(precastSet, {waist=setops.getObi(spell.element)})
                    end
                else
                    precastSet = sets.wsBase
                end
                                
                local time_set = 'daytime'
                if (world.time >= (18*60) or world.time <= (6*60)) then
                    time_set = 'nighttime'
                end
                precastSet = combineSets(precastSet, sets.wsBase, time_set)
                precastSet = combineSets(precastSet, sets.wsBase, get_sub_type())
                precastSet = combineSets(precastSet, sets.wsBase, get_sub_type(), time_set)
                precastSet = combineSets(precastSet, sets.wsBase, get_sub_type(), modes.offense)
                precastSet = combineSets(precastSet, sets.wsBase, get_sub_type(), modes.offense, time_set)
                precastSet = combineSets(precastSet, sets.wsBase, get_sub_type(), modes.offense, wsmod[spell.en])
                precastSet = combineSets(precastSet, sets.wsBase, get_sub_type(), modes.offense, wsmod[spell.en], time_set)
                precastSet = combineSets(precastSet, sets.wsBase, get_sub_type(), modes.offense, wsmod[spell.en], spell.en)
                precastSet = combineSets(precastSet, sets.wsBase, get_sub_type(), modes.offense, wsmod[spell.en], spell.en, time_set)
                precastSet = combineSets(precastSet, setops.get_ftp_set(spell))
                
                for buff,_ in pairs(buffactive) do
                    precastSet = combineSets(precastSet, sets.ws, 'with_buff', buff)
                end
            end
        else
            -- All other ability types, such as Waltz, Jig, Scholar, etc.
            -- These may use the generic type, or be refined for the individual action, either by name or by spell map.
            precastSet = combineSets(precastSet, sets.precast, spell.type)
            precastSet = combineSets(precastSet, sets.precast, spell.type, spellMap)
            precastSet = combineSets(precastSet, sets.precast, spellMap)
            precastSet = combineSets(precastSet, sets.precast, spell.type, spell.en)
            precastSet = combineSets(precastSet, sets.precast, spell.en)
        end
    end
    
    if (player.main_job == 'SCH') then
        if matchesGrimoire(spell) then
            precastSet = combineSets(precastSet, sets.precast.FC.Grimoire)      --FastCast/Haste +8%
        end
        if buff_active('Celerity','Alacrity') then
            if buff_active(elements.storm_of[spell.element]) or (spell.element == world.weather_element) then
                precastSet = combineSets(precastSet, sets.precast.FC.Weather)   --FastCast/Haste +15%
            end
        end
    elseif (player.main_job == 'THF') and (modes.treasure == 'TH') then
        precastSet = combineSets(precastSet, sets.TreasureHunter)
    end

    if (spell.en == 'Impact') then
        precastSet = combineSets(precastSet, {body='Twilight Cloak'})
        precastSet.head = nil
    end
    return precastSet
end

function get_standard_magic_set(baseSet, spell, spellMap, spellType)
    local castSet = {}
    castSet = combineSets(castSet, baseSet)
    castSet = combineSets(castSet, sets.midcast.MagicAccuracy)
    castSet = combineSets(castSet, sets.midcast, spellType)
    castSet = combineSets(castSet, sets.midcast, spellType, modes.casting)
    castSet = combineSets(castSet, sets.midcast, spellType, getGrimoire())
    castSet = combineSets(castSet, sets.midcast, spellType, getGrimoire(), modes.casting)
    castSet = combineSets(castSet, sets.midcast, spellType, spellMap)
    castSet = combineSets(castSet, sets.midcast, spellType, spellMap, modes.casting)
    castSet = combineSets(castSet, sets.midcast, spellType, spell.en)
    castSet = combineSets(castSet, sets.midcast, spellType, spell.en, modes.casting)
    castSet = combineSets(castSet, sets.midcast, spellMap)
    castSet = combineSets(castSet, sets.midcast, spellMap, modes.casting)
    castSet = combineSets(castSet, sets.midcast, spell.en)
    castSet = combineSets(castSet, sets.midcast, spell.en, modes.casting)
    return castSet
end

--[[
    Assembles the midcast set for the given spell/ability.
--]]
function get_midcast_set(spell)
    --pprint_tiered(spell)

    local midcastSet = {}               --Initialize the set that will be built
    local status = player.status:lower()        --Player's status (Idle/Engaged/etc)
    local targType = spell.target.type:lower()  --Target type (self/player/etc)
    local spellMap = spell_maps[spell.en]       --Generalized spell name (ex: Cure for Cure IV)
    
    if spell.action_type == 'Magic' then
        midcastSet = combineSets(midcastSet, sets.midcast.FastRecast)   --Base layer for all sets; reduce recast
        
        if spell.type == 'BardSong' and player.main_job == 'BRD' then
            local isBuff = not spell.targets:contains('Enemy')
            
            local activeInstrument = gear.instruments.default       --Set active inst. to default
            if isBuff and S{'Dummy','Daurdabla'}:contains(modes.Daurdabla) then
                activeInstrument = gear.instruments.multiSong       --Set active inst. to multiSong
            else
                local instr = gear.instruments[spellMap]
                if (instr ~= nil) and setops.isAvailable(instr) then    --Check for proper instrument
                    activeInstrument = instr            --Set active inst. if available
                end
            end
            
            if isBuff and (modes.Daurdabla == 'Dummy') then     --No duration/potency+ for dummy songs
                midcastSet = combineSets(midcastSet, sets.midcast.SongRecast)
            else
                local instrumentSkill = get_instrument_type(activeInstrument)           --Fetch instrument type for activeInstrument
                if isBuff then
                    midcastSet = combineSets(midcastSet, sets.midcast.Singing)      --Layer on base singing gear
                    midcastSet = combineSets(midcastSet, sets.midcast, instrumentSkill) --Layer on gear based on skill of instrument
                else
                    midcastSet = combineSets(midcastSet, sets.midcast.MagicAccuracy)    --Layer on magic accuracy gear
                end
                
                if not S{'Finale'}:contains(spellMap) then      --Keep magic accuracy gear on for Finale
                    local songType = isBuff and 'SongBuff' or 'SongDebuff'
                    midcastSet = combineSets(midcastSet, sets.midcast, songType)
                    midcastSet = combineSets(midcastSet, sets.midcast, songType, modes.casting)                 
                    if buff_active('Troubadour') then       --No acc necessary when active
                        midcastSet = combineSets(midcastSet, sets.midcast.SongDuration)
                    end
                end
                midcastSet = combineSets(midcastSet, sets.midcast, spellMap)            --Layer on song-specific gear
                midcastSet = combineSets(midcastSet, sets.midcast, spellMap, modes.casting)
            end
            midcastSet = combineSets(midcastSet, {range=activeInstrument})  --Layer on active instrument
            modes.Daurdabla = 'None'    --Disables Daurdabla mode after casting a song with it on
        elseif spell.skill == 'Dark Magic' then
            midcastSet = get_standard_magic_set(midcastSet, spell, spellMap, 'DarkMagic')
        elseif spell.skill == 'Healing Magic' then
            midcastSet = get_standard_magic_set(midcastSet, spell, spellMap, 'HealingMagic')
            midcastSet = combineSets(midcastSet, sets.midcast.spellMap, status)
            midcastSet = combineSets(midcastSet, sets.midcast.spellMap, targType)
            if (spellMap == 'Cure') then
                if weatherPermits(spell.element)then            
                    midcastSet = combineSets(midcastSet, {waist=setops.getObi(spell.element)})
                end
                for buff,_ in pairs(buffactive) do
                    midcastSet = combineSets(midcastSet, sets.midcast.Cure, 'with_buff', buff)
                end
            end
        elseif spell.skill == 'Divine Magic' then
            midcastSet = get_standard_magic_set(midcastSet, spell, spellMap, 'DivineMagic')
            if S{'Banish', 'Holy'}:contains(spellMap) then
                midcastSet = combineSets(midcastSet, sets.midcast.DivineMagic.Nuke)
                if weatherPermits(spell.element) and options.useObi then
                    midcastSet = combineSets(midcastSet, {waist=setops.getObi(spell.element)})
                end
                for buff,_ in pairs(buffactive) do
                    midcastSet = combineSets(midcastSet, sets.midcast.DivineMagic, 'with_buff', buff)
                end
            end
            midcastSet = combineSets(midcastSet, sets.midcast.DivineMagic, modes.casting)
        elseif spell.skill == 'Elemental Magic' then
            midcastSet = get_standard_magic_set(midcastSet, spell, spellMap, 'ElementalMagic')
            if low_tier_nukes:contains(spell.en) then
                midcastSet = combineSets(midcastSet, sets.midcast.ElementalMagic, 'LowTier')
            else
                midcastSet = combineSets(midcastSet, sets.midcast.ElementalMagic, 'HighTier')
            end
            
            if weatherPermits(spell.element) then
                if not any_eq(spellMap, 'Helix', 'Helix2') and options.useObi then
                    midcastSet = combineSets(midcastSet, {waist=setops.getObi(spell.element)})
                end
                if options.useTwilightCape then
                    midcastSet = combineSets(midcastSet, {back='Twilight Cape'})
                end
                if buff_active('Klimaform') and (player.main_job == 'SCH') then
                    midcastSet = combineSets(midcastSet, {feet=gear.KlimaformFeet})
                end
            end
            midcastSet = combineSets(midcastSet, sets.midcast.ElementalMagic, spell.element)
            midcastSet = combineSets(midcastSet, sets.midcast.ElementalMagic, modes.casting)
            
            for buff,_ in pairs(buffactive) do
                midcastSet = combineSets(midcastSet, sets.midcast.ElementalMagic, 'with_buff', buff)
            end
        elseif spell.skill == 'Enfeebling Magic' then
            midcastSet = get_standard_magic_set(midcastSet, spell, spellMap, 'EnfeeblingMagic')
        
            --If the spell has variable potency, equip gear that enhances potency
            if var_potency_enfeebs[spell.english] and sets.midcast.EnfeeblingMagic then
                midcastSet = combineSets(midcastSet, sets.midcast.EnfeeblingMagic, 'Potency')
                midcastSet = combineSets(midcastSet, sets.midcast.EnfeeblingMagic, 'Potency', modes.casting)
                midcastSet = combineSets(midcastSet, sets.midcast.EnfeeblingMagic, 'Potency', spell.en, modes.casting)
            end
            if (player.main_job == 'RDM') and buff_active('Saboteur') then
                midcastSet = combineSets(midcastSet, sets.precast.JA, 'Saboteur')
            end
            midcastSet = combineSets(midcastSet, sets.midcast.EnfeeblingMagic, modes.casting)
        elseif spell.skill == 'Enhancing Magic' then
            midcastSet = combineSets(midcastSet, sets.midcast.EnhancingMagic)
            midcastSet = combineSets(midcastSet, sets.midcast.EnhancingMagic, getGrimoire())
            midcastSet = combineSets(midcastSet, sets.midcast.EnhancingMagic.Duration)
            midcastSet = combineSets(midcastSet, sets.midcast.EnhancingMagic, spellMap)
            midcastSet = combineSets(midcastSet, sets.midcast.EnhancingMagic, spell.en)
            midcastSet = combineSets(midcastSet, sets.midcast, spellMap)
            midcastSet = combineSets(midcastSet, sets.midcast, spell.en)
            
            for buff,_ in pairs(buffactive) do
                midcastSet = combineSets(midcastSet, sets.midcast.EnhancingMagic, 'with_buff', buff)
            end
            if buff_active('Composure') and spell.target.type ~= 'SELF' then
                midcastSet = combineSets(midcastSet, sets.midcast.EnhancingMagic.Duration.ComposureOther)
                if spell.en == 'Phalanx II' then
                    midcastSet = combineSets(midcastSet, sets.midcast, spell.en)
                end
            end         
        elseif spell.skill == 'Blue Magic' then
            local bluType = S{-1,15,'None','Physical'}:contains(spell.element) and 'Physical' or 'Magic'
            --local bluType = (spell.element == -1) and 'Physical' or 'Magic'
            if blu_magic_types:contains(blu_typemap[spell.en]) then
                bluType = 'Magic'
            end
            if bluType == 'Magic' then
                if (blu_typemap[spell.en] == 'Buff') then
                    midcastSet = combineSets(midcastSet, sets.midcast.FastRecast)
                    midcastSet = combineSets(midcastSet, sets.midcast.BlueMagic)    --Buff caught by typemap below
                elseif (blu_typemap[spell.en] == 'Heal') then
                    midcastSet = combineSets(midcastSet, sets.midcast.Cure)
                    for buff,_ in pairs(buffactive) do
                        midcastSet = combineSets(midcastSet, sets.midcast.Cure, 'with_buff', buff)
                    end
                elseif (blu_typemap[spell.en] == 'Enfeeb') then
                    midcastSet = combineSets(midcastSet, sets.midcast.MagicAccuracy)
                    midcastSet = combineSets(midcastSet, sets.midcast.BlueMagic)
                else
                    midcastSet = combineSets(midcastSet, sets.midcast.MagicAccuracy)
                    midcastSet = combineSets(midcastSet, sets.midcast.BlueMagic)
                    midcastSet = combineSets(midcastSet, sets.midcast.BlueMagic.Magic)
                    midcastSet = combineSets(midcastSet, sets.midcast.BlueMagic.Magic, spell.element)
                    for buff,_ in pairs(buffactive) do
                        midcastSet = combineSets(midcastSet, sets.midcast.BlueMagic.Magic, 'with_buff', buff)
                    end
                end
            elseif bluType == 'Physical' then
                midcastSet = combineSets(midcastSet, sets.midcast.BlueMagic)
                midcastSet = combineSets(midcastSet, sets.midcast.BlueMagic.Physical)
                midcastSet = combineSets(midcastSet, sets.midcast.BlueMagic.Physical[blu_statmap[spell.en]])
                midcastSet = combineSets(midcastSet, sets.midcast.BlueMagic.Physical, modes.accuracy)
                for buff,_ in pairs(buffactive) do
                    midcastSet = combineSets(midcastSet, sets.midcast.BlueMagic.Physical, 'with_buff', buff)
                end
            end
            midcastSet = combineSets(midcastSet, sets.midcast.BlueMagic[blu_typemap[spell.en]])
            midcastSet = combineSets(midcastSet, sets.midcast.BlueMagic[spell.en])
            midcastSet = combineSets(midcastSet, sets.midcast[spell.en])
        elseif spell.skill == 'Ninjutsu' then
            if spellMap == 'Utsusemi' then
                midcastSet = combineSets(midcastSet, sets.midcast.Utsusemi)
            elseif spellMap == 'NinEnfeeb' or spellMap == 'NinNuke' then
                midcastSet = combineSets(midcastSet, sets.midcast.MagicAccuracy)
                midcastSet = combineSets(midcastSet, sets.midcast.Ninjutsu)
                if spellMap == 'NinNuke' then
                    midcastSet = combineSets(midcastSet, sets.midcast, 'Ninjutsu', 'Nuke')
                    if weatherPermits(spell.element) and options.useObi then
                        midcastSet = combineSets(midcastSet, {waist=setops.getObi(spell.element)})
                    end
                    midcastSet = combineSets(midcastSet, sets.midcast, 'Ninjutsu', 'Nuke', spell.element)
                    
                    for buff,_ in pairs(buffactive) do
                        midcastSet = combineSets(midcastSet, sets.midcast.Ninjutsu.Nuke, 'with_buff', buff)
                    end
                end
            end
        elseif spell.skill == 'Summoning Magic' then
            --Precast set is fine here
        elseif spell.skill == 'Geomancy' then
            midcastSet = combineSets(midcastSet, sets.midcast.Geomancy)
            if spell.en:startswith('Indi-') then
                midcastSet = combineSets(midcastSet, sets.midcast.Geomancy, 'Indi')
            elseif spell.en:startswith('Geo-') then
                midcastSet = combineSets(midcastSet, sets.midcast.Geomancy, 'Geo')
            else
                atc(123,'Error: Unknown Geomancy spell type')
            end
        else
            atc(122, 'Using default rule set for '..spell.english..' [skill: '..spell.skill..'][type: '..spell.type..'][action type: '..spell.action_type..']')
            midcastSet = combineSets(midcastSet, sets.midcast)
            midcastSet = combineSets(midcastSet, sets.midcast, spell.type)
            midcastSet = combineSets(midcastSet, sets.midcast, spell.skill)
            midcastSet = combineSets(midcastSet, sets.midcast, spellMap)
            midcastSet = combineSets(midcastSet, sets.midcast, spell.en)
        end
    elseif spell.action_type == 'Ranged Attack' then
        if S{'RNG'}:contains(player.main_job) then
            if buff_active('Barrage') then
                midcastSet = combineSets(midcastSet, sets.ranged.barrage)
            else
                midcastSet = combineSets(midcastSet, sets[modes.offense])
                midcastSet = combineSets(midcastSet, sets[modes.offense], get_sub_type())
                midcastSet = combineSets(midcastSet, sets[modes.offense], get_sub_type(), modes.ranged)
                midcastSet = combineSets(midcastSet, sets[modes.offense], get_sub_type(), modes.ranged, 'tp')
                midcastSet = combineSets(midcastSet, sets[modes.offense], get_sub_type(), modes.ranged, 'tp', modes.accuracy)
                midcastSet = combineSets(midcastSet, {ammo=sets.weapons[modes.weapon].ammo})
                midcastSet = combineSets(sets.tpBase, midcastSet)
            end
        elseif (player.main_job == 'COR') then
            midcastSet = combineSets(midcastSet, sets.midcast.ranged)
            midcastSet = combineSets(midcastSet, sets.midcast.ranged, get_sub_type())
            midcastSet = combineSets(midcastSet, sets.midcast.ranged, get_sub_type(), modes.ranged)
            midcastSet = combineSets(midcastSet, sets.midcast.ranged, get_sub_type(), modes.ranged, modes.accuracy)
            midcastSet = combineSets(midcastSet, {ammo=sets.weapons[modes.weapon].ammo})
        else
            midcastSet = combineSets(midcastSet, sets.midcast.ranged)
            midcastSet = combineSets(midcastSet, sets.midcast.ranged, modes.ranged)
        end
    elseif spell.action_type == 'Ability' then
        midcastSet = combineSets(midcastSet, sets.midcast, spell.type)
        midcastSet = combineSets(midcastSet, sets.midcast, spell.type, spellMap)
        midcastSet = combineSets(midcastSet, sets.midcast, spell.type, spell.en)
        midcastSet = combineSets(midcastSet, sets.midcast, spellMap)
        midcastSet = combineSets(midcastSet, sets.midcast, spell.en)
    end
    
    if (player.main_job == 'THF') and (modes.treasure == 'TH') then
        midcastSet = combineSets(midcastSet, sets.TreasureHunter)
    elseif (spell.en == 'Impact') then
        midcastSet = combineSets(midcastSet, {body='Twilight Cloak'})
        midcastSet.head = nil
    end
    return midcastSet
end

--[[
    Returns the gear set for the given status
--]]
function get_gear_for_status(status)
    if player.main_job == 'THF' then
        local thfSet = {}
        if buff_active('Sneak Attack') then
            thfSet = combineSets(thfSet, sets.precast.JA['Sneak Attack'])
        elseif buff_active('Trick Attack') then
            thfSet = combineSets(thfSet, sets.precast.JA['Trick Attack'])
        end
        if modes.treasure == 'TH' then
            thfSet = combineSets(thfSet, sets.TreasureHunter)
        end
    end
    
    -- If status not defined, treat as idle.  Asserts that HP is positive (i.e., alive)
    if (status == nil or status == '') and player.hp > 0 then
        return get_idle_set()
    elseif status == 'Idle' then
        return get_idle_set()
    elseif status == 'Engaged' then
        return get_melee_set()
    elseif status == 'Resting' then
        return get_resting_set()
    end
end

--[[
    Assembles the player's idle set with an optional baseSet.
--]]
function get_idle_set(baseSet)
    local idleSet = combineSets(baseSet, sets.idle) 
    idleSet = combineSets(idleSet, sets.idle[modes.offense])
    idleSet = combineSets(idleSet, sets.idle[modes.defense])
    
    if player.mpp < 80 then
        idleSet = combineSets(idleSet, sets.idle.lowMP)
        if (world.time >= (18*60) or world.time <= (6*60)) then
            idleSet = combineSets(idleSet, sets.idle.lowMP_night)
        else
            idleSet = combineSets(idleSet, sets.idle.lowMP_day)
        end
    end
    idleSet = combineSets(idleSet, sets.idle[modes.idle])
    
    local zone_info = windower.ffxi.get_info()
    if zone_info ~= nil then
        local zoneid = zone_info.zone
        if zoneid == 131 then
            windower.send_command('lua unload gearswap')
        elseif indoor_zones:contains(zoneid) then
            idleSet = combineSets(idleSet, sets.idle.indoors)
        end
        idleSet = combineSets(idleSet, sets.idle, 'zone', res.zones[zoneid].en)
    end
    
    if (world.time >= (17*60) or world.time <= (6*60)) then
        idleSet = combineSets(idleSet, sets.idle.night)
    else
        idleSet = combineSets(idleSet, sets.idle.day)
    end
    
    if player.main_job == 'RNG' then
        local rngSet = {}
        rngSet = combineSets(rngSet, sets[modes.offense])
        rngSet = combineSets(rngSet, sets[modes.offense], get_sub_type())
        rngSet = combineSets(rngSet, sets[modes.offense], get_sub_type(), state.RangedMode)
        idleSet = combineSets(rngSet, idleSet)
        --idleSet = combineSets(idleSet, rngSet)
    elseif player.main_job == 'THF' then
        if modes.treasure == 'TH' then
            idleSet = combineSets(idleSet, sets.TreasureHunter)
        end
    elseif pet.isvalid then
        idleSet = combineSets(idleSet, sets.idle.with_pet)
        idleSet = combineSets(idleSet, sets.idle.with_pet, get_pet_type())
        if S{player.main_job,player.sub_job}:contains('SMN') then
            idleSet = combineSets(idleSet, sets.idle.with_pet, 'perp'..tostring(get_perp_cost()))
        end
        idleSet = combineSets(idleSet, sets.idle.with_pet, pet.name)
        
        if S{player.main_job,player.sub_job}:contains('SMN') and buff_active("Avatar's Favor") then
            idleSet = combineSets(idleSet, sets.idle.with_favor)
        end
    end
    
    for buff,_ in pairs(buffactive) do
        idleSet = combineSets(idleSet, sets.idle, 'with_buff', buff)
    end
    
    if (modes.defense ~= nil) or (modes.defense ~= 'normal') then
        idleSet = combineSets(idleSet, sets.defense[modes.defense])
    end
    if modes.kite ~= nil then
        idleSet = combineSets(idleSet, sets.kite)
    end
    return idleSet
end

--[[
    Calculates the sum of active Haste effects.
    Return values:
    na  : 0%
    I   : 5% - 19%
    I+  : 20% - 28%
    II  : 29% - 35%
    II+ : 36%+
--]]
function get_haste_mod()
    buffs = buffs or {}
    --Equipment haste caps at 25% (256/1024)
    
    --Magic haste caps at 43.75% (448/1024)
    local msum = 0
    if (buffs.Refueling ~= nil) then
        msum = msum + 10
    elseif (buffactive[33] ~= nil) then
        local htier = buffs.Haste or 1  --Haste: 150/1024 = 15%
        msum = msum + (htier * 15)      --Haste II: 307/1024 = 30%
    end
    if (buffactive[580] ~= nil) then
        msum = msum + 30                --Indi/Geo-Haste: 28% + ~1%/+1 Geomancy
    end
    if (buffactive[604] ~= nil) then
        msum = msum + 15                --Mighty Guard
    end
    
    if (buff_active('March')) then
        --If a BRD doesn't have at least March+3, they REALLY suck. (+2 from sparks instrument, +1 from AF3+2 hands)
        --Each March+1 = +16/1024 haste & duration
        local marchCount = buffactive['march'] or 0
        if (marchCount > 1) then
            msum = msum + 25    --11+14 = 25%
        elseif (buffs.March2 ~= nil) then
            msum = msum + 14    --96+48/1024 = 14%
        else
            msum = msum + 11    --64+48/1024 = 11%
        end
    end
    if (buffactive[228]) then
        msum = msum + 20        --400 skill Embrava
    end
    msum = (msum < 44) and msum or 44
    
    --JA haste caps at 25% (256/1024)
    local jsum = 0
    if (buff_active('Haste Samba')) then    --5% JA haste
        if (player.main_job == 'DNC') then
            jsum = jsum + player.merits.haste_samba_effect
        end
        jsum = jsum + 5
    end
    if (buff_active('Last Resort')) and (player.main_job == 'DRK') then
        jsum = jsum + 15 + (player.merits.desperate_blows * 2)
    end
    if buff_active('Hasso') and (player.equipment.main ~= nil) then
        local weap = res.items:with('en',player.equipment.main)
        if (#(weap.slots) == 1) then
            jsum = jsum + 10
            if gear_stats.hasso_haste[player.equipment.legs] ~= nil then
                jsum = jsum + gear_stats.hasso_haste[player.equipment.legs]
            end
        end
    end
    jsum = (jsum < 25) and jsum or 25

    local hsum = msum + jsum
    if (hsum > 35) then
        return 'II+'
    elseif (hsum > 28) then
        return 'II'
    elseif (hsum > 19) then
        return 'I+'
    elseif (hsum > 4) then
        return 'I'
    else
        return 'na'
    end
end

--[[
    Assembles the player's melee set with an optional baseSet.
--]]
function get_melee_set(baseSet)
    local meleeSet = combineSets(baseSet, sets.engaged)
    meleeSet = combineSets(meleeSet, sets.engaged[modes.offense])
    meleeSet = combineSets(meleeSet, sets.engaged[modes.offense], time_set)

    local time_set = 'daytime'
    if (world.time >= (18*60) or world.time <= (6*60)) then
        time_set = 'nighttime'
    end
    
    if (S{'auto','auto_acc'}:contains(modes.offense)) then
        local haste_mod = get_haste_mod()
        meleeSet = combineSets(meleeSet, sets.engaged[modes.offense], modes.accuracy)
        meleeSet = combineSets(meleeSet, sets.engaged[modes.offense], modes.accuracy, time_set)
        meleeSet = combineSets(meleeSet, sets.engaged[modes.offense], haste_mod)
        meleeSet = combineSets(meleeSet, sets.engaged[modes.offense], haste_mod, time_set)
    else
        meleeSet = combineSets(meleeSet, sets.engaged[modes.accuracy])
        meleeSet = combineSets(meleeSet, sets.engaged[modes.accuracy], time_set)
        meleeSet = combineSets(meleeSet, sets.engaged, modes.offense, modes.accuracy)
        meleeSet = combineSets(meleeSet, sets.engaged, modes.offense, modes.accuracy, time_set)
    end
    meleeSet = combineSets(meleeSet, sets.engaged[modes.defense])
    meleeSet = combineSets(meleeSet, sets.engaged[modes.defense], time_set)
    meleeSet = combineSets(meleeSet, sets.engaged[modes.defense], modes.accuracy)
    meleeSet = combineSets(meleeSet, sets.engaged[modes.defense], modes.accuracy, time_set)
    
    for buff,_ in pairs(buffactive) do
        --atc(1, '[Engaged] Buffactive: '..tostring(buff))
        meleeSet = combineSets(meleeSet, sets.engaged, 'with_buff', buff)
        meleeSet = combineSets(meleeSet, sets.engaged, modes.offense, 'with_buff', buff)
    end
    
    if (modes.defense ~= nil) or (modes.defense ~= 'normal') then
        meleeSet = combineSets(meleeSet, sets.defense[modes.defense])
    end
    
    if player.main_job == 'THF' then
        if modes.treasure == 'TH' then
            meleeSet = combineSets(meleeSet, sets.TreasureHunter)
        end
    end
    return meleeSet
end

--[[
    Assembles the player's resting set with an optional baseSet.
--]]
function get_resting_set(baseSet)
    local restSet = combineSets(baseSet, sets.resting)
    return restSet
end

--------------------------------------------------------------------------------
--  Custom command handling
--------------------------------------------------------------------------------

function self_command(raw_args)
    local args = raw_args
    if type(args) == 'string' then
        args = T(args:split(' '))
        if #args == 0 then return end
    end
    local command = table.remove(args, 1)
    execute_command(command, args)
end

function execute_command(command, args)
    local cmd = command:lower()
    if executable_commands[cmd] ~= nil then
        executable_commands[cmd].fn(args)
    else
        atc(123, '[ERROR] Unknown command: '..command)
    end
end

function equip_set(args)
    local eset
    if args[1] then
        eset = args[1]:lower()
    end
    
    if eset then
        if eset == 'engaged' then
            equip(get_gear_for_status('Engaged'))
        elseif eset == 'idle' then
            equip(get_gear_for_status('Idle'))
        end
    end
end

function update(args)
    if weapSwapJobs:contains(player.main_job) then
        if noWeapSwapSets:contains(modes.offense) then
            disable('main', 'sub')
        else
            enable('main', 'sub')
        end
    end
    
    local equipSet = get_gear_for_status(player.status)
    equipSet = combineSets(equipSet, sets.weapons, modes.weapon)
    equip(equipSet)

    if (player.main_job == 'RNG') then
        local rweap = equipSet.range
        if (rweap ~= nil) then
            local rwtbl = res.items:with('en',rweap)
            if (rwtbl ~= nil) then
                local skill = rwtbl.skill
                if (skill == 25) and (modes.offense ~= 'Bow') then
                    set_mode({'offense','Bow'})
                elseif (skill == 26) and (modes.offense ~= 'Gun') then
                    set_mode({'offense','Gun'})
                end
            end
        end
    end
    
    if (args ~= nil) and (args[1] == 'user') then
        display_current_state()
    end
end
    
function cycle_mode(args)
    local mode = args[1]
    local reason = args[2] and ' [Reason: %s]':format(args[2]) or ''
    if mode ~= nil then
        cycleMode(mode)
    end
    atcfs(1, '%s mode is now %s%s', tostring(mode), tostring(modes[mode]), reason)
    if refresh_gear_sets then refresh_gear_sets() end
    update()
end

function set_mode(args)
    local mode = args[1]
    local opt = args[2]
    local reason = args[3] and ' [Reason: %s]':format(args[3]) or ''
    if (mode ~= nil) and (opt ~= nil) then
        setMode(mode, opt)
    end
    atcfs(1, '%s mode is now %s%s', tostring(mode), tostring(modes[mode]), reason)
    if refresh_gear_sets then refresh_gear_sets() end
    update()
end

function reset_mode(args)
    local mode = args[1]
    local reason = args[2] and ' [Reason: %s]':format(args[2]) or ''
    if mode ~= nil then
        modes[mode] = nil
        cycleMode(mode)
    end
    atcfs(1, '%s mode is now %s%s', tostring(mode), tostring(modes[mode]), reason)
    if refresh_gear_sets then refresh_gear_sets() end
    update()
end

function toggle_mode(args)
    local mode = args[1]
    local reason = args[2] and ' [Reason: %s]':format(args[2]) or ''
    if mode ~= nil then
        modes[mode] = not modes[mode]
    end
    atcfs(1, '%s mode is now %s%s', tostring(mode), tostring(modes[mode]), reason)
    if refresh_gear_sets then refresh_gear_sets() end
    update()
end

function activate_mode(args)
    local mode = args[1]
    local reason = args[2] and ' [Reason: %s]':format(args[2]) or ''
    if mode ~= nil then
        modes[mode] = true
    end
    atcfs(1, '%s mode is now %s%s', tostring(mode), tostring(modes[mode]), reason)
    if refresh_gear_sets then refresh_gear_sets() end
    update()
end

--[[
    Equip gear as if the given spell or ability was used.
    Syntax: //gs c show <spell/ability name> <precast/midcast>
    If pre/mid is undefined, then it defaults to precast for abilities and midcast for spells.
--]]
function show_set(args)
    local text = table.concat(args, ' ')
    local timing = nil
    if text:lower() == 'engaged' then
        equip(get_melee_set())
        return
    elseif text:endswith('precast') then
        timing = 'precast'
        text = text:sub(1, #text-7)
    elseif text:endswith('midcast') then
        timimg = 'midcast'
        text = text:sub(1, #text-7)
    end
    text:trim()
    
    local action = res.spells:with('en',text)
    if (action == nil) then
        action = res.job_abilities:with('en',text)
        action = action or res.weapon_skills:with('en',text)
        action.action_type = "Ability"
        timing = timing or 'precast'
    else
        action.target = windower.ffxi.get_mob_by_target()
        if action.target ~= nil then
            if action.target.id == player.id then
                action.target.type = 'SELF'
            elseif action.target.is_npc then
                if action.target.id % 4096 > 2047 then
                    action.target.type = 'NPC'
                else
                    action.target.type = 'MONSTER'
                end
            else
                action.target.type = 'PLAYER'
            end
        end
        timing = timing or 'midcast'
    end
    
    if (action ~= nil) then
        local equipset
        if timing == 'precast' then
            equipset = get_precast_set(action)
        elseif timing == 'midcast' then
            equipset = get_midcast_set(action)
        end
        pprint(equipset, timing..' set for '..text)
        equip(equipset)
    else
        atc(166, 'Unable to determine set to equip for '..table.concat(args, ' '))
    end
end

--------------------------------------------------------------------------------
--  Pet Stuff
--------------------------------------------------------------------------------

function pet_midcast(spell)
    atc(1,'Pet midcast: '..spell.en..' | '..pet.name)
    --pprint(spell,spell.en)

    local pmcset = {}
    --pprint(spell, 'Pet Midcast Spell')
    local ptype = get_pet_type()
    if (ptype == 'Avatar') then
        pmcset = combineSets(pmcset, sets.midcast.pet.BP)
        if (spell.type == 'BloodPactRage') then
            pmcset = combineSets(pmcset, sets.midcast.pet.BP.Rage)
            if bps.magical:contains(spell.en) then
                pmcset = combineSets(pmcset, sets.midcast.pet.BP.Rage.Magical)
                if bps.nuke:contains(spell.en) then
                    pmcset = combineSets(pmcset, sets.midcast.pet['Elemental Magic'])
                end
            else
                pmcset = combineSets(pmcset, sets.midcast.pet.BP.Rage.Physical)
            end
        elseif (spell.type == 'BloodPactWard') then
            pmcset = combineSets(pmcset, sets.midcast.pet.BP.Ward)
            if spell.targets:contains('Enemy') then
                pmcset = combineSets(pmcset, sets.midcast.pet.BP.Ward.Debuff)
            else
                if bps.heal:contains(spell.en) then
                    pmcset = combineSets(pmcset, sets.midcast.pet['White Magic'])
                else
                    pmcset = combineSets(pmcset, sets.midcast.pet.BP.Ward.Buff)
                end
            end
        else
            atc(123, 'Unknown Avatar action type')
        end
    elseif (ptype == 'Wyvern') then
        pmcset = combineSets(pmcset, sets.pet.breath)
    elseif (ptype == 'BSTpet') then
        pmcset = combineSets(pmcset, sets.midcast.pet['Ready'])
    else
        atc(123, 'Unknown pet type')
    end
    equip(pmcset)
end

function pet_aftercast(spell)
    update()
end

--[[
    Called when a player gains or loses a pet.
--]]
function pet_change(pet, gain)
    update()
end

--[[
    Called when the player's pet's status changes, and after pet_change when the pet is released.
    As such, don't automatically handle gear equips.  Only do so if directed to do so by the job.
--]]
function pet_status_change(new, old)
end

function info_func(args)
    if not _libs.lor.exec then
        atc(3,'Unable to parse info.  Windower/addons/libs/lor/lor_exec.lua was unable to be loaded.')
        atc(3,'If you would like to use this function, please visit https://github.com/lorand-ffxi/lor_libs to download it.')
        return
    end
    local cmd = args[1] --Take the first element as the command
    table.remove(args, 1)   --Remove the first from the list of args
    _libs.lor.exec.process_input(cmd, args)
end

function test(args)
    --local temp = {}
    --temp.group_one = {trusts, storms, var_potency_enfeebs}
    --temp.group_two = {spirits}
    --pprint(temp)
    --local t = 'v:k for k,v in pairs(tbl)':psplit('[:,]')
    --for k,v in pairs(t) do
        --atcfs('%s    %s',k,v)
    --end
    
    for k,v in pairs(_libs['chat/chars']) do
        winraw.add_to_chat(val, '%s      %s':format(k,v))
    end
    
end

function test1()
    for spellid, spell in pairs(res.spells) do
        if (spell.type ~= 'Trust') and (spell_maps[spell.en] == nil) and (spell.type ~= 'BlueMagic') then
            atcfs('%s,%s,%s,%s', spellid, spell.en, spell.type, res.skills[spell.skill].en)
        end
    end
    
end

function print_help()
    atc('Commands available for //gs c <cmd>:')
    local group_text = {['mode']='Mode Setting', ['inv']='Inventory Convenience', ['act']='Action & Equipment Management', ['misc']='Misc'}
    local groups = {['mode']={}, ['inv']={}, ['act']={}, ['misc']={}}
    for cmd, tbl in pairs(executable_commands) do
        table.insert(groups[tbl.group], {cmd, tbl})
    end
    for gname, group in pairs(groups) do
        atcc(262, '---------- %s ----------':format(group_text[gname]))
        for _,cmds in pairs(group) do
            local cmd, tbl = cmds[1], cmds[2]
            if not tbl.hide then
                atcc(263, '%s %s':format(cmd, tbl['args']))
                atcc(1, '    %s':format(tbl['help']))
            end
        end
    end
end

local function reload()
    windower.send_command('lua reload '.._addon.name)
end

local function version_check()
    atcc(262, 'Found %s versioned files:':format(sizeof(lor_gs_versions)))
    pprint(lor_gs_versions)
end

executable_commands = {
    --Mode Setting
    ['activate']  = {['fn']=activate_mode,             ['group']='mode', ['args']='mode', ['help']='Set modes[mode] to true and update current equipment'},
    ['cycle']     = {['fn']=cycle_mode,                ['group']='mode', ['args']='mode', ['help']='Advance modes[mode] to the next value'},
    ['reset']     = {['fn']=reset_mode,                ['group']='mode', ['args']='mode', ['help']='Set modes[mode] to its default value'},
    ['set']       = {['fn']=set_mode,                  ['group']='mode', ['args']='mode opt', ['help']='Set modes[mode] = opt'},
    ['toggle']    = {['fn']=toggle_mode,               ['group']='mode', ['args']='mode', ['help']='Toggle modes[mode] to be the opposite of its current value'},
    --Inventory Convenience
    ['inv_check'] = {['fn']=setops.find_movable,       ['group']='inv', ['args']='', ['help']='Print a list items in your primary inventory that are not required by your gear lua'},
    ['misplaced'] = {['fn']=setops.find_misplaced,     ['group']='inv', ['args']='', ['help']='Print the items required by your gear lua that are in a wrong bag, and where they are'},
    ['missing']   = {['fn']=setops.find_misplaced,     ['group']='inv', ['hide']=true},
    ['export']    = {['fn']=export_gear,               ['group']='inv', ['args']='[format] [name]', ['help']='Export currently equipped gear to .../GearSwap/data/export/.  All args are optional; specify list to put each item on a separate line'}, 
    ['set2chat']  = {['fn']=setops.set_to_chat,        ['group']='inv', ['args']='channel', ['help']='Print your currently equipped gear to the given channel (/l, /t name, etc.)'},
    ['augs2chat'] = {['fn']=setops.augs_to_chat,       ['group']='inv', ['args']='channel', ['help']='Print your currently equipped gear\'s augments to the given channel (/l, /t name, etc.)'},
    ['slips']     = {['fn']=setops.find_slipped,       ['group']='inv', ['args']='', ['help']='Print the items required by your gear lua that are stored with the porter moogle'},
    ['storable']  = {['fn']=setops.determine_storable, ['group']='inv', ['args']='', ['help']='Print the the items you have in any inventory location that could be stored with a porter moogle, and the slip they would go in'},
    --Action & Equipment Management
    ['equip']     = {['fn']=equip_set,                 ['group']='act', ['args']='status', ['help']='Equip the current set for the given status (engaged/idle)'},
    ['pet']       = {['fn']=handle_pet,                ['group']='act', ['args']='cmd', ['help']='Execute /pet pet_moves[cmd][PetName] <me> (defined in settings_charName.lua)'},
    ['scholar']   = {['fn']=handle_strategems,         ['group']='act', ['args']='stratType|list', ['help']='Use the proper stratagem for the given type, or list available types/stratagems'},
    ['show']      = {['fn']=show_set,                  ['group']='act', ['args']='spell|ability|engaged [precast|midcast]', ['help']='Equip the gear that you would wear for the given action, optionally during the given phase (defaults to precast for abilities and midcast for spells)'},
    ['smn']       = {['fn']=handle_smn,                ['group']='act', ['args']='cmd|siphon', ['help']='Execute /pet bps[cmd][PetName] <target> or summons a spirit to siphon'},
    ['update']    = {['fn']=update,                    ['group']='act', ['args']='[user]', ['help']='Update currently equipped gear to what it should be for your current state, optionally printing some status info if \'user\' is specified.'},
    --Misc
    ['atc']       = {['fn']=addToChat,                 ['group']='misc', ['args']='[color#] text', ['help']='Add the given text to the chat log using the given color number'},
    ['help']      = {['fn']=print_help,                ['group']='misc', ['args']='', ['help']='Print this help text'},
    ['info']      = {['fn']=info_func,                 ['group']='misc', ['args']='[cmd]', ['help']='View addon/windower variable values'},
    ['meleeinfo'] = {['fn']=gi.melee_stats,            ['group']='misc', ['args']='', ['help']='Print melee info about current gear'},
    ['defreport'] = {['fn']=gi.def_report,             ['group']='misc', ['args']='', ['help']='Print defense report about current gear'},
    ['traitinfo'] = {['fn']=gi.print_trait_info,       ['group']='misc', ['args']='trait_name', ['help']='Print current tier and value for the given trait'},
    ['test']      = {['fn']=test,                      ['group']='misc', ['hide']=true},
    ['reload']    = {['fn']=reload,                    ['group']='misc', ['args']='', ['help']='Reload GearSwap entirely; //gs reload only refreshes the user environment, which leads to a memory leak'},
    ['vercheck']  = {['fn']=version_check,             ['group']='misc', ['args']='', ['help']='Display file versions for lor GS files'},
}
