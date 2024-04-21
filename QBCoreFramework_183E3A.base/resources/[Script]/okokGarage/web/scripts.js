var selectedWindow = "";
var vehicles = [];
var currentVehicleType = [];
var vehicle = [];
var garageIndex = 0;
var garageType = "";
var garageName = "";
var vehicleSelected = false;
var table = [];
var garageInfo = []
var impoundedVehicles = [];
var favVehicles = [];
var companies = [];
var impoundTime = [];
var impoundLocations = [];
var keys = [];
var favouriteAmount = 0
var society = ""
var price = 0
var companyName = ""
var companyInfo = []
var employeeInfo = []
var salesHistory = []
var otherDetails = []
var recentSales = []
var closestPlayers = []
var atImpound = false
var garages = []
var highestEarnedIndex = 0
var row = '';
var selectedGarageCoords = []
var jobRanks = []
var selectedPlayer = ""
var selectedPlayerIdentifier = ""
var recentSaleAmount = 0
var selectedShare = ""
var sharedWith = []
var sharedVehiclesBeingShown = false
var sharedVehicles = []
var closestPlayer = 0
var favAmount = 0
var stolenVehicle = []
var recoverPost = 0
var impoundIndex = 0
var recoverVehiclePrice = 0
var veh_name = ""
var veh_plate = ""
var favClass = ""
var currentCompany = 0
var noSharedTab = false
var isSocietyGarage = false
var canTransferToSociety = false
var playerJob = ""
var liveriesCount = 0
var extras = []
var currentLivery = -1
var openingVehiclesTab = false
var currentViewVehicle = 0
var canRepair = false
var repairPrice = 0
var tid = undefined
var vehicleStatusTab = 0
const vehicleStatsTime = 10000
var getVehiclesAnywhere = false
var garageName = ""
var currentSelectedVehicle = []
var isImpoundGlobal = false
var veh_url = ""

function addStr(str, index, stringToAdd) {
	return str.substring(0, index) + stringToAdd + str.substring(index, str.length);
}

window.addEventListener('message', function(event) {
	switch (event.data.action) {
		case 'loading':
			selectedWindow = "loading";
			$('.loading_menu').fadeIn();
			break

		case 'openGarage':
			vehicle = []
			garageIndex = event.data.index;
			player_name = event.data.name;
			vehicles = event.data.vehicles;
			garages = event.data.garages;
			favAmount = event.data.favAmount;
			garageType = event.data.garageType;
			society = event.data.society;
			noSharedTab = event.data.noShared;
			isSocietyGarage = event.data.societyGarage;
			canTransferToSociety = event.data.canTransferToSociety;
			playerJob = event.data.playerJob;
			getVehiclesAnywhere = event.data.vehiclesAnywhere;
			garageName = event.data.garageName;

			favVehicles = [];
			vehicleSelected = false;

			
			if (event.data.sex == "m") {
				icon = "avatar_male.png";
			} else {
				icon = "avatar_female.png";
			}

			if (selectedWindow == "loading") {
				openOverview();
				$(".garage_menu").fadeIn();
			}

			setTimeout(function() {
				$('.loading_menu').fadeOut();
			}, 300);

			break

		case 'selectVehicle':
			vehicle = [];
			vehicle = event.data.vehicle;
			vehicles = event.data.vehicles;
			vehicleSelected = true;
			if (selectedWindow != "overview") {
				openOverview();
			}

			break

		case 'closeGarage':
			closeMenu();
			break

		case 'updateVehicles':
			vehicles = event.data.vehicles;
			$('.loading_menu').fadeOut();
			if (event.data.openOverview && selectedWindow != "overview") {
				openOverview();
			} else if (selectedWindow == "vehicles") {
				openVehicles();
			}

			break

		case 'policeImpound':
			impoundTime = event.data.impoundTime;
			impoundLocations = event.data.impoundLocations;
			isImpoundGlobal = event.data.isGlobal;
			openImpound();
			$(".impound_menu").fadeIn();
			selectedWindow = "policeImpound";

			break

		case 'stolenVehiclesMenu':
			stolenVehicle = event.data.vehicles;
			recoverPost = event.data.recoverPost;
			recoverVehiclePrice = event.data.price;
			openRecover(stolenVehicle);
			break

		case 'playerImpound':
			impoundedVehicles = event.data.impoundedVehicles;
			impoundIndex = event.data.index;
			atImpound = true
			openPlayerImpound();
			$(".impound2_menu").fadeIn();
			selectedWindow = "playerImpound";
			break

		case 'infiniteGarage':
			garageIndex = event.data.index;
			vehicles = event.data.vehicles;
			openSocietyGarage();
			$(".impound2_menu").fadeIn();
			selectedWindow = "playerImpound";
			break

		case 'keyMenu':
			keys = event.data.keys
			closestPlayer = event.data.closestPlayer
			openKeyMenu();
			$(".transferkeys_menu").fadeIn();
			selectedWindow = "keysMenu";
			break

		case 'companyMenu':
			player_name = event.data.name;
			companyInfo = event.data.companyInfo;
			employeeInfo = event.data.employeeInfo;
			salesHistory = event.data.salesHistory;
			recentSales = event.data.recentSales;
			highestEarnedIndex = event.data.highestEarnedIndex;
			jobRanks = event.data.rankTable;
			recentSalesAmount = event.data.recentSaleAmount;
			currentCompany = event.data.company;

			$(`#business_sell_price`).html(event.data.price);

			if (event.data.sex == "m") {
				icon = "avatar_male.png";
			} else {
				icon = "avatar_female.png";
			}
			openCompanyMenu()
			$(".company_menu").fadeIn();

			setTimeout(function() {
				$('.loading_menu').fadeOut();
			}, 300);

			selectedWindow = "businessOverview";
			break
		case 'leaveBusiness':
			currentCompany = event.data.company;

			var buyBusinessModal = new bootstrap.Modal(document.getElementById("leavebusiness_modal"), {});
			buyBusinessModal.show();
			selectedWindow = "leaveBusiness";
			break
		case 'adminBusinessMenu':
			if (event.data.sex == "m") {
				icon = "avatar_male.png";
			} else {
				icon = "avatar_female.png";
			}
			companies = event.data.companys;
			garages = event.data.garages;
			player_name = event.data.name;
			
			adminBusinessMenu();
			$(".loading_menu").fadeOut();
			$(".adminBusinessPage").fadeIn();

			selectedWindow = "adminBusinessMenu";
			break
		case 'purchaseCompany':
			price = event.data.price;
			companyName = event.data.name;
			$("#purchaseMessage").html(`Do you want to buy ${companyName} for ${price}€?`);
			var buyBusinessModal = new bootstrap.Modal(document.getElementById("buyBusinessModal"), {});
			buyBusinessModal.show();
			selectedWindow = "purchaseCompany";
			break
		case 'createGarage':
			$(".creategarage_menu").fadeIn();
			selectedWindow = "createGarage";
			break
		case 'sellGarage':
			garageInfo = event.data.garageInfo;
			otherDetails = event.data.otherDetails;
			selectedWindow = "sellGarage";
			sellGarageMenu();
			break
		case 'buyGarage':
			garageInfo = event.data.garageInfo;
			otherDetails = event.data.otherDetails;
			selectedWindow = "buyGarage";
			buyGarageMenu();
			break
		case 'updateSharedWith':
			sharedWith = [];
			sharedWith = event.data.shared;
			showSharedWith();
			break
		case 'sendSharedVehiclesInGarage':
			sharedVehiclesBeingShown = true;
			sharedVehicles = event.data.sharedVehicles;
			openVehicles();
			break
		case 'updateSharingWith':
			sharedWith = [];
			sharedWith = event.data.shared;
			showSharingWith();
			break
		case 'updateSocietyMoney':
			$('#company_balance').html(event.data.money + "€");
			break
		case 'openLiveries':
			liveriesCount = event.data.liveriesCount;
			extras = event.data.extras;
			currentLivery = event.data.currentLivery;
			openLiveriesMenu();
			break
		case 'playAudio':
			var audio = event.data.audioChoice
			var sound = new Audio('audio/' + audio + '.mp3');
			sound.volume = event.data.volume;
			sound.play();
			break
		case 'openView':
			selectedWindow = "view_vehicle";
			allowRepair = event.data.allowRepair;
			repairPrice = event.data.repairPrice;
			currentSelectedVehicle = event.data.currentVehicle;

			if(currentSelectedVehicle.type == garageType){
				$('#garage_name_text').html(garageName+"<span> GARAGE</span>");
				$(".garage_menu").fadeOut();
				$(".view_menu").fadeIn();
				openViewMenu(event.data.currentVehiclePlate);
				vehicleStatusTab = 0;
				$('.vehicle_stats_tuning').hide();
				$('.vehicle_stats_data').fadeIn();
				tid = setTimeout(startLoop, vehicleStatsTime);
			}
			
			break
		case 'updateVehicleData':
			var vehicleData = event.data.vehicleData;
			document.documentElement.style.setProperty('--percentage-width1', vehicleData.topspeed+"%");
			document.documentElement.style.setProperty('--percentage-width2', vehicleData.acceleration+"%");
			document.documentElement.style.setProperty('--percentage-width3', vehicleData.brakes+"%");
			document.documentElement.style.setProperty('--percentage-width4', vehicleData.handling+"%");
			document.documentElement.style.setProperty('--percentage-width-engine', vehicleData.engine+"%");
			document.documentElement.style.setProperty('--percentage-width-transmission', vehicleData.transmission+"%");
			document.documentElement.style.setProperty('--percentage-width-suspension', vehicleData.suspension+"%");
			document.documentElement.style.setProperty('--percentage-width-brakesMod', vehicleData.brakesMod+"%");
			document.documentElement.style.setProperty('--percentage-width-armor', vehicleData.armor+"%");
			document.documentElement.style.setProperty('--percentage-width-turbo', vehicleData.turbo+"%");
			currentSelectedVehicle = event.data.currentVehicle;
			break
		case 'fixSelected':
			currentVehicle = event.data.vehicleData;
			break
	}
})

function startLoop() {
	if(vehicleStatusTab == 0){
		vehicleStatusTab = 1;
		$('.vehicle_stats_data').fadeOut();
		setTimeout(function() {
			$('.vehicle_stats_tuning').fadeIn();
		}, 300);
	} else {
		vehicleStatusTab = 0;
		$('.vehicle_stats_tuning').fadeOut();
		setTimeout(function() {
			$('.vehicle_stats_data').fadeIn();
		}, 300);
	}
	tid = setTimeout(startLoop, vehicleStatsTime); 
}
function abortTimer() {
	clearTimeout(tid);
}

function openViewMenu(selectedPlate){
	var row = ``;
	var spaceClass = '';
	var totalVehicle = 0;

	if(allowRepair){
		$('#takeout-repair-buttons').html(`
			<button type="button" id="takeout-button-view" class="btn btn-blue btn-veh_actions w-50 me-2">TAKE OUT</button>
			<button type="button" id="takeout-button-repair" class="btn btn-odark3 btn-veh_actions w-50 ms-2" data-bs-toggle="modal" data-bs-target="#repairModal">REPAIR</button>
		`);
		$('#repair_price').html(repairPrice);
	} else {
		$('#takeout-repair-buttons').html(`
			<button type="button" id="takeout-button-view" class="btn btn-blue btn-veh_actions w-100">TAKE OUT</button>
		`);
	}

	for (var i = 0; i < vehicles.length; i++) {
		var vehicleType = vehicles[i].type;
		if (vehicleType == garageType) {
			if(vehicles[i].plate == selectedPlate){
				currentViewVehicle = i;
				row += `
					<div class="d-flex align-items-center justify-content-between w-100 garage_list-veh ${spaceClass} garage-veh_selected" id="vehicle_view_${i}" onClick="selectViewVehicle(${i})">
						<div class="garage_list-veh_name">${vehicles[i].vehiclename}</div>
						<div class="garage_list-veh_plate">${vehicles[i].plate}</div>
					</div>
				`;
			} else {
				row += `
					<div class="d-flex align-items-center justify-content-between w-100 garage_list-veh ${spaceClass}" id="vehicle_view_${i}" onClick="selectViewVehicle(${i})">
						<div class="garage_list-veh_name">${vehicles[i].vehiclename}</div>
						<div class="garage_list-veh_plate">${vehicles[i].plate}</div>
					</div>
				`;
			}
			if(spaceClass == ''){
				spaceClass = 'mt-3';
			}
			totalVehicle++;
		}
	}
	if(totalVehicle >= 7){
		document.documentElement.style.setProperty('--viewvehicle-width', "26rem");
	} else {
		document.documentElement.style.setProperty('--viewvehicle-width', "25.5rem");
	}
	$('.garage_list-window').html(row);
	if(currentSelectedVehicle.stored == 1){
		document.getElementById("takeout-button-view").disabled = false;
	} else {
		document.getElementById("takeout-button-view").disabled = true;
	}
}

function selectViewVehicle(i) {
	if(currentViewVehicle != i){
		currentSelectedVehicle = vehicles[currentViewVehicle];
		$(`#vehicle_view_${currentViewVehicle}`).removeClass('garage-veh_selected');
		$(`#vehicle_view_${i}`).addClass('garage-veh_selected');
		currentViewVehicle = i;
		
		if(vehicles[currentViewVehicle].stored == 1){
			document.getElementById("takeout-button-view").disabled = false;
		} else {
			document.getElementById("takeout-button-view").disabled = true;
		}

		$.post('https://okokGarage/action', JSON.stringify({
			action: "changeViewVehicle",
			vehicles: vehicles,
			id: currentViewVehicle+1
		}));
	}
}

$(document).on('click', "#takeout-button-view", function() {
	var vehicleType = currentSelectedVehicle.type;
	if(currentSelectedVehicle.stored == 1){
		if (vehicleType == garageType) {
			var vehicle_plate = currentSelectedVehicle.plate;
			var vehicle_id = "";
			if(currentSelectedVehicle.vehicleModel != undefined){
				vehicle_id = currentSelectedVehicle.vehicleModel;
			} else {
				vehicle_id = currentSelectedVehicle.vehicle
			}
			var vehicle_name = currentSelectedVehicle.vehiclename;
			$.post('https://okokGarage/action', JSON.stringify({
				action: "takeOut",
				vehicle_plate: vehicle_plate,
				vehicle_id: vehicle_id,
				vehicle_name: vehicle_name,
				index: garageIndex,
				isSocietyGarage: isSocietyGarage,
				isView: true
			}));
			$.post('https://okokGarage/action', JSON.stringify({
				action: "clearView"
			}));
		} else {
			$.post('https://okokGarage/action', JSON.stringify({
				action: "clearView",
				deleteCam: true
			}));
		}
		closeMenu()
	}
});

$(document).on('click', "#repair_button", function() {
	var vehicleType = currentSelectedVehicle.type;
	if (vehicleType == garageType) {
		var vehicle_plate = currentSelectedVehicle.plate;
		var vehicle_id = currentSelectedVehicle.vehicle;
		var vehicle_name = currentSelectedVehicle.vehiclename;
		$.post('https://okokGarage/action', JSON.stringify({
			action: "repairVehicle",
			vehicle_plate: currentSelectedVehicle.plate,
			id: currentViewVehicle+1,
			vehicles: vehicles,
			currentVehicle: currentSelectedVehicle
		}));
	}
});

function openLiveriesMenu() {
	selectedWindow = "liveries";
	$('.page-title-liveries').html('Liveries/Extras');
	$('#liverieslist').html(`
		<button type="button" id="liveries_menu" class="btn btn-odark2 fs125" data-bs-dismiss="modal">Liveries</button>
		<button type="button" id="extras_menu" class="btn btn-odark2 mt-3 fs125" data-bs-dismiss="modal">Extras</button>
	`);
	$("#liverieslist").removeClass("p00500");
	$('.liveriesextras_menu').fadeIn();
}

$(document).on('click', "#liveries_menu", function() {
	selectedWindow = "liveries_list";
	var row = `<button type="button" class="btn btn-odark2 fs125" data-bs-dismiss="modal" onClick="openLiveriesMenu()">Go Back</button>`;
	var selectedClass = ``;
	for (var i = 0; i < liveriesCount; i++) {
		if (currentLivery != -1 && currentLivery == i) {
			selectedClass = `btn-livextras-selected`;
		} else {
			selectedClass = ``;
		}

		row += `<button type="button" id="livery_option_${i}" class="btn btn-odark2 mt-3 ${selectedClass} fs125" data-bs-dismiss="modal" onClick="set_livery(${i})">Livery ${i}</button>`;
	}
	$('#liverieslist').html(row);
	if (liveriesCount > 5) {
		$("#liverieslist").addClass("p00500");
	} else {
		$("#liverieslist").removeClass("p00500");
	}
});

