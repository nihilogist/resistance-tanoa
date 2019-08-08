
















cl_dave3_GendarmeGroup_constructor = { private "_class_fields"; _class_fields = [["dave3_GendarmeGroup", []]];
    params ["_numberOfUnits", "_town"];
    private ["_positionToSpawn", "_gendarmeUnitClass"];

    _gendarmeUnitClass = "B_GEN_Soldier_F";


    _class_fields set [2, _town];


    _class_fields set [1, createGroup blufor]; _class_fields };





cl_dave3_GendarmeGroup_getGendarmePatrol = { params ["_class_fields", "_this"];
    (_class_fields select 1) };