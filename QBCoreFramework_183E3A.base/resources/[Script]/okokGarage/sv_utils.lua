QBCore = exports["qb-core"]:GetCoreObject()

Webhook = '' -- PUT YOUR WEBHOOK LINK HERE

function MySQLexecute(query, values, func)
	return MySQL.Async.execute(query, values, func)
end

function MySQLfetchAll(query, values, func)
	return MySQL.Async.fetchAll(query, values, func)
end

function getMoney(account, xPlayer)
	local money = xPlayer.PlayerData.money[account]
	return money
end

function removeMoney(xPlayer, account, amount)
	xPlayer.Functions.RemoveMoney(account, amount)
end

function addMoney(xPlayer, account, amount)
	xPlayer.Functions.AddMoney(account, amount)
end

function sharedVehicleFunction(source, targetID, plate)
	-- Executed when a player shares a vehicle
end

function removedsharedVehicleFunction(source, targetIdentifier, plate)
	-- Executed when a player cancels a shared vehicle
end

function giveKeysToPlayer(source, identifier, vehPlate, vehName, isSociety, giveItem) -- Used when first giving keys to a player when they take out their vehicles
	if Config.UseOkokVehicleKeys and not Config.KeyMetaData.oxInventory and not Config.KeyMetaData.qbInventory then
		isSociety = isSociety or false
		local keyTable = {
			plate = tostring(vehPlate),
			vehiclename = vehName,
			isSociety = isSociety
		}
		if activeKeys[identifier] ~= nil then
			table.insert(activeKeys[identifier], keyTable)
		else
			activeKeys[identifier] = {}
			table.insert(activeKeys[identifier], keyTable)
		end
	elseif Config.KeyMetaData.oxInventory then
		isSociety = isSociety or false
		local keyTable = {
			plate = tostring(vehPlate),
			vehiclename = vehName,
			isSociety = isSociety
		}
		if activeKeys[identifier] ~= nil then
			table.insert(activeKeys[identifier], keyTable)
		else
			activeKeys[identifier] = {}
			table.insert(activeKeys[identifier], keyTable)
		end
		if giveItem ~= false then
			exports[Config.KeyMetaData.inventoryResourceName]:AddItem(source, Config.KeyMetaData.keyItemName, 1, {plate = vehPlate, name = vehName, description = _L('ChatSuggestions').removeVehiclesPlate..": "..tostring(vehPlate)})
		end
	elseif Config.KeyMetaData.qbInventory or Config.KeyMetaData.coreInventory then
		isSociety = isSociety or false
		local keyTable = {
			plate = tostring(vehPlate),
			vehiclename = vehName,
			isSociety = isSociety
		}
		if activeKeys[identifier] ~= nil then
			table.insert(activeKeys[identifier], keyTable)
		else
			activeKeys[identifier] = {}
			table.insert(activeKeys[identifier], keyTable)
		end
		if giveItem ~= false then
			local Player = QBCore.Functions.GetPlayer(source)
			Player.Functions.AddItem(Config.KeyMetaData.keyItemName, 1, false, {plate = vehPlate, name = vehName})
		end
	elseif Config.KeyMetaData.qsInventory then
		isSociety = isSociety or false
		local keyTable = {
			plate = tostring(vehPlate),
			vehiclename = vehName,
			isSociety = isSociety
		}
		if activeKeys[identifier] ~= nil then
			table.insert(activeKeys[identifier], keyTable)
		else
			activeKeys[identifier] = {}
			table.insert(activeKeys[identifier], keyTable)
		end
		if giveItem ~= false then
			local Player = QBCore.Functions.GetPlayer(source)
			Player.Functions.AddItem(Config.KeyMetaData.keyItemName, 1, false, {plate = vehPlate, name = vehName, showAllDescriptions = true})
		end
	else
		-- Your key system goes here
	end
end

function takeOutVehicle(db, _source, vehicle_plate, vehicle_id, index, vehicle_name, garageName, isSociety)
	if db ~= nil and db.stored == 1 then
		local vehicle = db.mods
		local tyreCondition = db.tyrecondition
		local doorCondition = db.doorcondition
		local windowCondition = db.windowcondition
		MySQLexecute('UPDATE player_vehicles SET `state` = @state, `garage` = @stategarage WHERE plate = @plate', {
			['@state'] = 0,
			['@stategarage'] = garageName,
			['@plate'] = vehicle_plate,
		}, function (rowsChanged)
			if rowsChanged > 0 then
				TriggerClientEvent(Config.EventPrefix..":takeOut", _source, vehicle, vehicle_plate, vehicle_id, tyreCondition, doorCondition, windowCondition, index)
				local xPlayer = QBCore.Functions.GetPlayer(_source)
				giveKeysToPlayer(_source, xPlayer.PlayerData.citizenid, vehicle_plate, vehicle_name, isSociety)
				if Webhook ~= "" then
					data = {
						playerid = _source,
						type = "takeout-vehicle",
						info = vehicle_plate:match( "^%s*(.-)%s*$" ),
					}

					discordWebhook(data)
				end
			end
		end)
	elseif db ~= nil and db.stored == 0 then
		TriggerClientEvent(Config.EventPrefix..":takeOutsideVehicle", _source, vehicle_plate)
		TriggerClientEvent(Config.EventPrefix..':notification', _source, _L('vehicle_isnt_stored').title, _L('vehicle_isnt_stored').text, _L('vehicle_isnt_stored').time, _L('vehicle_isnt_stored').type)
	elseif db ~= nil and db.stored == 2 then
		TriggerClientEvent(Config.EventPrefix..':notification', _source, _L('vehicle_is_impounded').title, _L('vehicle_is_impounded').text, _L('vehicle_is_impounded').time, _L('vehicle_is_impounded').type)
	elseif db ~= nil and db.stored == 3 then
		TriggerClientEvent(Config.EventPrefix..':notification', _source, _L('vehicle_is_stolen').title, _L('vehicle_is_stolen').text, _L('vehicle_is_stolen').time, _L('vehicle_is_stolen').type)
	end
