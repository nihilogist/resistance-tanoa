// Variables containing the locations on the map, and their markers.


// Resistance base format [baseName, baseMarkerName]
bases = [
	["First Camp", "locationFirstBase"]
];


// Town format: [townName, townMarkerName, townPopulation]

towns = [
	["Balavu", "location_balavu_town", 50]
];

// Region format: [regionName, [towns], [prisonCampMarkers]]

regions = [
	["Balavu Region", [towns select 0], ["locationBalavuPrisonCamp01"]]
];