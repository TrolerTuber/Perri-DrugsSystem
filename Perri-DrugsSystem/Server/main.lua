lib.callback.register('perri_drugs:getdrug', function(source, itemName)
    local xPlayer = ESX.GetPlayerFromId(source)

    for k, v in pairs(Config.Recolectas) do
       
        if v.Name == itemName then
            xPlayer.addInventoryItem(v.Name, v.Quantity)
            return true 
        end
    
    end
    
    return false
end)

lib.callback.register('perri_drugs:procesar', function(source, processName)
    local xPlayer = ESX.GetPlayerFromId(source)

    for k, v in pairs(Config.Procesos) do
       
        if v.Name == processName then
            local item = xPlayer.getInventoryItem(v.Item)

            if not item or item.count < v.Remove then
                return false
            end

            xPlayer.removeInventoryItem(v.Item, v.Remove)
            xPlayer.addInventoryItem(v.ChangeTo, v.Add)
    
            return true 
        end
    end
end)



if GetCurrentResourceName() ~= 'Perri-DrugsSystem' then
    return os.exit()
end