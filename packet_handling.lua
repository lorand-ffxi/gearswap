--======================================================================================================================
--[[
    Author: Ragnarok.Lorand
    GearSwap packet handling functions
--]]
--======================================================================================================================

lor_gs_versions.packet_handling = '2016-10-15.0'

local messages_initiating = _libs.lor.packets.messages_initiating
local messages_completing = _libs.lor.packets.messages_completing

local get_action_info = _libs.lor.packets.get_action_info

local abil_start_ids = S{43,326,675}
local spell_start_ids = S{3,327,716}
local start_ids = abil_start_ids:union(spell_start_ids)


--[[
    Analyze the data contained in incoming packets for useful info.
    @param id packet ID
    @param data raw packet contents
--]]
function handle_incoming_chunk(id, data)
    if S{0x28,0x29}:contains(id) then   --Action / Action Message
        local ai = get_action_info(id, data)
        if id == 0x28 then
            for _,targ in pairs(ai.targets) do
                for _,tact in pairs(targ.actions) do
                    if (ai.actor_id == player.id) then
                        if messages_initiating:contains(tact.message_id) then
                            actionStart = os.clock()
                        elseif messages_completing:contains(tact.message_id) then
                            actionEnd = os.clock()
                        end
                    elseif modes.autoDefense and start_ids:contains(tact.message_id) and (targ.id == player.id) then
                        if abil_start_ids:contains(tact.message_id) then
                            if auto_defense.monster_abilities.turn[tact.param] then
                                local target = windower.ffxi.get_mob_by_id(ai.actor_id)
                                if target ~= nil then
                                    windower.ffxi.turn(target.facing)
                                    atcfs(258, 'Alert: Turned around for %s!', auto_defense.monster_abilities.turn[tact.param])
                                else
                                    atcfs(123, 'Error: Unable to find target to turn for %s', auto_defense.monster_abilities.turn[tact.param])
                                end
                                last_mabil_id = tact.param
                                last_mabil_type = 'turn'
                            elseif auto_defense.monster_abilities.physical[tact.param] then
                                set_mode({'defense','PDT',auto_defense.monster_abilities.physical[tact.param]})
                                last_mabil_id = tact.param
                                last_mabil_type = 'def'
                            elseif auto_defense.monster_abilities.magic[tact.param] then
                                set_mode({'defense','MDT',auto_defense.monster_abilities.magic[tact.param]})
                                last_mabil_id = tact.param
                                last_mabil_type = 'def'
                            end
                        else
                            if auto_defense.spells.physical[tact.param] then
                                set_mode({'defense','PDT',auto_defense.spells.physical[tact.param]})
                                last_mabil_id = tact.param
                                last_mabil_type = 'def'
                            elseif auto_defense.spells.magic[tact.param] then
                                set_mode({'defense','MDT',auto_defense.spells.magic[tact.param]})
                                last_mabil_id = tact.param
                                last_mabil_type = 'def'
                            end
                        end
                    elseif modes.autoDefense and messages_completing:contains(tact.message_id) and (last_mabil_id == tact.param) then
                        local mob_target = windower.ffxi.get_mob_by_target()
                        if mob_target ~= nil then
                            if mob_target.id == ai.actor_id then
                                last_mabil_id = nil
                                if last_mabil_type == 'turn' then
                                    windower.ffxi.turn(-mob_target.facing)
                                else
                                    reset_mode({'defense',('%s finished their ability'):format(mob_target.name)})
                                end
                                last_mabil_type = nil
                            end
                        end
                    end
                    --If the target is me, and it's an incoming buff
                    if (targ.id == player.id) and S{230,266}:contains(tact.message_id) then
                        local sid,bid = ai.param,tact.param
                        local bname = res.buffs[bid].en
                        if S{'Haste','March'}:contains(bname) then
                            buffs = buffs or {}
                            if sid == 419 then
                                buffs.March1 = os.clock()
                            elseif sid == 420 then
                                buffs.March2 = os.clock()
                            elseif S{511,602,710}:contains(sid) then    --Haste II, Erratic Flutter
                                buffs.Haste = 2
                                buffs.Refueling = nil
                            elseif S{57,595}:contains(sid) then
                                buffs.Haste = 1
                                buffs.Refueling = nil
                            elseif S{530}:contains(sid) then            --Refueling
                                buffs.Refueling = os.clock()
                                buffs.Haste = nil
                            end
                        end
                    end
                end
            end
        elseif id == 0x29 then
            if (ai.actor_id == player.id) then
                if messages_initiating:contains(ai.message_id) then
                    actionStart = os.clock()
                elseif messages_completing:contains(ai.message_id) then
                    actionEnd = os.clock()
                end
            end
        end
    end
end
