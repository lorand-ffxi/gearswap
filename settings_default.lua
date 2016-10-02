-----------------------------------------------------------------------------------------------------------
--[[
    Author: Ragnarok.Lorand
    GearSwap defaults
--]]
-----------------------------------------------------------------------------------------------------------

lor_gs_versions.settings_default = '2016-09-24.0'

function set_options()
    --Options only need to be set here if your preference differs from the settings in defaults.lua
    options.autoDummy = true        --Automatically use Daurdabla/Terpander with specified songs
    
    if player.name == 'Lorand' then
        gear.taeonTAhead = {name="Taeon Chapeau", augments={'Accuracy+18 Attack+18','"Triple Atk."+2','Crit. hit damage +2%'}}
        gear.taeonHasteBody = {name="Taeon Tabard", augments={'Accuracy+17 Attack+17','Haste+2','STR+6 DEX+6'}}
        gear.taeonTAhands = {name="Taeon Gloves", augments={'Accuracy+15 Attack+15','"Triple Atk."+2','DEX+7'}}
        gear.taeonDWhands = {name="Taeon Gloves", augments={'Accuracy+25','"Dual Wield"+4','STR+7 DEX+7'}}
        gear.taeonTAlegs = {name="Taeon Tights", augments={'Accuracy+15 Attack+15','"Triple Atk."+2','STR+7 DEX+7'}}
        gear.taeonDWfeet = {name="Taeon Boots", augments={'Accuracy+17 Attack+17','"Dual Wield"+5','STR+6 DEX+6'}}
        gear.nagaAccFeet = {name="Naga Kyahan", augments={'STR+10','Accuracy+15','"Subtle Blow"+7'}}
        gear.hercHead = {name="Herculean Helm", augments={'Accuracy+19 Attack+19','"Dual Wield"+3','STR+6','Accuracy+13','Attack+13'}}
        gear.hercHands = {name="Herculean Gloves", augments={'Accuracy+26','"Triple Atk."+3','AGI+6'}}
        gear.hercLegs = {name="Herculean Trousers", augments={'Accuracy+21 Attack+21','Crit. hit damage +3%','STR+9','Accuracy+9','Attack+8'}}
        gear.hercFeet = {name="Herculean Boots", augments={'Accuracy+18','"Triple Atk."+3','Attack+10'}}
    elseif player.name == 'Kaley' then
        gear.darkRing1 = {name="Dark Ring", augments={'Phys. dmg. taken -5%','Breath dmg. taken -4%','Magic dmg. taken -3%'}}
    end
    
    autoDummySongs = S{"Army's Paeon"}
    
    instruments.effects.Linos = {['All']=3} --Base: +1; Augment: +2
    
    pet_moves.buff['CourierCarrie'] = 'Metallic Body'
    pet_moves.buff['WarlikePatrick'] = 'Secretion'
    
    pet_moves.attack['CourierCarrie'] = 'Big Scissors'
    pet_moves.attack['BlackbeardRandy'] = 'Claw Cyclone'
    pet_moves.attack['FlowerpotMerle'] = 'Head Butt'
    pet_moves.attack['WarlikePatrick'] = 'Brain Crush'
    
    pet_moves.aoe['WarlikePatrick'] = 'Fireball'
end

