local animDict = "anim@scripted@freemode@ig5_collect_weapons@heeled@"
local animName = "collect_weapon_1h"

local function loadAnimDict(dict)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(100)
    end
end


local function inZone(value)
    SendNUIMessage({
        action = 'showZone',
        inzone = value
    })
end


for k, v in pairs(Config.Recolectas) do
    local point = lib.points.new({
        coords = v.Coords,  
        distance = 50,
    })

    if Config.ShowMessageWhileNearby then

        function point:onEnter()
            inZone(true)
        end

        function point:onExit()
            inZone(false)
        end
        
    end

    function point:nearby()
        DrawMarker(1, v.Coords.x, v.Coords.y, v.Coords.z - 0.98, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 4.0, 4.0, 0.5, 40, 150, 150, 250, false, true, 2, false, nil, nil, false)

        if self.currentDistance < 3  then
            ESX.ShowHelpNotification('Press [E] to collect ' .. v.Name)
        end

        if self.currentDistance < 3 and IsControlJustReleased(0, 38) then
            loadAnimDict(animDict)
            
            if HasAnimDictLoaded(animDict) then
                TaskPlayAnim(cache.ped, animDict, animName, 8.0, -8.0, -1, 49, 0, true, true, true)
            end

            SendNUIMessage({
                action = 'show',
                title = 'Recolectando',
                name = v.Name,
                remove = v.Quantity,
                time = v.time
            })
            Wait(v.Time)
            
            local success = lib.callback.await('perri_drugs:getdrug', false, v.Name)

            ClearPedTasks(cache.ped)

            if not success then
                return ESX.ShowNotification('Unable to collect ' .. v.Name)
            end

            ESX.ShowNotification('You collected ' .. v.Name)
        end
    end

end

for k, v in pairs(Config.Procesos) do
    local point = lib.points.new({
        coords = v.Coords,  
        distance = 50,
    })

    if Config.ShowMessageWhileNearby then

        function point:onEnter()
            inZone(true)
        end

        function point:onExit()
            inZone(false)
        end
        
    end

    function point:nearby()
        DrawMarker(1, v.Coords.x, v.Coords.y, v.Coords.z - 0.98, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 4.0, 4.0, 0.5, 40, 150, 150, 250, false, true, 2, false, nil, nil, false)
      
        if self.currentDistance < 3 then
            ESX.ShowHelpNotification('Press [E] to process ' .. v.Name .. ' for ' .. v.ChangeTo)
        end

        if self.currentDistance < 3 and IsControlJustReleased(0, 38) then
            loadAnimDict(animDict)

            if HasAnimDictLoaded(animDict) then
                TaskPlayAnim(cache.ped, animDict, animName, 8.0, -8.0, -1, 49, 0, true, true, true)
            end

            SendNUIMessage({
                action = 'show',
                title = 'Procesando',
                name = v.Name,
                remove = v.Remove,
                time = v.Time
            })

            Wait(v.Time)

            local success = lib.callback.await('perri_drugs:procesar', false, v.Name)

            ClearPedTasks(cache.ped)

            if not success then
                return ESX.ShowNotification('You do not have ' .. v.Name .. ' To pick up')
            end
            
            ESX.ShowNotification('Processed ' .. v.Name .. ' to ' .. v.ChangeTo)

        end

    end
end
