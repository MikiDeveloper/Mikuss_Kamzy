ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('cienkiegowno', function(source)
	TriggerClientEvent('mikuss_kamzy:cienkie',source)
end)

ESX.RegisterUsableItem('grubegowno', function(source)
	TriggerClientEvent('mikuss_kamzy:grube',source)
end)

RegisterServerEvent('zapierdolitem')
AddEventHandler('zapierdolitem', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('cienkiegowno', 1)
end)
RegisterServerEvent('wpierdolitem')
AddEventHandler('wpierdolitem', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('grubegowno', 1)
end)