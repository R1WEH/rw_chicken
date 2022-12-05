ESX = nil
local playersProcessingAyam = {}
local outofbound = true
local alive = true

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('rw:addAyam')
AddEventHandler('rw:addAyam', function()
		local xPlayer = ESX.GetPlayerFromId(source)
	
		if xPlayer.canCarryItem('slaughtered_chicken', 100) then
            xPlayer.addInventoryItem('slaughtered_chicken', 1)
			xPlayer.addInventoryItem('kulit', 1)
		else
			xPlayer.showNotification(_U('weed_inventoryfull'))
		end
end)

RegisterNetEvent('rw:addAyamne')
AddEventHandler('rw:addAyamne', function()
    if not playersProcessingAyam[source] then
		local source = source
		local xPlayer = ESX.GetPlayerFromId(source)
		local xAyam = xPlayer.getInventoryItem('slaughtered_chicken')
		local can = true
		outofbound = false
    if xAyam.count >= 1 then
				if playersProcessingAyam[source] == nil then
					playersProcessingAyam[source] = ESX.SetTimeout(2000 , function()
            if xAyam.count >= 1 then
              if xPlayer.canSwapItem('slaughtered_chicken', 1, 'packaged_chicken', 1) then
                xPlayer.removeInventoryItem('slaughtered_chicken', 1)
                xPlayer.addInventoryItem('packaged_chicken', 1)
							else
								can = false
								TriggerClientEvent("rri-notify:Icon",xPlayer.source,"Kamu Telah Kehabisan Ayam","top-right",2500,"green-10","white",true,"mdi-tooltip-remove-outline")
								TriggerEvent('esx_drugs:cancelProcessing')
							end
						else						
							can = false
                            TriggerClientEvent("rri-notify:Icon",xPlayer.source,"Kamu Telah Kehabisan Ayam","top-right",2500,"green-10","white",true,"mdi-tooltip-remove-outline")
							TriggerEvent('esx_drugs:cancelProcessing')
						end

						playersProcessingAyam[source] = nil
					end)
				else
					Wait(2000)
				end	
		else
            TriggerClientEvent("rri-notify:Icon",xPlayer.source,"Anda Tidak Memiliki Ayam","top-right",2500,"green-10","white",true,"mdi-tooltip-remove-outline")
			TriggerEvent('esx_drugs:cancelProcessing')
		end	
	else
		print('Keren kamu kerja')
	end
end)

RegisterNetEvent('rw:jualayam1')
AddEventHandler('rw:jualayam1', function()
    if not playersProcessingAyam[source] then
		local source = source
		local xPlayer = ESX.GetPlayerFromId(source)
		local xAyam = xPlayer.getInventoryItem('packaged_chicken')
		local can = true
		outofbound = false
    if xAyam.count >= 1 then
		while outofbound == false and can do
				if playersProcessingAyam[source] == nil then
					playersProcessingAyam[source] = ESX.SetTimeout(2000 , function()
            if xAyam.count >= 1 then
              if xPlayer.canSwapItem('packaged_chicken', 1, 'packaged_chicken', 1) then
                xPlayer.removeInventoryItem('packaged_chicken', 1)
				xPlayer.addAccountMoney('money', 500)
							else
								can = false
								TriggerClientEvent("rri-notify:Icon",xPlayer.source,"Kamu Telah Kehabisan Ayam","top-right",2500,"green-10","white",true,"mdi-tooltip-remove-outline")
								TriggerEvent('esx_drugs:cancelProcessing')
							end
						else						
							can = false
                            TriggerClientEvent("rri-notify:Icon",xPlayer.source,"Kamu Telah Kehabisan Ayam","top-right",2500,"green-10","white",true,"mdi-tooltip-remove-outline")
							TriggerEvent('esx_drugs:cancelProcessing')
						end

						playersProcessingAyam[source] = nil
					end)
				else
					Wait(2000)
				end	
            end
		else
            TriggerClientEvent("rri-notify:Icon",xPlayer.source,"Anda Tidak Memiliki Ayam","top-right",2500,"green-10","white",true,"mdi-tooltip-remove-outline")
			TriggerEvent('esx_drugs:cancelProcessing')
		end	
	else
		print('Keren kamu kerja')
	end
end)