-----------------------------------------------------------------------------------------------------------
--[[
	Author: Ragnarok.Lorand
	
	TODO:
	- Cycle weapon mode: Katana/Katana, Katana/Dagger, manual, etc (use specific weap names)
	
--]]
-----------------------------------------------------------------------------------------------------------

function get_sets()
	include('include.lua')
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function select_movement()
	-- world.time is given in minutes into each day
	-- 7:00 AM would be 420 minutes		(dawn)
	-- 17:00 PM would be 1020 minutes	(dusk)
	if world.time >= (17*60) or world.time <= (7*60) then
		return sets.NightMovement
	else
		return sets.DayMovement
	end
end