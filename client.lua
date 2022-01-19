
ESX                           = nil
local PlayerData                = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	Citizen.Wait(5000)
	PlayerData = ESX.GetPlayerData()
end)

local check = true

RegisterNetEvent('mikuss_kamzy:cienkie')
AddEventHandler('mikuss_kamzy:cienkie', function()
if check then
	ESX.UI.Menu.CloseAll()
	local lib, anim = 'clothingtie', 'try_tie_negative_a'
	local playerPed = PlayerPedId()
	exports['progbars']:StartProg(9200, "Zakładasz kamizelkę kuloodporną")
	ESX.Streaming.RequestAnimDict(lib, function()
		TaskPlayAnim(playerPed, lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
		Citizen.Wait(500)
		while IsEntityPlayingAnim(playerPed, lib, anim, 3) do
			Citizen.Wait(0)
			DisableAllControlActions(0)
		end
		TriggerEvent('mikuss_kamzy:dajkevlar', 'cienkie', true)
		ESX.ShowNotification('Założyłeś kamizelkę kuloodporną')
		TriggerServerEvent('zapierdolitem')
		check = false
	end)
else
	ESX.ShowNotification('Nie mozesz uzyc teraz tego przedmiotu')
end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		if check == false then
			Citizen.Wait(Lorgen.CoolDown)
			check = true
		end
	end
end)




RegisterNetEvent('mikuss_kamzy:grube')
AddEventHandler('mikuss_kamzy:grube', function()
if check then
	ESX.UI.Menu.CloseAll()
	local lib, anim = 'clothingtie', 'try_tie_negative_a'
	local playerPed = PlayerPedId()
	exports['progbars']:StartProg(9200, "Zakładasz kamizelkę kuloodporną")
	ESX.Streaming.RequestAnimDict(lib, function()
		TaskPlayAnim(playerPed, lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
		Citizen.Wait(500)
		while IsEntityPlayingAnim(playerPed, lib, anim, 3) do
			Citizen.Wait(0)
			DisableAllControlActions(0)
		end
		TriggerEvent('mikuss_kamzy:dajkevlar', 'grube', true)
		ESX.ShowNotification('Założyłeś kamizelkę kuloodporną')
		TriggerServerEvent('wpierdolitem')
		check = false
	end)
else
	ESX.ShowNotification('Nie mozesz uzyc teraz tego przedmiotu')
end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		if check == false then
			Citizen.Wait(60000)
			check = true
		end
	end
end)


RegisterNetEvent('mikuss_kamzy:dajkevlar')
AddEventHandler('mikuss_kamzy:dajkevlar', function(TypKamzy)
	local playerPed = PlayerPedId()
	if TypKamzy == 'cienkie' then
		SetPedArmour(playerPed, Lorgen.CienkaKurwa)
	elseif TypKamzy == 'grube' then
		SetPedArmour(playerPed, Lorgen.GrubaSzmata)
	end
	ESX.ShowNotification('Założyłeś kamizelkę kuloodporną')
end)