end

function vehicleTypeSet(vehicle)
	local category = "car"

	if QBCore.Shared.Vehicles[vehicle] == nil then
		local missingVehicles = {}
		print(" ")
		for k,v in ipairs(allVehicles) do
			if QBCore.Shared.Vehicles[vehicle] == nil and missingVehicles[vehicle] == nil then
				missingVehicles[vehicle] = true
				print("\27[0;33m Vehicle `"..vehicle.."` missing in `shared/vehicles.lua`")
			end
		end
		print(" ")
		return nil
	end

	category = QBCore.Shared.Vehicles[vehicle].category
	if category == "boats" then
		category = "boat"
	elseif category == "helicopters" or category == "planes" then
		category = "air"
	else
		category = "car"
	end

	return category
end

RegisterNetEvent(Config.EventPrefix..':removeKeys', function(id, plate)
    local source = id
    local xPlayer = QBCore.Functions.GetPlayer(source)
    if xPlayer ~= nil then
        if activeKeys[xPlayer.PlayerData.citizenid] ~= nil then
            for k, v in pairs(activeKeys[xPlayer.PlayerData.citizenid]) do
                if v.plate == plate then
                    activeKeys[xPlayer.PlayerData.citizenid][k] = nil
                end
            end
        end
		if Config.KeyMetaData.oxInventory then
			local playerItems = exports.ox_inventory:GetInventoryItems(source)
			for k, v in pairs(playerItems) do
				if v.name == Config.KeyMetaData.keyItemName and tostring(v.metadata.plate):match( "^%s*(.-)%s*$" ) == plate:match( "^%s*(.-)%s*$" ) then
					exports.ox_inventory:RemoveItem(source, Config.KeyMetaData.keyItemName, 1, false, v.slot)
					break
				end
			end
		elseif Config.KeyMetaData.qbInventory or Config.KeyMetaData.qsInventory or Config.KeyMetaData.coreInventory then
			local Player = QBCore.Functions.GetPlayer(source)
			for k, v in pairs(Player.PlayerData.items) do
				if v.name == Config.KeyMetaData.keyItemName and tostring(v.info.plate):match( "^%s*(.-)%s*$" ) == plate:match( "^%s*(.-)%s*$" ) then
					Player.Functions.RemoveItem(v.name, 1, v.slot)
					break
				end
			end
		end
    end
end)

function LockVehicle(vehicle, doorStatus, k, source, vehCoords, vehicles)
	if not tostring(GetConvar('onesync')) == "on" or tostring(GetConvar('onesync')) == "true" then
		if doorStatus <= 1 then -- Unlocked
			TriggerClientEvent(Config.EventPrefix..':LockVehicle', -1, k, 2, vehCoords, "lock")
			TriggerClientEvent(Config.EventPrefix..':notification', source, _L('vehicle_locked').title, _L('vehicle_locked').text, _L('vehicle_locked').time, _L('vehicle_locked').type, false)
			TriggerClientEvent(Config.EventPrefix..':BlinkLights', -1, vehicles[k].entity, true)
			TriggerClientEvent(Config.EventPrefix..':PlayAnim', source)
		elseif doorStatus > 1 then -- Locked
			TriggerClientEvent(Config.EventPrefix..':LockVehicle', -1, k, 1, vehCoords, "unlock")
			TriggerClientEvent(Config.EventPrefix..':notification', source, _L('vehicle_unlocked').title, _L('vehicle_unlocked').text, _L('vehicle_unlocked').time, _L('vehicle_unlocked').type, false)
			TriggerClientEvent(Config.EventPrefix..':BlinkLights', -1, vehicles[k].entity, false)
			TriggerClientEvent(Config.EventPrefix..':PlayAnim', source)
		end
	else
		if doorStatus <= 1 then -- Unlocked
			SetVehicleDoorsLocked(vehicle, 2) -- Locked here
			TriggerClientEvent(Config.EventPrefix..':PlayLockedAudio', -1, vehCoords, "lock")
			TriggerClientEvent(Config.EventPrefix..':notification', source, _L('vehicle_locked').title, _L('vehicle_locked').text, _L('vehicle_locked').time, _L('vehicle_locked').type, false)
			TriggerClientEvent(Config.EventPrefix..':BlinkLights', -1, vehicles[k].entity, true)
			TriggerClientEvent(Config.EventPrefix..':PlayAnim', source)
		elseif doorStatus > 1 then -- Locked
			SetVehicleDoorsLocked(vehicle, 1) -- Unlocked here
			TriggerClientEvent(Config.EventPrefix..':notification', source, _L('vehicle_unlocked').title, _L('vehicle_unlocked').text, _L('vehicle_unlocked').time, _L('vehicle_unlocked').type, false)
			TriggerClientEvent(Config.EventPrefix..':PlayLockedAudio', -1, vehCoords, "unlock")
			TriggerClientEvent(Config.EventPrefix..':BlinkLights', -1, vehicles[k].entity, false)
			TriggerClientEvent(Config.EventPrefix..':PlayAnim', source)
		end
	end
end

function isAdminF(xPlayer)
	local isAdmin = false
	for k,v in ipairs(Config.AdminGroups) do
		if QBCore.Functions.HasPermission(xPlayer.PlayerData.source, v) or IsPlayerAceAllowed(xPlayer.PlayerData.source, 'command') then
			isAdmin = true
			break
		end
	end
	return isAdmin
