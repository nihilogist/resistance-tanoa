// Variables containing the locations on the map, and their markers.


// Resistance base format [baseName, baseMarkerName]
bases = [
	["First Camp", "locationFirstBase"]
];

firstAmmunitionCache = [
	[1787.45, 7309.312, 0], // position
	0, // direction
	[["arifle_AKM_F"],[2]], // weapon contents
	[["30rnd_762x39_AK12_Mag_F"],[4]] // magazine contents
];

ammunitionCaches = [
	firstAmmunitionCache
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
	[balavu], // regions array
	[ammunitionCaches] // ammo caches array
];

/*
[
	[
		.. world data is here [
			[
				"Tanoa", <-- world name is world data select 0
				[ <-- regions data is world data select 1
					["Balavu Region",
						[
							["locationBalavuPrisonCamp01"],
							["locationBalavuPrisonCamp02"]
						],
						["locationBalavuGendarmeHQ"],
						[]
					]
				], <-- end regions data
				[ <-- caches data is world data select 2
					[
						[1789.19,7309.44,0.0119705],
						0.0584043,
						[
							["arifle_AKM_F"],[2]
						],
						[
							["30Rnd_762x39_AK12_Mag_F"],[4]
						]
					]
				]
			],
			[],
			[]
		],
		[],
		[]
	]
]
*/