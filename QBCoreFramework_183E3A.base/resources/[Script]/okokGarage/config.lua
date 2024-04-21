Config = {}

Locales = {}

Config.Debug = false

Config.Locale = 'fr' -- en / pt / gr / fr / de / es

Config.EventPrefix = "okokGarage"

Config.QBCorePrefix = "qb"

Config.onPlayerDeath = "onPlayerDeath"

Config.playerLoaded = "playerLoaded"

Config.getSharedObject = "getSharedObject"

Config.FuelResource = "legaczfuel" -- "nothing" - no fuel resource, "native" - will use the FiveM natives, "legacyfuel", "ox_fuel"

Config.CameraEnabled = true -- Camera animation when taking out a vehicle

Config.ImageType = "vehicle.png" -- "default" - each vehicle uses a unique image (e.g. Zentorno - zentorno.png), "type" - each vehicle type uses an image (e.g. Zentorno - car.png), "single" - all vehicles use the same image (e.g. Zentorno - vehicle.png)

Config.vImageCreator = false -- If true, it'll use vImageCreator

Config.GetVehicleAnywhere = true -- You can get your vehicle from all garages even if you didn't store it there

Config.GetVehicleModelName = true -- If true, it'll get the vehicle model name instead of the vehicle name

Config.CameraAnimationTime = 2 -- Camera animation time in seconds

Config.CameraOffsetHeight = 10 -- The height of the vehicle camera after taking it out

Config.ShakeAmplitude = 0.0 -- Camera shake when viewing a vehicle (0.2 to be like in okokVehicleShop)

Config.InteractionKey = 38 -- [E] Key to open the interaction, check here the keys ID: https://docs.fivem.net/docs/game-references/controls/#controls

Config.UseOkokVehicleKeys = true
Config.LockVehicle = "U" -- This is used to allow custom keybinds that players can change in their settings
Config.LockVehicleCommand = "lockvehicle"
Config.LockVehicleDescription = "Used to lock/unlock vehicle"
Config.LockVehicleAudioVolume = 0.3 -- (0.0 - 1.0)
Config.VehicleRadius = 20.0 -- This is the radius used to check if the player is close enough to lock/unlock vehicle

Config.SaveWithKey = true -- If true, players with the vehicle key can store the vehicle. The vehicle will then be stored in the owner's garage.

Config.GiveKeysCommand = "givekeys"
Config.GiveKeysRadius = 7.5

Config.UseOkokTextUI = true
Config.UseOkOkNotify = true
Config.UseOkOkRequests = true
Config.UseOkOkBanking = true -- For transactions logs

Config.HideMinimap = true

Config.ShowBlips = true

Config.SetIntoVehicle = true -- If true, it'll teleport the player into the vehicle

Config.ShowGaragesBlipCommand = "garageblips"
Config.ShowGaragesBlip = true

Config.StoreOwnedVehiclesOnly = true -- If true, players will only be able to store vehicles they own, if false, they will be able to store any vehicle

Config.StoreVehicleFade = true -- If true, the vehicle will fade out

Config.ShowVehicleImpoundedWhenExists = true -- If true, the vehicle will be available to take out of the impound even when he's spawned in the map

Config.VehicleImpoundedOnDV = true -- If true, the vehicle will be set as impounded when he gets deleted

Config.SetVehicleImpoundAfter = 300 -- How many seconds after taking out the vehicle does it take to set as impounded
Config.CheckInterval = 60 -- How often it'll check for non existing vehicles

Config.ChangeVehicleStateOnStart = true -- If true, vehicle will be set to stored or impounded (Config.SetVehiclesImpoundedOnStart)
Config.SetVehiclesImpoundedOnStart = true -- If true, outside vehicles will be set as impounded on start, if false, they'll be set as stored

Config.UseOkokVehicleSales = false -- If true, If a vehicle is in display he won't show in the impound
Config.okokVehicleSalesName = "okokVehicleSales" -- Name of the vehicle sales script

Config.KeyMetaData = { -- Items will be used instead of the "U" key to lock/unlock vehicles. (Only ox-inventory supported at the moment - if you use another inventory with metadata and would like support to it to be added, please let us know through the tickets)
	inventoryResourceName = "ox_inventory",
	keyItemName = "keys",
	oxInventory = false,
	qbInventory = false,
	qsInventory = false,
	coreInventory = false,
}

Config.HousingSystems = {
	quasarHousing = true
}
Config.ImpoundCommand = "impound"
Config.ImpoundJobs = {"police", "mechanics"} -- Jobs that can impound vehicles
Config.ImpoundDistance = 5.0 -- Max distance you can impound from
Config.ImpoundTimes = {"2", "4", "6", "8", "10", "12", "14", "16", "18", "20", "22", "24"} -- Hours

Config.GlobalImpound = true -- If true, a vehicle can be taken from any impound
Config.PayToImpound = true -- Enable this if a player should be able to skip the impound time by paying.
Config.PayToImpoundFee = 300 -- This is per hour that the player gets their vehicle early
Config.RetrieveFeeEnabled = false -- If enabled, players will have to pay a one time fee when retrieving their vehicle after the timer has finished.
Config.RetrieveFee = 500 -- One time payment once vehicle is retrieved.

Config.AdminGroups = { -- Groups allowed to remove all the vehicles from the impound/give vehicle/remove vehicle/give key
	"god",
	"admin", 
	"mod"
} 
Config.RemoveAllImpoundedVehiclesCommand = "removeallimpoundedvehicles"
Config.GiveVehicle = "givevehicle"
Config.RemoveVehicle = "removevehicle"
Config.GiveKeys = "adminkeys" -- Has to be different to Config.GiveKeysCommand
Config.AdminMenu = "gadmin"

Config.PlateLetters = 3 -- How many letters the plate has (Used when adding a vehicle)
Config.PlateUseSpace = true
Config.PlateNumbers = 3 -- How many numbers the plate has (Used when adding a vehicle)

Config.RandomPlateSociety = false -- If true, will generate a plate for vehicles in infinite garage

Config.CreateGarageCommand = "creategarage"

Config.SellGarageCommand = "sellgarage"
Config.SellGarageRadius = 3.0
Config.SellerComission = 5 -- In percent (%)
Config.RenewalPrice = 500
Config.RenewalIntervals = 7 -- In real life days

Config.MaxPrivateGaragesPerPlayer = 3

-- Used to show the vehicle properties in the view menu
Config.UseKMh = true
Config.MaxSpeedValue = 300
Config.MaxAcceleration = 0.6
Config.MaxBraking = 1.6
Config.MaxHandling = 10

Config.ViewCameraAngle = -60
Config.ViewCameraDistance = 5.5
Config.ViewCameraHeight = 2.0

Config.AllowRepair = true -- If a player can repair the vehicle when viewing the vehicle
Config.RepairPrice = 1000

Config.TakeOutAtView = true -- When taking the vehicle out via the view menu it'll spawn in the same location as the view vehicle