end

RegisterServerEvent(Config.EventPrefix..":storeVehicle")
AddEventHandler(Config.EventPrefix..":storeVehicle", function(vehicle_plate, vehicle_props, tyreCondition, doorCondition, windowCondition, netID, vehName, garage_id, garage_type, garageInfo)
	local _source = source
	local xPlayer = QBCore.Functions.GetPlayer(_source)
	local state = false
	local finished = false
	if garage_id == nil then
		garage_id = ""
	end
	MySQLfetchAll('SELECT *, cast(`state` as signed) as `stored` FROM player_vehicles WHERE plate = @plate', {
		['@plate'] = vehicle_plate:match( "^%s*(.-)%s*$" ),
	}, function(vehicle)
		local db = vehicle[1]
		if db ~= nil then
			db.type = vehicleTypeSet(db.vehicle)
			
			if db.type == garage_type then
				local sharedWith = db.sharedwith
				if type(sharedWith) ~= "table" then
					sharedWith = json.decode(sharedWith)
				end
				if xPlayer.PlayerData.citizenid == db.citizenid or sharedWith ~= nil and sharedWith[xPlayer.PlayerData.citizenid] or xPlayer.PlayerData.job.name:lower() == db.citizenid:lower() then
					if xPlayer.PlayerData.job.name:lower() == db.citizenid:lower() then
						storeVehicle(vehicle_plate,vehicle_props, tyreCondition, doorCondition, windowCondition, _source, nil, garage_id, garageInfo, true, db.citizenid)
					else
						storeVehicle(vehicle_plate,vehicle_props, tyreCondition, doorCondition, windowCondition, _source, nil, garage_id, garageInfo)
					end
					state = true
				else
					MySQLfetchAll('SELECT * FROM okokgarage_sharedgarages WHERE JSON_EXTRACT(sharedwith, @sharedwith) IS NOT NULL', {
						['@sharedwith'] = "$."..xPlayer.PlayerData.citizenid
					}, function(sharedWith)
						
						if sharedWith[1] ~= nil then
							for k, v in pairs(sharedWith) do
								if type(v.sharedwith) ~= "table" then
									v.sharedwith = json.decode(v.sharedwith)
								end
								for k2, v2 in pairs(v.sharedwith) do
									if v.owner == db.citizenid and k2 == xPlayer.PlayerData.citizenid then
										storeVehicle(vehicle_plate,vehicle_props, tyreCondition, doorCondition, windowCondition, _source, netID, garage_id, garageInfo)
										state = true
										return
									end
								end
							end
							if activeKeys[xPlayer.PlayerData.citizenid] ~= nil then
								for k, v in pairs(activeKeys[xPlayer.PlayerData.citizenid]) do
									if v.plate:match( "^%s*(.-)%s*$" ) == vehicle_plate:match( "^%s*(.-)%s*$" ) then
										activeKeys[xPlayer.PlayerData.citizenid][k] = nil
										storeVehicle(vehicle_plate,vehicle_props, tyreCondition, doorCondition, windowCondition, _source, netID, garage_id, garageInfo)
										state = true
										return
									end
								end
							end
						else
							if activeKeys[xPlayer.PlayerData.citizenid] ~= nil then
								for k, v in pairs(activeKeys[xPlayer.PlayerData.citizenid]) do
									if v.plate:match( "^%s*(.-)%s*$" ) == vehicle_plate:match( "^%s*(.-)%s*$" ) then
										activeKeys[xPlayer.PlayerData.citizenid][k] = nil
										storeVehicle(vehicle_plate,vehicle_props, tyreCondition, doorCondition, windowCondition, _source, netID, garage_id, garageInfo, true, db.owner)
										state = true
										return
									end
								end
							end
						end
					end)
				end
			else
				state = true
			end
		else
			if Config.SocietyVehiclesList[xPlayer.PlayerData.job.name:lower()] ~= nil then
				for k, v in pairs(Config.SocietyVehiclesList[xPlayer.PlayerData.job.name:lower()]) do
					if activeKeys[xPlayer.PlayerData.citizenid] ~= nil then
						for k2, v2 in pairs(activeKeys[xPlayer.PlayerData.citizenid]) do
							if v.vehicleModel:lower() == v2.vehiclename:lower() and v.plate:match( "^%s*(.-)%s*$" ) == vehicle_plate:match( "^%s*(.-)%s*$" ) or v.vehicleModel:lower() == v2.vehiclename:lower() and Config.RandomPlateSociety then
								activeKeys[xPlayer.PlayerData.citizenid][k2] = nil
								storeVehicle(vehicle_plate, vehicle_props, tyreCondition, doorCondition, windowCondition, _source, netID, garage_id, garageInfo)
								state = true
								break
							end
						end
					else
						storeVehicle(vehicle_plate, vehicle_props, tyreCondition, doorCondition, windowCondition, _source, netID, garage_id, garageInfo)
						state = true
						break
					end
				end
			elseif Config.SocietyVehiclesList[xPlayer.PlayerData.gang.name:lower()] ~= nil then
				for k, v in pairs(Config.SocietyVehiclesList[xPlayer.PlayerData.gang.name:lower()]) do
					if activeKeys[xPlayer.PlayerData.citizenid] ~= nil then
						for k2, v2 in pairs(activeKeys[xPlayer.PlayerData.citizenid]) do
							if v.vehicleModel:lower() == v2.vehiclename:lower() and v.plate:match( "^%s*(.-)%s*$" ) == vehicle_plate:match( "^%s*(.-)%s*$" ) or v.vehicleModel:lower() == v2.vehiclename:lower() and Config.RandomPlateSociety then
								activeKeys[xPlayer.PlayerData.citizenid][k2] = nil
								storeVehicle(vehicle_plate, vehicle_props, tyreCondition, doorCondition, windowCondition, _source, netID, garage_id, garageInfo)
								state = true
								break
							end
						end
					else
						storeVehicle(vehicle_plate, vehicle_props, tyreCondition, doorCondition, windowCondition, _source, netID, garage_id, garageInfo)
						state = true
						break
					end
				end
			end
		end
		finished = true
	end)
	while not finished do
		Wait(100)
	end
	if not state and finished then
		TriggerClientEvent(Config.EventPrefix..':notification', _source, _L('not_the_owner').title, _L('not_the_owner').text, _L('not_the_owner').time, _L('not_the_owner').type)
	end
end)