function set_modes()
    local modelist = {}
    modelist['idle'] = {'CapFarm','Normal','oldschool'}
    modelist['defense'] = {'Normal', 'PDT', 'MDT'}
    modelist['casting'] = {'Normal', 'MediumAcc', 'HighAcc', 'Proc'}
    modelist['accuracy'] = {'Normal', 'MediumAcc', 'HighAcc'}
    modelist['weapon'] = {'Main','Other'}
    modelist['offense'] = {'Normal'}
    modelist['ranged'] = {'Normal'}
    
    --Note: The first value in the table passed to addMode becomes the default value for that mode.
    if S{'WHM','BLM','RDM','GEO','SMN'}:contains(player.main_job) then
        modelist['offense'] = {'Magic', 'Melee', 'Skillup', 'DW'}
    elseif S{'SCH'}:contains(player.main_job) then
        modelist['offense'] = {'Magic', 'Melee', 'Skillup'}
        modelist['idle'] = {'Normal', 'CapFarm', 'MDT'}
    elseif S{'BRD'}:contains(player.main_job) then
        modelist['offense'] = {'Magic', 'Melee', 'Skillup'}
        modelist['Daurdabla'] = {'None','Daurdabla','Dummy'}
        modelist['weapon'] = {'Main','Melee','Other'}
    elseif S{'BLU'}:contains(player.main_job) then
        modelist['offense'] = {'auto', 'Learn', 'CrazyAccuracy'}
        modelist['idle'] = {'CapFarm','Normal','Learn'}
        modelist['weapon'] = {'Main','OAT','Magic','Other'}
    elseif S{'RNG'}:contains(player.main_job) then
        modelist['offense'] = {'Bow','Gun'}
        modelist['ranged'] = {'r4-hit'}
        modelist['weapon'] = {'Bow','Gun'}
    elseif S{'MNK'}:contains(player.main_job) then
        modelist['offense'] = {'Normal','Tank'}
    elseif S{'NIN'}:contains(player.main_job) then
        modelist['offense'] = {'auto', 'Tank', 'CrazyAccuracy'}
        modelist['weapon'] = {'Main','Reverse','OAT','Reive','Sword','Dagger','Other'}
    elseif S{'PLD'}:contains(player.main_job) then
        modelist['offense'] = {'Tankish', 'TankP', 'TankM', 'TankMix', 'DD'}
        modelist['idle'] = {'normal', 'PDT', 'MDT', 'reraise'}
        modelist['weapon'] = {'Aegis','Priwen','Other'}
    elseif S{'SAM'}:contains(player.main_job) then
        modelist['offense'] = {'4-Hit', '5-Hit', '5-Acc'}
        modelist['idle'] = {'Normal', 'reraise'}
        modelist['weapon'] = {'4-Hit','5-Hit','Other'}
    elseif S{'THF'}:contains(player.main_job) then
        modelist['weapon'] = {'TH','THOAT','Accuracy','DD','OAT','Other'}
        modelist['treasure'] = {'None','TH'}
        modelist['offense'] = {'TH', 'auto', 'Normal'}
        modelist['ranged'] = {'TH', 'Normal', 'Acc'}
    elseif S{'COR'}:contains(player.main_job) then
        modelist['weapon'] = {'Gun'}
        modelist['offense'] = {'Normal', 'Accuracy'}
        modelist['ranged'] = {'Normal', 'Accuracy'}
    end
    
    --Process the modelist and set modes accordingly
    for modeName, options in pairs(modelist) do
        addMode(modeName, options)
    end
end

