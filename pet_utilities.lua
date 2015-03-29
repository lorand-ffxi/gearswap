--------------------------------------------------------------------------------
--[[
	Author: Ragnarok.Lorand
	GearSwap utility functions that are related to pets.
--]]
--------------------------------------------------------------------------------

function handle_pet(args)
	if not args[1] then
		atc(123,'Error: No pet command given.')
		return
	end
	local cmd = args[1]:lower()
	if pet_move_cmds:contains(cmd) then
		if pet.isvalid then
			local action = pet_moves[cmd][pet.name]
			if (action ~= nil) then
				windower.send_command('input /pet "'..action..'" <me>')
			else
				atc(123,'Error: No buff registered for '..pet.name)
			end
		else
			atc(123,'Error: Unable to use this command without a valid pet.')
		end
	else
		atc(123,'Error: Unknown pet command: '..cmd)
	end
end

function handle_smn(args)
	if not args[1] then
		atc(123,'Error: No SMN command given.')
		return
	elseif not S{player.main_job, player.sub_job}:contains('SMN') then
		atc(123,'You cannot use SMN commands without having Summoner as your main or sub job.')
		return
	end
	local cmd = args[1]:lower()
	
	if (cmd == 'siphon') then
		if pet.isvalid then
			if spirits:contains(pet.name) then
				windower.send_command('input /ja "Elemental Siphon" <me>;wait 1.1;input /pet "Release" <me>')
				return
			else
				atc(123, 'Invalid pet for Elemental Siphon.')
				return
			end
		end
		
		local spirit
		local weatherIntensity = res.weather[world.weather_id].intensity or 0
		if (weatherIntensity > 1) then
			spirit = elements.spirit_of[world.weather_element]
		else
			spirit = elements.spirit_of[world.day_element]
		end
		
		local tosend = 'input /ma "'..spirit..'" <me>'
		tosend = tosend..';wait 4;input /ja "Elemental Siphon" <me>'
		tosend = tosend..';wait 1.1;input /pet "Release" <me>'
		windower.send_command(tosend)
		return
	elseif smn_cmds:contains(cmd) then
		if (pet.isvalid and avatars:contains(pet.name)) then
			local bpmap = bps[cmd]
			local bp = bpmap[pet.name]
			if (bp ~= nil) then
				local targ = args[2] or ''
				windower.send_command('input /pet "'..bp..'" '..targ)
				return
			end
			atc(123,'Error: Invalid command ('..cmd..') for pet ('..pet.name..')')
			return
		end
		atc(123,'Error: Invalid pet for command: '..cmd)
	else
		atc(123,'Error: Unknown SMN command: '..cmd)
	end
end

function get_pet_type()
	if not pet.isvalid then return nil end
	if spirits:contains(pet.name) then
		return 'Spirit'
	elseif avatars:contains(pet.name) then
		return 'Avatar'
	elseif player.main_job == 'DRG' then
		return 'Wyvern'
	end
	return pet.name
end

function get_perp_cost()
	if buff_active('Astral Flow') then return 0 end
	local pet_type = get_pet_type()
	local perp_cost = 0
	if pet_type == 'Spirit' then
		perp_cost = 7
	elseif pet_type == 'Avatar' then
		if S{'Carbuncle','Cait Sith'}:contains(pet.name) then
			perp_cost = 11
		elseif pet.name == 'Fenrir' then
			perp_cost = 13
		else
			perp_cost = 15
		end
	end
	if buff_active("Avatar's Favor") then
		if player.main_job_level >= 91 then
			perp_cost = perp_cost - 4
		elseif player.main_job_level >= 81 then
			perp_cost = perp_cost - 3
		else
			perp_cost = perp_cost - 2
		end
	end
	return perp_cost
end