function storeVehicle(vehicle_plate, vehicle_props, tyreCondition, doorCondition, windowCondition, _source, netID, garage_id, garageInfo, societyVehicle, society)
	local sqlParking = '@garage_name'
	if societyVehicle then
		if garageInfo.society ~= society then
			sqlParking = '`garage`'
		end
	else
		if garageInfo ~= nil then
			if garageInfo.society ~= "" and garageInfo.society ~= nil then
				sqlParking = '`garage`'
			end
		end
	end
	
	MySQLexecute('UPDATE player_vehicles SET mods = @vehicle, `state` = @state, `tyrecondition` = @tyrecondition, `doorcondition` = @doorcondition, `windowcondition` = @windowcondition, `garage` = '..sqlParking..' WHERE plate = @plate', {
		['@state'] = 1,
		['@vehicle'] = json.encode(vehicle_props),
		['@plate'] = vehicle_plate:match( "^%s*(.-)%s*$" ),
		['@tyrecondition'] = json.encode(tyreCondition),
		['@doorcondition'] = json.encode(doorCondition),
		['@windowcondition'] = json.encode(windowCondition),
		['@garage_name'] = garage_id
	}, function (rowsChanged)
		if vehicles[netID] ~= nil then
			vehicles[netID] = nil
		end
		if Config.KeyMetaData.oxInventory then
			local playerItems = exports.ox_inventory:GetInventoryItems(_source)
			for k, v in pairs(playerItems) do
				if v.name == Config.KeyMetaData.keyItemName and tostring(v.metadata.plate):match( "^%s*(.-)%s*$" ) == vehicle_plate:match( "^%s*(.-)%s*$" ) then
					exports.ox_inventory:RemoveItem(_source, Config.KeyMetaData.keyItemName, 1, false, v.slot)
					break
				end
			end
		elseif Config.KeyMetaData.qbInventory or Config.KeyMetaData.qsInventory or Config.KeyMetaData.coreInventory then
			local Player = QBCore.Functions.GetPlayer(_source)
			for k, v in pairs(Player.PlayerData.items) do
				if v.name == Config.KeyMetaData.keyItemName and tostring(v.info.plate):match( "^%s*(.-)%s*$" ) == vehicle_plate:match( "^%s*(.-)%s*$" ) then
					Player.Functions.RemoveItem(v.name, 1, v.slot)
					break
				end
			end
		end
		TriggerClientEvent(Config.EventPrefix..":storeVehicle", _source)
		TriggerClientEvent(Config.EventPrefix..':notification', _source, _L('vehicle_stored').title, _L('vehicle_stored').text, _L('vehicle_stored').time, _L('vehicle_stored').type)
		if Webhook ~= "" then
			data = {
				playerid = _source,
				type = "stored-vehicle",
				info = vehicle_plate:match( "^%s*(.-)%s*$" ),
			}

			discordWebhook(data)
		end
	end)
end

