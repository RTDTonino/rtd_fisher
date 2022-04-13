ESX.RegisterUsableItem('canap', function(source)
	TriggerClientEvent('rtd_pescador:caña', source)
end)

RegisterNetEvent('rtd_pescador:daritem')
AddEventHandler('rtd_pescador:daritem', function(x, y)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer then
		xPlayer.addInventoryItem(x, y)
	end
end)

RegisterNetEvent('rtd_pescador:vendermenos10')
AddEventHandler('rtd_pescador:vendermenos10', function(cantidad)
	local xPlayer = ESX.GetPlayerFromId(source)
    local item = RTD.nombrepez
	local count = cantidad
	local pricepu = RTD.preciopez
	local price = count * RTD.preciopez
	local xPescado = xPlayer.getInventoryItem(item)

	if xPlayer then
		if xPescado.count >= count then
			xPlayer.removeInventoryItem(item, count)
		    xPlayer.addAccountMoney('money', price)
		    xPlayer.showNotification('Has Vendido 10 Peces Frescos!')
		else
			xPlayer.showNotification('No tienes suficientes pescados')
		end
	end
end)

RegisterNetEvent('rtd_pescador:terminarmision')
AddEventHandler('rtd_pescador:terminarmision', function(cantidad)
	local xPlayer = ESX.GetPlayerFromId(source)
    local item = RTD.nombrepez
	local count = cantidad
	local pricepu = RTD.preciopez
	local price = count * pricepu
	local xPescado = xPlayer.getInventoryItem(item)

	if xPlayer then
		if xPescado.count >= count then
			xPlayer.removeInventoryItem(item, count)
		    xPlayer.addAccountMoney('money', price)
		    xPlayer.showNotification('Listo, aqui tienes tu pago !')
			xPlayer.showNotification('Vendiste '..count.. ' Pescados Frescos y tu pago fue de $ '..price..'')
		else
			xPlayer.showNotification('No tienes suficientes pescados')
		end
	end
end)

RegisterNetEvent('rtd_pescador:comprarobjeto')
AddEventHandler('rtd_pescador:comprarobjeto', function(cantidad)
	local xPlayer = ESX.GetPlayerFromId(source)
    local item = RTD.ncanap
	local count = cantidad
	local price = count * RTD.preciocanap

	if xPlayer then
		if xPlayer.canCarryItem(item, count) then
			if xPlayer.getMoney() >= price then
				xPlayer.removeAccountMoney('money', price)
				xPlayer.addInventoryItem(item, count)
			else
				xPlayer.showNotification('No tienes suficiente dinero')
			end
		else
			xPlayer.showNotification('No tienes suficiente espacio')
		end
	end
end)