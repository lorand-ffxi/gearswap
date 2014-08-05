-----------------------------------------------------------------------------------------------------------
--[[
	Author: Ragnarok.Lorand
--]]
-----------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
	include('mage_utils.lua')
	include('include.lua')
end

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
	set_modes()
	refresh_keybindings()
end