function set_livery(id) {
	for (var i = 0; i < liveriesCount; i++) {
		if (i == id) {
			$(`#livery_option_${i}`).addClass('btn-livextras-selected');
		} else {
			$(`#livery_option_${i}`).removeClass('btn-livextras-selected');
		}
	}
	currentLivery = id
	$.post('https://okokGarage/action', JSON.stringify({
		action: "setLivery",
		id: id
	}));
}

$(document).on('click', "#extras_menu", function() {
	selectedWindow = "extras_list";
	var row = `<button type="button" class="btn btn-odark2 fs125" data-bs-dismiss="modal" onClick="openLiveriesMenu()">Go Back</button>`;
	var selectedClass = ``;
	for (var i = 0; i < extras.length; i++) {
		if(extras[i] != undefined){
			if (extras[i].on) {
				selectedClass = `btn-livextras-selected`;
			} else {
				selectedClass = ``;
			}
			row += `<button type="button" id="extra_option_${i}" class="btn btn-odark2 mt-3 ${selectedClass} fs125" data-bs-dismiss="modal" onClick="set_extra(${i}, ${extras[i].extra})">Extra ${i}</button>`;
		}
	}
	$('#liverieslist').html(row);
	if (extras.length > 5) {
		$("#liverieslist").addClass("p00500");
	} else {
		$("#liverieslist").removeClass("p00500");
	}
});

function set_extra(id, extra) {
	if ($(`#extra_option_${id}`).hasClass(`btn-livextras-selected`)) {
		$(`#extra_option_${id}`).removeClass('btn-livextras-selected');
	} else {
		$(`#extra_option_${id}`).addClass('btn-livextras-selected');
	}
	extras[id].on = !extras[id].on
	$.post('https://okokGarage/action', JSON.stringify({
		action: "setExtra",
		id: extra
	}));
}

function showSharingWith() {
	$('#page_info').html(`
		<div class="d-flex" id="shareButtonsID">
			<button type="button" class="btn btn-blue share-sel" id="shared">My Shares</button>
			<button type="button" class="btn btn-odark2 ms-2 share-sel" id="shared2">Shared</button>
		</div>
		
		<span id="shareModalID"class="badge s-badge" data-bs-toggle="modal" data-bs-target="#shareModal"><i class="fa-solid fa-plus"></i> Share</span></span>

		<table id="mySharesTable">
			<thead>
				<tr>
					<th class="text-center">Type</th>
					<th class="text-center">Vehicle</th>
					<th class="text-center">Player</th>
					<th class="text-center">Actions</th>
				</tr>
			</thead>
			<tbody id="mySharesTableData">
				
			</tbody>
		</table>
	`);

	$('#page_info').removeClass('gap1');
	$('#page_info').addClass('gap0');

	$("#shared2").addClass("btn-odark2").removeClass("btn-blue");
	$("#shared").addClass("btn-blue").removeClass("btn-odark2");

	$('#mySharesTableData').html(``)

	if (sharedWith.length > 0) {
        row = ``
        for (var i = 0; i < sharedWith.length; i++) {
            if (sharedWith[i].type == "Garage") {
                vehicleName = "N/A"
            } else {
                vehicleName = sharedWith[i].vehiclename + " (" + sharedWith[i].plate + ")"
            }
            row += ` <tr>
            <td class="text-center align-middle">${sharedWith[i].type}</td>
            <td class="text-center align-middle">${vehicleName}</td>
            <td class="text-center align-middle">${sharedWith[i].sharingWithName}</td>

            <td class="text-center align-middle"><button type="button" id="cancelShare" data-vehiclemodel="${sharedWith[i].vehicleModel}" data-vehicleurl="${sharedWith[i].vehicleURL}" data-sharedtype="${sharedWith[i].type}" data-sharingwithid="${sharedWith[i].sharingWithIdentifier}" data-sharedplate="${sharedWith[i].plate}" class="btn btn-blue btn-cancelshare"><i class="fa-solid fa-xmark"></i> CANCEL</button></td>
        </tr>`

            $('#mySharesTableData').html(row)
        }
    }

	var table_id = document.getElementById('mySharesTable');
	table.push(new simpleDatatables.DataTable(table_id, {
		searchable: true,
		perPageSelect: false,
		perPage: 6,
	}));
	$('.loading_menu').fadeOut();
}

function showSharedWith() {
	var tbl = document.getElementById("mySharesTable");
	if (tbl) tbl.parentNode.removeChild(tbl);
	$('#page_info').html(`
		<div class="d-flex" id="shareButtonsID">
			<button type="button" class="btn btn-odark2 share-sel" id="shared">My Shares</button>
			<button type="button" class="btn btn-blue ms-2 share-sel" id="shared2">Shared</button>
		</div>
		
		<span id="shareModalID"class="badge s-badge" data-bs-toggle="modal" data-bs-target="#shareModal"><i class="fa-solid fa-plus"></i> Share</span></span>

		<table id="mySharesTable">
			<thead>
				<tr>
					<th class="text-center">Type</th>
					<th class="text-center">Vehicle</th>
					<th class="text-center">Player</th>
					<th class="text-center">Actions</th>
				</tr>
			</thead>
			<tbody id="mySharesTableData">
				
			</tbody>
		</table>
	`);
	$('#mySharesTableData').html(``)
	if (sharedWith.length > 0) {
		row = ``
		for (var i = 0; i < sharedWith.length; i++) {
			if(sharedWith[i].type == "Garage" || sharedWith[i].vehicletype == garageType){
				if (sharedWith[i].type == "Garage") {
					vehicleName = "N/A"
				} else {
					vehicleName = sharedWith[i].vehiclename + " (" + sharedWith[i].plate + ")"
				}

				row += `<tr>
							<td class="text-center align-middle">${sharedWith[i].type}</td>
							<td class="text-center align-middle">${vehicleName}</td>
							<td class="text-center align-middle">${sharedWith[i].ownerName}</td>
							<td class="text-center align-middle"><button type="button" id="viewVehicleOrGarage" data-vehiclemodel="${sharedWith[i].vehicleModel}" data-vehicleurl="${sharedWith[i].vehicleURL}" data-sharedtype="${sharedWith[i].type}" data-sharedowner="${sharedWith[i].owner}" data-sharedplate="${sharedWith[i].plate}" class="btn btn-blue btn-cancelshare"><i class="fa-solid fa-eye"></i> VIEW</button></td>
						</tr>`

				$('#mySharesTableData').html(row)
			}
		}
	}
	var table_id = document.getElementById('mySharesTable');
	table.push(new simpleDatatables.DataTable(table_id, {
		searchable: true,
		perPageSelect: false,
		perPage: 6,
	}));
}

function buyGarageMenu() {
	if (garageInfo.garageType == "car") {
		garageType = "Cars/Motorcycles"
	} else if (garageInfo.garageType == "air") {
		garageType = "Airplanes/Helicopters"
	} else if (garageInfo.garageType == "boat") {
		garageType = "Boats"
	}
	$(".confirmp_menu").fadeIn();

	$('.confirmp_menu').html(`
	<div class="card confirmp_card">
			<div class="card-body confirmp_card-body">
				<span class="close-button" id="closeConfirmPMenu"><i class="fas fa-times"></i></span>
				<div class="row h-100">
					<div class="col-md-12 section">
						<span class="text-center page-title">Private Garage</span>
						<hr class="mg060">
						<span class="text-center fs125">Garage</span>
						<span class="confirmp_garage form-control" class="text-center">${garageInfo.garageName}</span>
						<span class="mt-2 text-center fs125">Type</span>
						<span class="confirmp_garage form-control" class="text-center">${garageType}</span>
						<span class="mt-2 text-center fs125">Price</span>
						<span class="confirmp_garage form-control" class="text-center">${garageInfo.price}€</span>
						<span class="mt-2 text-center fs125">Weekly Renewal</span>
						<span class="confirmp_garage form-control" class="text-center">${otherDetails.renewalPrice}€</span>
						<span class="mt-2 text-center fs125">Total</span>
						<span class="confirmp_garage form-control" class="text-center">${garageInfo.price}€</span>
						<div class="d-flex justify-content-center mt-3">
							<button type="button" class="btn btn-blue w-100 ci-option" id="purchaseGarage">PURCHASE</button>
						</div>
					</div>
				</div>
			</div>
		</div>`)
}

function sellGarageMenu() {

	if (garageInfo.garageType == "car") {
		garageType = "Cars/Motorcycles"
	} else if (garageInfo.garageType == "air") {
		garageType = "Airplanes/Helicopters"
	} else if (garageInfo.garageType == "boat") {
		garageType = "Boats"
	}

	var sellerAmount = ((otherDetails.sellerComission / 100) * garageInfo.price)
	sellerAmount = Math.trunc(sellerAmount)
	$(".confirms_menu").fadeIn();

	$('.confirms_menu').html(`

	<div class="card confirms_card" id="card confirms_card">
			<div class="card-body confirms_card-body">
				<span class="close-button" id="closeConfirmSMenu"><i class="fas fa-times"></i></span>
				<div class="row h-100">
					<div class="col-md-12 section">
						<span class="text-center page-title">Private Garage</span>
						<hr class="mg060">
						<span class="text-center fs125">Buyer</span>
						<span class="confirmp_garage form-control" class="text-center">${garageInfo.playerName}</span>
						<span class="mt-2 text-center fs125">Seller Comission</span>
						<span class="confirmp_garage form-control" class="text-center">${otherDetails.sellerComission}% (${sellerAmount}€)</span>
						<span class="mt-2 text-center fs125">Garage</span>
						<span class="confirmp_garage form-control" class="text-center">${garageInfo.garageName}</span>
						<span class="mt-2 text-center fs125">Type</span>
						<span class="confirmp_garage form-control" class="text-center">${garageType}</span>
						<span class="mt-2 text-center fs125">Price</span>
						<span class="confirmp_garage form-control" class="text-center">${garageInfo.price}€</span>
						<span class="mt-2 text-center fs125">Weekly Renewal</span>
						<span class="confirmp_garage form-control" class="text-center">${otherDetails.renewalPrice}€</span>
						<span class="mt-2 text-center fs125">Total</span>
						<span class="confirmp_garage form-control" class="text-center">${garageInfo.price}€</span>
						<div class="d-flex justify-content-center mt-3">
							<button type="button" class="btn btn-blue w-100 ci-option" id="sell_garage">SELL</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		`);
}


function openEmployees() {
	selectedWindow = "employeeOverview"
	$('.company_menu').html(`
			<div class="card-body main_card-body">
				<div class="row h-100" id="menu">
					<div class="col-md-2 d-flex flex-column sidebar-s">
						<img src="img/logo.png" class="logo">
						<hr>
						<span class="sidebar-title">Menu</span>
						<div id="sidebar">
							<p class="sidebar-item mt-2" id="overviewc_page"><i class="bi bi-grid-1x2-fill"></i> <span class="ms-1">Overview</span></p>
							<p class="sidebar-item selected" id="employees_page"><i class="fas fa-user-friends"></i> <span class="ms-1">Employees</span></p>
							<p class="sidebar-item" id="saleshistory_page"><i class="fas fa-chart-bar"></i> <span class="ms-1">Sales History</span></p>
						</div>
						<p class="sidebar-item-red" id="sell_business" data-bs-toggle="modal" data-bs-target="#sellbusiness_modal"><i class="fas fa-building"></i> <span class="ms-1">Sell Business</span></p>
						<p class="sidebar-item mt-auto logout" id="log_out"><i class="fas fa-sign-out-alt"></i></i> <span class="ms-1">Logout</span></p>
					</div>
					<div class="col-md-10 tab-s">
						<div class="d-flex justify-content-between align-items-center">
							<span class="selected-page"><span id="page-title">Employees</span></span>
							<div>
								<span class="username align-middle">
									<span id="playerName">${player_name}</span> <span id="avatar"><img src="img/${icon}" class="avatar"></span>
								<div class="grade">OWNER</div>
								</span>
							</div>
						</div>
						<hr>
						<div class="d-flex flex-column flex-grow-1">
							<div class="d-flex">
								<button type="button" class="btn btn-blue hire-emp" data-bs-toggle="modal" data-bs-target="#hireEmployeeModal">Hire Employee</button>
							</div>
							<table id="employeesTable" class="mt-025">
								<thead>
									<tr>
										<th class="text-center">Name</th>
										<th class="text-center">Grade</th>
										<th class="text-center">Total Earned</th>
										<th class="text-center">Actions</th>
									</tr>
								</thead>
								<tbody id="garagesTableData131">
									
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
	`)
	$('#garagesTableData131').html(``)
	var row = ``
	for (var i = 0; i < employeeInfo.length; i++) {
		var shownRank = ""
		if (employeeInfo[i].rank == 1) {
			shownRank = "Newbie"
		} else if (employeeInfo[i].rank == 2) {
			shownRank = "Experienced"

		} else if (employeeInfo[i].rank == 3) {
			shownRank = "Expert"

		} else if (employeeInfo[i].rank == 4) {
			shownRank = "Sub-Owner"

		} else if (employeeInfo[i].rank == 5) {
			shownRank = "Owner"

		}
		if (employeeInfo[i].name == player_name) {
			row += `
			<tr>
			<td class="text-center align-middle">${employeeInfo[i].name}</td>
				<td class="text-center align-middle">${shownRank}</td>
				<td class="text-center align-middle">${employeeInfo[i].earned}€</td>
				<td class="text-center align-middle"><button type="button" id="editEmployee" class="btn btn-blue btn-editgarage" data-employee_name="${employeeInfo[i].name}" data-employee_rank="${shownRank}" data-employee_earned="${employeeInfo[i].earned}" data-bs-toggle="modal" data-bs-target="#editEmployeeModal" disabled><i class="fa-solid fa-pen-to-square"></i> EDIT</button></td>
			</tr>
				</tr>
		`;
		} else {
			row += `
			<tr>
			<td class="text-center align-middle">${employeeInfo[i].name}</td>
				<td class="text-center align-middle">${shownRank}</td>
				<td class="text-center align-middle">${employeeInfo[i].earned}€</td>
				<td class="text-center align-middle"><button type="button" id="editEmployee" class="btn btn-blue btn-editgarage" data-employee_name="${employeeInfo[i].name}" data-employee_rank="${shownRank}" data-employee_earned="${employeeInfo[i].earned}" data-employee_identifier="${employeeInfo[i].identifier}"data-bs-toggle="modal" data-bs-target="#editEmployeeModal"><i class="fa-solid fa-pen-to-square"></i> EDIT</button></td>
			</tr>
				</tr>
		`;
		}

		$('#garagesTableData131').html(row);
	}

	var table_id = document.getElementById('employeesTable');
	table.push(new simpleDatatables.DataTable(table_id, {
		perPageSelect: false,
		perPage: 6,
	}));
}

function openSalesHistory() {
	selectedWindow = "saleshistory"

	$('.company_menu').html(`
		<div class="card-body main_card-body">
			<div class="row h-100" id="menu">
				<div class="col-md-2 d-flex flex-column sidebar-s">
					<img src="img/logo.png" class="logo">
					<hr>
					<span class="sidebar-title">Menu</span>
					<div id="sidebar">
						<p class="sidebar-item mt-2" id="overviewc_page"><i class="bi bi-grid-1x2-fill"></i> <span class="ms-1">Overview</span></p>
						<p class="sidebar-item" id="employees_page"><i class="fas fa-user-friends"></i> <span class="ms-1">Employees</span></p>
						<p class="sidebar-item selected" id="saleshistory_page"><i class="fas fa-chart-bar"></i> <span class="ms-1">Sales History</span></p>
					</div>
					<p class="sidebar-item-red" id="sell_business" data-bs-toggle="modal" data-bs-target="#sellbusiness_modal"><i class="fas fa-building"></i> <span class="ms-1">Sell Business</span></p>
					<p class="sidebar-item mt-auto logout" id="log_out"><i class="fas fa-sign-out-alt"></i></i> <span class="ms-1">Logout</span></p>
				</div>
				<div class="col-md-10 tab-s">
					<div class="d-flex justify-content-between align-items-center">
						<span class="selected-page"><span id="page-title">Sales History</span></span>
						<div>
							<span class="username align-middle">
								<span id="playerName">${player_name}</span> <span id="avatar"><img src="img/${icon}" class="avatar"></span>
							<div class="grade">OWNER</div>
							</span>
						</div>
					</div>
					<hr>

					<div class="d-flex flex-column flex-grow-1" id="page_info2">
						<table id="garagesTable" class="mt-295">
							<thead>
								<tr>
									<th class="text-center">Date</th>
									<th class="text-center">Garage</th>
									<th class="text-center">Price</th>
									<th class="text-center">Seller</th>
								</tr>
							</thead>
							<tbody id="garagesTableDataSales">
								<tr>
									
								</tr>
								
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	`);

	$('#garagesTableDataSales').html(``)
	var row = ``
	for (var i = 0; i < salesHistory.length; i++) {
		row += `
			<tr>
			<td class="text-center align-middle">${salesHistory[i].date}</td>
				<td class="text-center align-middle">${salesHistory[i].garageName}</td>
				<td class="text-center align-middle">${salesHistory[i].price}€</td>
				<td class="text-center align-middle">${salesHistory[i].name}</td>
				
			</tr>
				</tr>
		`;

		$('#garagesTableDataSales').html(row);
	}
	var table_id = document.getElementById('garagesTable');
	table.push(new simpleDatatables.DataTable(table_id, {
		perPageSelect: false,
		perPage: 6,
	}));
}