Config.LiveriesAndExtrasCommand = "liveries"
Config.AccessLiveriesExtrasJobs = { -- Add 'all' so everyone can access this menu
	'police',
	'ambulance'
}

-- COMPANY 
Config.MaxEmployees = 7
Config.JobRanks = { -- These are the ranks available on the vehicle shops, you can add or remove as many as you want but leave at least 1. Don't add owner as this is automatically added.
	["Newbie"] = {id = 1, coOwner = false},			-- ID: 1
	["Experienced"] = {id = 2, coOwner = false},	-- ID: 2
	["Expert"] = {id = 3, coOwner = false},			-- ID: 3
	["Sub-Owner"] = {id = 4, coOwner = true}		-- ID: 4 
}

Config.PrivateGarages = {
	blip = { blipId = 524, blipColor = 2, blipScale = 0.9, blipText = "Private Garage For Sale" },
	ownedBlip = { blipId = 524, blipColor = 3, blipScale = 0.9, blipText = "Owned Private Garage"},
	ownedMarker = { id = 36, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 },
	storeVehicleMarker = {id = 36, color = {r = 255, g = 0, b = 0, a = 90}, size = {x = 1.25, y = 1.25, z = 1.25}, radius = 2.5, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations for the sell vehicle marker
	radius = 1
}

Config.HireEmployeeRadius = 15.0

Config.SellBusinessReceivePercentage = 50 -- How much a player will receive for selling his business (in percentage, 50 = 50%)

Config.Companies = {
	["Garage Shop"]	= {
		coords = vec3(112.28, -630.06, 44.23),
		ownerCoords = vec3(112.28, -630.06, 44.23),
		radius = 1,
		price = 12000,
		ownerBlip = {blipId = 475, blipColor = 38, blipScale = 0.9, blipText = "Owner Panel"},
		unownedOwnerBlip = {blipId = 476, blipColor = 2, blipScale = 0.9, blipText = "Unowned Company"},
		ownerMarker = {id = 21, color = {r = 31, g = 94, b = 255, a = 90}, size = {x = 0.5, y = 0.5, z = 0.5}, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 },
		UnownedMarker = {id = 21, color = {r = 0, g = 255, b = 0, a = 90}, size = {x = 0.5, y = 0.5, z = 0.5}, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 },
	},--[[
	["Garage Shop 2"]	= {
		coords = vector3(-949.5,-2946.55,13.95),
		ownerCoords = vector3(-949.5,-2946.55,13.95),
		radius = 1,
		price = 12000,
		ownerBlip = {blipId = 475, blipColor = 38, blipScale = 0.9, blipText = "Owner Panel"},
		unownedOwnerBlip = {blipId = 476, blipColor = 2, blipScale = 0.9, blipText = "Unowned Company"},
		ownerMarker = {id = 21, color = {r = 31, g = 94, b = 255, a = 90}, size = {x = 0.5, y = 0.5, z = 0.5}, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 },
		UnownedMarker = {id = 21, color = {r = 0, g = 255, b = 0, a = 90}, size = {x = 0.5, y = 0.5, z = 0.5}, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 },
	},]]
}

Config.SocietyVehiclesList = {
	['police'] = { -- Society in lowercase
		{
			vehicleModel = 'police',
			plate = 'POLICE',
			minimumGrade = 1,
			livery = 4,
			armor = 4,
			brakes = 2,
			engine = 3,
			suspension = 3,
			transmission = 2,
			turbo = true,
			type = "car"
		},
		{
			vehicleModel = 'Police2',
			plate = 'POLICE',
			minimumGrade = 1,
			livery = -1,
			armor = -1,
			brakes = -1,
			engine = -1,
			suspension = -1,
			transmission = -1,
			turbo = false,
			type = "car"
		},
		{
			vehicleModel = 'riot',
			plate = 'POLICE',
			minimumGrade = 3,
			livery = -1,
			armor = -1,
			brakes = -1,
			engine = -1,
			suspension = -1,
			transmission = -1,
			turbo = false,
			type = "car"
		},
		{
			vehicleModel = 'sheriff2',
			plate = 'POLICE',
			minimumGrade = 3,
			livery = -1,
			armor = -1,
			brakes = -1,
			engine = -1,
			suspension = -1,
			transmission = -1,
			turbo = false,
			type = "car"
		},
		{
			vehicleModel = 'pbus',
			plate = 'POLICE',
			minimumGrade = 3,
			livery = -1,
			armor = -1,
			brakes = -1,
			engine = -1,
			suspension = -1,
			transmission = -1,
			turbo = false,
			type = "car"
		},
	},
}

Config.Garages = { -- Garages list/info
	{
		name = "Legion Square", -- Garage name shown in the menu
		coords = vector3(215.66, -809.93, 30.73), -- Marker position
		blip = { blipId = 524, blipColor = 3, blipScale = 0.9, blipText = "Garage" }, -- Blip informations
		marker = { id = 36, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations
		radius = 1, -- Interaction radius for the marker
		storeVehicleCoords = vector3(214.32, -793.27, 30.8),
		storeVehicleMarker = {id = 36, color = { r = 255, g = 0, b = 0, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, radius = 2.5, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations for the sell vehicle marker
		viewVehicleCoords = vector4(233.12, -789.94, 30.6, 160.55),
		vehicleSpawn = { -- Where the vehicle spawns when you take it out
			vector4(222.16, -804.25, 30.58, 250.0), -- Make it work with multiple spawn points
			vector4(223.46, -799.04, 30.58, 250.0),
			vector4(226.3, -791.58, 30.58, 250.0),
			vector4(215.43, -775.99, 30.43, 248.98),
			vector4(232.69, -773.72, 30.32, 249.76)
		},
		infiniteVehicles = false, -- This will work for societies only, set the society vehicles in the Config.SocietyVehiclesList
		id = "legion", -- ID of the garage, it's used to get what garage is opened | needs to be DIFFERENT for each garage
		society = "", -- Leave blank if not in use
		type = "car" -- car, air or boat
	},
	{
		name = "Alta", -- Garage name shown in the menu
		coords = vector3(278.19, -345.95, 44.92), -- Marker position
		blip = { blipId = 524, blipColor = 3, blipScale = 0.9, blipText = "Garage" }, -- Blip informations
		marker = { id = 36, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations
		radius = 1, -- Interaction radius for the marker
		storeVehicleCoords = vector3(294.05, -340.45, 44.92),
		storeVehicleMarker = {id = 36, color = { r = 255, g = 0, b = 0, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, radius = 2.5, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations for the sell vehicle marker
		viewVehicleCoords = vector4(233.12, -789.94, 30.6, 160.55),
		vehicleSpawn = { -- Where the vehicle spawns when you take it out
			vector4(266.84, -328.77, 44.5, 249.42), -- Make it work with multiple spawn points
			vector4(269.29, -322.26, 44.5, 249.45),
			vector4(287.66, -329.12, 44.5, 249.52),
			vector4(283.91, -338.77, 44.5, 249.58),
			vector4(294.68, -346.56, 44.5, 69.93)
		},
		infiniteVehicles = false, -- This will work for societies only, set the society vehicles in the Config.SocietyVehiclesList
		id = "alta", -- ID of the garage, it's used to get what garage is opened | needs to be DIFFERENT for each garage
		society = "", -- Leave blank if not in use
		type = "car" -- car, air or boat
	},
	{
		name = "Textile City", -- Garage name shown in the menu
		coords = vector3(412.74, -634.35, 28.5), -- Marker position
		blip = { blipId = 524, blipColor = 3, blipScale = 0.9, blipText = "Garage" }, -- Blip informations
		marker = { id = 36, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations
		radius = 1, -- Interaction radius for the marker
		storeVehicleCoords = vector3(402.15, -643.13, 28.5),
		storeVehicleMarker = {id = 36, color = { r = 255, g = 0, b = 0, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, radius = 2.5, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations for the sell vehicle marker
		viewVehicleCoords = vector4(423.51, -642.01, 28.08, 179.08),
		vehicleSpawn = { -- Where the vehicle spawns when you take it out
			vector4(408.8, -638.68, 28.08, 270.0), -- Make it work with multiple spawn points
			vector4(393.08, -638.73, 28.08, 270.81),
			vector4(393.21, -649.69, 28.08, 270.43),
			vector4(392.48, -657.72, 28.08, 270.83),
			vector4(415.9, -649.35, 28.08, 270.51)
		},
		infiniteVehicles = false, -- This will work for societies only, set the society vehicles in the Config.SocietyVehiclesList
		id = "textilecity", -- ID of the garage, it's used to get what garage is opened | needs to be DIFFERENT for each garage
		society = "", -- Leave blank if not in use
		type = "car" -- car, air or boat
	},
	{
		name = "Pillbox Hill", -- Garage name shown in the menu
		coords = vector3(-332.01, -781.39, 33.96), -- Marker position
		blip = { blipId = 524, blipColor = 3, blipScale = 0.9, blipText = "Garage" }, -- Blip informations
		marker = { id = 36, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations
		radius = 1, -- Interaction radius for the marker
		storeVehicleCoords = vector3(-331.93, -768.52, 33.97),
		storeVehicleMarker = {id = 36, color = { r = 255, g = 0, b = 0, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, radius = 2.5, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations for the sell vehicle marker
		viewVehicleCoords = vector4(-348.88, -775.52, 33.54, 359.15),
		vehicleSpawn = { -- Where the vehicle spawns when you take it out
			vector4(-320.15, -752.3, 33.54, 159.86), -- Make it work with multiple spawn points
			vector4(-331.77, -750.56, 33.54, 181.7),
			vector4(-341.29, -756.81, 33.54, 91.4),
			vector4(-357.49, -764.41, 33.54, 269.31),
			vector4(-307.79, -756.62, 33.54, 161.04)
		},
		infiniteVehicles = false, -- This will work for societies only, set the society vehicles in the Config.SocietyVehiclesList
		id = "pillboxhill", -- ID of the garage, it's used to get what garage is opened | needs to be DIFFERENT for each garage
		society = "", -- Leave blank if not in use
		type = "car" -- car, air or boat
	},
	{
		name = "West Vinewood", -- Garage name shown in the menu
		coords = vector3(-515.93, 53.0, 52.58), -- Marker position
		blip = { blipId = 524, blipColor = 3, blipScale = 0.9, blipText = "Garage" }, -- Blip informations
		marker = { id = 36, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations
		radius = 1, -- Interaction radius for the marker
		storeVehicleCoords = vector3(-529.11, 48.59, 52.58),
		storeVehicleMarker = {id = 36, color = { r = 255, g = 0, b = 0, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, radius = 2.5, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations for the sell vehicle marker
		viewVehicleCoords = vector4(-524.62, 37.15, 52.16, 355.19),
		vehicleSpawn = { -- Where the vehicle spawns when you take it out
			vector4(-537.01, 40.77, 52.16, 265.99), -- Make it work with multiple spawn points
			vector4(-509.52, 65.48, 52.16, 85.36),
			vector4(-510.96, 55.17, 52.16, 84.34),
			vector4(-519.69, 66.28, 52.16, 84.99),
			vector4(-504.47, 54.48, 56.07, 265.69)
		},
		infiniteVehicles = false, -- This will work for societies only, set the society vehicles in the Config.SocietyVehiclesList
		id = "westvinewood", -- ID of the garage, it's used to get what garage is opened | needs to be DIFFERENT for each garage
		society = "", -- Leave blank if not in use
		type = "car" -- car, air or boat
	},
	{
		name = "West Vinewood 2", -- Garage name shown in the menu
		coords = vector3(-570.24, 311.83, 84.49), -- Marker position
		blip = { blipId = 524, blipColor = 3, blipScale = 0.9, blipText = "Garage" }, -- Blip informations
		marker = { id = 36, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations
		radius = 1, -- Interaction radius for the marker
		storeVehicleCoords = vector3(-561.5, 328.39, 84.41),
		storeVehicleMarker = {id = 36, color = { r = 255, g = 0, b = 0, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, radius = 2.5, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations for the sell vehicle marker
		viewVehicleCoords = vector4(-579.38, 330.2, 84.34, 264.51),
		vehicleSpawn = { -- Where the vehicle spawns when you take it out
			vector4(-580.68, 314.45, 84.37, 354.67), -- Make it work with multiple spawn points
			vector4(-588.58, 335.45, 84.67, 175.84),
			vector4(-601.55, 345.46, 84.69, 175.98)
		},
		infiniteVehicles = false, -- This will work for societies only, set the society vehicles in the Config.SocietyVehiclesList
		id = "westvinewood2", -- ID of the garage, it's used to get what garage is opened | needs to be DIFFERENT for each garage
		society = "", -- Leave blank if not in use
		type = "car" -- car, air or boat
	},
	{
		name = "Vinewood Hills", -- Garage name shown in the menu
		coords = vector3(886.2, -1.13, 78.76), -- Marker position
		blip = { blipId = 524, blipColor = 3, blipScale = 0.9, blipText = "Garage" }, -- Blip informations
		marker = { id = 36, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations
		radius = 1, -- Interaction radius for the marker
		storeVehicleCoords = vector3(878.34, -10.78, 78.76),
		storeVehicleMarker = {id = 36, color = { r = 255, g = 0, b = 0, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, radius = 2.5, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations for the sell vehicle marker
		viewVehicleCoords = vector4(870.99, -22.5, 78.34, 147.82),
		vehicleSpawn = { -- Where the vehicle spawns when you take it out
			vector4(858.37, -28.97, 78.34, 237.92), -- Make it work with multiple spawn points
			vector4(865.02, -45.35, 78.34, 57.82),
			vector4(890.62, -45.15, 78.34, 57.29)
		},
		infiniteVehicles = false, -- This will work for societies only, set the society vehicles in the Config.SocietyVehiclesList
		id = "vinewoodhills", -- ID of the garage, it's used to get what garage is opened | needs to be DIFFERENT for each garage
		society = "", -- Leave blank if not in use
		type = "car" -- car, air or boat
	},
	{
		name = "Vinewood Hills 2", -- Garage name shown in the menu
		coords = vector3(664.45, 630.94, 128.91), -- Marker position
		blip = { blipId = 524, blipColor = 3, blipScale = 0.9, blipText = "Garage" }, -- Blip informations
		marker = { id = 36, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations
		radius = 1, -- Interaction radius for the marker
		storeVehicleCoords = vector3(655.81, 631.84, 128.91),
		storeVehicleMarker = {id = 36, color = { r = 255, g = 0, b = 0, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, radius = 2.5, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations for the sell vehicle marker
		viewVehicleCoords = vector4(650.71, 617.75, 128.49, 159.21),
		vehicleSpawn = { -- Where the vehicle spawns when you take it out
			vector4(638.47, 606.27, 128.49, 250.49), -- Make it work with multiple spawn points
			vector4(654.98, 606.79, 128.49, 71.33),
			vector4(636.39, 625.62, 128.49, 70.06)
		},
		infiniteVehicles = false, -- This will work for societies only, set the society vehicles in the Config.SocietyVehiclesList
		id = "vinewoodhills2", -- ID of the garage, it's used to get what garage is opened | needs to be DIFFERENT for each garage
		society = "", -- Leave blank if not in use
		type = "car" -- car, air or boat
	},
	{
		name = "Vinewood Hills 3", -- Garage name shown in the menu
		coords = vector3(-77.07, 907.36, 235.81), -- Marker position
		blip = { blipId = 524, blipColor = 3, blipScale = 0.9, blipText = "Garage" }, -- Blip informations
		marker = { id = 36, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations
		radius = 1, -- Interaction radius for the marker
		storeVehicleCoords = vector3(-75.47, 895.6, 235.5),
		storeVehicleMarker = {id = 36, color = { r = 255, g = 0, b = 0, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, radius = 2.5, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations for the sell vehicle marker
		viewVehicleCoords = vector4(-76.79, 894.18, 235.19, 29.7),
		vehicleSpawn = { -- Where the vehicle spawns when you take it out
			vector4(-66.23, 892.11, 235.13, 115.63), -- Make it work with multiple spawn points
			vector4(-71.02, 903.26, 235.19, 114.49)
		},
		infiniteVehicles = false, -- This will work for societies only, set the society vehicles in the Config.SocietyVehiclesList
		id = "vinewoodhills3", -- ID of the garage, it's used to get what garage is opened | needs to be DIFFERENT for each garage
		society = "", -- Leave blank if not in use
		type = "car" -- car, air or boat
	},
	{
		name = "Harmony", -- Garage name shown in the menu
		coords = vector3(599.73, 2726.74, 41.91), -- Marker position
		blip = { blipId = 524, blipColor = 3, blipScale = 0.9, blipText = "Garage" }, -- Blip informations
		marker = { id = 36, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations
		radius = 1, -- Interaction radius for the marker
		storeVehicleCoords = vector3(593.19, 2730.84, 42.02),
		storeVehicleMarker = {id = 36, color = { r = 255, g = 0, b = 0, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, radius = 2.5, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations for the sell vehicle marker
		viewVehicleCoords = vector4(612.4, 2731.64, 41.55, 274.05),
		vehicleSpawn = { -- Where the vehicle spawns when you take it out
			vector4(624.26, 2724.0, 41.4, 5.26), -- Make it work with multiple spawn points
			vector4(583.25, 2736.76, 41.58, 184.15),
			vector4(581.21, 2720.36, 41.64, 4.71)
		},
		infiniteVehicles = false, -- This will work for societies only, set the society vehicles in the Config.SocietyVehiclesList
		id = "harmony", -- ID of the garage, it's used to get what garage is opened | needs to be DIFFERENT for each garage
		society = "", -- Leave blank if not in use
		type = "car" -- car, air or boat
	},
	{
		name = "Banham Canyon", -- Garage name shown in the menu
		coords = vector3(-3048.89, 611.0, 7.18), -- Marker position
		blip = { blipId = 524, blipColor = 3, blipScale = 0.9, blipText = "Garage" }, -- Blip informations
		marker = { id = 36, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations
		radius = 1, -- Interaction radius for the marker
		storeVehicleCoords = vector3(-3041.26, 607.11, 7.5),
		storeVehicleMarker = {id = 36, color = { r = 255, g = 0, b = 0, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, radius = 2.5, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations for the sell vehicle marker
		viewVehicleCoords = vector4(-3040.33, 601.09, 7.15, 290.33),
		vehicleSpawn = { -- Where the vehicle spawns when you take it out
			vector4(-3056.03, 608.34, 6.79, 291.97), -- Make it work with multiple spawn points
			vector4(-3053.88, 602.67, 6.87, 289.86),
			vector4(-3051.78, 596.95, 7.02, 289.15)
		},
		infiniteVehicles = false, -- This will work for societies only, set the society vehicles in the Config.SocietyVehiclesList
		id = "banhamcanyon", -- ID of the garage, it's used to get what garage is opened | needs to be DIFFERENT for each garage
		society = "", -- Leave blank if not in use
		type = "car" -- car, air or boat
	},
	{
		name = "Downtown Vinewood", -- Garage name shown in the menu
		coords = vector3(364.39, 297.84, 103.49), -- Marker position
		blip = { blipId = 524, blipColor = 3, blipScale = 0.9, blipText = "Garage" }, -- Blip informations
		marker = { id = 36, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations
		radius = 1, -- Interaction radius for the marker
		storeVehicleCoords = vector3(372.99, 289.74, 103.27),
		storeVehicleMarker = {id = 36, color = { r = 255, g = 0, b = 0, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, radius = 2.5, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations for the sell vehicle marker
		viewVehicleCoords = vector4(362.74, 280.75, 102.89, 189.33),
		vehicleSpawn = { -- Where the vehicle spawns when you take it out
			vector4(386.95, 291.72, 102.63, 165.04), -- Make it work with multiple spawn points
			vector4(392.69, 280.48, 102.56, 71.03),
			vector4(371.48, 266.74, 102.6, 340.53)
		},
		infiniteVehicles = false, -- This will work for societies only, set the society vehicles in the Config.SocietyVehiclesList
		id = "downtownvinewood", -- ID of the garage, it's used to get what garage is opened | needs to be DIFFERENT for each garage
		society = "", -- Leave blank if not in use
		type = "car" -- car, air or boat
	},
	{
		name = "Grand Senora", -- Garage name shown in the menu
		coords = vector3(1984.54, 3065.77, 47.01), -- Marker position
		blip = { blipId = 524, blipColor = 3, blipScale = 0.9, blipText = "Garage" }, -- Blip informations
		marker = { id = 36, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations
		radius = 1, -- Interaction radius for the marker
		storeVehicleCoords = vector3(1990.1, 3070.05, 47.0),
		storeVehicleMarker = {id = 36, color = { r = 255, g = 0, b = 0, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, radius = 2.5, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations for the sell vehicle marker
		viewVehicleCoords = vector4(2006.03, 3071.98, 46.63, 59.49),
		vehicleSpawn = { -- Where the vehicle spawns when you take it out
			vector4(2012.04, 3055.3, 46.62, 58.94), -- Make it work with multiple spawn points
			vector4(2016.86, 3062.81, 46.62, 60.09),
			vector4(1999.63, 3081.81, 46.65, 148.07)
		},
		infiniteVehicles = false, -- This will work for societies only, set the society vehicles in the Config.SocietyVehiclesList
		id = "grandsenora", -- ID of the garage, it's used to get what garage is opened | needs to be DIFFERENT for each garage
		society = "", -- Leave blank if not in use
		type = "car" -- car, air or boat
	},
	{
		name = "Sandy Shores MC", -- Garage name shown in the menu
		coords = vector3(1836.58, 3668.21, 33.68), -- Marker position
		blip = { blipId = 524, blipColor = 3, blipScale = 0.9, blipText = "Garage" }, -- Blip informations
		marker = { id = 36, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations
		radius = 1, -- Interaction radius for the marker
		storeVehicleCoords = vector3(1844.66, 3663.68, 34.15),
		storeVehicleMarker = {id = 36, color = { r = 255, g = 0, b = 0, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, radius = 2.5, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations for the sell vehicle marker
		viewVehicleCoords = vector4(1836.34, 3656.15, 33.85, 118.6),
		vehicleSpawn = { -- Where the vehicle spawns when you take it out
			vector4(1853.67, 3676.2, 33.33, 210.23), -- Make it work with multiple spawn points
			vector4(1831.35, 3663.51, 33.44, 210.09),
			vector4(1825.11, 3659.53, 33.58, 209.13)
		},
		infiniteVehicles = false, -- This will work for societies only, set the society vehicles in the Config.SocietyVehiclesList
		id = "sandyshoresmc", -- ID of the garage, it's used to get what garage is opened | needs to be DIFFERENT for each garage
		society = "", -- Leave blank if not in use
		type = "car" -- car, air or boat
	},
	{
		name = "San Chianski", -- Garage name shown in the menu
		coords = vector3(2761.43, 3452.49, 55.84), -- Marker position
		blip = { blipId = 524, blipColor = 3, blipScale = 0.9, blipText = "Garage" }, -- Blip informations
		marker = { id = 36, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations
		radius = 1, -- Interaction radius for the marker
		storeVehicleCoords = vector3(2750.55, 3445.04, 56.1),
		storeVehicleMarker = {id = 36, color = { r = 255, g = 0, b = 0, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, radius = 2.5, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations for the sell vehicle marker
		viewVehicleCoords = vector4(2777.97, 3462.32, 55.06, 158.35),
		vehicleSpawn = { -- Where the vehicle spawns when you take it out
			vector4(2775.86, 3436.56, 55.39, 67.43), -- Make it work with multiple spawn points
			vector4(2791.24, 3474.5, 54.85, 68.56),
			vector4(2769.44, 3473.51, 55.08, 67.23)
		},
		infiniteVehicles = false, -- This will work for societies only, set the society vehicles in the Config.SocietyVehiclesList
		id = "sanchianski", -- ID of the garage, it's used to get what garage is opened | needs to be DIFFERENT for each garage
		society = "", -- Leave blank if not in use
		type = "car" -- car, air or boat
	},
	{
		name = "Mirror Park", -- Garage name shown in the menu
		coords = vector3(1034.69, -766.03, 58.0), -- Marker position
		blip = { blipId = 524, blipColor = 3, blipScale = 0.9, blipText = "Garage" }, -- Blip informations
		marker = { id = 36, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations
		radius = 1, -- Interaction radius for the marker
		storeVehicleCoords = vector3(1025.51, -759.96, 57.99),
		storeVehicleMarker = {id = 36, color = { r = 255, g = 0, b = 0, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, radius = 2.5, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations for the sell vehicle marker
		viewVehicleCoords = vector4(1022.15, -771.78, 57.6, 225.44),
		vehicleSpawn = { -- Where the vehicle spawns when you take it out
			vector4(1017.16, -760.3, 57.55, 222.93), -- Make it work with multiple spawn points
			vector4(1027.52, -785.35, 57.45, 310.28),
			vector4(1047.0, -785.62, 57.57, 91.26)
		},
		infiniteVehicles = false, -- This will work for societies only, set the society vehicles in the Config.SocietyVehiclesList
		id = "mirrorpark", -- ID of the garage, it's used to get what garage is opened | needs to be DIFFERENT for each garage
		society = "", -- Leave blank if not in use
		type = "car" -- car, air or boat
	},
	{
		name = "La Puerta", -- Garage name shown in the menu
		coords = vector3(-1082.51, -1261.67, 5.61), -- Marker position
		blip = { blipId = 524, blipColor = 3, blipScale = 0.9, blipText = "Garage" }, -- Blip informations
		marker = { id = 36, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations
		radius = 1, -- Interaction radius for the marker
		storeVehicleCoords = vector3(-1065.57, -1261.42, 6.01),
		storeVehicleMarker = {id = 36, color = { r = 255, g = 0, b = 0, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, radius = 2.5, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations for the sell vehicle marker
		viewVehicleCoords = vector4(-1078.22, -1246.83, 4.84, 215.33),
		vehicleSpawn = { -- Where the vehicle spawns when you take it out
			vector4(-1075.61, -1267.34, 5.48, 299.93), -- Make it work with multiple spawn points
			vector4(-1080.98, -1258.0, 5.13, 300.38),
			vector4(-1074.83, -1240.87, 4.85, 120.24)
		},
		infiniteVehicles = false, -- This will work for societies only, set the society vehicles in the Config.SocietyVehiclesList
		id = "lapuerta", -- ID of the garage, it's used to get what garage is opened | needs to be DIFFERENT for each garage
		society = "", -- Leave blank if not in use
		type = "car" -- car, air or boat
	},
	{
		name = "Paleto Bay", -- Garage name shown in the menu
		coords = vector3(137.66, 6612.97, 31.83), -- Marker position
		blip = { blipId = 524, blipColor = 3, blipScale = 0.9, blipText = "Garage" }, -- Blip informations
		marker = { id = 36, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations
		radius = 1, -- Interaction radius for the marker
		storeVehicleCoords = vector3(147.58, 6622.93, 31.77),
		storeVehicleMarker = {id = 36, color = { r = 255, g = 0, b = 0, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, radius = 2.5, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations for the sell vehicle marker
		viewVehicleCoords = vector4(129.92, 6607.48, 31.42, 219.53),
		vehicleSpawn = { -- Where the vehicle spawns when you take it out
			vector4(151.05, 6607.28, 31.45, 358.41), -- Make it work with multiple spawn points
			vector4(145.84, 6613.57, 31.39, 359.11),
			vector4(155.75, 6592.76, 31.42, 179.37)
		},
		infiniteVehicles = false, -- This will work for societies only, set the society vehicles in the Config.SocietyVehiclesList
		id = "paletobay", -- ID of the garage, it's used to get what garage is opened | needs to be DIFFERENT for each garage
		society = "", -- Leave blank if not in use
		type = "car" -- car, air or boat
	},
	{
		name = "Paleto Bay 2", -- Garage name shown in the menu
		coords = vector3(-274.94, 6126.03, 31.48), -- Marker position
		blip = { blipId = 524, blipColor = 3, blipScale = 0.9, blipText = "Garage" }, -- Blip informations
		marker = { id = 36, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations
		radius = 1, -- Interaction radius for the marker
		storeVehicleCoords = vector3(-280.27, 6120.74, 31.51),
		storeVehicleMarker = {id = 36, color = { r = 255, g = 0, b = 0, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, radius = 2.5, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations for the sell vehicle marker
		viewVehicleCoords = vector4(-292.71, 6132.29, 31.08, 206.07),
		vehicleSpawn = { -- Where the vehicle spawns when you take it out
			vector4(-282.03, 6142.62, 31.08, 135.25), -- Make it work with multiple spawn points
			vector4(-276.61, 6137.28, 31.08, 135.7),
			vector4(-303.97, 6129.09, 31.08, 225.36)
		},
		infiniteVehicles = false, -- This will work for societies only, set the society vehicles in the Config.SocietyVehiclesList
		id = "paletobay2", -- ID of the garage, it's used to get what garage is opened | needs to be DIFFERENT for each garage
		society = "", -- Leave blank if not in use
		type = "car" -- car, air or boat
	},
	{
		name = "Rancho", -- Garage name shown in the menu
		coords = vector3(384.21, -1612.76, 29.29), -- Marker position
		blip = { blipId = 524, blipColor = 3, blipScale = 0.9, blipText = "Garage" }, -- Blip informations
		marker = { id = 36, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations
		radius = 1, -- Interaction radius for the marker
		storeVehicleCoords = vector3(397.2, -1613.16, 29.29),
		storeVehicleMarker = {id = 36, color = { r = 255, g = 0, b = 0, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, radius = 2.5, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations for the sell vehicle marker
		viewVehicleCoords = vector4(385.8, -1622.36, 28.87, 308.69),
		vehicleSpawn = { -- Where the vehicle spawns when you take it out
			vector4(395.51, -1626.53, 28.87, 49.3), -- Make it work with multiple spawn points
			vector4(388.55, -1612.64, 28.87, 230.57)
		},
		infiniteVehicles = false, -- This will work for societies only, set the society vehicles in the Config.SocietyVehiclesList
		id = "rancho", -- ID of the garage, it's used to get what garage is opened | needs to be DIFFERENT for each garage
		society = "", -- Leave blank if not in use
		type = "car" -- car, air or boat
	},
	{
		name = "Rancho 2", -- Garage name shown in the menu
		coords = vector3(443.0, -1969.08, 24.4), -- Marker position
		blip = { blipId = 524, blipColor = 3, blipScale = 0.9, blipText = "Garage" }, -- Blip informations
		marker = { id = 36, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations
		radius = 1, -- Interaction radius for the marker
		storeVehicleCoords = vector3(457.17, -1977.47, 22.96),
		storeVehicleMarker = {id = 36, color = { r = 255, g = 0, b = 0, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, radius = 2.5, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations for the sell vehicle marker
		viewVehicleCoords = vector4(464.89, -1990.1, 22.55, 130.05),
		vehicleSpawn = { -- Where the vehicle spawns when you take it out
			vector4(453.99, -1965.92, 22.55, 180.38), -- Make it work with multiple spawn points
			vector4(449.5, -1960.62, 22.55, 182.45)
		},
		infiniteVehicles = false, -- This will work for societies only, set the society vehicles in the Config.SocietyVehiclesList
		id = "rancho2", -- ID of the garage, it's used to get what garage is opened | needs to be DIFFERENT for each garage
		society = "", -- Leave blank if not in use
		type = "car" -- car, air or boat
	},
	{
		name = "Del Perro", -- Garage name shown in the menu
		coords = vector3(-1523.96, -451.46, 35.6), -- Marker position
		blip = { blipId = 524, blipColor = 3, blipScale = 0.9, blipText = "Garage" }, -- Blip informations
		marker = { id = 36, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations
		radius = 1, -- Interaction radius for the marker
		storeVehicleCoords = vector3(-1519.72, -445.65, 35.44),
		storeVehicleMarker = {id = 36, color = { r = 255, g = 0, b = 0, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, radius = 2.5, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations for the sell vehicle marker
		viewVehicleCoords = vector4(-1524.46, -434.02, 35.02, 207.58),
		vehicleSpawn = { -- Where the vehicle spawns when you take it out
			vector4(-1522.3, -418.57, 35.02, 230.52), -- Make it work with multiple spawn points
			vector4(-1526.95, -423.81, 35.02, 230.73)
		},
		infiniteVehicles = false, -- This will work for societies only, set the society vehicles in the Config.SocietyVehiclesList
		id = "delperro", -- ID of the garage, it's used to get what garage is opened | needs to be DIFFERENT for each garage
		society = "", -- Leave blank if not in use
		type = "car" -- car, air or boat
	},
	{
		name = "Davis", -- Garage name shown in the menu
		coords = vector3(-71.77, -1821.7, 26.94), -- Marker position
		blip = { blipId = 524, blipColor = 3, blipScale = 0.9, blipText = "Garage" }, -- Blip informations
		marker = { id = 36, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations
		radius = 1, -- Interaction radius for the marker
		storeVehicleCoords = vector3(-50.89, -1831.68, 26.57),
		storeVehicleMarker = {id = 36, color = { r = 255, g = 0, b = 0, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, radius = 2.5, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations for the sell vehicle marker
		viewVehicleCoords = vector4(-65.56, -1833.55, 26.45, 253.19),
		vehicleSpawn = { -- Where the vehicle spawns when you take it out
			vector4(-60.26, -1843.13, 26.16, 319.89), -- Make it work with multiple spawn points
			vector4(-52.36, -1849.82, 25.85, 320.93)
		},
		infiniteVehicles = false, -- This will work for societies only, set the society vehicles in the Config.SocietyVehiclesList
		id = "davis", -- ID of the garage, it's used to get what garage is opened | needs to be DIFFERENT for each garage
		society = "", -- Leave blank if not in use
		type = "car" -- car, air or boat
	},
	{
		name = "Grapeseed", -- Garage name shown in the menu
		coords = vector3(1698.05, 4792.72, 41.92), -- Marker position
		blip = { blipId = 524, blipColor = 3, blipScale = 0.9, blipText = "Garage" }, -- Blip informations
		marker = { id = 36, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations
		radius = 1, -- Interaction radius for the marker
		storeVehicleCoords = vector3(1691.35, 4794.65, 41.92),
		storeVehicleMarker = {id = 36, color = { r = 255, g = 0, b = 0, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, radius = 2.5, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations for the sell vehicle marker
		viewVehicleCoords = vector4(1708.66, 4802.96, 41.36, 90.87),
		vehicleSpawn = { -- Where the vehicle spawns when you take it out
			vector4(1691.42, 4788.03, 41.5, 89.22), -- Make it work with multiple spawn points
			vector4(1691.61, 4774.13, 41.5, 91.71)
		},
		infiniteVehicles = false, -- This will work for societies only, set the society vehicles in the Config.SocietyVehiclesList
		id = "grapeseed", -- ID of the garage, it's used to get what garage is opened | needs to be DIFFERENT for each garage
		society = "", -- Leave blank if not in use
		type = "car" -- car, air or boat
	},
	{
		name = "Mount Chiliad", -- Garage name shown in the menu
		coords = vector3(1721.4, 6410.46, 34.01), -- Marker position
		blip = { blipId = 524, blipColor = 3, blipScale = 0.9, blipText = "Garage" }, -- Blip informations
		marker = { id = 36, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations
		radius = 1, -- Interaction radius for the marker
		storeVehicleCoords = vector3(1722.91, 6394.3, 34.24),
		storeVehicleMarker = {id = 36, color = { r = 255, g = 0, b = 0, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, radius = 2.5, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations for the sell vehicle marker
		viewVehicleCoords = vector4(1734.67, 6398.26, 34.49, 92.25),
		vehicleSpawn = { -- Where the vehicle spawns when you take it out
			vector4(1729.74, 6405.79, 34.04, 152.75), -- Make it work with multiple spawn points
			vector4(1717.45, 6416.34, 33.02, 243.98)
		},
		infiniteVehicles = false, -- This will work for societies only, set the society vehicles in the Config.SocietyVehiclesList
		id = "mountchiliad", -- ID of the garage, it's used to get what garage is opened | needs to be DIFFERENT for each garage
		society = "", -- Leave blank if not in use
		type = "car" -- car, air or boat
	},
	{
		name = "Zancudo River", -- Garage name shown in the menu
		coords = vector3(-1130.62, 2675.25, 18.18), -- Marker position
		blip = { blipId = 524, blipColor = 3, blipScale = 0.9, blipText = "Garage" }, -- Blip informations
		marker = { id = 36, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations
		radius = 1, -- Interaction radius for the marker
		storeVehicleCoords = vector3(-1136.76, 2669.33, 18.1),
		storeVehicleMarker = {id = 36, color = { r = 255, g = 0, b = 0, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, radius = 2.5, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations for the sell vehicle marker
		viewVehicleCoords = vector4(-1153.04, 2661.34, 17.67, 221.45),
		vehicleSpawn = { -- Where the vehicle spawns when you take it out
			vector4(-1159.62, 2673.95, 17.67, 222.74), -- Make it work with multiple spawn points
			vector4(-1154.93, 2678.09, 17.67, 220.94)
		},
		infiniteVehicles = false, -- This will work for societies only, set the society vehicles in the Config.SocietyVehiclesList
		id = "zancudoriver", -- ID of the garage, it's used to get what garage is opened | needs to be DIFFERENT for each garage
		society = "", -- Leave blank if not in use
		type = "car" -- car, air or boat
	},
	{
		name = "Tataviam Mountains", -- Garage name shown in the menu
		coords = vector3(2588.15, 426.63, 108.55), -- Marker position
		blip = { blipId = 524, blipColor = 3, blipScale = 0.9, blipText = "Garage" }, -- Blip informations
		marker = { id = 36, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations
		radius = 1, -- Interaction radius for the marker
		storeVehicleCoords = vector3(2570.9, 416.1, 108.46),
		storeVehicleMarker = {id = 36, color = { r = 255, g = 0, b = 0, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, radius = 2.5, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations for the sell vehicle marker
		viewVehicleCoords = vector4(2578.66, 403.31, 108.03, 238.04),
		vehicleSpawn = { -- Where the vehicle spawns when you take it out
			vector4(2576.07, 428.77, 108.03, 180.28), -- Make it work with multiple spawn points
			vector4(2583.07, 428.63, 108.03, 179.74)
		},
		infiniteVehicles = false, -- This will work for societies only, set the society vehicles in the Config.SocietyVehiclesList
		id = "tataviammountains", -- ID of the garage, it's used to get what garage is opened | needs to be DIFFERENT for each garage
		society = "", -- Leave blank if not in use
		type = "car" -- car, air or boat
	},
	{
		name = "LS Airport", -- Garage name shown in the menu
		coords = vector3(-949.49, -2582.63, 13.83), -- Marker position
		blip = { blipId = 524, blipColor = 3, blipScale = 0.9, blipText = "Garage" }, -- Blip informations
		marker = { id = 36, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations
		radius = 1, -- Interaction radius for the marker
		storeVehicleCoords = vector3(-948.02, -2589.07, 13.83),
		storeVehicleMarker = {id = 36, color = { r = 255, g = 0, b = 0, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, radius = 2.5, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations for the sell vehicle marker
		viewVehicleCoords = vector4(-959.68, -2594.74, 13.42, 129.07),
		vehicleSpawn = { -- Where the vehicle spawns when you take it out
			vector4(-957.98, -2604.35, 13.42, 60.79), -- Make it work with multiple spawn points
			vector4(-957.04, -2583.48, 13.41, 240.27)
		},
		infiniteVehicles = false, -- This will work for societies only, set the society vehicles in the Config.SocietyVehiclesList
		id = "lsairport", -- ID of the garage, it's used to get what garage is opened | needs to be DIFFERENT for each garage
		society = "", -- Leave blank if not in use
		type = "car" -- car, air or boat
	},
	-- Boats
	{
		name = "Boat", -- Garage name shown in the menu
		coords = vector3(-726.15, -1333.12, 1.6), -- Marker position
		blip = { blipId = 410, blipColor = 3, blipScale = 0.9, blipText = "Boat Garage" }, -- Blip informations
		marker = { id = 35, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations
		radius = 2, -- Interaction radius for the marker
		storeVehicleCoords = vector3(-747.33, -1356.48, 1.1),
		storeVehicleMarker = {id = 35, color = { r = 255, g = 0, b = 0, a = 90 }, size = { x = 1.0, y = 1.0, z = 1.0 }, radius = 4.0, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations for the sell vehicle marker
		viewVehicleCoords = vector4(-722.91, -1352.47, 0.12, 128.26),
		vehicleSpawn = { -- Where the vehicle spawns when you take it out
			vector4(-704.71, -1341.66, -0.09, 134.81), -- Make it work with multiple spawn points
			vector4(-711.88, -1329.8, 0.43, 142.34),

		},
		infiniteVehicles = false, -- This will work for societies only, set the society vehicles in the Config.SocietyVehiclesList
		id = "boat", -- ID of the garage, it's used to get what garage is opened | needs to be DIFFERENT for each garage
		society = "", -- Leave blank if not in use
		type = "boat" -- car, air or boat
	},
	-- Airplanes
	{
		name = "Air", -- Garage name shown in the menu
		coords = vector3(-943.03, -2962.05, 13.95), -- Marker position
		blip = { blipId = 43, blipColor = 3, blipScale = 0.9, blipText = "Air Garage" }, -- Blip informations
		marker = { id = 34, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations
		radius = 5, -- Interaction radius for the marker
		storeVehicleCoords = vector3(-1007.54, -2979.84, 13.95),
		storeVehicleMarker = {id = 34, color = { r = 255, g = 0, b = 0, a = 90 }, size = { x = 1.25, y = 1.25, z = 1.25 }, radius = 5.0, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations for the sell vehicle marker
		viewVehicleCoords = vector4(-979.32, -2997.89, 13.95, 59.19),
		vehicleSpawn = { -- Where the vehicle spawns when you take it out
			vector4(-1007.13, -3015.86, 13.95, 55.89), -- Make it work with multiple spawn points
			vector4(-979.32, -2997.89, 13.95, 59.19),
			vector4(-960.99, -2964.56, 13.95, 57.96)

		},
		infiniteVehicles = false, -- This will work for societies only, set the society vehicles in the Config.SocietyVehiclesList
		id = "air", -- ID of the garage, it's used to get what garage is opened | needs to be DIFFERENT for each garage
		society = "", -- Leave blank if not in use
		type = "air" -- car, air or boat
	},
	{
		name = "LSPD", -- Garage name shown in the menu
		coords = vector3(456.05, -1020.52, 28.28), -- Marker position
		blip = { blipId = 524, blipColor = 3, blipScale = 0.9, blipText = "Police Garage" }, -- Blip informations
		marker = { id = 36, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations
		radius = 1, -- Interaction radius for the marker
		storeVehicleCoords = vector3(452.69, -1013.04, 28.47),
		storeVehicleMarker = {id = 36, color = {r = 255, g = 0, b = 0, a = 90}, size = {x = 1.25, y = 1.25, z = 1.25}, radius = 2.5, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations for the sell vehicle marker
		viewVehicleCoords = vector4(233.12, -789.94, 30.6, 160.55),
		vehicleSpawn = { -- Where the vehicle spawns when you take it out
			vector4(446.43, -1025.51, 28.64, 360.0), -- Make it work with multiple spawn points
			vector4(442.97, -1026.19, 28.71, 360.0),
			vector4(438.99, -1026.51, 28.78, 360.0),
			vector4(435.43, -1027.24, 28.84, 360.0),
			vector4(431.69, -1027.66, 28.91, 360.0),
			vector4(427.49, -1028.11, 28.99, 360.0)
		},
		infiniteVehicles = true, -- This will work for societies only, set the society vehicles in the Config.SocietyVehiclesList
		id = "police1", -- ID of the garage, it's used to get what garage is opened | needs to be DIFFERENT for each garage
		society = "police", -- Leave blank if not in use
		type = "car" -- car, air or boat
	},
}

Config.Impound = { -- Garages list/info
	{
		name = "LS Impound", -- Garage name shown in the menu
		coords = vector3(409.57, -1623.24, 29.29), -- Marker position
		blip = { blipId = 524, blipColor = 5, blipScale = 0.9, blipText = "Impound" }, -- Blip informations
		marker = { id = 36, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations
		radius = 1, -- Interaction radius for the marker
		type = "car", -- type of vehicle to appear in the impound menu ("" = all)
		vehicleSpawn = { -- Where the vehicle spawns when you recover it
			vector4(396.0, -1644.6, 29.29, 140.0), -- Make it work with multiple spawn points
			vector4(398.4, -1646.6, 29.29, 140.0),
			vector4(400.8, -1648.6, 29.29, 140.0),
			vector4(403.2, -1650.6, 29.29, 140.0),
			vector4(405.6, -1652.6, 29.29, 140.0),
			vector4(408.0, -1654.6, 29.29, 140.0),
			vector4(410.4, -1656.6, 29.29, 140.0),
			vector4(417.1, -1627.8, 29.29, 320.0)
		},
	},
	{
		name = "PB Impound", -- Garage name shown in the menu
		coords = vector3(-270.15, 6130.77, 31.51), -- Marker position
		blip = { blipId = 524, blipColor = 5, blipScale = 0.9, blipText = "Impound" }, -- Blip informations
		marker = { id = 36, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations
		radius = 1, -- Interaction radius for the marker
		type = "", -- type of vehicle to appear in the impound menu ("" = all)
		vehicleSpawn = { -- Where the vehicle spawns when you recover it
			vector4(-282.03, 6142.62, 31.08, 135.25), -- Make it work with multiple spawn points
			vector4(-276.61, 6137.28, 31.08, 135.7),
			vector4(-303.97, 6129.09, 31.08, 225.36)
		},
	},
}

Config.UseRecoverStolenVehicles = true

Config.RecoverVehiclePrice = 500

Config.RecoverVehicle = {
	{
		name = "LSPD Recover", -- Garage name shown in the menu
		coords = vector3(437.76, -979.36, 30.69), -- Marker position
		blip = { blipId = 524, blipColor = 3, blipScale = 0.9, blipText = "Recover Vehicle" }, -- Blip informations
		marker = { id = 36, color = { r = 31, g = 94, b = 255, a = 90 }, size = { x = 0.7, y = 0.7, z = 0.7 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0, textureDict = 0, textureName = 0 }, -- Marker informations
		radius = 1, -- Interaction radius for the marker
		vehicleSpawn = { -- Where the vehicle spawns when you recover it
			vector4(407.77, -979.66, 29.27, 231.52), -- Make it work with multiple spawn points
			vector4(407.3, -984.0, 29.27, 231.52),
			vector4(407.78, -988.8, 29.27, 231.52),
			vector4(407.82, -993.31, 29.27, 231.52),
			vector4(407.78, -997.91, 29.27, 231.52),
			vector4(402.9, -996.1, 29.36, 360.0),
			vector4(403.0, -987.17, 29.36, 360.0),
			vector4(403.0, -978.17, 29.36, 360.0)
		},
	},
}


-------------------------- DISCORD LOGS

-- To set your Discord Webhook URL go to sv_utils.lua, line 3

Config.BotName = 'ServerName' -- Write the desired bot name

Config.ServerName = 'ServerName' -- Write your server's name

Config.IconURL = '' -- Insert your desired image link

Config.DateFormat = '%d/%m/%Y [%X]' -- To change the date format check this website - https://www.lua.org/pil/22.1.html

-- To change a webhook color you need to set the decimal value of a color, you can use this website to do that - https://www.mathsisfun.com/hexadecimal-decimal-colors.html

Config.StoreVehicleWebhookColor = '65352'

Config.TakeOutVehicleWebhookColor = '16711680'

Config.ShareWebhookColor = '16127'

Config.TransferWebhookColor = '16776960'

Config.CompanyWebhookColor = '7100555'

-------------------------- LOCALES (DON'T TOUCH)

function _L(id) 
	if Locales[Config.Locale][id] then 
		return Locales[Config.Locale][id] 
	else 
		print("Locale '"..id.."' doesn't exist") 
	end 
end

-- V1.3.5