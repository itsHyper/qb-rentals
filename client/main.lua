local QBCore = exports['qb-core']:GetCoreObject()
local SpawnVehicle = false


------Delete below or comment out if using QB-Target
Citizen.CreateThread(function()

        local startLoc = CircleZone:Create(Config.PedCoords, 2.0, {
        name='rental',
        debugPoly=true,
        useZ=true, 
        })

        startLoc:onPlayerInOut(function(isPointInside)
        if isPointInside then
            TriggerEvent('qb-rental:openMenu')
        else
            exports['qb-menu']:closeMenu()
        end
    end)

end)
----- Delete above or comment out if using QB-Target

RegisterNetEvent('qb-rental:openMenu', function()
    exports['qb-menu']:showHeader({
        {
            header = 'Rental Vehicles',
            isMenuHeader = true,
        },
        {
            id = 1,
            header = 'Return Vehicle ',
            txt = 'Return your rented vehicle.',
            params = {
                event = 'qb-rental:return',
            }
        },
        {
            id = 2,
            header = Config.Vehicle1,
            txt = '$' .. Config.Vehicle1cost,
            params = {
                event = 'qb-rental:spawncar',
                args = {
                    model = Config.Vehicle1Spawncode,
                    money = Config.Vehicle1cost,
                }
            }
        },
        {
            id = 3,
            header = Config.Vehicle2,
            txt = '$' .. Config.Vehicle2cost,
            params = {
                event = 'qb-rental:spawncar', 
                args = {
                    model = Config.Vehicle2Spawncode,
                    money = Config.Vehicle2cost,
                }
            }
        },
        {
            id = 4,
            header = Config.Vehicle3,
            txt = '$' .. Config.Vehicle3cost,
            params = {
                event = 'qb-rental:spawncar', 
                args = {
                    model = Config.Vehicle3Spawncode,
                    money = Config.Vehicle3cost,
                }
            }
        },
    })
end)

CreateThread(function()
    SpawnNPC()
end)


SpawnNPC = function()
    CreateThread(function()
       
        RequestModel(GetHashKey('a_m_y_business_03'))
        while not HasModelLoaded(GetHashKey('a_m_y_business_03')) do
            Wait(1)
        end
        CreateNPC()   
    end)
end


CreateNPC = function()
    created_ped = CreatePed(5, GetHashKey('a_m_y_business_03') , Config.PedCoords, Config.PedHeading, false, true)
    FreezeEntityPosition(created_ped, true)
    SetEntityInvincible(created_ped, true)
    SetBlockingOfNonTemporaryEvents(created_ped, true)
    TaskStartScenarioInPlace(created_ped, 'WORLD_HUMAN_CLIPBOARD', 0, true)
end


RegisterNetEvent('qb-rental:spawncar')
AddEventHandler('qb-rental:spawncar', function(data)
    local money = data.money
    local model = data.model
    local player = PlayerPedId()
    if SpawnVehicle == false then
        QBCore.Functions.SpawnVehicle(model, function(vehicle)
            SetEntityHeading(vehicle, 340.0)
            TaskWarpPedIntoVehicle(player, vehicle, -1)
            TriggerEvent('vehiclekeys:client:SetOwner', GetVehicleNumberPlateText(vehicle))
            SetVehicleEngineOn(vehicle, true, true)
            SetEntityAsMissionEntity(vehicle, true, true)
            SpawnVehicle = true
        end, Config.VehCoords, true)

        Wait(1000)
        local vehicle = GetVehiclePedIsIn(player, false)
        local vehicleLabel = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
        vehicleLabel = GetLabelText(vehicleLabel)
        local plate = GetVehicleNumberPlateText(vehicle)
        TriggerServerEvent('qb-rental:rentalpapers', plate, vehicleLabel, money)
        rentedcar = vehicle
    else
        QBCore.Functions.Notify('You already have a vehicle rented.', 'error') 
    end
end)

RegisterNetEvent('qb-rental:return')
AddEventHandler('qb-rental:return', function()
    if SpawnVehicle then
        if not IsPedInAnyVehicle(PlayerPedId(), true) then
            local currentcar = QBCore.Functions.GetClosestVehicle()
            if currentcar ~= nil then 
                if currentcar == rentedcar then
                    local Player = QBCore.Functions.GetPlayerData()
                    QBCore.Functions.Notify('Returned vehicle!', 'success')
                    TriggerServerEvent('qb-rental:removepapers')
                        if Config.Depositenabled then
                            TriggerServerEvent('qb-rentals:server:depositpayout')
                            local health = GetVehicleEngineHealth(rentedcar)  ---Health check test.
                                if Config.Healthcheck then
                                    TriggerServerEvent('qb-rentals:server:healthcheck', health)
                                end
                        end
                    NetworkFadeOutEntity(rentedcar, true,false)
                    Citizen.Wait(2000)
                    QBCore.Functions.DeleteVehicle(rentedcar)
                    SpawnVehicle = false
                else
                    QBCore.Functions.Notify('Please bring the vehicle back in order to return it.', 'error') 
                end
            end
        end 
    else 
        QBCore.Functions.Notify('No vehicle to return', 'error')
    end
end)


Citizen.CreateThread(function()
    VehicleRental = AddBlipForCoord(111.0112, -1088.67, 29.302)
    SetBlipSprite (VehicleRental, 56)
    SetBlipDisplay(VehicleRental, 4)
    SetBlipScale  (VehicleRental, 0.5)
    SetBlipAsShortRange(VehicleRental, true)
    SetBlipColour(VehicleRental, 77)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Vehicle Rental")
    EndTextCommandSetBlipName(VehicleRental)
end) 
