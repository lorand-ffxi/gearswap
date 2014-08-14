-----------------------------------------------------------------------------------------------------------
--[[
	Author: Ragnarok.Lorand
	Part of a work in progress for adapting Mote's GearSwap files to my liking
	Defines functions common to multiple mage jobs
--]]


-- for i,v in pairs(spell) do
	-- add_to_chat(122, tostring(i)..' : '..tostring(v))
-- end

-- if gearswap.res.job_abilities[spell.id].en then
	-- add_to_chat(122, tostring(gearswap.res.job_abilities[spell.id].en))
-- end
-- for i,v in pairs(windower.ffxi.get_mob_by_index(windower.ffxi.get_player().target_index)) do
	-- add_to_chat(122, tostring(i)..' : '..tostring(v))
-- end


-----------------------------------------------------------------------------------------------------------

-- Setup vars that are user-independent.
function job_setup()
	--SCH stuff
	state.arts = nil
	if player.main_job == 'SCH' then
		state.max_stratagems = math.floor(((player.main_job_level  - 10) / 20) + 1)
	elseif player.sub_job == 'SCH' then
		state.max_stratagems = math.floor(((player.sub_job_level  - 10) / 20) + 1)
	else
		state.max_stratagems = 0
	end
	state.stratagems = state.max_stratagems
	if player.main_job == 'SCH' or player.sub_job == 'SCH' then
		state.strat_charge = strat_charge_time[state.max_stratagems]
	end
	
	--Other stuff
	if player.main_job == 'RDM' then
		state.Buff.Saboteur = buffactive.saboteur or false
	elseif player.main_job == 'WHM' then
		state.Buff['Afflatus Solace'] = buffactive['Afflatus Solace'] or false
	elseif player.main_job == 'BRD' then
		state.Buff['Pianissimo'] = buffactive['Pianissimo'] or false
		options.DaurdablaModes = {'None','Daurdabla','Dummy'}
		state.DaurdablaMode = 'None'
		timer_reg = {}	-- For tracking current recast timers via the Timers plugin.
	end
end

function refresh_keybindings()
	if player.sub_job == 'NIN' then
		send_command('bind @1 input /ma "Utsusemi: Ni" <me>')
	else
		send_command('bind @1 input /ma "Blink" <me>')
	end
	if player.sub_job == 'NIN' then
		send_command('bind @2 input /ma "Utsusemi: Ichi" <me>')
	elseif player.sub_job == 'BLM' then
		send_command('bind @2 input /ma "Aspir II" <t>')
	else
		send_command('unbind @2')
	end
	send_command('bind @3 input /ma Aspir <t>')
	send_command('bind @4 input /ma "Aquaveil" <me>')
	send_command('bind @5 input /ma "Phalanx" <me>')
	send_command('bind @6 input /ma "Stoneskin" <me>')
	send_command('bind @7 input /ma "Ice Spikes" <me>')
	send_command('unbind @8')
	if player.main_job == 'RDM' then
		send_command('bind @8 input /ja "Composure" <me>')
	elseif player.main_job == 'WHM' then
		send_command('bind @8 input /ja "Afflatus Solace" <me>')
	end
	send_command('bind @9 input /ma "Sneak" <t>')
	send_command('bind @0 input /ma "Invisible" <t>')
	
	send_command('bind @` input /ma "Stun" <t>')
	
	send_command('bind ^= gs c scholar light')				--Light Arts / Addendum: White
	send_command('bind != gs c scholar dark')				--Dark Arts / Addendum: Black
	send_command('bind ^` gs c scholar cost')				--Penury / Parsimony
	send_command('bind !` gs c scholar speed')				--Celerity / Alacrity
	send_command('bind @F1 gs c scholar accuracy')			--Altruism / Focalization
	send_command('bind @F2 gs c scholar power')				--Rapture / Ebullience
	send_command('bind @F3 gs c scholar enmity')			--Tranquility / Equanimity
	send_command('bind @F4 gs c scholar duration')			--Perpetuance [Light only]
	send_command('bind !a gs c scholar aoe')				--Accession / Manifestation
	send_command('bind ^a gs c scholar aoe')				--Accession / Manifestation
	send_command('bind !s input /ja Sublimation <me>')
	send_command('bind ^s input /ja Sublimation <me>')
end

function set_modes()
	options.CastingModes = {'Normal', 'Resistant', 'Proc'}
	options.OffenseModes = {'Magic', 'Melee', 'Skillup'}
	options.DefenseModes = {'Normal'}
	options.WeaponskillModes = {'Normal'}
	options.IdleModes = {'Normal', 'Speedy'}
	options.RestingModes = {'Normal'}
	options.PhysicalDefenseModes = {'PDT'}
	options.MagicalDefenseModes = {'MDT'}

	state.Defense.PhysicalMode = 'PDT'
	state.OffenseMode = 'Magic'
	state.IdleMode = 'Speedy'
	state.CastingMode = 'Normal'
end

--========================================================================================================================
--												Utility Functions
--========================================================================================================================

-- Function to display the current relevant user state when doing an update.
-- Return true if display was handled, and you don't want the default info shown.
function display_current_job_state(eventArgs)
	local strats = ''
	if player.main_job == 'SCH' or player.sub_job == 'SCH' then
		update_stratagem_count()
		strats = ' | '..state.stratagems..' stratagems available'
	end
	local defStr = 'Standard'
	if state.Defense.Active then
		local defMode = state.Defense.PhysicalMode
		if state.Defense.Type == 'Magical' then
			defMode = state.Defense.MagicalMode
		end
		defStr = defMode
	end
	add_to_chat(122, windower.ffxi.get_position()..' | Mode: '..state.OffenseMode..' | Idle: '..state.IdleMode..' | Defense: '..defStr..' | Speed: '..getMovementSpeed()..strats)
	eventArgs.handled = true
end

--========================================================================================================================
--												Misc Event Handlers
--========================================================================================================================

function job_self_command(cmdParams, eventArgs)
	if cmdParams[1]:lower() == 'scholar' then
		handle_strategems(cmdParams)
		eventArgs.handled = true
	end
end

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue)
	if stateField == 'OffenseMode' then
		if newValue == 'Melee' or newValue == 'Skillup' then
			handle_equipping_gear(player.status)
			disable('main','sub')
		else
			enable('main','sub')
		end
	elseif stateField == 'Reset' then
		if state.OffenseMode == 'Magic' then
			enable('main','sub')
		end
	end
end