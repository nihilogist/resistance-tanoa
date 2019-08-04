

















cl_dave3_WorldRegions_constructor = { private "_class_fields"; _class_fields = [["dave3_WorldRegions", []]];
    params ["_worldData"];

    private ["_regions", "_region", "_regionName", "_regionMilitarisation", "_regionPrisonCampMarkers", "_regionGendarmeHQMarker", "_regionTowns"];

    _class_fields set [1, _worldData select 0];
    _regions = _worldData select 1;

    [["Initialising World ", (_class_fields select 1)] joinString ""] call logger;
    [["Initialising ", (count _regions), " regions"] joinString ""] call logger;


    {
        _regionName = _x select 0;
        _regionMilitarisation = _x select 1;
        _regionPrisonCampMarkers = _x select 2;
        _regionGendarmeHQMarker = _x select 3;
        _regionTowns = _x select 4;
        _region = ([_regionName, _regionMilitarisation, _regionPrisonCampMarkers, _regionGendarmeHQMarker, _regionTowns] call cl_dave3_Region_constructor);
        (_class_fields select 2) pushBack _region;
    } forEach _regions; _class_fields };




cl_dave3_WorldRegions_getWorldName = { params ["_class_fields", "_this"];
    (_class_fields select 1) };


cl_dave3_WorldRegions_getRegions = { params ["_class_fields", "_this"];
    (_class_fields select 2) };