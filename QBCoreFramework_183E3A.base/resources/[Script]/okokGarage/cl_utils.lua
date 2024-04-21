QBCore = exports["qb-core"]:GetCoreObject()

RegisterNetEvent(Config.EventPrefix..":notification")
AddEventHandler(Config.EventPrefix..":notification", function(title, text, time, type, playSound)
	if Config.UseOkOkNotify then
		exports['okokNotify']:Alert(title, text, time, type, playSound)
	else
		QBCore.Functions.Notify(text, type)
	end
end)

function TextUI(text, time, type)
	if Config.UseOkokTextUI then
		if text ~= nil then
			exports['okokTextUI']:Open(text, time, type)
		else
			exports['okokTextUI']:Close()
		end
	end
end

function canOpenImpound(impoundLocation)
	local canOpen = true
	
	-- Code to check if the player can open the impound

	if not canOpen then
		-- Add notification here
	end

	return canOpen
end

function ViewVehicleCreated(vehicle)
	-- Code executed when the view vehicle is created
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()

	for k,v in ipairs(garageBlips) do
		RemoveBlip(v)
	end

	garageBlips = {}

	if Config.ShowBlips then
		local hasJob = false
		for k,v in ipairs(Config.Garages) do
			if v.society == "" and v.blip.blipScale > 0 or PlayerData.job.name:lower() == v.society:lower() and v.blip.blipScale > 0 or PlayerData.gang.name:lower() == v.society:lower() and v.blip.blipScale > 0 then
				hasJob = true
				local blip = AddBlipForCoord(v.coords.x, v.coords.y, v.coords.z)
				SetBlipSprite(blip, v.blip.blipId)
				SetBlipDisplay(blip, 4)
				SetBlipScale(blip, v.blip.blipScale)
				SetBlipColour(blip, v.blip.blipColor)
				SetBlipAsShortRange(blip, true)
				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString(v.blip.blipText)
				EndTextCommandSetBlipName(blip)
				table.insert(garageBlips, blip)
			end
		end
	end
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(job)
	PlayerData.job = job

	for k,v in ipairs(garageBlips) do
		RemoveBlip(v)
	end

	garageBlips = {}

	if Config.ShowBlips then
		local hasJob = false
		for k,v in ipairs(Config.Garages) do
			if v.society == "" and v.blip.blipScale > 0 or PlayerData.job.name:lower() == v.society:lower() and v.blip.blipScale > 0 or PlayerData.gang.name:lower() == v.society:lower() and v.blip.blipScale > 0 then
				hasJob = true
				local blip = AddBlipForCoord(v.coords.x, v.coords.y, v.coords.z)
				SetBlipSprite(blip, v.blip.blipId)
				SetBlipDisplay(blip, 4)
				SetBlipScale(blip, v.blip.blipScale)
				SetBlipColour(blip, v.blip.blipColor)
				SetBlipAsShortRange(blip, true)
				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString(v.blip.blipText)
				EndTextCommandSetBlipName(blip)
				table.insert(garageBlips, blip)
			end
		end
	end
end)

RegisterNetEvent('QBCore:Client:OnGangUpdate')
AddEventHandler('QBCore:Client:OnGangUpdate', function(job)
	PlayerData.gang = job

	for k,v in ipairs(garageBlips) do
		RemoveBlip(v)
	end

	garageBlips = {}

	if Config.ShowBlips then
		local hasJob = false
		for k,v in ipairs(Config.Garages) do
			if v.society == "" and v.blip.blipScale > 0 or PlayerData.job.name:lower() == v.society:lower() and v.blip.blipScale > 0 or PlayerData.gang.name:lower() == v.society:lower() and v.blip.blipScale > 0 then
				hasJob = true
				local blip = AddBlipForCoord(v.coords.x, v.coords.y, v.coords.z)
				SetBlipSprite(blip, v.blip.blipId)
				SetBlipDisplay(blip, 4)
				SetBlipScale(blip, v.blip.blipScale)
				SetBlipColour(blip, v.blip.blipColor)
				SetBlipAsShortRange(blip, true)
				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString(v.blip.blipText)
				EndTextCommandSetBlipName(blip)
				table.insert(garageBlips, blip)
			end
		end
	end
end)

RegisterNetEvent(Config.EventPrefix..":onMenuOpen")
AddEventHandler(Config.EventPrefix..":onMenuOpen", function()
	-- Code to execute when the player opens the garage
end)

RegisterNetEvent(Config.EventPrefix..":onMenuClose")
AddEventHandler(Config.EventPrefix..":onMenuClose", function()
	-- Code to execute when the player leaves the garage
end)

RegisterNetEvent(Config.EventPrefix..":takeOutsideVehicle")
AddEventHandler(Config.EventPrefix..":takeOutsideVehicle", function(plate)
	-- Code to execute when the player tries to take out a outside vehicle
end)

function DrawTextUI(text)
	exports['qb-core']:DrawText(text, 'left')
end

function HideTextUI()
	exports['qb-core']:HideText()
end

