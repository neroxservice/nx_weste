if config.Core == 'QB' then
    Core = exports["qb-core"]:GetCoreObject()
else
    Core = exports["es_extended"]:GetSharedObject()
end

function getPlayerFromId(source)
    if config.Core == 'QB' then
        return Core.Functions.GetPlayer(source)
    else
        return Core.getPlayerFromId(source)
    end
end

function showNotification(message, type)
    if config.Core == 'QB' then
        Core.Functions.Notify(message, type)
    else
        TriggerEvent('esx:showNotification', message)
    end
end

function registerItems(itemName, useCallback)
    if config.Core == 'QB' then
        return Core.Functions.CreateUseableItem(itemName, function(source)
            useCallback(source)
        end)
    else
        return Core.RegisterUsableItem(itemName, function(source)
            useCallback(source)
        end)
    end
end
