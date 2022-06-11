ESX.RegisterUsableItem('canap', function(source)
	TriggerClientEvent('rtd_fisher:caña', source)
end)

RegisterNetEvent('rtd_fisher:daritem')
AddEventHandler('rtd_fisher:daritem', function(x, y)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer then
		xPlayer.addInventoryItem(x, y)
	end
end)

RegisterNetEvent('rtd_fisher:vendermenos10')
AddEventHandler('rtd_fisher:vendermenos10', function(cantidad)
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
		    xPlayer.showNotification('Has Vendido '..count..' Peces Frescos!')
		else
			xPlayer.showNotification('No tienes suficientes pescados')
		end
	end
end)

RegisterNetEvent('rtd_fisher:terminarmision')
AddEventHandler('rtd_fisher:terminarmision', function(cantidad)
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

RegisterNetEvent('rtd_fisher:comprarobjeto')
AddEventHandler('rtd_fisher:comprarobjeto', function(cantidad)
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