function openCompanyMenu() {
	var employeeArray = employeeInfo
	if (employeeInfo[highestEarnedIndex] == undefined) {
		employeeArray[highestEarnedIndex] = []
		employeeArray[highestEarnedIndex].name = "No Employee"
		employeeArray[highestEarnedIndex].earned = 0
	}

	$('.company_menu').html(`
	
		<div class="card-body main_card-body">
			<div class="row h-100" id="menu">
				<div class="col-md-2 d-flex flex-column sidebar-s">
					<img src="img/logo.png" class="logo">
					<hr>
					<span class="sidebar-title">Menu</span>
					<div id="sidebar">
						<p class="sidebar-item mt-2 selected" id="overviewc_page"><i class="bi bi-grid-1x2-fill"></i> <span class="ms-1">Overview</span></p>
						<p class="sidebar-item" id="employees_page"><i class="fas fa-user-friends"></i> <span class="ms-1">Employees</span></p>
						<p class="sidebar-item" id="saleshistory_page"><i class="fas fa-chart-bar"></i> <span class="ms-1">Sales History</span></p>
					</div>
					<p class="sidebar-item-red" id="sell_business" data-bs-toggle="modal" data-bs-target="#sellbusiness_modal"><i class="fas fa-building"></i> <span class="ms-1">Sell Business</span></p>
					<p class="sidebar-item mt-auto logout" id="log_out"><i class="fas fa-sign-out-alt"></i></i> <span class="ms-1">Logout</span></p>
				</div>
				<div class="col-md-10 tab-s">
					<div class="d-flex justify-content-between align-items-center">
						<span class="selected-page"><span id="page-title">Overview</span></span>
						<div>
							<span class="username align-middle">
									<span id="playerName">${player_name}</span> <span id="avatar"><img src="img/${icon}" class="avatar"></span>
							<div class="grade">OWNER</div>
							</span>
						</div>
					</div>
					<hr>
					<div class="d-flex flex-column flex-grow-1" id="page_info2">
						<div class="row">
							<div class="col col-md-6 d-flex justify-content-center pr05">
								<div class="card card-o w-100">
									<div class="card-header card-o-header text-center">
										<span class="card-o-title">Finances</span>
									</div>
									<div class="card-body card-o-body vehicle_information_card-body text-center pt-025">
										<div class="d-flex justify-content-center flex-column h-66">
											<div class="fff fs175">Balance</div>
											<div class="fs175" id="company_balance">${companyInfo[0].money}€</div>
										</div>
										<hr class="mg050">
										<button type="button" class="btn btn-blue w-100 mt-2 dep_with-buttons" data-bs-toggle="modal" data-bs-target="#depositModal">Deposit</button>
										<button type="button" class="btn btn-blue w-100 mt-2 dep_with-buttons" data-bs-toggle="modal" data-bs-target="#withdrawModal">Withdraw</button>
									</div>
								</div>
							</div>
							<div class="col col-md-6 d-flex justify-content-center pl05">
								<div class="card card-o w-100">
									<div class="card-header card-o-header text-center">
										<span class="card-o-title">Best Employee</span>
									</div>
									<div class="card-body card-o-body vehicle_selected_card-body text-center pt-085">
										<span class="veh_info_selected">${employeeArray[highestEarnedIndex].name}</span>
										<div class="card-body text-center d-flex justify-content-center align-items-center veh_selected_h">
											<img src="img/${icon}" class="company-avatar">
										</div>
										<div class="d-flex flex-column align-items-center mt-135 fs125">
											<div class="fff">Total Sales</div>
											<div>${employeeArray[highestEarnedIndex].earned}€</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="recentSales" id="recentSales">
						<div class="card card-o d-flex flex-column">
						<div class="card-header card-o-header text-center">
							<span class="card-o-title">Last Sales</span>
						</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		`);
	employeeArray = []

	switch (recentSalesAmount) {

		case 0:
			$('.recentSales').html(`
				<div class="card card-o d-flex flex-column">
					<div class="card-header card-o-header text-center">
						<span class="card-o-title">Last Sales</span>
					</div>
					<div class="card-body card-o-body favorite_vehicles_card-body">
						<div class="row h-100">
							<div class="col col-md-4 d-flex justify-content-center pr05">
								<div class="card fav_veh-card w-100">
									<div class="card-header card-o-header fav_veh_borderbot text-center">
										<span class="fav_veh_slot_title">No Information</span>
									</div>
									<div class="card-body text-center pt-027 fav_veh_card-body2 fff d-flex justify-content-center flex-column hm-1095">
										<div>Seller</div>
										<div class="last-sales_cells">No Information</div>
										<div class="mt-035">Price</div>
										<div class="last-sales_cells">No Information</div>
										<div class="mt-035">Commission</div>
										<div class="last-sales_cells">No Information</div>
									</div>
								</div>
							</div>
							<div class="col col-md-4 d-flex justify-content-center pr05 pl05">
								<div class="card fav_veh-card w-100">
									<div class="card-header card-o-header fav_veh_borderbot text-center">
										<span class="fav_veh_slot_title">No Information</span>
									</div>
									<div class="card-body text-center pt-027 fav_veh_card-body2 fff d-flex justify-content-center flex-column hm-1095">
										<div>Seller</div>
										<div class="last-sales_cells">No Information</div>
										<div class="mt-035">Price</div>
										<div class="last-sales_cells">No Information</div>
										<div class="mt-035">Commission</div>
										<div class="last-sales_cells">No Information</div>
									</div>
								</div>
							</div>
							<div class="col col-md-4 d-flex justify-content-center pl05">
								<div class="card fav_veh-card w-100">
									<div class="card-header card-o-header fav_veh_borderbot text-center">
										<span class="fav_veh_slot_title">No Information</span>
									</div>
									<div class="card-body text-center pt-027 fav_veh_card-body2 fff d-flex justify-content-center flex-column hm-1095">
										<div>Seller</div>
										<div class="last-sales_cells">No Information</div>
										<div class="mt-035">Price</div>
										<div class="last-sales_cells">No Information</div>
										<div class="mt-035">Commission</div>
										<div class="last-sales_cells">No Information</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				`);
			break

		case 1:
			$('.recentSales').html(`
				<div class="card card-o d-flex flex-column">
					<div class="card-header card-o-header text-center">
						<span class="card-o-title">Last Sales</span>
					</div>
					<div class="card-body card-o-body favorite_vehicles_card-body">
						<div class="row h-100">
							<div class="col col-md-4 d-flex justify-content-center pr05">
								<div class="card fav_veh-card w-100">
									<div class="card-header card-o-header fav_veh_borderbot text-center">
										<span class="fav_veh_slot_title">${recentSales[0].garageName}</span>
									</div>
									<div class="card-body text-center pt-027 fav_veh_card-body2 fff d-flex justify-content-center flex-column hm-1095">
										<div>Seller</div>
										<div class="last-sales_cells">${recentSales[0].name}</div>
										<div class="mt-035">Price</div>
										<div class="last-sales_cells">${recentSales[0].price}€</div>
										<div class="mt-035">Commission</div>
										<div class="last-sales_cells">${recentSales[0].sellerComission}%</div>
									</div>
								</div>
							</div>
							<div class="col col-md-4 d-flex justify-content-center pr05 pl05">
								<div class="card fav_veh-card w-100">
									<div class="card-header card-o-header fav_veh_borderbot text-center">
										<span class="fav_veh_slot_title">No Information</span>
									</div>
									<div class="card-body text-center pt-027 fav_veh_card-body2 fff d-flex justify-content-center flex-column hm-1095">
										<div>Seller</div>
										<div class="last-sales_cells">No Information</div>
										<div class="mt-035">Price</div>
										<div class="last-sales_cells">No Information</div>
										<div class="mt-035">Commission</div>
										<div class="last-sales_cells">No Information</div>
									</div>
								</div>
							</div>
							<div class="col col-md-4 d-flex justify-content-center pl05">
								<div class="card fav_veh-card w-100">
									<div class="card-header card-o-header fav_veh_borderbot text-center">
										<span class="fav_veh_slot_title">No Information</span>
									</div>
									<div class="card-body text-center pt-027 fav_veh_card-body2 fff d-flex justify-content-center flex-column hm-1095">
										<div>Seller</div>
										<div class="last-sales_cells">No Information</div>
										<div class="mt-035">Price</div>
										<div class="last-sales_cells">No Information</div>
										<div class="mt-035">Commission</div>
										<div class="last-sales_cells">No Information</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				`);
			break

		case 2:
			$('.recentSales').html(`
				<div class="card card-o d-flex flex-column">
					<div class="card-header card-o-header text-center">
						<span class="card-o-title">Last Sales</span>
					</div>
					<div class="card-body card-o-body favorite_vehicles_card-body">
						<div class="row h-100">
							<div class="col col-md-4 d-flex justify-content-center pr05">
								<div class="card fav_veh-card w-100">
									<div class="card-header card-o-header fav_veh_borderbot text-center">
										<span class="fav_veh_slot_title">${recentSales[0].garageName}</span>
									</div>
									<div class="card-body text-center pt-027 fav_veh_card-body2 fff d-flex justify-content-center flex-column hm-1095">
										<div>Seller</div>
										<div class="last-sales_cells">${recentSales[0].name}</div>
										<div class="mt-035">Price</div>
										<div class="last-sales_cells">${recentSales[0].price}€</div>
										<div class="mt-035">Commission</div>
										<div class="last-sales_cells">${recentSales[0].sellerComission}%</div>
									</div>
								</div>
							</div>
							<div class="col col-md-4 d-flex justify-content-center pr05 pl05">
								<div class="card fav_veh-card w-100">
									<div class="card-header card-o-header fav_veh_borderbot text-center">
										<span class="fav_veh_slot_title">${recentSales[1].garageName}</span>
									</div>
									<div class="card-body text-center pt-027 fav_veh_card-body2 fff d-flex justify-content-center flex-column hm-1095">
										<div>Seller</div>
										<div class="last-sales_cells">${recentSales[1].name}</div>
										<div class="mt-035">Price</div>
										<div class="last-sales_cells">${recentSales[1].price}€</div>
										<div class="mt-035">Commission</div>
										<div class="last-sales_cells">${recentSales[1].sellerComission}%</div>
									</div>
								</div>
							</div>
							<div class="col col-md-4 d-flex justify-content-center pl05">
								<div class="card fav_veh-card w-100">
									<div class="card-header card-o-header fav_veh_borderbot text-center">
										<span class="fav_veh_slot_title">No Information</span>
									</div>
									<div class="card-body text-center pt-027 fav_veh_card-body2 fff d-flex justify-content-center flex-column hm-1095">
										<div>Seller</div>
										<div class="last-sales_cells">No Information</div>
										<div class="mt-035">Price</div>
										<div class="last-sales_cells">No Information</div>
										<div class="mt-035">Commission</div>
										<div class="last-sales_cells">No Information</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				`);
			break

		case 3:
			$('.recentSales').html(`
				<div class="card card-o d-flex flex-column">
					<div class="card-header card-o-header text-center">
						<span class="card-o-title">Last Sales</span>
					</div>
					<div class="card-body card-o-body favorite_vehicles_card-body">
						<div class="row h-100">
						 <div class="col col-md-4 d-flex justify-content-center pr05">
							<div class="card fav_veh-card w-100">
								<div class="card-header card-o-header fav_veh_borderbot text-center">
									<span class="fav_veh_slot_title">${recentSales[0].garageName}</span>
								</div>
								<div class="card-body text-center pt-027 fav_veh_card-body2 fff d-flex justify-content-center flex-column hm-1095">
									<div>Seller</div>
									<div class="last-sales_cells">${recentSales[0].name}</div>
									<div class="mt-035">Price</div>
									<div class="last-sales_cells">${recentSales[0].price}€</div>
									<div class="mt-035">Commission</div>
									<div class="last-sales_cells">${recentSales[0].sellerComission}%</div>
								</div>
							</div>
						 </div>
						 <div class="col col-md-4 d-flex justify-content-center pr05 pl05">
							<div class="card fav_veh-card w-100">
								<div class="card-header card-o-header fav_veh_borderbot text-center">
									<span class="fav_veh_slot_title">${recentSales[1].garageName}</span>
								</div>
								<div class="card-body text-center pt-027 fav_veh_card-body2 fff d-flex justify-content-center flex-column hm-1095">
									<div>Seller</div>
									<div class="last-sales_cells">${recentSales[1].name}</div>
									<div class="mt-035">Price</div>
									<div class="last-sales_cells">${recentSales[1].price}€</div>
									<div class="mt-035">Commission</div>
									<div class="last-sales_cells">${recentSales[1].sellerComission}%</div>
								</div>
							</div>
						 </div>
						 <div class="col col-md-4 d-flex justify-content-center pl05">
							<div class="card fav_veh-card w-100">
								<div class="card-header card-o-header fav_veh_borderbot text-center">
									<span class="fav_veh_slot_title">${recentSales[2].garageName}</span>
								</div>
								<div class="card-body text-center pt-027 fav_veh_card-body2 fff d-flex justify-content-center flex-column hm-1095">
									<div>Seller</div>
									<div class="last-sales_cells">${recentSales[2].name}</div>
									<div class="mt-035">Price</div>
									<div class="last-sales_cells">${recentSales[2].price}€</div>
									<div class="mt-035">Commission</div>
									<div class="last-sales_cells">${recentSales[2].sellerComission}%</div>
								</div>
							</div>
						 </div>
						</div>
					</div>
				</div>
			`);
			break



	}
}

function adminBusinessMenu() {
	selectedWindow = "adminBusinessMenu"
	$('#adminBusinessPageID').html(`
		<div class="card-body main_card-body">
			<div class="row h-100" id="menu">
				<div class="col-md-2 d-flex flex-column sidebar-s">
					<img src="img/logo.png" class="logo">
					<hr>
					<span class="sidebar-title">Menu</span>
					<div id="sidebar-admin">
						<p class="sidebar-item mt-2 selected" id="adminbusinesses_page"><i class="fa-solid fa-building"></i> <span class="ms-1">Businesses</span></p>
						<p class="sidebar-item" id="admingarages_page"><i class="fa-solid fa-warehouse"></i> <span class="ms-1">Garages</span></p>
					</div>
					<p class="sidebar-item mt-auto logout" id="log_out"><i class="fas fa-sign-out-alt"></i></i> <span class="ms-1">Logout</span></p></div>
				<div class="col-md-10 tab-s">
					<div class="d-flex justify-content-between align-items-center">
						<span class="selected-page"><span id="page-title">Businesses</span></span>
						<div>
							<span class="username align-middle">
									<span id="playerName">${player_name}</span> <span id="avatar"><img src="img/${icon}" class="avatar"></span>
							<div class="grade">SUPERADMIN</div>
							</span>
						</div>
					</div>
					<hr>
					<div class="d-flex flex-column flex-grow-1" id="page_garagesInfo">
					<table id="businessTable" class="mt-295">
						<thead>
							<tr>
								<th class="text-center">Name</th>
								<th class="text-center">Owner</th>
								<th class="text-center">Total Earned</th>
								<th class="text-center">Actions</th>
							</tr>
						</thead>
						<tbody id="garagesTableData2">
						</tbody>
					</table>
					</div>
				</div>
			</div>
		</div>
	`);

	$('#garagesTableData2').html(`

	`);

	$('#garagesTableDataSales').html(``)
	var row = ``

	if (companies.length > 0) {
		for (var i = 0; i < companies.length; i++) {

			row += `
						<tr>
						<td class="text-center align-middle">${companies[i].company_name}</td>
							<td class="text-center align-middle">${companies[i].owner_name}</td>
							<td class="text-center align-middle">${companies[i].money}€</td>
							<td class="text-center align-middle"><button type="button" class="btn btn-blue btn-editgarage" id="EditBusiness" data-company_id="${companies[i].company_name}" data-owner_name="${companies[i].owner_name}" data-owner_identifier="${companies[i].owner}" data-money="${companies[i].money}" data-bs-toggle="modal" data-bs-target="#editBusinessModal"><i class="fa-solid fa-pen-to-square"></i> EDIT</button></td>

							
						</tr>
							</tr>
					`;

			$('#garagesTableData2').html(row);

			var table_id = document.getElementById('businessTable');
			table.push(new simpleDatatables.DataTable(table_id, {
				perPageSelect: false,
				perPage: 6,
			}));


		}
	} else {
		$('#page_businessInfo').html(`

		<div class="vehicles_window">
			<div class="row">
				<span class="card-o-title2 text-center"> No Businesses Available </span>
			</div> 
		</div>`)
	}

}