function vehicleName(v, model)
	local name = v.vehiclename
	if name == nil then
		name = GetDisplayNameFromVehicleModel(model)
		if Config.GetVehicleModelName ~= nil and not Config.GetVehicleModelName then
			name = GetLabelText(GetDisplayNameFromVehicleModel(model))
		end
	elseif name:gsub("%s+", "") == "" then
		name = GetDisplayNameFromVehicleModel(model)
		if Config.GetVehicleModelName ~= nil and not Config.GetVehicleModelName then
			name = GetLabelText(GetDisplayNameFromVehicleModel(model))
		end
	end
	return name
end

function setVehicleFuel(vehicle, fuel)
	if Config.FuelResource:lower() == "legacyfuel" then
		exports["LegacyFuel"]:SetFuel(vehicle, fuel)
	elseif Config.FuelResource:lower() == "native" then
		SetVehicleFuelLevel(vehicle, fuel)
	elseif Config.FuelResource:lower() == "ox_fuel" then
		Entity(vehicle).state.fuel = fuel
	end
end

function isVehicleDamaged(vehicle) -- Executed when the player tries to open the liveries menu
	local enginehealth = GetVehicleEngineHealth(vehicle)
	local bodydamage = GetVehicleBodyHealth(vehicle)
	local health = (enginehealth + bodydamage)/2
	
	return health <= 980
end

function getSocietyVehicles(job, garageType)
	local grade = PlayerData.job.grade.level
	local vehicles = Config.SocietyVehiclesList[job:lower()]
	local societyVehicles = {}

	if garageType == nil then
		garageType = "car"
	end

	if job:lower() == PlayerData.gang.name:lower() then
		grade = PlayerData.gang.grade.level
	end

	for k,v in pairs(vehicles) do
		if v.type == garageType then
			if tonumber(grade) >= tonumber(v.minimumGrade) then
				v.vehiclename = vehicleName(v, v.vehicleModel)
				v.vehicleid = Config.ImageType:lower() == "type" and v.type or Config.ImageType:lower() == "single" and "vehicle" or vehicleDefaultName(v, v.vehicleModel)
				v.vehicleModel = v.vehicleModel
				v.job = job:lower()
				v.favourite = false
				v.stored = 1
				v.type = Config.Garages[tonumber(currentGarageOpened)].type
				if Config.vImageCreator then
					v.vehicleURL = tostring(exports.vImageCreator:GetModelImage(tostring(v.vehicleModel)))
				else
					v.vehicleURL = "img/vehicles/" ..tostring(v.vehicleid):gsub("%s+", "")..".png"
				end
				if Config.RandomPlateSociety then
					v.plate = GenerateSocietyPlate(v.vehiclename)
				end
				v.plate = v.plate:upper()

				table.insert(societyVehicles, v)
			end
		end
	end

	return societyVehicles
end

function GetAllPlayersDistance()
	local players = GetActivePlayers()
	local playerDistances = {}
	for _,playerId in ipairs(players) do
		local targetPed = GetPlayerPed(playerId)
		if targetPed ~= ped then
			local targetCoords = GetEntityCoords(targetPed)
			local distance = #(targetCoords-playerCoords)
			if distance < Config.HireEmployeeRadius then
				local targetSrc = GetPlayerServerId(playerId)
				playerDistances[targetSrc] = distance
			end
		end
	end

	table.sort(playerDistances)
	TriggerServerEvent(Config.EventPrefix..":getClosestPlayerNames", playerDistances)
	return nil
end

RegisterNetEvent(Config.EventPrefix..":PlayAnim", function()
	local isInVehicle = GetVehiclePedIsIn(ped, false)
	
	if isInVehicle ~= 0 then
		TaskPlayAnim(ped, dict2, "change_station", 8.0, 8.0, -1, 48, 1, false, false, false)
		Wait(500)
		ClearPedTasks(ped)
	else
		TaskPlayAnim(ped, dict, "fob_click_fp", 8.0, 8.0, -1, 48, 1, false, false, false)
	end
end)

RegisterNetEvent(Config.EventPrefix..":storeVehicle")
AddEventHandler(Config.EventPrefix..":storeVehicle", function(vehicle, index)
	if storingVehicle ~= nil then
		
		TaskLeaveVehicle(ped, storingVehicle, 1)
		alpha = 255
		while alpha > 0 do
			Wait(5)
			if Config.StoreVehicleFade then
				SetEntityAlpha(storingVehicle, alpha, true)
			end
			alpha = alpha - 1
		end
		DeleteEntity(storingVehicle)
		SetEntityAsNoLongerNeeded(storingVehicle)
		SetModelAsNoLongerNeeded(storingVehicle)
		storingVehicle = nil
		isStoring = false
	end
end)

RegisterNetEvent(Config.EventPrefix..":DeleteImpoundedVehicle", function(netID)
	local alpha = 255
	local veh = NetToVeh(netID)
	local attempt = 0
	local ped = PlayerPedId()
	local driverPed = GetPedInVehicleSeat(veh, -1)
	local driverPedServerID = GetPlayerServerId(NetworkGetPlayerIndexFromPed(driverPed))
	if ped ~= driverPed then
		TriggerServerEvent(Config.EventPrefix..":pedLeaveVehicle", driverPedServerID, netID)
	end
	SetEntityAsMissionEntity(veh, true, true)
	while not NetworkHasControlOfEntity(veh) and attempt < 100 and DoesEntityExist(veh) do
		Citizen.Wait(100)
		NetworkRequestControlOfEntity(veh)
		attempt = attempt + 1
	end

	if DoesEntityExist(veh) and NetworkHasControlOfEntity(veh) then
		DeleteVehicle(veh)
		SetEntityAsNoLongerNeeded(veh)
		SetModelAsNoLongerNeeded(veh)
		TriggerEvent(Config.EventPrefix..':notification', _L('vehicle_impounded_police').title, _L('vehicle_impounded_police').text, _L('vehicle_impounded_police').time, _L('vehicle_impounded_police').type)
	end
end)

