--==============================================================================
--[[
	Author: Ragnarok.Lorand
	GearSwap packet handling functions
--]]
--==============================================================================

--[[
	Called upon receipt of incoming packets.
	Parses the given packet info if it is an Action Packet for information
	about incoming buffs that provide Haste effects.
--]]
function parse_buff_info(id,data)
	if id == 0x28 then
		local ai = get_action_info(id, data)
		for _,targ in pairs(ai.targets) do
			if (targ.id == player.id) then
				for _,tact in pairs(targ.actions) do
					if S{230,266}:contains(tact.message_id) then
						local sid = ai.param
						local bid = tact.param
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
						end--/if the buff provides a haste effect
					end--/if message id refers to receipt of a buff
				end--/loop through effects of the action on the current target
			end--/if target's id matches player's id
		end--/loop through targets of the action
	end--/if it's an action packet
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
    if id == 0x28 then			-------------- ACTION PACKET ---------------
        local act = {}
        act.do_not_need	= get_bit_packed(data,0,8)
        act.actor_id	= get_bit_packed(data,8,40)
        act.target_count= get_bit_packed(data,40,50)
        act.category	= get_bit_packed(data,50,54)
        act.param	= get_bit_packed(data,54,70)
        act.unknown	= get_bit_packed(data,70,86)
        act.recast	= get_bit_packed(data,86,118)
        act.targets = {}
        local offset = 118
        for i = 1, act.target_count do
            act.targets[i] = {}
            act.targets[i].id = get_bit_packed(data,offset,offset+32)
            act.targets[i].action_count = get_bit_packed(data,offset+32,offset+36)
            offset = offset + 36
            act.targets[i].actions = {}
            for n = 1,act.targets[i].action_count do
                act.targets[i].actions[n] = {}
                act.targets[i].actions[n].reaction	= get_bit_packed(data,offset,offset+5)
                act.targets[i].actions[n].animation	= get_bit_packed(data,offset+5,offset+16)
                act.targets[i].actions[n].effect	= get_bit_packed(data,offset+16,offset+21)
                act.targets[i].actions[n].stagger	= get_bit_packed(data,offset+21,offset+27)
                act.targets[i].actions[n].param		= get_bit_packed(data,offset+27,offset+44)
                act.targets[i].actions[n].message_id	= get_bit_packed(data,offset+44,offset+54)
                act.targets[i].actions[n].unknown	= get_bit_packed(data,offset+54,offset+85)
                act.targets[i].actions[n].has_add_efct	= get_bit_packed(data,offset+85,offset+86)
                offset = offset + 86
                if act.targets[i].actions[n].has_add_efct == 1 then
                    act.targets[i].actions[n].has_add_efct		= true
                    act.targets[i].actions[n].add_efct_animation	= get_bit_packed(data,offset,offset+6)
                    act.targets[i].actions[n].add_efct_effect		= get_bit_packed(data,offset+6,offset+10)
                    act.targets[i].actions[n].add_efct_param		= get_bit_packed(data,offset+10,offset+27)
                    act.targets[i].actions[n].add_efct_message_id	= get_bit_packed(data,offset+27,offset+37)
                    offset = offset + 37
                else
                    act.targets[i].actions[n].has_add_efct		= false
                    act.targets[i].actions[n].add_efct_animation	= 0
                    act.targets[i].actions[n].add_efct_effect		= 0
                    act.targets[i].actions[n].add_efct_param		= 0
                    act.targets[i].actions[n].add_efct_message_id	= 0
                end
                act.targets[i].actions[n].has_spike_efct = get_bit_packed(data,offset,offset+1)
                offset = offset + 1
                if act.targets[i].actions[n].has_spike_efct == 1 then
                    act.targets[i].actions[n].has_spike_efct		= true
                    act.targets[i].actions[n].spike_efct_animation	= get_bit_packed(data,offset,offset+6)
                    act.targets[i].actions[n].spike_efct_effect		= get_bit_packed(data,offset+6,offset+10)
                    act.targets[i].actions[n].spike_efct_param		= get_bit_packed(data,offset+10,offset+24)
                    act.targets[i].actions[n].spike_efct_message_id	= get_bit_packed(data,offset+24,offset+34)
                    offset = offset + 34
                else
                    act.targets[i].actions[n].has_spike_efct		= false
                    act.targets[i].actions[n].spike_efct_animation	= 0
                    act.targets[i].actions[n].spike_efct_effect		= 0
                    act.targets[i].actions[n].spike_efct_param		= 0
                    act.targets[i].actions[n].spike_efct_message_id	= 0
                end
            end
        end
        return act
    elseif id == 0x29 then		----------- ACTION MESSAGE ------------
		local am = {}
		am.actor_id	= get_bit_packed(data,0,32)
		am.target_id	= get_bit_packed(data,32,64)
		am.param_1	= get_bit_packed(data,64,96)
		am.param_2	= get_bit_packed(data,96,106)	-- First 6 bits
		am.param_3	= get_bit_packed(data,106,128)	-- Rest
		am.actor_index	= get_bit_packed(data,128,144)
		am.target_index	= get_bit_packed(data,144,160)
		am.message_id	= get_bit_packed(data,160,175)	-- Cut off the most significant bit, hopefully
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