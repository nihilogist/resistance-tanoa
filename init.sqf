// Setup location variables
[] call compileFinal preprocessFileLineNumbers "resistance\locations\locations.sqf";
// Setup configuration variables
[] call compileFinal preprocessFileLineNumbers "resistance\mission-config\mission-config.sqf";
// Set up logging framework
logger = compileFinal preprocessFileLineNumbers "resistance\logging-utils\logger.sqf";


// Initialise objects
execVM "init.sqx.sqf";

// Script definitions
spawnBase = compileFinal preprocessFileLineNumbers "resistance\resistance-camp\resistance-camp-placement.sqf";
reviewIntelligenceAction = compileFinal preprocessFileLineNumbers "resistance\resistance-camp\resistance-camp-actions\resistance-camp-map-action.sqf";

shouldShowLog = compileFinal preprocessFileLineNumbers "resistance\logging-utils\should-show-log.sqf";

// Run the save manager
execVM "resistance\save-manager\save-manager.sqf";

// Run the main game loop
execVM "resistance\game-manager\game-manager.sqf";

// Start the civilians module
call compile preprocessFileLineNumbers "Enigma\Civilians\start-civilians-module.sqf";


// Spawn the first insurgent camp
[markerPos ((bases select 0) select 1)] call spawnBase;