RegisterNetEvent(Config.EventPrefix..":openMenu")
AddEventHandler(Config.EventPrefix..":openMenu", function(index, menuType, garageName)
	currentGarageOpened = index
	local playerJob = PlayerData.job.name
	local jobName = PlayerData.job.label
	local playerGang = PlayerData.gang.name
	local canTransferToSociety = false
	takeOutInView = false
	if not IsEntityDead(PlayerPedId()) then
		if not garageIsOpen then
			if menuType == "openGarage" then
				garageIsOpen = true

				if Config.HideMinimap then
					DisplayRadar(false)
				end

				for k,v in ipairs(Config.Garages) do
					if v.society:lower() == playerJob:lower() then
						if not v.infiniteVehicles then
							canTransferToSociety = true
							break
						end
					elseif v.society:lower() == playerGang:lower() then
						if not v.infiniteVehicles then
							canTransferToSociety = true
							playerJob = playerGang
							jobName = PlayerData.gang.label
							break
						end
					end
				end
				
				TriggerEvent(Config.EventPrefix..":onMenuOpen")
				if type(currentGarageOpened) ~= "number" then
					privateGarage = true
					SetNuiFocus(true, true)
					SendNUIMessage({
						action = 'loading',
					})
					QBCore.Functions.TriggerCallback(Config.EventPrefix..":getPlayerInfo", function(name, sex)
						QBCore.Functions.TriggerCallback(Config.EventPrefix..":getPlayerVehicles", function(vehicles, sharedVehicles)
						
							for k,v in pairs(vehicles) do
								v.vehiclename = vehicleName(v, v.vehicle)
								v.vehicleid = Config.ImageType:lower() == "type" and v.type or Config.ImageType:lower() == "single" and "vehicle" or vehicleDefaultName(v, v.vehicle)
								v.vehicleModel = v.hash
								v.garage_name = garageNamef(v.garage)
								if Config.vImageCreator then
									v.vehicleURL = tostring(exports.vImageCreator:GetModelImage(tostring(v.vehicleModel)))
								else
									v.vehicleURL = "img/vehicles/" ..tostring(v.vehicleid):gsub("%s+", "")..".png"
								end
								if v.favourite then
									favAmount = favAmount + 1
								end
							end
							local garageType
							local society
							if privateGarage then
								garageType = privateGarageType 
								society = 0
							else
								garageType = Config.Garages[index].type
								society = Config.Garages[index].society
							end
							currentGarageType = garageType
							SendNUIMessage({
								action = 'openGarage',
								name = name,
								sex = sex,
								vehicles = vehicles,
								sharedVehicles = sharedVehicles,
								garages = garages,
								favAmount = favAmount,
								index = index,
								garageType = garageType,
								society = society,
								noShared = false,
								societyGarage = false,
								canTransferToSociety = canTransferToSociety,
								playerJob = jobName,
								vehiclesAnywhere = Config.GetVehicleAnywhere,
								garageName = garageName
							})
						end)
					end)
				else
					privateGarage = false
					local playerJob = PlayerData.job.name
					if Config.Garages[tonumber(index)].society:lower() == PlayerData.gang.name:lower() then
						playerJob = PlayerData.gang.name
					end
					if not Config.Garages[tonumber(index)].infiniteVehicles or Config.SocietyVehiclesList[playerJob:lower()] == nil then
						local isSociety = false
						SetNuiFocus(true, true)
						SendNUIMessage({
							action = 'loading',
						})
						if Config.Garages[tonumber(index)].society:lower() == playerJob:lower() then
							isSociety = true
						end
						QBCore.Functions.TriggerCallback(Config.EventPrefix..":getPlayerInfo", function(name, sex)
							QBCore.Functions.TriggerCallback(Config.EventPrefix..":getPlayerVehicles", function(vehicles, sharedVehicles)
								for k,v in pairs(vehicles) do
									v.vehiclename = vehicleName(v, v.vehicle)
									v.vehicleid = Config.ImageType:lower() == "type" and v.type or Config.ImageType:lower() == "single" and "vehicle" or vehicleDefaultName(v, v.vehicle)
									v.vehicleModel = v.hash
									v.garage_name = garageNamef(v.garage)
									if Config.vImageCreator then
										v.vehicleURL = tostring(exports.vImageCreator:GetModelImage(tostring(v.vehicleModel)))
									else
										v.vehicleURL = "img/vehicles/" ..tostring(v.vehicleid):gsub("%s+", "")..".png"
									end
									if isSociety then
										v.favourite = 0
									else
										if v.favourite then
											favAmount = favAmount + 1
										end
									end
								end
								local garageType
								local society
								if privateGarage then
									garageType = privateGarageType 
									society = 0
								else
									garageType = Config.Garages[index].type
									society = Config.Garages[index].society
								end
								currentGarageType = garageType
								SendNUIMessage({
									action = 'openGarage',
									name = name,
									sex = sex,
									vehicles = vehicles,
									sharedVehicles = sharedVehicles,
									garages = garages,
									favAmount = favAmount,
									index = index,
									garageType = garageType,
									society = society,
									noShared = isSociety,
									societyGarage = isSociety,
									canTransferToSociety = canTransferToSociety,
									playerJob = jobName,
									vehiclesAnywhere = Config.GetVehicleAnywhere,
									garageName = garageName
								})
							end, nil, isSociety, playerJob)
						end)
					else
						local garageType
						local society
						if privateGarage then
							garageType = privateGarageType 
							society = 0
						else
							garageType = Config.Garages[index].type
							society = Config.Garages[index].society
						end
						local vehicles = getSocietyVehicles(playerJob, garageType)
						SetNuiFocus(true, true)
						SendNUIMessage({
							action = 'infiniteGarage',
							vehicles = vehicles,
							index = index
						})
					end
				end
			elseif menuType == "adminMenu" then
				SetNuiFocus(true, true)
				SendNUIMessage({
					action = 'loading',
				})
				QBCore.Functions.TriggerCallback(Config.EventPrefix..":getPlayerInfo", function(name, sex)
					QBCore.Functions.TriggerCallback(Config.EventPrefix..":getAllCompanies", function(companies)
						QBCore.Functions.TriggerCallback(Config.EventPrefix..":getAllGarages", function(garages)
							SendNUIMessage({
								action = 'adminBusinessMenu',
								companys = companies,
								garages = garages,
								name = name,
								sex = sex
							
							})
						end)
					end)
				end)
			end
		end
	end
end)

