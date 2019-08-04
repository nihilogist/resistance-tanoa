// Variables containing the locations on the map, and their markers.


// Resistance base format [baseName, baseMarkerName]
bases = [
	["First Camp", "locationFirstBase"]
];


// Town format: [townName, gendarme groups present, [gendarmes patrol areas]]
tavu = ["Tavu", // town name
	3, // gendarmes present
	["gendarmeTavuPatrol01", "gendarmeTavuPatrol02", "gendarmeTavuPatrol03", "gendarmeTavuPatrol04"] // gendarme patrol areas
];


// Gendamarie HQ format: [markerName]
balavuGendarmeHQ = ["locationBalavuGendarmeHQ"];

// Prison camp format [markerName]
balavuPrisonCamp01 = ["locationBalavuPrisonCamp01"];
balavuPrisonCamp02 = ["locationBalavuPrisonCamp02"];

// Region format: [regionName, [prisonCampMarkers], Gendarme HQ Marker, [towns]]
balavu = [
	"Balavu Region", // Name
	[balavuPrisonCamp01, balavuPrisonCamp02], // Prison Camps
	balavuGendarmeHQ, // Gendarme HQ Locations
	[tavu] // towns
];


worldData = [
	"Tanoa", // World name
	[balavu] // regions array
];

