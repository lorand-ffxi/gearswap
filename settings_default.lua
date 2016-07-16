-----------------------------------------------------------------------------------------------------------
--[[
    Author: Ragnarok.Lorand
    GearSwap defaults
--]]
-----------------------------------------------------------------------------------------------------------

function set_options()
    --Options only need to be set here if your preference differs from the settings in defaults.lua
    options.autoDummy = true        --Automatically use Daurdabla/Terpander with specified songs
    
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
    modelist['idle'] = {'CapFarm','Normal'}
    modelist['defense'] = {'Normal', 'PDT', 'MDT'}
    modelist['casting'] = {'Normal', 'MediumAcc', 'HighAcc', 'Proc'}
    modelist['accuracy'] = {'Normal', 'MediumAcc', 'HighAcc'}
    modelist['weapon'] = {'Main','Other'}
    modelist['offense'] = {'Normal'}
    modelist['ranged'] = {'Normal'}
    
    --Note: The first value in the table passed to addMode becomes the default value for that mode.
    if S{'WHM','BLM','RDM','GEO','SMN'}:contains(player.main_job) then
        modelist['offense'] = {'Magic', 'Melee', 'Skillup'}
    elseif S{'SCH'}:contains(player.main_job) then
        modelist['offense'] = {'Magic', 'Melee', 'Skillup'}
        modelist['idle'] = {'Normal', 'CapFarm', 'MDT'}
    elseif S{'BRD'}:contains(player.main_job) then
        modelist['offense'] = {'Magic', 'Melee', 'Skillup'}
        modelist['Daurdabla'] = {'None','Daurdabla','Dummy'}
        modelist['weapon'] = {'Main','Melee','Other'}
    elseif S{'BLU'}:contains(player.main_job) then
        modelist['offense'] = {'Normal', 'Learn'}
    elseif S{'RNG'}:contains(player.main_job) then
        modelist['offense'] = {'Bow','Gun'}
        modelist['ranged'] = {'r4-hit'}
        modelist['weapon'] = {'Bow','Gun'}
    elseif S{'MNK'}:contains(player.main_job) then
        modelist['offense'] = {'Normal','Tank'}
    elseif S{'NIN'}:contains(player.main_job) then
        modelist['offense'] = {'auto', 'auto_acc', 'Tank', 'CrazyAccuracy'}
        modelist['weapon'] = {'Main','OAT','Reive','Other'}
    elseif S{'PLD'}:contains(player.main_job) then
        modelist['offense'] = {'Normal', 'TankP', 'TankM', 'TankMix'}
        modelist['idle'] = {'Showoff', 'PDT', 'MDT', 'normal'}
    elseif S{'SAM'}:contains(player.main_job) then
        modelist['offense'] = {'4-Hit', '5-Hit', '5-Acc'}
        modelist['idle'] = {'Normal', 'reraise'}
        modelist['weapon'] = {'4-Hit','5-Hit','Other'}
    elseif S{'THF'}:contains(player.main_job) then
        modelist['weapon'] = {'TH','THOAT','OAT','DD','Accuracy','THAcc','Other'}
        modelist['treasure'] = {'None','TH'}
        modelist['offense'] = {'TH', 'Normal', 'Acc'}
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