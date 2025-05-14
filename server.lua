if config.Core == 'QB' then
    Core = exports["qb-core"]:GetCoreObject()
else
    Core = exports["es_extended"]:GetSharedObject()
end

QBCore = exports['qb-core']:GetCoreObject()

function getPlayerFromId(source)
    if config.Core == 'QB' then
        return Core.Functions.GetPlayer(source)
    else
        return Core.getPlayerFromId(source)
    end
end

QBCore.Functions.CreateUseableItem(config.Items, function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("nx_weste:toggleVest", source, item.name)
end)


QBCore.Functions.CreateUseableItem(config.Items2, function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("nx_weste:toggleVest2", source, item.name)
end)

local green = "\27[32m"
local blue = "\27[34m"
local yellow = "\27[33m"
local magenta = "\27[35m"
local cyan = "\27[36m"
local red = "\27[31m"
local reset = "\27[0m"

local currentVersion = "1.0.2"

local githubUser = "neroxservice"
local githubRepo = "nx_weste"

local function checkVersion()
    local url = ("https://api.github.com/repos/%s/%s/releases/latest"):format(githubUser, githubRepo)
    PerformHttpRequest(url, function(statusCode, response, headers)
        if statusCode == 200 and response then
            local data = json.decode(response)
            if data and data.tag_name then
                local latestVersion = data.tag_name
                local changelog = data.body or "Kein Changelog vorhanden."

                print(yellow .. "--------------------------------------------------------" .. reset)
                print(magenta .. "[nx_westen]" .. reset)
                print(cyan .. "📦 Aktuelle Version: " .. blue .. currentVersion .. reset)
                print(cyan .. "🔄 Verfügbare Version: " .. blue .. latestVersion .. reset)

                if currentVersion == latestVersion then
                    print(green .. "✅ Du verwendest die neueste Version." .. reset)
                else
                    print("")
                    print(red .. "⚠️ Eine neue Version ist verfügbar!" .. reset)
                    print("🔗 " ..
                        cyan ..
                        "Update hier: " ..
                        blue .. "https://github.com/" .. githubUser .. "/" .. githubRepo .. "/releases/latest" .. reset)
                    print("")
                    print(magenta .. "📋 Änderungen in dieser Version:" .. reset)
                    for line in changelog:gmatch("[^\r\n]+") do
                        print("  " .. cyan .. " " .. line .. reset)
                    end
                end
                print(yellow .. "--------------------------------------------------------" .. reset)
            else
            end
        else
            print(red .. "[Fehler] Konnte keine Verbindung zu GitHub aufbauen (Code: " .. statusCode .. ")." .. reset)
        end
    end, "GET", "", { ["User-Agent"] = "FiveMResourceVersionChecker" })
end

AddEventHandler("onResourceStart", function(resourceName)
    if resourceName == GetCurrentResourceName() then
        Citizen.SetTimeout(500, function()
            checkVersion()
        end)
    end
end)
