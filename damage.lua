AddEventHandler('CEventGunShot', function (witnesses, ped, coords)
    local playerPed = PlayerPedId()
    local weaponsConfig = Weapons[GetSelectedPedWeapon(playerPed)]
    
    if weaponsConfig then
        if weaponsConfig.disableCritical then
            SetPedSuffersCriticalHits(playerPed, false)
        end
        N_0x4757f00bc6323cfe(weaponsConfig.model, weaponsConfig.modifier)
    end
end)

print("Made by CURL with ❤️")