function set_keybinds()
    --'^' = [ctrl]      '!' = [alt]     '@' = [win]
    local mj = player.main_job
    local sj = player.sub_job
    local keybinds = {}
    keybinds['^d'] = 'gs c set defense PDT'     --Enter Physical defense mode
    keybinds['!d'] = 'gs c set defense MDT'     --Enter Magic defense mode
    keybinds['@d'] = 'gs c reset defense'       --Reset the defense mode
    keybinds['@e'] = 'gs c update user'     --Equip whatever should be worn for the current state
    keybinds['@w'] = 'equip engaged'        --Equip the current proper engaged set
    keybinds['@a'] = 'gs c cycle accuracy'      --Cycle through accuracy modes
    keybinds['@s'] = 'gs c cycle offense'       --Cycle through offense modes
    keybinds['@q'] = 'gs c cycle idle'      --Cycle through idle modes
    keybinds['@c'] = 'gs c cycle casting'       --Cycle through casting modes
    keybinds['@r'] = 'gs c cycle ranged'        --Cycle through ranged modes
    keybinds['@v'] = 'gs c cycle weapon'        --Cycle through weapon modes
    keybinds['@F12'] = 'du blinking self always'    --Toggle DressUp's prevention of own character blinking always
    keybinds['@i'] = 'gs c toggle noIdle'       --Toggle prevention of aftercast equipment use
    keybinds['@f'] = 'hb f'             --Toggle HealBot's Follow feature
    keybinds['@t'] = 'gs c toggle tank'     --Overwritten by Treasure mode when THF

    --Job-specific keybinds
    if S{mj,sj}:contains('SCH') then
        keybinds['^='] = 'gs c scholar light'       --Light Arts / Addendum: White
        keybinds['!='] = 'gs c scholar dark'        --Dark Arts / Addendum: Black
        keybinds['^`'] = 'gs c scholar cost'        --Penury / Parsimony
        keybinds['!`'] = 'gs c scholar speed'       --Celerity / Alacrity
        keybinds['@F1'] = 'gs c scholar accuracy'   --Altruism / Focalization
        keybinds['@F2'] = 'gs c scholar power'      --Rapture / Ebullience
        keybinds['@F3'] = 'gs c scholar enmity'     --Tranquility / Equanimity
        keybinds['@F4'] = 'gs c scholar duration'   --Perpetuance [Light only]
        keybinds['@F5'] = 'gs c scholar ws'     --Immanence [Dark only]
        keybinds['!a'] = 'gs c scholar aoe'     --Accession / Manifestation
        keybinds['^a'] = 'gs c scholar aoe'     --Accession / Manifestation
        keybinds['!s'] = 'input /ja Sublimation <me>'
        keybinds['^s'] = 'input /ja Sublimation <me>'
    end
    if S{mj,sj}:contains('NIN') then
        keybinds['@9'] = 'input /ma "Monomi: Ichi" <me>'
        keybinds['@0'] = 'input /ma "Tonko: Ni" <me>'
    end
    if S{mj,sj}:contains('WAR') then
        keybinds['@3'] = 'input /ja Provoke <t>'
    end
    if S{mj,sj}:contains('DNC') then
        keybinds['@`'] = 'input /ja "Violent Flourish" <t>'
        keybinds['@3'] = 'input /ja "Animated Flourish" <t>'
        keybinds['@8'] = 'input /ja "Spectral Jig" <me>'
    end
    if table.intersects({mj,sj}, {'WHM','RDM','SCH'}) then
        keybinds['@1'] = 'input /ma "Blink" <me>'
        keybinds['@4'] = 'input /ma "Aquaveil" <me>'
        keybinds['@5'] = 'input /ma "Phalanx" <me>'
        keybinds['@6'] = 'input /ma "Stoneskin" <me>'
        keybinds['@7'] = 'input /ma "Ice Spikes" <me>'
        keybinds['@9'] = 'input /ma "Sneak" <t>'
        keybinds['@0'] = 'input /ma "Invisible" <t>'
    end
    if S{mj,sj}:contains('NIN') then
        keybinds['@1'] = 'input /ma "Utsusemi: Ni" <me>'
        keybinds['@2'] = 'input /ma "Utsusemi: Ichi" <me>'
    end
    if S{mj,sj}:contains('BLM') then
        keybinds['@`'] = 'input /ma "Stun" <t>'
        keybinds['@2'] = 'input /ma "Aspir II" <t>'
        keybinds['@3'] = 'input /ma Aspir <t>'
        keybinds['@7'] = 'input /ma "Ice Spikes" <me>'
    end
    if S{mj,sj}:contains('SAM') then
        keybinds['^`'] = 'input /ja "Hasso" <me>'
        keybinds['!`'] = 'input /ja "Seigan" <me>'
    end
    
    if (mj == 'RDM') then
        keybinds['@8'] = 'input /ja "Composure" <me>'
    elseif (mj == 'WHM') then
        keybinds['@8'] = 'input /ja "Afflatus Solace" <me>'
        keybinds['@m'] = 'input /ja "Afflatus Misery" <me>'
    elseif (mj == 'BRD') then
        keybinds['^`'] = 'input /ja "Nightingale" <me>'
        keybinds['!`'] = 'input /ja "Troubadour" <me>'
        keybinds['@2'] = 'gs c cycle Daurdabla'
        keybinds['@8'] = 'input /ja "Pianissimo" <me>'
    elseif (mj == 'BLM') then
        keybinds['@8'] = 'input /ja "Manawell" <me>'
    elseif (mj == 'NIN') then
        keybinds['^`'] = 'input /ja "Innin" <me>;input /echo NIN Rear DD JA'
        keybinds['!`'] = 'input /ja "Yonin" <me>;input /echo NIN Front Tank JA'
    elseif (mj == 'MNK') then
        keybinds['!`'] = 'input /ja "Perfect Counter" <me>'
    elseif (mj == 'SAM') and (sj ~= 'DNC') then
        keybinds['@`'] = 'input /ja "Blade Bash" <t>'
    elseif (mj == 'PLD') then
        keybinds['^`'] = 'input /ja "Divine Emblem" <me>'
        keybinds['!`'] = 'input /ja "Shield Bash" <t>'
        keybinds['@4'] = 'input /ma "Reprisal" <me>'
        keybinds['@5'] = 'input /ma "Phalanx" <me>'
        keybinds['@6'] = 'input /ma "Enlight" <me>'
    elseif (mj == 'RNG') then
        keybinds['@`'] = 'input /ja "Shadowbind" <t>'
        keybinds['^`'] = 'input /ja "Sharpshot" <me>'
        keybinds['!`'] = 'input /ja "Velocity Shot" <me>'
        keybinds['@3'] = 'input /ja "Scavenge" <me>'
        keybinds['@4'] = 'input /ja "Bounty Shot" <t>'
    elseif (mj == 'BLU') then
        keybinds['^`'] = 'input /ja "Chain Affinity" <me>'
        keybinds['!`'] = 'input /ja "Efflux" <me>'
    elseif (mj == 'THF') then
        keybinds['@t'] = 'gs c cycle treasure'
    elseif (mj == 'COR') then
        keybinds['^`'] = 'input /ja "Snake Eye" <me>'
        keybinds['!`'] = 'input /ja "Double-Up" <me>'
    end
    
    clear_binds()
    windower.send_command('alias equip gs c equip')
    --Process the keybinds list and set them accordingly
    for key_combo,cmd in pairs(keybinds) do
        windower.send_command('bind '..key_combo..' '..cmd)
    end
end

function use_user_settings()
    set_options()
    set_modes()
    set_keybinds()
end