function adminGaragesMenu() {
	selectedWindow = "adminGarageMenu"
	$('#adminBusinessPageID').html(`

		<div class="card-body main_card-body">
			<div class="row h-100 " id="menu">
				<div class="col-md-2 d-flex flex-column sidebar-s">
					<img src="img/logo.png" class="logo">
					<hr>
					<span class="sidebar-title ">Menu</span>
					<div id="sidebar-admin">
						<p class="sidebar-item mt-2 " id="adminbusinesses_page"><i class="fa-solid fa-building"></i> <span class="ms-1 ">Businesses</span></p>
						<p class="sidebar-item selected " id="admingarages_page"><i class="fa-solid fa-warehouse "></i> <span class="ms-1 ">Garages</span></p>
					</div>
					<p class="sidebar-item mt-auto logout " id="log_out"><i class="fas fa-sign-out-alt "></i></i> <span class="ms-1 ">Logout</span></p>
				</div>
				<div class="col-md-10 tab-s ">
					<div class="d-flex justify-content-between align-items-center ">
						<span class="selected-page "><span id="page-title ">Garages</span></span>
						<div>
							<span class="username align-middle ">
								<span id="playerName ">${player_name}</span> <span id="avatar "><img src="img/${icon}" class="avatar "></span>
							<div class="grade ">SUPERADMIN</div>
							</span>
						</div>
					</div>
					<hr>
					<div class="d-flex flex-column gap0 h-100" id="page_garagesInfo">
						<table id="adminGaragesTable" class="mt-295 ">
							<thead>
								<tr>
									<th class="text-center ">Garage</th>
									<th class="text-center ">Price</th>
									<th class="text-center ">Units</th>
									<th class="text-center ">Actions</th>
								</tr>
							</thead>
							<tbody id="garagesTableDataAdmin"></tbody>
						</table>
					</div>
				</div>
			</div>
		</div>`);
	var row = ``
	if (garages.length > 0) {
		for (var i = 0; i < garages.length; i++) {
			if(garages[i] != undefined){
				var ownerAmount = garages[i].ownerAmount
				var maxOwners = garages[i].maxOwners
				var unitsLeft = maxOwners - ownerAmount
				row += `
					<tr>
						<td class="text-center align-middle">${garages[i].garageName}</td>
						<td class="text-center align-middle">${garages[i].price}€</td>
						<td class="text-center align-middle">${unitsLeft}</td>
						
						<td class="text-center align-middle"><button type="button" class="btn btn-blue btn-editgarage" id="EditGarage" data-garage_name="${garages[i].garageName}" data-garage_price="${garages[i].price}" data-garage_type="${garages[i].type}" data-units_remaining="${unitsLeft}" data-garage_coords="${i}" data-bs-toggle="modal" data-bs-target="#editGarageModal"><i class="fa-solid fa-pen-to-square"></i> EDIT</button></td>
					</tr>
				`;
			}
		}
		$('#garagesTableDataAdmin').html(row);
		var table_id = document.getElementById('adminGaragesTable');
		table.push(new simpleDatatables.DataTable(table_id, {
			perPageSelect: false,
			perPage: 6,
		}));
	} else {
		$('#page_garagesInfo').html(`
			<div class="vehicles_window">
				<div class="row">
					<span class="card-o-title2 grey-text text-center"> No Garages Available </span>
				</div> 
			</div>
		`);
	}
}


function buyCompany() {
	$.post('https://okokGarage/action', JSON.stringify({
		action: "buyCompany",
	}));

}


function openKeyMenu() {
	$('#keyslist').html(`

		`);
	var classSpace = ``;
	for (var i = 0; i < keys.length; i++) {
		$('#keyslist').append(` 
			<button type="button" id="giveKeys" class ="btn btn-odark2 fs125 ${classSpace}" data-vehicle_plate="${keys[i].plate}" data-vehicle_name="${keys[i].vehiclename}" data-bs-dismiss="modal">${keys[i].vehiclename} (${keys[i].plate})</button>
		`);
		if(classSpace == ``){
			classSpace = `mt-3`;
		}
	}
}


function checkIfEmpty() {
	if (document.getElementById("transferKeys_player_id").value > 0 && document.getElementById("transferKeys_player_id").value != "") {
		document.getElementById("transfer_keys").disabled = false;
	} else {
		document.getElementById("transfer_keys").disabled = true;
	}

	if (document.getElementById("transferVehicle_player_id").value > 0 && document.getElementById("transferVehicle_player_id").value != "") {
		document.getElementById('transfer_vehicle').disabled = false;
	} else {
		document.getElementById('transfer_vehicle').disabled = true;
	}
	if (document.getElementById("impoundlocation_dropdown").value !== "select" && document.getElementById("impoundtime_dropdown").value !== "select2" && document.getElementById("impound_reason").value !== "") {
		document.getElementById('impound').disabled = false;
	} else {
		document.getElementById('impound').disabled = true;
	}

	if (document.getElementById("garage_name").value !== "" && document.getElementById("garage_typedropdown").value !== "select" && document.getElementById("garage_price").value !== "" && document.getElementById("garage_maxowners").value !== "" && document.getElementById("garage_maxowners").value <= 3 && document.getElementById("garage_maxowners").value > 0) {
		document.getElementById('garage_create').disabled = false;
	} else {
		document.getElementById('garage_create').disabled = true;
	}

	if (document.getElementById("business_money").value !== "" && document.getElementById("business_owner-identifier").value !== "select" && document.getElementById("business_owner-name").value !== "" && document.getElementById("business_name").value !== "") {
		document.getElementById('edit_business').disabled = false;
	} else {
		document.getElementById('edit_business').disabled = true;
	}
	if (document.getElementById('hireEmployeeDropdown').value !== "select") {
		document.getElementById('hire_employee').disabled = false;
	} else {
		document.getElementById('hire_employee').disabled = true;
	}
	if (document.getElementById("editGarageType").value !== "select" && document.getElementById("editgarage_name").value !== "" && document.getElementById("editgarage_price").value !== "" && document.getElementById("garage_units").value !== "" && document.getElementById("garage_units").value >= 0 && document.getElementById("editgarage_price").value >= 0) {
		document.getElementById('edit_garage').disabled = false;
	} else {
		document.getElementById('edit_garage').disabled = true;

	}
	if (document.getElementById("rank_dropdown") != "") {
		document.getElementById('edit_employee').disabled = false;
	} else {
		document.getElementById('edit_employee').disabled = true;
	}

	if (document.getElementById("deposit_money").value != "" && document.getElementById("deposit_money").value > 0) {
		document.getElementById('deposit').disabled = false;
	} else {
		document.getElementById('deposit').disabled = true;
	}
	if (document.getElementById("withdraw_money").value != "" && document.getElementById("withdraw_money").value > 0) {
		document.getElementById('withdraw').disabled = false;
	} else {
		document.getElementById('withdraw').disabled = true;
	}

	if (selectedShare == "garage") {
		if (document.getElementById("share_player_id").value > 0 && document.getElementById("share_player_id").value != "") {
			document.getElementById("shareButton").disabled = false;
		} else {
			document.getElementById("shareButton").disabled = true;
		}
	} else if (selectedShare == "vehicle") {
		if (document.getElementById("share_player_id").value > 0 && document.getElementById("share_player_id").value != "" && document.getElementById("share_dropdown").value != "" && document.getElementById("share_dropdown").value != "select") {
			document.getElementById("shareButton").disabled = false;
		} else {
			document.getElementById("shareButton").disabled = true;
		}
	}
}

function openImpound() {
	if(isImpoundGlobal){
		$('#impoundlocation_dropdown').hide();
		document.getElementById("impoundlocation_dropdown").value = "";
	} else {
		for (var i = 0; i < impoundLocations.length; i++) {
			$('#impoundlocation_dropdown').append(`
				<option value = "${impoundLocations[i].name}"> ${impoundLocations[i].name}</option>
			`);
		}
	}

	for (var i = 0; i < impoundTime.length; i++) {
		$('#impoundtime_dropdown').append(` 
		<option value = "${impoundTime[i]}"> ${impoundTime[i]} hours </option>
		`);
	}
}

function openRecover(vehicles) {
	selectedWindow = "recover_vehicle"
	if (vehicles == undefined) {
		vehicles = stolenVehicle
	}

	if (vehicles.length > 5) {
		$(".recovervehicle_window").removeClass("p0000");
		$(".recovervehicle_window").addClass("p00500");
	} else {
		$(".recovervehicle_window").removeClass("p00500");
		$(".recovervehicle_window").addClass("p0000");
	}

	var row = ``

	if (vehicles != undefined && vehicles.length > 0) {
		for (var i = 0; i < vehicles.length; i++) {
			if (i > 0) {
				row += `<button type="button" id="recover_button" class="btn btn-odark2 mt-3 fs125" data-bs-toggle="modal" data-bs-target="#payModal" data-price="${recoverVehiclePrice}" data-vehicle_name="${vehicles[i].vehiclename}" data-vehicle_plate="${vehicles[i].plate}">${vehicles[i].vehiclename} (${vehicles[i].plate})</button>`;
			} else {
				row += `<button type="button" id="recover_button" class="btn btn-odark2 fs125" data-bs-toggle="modal" data-bs-target="#payModal" data-price="${recoverVehiclePrice}" data-vehicle_name="${vehicles[i].vehiclename}" data-vehicle_plate="${vehicles[i].plate}">${vehicles[i].vehiclename} (${vehicles[i].plate})</button>`;
			}
		}
	}

	$('#recovervehiclelist').html(row);
	$('.recovervehicle_menu').fadeIn();
}

function openPlayerImpound() {
	var row = `<div class="row">`;
	var type = `pr025`;
	var cardNum = 1;
	if (impoundedVehicles.length !== 0) {
		$('#impound2_menu').html(` 
			<div class="card impound2_card">
				<div class="card-body impound2_card-body">
					<span class="close-button" id="closeImpound2Menu"> <i class="fas fa-times"> </i></span>
						<div class="row">
							<div class="col-md-12 section" id="impound2_div">
								<span class="selected-page sp-i2 text-center"> <span id="page-title"> Impounded Vehicles </span></span>
								<hr class="mg050">
								<div class="impound2_window mt-2" id="impounded_vehicles">
								<div class="row" id="impounded_vehicles2">
								</div> 
							</div> 
						</div> 
					</div> 
				</div> 
			</div>
		`);
		var reasonText = ""
		for (var i = 0; i < impoundedVehicles.length; i++) {
			if (cardNum == 1) {
				type = `pr025`;
				cardNum++;
			} else if (cardNum == 2) {
				type = `pr025 pl025`;
				cardNum++;
			} else {
				type = `pl025`;
				cardNum = 1;
			}

			reasonText = impoundedVehicles[i].reason

			if (reasonText == undefined) {
				reasonText = ""
			}

			if (reasonText.replace(/\s/g, '') == "") {
				reasonText = "Not specified"
			}
			row += `
				<div class="col col-md-4 d-flex justify-content-center ${type}">
					<div class="card card-o w-100 bsn">
						<div class="card-header card-o-header card-header_vehicles text-center">
							<div class="d-flex">
								<span class="vehicles_vehicle_name w-100" data-name="${impoundedVehicles[i].vehiclename}" data-vehicle_plate = "${impoundedVehicles[i].plate}"> ${impoundedVehicles[i].vehiclename}</span> 
							</div> 
							<div class="d-flex mt-2 h16875">
								<span class="w-50 vehicles_vehicle_plate"> ${impoundedVehicles[i].plate }</span> 
								<span class="w-50 vehicles_vehicle_status"> ${impoundedVehicles[i].hoursRemaining}h ${impoundedVehicles[i].minutesRemaining}min </span> 
							</div> 
						</div> 
						<div class="card-body card-o-body text-center pt-0">
							<div class="impounded2_inner_card">
								<span class="infohover" data-bs-container="body" data-bs-toggle="popover" data-bs-placement="top" data-bs-html="true" data-bs-trigger="hover" data-bs-content="<div><b>Reason:</b> ${reasonText}</div>"><i class="fas fa-info-circle popover-circle"></i></span>
								<div class="d-flex align-items-center text-center mb-2 vehicles_img_h"> 
									<img src="${impoundedVehicles[i].vehicleURL}" class="w-100">
								</div>
								<button type = "button" class="btn btn-blue vehicles_btn mt-1 w-100" data-bs-toggle="modal" data-bs-target="#payModal" data-price="${impoundedVehicles[i].price}" data-vehicle_name="${impoundedVehicles[i].vehiclename}" data-vehicle_plate="${impoundedVehicles[i].plate}" id="retrieve_impound"> Retrieve </button> 
							</div> 
						</div> 
					</div> 
				</div>
			`;

			if ((i + 1) % 3 === 0) {
				if (impoundedVehicles.length > 6 || i < 5) {
					row = addStr(row, row.length, `</div><div class="row mt-2">`);
				}
			}
		}
		row += `</div>`;
		$('#impounded_vehicles').html(row);

		if (impoundedVehicles.length > 6) {
			$(".impound2_window").addClass("p00500");
		} else {
			$(".impound2_window").removeClass("p00500");
		}

		var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
		var popoverList = popoverTriggerList.map(function(popoverTriggerEl) {
			return new bootstrap.Popover(popoverTriggerEl)
		})
	} else {
		$('#impound2_menu').html(` 
			<div class="card impound2_card">
				<div class="card-body impound2_card-body">
					<span class="close-button" id="closeImpound2Menu"> <i class="fas fa-times"> </i></span>
					<div class="row">
						<div class="col-md-12 section" id="impound2_div">
							<span class="selected-page sp-i2 text-center"> 
								<span id="page-title"> Impounded Vehicles </span>
							</span>
							<hr class="mg050">
							<span class="card-o-title2 text-center grey-text"> No Vehicles Impounded </span>
						</div> 
					</div> 
				</div> 
			</div>
		`);
	}
}

