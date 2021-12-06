local QBCore = exports['qb-core']:GetCoreObject()


RegisterServerEvent('qb-rental:rentalpapers')
AddEventHandler('qb-rental:rentalpapers', function(plate, modelo, money)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    print(plate)
    local info = {}
    info.citizenid = Player.PlayerData.citizenid
    info.firstname = Player.PlayerData.charinfo.firstname
    info.lastname = Player.PlayerData.charinfo.lastname
    info.plate = plate
    info.model = modelo

    print(json.encode(info))
    TriggerClientEvent('inventory:client:ItemBox', src,  QBCore.Shared.Items["rentalpapers"], 'add')
    Player.Functions.AddItem('rentalpapers', 1, false, info)
    Player.Functions.RemoveMoney('bank', money, "vehicle-rental")
end)

