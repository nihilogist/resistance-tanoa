// Variables containing the locations on the map, and their markers.


// Resistance base format [baseName, baseMarkerName]
bases = [
	["First Camp", "locationFirstBase"]
];


// Town format: [townName, gendarme groups present, [gendarmes patrol areas]]
tavu = ["Tavu", // town name
	2, // gendarmes groups present
	["gendarmeTavuPatrol01", "gendarmeTavuPatrol02", "gendarmeTavuPatrol03", "gendarmeTavuPatrol04"] // gendarme patrol areas
];

// Region format: [regionName, militarisation level, [prisonCampMarkers], Gendarme HQ Marker, [towns]]

regions = [
	[
		"Balavu Region", // Name
		0, // Militarisation
		["locationBalavuPrisonCamp01", "locationBalavuPrisonCamp02", "locationBalavuPrisonCamp03"], // Prison camp locations
		"locationBalavuGendarmeHQ", // Gendarme HQ Locations
		[tavu] // towns
	]
];