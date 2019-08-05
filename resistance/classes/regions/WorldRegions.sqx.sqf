













cl_dave3_WorldRegions_worldName_PropIndex = 1;
cl_dave3_WorldRegions_regions_PropIndex = 2;
cl_dave3_WorldRegions_caches_PropIndex = 3;



cl_dave3_WorldRegions_constructor = { private "_class_fields"; _class_fields = [["dave3_WorldRegions", ["dave3.ISaveable"]]];
    params ["_worldData"];

    private ["_regionsData", "_region", "_cacheData", "_cache"];

    _class_fields set [1, _worldData select 0];
    _regionsData = _worldData select 1;
    _cacheData = _worldData select 2;

    [["Initialising World ", (_class_fields select 1), " with ", count _regionsData, " regions and ", count _cacheData, " caches."] joinString ""] call logger;

    _class_fields set [2, []];

    {
        [["Reading data for region ", _x] joinString ""] call logger;
        _region = ([_x] call cl_dave3_Region_constructor);
        (_class_fields select 2) pushBack _region;
    } forEach _regionsData;

    _class_fields set [3, []];

    {
        ["Generating Ammo Cache"] call logger;
        _cache = (_x call cl_dave3_AmmoDump_constructor);
        (_class_fields select 3) pushBack _cache;
    } forEach _cacheData; _class_fields };




cl_dave3_WorldRegions_getSaveableData = { params ["_class_fields", "_this"];
    private ["_saveData", "_saveableRegions", "_saveableRegion", "_saveableAmmoDumps"];

    _saveableRegions = [];
    _saveableAmmoDumps = [];


    {
        _saveableRegion = ([_x, []] call cl_dave3_Region_getSaveableData);
        _saveableRegions pushBack _saveableRegion;
    } forEach (_class_fields select 2);


    {
        _saveableAmmoDumps pushBack (([_x, []] call cl_dave3_AmmoDump_getSaveableData));
    } forEach (_class_fields select 3);

    _saveData = [(
    _class_fields select 1), 
    _saveableRegions, 
    _saveableAmmoDumps];


    _saveData };



cl_dave3_WorldRegions_getRegionByName = { params ["_class_fields", "_this"]; params ["_regionName"]; 
    private ["_regionToReturn"];
    {
        if ((_x select 1) isEqualTo _regionName) then {
            _regionToReturn = _x; };
    } forEach (
    _class_fields select 2);
    _regionToReturn };