













cl_dave3_WorldRegions_worldName_PropIndex = 1;

cl_dave3_WorldRegions_regions_PropIndex = 2;


cl_dave3_WorldRegions_constructor = { private "_class_fields"; _class_fields = [["dave3_WorldRegions", ["dave3.ISaveable"]]];
    params ["_worldData"];

    private ["_regionsData", "_region"];

    _class_fields set [1, _worldData select 0];
    _regionsData = _worldData select 1;

    [["Initialising World ", (_class_fields select 1), " with ", count _regionsData, " regions."] joinString ""] call logger;

    _class_fields set [2, []];

    {
        [["Reading data for region ", _x] joinString ""] call logger;
        _region = ([_x] call cl_dave3_Region_constructor);
        (_class_fields select 2) pushBack _region;
    } forEach _regionsData; _class_fields };



cl_dave3_WorldRegions_getSaveableData = { params ["_class_fields", "_this"];
    private ["_saveData", "_saveableRegions", "_saveableRegion"];

    _saveableRegions = [];

    {
        _saveableRegion = ([_x, []] call cl_dave3_Region_getSaveableData);
        _saveableRegions pushBack _saveableRegion;
    } forEach (_class_fields select 2);

    _saveData = [(
    _class_fields select 1), 
    _saveableRegions];


    _saveData };