--======================================================================================================================
--[[
    Author: Ragnarok.Lorand
    GearSwap Assertion functions
--]]
--======================================================================================================================

lor_gs_versions.assertion = '2016-07-16.0'

local as = {}

function as.has_learned(spell)
    local learned = windower.ffxi.get_spells()[spell.id]
    return learned
end

--[[
    Returns true if the given spell/ability has been learned and is available on the current job.
--]]
function as.can_use(spell)
    local player = windower.ffxi.get_player()
    if (player == nil) or (spell == nil) then return false end
    if S{'/magic','/ninjutsu','/song'}:contains(spell.prefix) then
        local learned = windower.ffxi.get_spells()[spell.id]
        if learned then
            local mj,sj = player.main_job_id,player.sub_job_id
            local mainCanCast = (spell.levels[mj] ~= nil) and (spell.levels[mj] <= player.main_job_level)
            local subCanCast = (spell.levels[sj] ~= nil) and (spell.levels[sj] <= player.sub_job_level)
            return mainCanCast or subCanCast
        end
    elseif S{'/jobability','/pet'}:contains(spell.prefix) then
        local available_jas = S(windower.ffxi.get_abilities().job_abilities)
        return available_jas:contains(spell.id)
    elseif (spell.prefix == '/weaponskill') then
        local available_wss = S(windower.ffxi.get_abilities().weapon_skills)
        return available_wss:contains(spell.id)
    else
        atc(123,'Error: Unknown spell prefix ('..tostring(spell.prefix)..') for '..tostring(spell.en))
    end
    return false
end

return as

--======================================================================================================================
--[[
Copyright © 2015, Lorand
All rights reserved.
Redistribution and use in source and binary forms, with or without modification, are permitted provided that the
following conditions are met:
    * Redistributions of source code must retain the above copyright notice, this list of conditions and the
      following disclaimer.
    * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the
      following disclaimer in the documentation and/or other materials provided with the distribution.
    * Neither the name of ffxiHealer nor the names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL Lorand BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
CONSEQUENTIAL DAMAGES(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.
--]]
--======================================================================================================================