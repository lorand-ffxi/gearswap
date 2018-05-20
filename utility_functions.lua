--==============================================================================
--[[
    Author: Ragnarok.Lorand
    GearSwap utility functions that are required by, but don't belong
    in, core_components.lua
--]]
--==============================================================================
--          File Handling Functions
--==============================================================================

lor_gs_versions.utility_functions = '2016-10-15.0'

--[[
    Attempt to load user gear files in place of default gear sets.
    Returns true if one exists and was loaded, otherwise returns false.
    File name format order of precedence:
        Playername_JOB_gear.lua
        JOB_gear.lua
--]]
function load_user_gear(job)
    if not job then return false end
    local filenames = {player.name..'_'..job..'_gear.lua', job..'_gear.lua'}
    for _,fname in pairs(filenames) do
        if include_if_exists(fname) then
            return true
        elseif include_if_exists('gear/'..fname) then
            return true
        end
    end
    return false
end

--[[
    Attempt to load user's settings file by character name, or, optionally,
    a given file name.  If the file is found, the function that will be
    called by core_components.lua in init() is use_user_settings()
--]]
function load_user_settings(filename)
    if include_if_exists(filename) then
        return true
    else
        local filenames = {
            'settings_'..player.name..'.lua',
            player.name..'_settings.lua',
            'settings_default.lua'
        }
        for _,fname in pairs(filenames) do
            if include_if_exists(fname) then
                return true
            end
        end
    end
    return false
end

--[[
    Loads the lua file with the given name if it exists, and returns true.
    Returns false if the file cannot be found/loaded.
--]]
function include_if_exists(filename)
    if (filename ~= nil) and (type(filename) == 'string') then
        local path = gearswap.pathsearch({filename})
        if path then
            include(filename)
            echo('Loaded: '..filename)
            return true
        end
    end
    return false
end


function load_auto_defense()
    local ad_settings = _libs.lor.settings.load('data/auto_defense.lua', {monster_abilities={magic=S{},physical=S{},turn=S{}},spells={magic=S{},physical=S{},turn=S{}}})
    auto_defense = {monster_abilities={magic={},physical={},turn={}},spells={magic={},physical={},turn={}}}
    
    local res_types = {'monster_abilities','spells'}
    local types = {'magic','physical','turn'}
    local norm_res = {}
    for _,rtype in pairs(res_types) do
        norm_res[rtype] = {}
        for id, action in pairs(res[rtype]) do
            local aname = action.en
            local aname_l = aname:lower()
            norm_res[rtype][aname_l] = norm_res[rtype][aname_l] or {name=aname,ids=S{}}
            norm_res[rtype][aname_l].ids:add(id)
        end
        
        for _,t in pairs(types) do
            for action,_ in pairs(ad_settings[rtype][t]) do
                local maction
                if isnum(action) then
                    maction = res[rtype][action]
                    if maction ~= nil then
                        auto_defense[rtype][t][maction.id] = maction.en
                    else
                        atcfs(123, 'Unable to find %s in resources: %s', rtype, action)
                    end
                else
                    maction = norm_res[rtype][action:lower()]
                    if maction ~= nil then
                        for id,_ in pairs(maction.ids) do
                            auto_defense[rtype][t][id] = maction.name
                        end
                    else
                        atcfs(123, 'Unable to find %s in resources: %s', rtype, action)
                    end
                end
            end
        end
    end
end


function populateTrustList()
    local trusts = S{}
    for _,spell in pairs(res.spells) do
        if (spell.type == 'Trust') then
            trusts:add(spell.en)
        end
    end
    return trusts
end

--==============================================================================
--          Printing Functions
--==============================================================================

function dbg_print(...)
    if modes.debug then
        atcfs(...)
    end
end

--[[
    Allows atc to be called via the Windower console.
    This enables messages to be added to the chat log with a delay.
    Usage: gs c atc <color> <text>
--]]
function addToChat(cmdParams)
    local dispText = cmdParams[2]
    for i = 3, #cmdParams, 1 do
        dispText = (' '):join(dispText, cmdParams[i])
    end
    --Parse the text to be displayed for special character codes as found
    -- in Windower/addons/libs/chat/chars.lua
    for k,v in pairs(_libs['chat/chars']) do
        local ckey = ('<%s>'):format(k)
        if dispText:contains(ckey) then
            --Replace codes with the characters they represent
            dispText = dispText:gsub(ckey, v)
        end
    end
    local val = tonumber(cmdParams[1]) or 1
    winraw.add_to_chat(val, dispText)
end

