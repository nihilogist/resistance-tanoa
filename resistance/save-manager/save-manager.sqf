/*

saveGameName = "resistanceSave";

// Check to see if save should be deleted
if (nukeTheSave) then {
	resistanceSaveGame = [];
	profileNamespace setVariable [saveGameName, resistanceSaveGame];
	["Erasing save game data!"] call logger;
};

triggerServerSave = 0;
resistanceSaveGame = profileNamespace getVariable saveGameName;

// Try to load values from save game
if (!isNil "resistanceSaveGame" && !nukeTheSave) then {
	["Loading data from save game."] call logger;
	popularSupport = resistanceSaveGame select 0;
	governmentSupport = resistanceSaveGame select 1;
	externalSupport = resistanceSaveGame select 2;
	governmentStability = resistanceSaveGame select 3;
	["Save game data loaded."] call logger;
};

// Start autosave
execVM "resistance\save-manager\regular-autosave.sqf";

// Wait for save trigger to happen
while {true} do {

	waitUntil {
		sleep 0.5;
		triggerServerSave > 0
	};
	
	["Saving game data to server profile file"] call logger;
	
	// When save trigger happens, then set all variables into the profile namespace and save it
	triggerServerSave = 0;
	
	resistanceSaveGame = [popularSupport, governmentSupport, externalSupport, governmentStability];
	profileNamespace setVariable [saveGameName, resistanceSaveGame];
	saveProfileNamespace;
	
	["Game data saved."] call logger;

};

*/