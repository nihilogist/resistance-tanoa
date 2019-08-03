















cl_dave3_GendarmeHQ_constructor = { private "_class_fields"; _class_fields = [["dave3_GendarmeHQ", []]];

    params ["_locationMarker"];

    private ["_hqBuildingClass", "_flagBuildingClass", "_hqBuilding", "_hqFlag", "_flagPosition"];

    _class_fields set [1, _locationMarker];
    _flagPosition = markerPos (_class_fields select 1);


    _hqBuildingClass = "Land_House_Small_06_F";
    _flagBuildingClass = "Flag_Gendarmerie_F";


    _hqBuilding = [_hqBuildingClass, _locationMarker] call spawnObjectAtMarker;

    _hqFlag = _flagBuildingClass createVehicle (_flagPosition);
    _hqFlag attachTo [_hqBuilding, [-10, 0, 0]]; _class_fields };