function openOverview() {
	var sideBar = `
		<p class="sidebar-item mt-2 selected" id="overview_page"><i class="bi bi-grid-1x2-fill"></i> <span class="ms-1">Overview</span></p>
		<p class="sidebar-item" id="vehicles_page"><i class="fa-solid fa-warehouse"></i> <span class="ms-1">Vehicles</span></p>
		<p class="sidebar-item" id="share_page"><i class="fa-solid fa-users"></i> <span class="ms-1">Share</span></p>
	`;
	if (noSharedTab) {
		sideBar = `
			<p class="sidebar-item mt-2 selected" id="overview_page"><i class="bi bi-grid-1x2-fill"></i> <span class="ms-1">Overview</span></p>
			<p class="sidebar-item" id="vehicles_page"><i class="fa-solid fa-warehouse"></i> <span class="ms-1">Vehicles</span></p>
		`;
	}
	$('#sidebar').html(sideBar);


	$('#top_bar').html(`
		<span class="selected-page">Overview</span>
		<div>
			<span class="username align-middle">
				<span id="playerName">${player_name}</span> <span id="avatar"><img src="img/${icon}" class="avatar"></span>
			</span>
		</div>
	`);

	if (vehicle.length === 0) {
		$('#page_info').html(` 
		<div class="row">
			<div class="col col-md-6 d-flex justify-content-center pr05">
				<div class="card card-o w-100">
					<div class="card-header card-o-header text-center">
						<span class="card-o-title"> Vehicle Information </span> 
					</div> 
					<div class="card-body card-o-body vehicle_information_card-body text-center">
					<div class="h-100 d-flex justify-content-center align-items-center veh_info_noinfo"> No Information Available </div> 
				</div> 
			</div> 
		</div> 
		<div class="col col-md-6 d-flex justify-content-center pl05">
		<div class="card card-o w-100">
		<div class="card-header card-o-header text-center">
		<span class="card-o-title"> Vehicle Not Selected </span> 
		</div> 
		<div class="card-body card-o-body vehicle_selected_card-body text-center">
		<span class="veh_info_notselected"> No Selection </span> 
		<div class="card-body text-center d-flex justify-content-center align-items-center veh_selected_h"> <img src="img/${garageType}.png" class="veh_selected_img">
		</div> 
		<div class="d-flex mt-119">
		<span class="veh_notselected_btn w-50 me-1"> View </span>
		<span class="veh_notselected_btn w-50 ms-1"> Take Out </span> 
		</div> 
		<div class="d-flex mt-2">
		<span class="veh_notselected_btn w-50 me-1"> Transfer Keys </span> 
		<span class="veh_notselected_btn w-50 ms-1"> Transfer Vehicle </span> </div> 
		</div> 
		</div> 
		</div>
		</div>

		`);

		showFavourites()
	} else {

		if (vehicle[0].stored == 0) {
			vehicle[0].stored = "Outside"
		} else if (vehicle[0].stored == 1) {
			vehicle[0].stored = "Stored"
		} else if (vehicle[0].stored == 2) {
			vehicle[0].stored = "Impounded"
		} else if (vehicle[0].stored == 3) {
			vehicle[0].stored = "Stolen"
		}

		var garageSaved = ``;
		if(!getVehiclesAnywhere){
			garageSaved = `<span class="fs1">&nbsp;(${vehicle[0].garage_name})</span>`;
		}
		var stored_div = ``;
		if (vehicle[0].stored == 'Outside') {
			vehicle[0].stored = "Outside";
			stored_div = `<div class="d-flex justify-content-center align-items-center mt-2 veh_info_info">Status:&nbsp;${vehicle[0].stored}</div>`;
		} else if (vehicle[0].stored == 'Stored') {
			vehicle[0].stored = "Stored";
			stored_div = `<div class="d-flex justify-content-center align-items-center mt-2 veh_info_info">Status:&nbsp;${vehicle[0].stored}${garageSaved}</div>`;
		} else if (vehicle[0].stored == 'Impounded') {
			vehicle[0].stored = "Impounded";
			stored_div = `<div class="d-flex justify-content-center align-items-center mt-2 veh_info_info">Status:&nbsp;${vehicle[0].stored}</div>`;
		} else if (vehicle[0].stored == 'Stolen') {
			vehicle[0].stored = "Stolen";
			stored_div = `<div class="d-flex justify-content-center align-items-center mt-2 veh_info_info">Status:&nbsp;${vehicle[0].stored}</div>`;
		}
		$('#page_info').html(`
				<div class="row">
					<div class="col col-md-6 d-flex justify-content-center pr05">
						<div class="card card-o w-100">
							<div class="card-header card-o-header text-center">
								<span class="card-o-title">Vehicle Information</span>
							</div>
							<div class="card-body card-o-body vehicle_information_card-body text-center">
								<div class="d-flex justify-content-center align-items-center veh_info_info">Plate:&nbsp;${vehicle[0].plate}</div>
								${stored_div}
								<div class="d-flex justify-content-center align-items-center mt-2 veh_info_info">Fuel:&nbsp;${Math.round(vehicle[0].fLevel)}%</div>
								<div class="d-flex">
									<div class="d-flex justify-content-center align-items-center mt-2 veh_info_info w-50 me-1">Body:&nbsp;${(Math.round(vehicle[0].bHealth) * 0.1).toFixed(1).replace(/\.0$/, '')}%</div>
									<div class="d-flex justify-content-center align-items-center mt-2 veh_info_info w-50 ms-1">Engine:&nbsp;${(Math.round(vehicle[0].eHealth) * 0.1).toFixed(1).replace(/\.0$/, '')}%</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col col-md-6 d-flex justify-content-center pl05">
						<div class="card card-o w-100">
							<div class="card-header card-o-header text-center">
								<span class="card-o-title">Vehicle Selected</span>
							</div>
							<div class="card-body card-o-body vehicle_selected_card-body text-center">
								<span class="veh_info_selected">${vehicle[0].vehiclename}</span>
								<div class="card-body text-center d-flex justify-content-center align-items-center veh_selected_h">
									<img src="${vehicle[0].vehicleURL}" class="veh_selected_img">
								</div>
								<div class="d-flex mt-119">
									<button type="button" class="btn btn-blue veh_selected_btn w-50 me-1" id="view_vehicle" data-vehicle_plate="${vehicle[0].plate}" data-vehicle_id="${vehicle[0].vehicleModel}" data-vehicleurl="${vehicle[0].vehicleURL}">View</button>
									<button type="button" class="btn btn-blue veh_selected_btn w-50 ms-1" id="take_out" data-vehicle_plate="${vehicle[0].plate}" data-vehicle_id="${vehicle[0].vehicleModel}" data-vehicle_name="${vehicle[0].vehiclename}" data-vehicle_type="${vehicle[0].type}" data-vehicleurl="${vehicle[0].vehicleURL}">Take Out</button>
								</div>
								<div class="d-flex mt-2">
									<button type="button" id="transferKeys" class="btn btn-blue veh_selected_btn w-50 me-1" data-bs-toggle="modal" data-bs-target="#transferKeysModal">Transfer Keys</button>
									<button type="button" id="transferVehicle" class="btn btn-blue veh_selected_btn w-50 ms-1" data-bs-toggle="modal" data-bs-target="#transferVehicleModal">Transfer Vehicle</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				
			`);
		showFavourites()
	}

	$('#page_info').removeClass('gap0');
	$('#page_info').addClass('gap1');

	selectedWindow = "overview";
}

function openSocietyGarage() {
	var row = `<div class="row">`;
	var type = `pr025`;
	var cardNum = 1;
	if (vehicles.length !== 0) {
		$('#impound2_menu').html(` 
			<div class="card impound2_card">
				<div class="card-body impound2_card-body">
					<span class="close-button" id="closeImpound2Menu"> <i class="fas fa-times"> </i></span>
						<div class="row">
							<div class="col-md-12 section" id="impound2_div">
								<span class="selected-page sp-i2 text-center"> <span id="page-title"> Society Vehicles </span></span>
								<hr class="mg050">
								<div class="impound2_window mt-2" id="impounded_vehicles">
								<div class="row" id="impounded_vehicles2">
								</div> 
							</div> 
						</div> 
					</div> 
				</div> 
			</div>
		`);
		var reasonText = ""
		for (var i = 0; i < vehicles.length; i++) {
			if (cardNum == 1) {
				type = `pr025`;
				cardNum++;
			} else if (cardNum == 2) {
				type = `pr025 pl025`;
				cardNum++;
			} else {
				type = `pl025`;
				cardNum = 1;
			}

			if (vehicles[i].stored == 0) {
				vehicles[i].stored = "Outside"
			} else if (vehicles[i].stored == 1) {
				vehicles[i].stored = "Stored"
			} else if (vehicles[i].stored == 2) {
				vehicles[i].stored = "Impounded"
			} else if (vehicles[i].stored == 3) {
				vehicles[i].stored = "Stolen"
			}
			row += `
				<div class="col col-md-4 d-flex justify-content-center ${type}">
					<div class="card card-o w-100 bsn">
						<div class="card-header card-o-header card-header_vehicles text-center">
							<div class="d-flex">
								<span class="vehicles_vehicle_name w-100" data-name="${vehicles[i].vehiclename}" data-vehicle_plate = "${vehicles[i].plate}"> ${vehicles[i].vehiclename}</span> 
							</div> 
							<div class="d-flex mt-2 h16875">
								<span class="w-50 vehicles_vehicle_plate"> ${vehicles[i].plate}</span> 
								<span class="w-50 vehicles_vehicle_status"> ${vehicles[i].stored}</span> 
							</div> 
						</div> 
						<div class="card-body card-o-body text-center pt-0">
							<div class="impounded2_inner_card">
								<div class="d-flex align-items-center text-center mb-2 vehicles_img_h"> 
									<img src="${vehicles[i].vehicleURL}" class="w-100">
								</div>
								<button type = "button" class="btn btn-blue vehicles_btn mt-1 w-100" id="take_out2" data-vehicle_plate="${vehicles[i].plate}" data-vehicle_id="${vehicles[i].vehicleModel}" data-vehicle_name="${vehicles[i].vehiclename}" data-vehicle_type="${vehicles[i].type}">Take Out</button> 
							</div> 
						</div> 
					</div> 
				</div>
			`;

			if ((i + 1) % 3 === 0) {
				if (vehicles.length > 6 || i < 5) {
					row = addStr(row, row.length, `</div><div class="row mt-2">`);
				}
			}
		}
		row += `</div>`;
		$('#impounded_vehicles').html(row);

		if (vehicles.length > 6) {
			$("#impounded_vehicles").addClass("p00500");
		} else {
			$("#impounded_vehicles").removeClass("p00500");
		}
	} else {
		$('#impound2_menu').html(` 
			<div class="card impound2_card">
				<div class="card-body impound2_card-body">
					<span class="close-button" id="closeImpound2Menu"> <i class="fas fa-times"> </i></span>
					<div class="row">
						<div class="col-md-12 section" id="impound2_div">
							<span class="selected-page sp-i2 text-center"> 
								<span id="page-title"> Society Vehicles </span>
							</span>
							<hr class="mg050">
							<span class="card-o-title2 text-center"> No Vehicles Available </span>
						</div> 
					</div> 
				</div> 
			</div>
		`);
	}
}

function showFavourites() {
	favVehicles = [];
	favouriteAmount = 0;
	for (var i = 0; i < vehicles.length; i++) {
		if (vehicles[i].favourite && garageType == vehicles[i].type) {
			favVehicles[favouriteAmount] = vehicles[i]
			favouriteAmount += 1
		}
	}
	favAmount = favouriteAmount;
	switch (favouriteAmount) {

		case 0:
			$('#page_info').append(`

			<div class="card card-o d-flex flex-column">
				<div class="card-header card-o-header text-center">
					<span class="card-o-title">Favorite Vehicles</span>
				</div>
						<div class="card-body card-o-body favorite_vehicles_card-body">
							<div class="row h-100">
							<div class="col col-md-4 d-flex justify-content-center pr05">
							<div class="card fav_veh-card w-100">
								<div class="card-header card-o-header fav_veh_borderbot text-center">
									<span class="fav_veh_slot_title">Slot #1</span>
								</div>
								<div class="card-body text-center fav_veh_height">
									<div class="available_slot">
										<span>Available</span>
										<br>
										<span>Slot</span>
									</div>
									<div class="d-flex mt-09">
										<button type="button" class="btn btn-blue fav_veh_btn w-100" id="Choose">Choose</button>
									</div>
								</div>
							</div>
						</div>
						<div class="col col-md-4 d-flex justify-content-center pr05 pl05">
							<div class="card fav_veh-card w-100">
								<div class="card-header card-o-header fav_veh_borderbot text-center">
									<span class="fav_veh_slot_title">Slot #2</span>
								</div>
								<div class="card-body text-center fav_veh_height">
									<div class="available_slot">
										<span>Available</span>
										<br>
										<span>Slot</span>
									</div>
									<div class="d-flex mt-09">
										<button type="button" class="btn btn-blue fav_veh_btn w-100" id="Choose">Choose</button>
									</div>
								</div>
							</div>
						</div>
						<div class="col col-md-4 d-flex justify-content-center pl05">
							<div class="card fav_veh-card w-100">
								<div class="card-header card-o-header fav_veh_borderbot text-center">
									<span class="fav_veh_slot_title">Slot #3</span>
								</div>
								<div class="card-body text-center fav_veh_height">
									<div class="available_slot">
										<span>Available</span>
										<br>
										<span>Slot</span>
									</div>
									<div class="d-flex mt-09">
										<button type="button" class="btn btn-blue fav_veh_btn w-100" id="Choose">Choose</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		`);
			break;


		case 1:
			var buttonStatus = '';
			var vehicleText = 'Take Out';
			if(favVehicles[favouriteAmount - 1].stored != 1){
				buttonStatus = 'disabled';
				if(favVehicles[favouriteAmount - 1].stored == 0){
					vehicleText = 'Outside';
				} else if(favVehicles[favouriteAmount - 1].stored == 2){
					vehicleText = 'Impounded';
				} else if(favVehicles[favouriteAmount - 1].stored == 3){
					vehicleText = 'Stolen';
				}
			}
			$('#page_info').append(`

				<div class="card card-o d-flex flex-column">
					<div class="card-header card-o-header text-center">
						<span class="card-o-title">Favorite Vehicles</span>
					</div>
					<div class="card-body card-o-body favorite_vehicles_card-body">
						<div class="row h-100">
							<div class="col col-md-4 d-flex justify-content-center pr05">
								<div class="card fav_veh-card w-100">
									<div class="card-header card-o-header fav_veh_borderbot text-center">
										<span class="fav_veh_slot_title">${favVehicles[favouriteAmount - 1].vehiclename}</span>
									</div>
									<div class="card-body text-center fav_veh_height">
										<div class="used_slot">
											<img src="${favVehicles[favouriteAmount - 1].vehicleURL}" class="fav_veh_img">
										</div>
										<div class="d-flex mt-09">
											<button type="button" class="btn btn-blue fav_veh_btn w-100" id="take_out" data-vehicle_plate="${favVehicles[favouriteAmount - 1].plate}" data-vehicle_id="${favVehicles[favouriteAmount - 1].vehicleModel}" data-vehicle_name="${favVehicles[favouriteAmount - 1].vehiclename}" data-vehicle_type="${favVehicles[favouriteAmount - 1].type}" ${buttonStatus}>${vehicleText}</button>
										</div>
									</div>
								</div>
							</div>
							<div class="col col-md-4 d-flex justify-content-center pr05 pl05">
								<div class="card fav_veh-card w-100">
									<div class="card-header card-o-header fav_veh_borderbot text-center">
										<span class="fav_veh_slot_title">Slot #2</span>
									</div>
									<div class="card-body text-center fav_veh_height">
										<div class="available_slot">
											<span>Available</span>
											<br>
											<span>Slot</span>
										</div>
										<div class="d-flex mt-09">
											<button type="button" class="btn btn-blue fav_veh_btn w-100" id="Choose">Choose</button>
										</div>
									</div>
								</div>
							</div>
							<div class="col col-md-4 d-flex justify-content-center pl05">
								<div class="card fav_veh-card w-100">
									<div class="card-header card-o-header fav_veh_borderbot text-center">
										<span class="fav_veh_slot_title">Slot #3</span>
									</div>
									<div class="card-body text-center fav_veh_height">
										<div class="available_slot">
											<span>Available</span>
											<br>
											<span>Slot</span>
										</div>
										<div class="d-flex mt-09">
											<button type="button" class="btn btn-blue fav_veh_btn w-100" id="Choose">Choose</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			`);
			break;
		case 2:
			var buttonStatus = '';
			var buttonStatus2 = '';
			var vehicleText = 'Take Out';
			var vehicleText2 = 'Take Out';
			if(favVehicles[favouriteAmount - 2].stored != 1){
				buttonStatus = 'disabled';
				if(favVehicles[favouriteAmount - 2].stored == 0){
					vehicleText = 'Outside';
				} else if(favVehicles[favouriteAmount - 2].stored == 2){
					vehicleText = 'Impounded';
				} else if(favVehicles[favouriteAmount - 2].stored == 3){
					vehicleText = 'Stolen';
				}
			}
			if(favVehicles[favouriteAmount - 1].stored != 1){
				buttonStatus2 = 'disabled';
				if(favVehicles[favouriteAmount - 1].stored == 0){
					vehicleText2 = 'Outside';
				} else if(favVehicles[favouriteAmount - 1].stored == 2){
					vehicleText2 = 'Impounded';
				} else if(favVehicles[favouriteAmount - 1].stored == 3){
					vehicleText2 = 'Stolen';
				}
			}
			$('#page_info').append(`

				<div class="card card-o d-flex flex-column">
					<div class="card-header card-o-header text-center">
						<span class="card-o-title">Favorite Vehicles</span>
					</div>
					<div class="card-body card-o-body favorite_vehicles_card-body">
						<div class="row h-100">
							<div class="col col-md-4 d-flex justify-content-center pr05">
								<div class="card fav_veh-card w-100">
									<div class="card-header card-o-header fav_veh_borderbot text-center">
										<span class="fav_veh_slot_title">${favVehicles[favouriteAmount - 2].vehiclename}</span>
									</div>
									<div class="card-body text-center fav_veh_height">
										<div class="used_slot">
											<img src="${favVehicles[favouriteAmount - 2].vehicleURL}" class="fav_veh_img">
										</div>
										<div class="d-flex mt-09">
											<button type="button" class="btn btn-blue fav_veh_btn w-100" id="take_out" data-vehicle_plate="${favVehicles[favouriteAmount - 2].plate}" data-vehicle_id="${favVehicles[favouriteAmount - 2].vehicleModel}" data-vehicle_name="${favVehicles[favouriteAmount - 2].vehiclename}" data-vehicle_type="${favVehicles[favouriteAmount - 2].type}" ${buttonStatus}>${vehicleText}</button>
										</div>
									</div>
								</div>
							</div>
							<div class="col col-md-4 d-flex justify-content-center pr05 pl05">
								<div class="card fav_veh-card w-100">
									<div class="card-header card-o-header fav_veh_borderbot text-center">
										<span class="fav_veh_slot_title">${favVehicles[favouriteAmount - 1].vehiclename}</span>
									</div>
									<div class="card-body text-center fav_veh_height">
										<div class="used_slot">
											<img src="${favVehicles[favouriteAmount - 1].vehicleURL}" class="fav_veh_img">
										</div>
										<div class="d-flex mt-09">
											<button type="button" class="btn btn-blue fav_veh_btn w-100" id="take_out" data-vehicle_plate="${favVehicles[favouriteAmount - 1].plate}" data-vehicle_id="${favVehicles[favouriteAmount - 1].vehicleModel}" data-vehicle_name="${favVehicles[favouriteAmount - 1].vehiclename}" data-vehicle_type="${favVehicles[favouriteAmount - 1].type}" ${buttonStatus2}>${vehicleText2}</button>
										</div>
									</div>
								</div>
							</div>
							<div class="col col-md-4 d-flex justify-content-center pl05">
								<div class="card fav_veh-card w-100">
									<div class="card-header card-o-header fav_veh_borderbot text-center">
										<span class="fav_veh_slot_title">Slot #3</span>
									</div>
									<div class="card-body text-center fav_veh_height">
										<div class="available_slot">
											<span>Available</span>
											<br>
											<span>Slot</span>
										</div>
										<div class="d-flex mt-09">
											<button type="button" class="btn btn-blue fav_veh_btn w-100" id="Choose">Choose</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			`);
			break;
		case 3:
			var buttonStatus = '';
			var buttonStatus2 = '';
			var buttonStatus3 = '';
			var vehicleText = 'Take Out';
			var vehicleText2 = 'Take Out';
			var vehicleText3 = 'Take Out';
				
			if(favVehicles[favouriteAmount - 3].stored != 1){
				buttonStatus = 'disabled';
				if(favVehicles[favouriteAmount - 3].stored == 0){
					vehicleText = 'Outside';
				} else if(favVehicles[favouriteAmount - 3].stored == 2){
					vehicleText = 'Impounded';
				} else if(favVehicles[favouriteAmount - 3].stored == 3){
					vehicleText = 'Stolen';
				}
			}
			if(favVehicles[favouriteAmount - 2].stored != 1){
				buttonStatus2 = 'disabled';
				if(favVehicles[favouriteAmount - 2].stored == 0){
					vehicleText2 = 'Outside';
				} else if(favVehicles[favouriteAmount - 2].stored == 2){
					vehicleText2 = 'Impounded';
				} else if(favVehicles[favouriteAmount - 2].stored == 3){
					vehicleText2 = 'Stolen';
				}
			}
			if(favVehicles[favouriteAmount - 1].stored != 1){
				buttonStatus3 = 'disabled';
				if(favVehicles[favouriteAmount - 1].stored == 0){
					vehicleText3 = 'Outside';
				} else if(favVehicles[favouriteAmount - 1].stored == 2){
					vehicleText3 = 'Impounded';
				} else if(favVehicles[favouriteAmount - 1].stored == 3){
					vehicleText3 = 'Stolen';
				}
			}
			$('#page_info').append(`

				<div class="card card-o d-flex flex-column">
					<div class="card-header card-o-header text-center">
						<span class="card-o-title">Favorite Vehicles</span>
					</div>
					<div class="card-body card-o-body favorite_vehicles_card-body">
						<div class="row h-100">
							<div class="col col-md-4 d-flex justify-content-center pr05">
								<div class="card fav_veh-card w-100">
									<div class="card-header card-o-header fav_veh_borderbot text-center">
										<span class="fav_veh_slot_title">${favVehicles[favouriteAmount - 3].vehiclename}</span>
									</div>
									<div class="card-body text-center fav_veh_height">
										<div class="used_slot">
											<img src="${favVehicles[favouriteAmount - 3].vehicleURL}" class="fav_veh_img">
										</div>
										<div class="d-flex mt-09">
											<button type="button" class="btn btn-blue fav_veh_btn w-100" id="take_out" data-vehicle_plate="${favVehicles[favouriteAmount - 3].plate}" data-vehicle_id="${favVehicles[favouriteAmount - 3].vehicleModel}"data-vehicle_name="${favVehicles[favouriteAmount - 3].vehiclename}" data-vehicle_type="${favVehicles[favouriteAmount - 3].type}" ${buttonStatus}>${vehicleText}</button>
										</div>
									</div>
								</div>
							</div>
							<div class="col col-md-4 d-flex justify-content-center pr05 pl05">
								<div class="card fav_veh-card w-100">
									<div class="card-header card-o-header fav_veh_borderbot text-center">
										<span class="fav_veh_slot_title">${favVehicles[favouriteAmount - 2].vehiclename}</span>
									</div>
									<div class="card-body text-center fav_veh_height">
										<div class="used_slot">
											<img src="${favVehicles[favouriteAmount - 2].vehicleURL}" class="fav_veh_img">
										</div>
										<div class="d-flex mt-09">
											<button type="button" class="btn btn-blue fav_veh_btn w-100" id="take_out" data-vehicle_plate="${favVehicles[favouriteAmount - 2].plate}" data-vehicle_id="${favVehicles[favouriteAmount - 2].vehicleModel}" data-vehicle_name="${favVehicles[favouriteAmount - 2].vehiclename}" data-vehicle_type="${favVehicles[favouriteAmount - 2].type}" ${buttonStatus2}>${vehicleText2}</button>
										</div>
									</div>
								</div>
							</div>
							<div class="col col-md-4 d-flex justify-content-center pl05">
								<div class="card fav_veh-card w-100">
									<div class="card-header card-o-header fav_veh_borderbot text-center">
										<span class="fav_veh_slot_title">${favVehicles[favouriteAmount - 1].vehiclename}</span>
									</div>
									<div class="card-body text-center fav_veh_height">
										<div class="used_slot">
											<img src="${favVehicles[favouriteAmount - 1].vehicleURL}" class="fav_veh_img">
										</div>
										<div class="d-flex mt-09">
											<button type="button" class="btn btn-blue fav_veh_btn w-100" id="take_out" data-vehicle_plate="${favVehicles[favouriteAmount - 1].plate}" data-vehicle_id="${favVehicles[favouriteAmount - 1].vehicleModel}" data-vehicle_name="${favVehicles[favouriteAmount - 1].vehiclename}" data-vehicle_type="${favVehicles[favouriteAmount - 1].type}" ${buttonStatus3}>${vehicleText3}</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			`);
			break;
	}

}

