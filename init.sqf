// Setup location variables
[] call compileFinal preprocessFileLineNumbers "resistance\locations\locations.sqf";
// Setup configuration variables
[] call compileFinal preprocessFileLineNumbers "resistance\mission-config\variables-config.sqf";

// Script definitions
spawnBase = compileFinal preprocessFileLineNumbers "resistance\resistance-camp\resistance-camp-placement.sqf";

// Run the save manager
execVM "resistance\save-manager\save-manager.sqf";

// Run the main game loop
execVM "resistance\game-manager\game-manager.sqf";


// Spawn the first insurgent camp
[markerPos ((bases select 0) select 1)] call spawnBase;