CreateThread(function()
	local shown = false
	local garageName = ""
	local sleep = 1000
	while true do
		local inZone = false
		local nearAGarage = false
		local vehicle = GetVehiclePedIsIn(ped, false)		

		if vehicle ~= 0 then
			if GetPedInVehicleSeat(vehicle, -1) == ped then
				if privateGaragesMarker ~= nil then
					for k, v in pairs(privateGaragesMarker) do
						local distance = #(playerCoords - vector3(v.coords.x, v.coords.y, v.coords.z))
						if distance < 25 then
							nearAGarage = true
							if not garageIsOpen then
								sleep = 0
							else
								sleep = 5000
							end
							DrawMarker(Config.PrivateGarages.storeVehicleMarker.id, v.coords.x, v.coords.y, v.coords.z, 0, 0, 0, 0, 0, 0, Config.PrivateGarages.storeVehicleMarker.size.x, Config.PrivateGarages.storeVehicleMarker.size.y, Config.PrivateGarages.storeVehicleMarker.size.z, Config.PrivateGarages.storeVehicleMarker.color.r, Config.PrivateGarages.storeVehicleMarker.color.g, Config.PrivateGarages.storeVehicleMarker.color.b, Config.PrivateGarages.storeVehicleMarker.color.a, Config.PrivateGarages.storeVehicleMarker.bobUpAndDown, Config.PrivateGarages.storeVehicleMarker.faceCamera, 2, Config.PrivateGarages.storeVehicleMarker.rotate, Config.PrivateGarages.storeVehicleMarker.textureDict, Config.PrivateGarages.storeVehicleMarker.textureName, Config.PrivateGarages.storeVehicleMarker.drawOnEnts)
						elseif not nearAGarage then
							sleep = 1000
						end
						if distance < Config.PrivateGarages.radius + 2 then
							local height = playerCoords.z - v.coords.z
							if distance < Config.PrivateGarages.radius and height < 5 and height > -5 then
								inZone = true

								if IsControlJustReleased(0, Config.InteractionKey) and not IsEntityDead(ped) and not isStoring then
									isStoring = true
									vehicle_plate = GetVehicleNumberPlateText(vehicle)
									vehicle_props = QBCore.Functions.GetVehicleProperties(vehicle)
									storingVehicle = vehicle
									netID = NetworkGetNetworkIdFromEntity(storingVehicle)
									garageNameOpen = v.garageName
									local tyreCondition, doorCondition, windowCondition = getProperties(vehicle)
									local color1 = {}
									local color2 = {}
									vehicle_props.mainRGB = {}
									vehicle_props.secondaryRGB = {}
									color1[1], color1[2], color1[3] = GetVehicleCustomPrimaryColour(vehicle)
									color2[1], color2[2], color2[3] = GetVehicleCustomSecondaryColour(vehicle)
									local vehName = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
									vehicle_props.mainRGB = color1
									vehicle_props.secondaryRGB = color2
									TriggerServerEvent(Config.EventPrefix..':storeVehicle', vehicle_plate, vehicle_props, tyreCondition, doorCondition, windowCondition, netID, vehName, garageNameOpen, v.garageType, v)
									Citizen.SetTimeout(2000, function()
										isStoring = false
									end)
								end
							end
						end
					end
				end
				for k,v in pairs(Config.Garages) do
					if v.society:lower() == "" or PlayerData.job.name:lower() == v.society:lower() or PlayerData.gang.name:lower() == v.society:lower() then
						local distance = #(playerCoords - v.storeVehicleCoords)
						if distance < 25 then
							nearAGarage = true
							if not garageIsOpen then
								sleep = 0
							else
								sleep = 5000
							end
							DrawMarker(v.storeVehicleMarker.id, v.storeVehicleCoords.x, v.storeVehicleCoords.y, v.storeVehicleCoords.z, 0, 0, 0, 0, 0, 0, v.storeVehicleMarker.size.x, v.storeVehicleMarker.size.y, v.storeVehicleMarker.size.z, v.storeVehicleMarker.color.r, v.storeVehicleMarker.color.g, v.storeVehicleMarker.color.b, v.storeVehicleMarker.color.a, v.storeVehicleMarker.bobUpAndDown, v.storeVehicleMarker.faceCamera, 2, v.storeVehicleMarker.rotate, v.storeVehicleMarker.textureDict, v.storeVehicleMarker.textureName, v.storeVehicleMarker.drawOnEnts)
						elseif not nearAGarage then
							sleep = 1000
						end
						if distance < v.storeVehicleMarker.radius + 2 then
							local height = playerCoords.z - v.storeVehicleCoords.z

							if garageName ~= v.name then
								garageName = v.name
							end
							
							if distance < v.storeVehicleMarker.radius and height < 5 and height > -5 then
								inZone = true
								if IsControlJustReleased(0, Config.InteractionKey) and not IsEntityDead(ped) and not isStoring then
									isStoring = true
									vehicle_plate = GetVehicleNumberPlateText(vehicle)
									vehicle_props = QBCore.Functions.GetVehicleProperties(vehicle)
									storingVehicle = vehicle
									netID = NetworkGetNetworkIdFromEntity(storingVehicle)
									garageNameOpen = v.name
									local tyreCondition, doorCondition, windowCondition = getProperties(vehicle)
									local color1 = {}
									local color2 = {}
									vehicle_props.mainRGB = {}
									vehicle_props.secondaryRGB = {}
									color1[1], color1[2], color1[3] = GetVehicleCustomPrimaryColour(vehicle)
									color2[1], color2[2], color2[3] = GetVehicleCustomSecondaryColour(vehicle)
									
									vehicle_props.mainRGB = color1
									vehicle_props.secondaryRGB = color2
									local vehName = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
									TriggerServerEvent(Config.EventPrefix..':storeVehicle', vehicle_plate, vehicle_props, tyreCondition, doorCondition, windowCondition, netID, vehName, v.id, v.type, v)
									Citizen.SetTimeout(2000, function()
										isStoring = false
									end)
								end
							end
						end
					end
				end
			end
		else
			sleep = 2000
		end

		if not shown and inZone and not garageIsOpen then
			shown = true
			if Config.UseOkokTextUI then
				exports['okokTextUI']:Open(_L('store_vehicle').text, _L('store_vehicle').color, _L('store_vehicle').side)
			else
				DrawTextUI(_L('store_vehicle').text)
			end
		elseif shown and not inZone then
			shown = false
			if Config.UseOkokTextUI then
				exports['okokTextUI']:Close()
			else
				exports['qb-core']:HideText()
			end	
		end
		Wait(sleep)		
	end
end)

