-----------------------------------------------------------------------------------------------------------
--[[
	Author: Ragnarok.Lorand
	GearSwap defaults
--]]
-----------------------------------------------------------------------------------------------------------

function define_defaults()
	sets = {}
	sets.precast = {}
	sets.precast.FC = {}
	sets.precast.JA = {}
	
	sets.midcast = {}
	sets.idle = {}
	sets.engaged = {}
	sets.ws = {}
	sets.defense = {}
	sets.def = {}
	sets.def.m = {}
	sets.def.p = {}
	sets.buffs = {}
	
	state = {}
	
	setMode('offense', 'Normal')
	setMode('accuracy', 'Normal')
	setMode('casting', 'Normal')
	setMode('defense', 'Normal')
	setMode('ranged', 'Normal')
	setMode('idle', 'Normal')
	setMode('ConserveMP', true)
	setMode('autoPenury', false)
	
	options = {}
	options.use_ftp_neck = true
	options.use_ftp_waist = false
	options.useTwilightCape = false
	options.useObi = true

	gear = {}
	gear.instruments = {}
	gear.instruments.default = 'Eminent Flute'
	gear.instruments.multiSong = 'Terpander'
	
	
	--addModeOption(mode, option)
	
	vars = {}
	vars.CurePotency = {[1]=87, [2]=199, [3]=438, [4]=816, [5]=1056, [6]=1311}
	
	state.warned = false
	options.ammo_warning_limit = 15
	timer_reg = {}
end

function set_modes()
	addMode('idle', {'speedy', 'normal'})
	addMode('defense', {'normal', 'PDT', 'MDT'})
	
	--Note: The first value in the table passed to addMode becomes the default value for that mode.
	if S{'WHM', 'BLM', 'RDM', 'SCH', 'BRD'}:contains(player.main_job) then
		addMode('casting', {'Normal', 'Resistant', 'Proc'})
		addMode('offense', {'Magic', 'Melee', 'Skillup'})
		if player.main_job == 'SCH' then
			addMode('idle', {'fun', 'speedy', 'normal'})
		end
	elseif S{'RNG'}:contains(player.main_job) then
		addMode('offense', {'Gun', 'Bow', 'Melee'})
		addMode('ranged', {'5-hit', 'acc'})
	elseif S{'MNK'}:contains(player.main_job) then
		addMode('offense', {'Normal_A', 'Normal_B', 'Normal_C',	'HitMoar', 'Tank', 'TankAcc', 'Mix'})
		addMode('accuracy', {'Normal', 'Medium', 'High'})
	elseif S{'NIN'}:contains(player.main_job) then
		addMode('offense', {'HasteII', 'HasteII++', 'HasteII_Acc', 'HasteII++_Acc', 'Tank'})
		addMode('accuracy', {'Normal', 'Medium', 'High'})
		addMode('casting', {'Normal', 'Resistant', 'Proc'})
	elseif S{'PLD'}:contains(player.main_job) then
		addMode('offense', {'Normal', 'TankP', 'TankM'})
		addMode('idle', {'Showoff', 'PDT', 'MDT', 'normal', 'speedy'})
	elseif S{'SAM'}:contains(player.main_job) then
		addMode('offense', {'4-Hit', '5-Hit', '5-Acc'})
		addMode('idle', {'speedy', 'reraise', 'normal'})
	elseif S{'THF'}:contains(player.main_job) then
		addMode('offense', {'TH', 'Normal', 'Acc'})
		addMode('ranged', {'TH', 'Normal', 'Acc'})
		addMode('treasure', {'None','TH'})
	end
	
	if player.main_job == 'BRD' then
		addMode('Daurdabla', {'None','Daurdabla','Dummy'})
	end
	
end