RegisterNetEvent(Config.EventPrefix..":checkIfTimeIsFinished", function(plate, index, vehicle_name, spawnLocationID, job)
	local source = source
	local xPlayer = QBCore.Functions.GetPlayer(source)
	plate = tostring(plate)
	MySQLfetchAll('SELECT *, cast(`state` as signed) as `stored` FROM player_vehicles WHERE citizenid = @owner AND plate = @plate OR citizenid = @job AND plate = @plate', {
		['@owner'] = xPlayer.PlayerData.citizenid,
		['@plate'] = plate,
		['@job'] = job
	}, function(vehicle)
		if vehicle[1] ~= nil then
			local db = vehicle[1]
			local time = os.time(os.date("!*t"))
			local vehicle_props = db.mods
			local vehicle_plate = db.plate
			local vehicle_id = ""
			local tyreCondition = db.tyrecondition
			local doorCondition = db.doorcondition
			local windowCondition = db.windowcondition
			local vehicle_netID = nil
			if Config.ShowVehicleImpoundedWhenExists then
				for k2,v2 in pairs(vehicles) do
					if db.plate == v2.plate and db.stored == 0 then
						if v2.time - time < 0 then
							db.stored = 2
							db.location = Config.Impound[1].name
							db.impoundTime = time
							vehicle_netID = k2
						end
					elseif db.plate == v2.plate and db.stored == 1 then
						vehicles[k2] = nil
					end
				end
			end
			if vehicles[vehicle_netID] ~= nil then
				vehicles[vehicle_netID] = nil
			end
			if vehicle_netID ~= nil then
				vehicles[vehicle_netID] = {time = os.time(os.date("!*t")) + Config.SetVehicleImpoundAfter, plate = vehicle_plate}
			end
			if type(vehicle_props) ~= "table" then
				vehicle_props = json.decode(vehicle_props)
			end
			vehicle_id = vehicle_props.model
			if db.stored == 2 then
				local endTime = db.impoundTime - time
				if endTime <= 0 then
					local freeVehicle = not Config.RetrieveFeeEnabled
					local cash = getMoney('cash', xPlayer)
					local bank = getMoney('bank', xPlayer)
					if Config.RetrieveFeeEnabled then
						if bank >= Config.RetrieveFee then
							removeMoney(xPlayer, 'bank', Config.RetrieveFee)
							freeVehicle = true
							
						elseif cash >= Config.RetrieveFee then
							freeVehicle = true
							removeMoney(xPlayer, 'cash', Config.RetrieveFee)
						end
					end
					if freeVehicle then
						MySQLexecute('UPDATE player_vehicles SET `state` = @state, `location` = @location, `impoundTime` = @impoundTime, `reason` = @reason WHERE plate = @plate AND citizenid = @owner OR citizenid = @job AND plate = @plate', {
							['@state'] = 0,
							['@location'] = "",
							['@impoundTime'] = "",
							['@reason'] = "",
							['@plate'] = plate:match( "^%s*(.-)%s*$" ),
							['@owner'] = xPlayer.PlayerData.citizenid,
							['@job'] = job
						}, function (rowsChanged)
							giveKeysToPlayer(source, xPlayer.PlayerData.citizenid, vehicle_plate, vehicle_name)
							TriggerClientEvent(Config.EventPrefix..":takeOutImpound", source, vehicle_props, vehicle_plate, vehicle_id, tyreCondition, doorCondition, windowCondition, index, spawnLocationID)
						end)
					end
					
				elseif Config.PayToImpound then
					local hours, _, total = secondsToHrs(endTime)
					local paymentFee = math.floor(total * Config.PayToImpoundFee)
					if Config.RetrieveFeeEnabled then
						paymentFee = paymentFee + Config.RetrieveFee
					end
					local cash = getMoney('cash', xPlayer)
					local bank = getMoney('bank', xPlayer)
					if bank >= paymentFee then
						removeMoney(xPlayer, 'bank', paymentFee)
						MySQLexecute('UPDATE player_vehicles SET `state` = @state, `location` = @location, `impoundTime` = @impoundTime, `reason` = @reason WHERE plate = @plate AND citizenid = @owner OR citizenid = @job AND plate = @plate', {
							['@state'] = 0,
							['@location'] = "",
							['@impoundTime'] = "",
							['@reason'] = "",
							['@plate'] = plate:match( "^%s*(.-)%s*$" ),
							['@owner'] = xPlayer.PlayerData.citizenid,
							['@job'] = job
						}, function (rowsChanged)
							giveKeysToPlayer(source, xPlayer.PlayerData.citizenid, vehicle_plate, vehicle_name)
							TriggerClientEvent(Config.EventPrefix..":takeOutImpound", source, vehicle_props, vehicle_plate, vehicle_id, tyreCondition, doorCondition, windowCondition, index, spawnLocationID)
						end)
					elseif cash >= paymentFee then
						removeMoney(xPlayer, 'cash', paymentFee)
						MySQLexecute('UPDATE player_vehicles SET `state` = @state, `location` = @location, `impoundTime` = @impoundTime, `reason` = @reason WHERE plate = @plate AND citizenid = @owner OR citizenid = @job AND plate = @plate', {
							['@state'] = 0,
							['@location'] = "",
							['@impoundTime'] = "",
							['@reason'] = "",
							['@plate'] = plate:match( "^%s*(.-)%s*$" ),
							['@owner'] = xPlayer.PlayerData.citizenid,
							['@job'] = job
						}, function (rowsChanged)
							giveKeysToPlayer(source, xPlayer.PlayerData.citizenid, vehicle_plate, vehicle_name)
							TriggerClientEvent(Config.EventPrefix..":takeOutImpound", source, vehicle_props, vehicle_plate, vehicle_id, tyreCondition, doorCondition, windowCondition, index, spawnLocationID)
						end)
					end
				end
			end
		end
	end)
end)

