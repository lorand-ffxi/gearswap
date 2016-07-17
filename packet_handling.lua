--======================================================================================================================
--[[
    Author: Ragnarok.Lorand
    GearSwap packet handling functions
--]]
--======================================================================================================================

lor_gs_versions.packet_handling = '2016-07-16.0'

local messages_blacklist = S{1,6,8,9,10,11,12,13,14,15,19,20,21,22,23,30,31,32,33,36,37,38,39,44,45,50,53,54,57,58,59,60,61,63,65,67,69,70,76,77,79,80,81,95,96,97,98,105,107,124,132,149,151,152,157,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,195,196,201,207,208,209,211,212,213,214,222,223,229,232,234,235,239,248,249,250,253,254,255,256,257,258,259,260,261,262,263,264,265,273,276,281,281,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,310,314,336,339,340,352,353,354,355,357,358,361,363,366,367,368,371,372,373,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,415,419,434,436,438,440,442,443,444,447,448,449,450,455,456,457,458,459,460,461,462,463,464,465,466,467,468,469,470,471,472,473,474,475,476,478,512,513,535,536,537,538,540,541,542,543,544,545,548,549,550,551,552,553,554,555,556,557,558,559,568,573,576,577,578,582,583,584,587,588,590,592,601,603,606,609,610,611,612,613,614,615,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633,634,635,636,652,669,673,676,677,678,679,680,681,682,683,684,685,686,687,688,689,690,691,692,693,694,695,696,697,698,699,704,705,706,707,708,709,710,711,712,713,714,715,718,719,720,721,722,723,724,725,726,727,728,729,731,735}
local messages_initiating = S{3,43,326,327,675,716}
local messages_completing = S{2,7,16,28,29,42,62,68,75,82,83,84,85,86,93,100,101,102,103,108,109,110,113,114,115,116,117,118,119,120,121,122,123,125,126,127,128,129,131,133,134,135,136,137,138,139,140,141,142,143,144,146,148,150,153,156,158,159,185,186,187,188,189,194,197,218,220,221,224,225,226,227,228,230,231,236,237,238,240,241,242,243,244,245,252,268,271,274,275,303,304,305,306,309,311,312,317,318,319,320,321,322,323,324,329,330,331,332,333,334,335,341,342,360,362,364,369,370,375,376,377,378,379,399,400,401,402,405,406,407,408,409,412,413,414,416,417,418,420,422,424,425,426,430,431,432,433,435,437,439,441,451,452,453,454,515,516,519,520,521,522,526,527,528,529,532,533,534,539,560,570,572,585,591,593,594,595,596,597,598,599,600,602,604,607,608,642,644,645,646,647,648,650,651,653,655,657,658,663,664,667,668,670,671,672,674,730,734}

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
                            elseif S{511,602}:contains(sid) then
                                buffs.Haste = 2
                                buffs.Refueling = nil
                            elseif S{57,595}:contains(sid) then
                                buffs.Haste = 1
                                buffs.Refueling = nil
                            elseif S{530}:contains(sid) then
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

