














cl_dave3_GendarmeHQ_locationMarker_PropIndex = 1;
cl_dave3_GendarmeHQ_region_PropIndex = 2;



cl_dave3_GendarmeHQ_constructor = { params ["_class_fields", "_this"];

    params ["_gendarmeHQData"];
    private ["_hqBuildingClass", "_flagBuildingClass", "_hqBuilding", "_hqFlag", "_flagPosition"];



    _class_fields set [1, _gendarmeHQData select 0];
    _class_fields set [2, _gendarmeHQData select 1];

    _flagPosition = markerPos (_class_fields select 1);


    _hqBuildingClass = "Land_House_Small_06_F";
    _flagBuildingClass = "Flag_Gendarmerie_F";


    _hqBuilding = [_hqBuildingClass, (_class_fields select 1)] call spawnObjectAtMarker;

    _hqFlag = _flagBuildingClass createVehicle (_flagPosition);
    _hqFlag attachTo [_hqBuilding, [-7, -7, 0]]; _class_fields };



cl_dave3_GendarmeHQ_getSaveableData = { params ["_class_fields", "_this"];
    private ["_gendarmeHQData"];

    _gendarmeHQData = [(_class_fields select 1)];

    _gendarmeHQData };