function openVehicles() {
	var num2 = vehicles.length;
	var added = 0;
	var row = `
		<div class="vehicles_window">
			<div class="row">
	`;

	var sideBar = `
		<p class="sidebar-item mt-2" id="overview_page"><i class="bi bi-grid-1x2-fill"></i> <span class="ms-1">Overview</span></p>
		<p class="sidebar-item selected" id="vehicles_page"><i class="fa-solid fa-warehouse"></i> <span class="ms-1">Vehicles</span></p>
		<p class="sidebar-item" id="share_page"><i class="fa-solid fa-users"></i> <span class="ms-1">Share</span></p>
	`;
	if (noSharedTab) {
		sideBar = `
			<p class="sidebar-item mt-2" id="overview_page"><i class="bi bi-grid-1x2-fill"></i> <span class="ms-1">Overview</span></p>
			<p class="sidebar-item selected" id="vehicles_page"><i class="fa-solid fa-warehouse"></i> <span class="ms-1">Vehicles</span></p>
		`;
	}
	$('#sidebar').html(sideBar);

	if (sharedVehiclesBeingShown != true) {
		for (var i = 0; i < num2; i++) {
			if (garageType == vehicles[i].type) {
				currentVehicleType.push(vehicles[i])
			}
		}
	} else {
		for (var i = 0; i < sharedVehicles.length; i++) {
			if (garageType == sharedVehicles[i].type) {
				currentVehicleType.push(sharedVehicles[i])
			}
		}
	}

	var starCode = ``;

	if (isSocietyGarage) {
		starCode = ``
	}

	if (currentVehicleType.length > 0) {
		var buttonState = '';
		for (var i = 0; i < currentVehicleType.length; i++) {
			added++
			var element = added % 3;

			if (currentVehicleType[i].favourite) {
				favClass = "vehicles_favoritestar"
			} else {
				favClass = "vehicles_notfavoritestar"
			}

			if(parseInt(currentVehicleType[i].stored, 10) != 1){
				buttonState = 'disabled';
			} else {
				buttonState = '';
			}

			if (currentVehicleType[i].stored == 0) {
				currentVehicleType[i].stored = "Outside"
			} else if (currentVehicleType[i].stored == 1) {
				currentVehicleType[i].stored = "Stored"
			} else if (currentVehicleType[i].stored == 2) {
				currentVehicleType[i].stored = "Impounded"
			} else if (currentVehicleType[i].stored == 3) {
				currentVehicleType[i].stored = "Stolen"
			}



			if (garageType == currentVehicleType[i].type) {
				starCode = `<span id="star" data-is_favourite="${favClass}" data-vehicle_plate="${currentVehicleType[i].plate}" data-vehicle_model="${currentVehicleType[i].vehicleModel}" data-vehicleurl="${currentVehicleType[i].vehicleURL}" class="${favClass}"><i class="fa-solid fa-star"></i></span>`;
				if (isSocietyGarage) {
					starCode = ``
				}
				if (element === 1) {

					row += `
							<div class="col col-md-4 d-flex justify-content-center pr025">
								<div class="card card-o w-100 bsn">
									<div class="card-header card-o-header card-header_vehicles text-center">
										<div class="d-flex">
											<input type="text" class="vehicles_vehicle_name w-100" spellcheck="false" maxlength="23" data-name="${currentVehicleType[i].vehiclename}" data-vehicle_plate = "${currentVehicleType[i].plate}" value="${currentVehicleType[i].vehiclename}">
										</div>
										<div class="d-flex mt-2 h16875">
											<span class="w-50 vehicles_vehicle_plate">${currentVehicleType[i].plate}</span>
											<span class="w-50 vehicles_vehicle_status">${currentVehicleType[i].stored}</span>
										</div>
									</div>
									<div class="card-body card-o-body text-center pt-0">
										<div class="vehicles_inner_card">
											
											${starCode}
											<div class="d-flex align-items-center text-center mb-2 vehicles_img_h">
												<img src="${currentVehicleType[i].vehicleURL}" class="w-100">
											</div>
											<div class="d-flex mt-1">
												<button type="button" class="btn btn-blue vehicles_btn me-1 w-50" id="select_vehicle" data-vehicle_plate="${currentVehicleType[i].plate}" data-vehicle_model="${currentVehicleType[i].vehicleModel}" data-vehicleurl="${currentVehicleType[i].vehicleURL}">Select</button>
												<button type="button" class="btn btn-blue vehicles_btn ms-1 w-50" id="take_out" data-vehicle_plate="${currentVehicleType[i].plate}" data-vehicle_id="${currentVehicleType[i].vehicleModel}" data-vehicle_name="${currentVehicleType[i].vehiclename}" data-vehicle_type="${currentVehicleType[i].type}" data-vehicleurl="${currentVehicleType[i].vehicleURL}" ${buttonState}>Take Out</button>
											</div>
										</div>
									</div>
								</div>
							</div>
					`;
				} else if (element === 2) {

					row += `
							<div class="col col-md-4 d-flex justify-content-center pr025 pl025">
								<div class="card card-o w-100 bsn">
									<div class="card-header card-o-header card-header_vehicles text-center">
										<div class="d-flex">
											<input type="text" class="vehicles_vehicle_name w-100" spellcheck="false" maxlength="23" data-name="${currentVehicleType[i].vehiclename}" data-vehicle_plate = "${currentVehicleType[i].plate}" value="${currentVehicleType[i].vehiclename}">
										</div>
										<div class="d-flex mt-2 h16875">
											<span class="w-50 vehicles_vehicle_plate">${currentVehicleType[i].plate}</span>
											<span class="w-50 vehicles_vehicle_status">${currentVehicleType[i].stored}</span>
										</div>
									</div>
									<div class="card-body card-o-body text-center pt-0">
										<div class="vehicles_inner_card">
											${starCode}
											<div class="d-flex align-items-center text-center mb-2 vehicles_img_h">
												<img src="${currentVehicleType[i].vehicleURL}" class="w-100">
											</div>
											<div class="d-flex mt-1">
											<button type="button" class="btn btn-blue vehicles_btn me-1 w-50" id="select_vehicle" data-vehicle_plate="${currentVehicleType[i].plate}" data-vehicle_model="${currentVehicleType[i].vehicleModel}" data-vehicleurl="${currentVehicleType[i].vehicleURL}">Select</button>
			
												<button type="button" class="btn btn-blue vehicles_btn ms-1 w-50" id="take_out" data-vehicle_plate="${currentVehicleType[i].plate}" data-vehicle_id="${currentVehicleType[i].vehicleModel}" data-vehicle_name="${currentVehicleType[i].vehiclename}" data-vehicle_type="${currentVehicleType[i].type}" ${buttonState}>Take Out</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						`;
				} else if (element === 0) {
					row += `
							<div class="col col-md-4 d-flex justify-content-center pl025">
								<div class="card card-o w-100 bsn">
									<div class="card-header card-o-header card-header_vehicles text-center">
										<div class="d-flex">
											<input type="text" class="vehicles_vehicle_name w-100" spellcheck="false" maxlength="23" data-name="${currentVehicleType[i].vehiclename}" data-vehicle_plate = "${currentVehicleType[i].plate}" value="${currentVehicleType[i].vehiclename}">
										</div>
										<div class="d-flex mt-2 h16875">
											<span class="w-50 vehicles_vehicle_plate">${currentVehicleType[i].plate}</span>
											<span class="w-50 vehicles_vehicle_status">${currentVehicleType[i].stored}</span>
										</div>
									</div>
									<div class="card-body card-o-body text-center pt-0">
										<div class="vehicles_inner_card">
											${starCode}
											<div class="d-flex align-items-center text-center mb-2 vehicles_img_h">
												<img src="${currentVehicleType[i].vehicleURL}" class="w-100">
											</div>
											<div class="d-flex mt-1">
											<button type="button" class="btn btn-blue vehicles_btn me-1 w-50" id="select_vehicle" data-vehicle_plate="${currentVehicleType[i].plate}" data-vehicle_model="${currentVehicleType[i].vehicleModel}" data-vehicleurl="${currentVehicleType[i].vehicleURL}">Select</button>
												
												
												<button type="button" class="btn btn-blue vehicles_btn ms-1 w-50" id="take_out" data-vehicle_plate="${currentVehicleType[i].plate}" data-vehicle_id="${currentVehicleType[i].vehicleModel}" data-vehicle_name="${currentVehicleType[i].vehiclename}" data-vehicle_type="${currentVehicleType[i].type}" ${buttonState}>Take Out</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						`;
				}

				if ((added) % 3 === 0 && num2 != added) {
					row = addStr(row, row.length, `</div><div class="row mt-2">`);
				}
			}
		}

		row += `
					</div>
				</div>
			`;

		$('#page_info').html(row);

		if (added > 6) {
			$(".vehicles_window").removeClass("p0000");
			$(".vehicles_window").addClass("p00500");
		} else {
			$(".vehicles_window").removeClass("p00500");
			$(".vehicles_window").addClass("p0000");
		}

		async function checkImage(url) {
			try {
				const response = await fetch(url);
				return response.ok;
			} catch {
				return false;
			}
		}
		
		async function processVehicles() {
			let added = 0;
			for (const vehicle of currentVehicleType) {
				added++;
				const isImage = await checkImage(vehicle.vehicleURL);
				if (!isImage) {
					console.log(`Image (${vehicle.vehicleURL}) does not exist or cannot be loaded.`);
				}
			}
		}
		
		processVehicles();
		currentVehicleType = []
	} else {
		$(`#page_info`).html(`

			<div class="vehicles_window">
				<div class="row">
					<span class="card-o-title2 text-center grey-text"> No Vehicles Owned </span>
				</div> 
			</div>`)
	}
	selectedWindow = "vehicles";
}




function openShare() {
	$('#sidebar').html(`
		<p class="sidebar-item mt-2" id="overview_page"><i class="bi bi-grid-1x2-fill"></i> <span class="ms-1">Overview</span></p>
		<p class="sidebar-item" id="vehicles_page"><i class="fa-solid fa-warehouse"></i> <span class="ms-1">Vehicles</span></p>
		<p class="sidebar-item selected" id="share_page"><i class="fa-solid fa-users"></i> <span class="ms-1">Share</span></p>
	`);

	selectedWindow = "share";
	$.post('https://okokGarage/action', JSON.stringify({
		action: "getSharingWith",
	}));
}


$(document).on('click', "#shared", function() {
	selectedShare = "vehicle"
	$('#mySharesTable').html(`
		<div class="row h-100">
			<div class="d-flex justify-content-center flex-column align-items-center">
				<span class="load"></span>
				<br>
				<div class="loadingtxt">Loading Data...</div>
			</div>
		</div>
	`);

	$('#mySharesTable').addClass('h-3275');

	$("#shared2").addClass("btn-odark2").removeClass("btn-blue");
	$("#shared").addClass("btn-blue").removeClass("btn-odark2");
	$.post('https://okokGarage/action', JSON.stringify({
		action: "getSharingWith",
	}));
});