--[[
    Parse the given packet and construct a table to make its contents useful.
    Based on the 'incoming chunk' function in the Battlemod addon (thanks to Byrth / SnickySnacks)
    @param id packet ID
    @param data raw packet contents
    @return a table representing the given packet's data
--]]
function get_action_info(id, data)
    local pref = data:sub(1,4)
    local data = data:sub(5)
    if id == 0x28 then          -------------- ACTION PACKET ---------------
        local act = {
            do_not_need = get_bit_packed(data,0,8),
            actor_id    = get_bit_packed(data,8,40),
            target_count    = get_bit_packed(data,40,50),
            category    = get_bit_packed(data,50,54),
            param       = get_bit_packed(data,54,70),
            unknown     = get_bit_packed(data,70,86),
            recast      = get_bit_packed(data,86,118),
            targets     = {}
        }
        local offset = 118
        for i = 1, act.target_count do
            act.targets[i] = {
                id      = get_bit_packed(data,offset,offset+32),
                action_count    = get_bit_packed(data,offset+32,offset+36),
                actions     = {}
            }
            offset = offset + 36
            for n = 1,act.targets[i].action_count do
                act.targets[i].actions[n] = {
                    reaction    = get_bit_packed(data,offset,offset+5),
                    animation   = get_bit_packed(data,offset+5,offset+16),
                    effect      = get_bit_packed(data,offset+16,offset+21),
                    stagger     = get_bit_packed(data,offset+21,offset+27),
                    param       = get_bit_packed(data,offset+27,offset+44),
                    message_id  = get_bit_packed(data,offset+44,offset+54),
                    unknown     = get_bit_packed(data,offset+54,offset+85),
                    has_add_efct    = get_bit_packed(data,offset+85,offset+86)
                }
                offset = offset + 86
                if act.targets[i].actions[n].has_add_efct == 1 then
                    act.targets[i].actions[n].has_add_efct      = true
                    act.targets[i].actions[n].add_efct_animation    = get_bit_packed(data,offset,offset+6)
                    act.targets[i].actions[n].add_efct_effect   = get_bit_packed(data,offset+6,offset+10)
                    act.targets[i].actions[n].add_efct_param    = get_bit_packed(data,offset+10,offset+27)
                    act.targets[i].actions[n].add_efct_message_id   = get_bit_packed(data,offset+27,offset+37)
                    offset = offset + 37
                else
                    act.targets[i].actions[n].has_add_efct      = false
                    act.targets[i].actions[n].add_efct_animation    = 0
                    act.targets[i].actions[n].add_efct_effect   = 0
                    act.targets[i].actions[n].add_efct_param    = 0
                    act.targets[i].actions[n].add_efct_message_id   = 0
                end
                act.targets[i].actions[n].has_spike_efct = get_bit_packed(data,offset,offset+1)
                offset = offset + 1
                if act.targets[i].actions[n].has_spike_efct == 1 then
                    act.targets[i].actions[n].has_spike_efct    = true
                    act.targets[i].actions[n].spike_efct_animation  = get_bit_packed(data,offset,offset+6)
                    act.targets[i].actions[n].spike_efct_effect = get_bit_packed(data,offset+6,offset+10)
                    act.targets[i].actions[n].spike_efct_param  = get_bit_packed(data,offset+10,offset+24)
                    act.targets[i].actions[n].spike_efct_message_id = get_bit_packed(data,offset+24,offset+34)
                    offset = offset + 34
                else
                    act.targets[i].actions[n].has_spike_efct    = false
                    act.targets[i].actions[n].spike_efct_animation  = 0
                    act.targets[i].actions[n].spike_efct_effect = 0
                    act.targets[i].actions[n].spike_efct_param  = 0
                    act.targets[i].actions[n].spike_efct_message_id = 0
                end
            end
        end
        return act
    elseif id == 0x29 then      ----------- ACTION MESSAGE ------------
        local am = {
            actor_id    = get_bit_packed(data,0,32),
            target_id   = get_bit_packed(data,32,64),
            param_1     = get_bit_packed(data,64,96),
            param_2     = get_bit_packed(data,96,106),  -- First 6 bits
            param_3     = get_bit_packed(data,106,128), -- Rest
            actor_index = get_bit_packed(data,128,144),
            target_index    = get_bit_packed(data,144,160),
            message_id  = get_bit_packed(data,160,175), -- Cut off the most significant bit, hopefully
        }
        return am
    end
end

function get_bit_packed(dat_string,start,stop)
    --Copied from Battlemod; thanks to Byrth / SnickySnacks
    local newval = 0   
    local c_count = math.ceil(stop/8)
    while c_count >= math.ceil((start+1)/8) do
        local cur_val = dat_string:byte(c_count)
        local scal = 256
        if c_count == math.ceil(stop/8) then
            cur_val = cur_val%(2^((stop-1)%8+1))
        end
        if c_count == math.ceil((start+1)/8) then
            cur_val = math.floor(cur_val/(2^(start%8)))
            scal = 2^(8-start%8)
        end
        newval = newval*scal + cur_val
        c_count = c_count - 1
    end
    return newval
end
