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
	options.IdleModes = {'Normal', 'Speedy', 'Fun'}
	refresh_keybindings()
end

function job_post_precast(spell, action, spellMap, eventArgs)
	if correspondsWithActiveArts(spell) then
		equip(sets.precast.FC.Grimoire)		--FastCast/Haste +8%
	end
	if buffactive.Celerity or buffactive.Alacrity then
		if buffactive[elements.storm_of[spell.element]] or spell.element == world.weather_element then
			equip(sets.precast.FC.Weather)	--FastCast/Haste +15%
		end
	end
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