$(document).on('click', "#transferVehicle", function() {
	$('#transfer_vehicle_model').text(vehicle[0].vehiclename + " (" + vehicle[0].plate + ")");
	if (canTransferToSociety) {
		$('#transfer_vehicle_options').html(`
			<button type="button" id="transfer_to_player" class="btn btn-blue w-50 me-2 ci-option">PLAYER</button>
			<button type="button" id="transfer_to_society" class="btn btn-odark w-50 ms-2 ci-option">SOCIETY</button>
		`);
		$('#transfer_vehicle_options').addClass('mt-3');
		$('#transferVehicle_player_id').prop('type', 'number');
		$('#transferVehicle_player_id').prop('readonly', false);
		$("#transferVehicle_player_id").val("");
		document.getElementById('transfer_vehicle').disabled = true;
	} else {
		$('#transfer_vehicle_options').html(``);
		$('#transfer_vehicle_options').removeClass('mt-3');
	}

});

$(document).on('click', "#transfer_to_player", function() {
	$('#transfer_vehicle_options').html(`
		<button type="button" id="transfer_to_player" class="btn btn-blue w-50 me-2 ci-option">PLAYER</button>
		<button type="button" id="transfer_to_society" class="btn btn-odark w-50 ms-2 ci-option">SOCIETY</button>
	`);
	$('#transferVehicle_player_id').prop('type', 'number');
	$('#transferVehicle_player_id').prop('readonly', false);
	$("#transferVehicle_player_id").val("");
	document.getElementById('transfer_vehicle').disabled = true;
});

$(document).on('click', "#transfer_to_society", function() {
	$('#transfer_vehicle_options').html(`
		<button type="button" id="transfer_to_player" class="btn btn-odark w-50 me-2 ci-option">PLAYER</button>
		<button type="button" id="transfer_to_society" class="btn btn-blue w-50 ms-2 ci-option">SOCIETY</button>
	`);
	$('#transferVehicle_player_id').prop('type', 'text');
	$("#transferVehicle_player_id").val(playerJob);
	$('#transferVehicle_player_id').prop('readonly', true);
	document.getElementById('transfer_vehicle').disabled = false;
});

$(document).on('click', "#closeTransferKeysMenu", function() {
	closeMenu()
});

$(document).on('click', "#closeLiveriesExtrasMenu", function() {
	if (selectedWindow == "liveries_list" || selectedWindow == "extras_list") {
		openLiveriesMenu()
	} else {
		closeMenu()
	}
});

$(document).on('click', "#transferKeys", function() {
	$('#transfer_keys_model').text(vehicle[0].vehiclename + " (" + vehicle[0].plate + ")");

});


$(document).on('click', "#transfer_keys", function() {
	var pID = document.getElementById("transferKeys_player_id").value
	var plate = vehicle[0].plate
	var vehName = vehicle[0].vehiclename
	$.post('https://okokGarage/action', JSON.stringify({
		action: "transferKeys",
		pID: pID,
		plate: plate,
		vehName: vehName,

	}));
	closeMenu()
	vehicle = []
});

$(document).on('click', "#giveKeys", function() {
	var pID = closestPlayer
	var plate = $(this).data("vehicle_plate");
	var vehName = $(this).data("vehicle_name")
	$.post('https://okokGarage/action', JSON.stringify({
		action: "giveKeys",
		pID: pID,
		plate: plate,
		vehName: vehName

	}));
	closeMenu()
});

var tr_pID = ""
var tr_transferToSociety = ""
var tr_plate = ""

$(document).on('click', "#transfer_vehicle", function() {
	$('.modal').modal('hide');
	$("#tranferVehicleModal").modal('show');
	tr_pID = document.getElementById("transferVehicle_player_id").value
	tr_plate = vehicle[0].plate
	tr_transferToSociety = false;
	if (canTransferToSociety) {
		tr_transferToSociety = document.getElementById('transfer_to_society').classList.contains('btn-blue');
	}

});

$(document).on('click', "#transfer_vehicle_confirm", function() {
	$.post('https://okokGarage/action', JSON.stringify({
		action: "transferVehicle",
		pID: tr_pID,
		plate: tr_plate,
		transferToSociety: tr_transferToSociety
	}));
	vehicleSelected = false;
	$("#overview_page").click();
	vehicle = [];
});

$(document).on('click', "#viewVehicleOrGarage", function() {
	var sharedType = $(this).data("sharedtype");
	var sharedOwner = $(this).data("sharedowner");
	if (sharedType == "Garage") {
		$.post('https://okokGarage/action', JSON.stringify({
			action: "getVehiclesInSharedGarage",
			sharedOwner: sharedOwner,
		}));
	} else {
		var sharedPlate = $(this).data("sharedplate");
		var vehicleModel = $(this).data("vehiclemodel");
		var vehicleURL = $(this).data("vehicleurl");

		$.post('https://okokGarage/action', JSON.stringify({
			action: "selectVehicle",
			vehicle_plate: sharedPlate,
			veh_model: vehicleModel,
			index: garageIndex,
			veh_url: vehicleURL,
		}));
	}



});

$(document).on('click', "#cancelShare", function() {
	var sharedType = $(this).data("sharedtype");
	var sharingWithID = $(this).data("sharingwithid");
	if (sharedType == "Garage") {
		$.post('https://okokGarage/action', JSON.stringify({
			action: "cancelGarageShare",
			sharedOwner: sharingWithID,
		}));
	} else {
		var sharedPlate = $(this).data("sharedplate");
		$.post('https://okokGarage/action', JSON.stringify({
			action: "cancelVehicleShare",
			vehicle_plate: sharedPlate,
			sharedOwner: sharingWithID,
		}));

	}
});


$(document).on('click', "#shared2", function() {
	$('#mySharesTable').html(`
		<div class="row h-100">
			<div class="d-flex justify-content-center flex-column align-items-center">
				<span class="load"></span>
				<br>
				<div class="loadingtxt">Loading Data...</div>
			</div>
		</div>
	`);
	$('#mySharesTable').addClass('h-3275');
	$("#shared2").addClass("btn-blue").removeClass("btn-odark2");
	$("#shared").addClass("btn-odark2").removeClass("btn-blue");
	$.post('https://okokGarage/action', JSON.stringify({
		action: "getSharedWithVehicles",

	}));
});



$(document).on('click', "#overview_page", function() {
	if (selectedWindow != "overview") {
		var sideBar = `
			<p class="sidebar-item mt-2 selected" id="overview_page"><i class="bi bi-grid-1x2-fill"></i> <span class="ms-1">Overview</span></p>
			<p class="sidebar-item" id="vehicles_page"><i class="fa-solid fa-warehouse"></i> <span class="ms-1">Vehicles</span></p>
			<p class="sidebar-item" id="share_page"><i class="fa-solid fa-users"></i> <span class="ms-1">Share</span></p>
		`;
		if (noSharedTab) {
			sideBar = `
				<p class="sidebar-item mt-2 selected" id="overview_page"><i class="bi bi-grid-1x2-fill"></i> <span class="ms-1">Overview</span></p>
				<p class="sidebar-item" id="vehicles_page"><i class="fa-solid fa-warehouse"></i> <span class="ms-1">Vehicles</span></p>
			`;
		}
		$('#sidebar').html(sideBar);

		$('#page_info').html(`
			<div class="row h-100">
				<div class="d-flex justify-content-center flex-column align-items-center">
					<span class="load"></span>
					<br>
					<div class="loadingtxt">Loading Data...</div>
				</div>
			</div>
		`);
		$.post('https://okokGarage/action', JSON.stringify({
			action: "updateFavourites",

		}));
	}
});

$(document).on('click', "#vehicles_page", function() {
	if (selectedWindow != "vehicles") {
		selectedWindow = "vehicles";
		sharedVehiclesBeingShown = false
		var sideBar = `
			<p class="sidebar-item mt-2" id="overview_page"><i class="bi bi-grid-1x2-fill"></i> <span class="ms-1">Overview</span></p>
			<p class="sidebar-item selected" id="vehicles_page"><i class="fa-solid fa-warehouse"></i> <span class="ms-1">Vehicles</span></p>
			<p class="sidebar-item" id="share_page"><i class="fa-solid fa-users"></i> <span class="ms-1">Share</span></p>
		`;
		if (noSharedTab) {
			sideBar = `
				<p class="sidebar-item mt-2" id="overview_page"><i class="bi bi-grid-1x2-fill"></i> <span class="ms-1">Overview</span></p>
				<p class="sidebar-item selected" id="vehicles_page"><i class="fa-solid fa-warehouse"></i> <span class="ms-1">Vehicles</span></p>
			`;
		}
		$('#sidebar').html(sideBar);

		$('.selected-page').html(`Vehicles`);

		$('#page_info').html(`
			<div class="row h-100">
				<div class="d-flex justify-content-center flex-column align-items-center">
					<span class="load"></span>
					<br>
					<div class="loadingtxt">Loading Data...</div>
				</div>
			</div>
		`);

		$.post('https://okokGarage/action', JSON.stringify({
			action: "updateVehicles",

		}));
	}
});

$(document).on('click', "#withdraw", function() {
	if (document.getElementById("withdraw_money").value > 0) {
		$.post('https://okokGarage/action', JSON.stringify({
			action: "withdrawMoney",
			companyName: companyInfo[0].company_name,
			amount: document.getElementById("withdraw_money").value

		}));
	}
});

$(document).on('click', "#deposit", function() {
	if (document.getElementById("deposit_money").value > 0) {
		$.post('https://okokGarage/action', JSON.stringify({
			action: "depositMoney",
			companyName: companyInfo[0].company_name,
			amount: document.getElementById("deposit_money").value

		}));
	}

});

$(document).on('click', "#share_page", function() {
	if(selectedWindow != "share"){
		$('#page_info').html(`
			<div class="row h-100">
				<div class="d-flex justify-content-center flex-column align-items-center">
					<span class="load"></span>
					<br>
					<div class="loadingtxt">Loading Data...</div>
				</div>
			</div>
		`);
		$('.selected-page').html(`Share`);
		openShare();
	}
});

$(document).on('click', "#shareButton", function() {
	var dropdownVal = document.getElementById("share_dropdown").value;
	var playerID = document.getElementById("share_player_id").value;

	if (selectedShare == "garage") {
		if (playerID > 0) {
			$.post('https://okokGarage/action', JSON.stringify({
				action: "shareProduct",
				shareType: selectedShare,
				sharedProduct: dropdownVal,
				targetID: playerID,
			}));
		}
	} else if (selectedShare == "vehicle") {
		if (dropdownVal != "select" && dropdownVal != "" && playerID > 0) {
			$.post('https://okokGarage/action', JSON.stringify({
				action: "shareProduct",
				shareType: selectedShare,
				sharedProduct: dropdownVal,
				targetID: playerID,
			}));
		}
	}
});

$(document).on('click', "#shareModalID", function() {
	selectedShare = "vehicle"
	$("#share_dropdown").show();
	$("#sharegarage").addClass("btn-odark").removeClass("btn-blue");
	$("#sharevehicle").addClass("btn-blue").removeClass("btn-odark");
	var dropdown = document.getElementById("share_dropdown");

	$("#share_dropdown").empty();
	var c = document.createElement("option");
	c.text = "Select a vehicle";
	c.value = "select"
	dropdown.options.add(c, 1);
	for (var i = 0; i < vehicles.length; i++) {
		var c = document.createElement("option");
		c.text = vehicles[i].vehiclename + "(" + vehicles[i].plate + ")";
		c.value = vehicles[i].plate
		dropdown.options.add(c, 1);
	}
});


$(document).on('click', "#sharegarage", function() {
	selectedShare = "garage"
	$("#share_dropdown").hide();
	$("#sharegarage").addClass("btn-blue").removeClass("btn-odark");
	$("#sharevehicle").addClass("btn-odark").removeClass("btn-blue");
	var dropdown = document.getElementById("share_dropdown");

	$("#share_dropdown").empty();
});

$(document).on('click', "#sharevehicle", function() {
	selectedShare = "vehicle"
	$("#share_dropdown").show();
	$("#sharegarage").addClass("btn-odark").removeClass("btn-blue");
	$("#sharevehicle").addClass("btn-blue").removeClass("btn-odark");
	var dropdown = document.getElementById("share_dropdown");

	$("#share_dropdown").empty();
	var c = document.createElement("option");
	c.text = "Select a vehicle";
	c.value = "select"
	dropdown.options.add(c, 1);
	for (var i = 0; i < vehicles.length; i++) {
		var c = document.createElement("option");
		c.text = vehicles[i].vehiclename + "(" + vehicles[i].plate + ")";
		c.value = vehicles[i].plate
		dropdown.options.add(c, 1);

	}

});


$(document).on('click', "#select_vehicle", function() {
	var vehicle_plate = $(this).data("vehicle_plate");
	var vehModel = $(this).data("vehicle_model");
	var vehicleURL = $(this).data("vehicleurl");
	$.post('https://okokGarage/action', JSON.stringify({
		action: "selectVehicle",
		vehicle_plate: vehicle_plate,
		veh_model: vehModel,
		index: garageIndex,
		veh_url: vehicleURL,
	}));
});


$(document).on('click', "#star", function() {
	if (!isSocietyGarage) {
		if (favAmount == undefined) {
			favAmount = 0
		}
		var isFavourite = $(this).data("is_favourite");
		var vehicle_plate = $(this).data("vehicle_plate");
		var vehModel = $(this).data("vehicle_model");
		var vehicleURL = $(this).data("vehicleurl");
		var success = false
		if (sharedVehiclesBeingShown != true) {
			if (isFavourite == "vehicles_favoritestar") {
				favAmount = favAmount - 1

				$(this).removeClass("vehicles_favoritestar");
				$(this).addClass("vehicles_notfavoritestar");
				$(this).data('is_favourite', "vehicles_notfavoritestar")
				success = true
			} else if (isFavourite == "vehicles_notfavoritestar") {
				if (favAmount < 3 || favAmount == undefined) {
					if (favAmount == undefined) {
						favAmount = 1
					} else {
						favAmount = favAmount + 1
					}
					$(this).removeClass("vehicles_notfavoritestar");
					$(this).addClass("vehicles_favoritestar");
					$(this).data('is_favourite', "vehicles_favoritestar")
					success = true
				} else {
					$.post('https://okokGarage/action', JSON.stringify({
						action: "full_favourite",
					}));
				}
			}
			if (success == true) {
				$.post('https://okokGarage/action', JSON.stringify({
					action: "favouriteVehicle",
					isFavourite: isFavourite,
					vehicle_plate: vehicle_plate,
					veh_model: vehModel,
					index: garageIndex,
					veh_url: vehicleURL,
				}));
			}
		}
	}


});


$(document).on('click', "#take_out", function() {
	var vehicleType = $(this).data("vehicle_type");
	if (vehicleType == garageType) {
		var vehicle_plate = $(this).data("vehicle_plate");
		var vehicle_id = $(this).data("vehicle_id");
		var vehicle_name = $(this).data("vehicle_name");
		
		$.post('https://okokGarage/action', JSON.stringify({
			action: "takeOut",
			vehicle_plate: vehicle_plate,
			vehicle_id: vehicle_id,
			vehicle_name: vehicle_name,
			index: garageIndex,
			isSocietyGarage: isSocietyGarage
		}));
	}
	closeMenu()
});

$(document).on('click', "#take_out2", function() {
	var vehicle_plate = $(this).data("vehicle_plate");
	var vehicle_id = $(this).data("vehicle_id");
	var vehicle_name = $(this).data("vehicle_name");
	
	$.post('https://okokGarage/action', JSON.stringify({
		action: "takeOut",
		vehicle_plate: vehicle_plate,
		vehicle_id: vehicle_id,
		vehicle_name: vehicle_name,
		index: garageIndex,
	}));
	closeMenu()
});

$(document).on('click', "#view_vehicle", function() {
	var vehicle_plate = $(this).data("vehicle_plate");
	var vehicle_id = $(this).data("vehicle_id");
	$.post('https://okokGarage/action', JSON.stringify({
		action: "view_vehicle",
		vehicle_plate: vehicle_plate,
		vehicle_id: vehicle_id,
		index: garageIndex,
	}));
});

$(document).on('click', "#closeImpoundMenu", function() {
	closeMenu()
});

$(document).on('click', ".hire-emp", function() {
	fetch(`https://okokGarage/action`, {
		method: 'POST',
		headers: {
			'Content-Type': 'application/json; charset=UTF-8',
		},
		body: JSON.stringify({
			action: "getClosePeople"
		})
	}).then(resp => resp.json()).then(resp => setClosePlayers(resp));
});

function setClosePlayers(resp) {
	closestPlayers = resp
	var dropdown = document.getElementById("hireEmployeeDropdown");
	$("#hireEmployeeDropdown").empty();
	var c = document.createElement("option");
	c.text = "Select a person";
	c.value = "select"
	dropdown.options.add(c, 1);
	for (var i = 0; i < closestPlayers.length; i++) {
		var c = document.createElement("option");
		c.text = closestPlayers[i].playerName + " (" + closestPlayers[i].targetSrc + ")";
		dropdown.options.add(c, 1);

	}
}