function display_current_state()
    local ms = T()
    for k,v in pairs(modes) do
        if (k == 'ranged') then
            if usesRanged:contains(player.main_job) then
                ms:insert(('%s: %s'):fmts(k, v))
            end
        elseif (k == 'offense') and S{'auto','auto_acc'}:contains(v) then
            ms:insert(('%s: %s[%s]'):fmts(k, v, get_haste_mod()))
        else
            ms:insert(('%s: %s'):fmts(k, v))
        end
    end
    if buffs and buffs.Haste then
        ms:insert(('Haste tier: %s'):fmts(buffs.Haste))
    end
    atc(1, ms:concat(' | '))
end

--==============================================================================
--      Table/Array/Set Manipulation Functions
--==============================================================================

--[[
    Extension of the set class to check for the existence of one or more
    elements in the set.
--]]
function set.containsOneOrMore(s, eles)
    local elez = S(eles)
    for chk,_ in pairs(elez) do
        if s:contains(chk) then
            return true
        end
    end
    return false
end

--==============================================================================
--          Mode handling functions
--==============================================================================

--[[
    Add a new mode to the global list of options.  Initializes the options
    and modes tables if they have not already been initialized.  Optionally
    fills the list of options for the new mode with a given set of values.
--]]
function addMode(mode, vals)
    if mode == nil then return end
    if options == nil then options = T() end
    if options.modes == nil then options.modes = T() end
    options.modes[mode] = T()
    if vals ~= nil then
        for _,option in ipairs(vals) do
            addModeOption(mode, option)
        end
    end
    modes[mode] = getNextOption(mode)
end

--[[
    Add a new option to a given mode in the global list of options.
--]]
function addModeOption(mode, option)
    if (options.modes[mode] ~= nil) and (options.modes[mode][option] == nil) then
        options.modes[mode]:insert(option)
    end
end

--[[
    Returns the next option from the global list of options for the given
    mode based on the given previous option.  Returns the first option for
    the given mode if no previous option is provided, or if the given
    previous option was not in the list of possible options for the given
    mode.
--]]
function getNextOption(mode, lastOption)
    if options.modes[mode] == nil then return nil end
    local listLen = #options.modes[mode]
    if listLen > 0 then
        if lastOption == nil then
            return options.modes[mode][1]
        end
        local i = options.modes[mode]:find(lastOption)
        if i ~= nil then
            if i == listLen then
                return options.modes[mode][1]
            else
                return options.modes[mode][i+1]
            end
        else
            return options.modes[mode][1]
        end
    end
    return nil
end

--[[
    Changes the active state for the given mode to the next option in its
    list.  If there was no previously active state, then the state is set
    to the first option in the list as per the behavior of the
    getNextOption function.
--]]
function cycleMode(mode)
    if options.modes[mode] == nil then return end
    if #options.modes[mode] < 1 then return end
    setMode(mode, getNextOption(mode, modes[mode]))
end

--[[
    Set the active mode for the given mode.
--]]
function setMode(mode, option)
    if mode == nil then return end
    if modes == nil then modes = T() end
    modes[mode] = option
end

--==============================================================================
--          Misc Functions
--==============================================================================

--[[
    Stores a value if provided, otherwise returns the value stored to the given key (if available).
--]]
function cache(key, val)
    cached = cached or T()
    if (val == nil) then
        return cached[key]
    else
        cached[key] = val
    end
end


--[[
    Get the given party/alliance member's vitals. Returns nil if the player
    with the given name is not in the player's party/alliance.
--]]
function get_ally_info(name)
    for _,m in pairs(windower.ffxi.get_party()) do
        if (type(m)=='table') and (m.name == name) then
            return m
        end
    end
    return nil
end

function getPartyMemberNumber(name)
    for n,m in pairs(windower.ffxi.get_party()) do
        if (type(m)=='table') and (m.name == name) then
            return n
        end
    end
    return nil
end

--[[
    Generate and send an old style string with equipment.  Created because equip() wasn't working for the below
    function that shows WS equipment
--]]
function equip_now(set)
    local fmt = 'input /equip %s "%s"'
    local slotmap = {['left_ear']='L.ear',['right_ear']='R.ear',['left_ring']='L.ring',['right_ring']='R.ring'}
    local elines = T()
    for slot,piece in pairs(set) do
        elines:append(fmt:format(slotmap[slot] or slot, piece.name))
    end
    send_command((';'):join(elines))
end

function parse_out_text(original)
    cache('last outgoing', original)
end

function parse_inc_text(original)
    if (original == 'You can only use that command during battle.') then
        local last_outgoing = cache('last outgoing')
        if (player.status == 'Idle') and (last_outgoing ~= nil) then
            last_outgoing = windower.convert_auto_trans(last_outgoing)
            if last_outgoing:startswith('/ws') then
                local wsname = last_outgoing:sub(4,-4):trim():stripchars('"'):trim()
                local ws = res.weapon_skills:with('en', wsname)
                if (ws ~= nil) then
                    ws.action_type = 'Ability'
                    equip_now(get_precast_set(ws))
                else
                    atc(123,'Unable to locate resource for '..wsname)
                end
            end
        end
    end
end
