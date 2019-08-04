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

muaceba = ["Muaceba",
	1,
	["gendarmeMuacebaPatrol01"]
];

leqa = ["Leqa",
	1,
	["gendarmeLeqaPatrol01", "gendarmeLeqaPatrol02", "gendarmeLeqaPatrol03", "gendarmeLeqaPatrol04"]
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
	[tavu, muaceba, leqa] // towns
];


worldData = [
	"Tanoa", // World name
	[balavu] // regions array
];

