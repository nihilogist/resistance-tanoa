

















cl_dave3_Region_constructor = { private "_class_fields"; _class_fields = [["dave3_Region", []]];
    params ["_regionName", "_prisonCampMarkers"];

    private ["_prisonCampMarker"];

    _class_fields set [1, _regionName];

    ["Initialising Region"] call logger;
    [_regionName] call logger;


    _prisonCampMarker = selectRandom _prisonCampMarkers;
    [_prisonCampMarker] call Logger;
    _class_fields set [2, ([_prisonCampMarker] call cl_dave3_PrisonCamp_constructor)]; _class_fields };