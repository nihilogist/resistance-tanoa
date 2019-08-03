saveGameName = "resistanceSave";

triggerServerSave = 0;
resistanceSaveGame = profileNamespace getVariable saveGameName;

// Check to see if save should be deleted
if (nukeTheSave) then {
	resistanceSaveGame = [];
	profileNamespace setVariable [saveGameName, resistanceSaveGame];
	hint "Erasing Saved Data!";
};

// Try to load values from save game
if (!isNil "resistanceSaveGame") then {
	popularSupport = resistanceSaveGame select 0;
	governmentSupport = resistanceSaveGame select 1;
	externalSupport = resistanceSaveGame select 2;
};

// Start autosave
execVM "resistance\save-manager\regular-autosave.sqf";

// Wait for save trigger to happen
while {true} do {

	waitUntil {
		sleep 0.5;
		triggerServerSave > 0
	};
	
	// When save trigger happens, then set all variables into the profile namespace and save it
	triggerServerSave = 0;
	
	resistanceSaveGame = [popularSupport, governmentSupport, externalSupport];
	profileNamespace setVariable [saveGameName, resistanceSaveGame];
	saveProfileNamespace;	

};