$(document).on('click', "#edit_employee", function() {
	if (selectedPlayerIdentifier != "") {
		var rank = document.getElementById("rank_dropdown").value
		$.post('https://okokGarage/action', JSON.stringify({
			action: "editEmployee",
			identifier: selectedPlayerIdentifier,
			rank: rank,
			companyName: companyInfo[0].company_name,
		}));
		closeMenu()
	}

});

$(document).on('click', "#editEmployee", function() {

	selectedPlayer = $(this).data("employee_name");
	selectedPlayerIdentifier = $(this).data("employee_identifier");
	document.getElementById("employee_name").value = selectedPlayer
	if ($(this).data("employee_name") != player_name) {
		document.getElementById("employee_total-earned").value = $(this).data("employee_earned");
		$("#rank_dropdown").empty();
		var dropdown = document.getElementById("rank_dropdown");
		for (var k in jobRanks) {
			var c = document.createElement("option");
			c.text = k
			c.value = k
			dropdown.options.add(c, 1);
			if (k == $(this).data("employee_rank")) {
				document.getElementById("rank_dropdown").value = k
			}
		}

	}
});

$(document).on('click', "#fire_employee_btn", function() {

	if (selectedPlayer != "") {
		$('#fireText').text("Do you want to fire " + selectedPlayer + "?");
	}
});

$(document).on('click', "#fire_employee", function() {
	if (selectedPlayer != "") {

		$.post('https://okokGarage/action', JSON.stringify({
			action: "fireEmployee",
			identifier: selectedPlayerIdentifier,
			companyName: companyInfo[0].company_name,
		}));
	}
	closeMenu()
});








$(document).on('click', "#EditGarage", function() {
	var garageName = $(this).data("garage_name");
	var garagePrice = $(this).data("garage_price");
	var garageType = $(this).data("garage_type");
	var unitsLeft = $(this).data("units_remaining");
	var arrayNumber = $(this).data("garage_coords");
	selectedGarageCoords = [garages[arrayNumber].garageCoords.x, garages[arrayNumber].garageCoords.y, garages[arrayNumber].garageCoords.z]

	document.getElementById("editgarage_name").value = garageName
	document.getElementById("editGarageType").value = garageType
	document.getElementById("editgarage_price").value = garagePrice
	document.getElementById("garage_units").value = unitsLeft
});
$(document).on('click', "#edit_garage", function() {
	garageName = document.getElementById("editgarage_name").value
	garageType = document.getElementById("editGarageType").value
	garagePrice = document.getElementById("editgarage_price").value
	garageUnits = document.getElementById("garage_units").value
	$.post('https://okokGarage/action', JSON.stringify({
		action: "editGarage",
		selectedGarageCoords: selectedGarageCoords,
		garageName: garageName,
		garageType: garageType,
		garagePrice: garagePrice,
		garageUnits: garageUnits

	}));
	closeMenu()
});




$(document).on('click', "#closeImpound2Menu", function() {
	closeMenu()
});

$(document).on('click', "#closeBuyBusinessModal", function() {
	closeMenu()
});

$(document).on('click', "#sellbusiness_button_modal", function() {
	closeMenu()
	$.post('https://okokGarage/action', JSON.stringify({
		action: "sellBusiness",
		company: currentCompany
	}));
});

$(document).on('click', "#sell_garage", function() {
	closeMenu()
	$.post('https://okokGarage/action', JSON.stringify({
		action: "sendSellRequest",
		garageInfo: garageInfo,
		otherDetails: otherDetails,
	}));
});


$(document).on('click', "#admingarages_page", function() {
	if(selectedWindow != "adminGarageMenu"){
		$('#sidebar-admin').html(`
			<p class="sidebar-item mt-2" id="adminbusinesses_page"><i class="fa-solid fa-building"></i> <span class="ms-1">Businesses</span></p>
			<p class="sidebar-item selected" id="admingarages_page"><i class="fa-solid fa-warehouse"></i> <span class="ms-1">Garages</span></p>
		`);
		$('#page_garagesInfo').html(`
			<div class="row h-100">
				<div class="d-flex justify-content-center flex-column align-items-center">
					<span class="load"></span>
					<br>
					<div class="loadingtxt">Loading Data...</div>
				</div>
			</div>
		`);
		adminGaragesMenu()
		
	}
});

$(document).on('click', "#adminbusinesses_page", function() {
	if(selectedWindow != "adminBusinessMenu"){
		$('#sidebar-admin').html(`
			<p class="sidebar-item mt-2 selected" id="adminbusinesses_page"><i class="fa-solid fa-building"></i> <span class="ms-1">Businesses</span></p>
			<p class="sidebar-item" id="admingarages_page"><i class="fa-solid fa-warehouse"></i> <span class="ms-1">Garages</span></p>
		`);
		$('#page_garagesInfo').html(`
			<div class="row h-100">
				<div class="d-flex justify-content-center flex-column align-items-center">
					<span class="load"></span>
					<br>
					<div class="loadingtxt">Loading Data...</div>
				</div>
			</div>
		`);
		adminBusinessMenu()
		
	}
});


$(document).on('click', "#purchaseGarage", function() {
	closeMenu()
	$.post('https://okokGarage/action', JSON.stringify({
		action: "sendbuyRequest",
		garageInfo: garageInfo,
		otherDetails: otherDetails,
	}));
});
$(document).on('click', "#impound", function() {
	var location = []
	var time = document.getElementById("impoundtime_dropdown").value
	var reason = document.getElementById("impound_reason").value
	
	if(time != "select" && time != "select2"){
		if(isImpoundGlobal){
			location = impoundLocations[0].name
		} else {
			location = document.getElementById("impoundlocation_dropdown").value
		}

		closeMenu()
		$.post('https://okokGarage/action', JSON.stringify({
			action: "impoundVehicle",
			location: location,
			time: time,
			reason: reason

		}));
	}
});


$(document).on('click', "#EditBusiness", function() {
	var companyid = $(this).data("company_id");
	var ownerName = $(this).data("owner_name");
	var money = $(this).data("money");
	var identifier = $(this).data("owner_identifier");
	document.getElementById("business_name").value = companyid
	document.getElementById("business_money").value = money
	document.getElementById("business_owner-identifier").value = identifier
	document.getElementById("business_owner-name").value = ownerName
});

$(document).on('click', "#edit_business", function() {

	var businessName = document.getElementById("business_name").value
	var businessMoney = document.getElementById("business_money").value
	var ownerid = document.getElementById("business_owner-identifier").value
	var ownerName = document.getElementById("business_owner-name").value
	closeMenu()
	$.post('https://okokGarage/action', JSON.stringify({
		action: "editBusiness",
		businessMoney: businessMoney,
		businessName: businessName,
		ownerID: ownerid,
		ownerName: ownerName
	}));
});



$(document).on('click', "#hire_employee", function() {
	var hiredPerson = document.getElementById('hireEmployeeDropdown').value
	closeMenu()
	$.post('https://okokGarage/action', JSON.stringify({
		action: "hireEmployee",
		hiredPerson: hiredPerson,
		companyName: companyInfo[0].company_name,
	}));
});

$(document).on('click', "#garage_create", function() {
	var garageName = document.getElementById("garage_name").value
	var garageType = document.getElementById("garage_typedropdown").value
	var garagePrice = document.getElementById("garage_price").value
	var maxOwners = document.getElementById("garage_maxowners").value
	closeMenu()
	$.post('https://okokGarage/action', JSON.stringify({
		action: "createGarage",
		garageName: garageName,
		garageType: garageType,
		garagePrice: garagePrice,
		maxOwners: maxOwners
	}));
});

$(document).on('click', "#buy_business", function() {
	closeMenu()
	$.post('https://okokGarage/action', JSON.stringify({
		action: "buyCompany",
		price: price,
		name: companyName
	}));
});

$(document).on('click', "#leavebusiness_button_modal", function() {
	closeMenu()
	$.post('https://okokGarage/action', JSON.stringify({
		action: "leaveBusiness",
		company: currentCompany,
	}));
});

$(document).on('click', "#closeLeaveModal", function() {
	closeMenu()
});

$(document).on('click', "#cancel_leavebusiness", function() {
	closeMenu()
});

$(document).on('click', "#Choose", function() {
	document.getElementById('vehicles_page').click();
});
$(document).on('click', "#log_out", function() {
	closeMenu()
});

$(document).on('click', "#closeConfirmPMenu", function() {
	closeMenu()
});

$(document).on('click', "#closeConfirmSMenu", function() {
	closeMenu()
});

$(document).on('click', "#retrieve_impound", function() {
	var price = $(this).data("price");
	var vehicle_plate = $(this).data("vehicle_plate");
	var vehicle_name = $(this).data("vehicle_name");
	veh_name = vehicle_name
	veh_plate = vehicle_plate
	$('#pay_modal_message').html(`Do you want to retrieve your vehicle for ${price}€?`)
});

$(document).on('click', "#pay_button_modal", function() {
	closeMenu()
	if (atImpound == true) {
		atImpound = false
		$.post('https://okokGarage/action', JSON.stringify({
			action: "retrieveVehicle",
			vehicle_plate: veh_plate,
			vehicle_name: veh_name,
			index: impoundIndex
		}));

	} else {
		$.post('https://okokGarage/action', JSON.stringify({
			action: "recoverVehicle",
			vehicle_plate: veh_plate,
			index: recoverPost,
			vehicle_name: veh_name
		}));
	}
});

$(document).on('click', "#recover_button", function() {
	var price = $(this).data("price");
	var vehicle_plate = $(this).data("vehicle_plate");
	var vehicle_name = $(this).data("vehicle_name");
	veh_name = vehicle_name
	veh_plate = vehicle_plate
	$('#pay_modal_message').html(`Do you want to retrieve your vehicle for ${price}€?`)
});



$(document).on('click', "#closeCreateGarageMenu", function() {
	closeMenu()
});

$(document).on('click', "#employees_page", function() {
	$('#page_info2').html(`
		<div class="row h-100">
			<div class="d-flex justify-content-center flex-column align-items-center">
				<span class="load"></span>
				<br>
				<div class="loadingtxt">Loading Data...</div>
			</div>
		</div>
	`);
	openEmployees()
});

$(document).on('click', "#saleshistory_page", function() {
	$('#page_info2').html(`
		<div class="row h-100">
			<div class="d-flex justify-content-center flex-column align-items-center">
				<span class="load"></span>
				<br>
				<div class="loadingtxt">Loading Data...</div>
			</div>
		</div>
	`);
	openSalesHistory()
});

$(document).on('click', "#buy_business", function() {
	closeMenu()
});

$(document).on('click', "#closeRecoverVehicleMenu", function() {
	closeMenu()
});

$(document).on('click', "#overviewc_page", function() {
	$('#page_info2').html(`
		<div class="row h-100">
			<div class="d-flex justify-content-center flex-column align-items-center">
				<span class="load"></span>
				<br>
				<div class="loadingtxt">Loading Data...</div>
			</div>
		</div>
	`);
	openCompanyMenu()

	selectedWindow = "businessOverview"
});

$('#transferKeysModal').on('hidden.bs.modal', function() {
	$("#transferKeys_player_id").val("");
})

$('#transferVehicleModal').on('hidden.bs.modal', function() {
	$("#transferVehicle_player_id").val("");
})

$('#shareModal').on('hidden.bs.modal', function() {
	$("#share_player_id").val("");
})

$('#depositModal').on('hidden.bs.modal', function() {
	$("#deposit_money").val("");
})

$('#withdrawModal').on('hidden.bs.modal', function() {
	$("#withdraw_money").val("");
})

function closeMenu() {
	var time = 0
	abortTimer();
	if (selectedWindow != "" && selectedWindow != "leaveBusiness" && selectedWindow != "view_vehicle" && selectedWindow != "keysMenu" && selectedWindow != "purchaseCompany" && selectedWindow != "playerImpound" && selectedWindow != "sellGarage" && selectedWindow != "buyGarage" && selectedWindow != "createGarage" && selectedWindow != "recover_vehicle" && selectedWindow != "policeImpound" && selectedWindow != "liveries") {
		$('.loading_menu').fadeIn();
		$('.loadingtxt').html(`Logging Out...`);
		time = 300
	}

	setTimeout(function() {
		if (selectedWindow == "loading") {
			$(".loading_menu").fadeOut();
		} else if (selectedWindow == "overview") {
			$(".garage_menu").fadeOut();
		} else if (selectedWindow == "vehicles") {
			$(".garage_menu").fadeOut();
		} else if (selectedWindow == "share") {
			$(".garage_menu").fadeOut();
		} else if (selectedWindow == "policeImpound") {
			$(".impound_menu").fadeOut();
			$('#impoundtime_dropdown').html(`<option value="select">Set the time</option>`);
			if(!isImpoundGlobal){
				$('#impoundlocation_dropdown').html(`<option value="select">Select an Impound</option>`);
			}
			
			document.getElementById("impound_reason").value = ""
			document.getElementById('impound').disabled = true;
		} else if (selectedWindow == "playerImpound") {
			$(".impound2_menu").fadeOut();
			let popovers = document.querySelectorAll('.popover')
			for (let i = 0; i < popovers.length; i++) {
				bootstrap.Popover.getInstance(popovers[i]).hide()
			}
		} else if (selectedWindow == "createGarage") {
			$(".creategarage_menu").fadeOut();
			document.getElementById("garage_name").value = ""
			document.getElementById("garage_typedropdown").value = "select"
			document.getElementById("garage_price").value = ""
			document.getElementById("garage_maxowners").placeholder = ""
			document.getElementById('garage_create').disabled = true;
		} else if (selectedWindow == "adminBusinessMenu") {
			$(".adminBusinessPage").fadeOut();
			$(".adminGarageEdit").fadeOut();
		} else if (selectedWindow == "businessOverview") {
			$('.company_menu').fadeOut();
		} else if (selectedWindow == "employeeOverview") {
			$('.company_menu').fadeOut()
		} else if (selectedWindow == "saleshistory") {
			$('.company_menu').fadeOut()
		} else if (selectedWindow == "sellGarage") {
			$(".confirms_menu").fadeOut();
		} else if (selectedWindow == "buyGarage") {
			$(".confirmp_menu").fadeOut();
		} else if (selectedWindow == "adminGarageMenu") {
			$(".adminBusinessPage").fadeOut();
			$(".adminGarageEdit").fadeOut();
		} else if (selectedWindow == "keysMenu") {
			$(".transferkeys_menu").fadeOut();
		} else if (selectedWindow == "recover_vehicle") {
			$(".recovervehicle_menu").fadeOut();
		} else if (selectedWindow == "liveries") {
			$('.liveriesextras_menu').fadeOut();
		} else if (selectedWindow == "view_vehicle") {
			$('.view_menu').fadeOut();
		}

		selectedWindow = ""

		$('.modal').modal('hide');

		setTimeout(function() {
			$('.loading_menu').fadeOut();
			$.post('https://okokGarage/action', JSON.stringify({
				action: "close",
			}));
			setTimeout(function() {
				$('.loadingtxt').html(`Loading Data...`);
			}, 700);
		}, 300);
	}, time);
}

$(document).ready(function() {
	document.onkeyup = function(data) {
		if (data.which == 27) {
			if (selectedWindow == "liveries_list" || selectedWindow == "extras_list") {
				openLiveriesMenu();
			} else {
				closeMenu();
				if(selectedWindow == "view_vehicle") {
					$.post('https://okokGarage/action', JSON.stringify({
						action: "clearView",
						deleteCam: true
					}));
				}
			}
		}
	};

	const parent = document.querySelector('.garage_menu')

	parent.addEventListener('keydown', function(event) {
		if (event.key === 'Enter' && event.target.classList.contains('vehicles_vehicle_name')) {
			var name = event.target.value.trim();
			var oldName = event.target.getAttribute("data-name").trim();
			var plate = event.target.getAttribute("data-vehicle_plate");
			if (name != oldName) {
				event.target.setAttribute("data-name", name);
				$.post('https://okokGarage/action', JSON.stringify({
					action: "changeVehicleName",
					name: name,
					plate: plate
				}));
			}
		}
	})

	parent.addEventListener('focusout', function(event) {
		if (event.target.classList.contains('vehicles_vehicle_name')) {
			var name = event.target.value.trim();
			var oldName = event.target.getAttribute("data-name").trim();
			var plate = event.target.getAttribute("data-vehicle_plate");
			if (name != oldName) {
				event.target.setAttribute("data-name", name);
				$.post('https://okokGarage/action', JSON.stringify({
					action: "changeVehicleName",
					name: name,
					plate: plate
				}));
			}
		}
	})
});