function set_keybinds()
	windower.send_command('alias equip gs c equip')
	windower.send_command('bind ^d gs c set defense PDT')
	windower.send_command('bind !d gs c set defense MDT')
	windower.send_command('bind @d gs c reset defense')
	
	windower.send_command('bind @e gs c update user')
	windower.send_command('bind @w equip engaged')
	windower.send_command('bind @s gs c cycle offense')
	windower.send_command('bind @q gs c cycle idle')
	windower.send_command('bind @c gs c cycle casting')
	windower.send_command('bind @r gs c cycle ranged')
	
	windower.send_command('bind @F12 du blinking self always')
	
	if S{player.main_job, player.sub_job}:contains('SCH') then
		windower.send_command('bind ^= gs c scholar light')				--Light Arts / Addendum: White
		windower.send_command('bind != gs c scholar dark')				--Dark Arts / Addendum: Black
		windower.send_command('bind ^` gs c scholar cost')				--Penury / Parsimony
		windower.send_command('bind !` gs c scholar speed')				--Celerity / Alacrity
		windower.send_command('bind @F1 gs c scholar accuracy')			--Altruism / Focalization
		windower.send_command('bind @F2 gs c scholar power')				--Rapture / Ebullience
		windower.send_command('bind @F3 gs c scholar enmity')			--Tranquility / Equanimity
		windower.send_command('bind @F4 gs c scholar duration')			--Perpetuance [Light only]
		windower.send_command('bind !a gs c scholar aoe')				--Accession / Manifestation
		windower.send_command('bind ^a gs c scholar aoe')				--Accession / Manifestation
		windower.send_command('bind !s input /ja Sublimation <me>')
		windower.send_command('bind ^s input /ja Sublimation <me>')
	else
		windower.send_command('unbind ^=;unbind !=')
		windower.send_command('unbind !a;unbind ^a;unbind !s;unbind ^s')
	end
	
	if S{'WHM', 'BLM', 'RDM', 'SCH', 'BRD'}:contains(player.main_job) then
		windower.send_command('bind @` input /ma "Stun" <t>')
		
		if player.sub_job == 'NIN' then
			windower.send_command('bind @1 input /ma "Utsusemi: Ni" <me>')
		else
			windower.send_command('bind @1 input /ma "Blink" <me>')
		end
		if player.sub_job == 'NIN' then
			windower.send_command('bind @2 input /ma "Utsusemi: Ichi" <me>')
		elseif S{player.main_job, player.sub_job}:contains('BLM') then
			windower.send_command('bind @2 input /ma "Aspir II" <t>')
		else
			windower.send_command('unbind @2')
		end
		windower.send_command('bind @3 input /ma Aspir <t>')
		windower.send_command('bind @4 input /ma "Aquaveil" <me>')
		windower.send_command('bind @5 input /ma "Phalanx" <me>')
		windower.send_command('bind @6 input /ma "Stoneskin" <me>')
		windower.send_command('bind @7 input /ma "Ice Spikes" <me>')
		
		windower.send_command('unbind @8')
		if player.main_job == 'RDM' then
			windower.send_command('bind @8 input /ja "Composure" <me>')
		elseif player.main_job == 'WHM' then
			windower.send_command('bind @8 input /ja "Afflatus Solace" <me>')
		elseif player.main_job == 'BRD' then
			windower.send_command('bind @8 input /ja "Pianissimo" <me>')
		elseif player.main_job == 'BLM' then
			windower.send_command('bind @8 input /ja "Manawell" <me>')
		end
		
		windower.send_command('bind @9 input /ma "Sneak" <t>')
		windower.send_command('bind @0 input /ma "Invisible" <t>')
	elseif S{'MNK', 'NIN', 'SAM', 'PLD', 'RNG', 'COR', 'THF'}:contains(player.main_job) then
		if player.main_job == 'NIN' then
			windower.send_command('bind ^` input /ja "Innin" <me>')
			windower.send_command('bind !` input /ja "Yonin" <me>')
		elseif player.main_job == 'MNK' then
			windower.send_command('unbind ^`')
			windower.send_command('bind !` input /ja "Perfect Counter" <me>')
		elseif player.main_job == 'SAM' then
			windower.send_command('bind @` input /ja "Blade Bash" <t>')
			windower.send_command('bind ^` input /ja "Hasso" <me>')
			windower.send_command('bind !` input /ja "Seigan" <me>')
		elseif player.main_job == 'PLD' then
			windower.send_command('bind ^` input /ja "Divine Emblem" <me>')
			windower.send_command('bind !` input /ja "Shield Bash" <t>')
		elseif player.main_job =='RNG' then
			windower.send_command('bind @` input /ja "Shadowbind" <t>')
			windower.send_command('bind ^` input /ja "Sharpshot" <me>')
			windower.send_command('bind !` input /ja "Velocity Shot" <me>')
		end
		
		windower.send_command('bind @1 input /ma "Utsusemi: Ni" <me>')
		windower.send_command('bind @2 input /ma "Utsusemi: Ichi" <me>')
		if player.main_job == 'PLD' then
			windower.send_command('bind @4 input /ma "Reprisal" <me>')
			windower.send_command('bind @5 input /ma "Phalanx" <me>')
			windower.send_command('bind @6 input /ma "Enlight" <me>')
			windower.send_command('unbind @7')
		elseif S{'RNG', 'COR'}:contains(player.main_job) then
			if player.main_job == 'RNG' then
				windower.send_command('bind @4 input /ja "Bounty Shot" <t>')
			else
				windower.send_command('unbind @4')
			end
			windower.send_command('bind @5 gs c cycle RangedMode')
			windower.send_command('unbind @6;unbind @7')
		else
			windower.send_command('unbind @4;unbind @5;unbind @6;unbind @7')
		end
		windower.send_command('bind @8 input /ja "Spectral Jig" <me>')
		windower.send_command('bind @9 input /ma "Monomi: Ichi" <me>')
		windower.send_command('bind @0 input /ma "Tonko: Ni" <me>')
		
		if player.main_job == 'THF' then
			windower.send_command('bind ^= gs c cycle treasuremode')
		end
		
		if player.sub_job == 'DNC' then
			windower.send_command('bind @` input /ja "Violent Flourish" <t>')
			windower.send_command('bind @3 input /ja "Animated Flourish" <t>')
		elseif player.sub_job == 'WAR' then
			windower.send_command('bind @3 input /ja Provoke <t>')
		elseif player.main_job == 'RNG' then
			windower.send_command('bind @3 input /ja "Scavenge" <me>')
		else
			windower.send_command('unbind @3')
		end
	end
	
	if player.main_job == 'BRD' then
		windower.send_command('bind @2 gs c cycle DaurdablaMode')
		windower.send_command('bind ^` input /ja "Nightingale" <me>')
		windower.send_command('bind !` input /ja "Troubadour" <me>')
	end
end

function binds_on_unload()
	windower.send_command('unbind @1;unbind @2;unbind @3;unbind @4;unbind @5')
	windower.send_command('unbind @6;unbind @7;unbind @8;unbind @9;unbind @0')
	windower.send_command('unbind ^=;unbind !=')
	windower.send_command('unbind ^`;unbind !`;unbind @`')
	windower.send_command('unbind @F1;unbind @F2;unbind @F3;unbind @F4')
	windower.send_command('unbind !a;unbind ^a')
	windower.send_command('unbind !s;unbind ^s')
end