RegisterNetEvent(Config.EventPrefix..":takeOut")
AddEventHandler(Config.EventPrefix..":takeOut", function(vehicle_props, vehicle_plate, vehicle_id, tyreCondition, doorCondition, windowCondition, index)
	local spawnLocationID
	vehicle_id = tonumber(vehicle_id)
	if Config.TakeOutAtView and takeOutInView then

	else
		if type(index) == "number" then
			spawnLocationID = #Config.Garages[index].vehicleSpawn
			for k,v in ipairs(Config.Garages[index].vehicleSpawn) do
				local isPositionOccupied = IsPositionOccupied(v.x, v.y, v.z, posOccupiedRadius, false, true, false, false, false, 0)
				if isPositionOccupied == 1 then
					isPositionOccupied = true
				end
				if not isPositionOccupied then spawnLocationID = k break end
				if k == #Config.Garages[index].vehicleSpawn then
					spawnLocationID = k
					break
				end
			end
		end
	end
	
	if Config.CameraEnabled and Config.SetIntoVehicle then
		StartCam()
	end
	local vector
	if Config.TakeOutAtView and takeOutInView and not privateGarage then
		vector = currentViewPos
	else
		if not privateGarage then
			vector = Config.Garages[tonumber(index)].vehicleSpawn[spawnLocationID]
		else
			vector = vector4(privateGarageCoords.x, privateGarageCoords.y, privateGarageCoords.z, privateGarageHeading)
		end
	end
	if vehicle_props == nil then
		vehicle_props = {}
	end
	if type(vehicle_props) ~= "table" then
		vehicle_props = json.decode(vehicle_props)
	end
	RequestModel(vehicle_id)
	while not HasModelLoaded(vehicle_id) do Wait(0) end

	local vehicle = CreateVehicle(vehicle_id, vector.x, vector.y, vector.z, vector.w, true, true)

	while not DoesEntityExist(vehicle) do
		Wait(20)
	end
	local doors = {}
	if vehicle_props.doorStatus ~= nil then
		for k,v in pairs(vehicle_props.doorStatus) do
			doors[tonumber(k)] = v
		end
		vehicle_props.doorStatus = doors
	end
	QBCore.Functions.SetVehicleProperties(vehicle, vehicle_props)
	if vehicle_props.bodyHealth == nil then
		vehicle_props.bodyHealth = 1000.0
	end
	if vehicle_props.engineHealth == nil then
		vehicle_props.engineHealth = 1000.0
	end
	SetVehicleBodyHealth(vehicle, vehicle_props.bodyHealth + 0.0)
	SetVehicleEngineHealth(vehicle, vehicle_props.engineHealth + 0.0)
	SetVehicleDirtLevel(vehicle, vehicle_props.dirtLevel)
	SetVehicleNumberPlateText(vehicle, vehicle_plate)
	SetVehicleDirtLevel(vehicle, 0.0)
	setVehicleFuel(vehicle, vehicle_props.fuelLevel)
	
	local doorTable = {}
	local windowTable = {}
	local tyreTable = {}
	doorTable = json.decode(doorCondition)
	windowTable = json.decode(windowCondition)
	tyreTable = json.decode(tyreCondition)
	if doorCondition ~= nil then
		for k, v in pairs(doorTable) do
			if v then
				SetVehicleDoorBroken(vehicle, tonumber(k), true)
			end
		end
	end
	if windowCondition ~= nil then
		for k, v in pairs(windowTable) do
			if v then
				SmashVehicleWindow(vehicle, tonumber(k))
			end
		end
	end
	if tyreCondition ~= nil then
		for k, v in pairs(tyreTable) do
			if v then
				SetVehicleTyreBurst(vehicle, tonumber(k), false, 1000.0)
			end
		end
	end

	if Config.SetIntoVehicle then
		TaskWarpPedIntoVehicle(ped, vehicle, -1)
	end
	TriggerServerEvent(Config.EventPrefix..":RegisterVehicle", VehToNet(vehicle), vehicle_plate)
	
	SendNUIMessage({
		action = 'closeGarage'
	})
	privateGarage = false
	privateGarageCoords = false
	if Config.CameraEnabled and Config.SetIntoVehicle then
		Wait(100)
		local camRot = GetEntityRotation(ped)
		local x, y, z = camRot.x, camRot.y-Config.CameraOffsetHeight, camRot.z
		SetGameplayCamRelativeRotation(x, y, z)
	end
	EndCam()
end)

