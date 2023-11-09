AddEventHandler('CEventGunShot', function (witnesses, ped, coords)
    local playerPed = PlayerPedId()
    local weaponsConfig = Weapons[GetSelectedPedWeapon(playerPed)]
    
    if weaponsConfig then
        if weaponsConfig.disableCritical then
            -- SetPedSuffersCriticalHits(playerPed, false)       
        end
        N_0x4757f00bc6323cfe(weaponsConfig.model, weaponsConfig.modifier)
    end
end)

AddEventHandler('gameEventTriggered', function(name, args)
    local playerPed = PlayerPedId()
    local weaponsConfig = Weapons[GetSelectedPedWeapon(playerPed)]
    
    if name ~= 'CEventNetworkEntityDamage' then return end
    if not weaponsConfig.disableCritical then return end

    local victim = args[1]

    if playerPed == victim then
        local boneHit, whatBone = GetPedLastDamageBone(playerPed)

        if boneHit then
            if whatBone == 31086 then
                if not IsEntityDead(playerPed) then
                    SetEntityHealth(playerPed, 0)
                end	
            end
        end
    end
end)     

print("Made by CURL with ❤️")