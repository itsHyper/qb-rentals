local QBCore = exports['qb-core']:GetCoreObject()


RegisterNetEvent('qb-rentals:client:ScooterSpawn', function(model)
    QBCore.Functions.Progressbar("grab_scooter", "Pulling out Scooter...", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        QBCore.Functions.SpawnVehicle(model, function(vehicle)
            TaskWarpPedIntoVehicle(player, vehicle, -1)
            SetVehicleEngineOn(vehicle, true, true)
        end, Config.ScooterSpawnCoords, true)
    end, function() -- Cancel
        QBCore.Functions.Notify("Rental failed!", "error")
    end)
end)


CreateThread(function()
	local blip = AddBlipForCoord(-274.85, -916.1, 31.22)
	SetBlipAsShortRange(blip, true)
	SetBlipSprite(blip, 348)
	SetBlipColour(blip, 60)
	SetBlipScale(blip, 0.7)
	SetBlipDisplay(blip, 6)
	BeginTextCommandSetBlipName('STRING')
	AddTextComponentString('Scooter Rental')
	EndTextCommandSetBlipName(blip)
end)