RegisterNetEvent(Config.EventPrefix..":takeOutInfSociety")
AddEventHandler(Config.EventPrefix..":takeOutInfSociety", function(vehicle_plate, vehicle_id, index)
	local vehicle_info = {}
	local vehicleSpawned = false
	local sVehicle = nil
	local spawnLocationID = #Config.Garages[index].vehicleSpawn
	local playerJob = PlayerData.job.name:lower()
	if Config.Garages[tonumber(index)].society:lower() == PlayerData.gang.name:lower() then
		playerJob = PlayerData.gang.name:lower()
	end

	for k,v in ipairs(Config.Garages[index].vehicleSpawn) do
		local isPositionOccupied = IsPositionOccupied(v.x, v.y, v.z, posOccupiedRadius, false, true, false, false, false, 0)
		if isPositionOccupied == 1 then
			isPositionOccupied = true
		end
		if not isPositionOccupied then spawnLocationID = k break end
		if k == #Config.Garages[index].vehicleSpawn then
			spawnLocationID = k
			break
		end
	end
	if Config.CameraEnabled then
		StartCam()
	end
	local vector = Config.Garages[index].vehicleSpawn[spawnLocationID]

	if Config.Garages[index].society ~= playerJob then return end

	RequestModel(vehicle_id)
	while not HasModelLoaded(vehicle_id) do Wait(0) end

	for k,v in ipairs(Config.SocietyVehiclesList[playerJob]) do
		if v.vehicleModel == vehicle_id and v.plate:match( "^%s*(.-)%s*$" ) == vehicle_plate:match( "^%s*(.-)%s*$" ) then
			vehicle_info = v
			break
		end
	end

	local vehicle = CreateVehicle(vehicle_id, vector.x, vector.y, vector.z, vector.w, true, true)
	
	while not DoesEntityExist(vehicle) do
		Wait(20)
	end

	local props = QBCore.Functions.GetVehicleProperties(vehicle)
	props.modLivery = vehicle_info.livery
	props.modTurbo = vehicle_info.turbo
	props.modSuspension = vehicle_info.suspension
	props.modEngine = vehicle_info.engine
	props.modArmor = vehicle_info.armor
	props.modTransmission = vehicle_info.transmission
	props.modBrakes = vehicle_info.brakes
	local doors = {}
	if props.doorStatus ~= nil then
		for k,v in pairs(props.doorStatus) do
			doors[tonumber(k)] = v
		end
		props.doorStatus = doors
	end
	QBCore.Functions.SetVehicleProperties(vehicle, props)
	setVehicleFuel(vehicle, 100.0)
	SetVehicleDirtLevel(vehicle, 0.0)
	SetVehicleNumberPlateText(vehicle, vehicle_plate)
	if Config.SetIntoVehicle then
		TaskWarpPedIntoVehicle(ped, vehicle, -1)
	end
	TriggerServerEvent(Config.EventPrefix..":RegisterVehicle", VehToNet(vehicle), vehicle_plate)
	TriggerServerEvent(Config.EventPrefix..":GiveSocietyKeys", playerJob, vehicle_plate, vehicle_id)
	sVehicle = vehicle
	vehicleSpawned = true

	while not vehicleSpawned do
		Citizen.Wait(10)
	end

	SendNUIMessage({
		action = 'closeGarage'
	})
	privateGarage = false
	privateGarageCoords = false

	Wait(100)
	local camRot = GetEntityRotation(ped)
	local x, y, z = camRot.x, camRot.y-Config.CameraOffsetHeight, camRot.z
	SetGameplayCamRelativeRotation(x, y, z)
	if Config.CameraEnabled then
		EndCam()
	end
end)

