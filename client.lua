local language = config.Locales
local locale = Locales[language]

local wearingVest = false

RegisterNetEvent('nx_weste:toggleVest')
AddEventHandler('nx_weste:toggleVest', function(itemName)
    local playerPed = PlayerPedId()

    if wearingVest then
        local success = lib.progressBar({
            duration = 5000, -- Dauer in Millisekunden
            label = "Warnweste ablegen...",
            useWhileDead = false,
            canCancel = false,
            disable = {
                move = false,
                car = false,
                mouse = false,
                combat = true
            },
            anim = {
                dict = "clothingshirt",
                clip = "try_shirt_positive_d",
                flag = 49
            }
        })

        if success then
            SetPedComponentVariation(playerPed, 9, -1, 0, 0)
            showNotification(locale['unequipped_visual'], "info")
            wearingVest = false
        end
    else
        local success = lib.progressBar({
            duration = 5000, -- Dauer in Millisekunden
            label = "Warnweste überwerfen...",
            useWhileDead = false,
            canCancel = false,
            disable = {
                move = false,
                car = false,
                mouse = false,
                combat = true
            },
            anim = {
                dict = "clothingshirt",
                clip = "try_shirt_positive_d",
                flag = 49
            }
        })

        if success then
            SetPedComponentVariation(playerPed, 9, config.armorVestDrawable, config.armorVestTextures, 0)
            showNotification(locale['equipped_visual'], "success")
            wearingVest = true
        end
    end
end)


RegisterNetEvent('nx_weste:toggleVest2')
AddEventHandler('nx_weste:toggleVest2', function(itemName)
    local playerPed = PlayerPedId()

    if wearingVest then
        local success = lib.progressBar({
            duration = 5000, -- Dauer in Millisekunden
            label = "Warnweste ablegen...",
            useWhileDead = false,
            canCancel = false,
            disable = {
                move = false,
                car = false,
                mouse = true,
                combat = true
            },
            anim = {
                dict = "clothingshirt",
                clip = "try_shirt_positive_d",
                flag = 49
            }
        })

        if success then
            SetPedComponentVariation(playerPed, 9, -1, 0, 0)
            showNotification(locale['unequipped_visual'], "info")
            wearingVest = false
        end
    else
        local success = lib.progressBar({
            duration = 5000, -- Dauer in Millisekunden
            label = "Warnweste überwerfen...",
            useWhileDead = false,
            canCancel = false,
            disable = {
                move = false,
                car = false,
                mouse = true,
                combat = true
            },
            anim = {
                dict = "clothingshirt",
                clip = "try_shirt_positive_d",
                flag = 49
            }
        })

        if success then
            SetPedComponentVariation(playerPed, 9, config.armorVestDrawable2, config.armorVestTextures2, 0)
            showNotification(locale['equipped_visual'], "success")
            wearingVest = true
        end
    end
end)
