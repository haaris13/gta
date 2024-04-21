Locales['de'] = {

	-- Notifications

	['open_garage'] = {
		text = 'Drücke [E] um die Garage zu öffnen',
		color = 'darkgrey',
		side = 'left'
	},
	['garage_info'] = {
		text = '<div>Name: ${name}</div><div>Price: ${price}€</div><div>Type: ${type}</div>',
		color = 'darkgrey',
		side = 'left'
	},
	['open_impound'] = {
		text = 'Drücke [E] um den Abschlepphof zu öffnen',
		color = 'darkgrey',
		side = 'left'
	},
	['open_recover'] = {
		text = 'Drücke [E] um dein Fahrzeug abzuholen',
		color = 'darkgrey',
		side = 'left'
	},
	['store_vehicle'] = {
		text = 'Drücke [E] um Einzuparken',
		color = 'darkgrey',
		side = 'left'
	},
	['purchase_company'] = {
		text = 'Drücke [E] um das Unternehmen zu kaufen',
		color = 'darkgrey',
		side = 'left'
	},
	['access_company'] = {
		text = 'Drücke [E] um Zugriff auf das Unternehmen zu haben',
		color = 'darkgrey',
		side = 'left'
	},
	['request_sent'] = {
		title = 'Business',
		text = 'Sie haben eine Anfrage zum Verkauf der Garage versendet',
		time = 5000,
		type = 'success'
	},
	['max_owners_hit'] = {
		title = 'Business',
		text = 'Diese Garage hat zu viele Besitzer',
		time = 5000,
		type = 'error'
	},
	['garage_exists'] = {
		title = 'Business',
		text = 'Eine Garage mit diesem Namen existiert bereits',
		time = 5000,
		type = 'error'
	},
	['garage_created'] = {
		title = 'Business',
		text = 'Sie haben eine Garage erstellt',
		time = 5000,
		type = 'success'
	},
	['garage_purchased'] = {
		title = 'Business',
		text = 'Sie haben die Garage gekauft',
		time = 5000,
		type = 'success'
	},
	['garage_already_owned'] = {
		title = 'Business',
		text = 'Diese Garage gehört bereits dir',
		time = 5000,
		type = 'error'
	},
	['inside_vehicle'] = {
		title = 'Garage',
		text = 'Du kannst nicht vom Auto auf die Garage zugreifen',
		time = 5000,
		type = 'error'
	},
	['vehicle_not_at_garage'] = {
		title = 'Vehicle',
		text = "Das Fahrzeug ist nicht in dieser Garage",
		time = 5000,
		type = 'error'
	},
	['vehicle_isnt_stored'] = {
		title = 'Garage',
		text = 'Das Fahrzeug ist nicht eingeparkt',
		time = 5000,
		type = 'info'
	},
	['vehicle_is_impounded'] = {
		title = 'Garage',
		text = 'Das Fahrzeug ist im Abschlepphof',
		time = 5000,
		type = 'info'
	},
	['vehicle_is_stolen'] = {
		title = 'Garage',
		text = 'Das Fahrzeug ist gestohlen',
		time = 5000,
		type = 'info'
	},
	['vehicle_stored'] = {
		title = 'Garage',
		text = 'Das Fahrzeug wurde eingeparkt',
		time = 5000,
		type = 'success'
	},
	['vehicle_repaired'] = {
		title = 'Garage',
		text = 'Das Fahrzeug wurde repariert',
		time = 5000,
		type = 'success'
	},
	['not_the_owner'] = {
		title = 'Garage',
		text = 'Das Fahrzeug gehört dir nicht',
		time = 5000,
		type = 'error'
	},
	['vehicle_locked'] = {
		title = 'Fahrzeug',
		text = 'Abgeschlossen',
		time = 5000,
		type = 'error'
	},
	['vehicle_unlocked'] = {
		title = 'Fahrzeug',
		text = 'Aufgeschlossen',
		time = 5000,
		type = 'success'
	},
	['vehicle_not_found'] = {
		title = 'Fahrzeug',
		text = "Nicht gefunden",
		time = 5000,
		type = 'error'
	},
	['vehicle_impounded_police'] = {
		title = 'Abschleppdienst',
		text = "Das Fahrzeug wurde abgeschleppt",
		time = 5000,
		type = 'success'
	},
	['vehicle_spawn_full'] = {
		title = 'Fahrzeug',
		text = "Kein Parkplatz frei.",
		time = 5000,
		type = 'error'
	},
	['vehicle_recovered'] = {
		title = 'Fahrzeug',
		text = "Ihr Fahrzeug wurde geborgen",
		time = 5000,
		type = 'success'
	},
	['vehicle_impounded_player'] = {
		title = 'Abschleppdienst',
		text = "Dein Fahrzeug wurde abgeschleppt",
		time = 5000,
		type = 'error'
	},
	['vehicle_retrieved'] = {
		title = 'Fahrzeug',
		text = "Dein Fahrzeug wurde sicher eingeparkt",
		time = 5000,
		type = 'success'
	},
	['vehicle_fail_retrieved'] = {
		title = 'Fahrzeug',
		text = "Das Fahrzeug wurde nicht eingeparkt",
		time = 5000,
		type = 'error'
	},
	['no_vehicle_retrieved'] = {
		title = 'Fahrzeug',
		text = "Keine Fahrzeuge zum Einparken",
		time = 5000,
		type = 'error'
	},
	['no_keys'] = {
		title = 'Fahrzeugschlüssel',
		text = "Du hast keine Fahrzeugschlüssel",
		time = 5000,
		type = 'error'
	},
	['given_keys'] = {
		title = 'Fahrzeugschlüssel',
		text = "Fahrzeugschlüssel übergeben",
		time = 5000,
		type = 'success'
	},
	['received_keys'] = {
		title = 'Fahrzeugschlüssel',
		text = "Fahrzeugschlüssel erhalten",
		time = 5000,
		type = 'success'
	},
	['deleted_vehicle'] = {
		title = "Admin",
		text = "Fahrzeug erfolgreich entfernt",
		time = 5000,
		type = 'success'
	},
	['given_vehicle'] = {
		title = "Admin",
		text = "Fahrzeug erfolgreich übergeben",
		time = 5000,
		type = 'success'
	},
	['player_not_found'] = {
		title = 'Admin',
		text = "Spieler wurde nicht gefunden",
		time = 5000,
		type = 'error'
	},
	['player_not_found_keys'] = {
		title = 'Fahrzeugschlüssel',
		text = "Spieler wurde nicht gefunden",
		time = 5000,
		type = 'error'
	},
	['invalid_plate'] = {
		title = 'Admin',
		text = "The license plate should be 6 or 7 characters",
		time = 5000,
		type = 'error'
	},
	['not_enough_money'] = {
		title = 'Business',
		text = "Du hast nicht genug Geld",
		time = 5000,
		type = 'error'
	},
	['dont_own_business'] = {
		title = 'Business',
		text = "Dieses Business gehört nicht dir.",
		time = 5000,
		type = 'error'
	},
	['business_purchased'] = {
		title = 'Business',
		text = "Sie haben ein Unternehmen gekauft",
		time = 5000,
		type = 'success'
	},
	['insufficient_permissions'] = {
		title = 'Business',
		text = "Sie sind nicht berechtigt, diesen Spieler zu feuern",
		time = 5000,
		type = 'error'
	},
	['player_fired'] = {
		title = 'Business',
		text = "Sie haben einen Spieler gefeuert",
		time = 5000,
		type = 'success'
	},
	['you_were_fired'] = {
		title = 'Business',
		text = "Sie wurden gefeuert",
		time = 5000,
		type = 'info'
	},
	['left_business'] = {
		title = 'Business',
		text = "Sie haben das Unternehmen verlassen",
		time = 5000,
		type = 'info'
	},
	['player_edited'] = {
		title = 'Business',
		text = "Sie haben die Berufsbezeichnung des Spielers geändert",
		time = 5000,
		type = 'success'
	},
	['too_many_employees'] = {
		title = 'Business',
		text = "Sie haben zu viele Mitarbeiter",
		time = 5000,
		type = 'error'
	},
	['too_many_garages'] = {
		title = 'Business',
		text = "Sie besitzen die maximale Anzahl an Garagen",
		time = 5000,
		type = 'error'
	},
	['withdrawn_money'] = {
		title = 'Business',
		text = "Sie haben Geld von Ihrem Unternehmen abgehoben",
		time = 5000,
		type = 'success'
	},
	['deposited_money'] = {
		title = 'Business',
		text = "Sie haben Geld in Ihr Unternehmen eingezahlt",
		time = 5000,
		type = 'success'
	},
	['not_enough_funds'] = {
		title = 'Business',
		text = "Ihr Unternehmen verfügt nicht über die erforderlichen Mittel zum Abheben",
		time = 5000,
		type = 'success'
	},
	['vehicle_shared'] = {
		title = 'Fahrzeug',
		text = "Das Fahrzeug wurde geteilt",
		time = 5000,
		type = 'success'
	},
	['garage_shared'] = {
		title = 'Fahrzeug',
		text = "Du hast deine Garage geteilt",
		time = 5000,
		type = 'success'
	},
	['not_garage_shared'] = {
		title = 'Fahrzeug',
		text = "Sie haben Ihre Garage bereits mit dieser Person geteilt",
		time = 5000,
		type = 'error'
	},
	['garage_shared_with'] = {
		title = 'Fahrzeug',
		text = "Jemand hat seine Garage mit dir geteilt",
		time = 5000,
		type = 'success'
	},
	['vehicle_shared_with'] = {
		title = 'Fahrzeug',
		text = "Jemand teilt das Fahrzeug mit dir",
		time = 5000,
		type = 'success'
	},
	['player_not_online'] = {
		title = 'Fahrzeug',
		text = "Dieser Spieler ist nicht da",
		time = 5000,
		type = 'error'
	},
	['garage_share_cancelled'] = {
		title = 'Fahrzeug',
		text = "Sie haben Ihren Garagenanteil zurückgezogen",
		time = 5000,
		type = 'success'
	},
	['vehicle_share_cancelled'] = {
		title = 'Fahrzeug',
		text = "Teilen des Fahrzeuges abgebrochen",
		time = 5000,
		type = 'success'
	},
	['vehicle_transferred'] = {
		title = 'Fahrzeug',
		text = "Ihnen wurde ein Fahrzeug übergeben",
		time = 5000,
		type = 'success'
	},
	['vehicle_transferred_to_other'] = {
		title = 'Fahrzeug',
		text = "Fahrzeug wurde übergeben",
		time = 5000,
		type = 'success'
	},
	['vehicle_name_changed'] = {
		title = 'Fahrzeug',
		text = "Fahrzeugname geändert",
		time = 5000,
		type = 'success'
	},
	['vehicles_stored'] = {
		title = 'Admin',
		text = "Alle Fahrzeuge wieder in der Garage",
		time = 5000,
		type = 'success'
	},
	['full_favourite'] = {
		title = 'Favoriten',
		text = "Favoriten Liste ist voll",
		time = 5000,
		type = 'error'
	},
	['ChatSuggestions'] = {
		giveVehiclesDescription = "Fahrzeug an Spieler geben",
		giveVehiclesPlayerID = "Spieler ID/Gesellschaft",
		giveVehiclesPlayerIDDesc = "Spieler/Gesellschaft, die das Fahrzeug erhalten",
		giveVehiclesVehicle = "Fahrzeug", 
		giveVehiclesVehicleDesc= "Fahrzeug Spawnname",
		
		removeVehiclesDescription = "Entfernt das Fahrzeug eines Spielers",
		removeVehiclesPlate ="Kennzeichen", 
		removeVehiclesPlateDesc ="Nummernschild des Fahrzeugs",
		
		RemoveAllImpoundedVehiclesDescription = "Entfernt alle Fahrzeuge aus der Abschlepphof",

		giveAdminKeysDescription = "Gibt jemandem einen Fahrzeugschlüssel",
		giveAdminKeysID = "Spieler ID",
		giveAdminKeysIDDesc = "Spieler, der den Schlüssel erhält",
		giveAdminKeysPlate = "Kennzeichen",
		giveAdminKeysPlateDesc = "Nummernschild des Fahrzeugs",
	},
	['OkOkBanking'] = { -- OkOkBanking transaction reasons
		purchaseGarage = "Garagen kauf",
		soldGarage = "Garagen verkauf",
		purchaseCompany = "Firmenumsatz"

	}
}