RegisterNetEvent(Config.EventPrefix..":takeOutRecover")
AddEventHandler(Config.EventPrefix..":takeOutRecover", function(vehicle_props, vehicle_plate, vehicle_id, tyreCondition, doorCondition, windowCondition, index, spawnLocationID)
	local spawnLocationID = spawnLocationID
	local vector
	if type(index) == "number" then
		vector = Config.RecoverVehicle[index].vehicleSpawn[spawnLocationID]
	else
		index = tonumber(index)
		vector = Config.RecoverVehicle[index].vehicleSpawn[spawnLocationID]
	end
	if vehicle_props == nil then
		vehicle_props = {}
	end
	if type(vehicle_props) ~= "table" then
		vehicle_props = json.decode(vehicle_props)
	end
	RequestModel(vehicle_id)
	while not HasModelLoaded(vehicle_id) do Wait(0) end

	local vehicle = CreateVehicle(vehicle_id, vector.x, vector.y, vector.z, vector.w, true, true)
	
	while not DoesEntityExist(vehicle) do
		Wait(20)
	end
	local doors = {}
	if vehicle_props.doorStatus ~= nil then
		for k,v in pairs(vehicle_props.doorStatus) do
			doors[tonumber(k)] = v
		end
		vehicle_props.doorStatus = doors
	end
	QBCore.Functions.SetVehicleProperties(vehicle, vehicle_props)
	if vehicle_props.bodyHealth == nil then
		vehicle_props.bodyHealth = 1000.0
	end
	if vehicle_props.engineHealth == nil then
		vehicle_props.engineHealth = 1000.0
	end
	SetVehicleBodyHealth(vehicle, vehicle_props.bodyHealth + 0.0)
	SetVehicleEngineHealth(vehicle, vehicle_props.engineHealth + 0.0)
	SetVehicleDirtLevel(vehicle, vehicle_props.dirtLevel)
	SetVehicleNumberPlateText(vehicle, vehicle_plate)
	SetVehicleDirtLevel(vehicle, 0.0)
	setVehicleFuel(vehicle, vehicle_props.fuelLevel)
	local vehicleToUnlock = VehToNet(vehicle)
	TriggerServerEvent(Config.EventPrefix..":SetLockStatus", vehicleToUnlock, 2)

	local doorTable = {}
	local windowTable = {}
	local tyreTable = {}
	doorTable = json.decode(doorCondition)
	windowTable = json.decode(windowCondition)
	tyreTable = json.decode(tyreCondition)

	if doorCondition ~= nil then
		for k, v in pairs(doorTable) do
			if v then
				SetVehicleDoorBroken(vehicle, tonumber(k), true)
			end
		end
	end
	if windowCondition ~= nil then
		for k, v in pairs(windowTable) do
			if v then
				SmashVehicleWindow(vehicle, tonumber(k))
			end
		end
	end
	if tyreCondition ~= nil then
		for k, v in pairs(tyreTable) do
			if v then
				SetVehicleTyreBurst(vehicle, tonumber(k), false, 1000.0)
			end
		end
	end

	TriggerEvent(Config.EventPrefix..':notification', _L('vehicle_recovered').title, _L('vehicle_recovered').text, _L('vehicle_recovered').time, _L('vehicle_recovered').type)
	TriggerServerEvent(Config.EventPrefix..":RegisterVehicle", VehToNet(vehicle), vehicle_plate)
end)

