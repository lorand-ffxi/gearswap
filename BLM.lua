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
	send_command('bind @8 input /ja "Manawell" <me>')
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Function to get the custom class to use for nukes.
function get_nuke_class(spell, action, spellMap)
	return nil
--	if lowTierNukes[spell.english] then
		-- low tier nukes use the default set
--		return nil
--	else
--		return 'HighTierNuke'
--	end
end