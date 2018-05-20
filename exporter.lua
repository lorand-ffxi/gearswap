
lor_gs_versions.exporter = '2016-10-23.0'

--[[
    Export Gear
    Exports the currently equipped gear in proper lua format to 
    Windower/addons/GearSwap/data/export/Playername_JOB_timestamp.lua
    Arguments, providable in any order:
    list        prints each item on a separate line (default is grouped)
    <set name>  uses the provided name as the name of the set
--]]
local _export_gear = function(args)
    local default_header = 'sets.exported'
    local listfmt = not any_eq('no_augs', unpack(args))
    local include_augs = true
    local canonical = false
    local use_tabs = false
    
    local kvargs = _libs.lor.argparse.extract_kvpairs(args, true)
    if kvargs.help or kvargs.h then
        atc('Usage: //gs c export [--help] [--format {list,group}] [--no_augs] [--name set_name] [--canonical]')
        atc('--help, -h         show this help message and exit')
        atc('--format, -f       list: separate lines; group: grouped by equipment window rows')
        atc('--no_augs          only include item names, not augments (default: include augments)')
        atc(('--name, -n         name to use for the set (default: %s)'):format(default_header))
        atc('--canonical, -c    include full item info (default: substitute gear.xyz variables when a match is found)')
        atc('--use_tabs, -t     Use tabs (default: use spaces)')
        return
    end
    if kvargs.format or kvargs.f then
        local arg_fmt = kvargs.format or kvargs.f
        if S{'list', 'group'}:contains(arg_fmt) then
            listfmt = (arg_fmt == 'list')
        else
            return
        end
    end
    
    local header = kvargs.name or kvargs.n or default_header
    if kvargs.no_augs then
        include_augs = false
    end
    if kvargs.canonical or kvargs.c then
        canonical = true
    end

    --Process currently equipped gear
    local slots = {'main','sub','range','ammo','head','neck','left_ear','right_ear','body','hands','left_ring','right_ring','back','waist','legs','feet'}
    local slotmap = {['left_ear']='ear1',['right_ear']='ear2',['left_ring']='ring1',['right_ring']='ring2'}
    local bagmap = {[0]='inventory',[8]='wardrobe',[10]='wardrobe2',[11]='wardrobe3',[12]='wardrobe4'}
    local itemlist = windower.ffxi.get_items()
    local eq_tbl = itemlist.equipment
    
    local enquote = customized(string.format, "'%s'")
    
    local equipped = {}
    for _,slot in pairs(slots) do
        local idx_in_bag = eq_tbl[slot]
        if (idx_in_bag ~= 0) then
            local sname = slotmap[slot] or slot
            local uniq_item = itemlist[bagmap[eq_tbl[slot..'_bag']]][idx_in_bag]
            local item_res = res.items[uniq_item.id]
            local iname = ('"%s"'):format(item_res.enl:capitalize())
            uniq_item = setops.expand_augments(uniq_item)
            if include_augs and (#uniq_item.augments > 0) then
                if not canonical and item_res.flags.Rare then
                    equipped[sname] = iname
                else            
                    equipped[sname] = ('{name=%s, augments=%s}'):format(iname, ('{%s}'):format((','):join(map(enquote, uniq_item.augments))))
                    
                    if (gear ~= nil) and not canonical then
                        local augd_item = loadstring('return '..equipped[sname])()
                        for vname, gitem in pairs(gear) do
                            if table.equals(gitem, augd_item) then
                                equipped[sname] = 'gear.'..vname
                                break
                            end
                        end
                    end
                end
            else
                equipped[sname] = iname
            end
        end
    end

    --  ==========  Write the file      ==========

    if not windower.dir_exists(windower.addon_path..'data/export') then
        windower.create_dir(windower.addon_path..'data/export')
    end
    
    local path = 'data/export/'..player.name
    path = path..os.date('_%Y.%m.%d_%H.%M.%S')
    path = path..'_'..windower.ffxi.get_player().main_job
    if windower.file_exists(path..'.lua') then
        path = path..' '..os.clock()
    end
    
    local f = io.open(windower.addon_path..path..'.lua','w+')
    f:write(header..' = {\n')
    
    local fmt = '%s=%s'
    local printed = 0
    local last_comma = sizeof(equipped)
    local comma = false
    local last_was_nl = false
    local last_entry_len
    for i = 1, 16 do
        local slot = slots[i]
        local sname = slotmap[slot] or slot
        local iname = equipped[sname]
        
        if comma then f:write(',') end
        if iname then
            local entry = fmt:format(sname, iname)
            local spaces = (last_was_nl or (i == 1)) and 4 or (4 - (last_entry_len % 4))
            f:write((' '):rep(spaces), entry)
            printed = printed + 1
            comma = printed < last_comma
            last_was_nl = false
            last_entry_len = comma and (#entry + 1) or #entry
        else
            comma = false
        end
        
        if listfmt or (i % 4 == 0) then
            if comma then f:write(',') end
            if not last_was_nl then
                f:write('\n')
                last_was_nl = true
            end
            comma = false
        end
    end
    
    f:write('}')
    f:close()
    atc('Successfully exported set to '..path..'.lua')
end

export_gear = traceable(_export_gear)
