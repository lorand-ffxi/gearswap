-----------------------------------------------------------------------------------------------------------
--[[
	Author: Ragnarok.Lorand
	GearSwap core components
--]]
-----------------------------------------------------------------------------------------------------------

executable_commands = {
	['atc']		=	addToChat,
	['scholar'] =	handle_strategems,
}

function precast(spell)
	
end


function midcast(spell)

end


function aftercast(spell)

end


function status_change(new, old)

end


function buff_change(buff, gain)
	
end

function main_job_change(new, old)

end

function sub_job_change(new, old)

end


function self_command(args)
	local args = args
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
		executable_commands[cmd](args)
	else
		add_to_chat(123, '[ERROR] Unknown command: '..command)
	end
end