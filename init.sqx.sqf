call compile preprocessFileLineNumbers "resistance\interfaces\compile-all-interfaces.sqx.sqf";
call compile preprocessFileLineNumbers "resistance\classes\compile-all-classes.sqx.sqf";



private ["_saveManager", "_savedWorldData", "_worldName", "_worldRegions"];

sleep 3;


_saveManager = ([nukeTheSave, saveGameName] call cl_dave3_SaveManager_constructor);



_savedWorldData = ([_saveManager, []] call cl_dave3_SaveManager_getSavedData);

if (isNil "_savedWorldData") then {
    ["INIT: Saved world data does not exist."] call logger;
    _worldName = worldData select 0;
    _worldRegions = worldData select 1; } else { 

    ["INIT: Parsing saved world data"] call logger;
    if (count _savedWorldData == 0) then {
        ["INIT: No world data in save file."] call logger;
        _worldName = worldData select 0;
        _worldRegions = worldData select 1; } else { 

        ["INIT: Selecting world data from save file"] call logger;
        _worldName = _savedWorldData select 0;
        [["INIT: World name found as ", _worldName] joinString ""] call logger;
        _worldRegions = _savedWorldData select 1; }; };



theWorld = ([[_worldName, _worldRegions]] call cl_dave3_WorldRegions_constructor);


([_saveManager, [theWorld]] call cl_dave3_SaveManager_setWorldToSave);
([_saveManager, []] call cl_dave3_SaveManager_requestSave);

([_saveManager, []] call cl_dave3_SaveManager_RunAsync);