RegisterNetEvent(Config.EventPrefix..":TransferVehicle", function(pID, plate, toSociety)
	local source = source
	local xPlayer = QBCore.Functions.GetPlayer(source)
	if not toSociety then
		pID = tonumber(pID)
	end
	if oldOwner ~= nil then
		source = oldOwner
	end
	if pID ~= nil and plate ~= nil then
		if toSociety then
			MySQLfetchAll('SELECT *, cast(`state` as signed) as `stored` FROM player_vehicles WHERE citizenid = @owner AND plate = @plate', {
				['@owner'] = xPlayer.PlayerData.citizenid,
				['@plate'] = plate:match( "^%s*(.-)%s*$" )
			}, function(vehicle)
				if vehicle[1] ~= nil then
					vehicle[1].sharedwith = {}
					MySQLexecute('UPDATE player_vehicles SET `citizenid` = @newowner, `license` = @license, `sharedwith` = @sharedwith, favourite = 0, garage = @garage WHERE citizenid = @owner AND plate = @plate', {
						['@owner'] = xPlayer.PlayerData.citizenid,
						['@plate'] = plate:match( "^%s*(.-)%s*$" ),
						['@newowner'] = pID,
						['@license'] = pID,
						['@sharedwith'] = json.encode(vehicle[1].sharedwith),
						['@garage'] = nil
					}, function (rowsChanged)
						if rowsChanged > 0 then
							TriggerClientEvent(Config.EventPrefix..':notification', source, _L('vehicle_transferred_to_other').title, _L('vehicle_transferred_to_other').text, _L('vehicle_transferred_to_other').time, _L('vehicle_transferred_to_other').type)

							if Webhook ~= "" then
								data = {
									playerid = source,
									type = "transfer-vehicle",
									info = plate:match( "^%s*(.-)%s*$" ),
								}

								discordWebhook(data)
							end
						end
					end)
				else
					TriggerClientEvent(Config.EventPrefix..':notification', source, _L('not_the_owner').title, _L('not_the_owner').text, _L('not_the_owner').time, _L('not_the_owner').type)
				end
			end)
		else
			if GetPlayerPing(pID) > 0 then
				local targetXPlayer = QBCore.Functions.GetPlayer(pID)
				MySQLfetchAll('SELECT *, cast(`state` as signed) as `stored` FROM player_vehicles WHERE citizenid = @owner AND plate = @plate OR citizenid = @society AND plate = @plate', {
					['@owner'] = xPlayer.PlayerData.citizenid,
					['@society'] = xPlayer.PlayerData.job.name:lower(),
					['@plate'] = plate:match( "^%s*(.-)%s*$" )
				}, function(vehicle)
					if vehicle[1] ~= nil then
						vehicle[1].sharedwith = {}
						MySQLexecute('UPDATE player_vehicles SET `citizenid` = @newowner, `sharedwith` = @sharedwith, favourite = 0, license = @license WHERE citizenid = @owner AND plate = @plate OR citizenid = @society AND plate = @plate', {
							['@owner'] = xPlayer.PlayerData.citizenid,
							['@society'] = xPlayer.PlayerData.job.name:lower(),
							['@plate'] = plate:match( "^%s*(.-)%s*$" ),
							['@newowner'] = targetXPlayer.PlayerData.citizenid,
							['@sharedwith'] = json.encode(vehicle[1].sharedwith),
							['@license'] = targetXPlayer.PlayerData.license
						}, function (rowsChanged)
							if rowsChanged > 0 then
								TriggerClientEvent(Config.EventPrefix..':notification', source, _L('vehicle_transferred_to_other').title, _L('vehicle_transferred_to_other').text, _L('vehicle_transferred_to_other').time, _L('vehicle_transferred_to_other').type)
								TriggerClientEvent(Config.EventPrefix..':notification', pID, _L('vehicle_transferred').title, _L('vehicle_transferred').text, _L('vehicle_transferred').time, _L('vehicle_transferred').type)

								if Webhook ~= "" then
									data = {
										playerid = source,
										type = "transfer-vehicle",
										info = plate:match( "^%s*(.-)%s*$" ),
									}

									discordWebhook(data)
								end
							end
						end)
					else
						TriggerClientEvent(Config.EventPrefix..':notification', source, _L('not_the_owner').title, _L('not_the_owner').text, _L('not_the_owner').time, _L('not_the_owner').type)
					end
				end)
			else
				TriggerClientEvent(Config.EventPrefix..':notification', source, _L('player_not_online').title, _L('player_not_online').text, _L('player_not_online').time, _L('player_not_online').type)
			end
		end
	end
end)

RegisterNetEvent(Config.EventPrefix..":ShareProduct", function(sharedVehicle, targetSrc, type)
	local source = tonumber(source)
	local xPlayer = QBCore.Functions.GetPlayer(source)
	targetSrc = tonumber(targetSrc)
	
	if type == "garage" then
		if GetPlayerPing(targetSrc) > 0 and targetSrc ~= source then
			local targetXPlayer = QBCore.Functions.GetPlayer(targetSrc)
			local targetIdentifier = targetXPlayer.PlayerData.citizenid
			local sharedWith = {}
			sharedWith[targetIdentifier] = getName(targetIdentifier)
			MySQLexecute('INSERT INTO okokgarage_sharedgarages (owner, sharedwith, ownerName) Select @owner, @sharedwith, @ownerName Where not exists(select * from okokgarage_sharedgarages WHERE owner = @owner AND JSON_EXTRACT(sharedwith, @sharedwith) IS NOT NULL AND ownerName = @ownerName)', {
				['@owner'] = xPlayer.PlayerData.citizenid,
				['@ownerName'] = getName(xPlayer.PlayerData.citizenid),
				['@sharedwith'] = json.encode(sharedWith),
			}, function (rowsChanged)
				if rowsChanged > 0 then
					TriggerClientEvent(Config.EventPrefix..":updateSharedWithOther", source)
					TriggerClientEvent(Config.EventPrefix..':notification', source, _L('garage_shared').title, _L('garage_shared').text, _L('garage_shared').time, _L('garage_shared').type)
					TriggerClientEvent(Config.EventPrefix..':notification', targetSrc, _L('garage_shared_with').title, _L('garage_shared_with').text, _L('garage_shared_with').time, _L('garage_shared_with').type)
					if Webhook ~= "" then
						data = {
							playerid = source,
							type = "share-garage",
							info = "Garage",
						}

						discordWebhook(data)
					end
				else
					TriggerClientEvent(Config.EventPrefix..':notification', source, _L('not_garage_shared').title, _L('not_garage_shared').text, _L('not_garage_shared').time, _L('not_garage_shared').type)
				end
			end)
		else
			TriggerClientEvent(Config.EventPrefix..':notification', source, _L('player_not_online').title, _L('player_not_online').text, _L('player_not_online').time, _L('player_not_online').type)
		end
	end
	MySQLfetchAll('SELECT *, cast(`state` as signed) as `stored` FROM player_vehicles WHERE plate = @plate', {
		['@plate'] = sharedVehicle:match( "^%s*(.-)%s*$" )
	}, function(vehicle)
		if vehicle[1] ~= nil then
			if vehicle[1].citizenid == xPlayer.PlayerData.citizenid then
				
				if GetPlayerPing(targetSrc) > 0 and targetSrc ~= source then
					local targetXPlayer = QBCore.Functions.GetPlayer(targetSrc)
					local targetIdentifier = targetXPlayer.PlayerData.citizenid
					if vehicle[1].sharedwith == nil then
						vehicle[1].sharedwith = {}
						vehicle[1].sharedwith[targetIdentifier] = getName(xPlayer.PlayerData.citizenid)
					else
						vehicle[1].sharedwith = json.decode(vehicle[1].sharedwith)
						vehicle[1].sharedwith[targetIdentifier] = getName(xPlayer.PlayerData.citizenid)
					end
					MySQLexecute('UPDATE player_vehicles SET `sharedwith` = @sharedwith WHERE plate = @plate', {
						['@sharedwith'] = json.encode(vehicle[1].sharedwith),
						['@plate'] = sharedVehicle:match( "^%s*(.-)%s*$" ),
					}, function (rowsChanged)
						if rowsChanged > 0 then
							sharedVehicleFunction(source, targetSrc, sharedVehicle:match( "^%s*(.-)%s*$" ))
							TriggerClientEvent(Config.EventPrefix..":updateSharedWithOther", source)
							TriggerClientEvent(Config.EventPrefix..':notification', source, _L('vehicle_shared').title, _L('vehicle_shared').text, _L('vehicle_shared').time, _L('vehicle_shared').type)
							TriggerClientEvent(Config.EventPrefix..':notification', targetSrc, _L('vehicle_shared_with').title, _L('vehicle_shared_with').text, _L('vehicle_shared_with').time, _L('vehicle_shared_with').type)
							if Webhook ~= "" then
								data = {
									playerid = source,
									type = "share",
									info = sharedVehicle:match( "^%s*(.-)%s*$" ),
								}

								discordWebhook(data)
							end
						end
					end)
				else
					TriggerClientEvent(Config.EventPrefix..':notification', source, _L('player_not_online').title, _L('player_not_online').text, _L('player_not_online').time, _L('player_not_online').type)
				end
			end
		end
	end)
end)

