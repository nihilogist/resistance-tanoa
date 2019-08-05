call compile preprocessFileLineNumbers "resistance\interfaces\compile-all-interfaces.sqx.sqf";
call compile preprocessFileLineNumbers "resistance\classes\compile-all-classes.sqx.sqf";



private ["_saveManager", "_gameMaster", "_savedWorldData", "_worldName", "_worldRegions"];

sleep 3;


_saveManager = ([nukeTheSave, saveGameName, 120] call cl_dave3_SaveManager_constructor);
_gameMaster = ([] call cl_dave3_GameMaster_constructor);


_savedWorldData = ([_saveManager, []] call cl_dave3_SaveManager_getSavedData);

if (isNil "_savedWorldData") then {
    ["INIT: Saved world data does not exist."] call logger;
    _savedWorldData = worldData; } else { 

    ["INIT: Parsing saved world data"] call logger;
    if (count _savedWorldData == 0) then {
        ["INIT: No world data in save file."] call logger;
        _savedWorldData = worldData; } else { 

        ["INIT: Selecting world data from save file"] call logger; }; };



theWorld = ([_savedWorldData] call cl_dave3_WorldRegions_constructor);


([_saveManager, [theWorld]] call cl_dave3_SaveManager_setWorldToSave);
([_saveManager, []] call cl_dave3_SaveManager_requestSave);
([_saveManager, []] call cl_dave3_SaveManager_RunAsync);
([_saveManager, []] call cl_dave3_SaveManager_runAutosaveAsync);



sleep 10;


([_gameMaster, []] call cl_dave3_GameMaster_startGameMasterAsync);