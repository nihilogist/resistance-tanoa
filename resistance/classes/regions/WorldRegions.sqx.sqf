













cl_dave3_WorldRegions_worldName_PropIndex = 1;

cl_dave3_WorldRegions_regions_PropIndex = 2;


cl_dave3_WorldRegions_constructor = { private "_class_fields"; _class_fields = [["dave3_WorldRegions", ["dave3.ISaveable"]]];
    params ["_worldData"];

    private ["_regions", "_region", "_regionName", "_regionMilitarisation", "_regionPrisonCampMarkers", "_regionGendarmeHQMarker", "_regionTowns"];

    _class_fields set [1, _worldData select 0];
    _regions = _worldData select 1;

    [["Initialising World ", (_class_fields select 1)] joinString ""] call logger;
    [["Initialising ", (count _regions), " regions"] joinString ""] call logger;

    _class_fields set [2, []];

    {
        _regionName = _x select 0;
        _regionMilitarisation = _x select 1;
        _regionPrisonCampMarkers = _x select 2;
        _regionGendarmeHQMarker = _x select 3;
        _regionTowns = _x select 4;
        _region = ([_regionName, _regionMilitarisation, _regionPrisonCampMarkers, _regionGendarmeHQMarker, _regionTowns] call cl_dave3_Region_constructor);
        (_class_fields select 2) pushBack _region;
    } forEach _regions; _class_fields };



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