RegisterNetEvent(Config.EventPrefix..":TransferKeys", function(pID, plate, vehName)
	local source = source
	pID = tonumber(pID)
	if GetPlayerPing(pID) > 0 then
		local xPlayer = QBCore.Functions.GetPlayer(source)
		MySQLfetchAll('SELECT *, cast(`state` as signed) as `stored` FROM player_vehicles WHERE citizenid = @owner AND plate = @plate', {
			['@owner'] = xPlayer.PlayerData.citizenid,
			['@plate'] = plate:match( "^%s*(.-)%s*$" )
	
		}, function(vehicle)
			if vehicle[1] ~= nil then
				local targetXPlayer = QBCore.Functions.GetPlayer(pID)

				giveKeysToPlayer(pID, targetXPlayer.PlayerData.citizenid, plate, vehName)
				TriggerClientEvent(Config.EventPrefix..':notification', source, _L('given_keys').title, _L('given_keys').text, _L('given_keys').time, _L('given_keys').type)
				TriggerClientEvent(Config.EventPrefix..':notification', pID, _L('received_keys').title, _L('received_keys').text, _L('received_keys').time, _L('received_keys').type)
				if Webhook ~= "" then
					data = {
						playerid = source,
						type = "transfer-keys",
						info = plate:match( "^%s*(.-)%s*$" ),
					}

					discordWebhook(data)
				end				
			else
				TriggerClientEvent(Config.EventPrefix..':notification', source, _L('not_the_owner').title, _L('not_the_owner').text, _L('not_the_owner').time, _L('not_the_owner').type)
			end
		end)
	else
		TriggerClientEvent(Config.EventPrefix..':notification', source, _L('player_not_online').title, _L('player_not_online').text, _L('player_not_online').time, _L('player_not_online').type)
	end
end)

RegisterCommand(Config.CreateGarageCommand, function(source, args, raw)
	local xPlayer = QBCore.Functions.GetPlayer(source)
	if isAdminF(xPlayer) then
		TriggerClientEvent(Config.EventPrefix..":createGarage", source)
	end
end)

function tablelength(T)
	local count = 0
	for _ in pairs(T) do count = count + 1 end
	return count
end

function getName(identifier)
	local xPlayer = QBCore.Functions.GetPlayerByCitizenId(identifier)
	local name = xPlayer.PlayerData.charinfo.firstname.." "..xPlayer.PlayerData.charinfo.lastname
	return name
end

Citizen.CreateThread(function()
	while true do
		local time = os.time(os.date("!*t"))
		for k, v in pairs(vehicles) do
			if v.time - time < 0 then
				local vehicle = NetworkGetEntityFromNetworkId(k)
				local vehicleExists = false

                if not DoesEntityExist(vehicle) then
					local plate = v.plate
					MySQLfetchAll('SELECT *, cast(`state` as signed) as `stored` FROM player_vehicles WHERE plate = @plate', {
						['@plate'] = plate:match( "^%s*(.-)%s*$" )
					}, function(vehicle)
						local db = vehicle[1]
						if db ~= nil then
							if db.stored == 0 then
								local vehicleState = '2'
								if not Config.VehicleImpoundedOnDV then 
									vehicleState = '1'
								end
								MySQLexecute('UPDATE player_vehicles SET `state` = @state, `location` = @location, `impoundTime` = @impoundTime WHERE plate = @plate', {
									['@state'] = vehicleState,
									['@plate'] = plate:match( "^%s*(.-)%s*$" ),
									['@location'] = Config.Impound[1].name,
									['@impoundTime'] = time,
								}, function (rowsChanged)
									if rowsChanged > 0 then
										vehicles[k] = nil
									end
								end)
							else
								vehicles[k] = nil
							end
						end
					end)
				end
			end
		end
		Wait(Config.CheckInterval * 1000)
	end
end)

