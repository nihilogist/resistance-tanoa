













cl_dave3_SaveManager_isRunning_PropIndex = 5;
cl_dave3_SaveManager_autosaveInterval_PropIndex = 6;


cl_dave3_SaveManager_constructor = { private "_class_fields"; _class_fields = [["dave3_SaveManager", []]];

    params ["_nukeTheSave", "_saveGameName", "_autosaveInterval"];

    if (isServer) then {
        ["SAVEMAN: Initialising SaveManager"] call logger;
        _class_fields set [1, _saveGameName];
        _class_fields set [2, []];
        _class_fields set [3, false];
        _class_fields set [5, false];
        _class_fields set [6, _autosaveInterval];


        ([_class_fields, []] call cl_dave3_SaveManager_loadSave);


        if (_nukeTheSave) then {
            ["SAVEMAN: Erasing Save Game contents...", "WARN"] call logger;
            _class_fields set [2, []];
            profileNamespace setVariable [(_class_fields select 1), (_class_fields select 2)];
            saveProfileNamespace;
            ["SAVEMAN: Save Game contents erased.", "WARN"] call logger; }; } else { 



        ["SAVEMAN: Illegal operation trying to create SaveManager on client", "ERROR"] call logger; }; _class_fields };






cl_dave3_SaveManager_loadSave = { params ["_class_fields", "_this"];
    ["SAVEMAN: Loading saved game from profile"] call logger;
    _class_fields set [2, profileNamespace getVariable (_class_fields select 1)];
    if (isNil "_mSaveGameContents") then {
        _class_fields set [2, []]; }; };





cl_dave3_SaveManager_getSavedData = { params ["_class_fields", "_this"];
    private ["_worldData"];
    _worldData = [];
    ["SAVEMAN: Reading world data from save game."] call logger;
    if (isNil "_mSaveGameContents") then {
        ["SAVEMAN: No world data available in save game.", "ERROR"] call logger;
        _worldData } else { 

        if (count (_class_fields select 2) == 0) then {
            ["SAVEMAN: No world data available in save game.", "ERROR"] call logger;
            _worldData } else { 

            ["SAVEMAN: World data definitely available in save game."] call logger;
            _worldData = (_class_fields select 2) select 1; }; };



    _worldData };




cl_dave3_SaveManager_requestSave = { params ["_class_fields", "_this"];
    ["Server save has been requested."] call logger;
    _class_fields set [3, true]; };




cl_dave3_SaveManager_setWorldToSave = { params ["_class_fields", "_this"];
    params ["_worldToSave"];

    _class_fields set [4, _worldToSave]; };


cl_dave3_SaveManager_Run = { params ["_class_fields", "_this"];
    while { true } do {

        waitUntil {
            sleep 10;
            (_class_fields select 3) };


        ["Saving game state to server profile namespace"] call logger;
        _class_fields set [2, [([(_class_fields select 4), []] call cl_dave3_WorldRegions_getSaveableData)]];
        profileNamespace setVariable [(_class_fields select 1), (_class_fields select 2)];
        saveProfileNamespace;
        _class_fields set [3, false];
        ["Game state saved."] call logger; };


    _class_fields set [5, false]; };


cl_dave3_SaveManager_RunAsync = { params ["_class_fields", "_this"];
    _class_fields set [5, true];
    ([_class_fields, []] spawn cl_dave3_SaveManager_Run); };


cl_dave3_SaveManager_runAutosaveAsync = { params ["_class_fields", "_this"];
    ([_class_fields, []] spawn cl_dave3_SaveManager_RunAutoSave); };


cl_dave3_SaveManager_RunAutoSave = { params ["_class_fields", "_this"];
    if ((_class_fields select 6) > 0) then {
        while { true } do {
            sleep (_class_fields select 6);
            ([_class_fields, []] call cl_dave3_SaveManager_requestSave); }; }; };