RegisterNetEvent(Config.EventPrefix..":takeOutImpound")
AddEventHandler(Config.EventPrefix..":takeOutImpound", function(vehicle_props, vehicle_plate, vehicle_id, tyreCondition, doorCondition, windowCondition, index, spawnLocationID)
	local vector
	if type(index) == "number" then
		vector = Config.Impound[index].vehicleSpawn[spawnLocationID]
	else
		index = tonumber(index)
		vector = Config.Impound[index].vehicleSpawn[spawnLocationID]
	end

	if Config.CameraEnabled and Config.SetIntoVehicle then
		StartCam()
	end

	if vehicle_props == nil then
		vehicle_props = {}
	end
	if type(vehicle_props) ~= "table" then
		vehicle_props = json.decode(vehicle_props)
	end
	RequestModel(vehicle_id)
	while not HasModelLoaded(vehicle_id) do Wait(0) end

	local vehicle = CreateVehicle(vehicle_id, vector.x, vector.y, vector.z, vector.w, true, true)

	while not DoesEntityExist(vehicle) do
		Wait(20)
	end
	local doors = {}
	if vehicle_props.doorStatus ~= nil then
		for k,v in pairs(vehicle_props.doorStatus) do
			doors[tonumber(k)] = v
		end
		vehicle_props.doorStatus = doors
	end
	QBCore.Functions.SetVehicleProperties(vehicle, vehicle_props)
	if vehicle_props.bodyHealth == nil then
		vehicle_props.bodyHealth = 1000.0
	end
	if vehicle_props.engineHealth == nil then
		vehicle_props.engineHealth = 1000.0
	end
	SetVehicleBodyHealth(vehicle, vehicle_props.bodyHealth + 0.0)
	SetVehicleEngineHealth(vehicle, vehicle_props.engineHealth + 0.0)
	SetVehicleDirtLevel(vehicle, vehicle_props.dirtLevel)
	SetVehicleNumberPlateText(vehicle, vehicle_plate)
	SetVehicleDirtLevel(vehicle, 0.0)
	setVehicleFuel(vehicle, vehicle_props.fuelLevel)

	local doorTable = {}
	local windowTable = {}
	local tyreTable = {}
	doorTable = json.decode(doorCondition)
	windowTable = json.decode(windowCondition)
	tyreTable = json.decode(tyreCondition)

	if doorCondition ~= nil then
		for k, v in pairs(doorTable) do
			if v then
				SetVehicleDoorBroken(vehicle, tonumber(k), true)
			end
		end
	end
	if windowCondition ~= nil then
		for k, v in pairs(windowTable) do
			if v then
				SmashVehicleWindow(vehicle, tonumber(k))
			end
		end
	end
	if tyreCondition ~= nil then
		for k, v in pairs(tyreTable) do
			if v then
				SetVehicleTyreBurst(vehicle, tonumber(k), false, 1000.0)
			end
		end
	end

	if Config.SetIntoVehicle then
		TaskWarpPedIntoVehicle(ped, vehicle, -1)
	end

	TriggerEvent(Config.EventPrefix..':notification', _L('vehicle_recovered').title, _L('vehicle_recovered').text, _L('vehicle_recovered').time, _L('vehicle_recovered').type)
	TriggerServerEvent(Config.EventPrefix..":RegisterVehicle", VehToNet(vehicle), vehicle_plate)
	
	if Config.CameraEnabled and Config.SetIntoVehicle then
		Wait(100)
		local camRot = GetEntityRotation(ped)
		local x, y, z = camRot.x, camRot.y-Config.CameraOffsetHeight, camRot.z
		SetGameplayCamRelativeRotation(x, y, z)
		EndCam()
	end
end)

RegisterNetEvent(Config.EventPrefix..":spawnVehicleAdmin", function(player, vehicleName, isSociety)
	local vehHash = GetHashKey(vehicleName)
	RequestModel(vehHash)
	while not HasModelLoaded(vehHash) do
		Wait(0)
	end

	local pos = playerCoords + vec3(0.0, 0.0, 5.0)
	local createdVehicle = CreateVehicle(vehHash, pos, false, false)
	while not DoesEntityExist(createdVehicle) do
		Citizen.Wait(0)
	end

	DisableVehicleWorldCollision(createdVehicle)
	SetEntityAlpha(createdVehicle, 0)
	SetVehicleFixed(createdVehicle)
	local vehicleProps = QBCore.Functions.GetVehicleProperties(createdVehicle)
	local newPlate = GeneratePlate(vehicleName)
	vehicleProps.plate = newPlate
	TriggerServerEvent(Config.EventPrefix..":SetVehicleAsOwned", player, vehicleProps, isSociety, vehicleName, vehHash)
	DeleteVehicle(createdVehicle)
	SetEntityAsNoLongerNeeded(createdVehicle)
	SetModelAsNoLongerNeeded(createdVehicle)
end)

function GeneratePlate(vehicleName)
	local generatedPlate
	local doBreak = false

	while true do
		Citizen.Wait(0)
		math.randomseed(GetGameTimer())
		if Config.PlateUseSpace then
			generatedPlate = string.upper(GetRandomLetter(Config.PlateLetters) .. ' ' .. GetRandomNumber(Config.PlateNumbers))
		else
			generatedPlate = string.upper(GetRandomLetter(Config.PlateLetters) .. GetRandomNumber(Config.PlateNumbers))
		end

		QBCore.Functions.TriggerCallback(Config.EventPrefix..':isPlateTaken', function (isPlateTaken)
			if not isPlateTaken then
				doBreak = true
			end
		end, generatedPlate)

		if doBreak then
			break
		end
	end

	return generatedPlate
end

function GenerateSocietyPlate(vehicleName)
    local letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    local plate = ""

    for i = 1, 2 do
        local randIndex = math.random(#letters)
        plate = plate .. letters:sub(randIndex, randIndex)
    end

    for i = 1, 3 do
        plate = plate .. math.random(0, 9)
    end

    for i = 1, 2 do
        local randIndex = math.random(#letters)
        plate = plate .. letters:sub(randIndex, randIndex)
    end

    return plate
end

function GetRandomNumber(length)
	Citizen.Wait(1)
	math.randomseed(GetGameTimer())
	if length > 0 then
		return GetRandomNumber(length - 1) .. NumberCharset[math.random(1, #NumberCharset)]
	else
		return ''
	end
end

function GetRandomLetter(length)
	Citizen.Wait(1)
	math.randomseed(GetGameTimer())
	if length > 0 then
		return GetRandomLetter(length - 1) .. Charset[math.random(1, #Charset)]
	else
		return ''
	end
end