-------------------------- IDENTIFIERS

function ExtractIdentifiers(id)
	local identifiers = {
		steam = "",
		ip = "",
		discord = "",
		license = "",
		xbl = "",
		live = ""
	}

	for i = 0, GetNumPlayerIdentifiers(id) - 1 do
		local playerID = GetPlayerIdentifier(id, i)

		if string.find(playerID, "steam") then
			identifiers.steam = playerID
		elseif string.find(playerID, "ip") then
			identifiers.ip = playerID
		elseif string.find(playerID, "discord") then
			identifiers.discord = playerID
		elseif string.find(playerID, "license") then
			identifiers.license = playerID
		elseif string.find(playerID, "xbl") then
			identifiers.xbl = playerID
		elseif string.find(playerID, "live") then
			identifiers.live = playerID
		end
	end

	return identifiers
end

-------------------------- WEBHOOK

function discordWebhook(data)
	local color = '65352'
	local category = 'default'
	local item = ''
	local type = 'Plate'
	local identifierlist = ExtractIdentifiers(data.playerid)
	local identifier = identifierlist.license:gsub("license2:", "")
	local discord = "<@"..identifierlist.discord:gsub("discord:", "")..">"

	if data.type == 'stored-vehicle' then
		color = Config.StoreVehicleWebhookColor
		category = 'Stored a vehicle'
		item = data.info
	elseif data.type == 'takeout-vehicle' then
		color = Config.TakeOutVehicleWebhookColor
		category = 'Took out a vehicle'
		item = data.info
	elseif data.type == 'share' then
		color = Config.ShareWebhookColor
		category = 'Shared'
		item = data.info
	elseif data.type == 'share-garage' then
		color = Config.ShareWebhookColor
		category = 'Shared'
		item = data.info
		type = 'Type'
	elseif data.type == 'transfer-vehicle' then
		color = Config.TransferWebhookColor
		category = 'Transfered vehicle'
		item = data.info
	elseif data.type == 'transfer-keys' then
		color = Config.TransferWebhookColor
		category = 'Transfered keys'
		item = data.info
	elseif data.type == 'buy-company' then
		color = Config.ShareWebhookColor
		category = 'Bought a company'
		item = data.info
		type = 'Company'
	elseif data.type == 'deposit-company' then
		color = Config.ShareWebhookColor
		category = 'Deposited **'..data.amount..'€**'
		item = data.info
		type = 'Company'
	elseif data.type == 'withdraw-company' then
		color = Config.ShareWebhookColor
		category = 'Withdrawn **'..data.amount..'€**'
		item = data.info
		type = 'Company'
	elseif data.type == 'create-garage' then
		color = Config.CompanyWebhookColor
		category = 'Created a garage'
		item = data.info..'\n**Price:** '..data.amount..'\n**Type:** '..data.garageType..'\n**Max owners:** '..data.maxOwners
		type = 'Name'
	elseif data.type == 'buy-garage' then
		color = Config.CompanyWebhookColor
		category = 'Bought a garage'
		item = data.info..'\n**Type:** '..data.garageType
		type = 'Name'
	elseif data.type == 'hired-company' then
		local identifierlistO = ExtractIdentifiers(data.owner)
		local identifierO = identifierlistO.license:gsub("license2:", "")
		local discordO = "<@"..identifierlistO.discord:gsub("discord:", "")..">"
		color = Config.CompanyWebhookColor
		category = 'Hired'
		item = data.info..'\n\n**Owner ID:** '..data.owner..'\n**Owner Identifier:** '..identifierO..'\n**Owner Discord:** '..discordO
		type = 'Company'
	elseif data.type == 'fired-company' then
		color = Config.CompanyWebhookColor
		category = 'Fired'
		item = data.info..'\n**Fired player identifier:** '..data.fired_identifier
		type = 'Company'
	elseif data.type == 'sell-company' then
		color = Config.CompanyWebhookColor
		category = 'Sold company'
		item = data.info
		type = 'Company'
	elseif data.type == 'leave-company' then
		color = Config.CompanyWebhookColor
		category = 'Left company'
		item = data.info
		type = 'Company'
	elseif data.type == 'gave-vehicle' then
		local identifierlistr = ExtractIdentifiers(data.receiver)
		local identifierr = identifierlistr.license:gsub("license2:", "")
		local discordr = "<@"..identifierlistr.discord:gsub("discord:", "")..">"

		color = Config.CompanyWebhookColor
		category = 'Gave a vehicle (Admin)'
		item = data.model..'\n**Plate:** '..data.plate..'\n**Receiver ID:** '..data.receiver..'\n**Receiver identifier:** '..identifierr..'\n**Receiver Discord:** '..discordr
		type = 'Model'
	elseif data.type == 'gave-vehicle-society' then
		color = Config.CompanyWebhookColor
		category = 'Gave a vehicle (Admin)'
		item = data.model..'\n**Plate:** '..data.plate..'\n**Receiver ID:** '..data.receiver
		type = 'Model'
	end
	
	local information = {
		{
			["color"] = color,
			["author"] = {
				["icon_url"] = Config.IconURL,
				["name"] = Config.ServerName..' - Logs',
			},
			["title"] = 'GARAGE',
			["description"] = '**Action:** '..category..'\n**'..type..':** '..item..'\n\n**ID:** '..data.playerid..'\n**Identifier:** '..identifier..'\n**Discord:** '..discord,
			["footer"] = {
				["text"] = os.date(Config.DateFormat),
			}
		}
	}

	PerformHttpRequest(Webhook, function(err, text, headers) end, 'POST', json.encode({username = Config.BotName, embeds = information}), {['Content-Type'] = 'application/json'})
end