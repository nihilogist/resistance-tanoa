














cl_dave3_Region_regionName_PropIndex = 6;





cl_dave3_Region_constructor = { private "_class_fields"; _class_fields = [["dave3_Region", ["dave3.ISaveable"]]];
    params ["_regionName", "_militarisation", "_prisonCampMarkers", "_gendarmeHQMarker", "_towns"];

    private ["_prisonCampMarker"];

    _class_fields set [6, _regionName];

    _class_fields set [2, _militarisation];
    _class_fields set [5, _towns];

    [["Initialising Region ", (_class_fields select 6)] joinString ""] call logger;


    _prisonCampMarker = selectRandom _prisonCampMarkers;
    [_prisonCampMarker] call Logger;
    _class_fields set [3, ([_prisonCampMarker] call cl_dave3_PrisonCamp_constructor)];


    _class_fields set [4, ([_gendarmeHQMarker] call cl_dave3_GendarmeHQ_constructor)];


    {
        _townName = _x select 0;
        _gendarmesGroups = _x select 1;
        _gendarmePatrolAreas = _x select 2;
        ([_townName, _gendarmesGroups, _gendarmePatrolAreas] call cl_dave3_Town_constructor);
    } forEach ((_class_fields select 5)); _class_fields };



cl_dave3_Region_getSaveableData = { params ["_class_fields", "_this"];
    private ["_saveableData"];
    _saveableData = [(
    _class_fields select 6)];

    [["REGION: Save data generated as: ", _saveableData] joinString ""] call logger;
    _saveableData };