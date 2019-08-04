















cl_dave3_Town_constructor = { private "_class_fields"; _class_fields = [["dave3_Town", []]];
    params ["_name", "_gendarmeGroupsPresent", "_gendarmesPatrolMarkers"];

    private ["_gendarmeClass", "_gendarmeGroup"];



    _class_fields set [1, _name];
    _class_fields set [2, _gendarmesPatrolMarkers];


    for "_i" from 0 to (_gendarmeGroupsPresent - 1) do {
        _gendarmeGroup = ([2, _class_fields] call cl_dave3_GendarmeGroup_constructor);
        (_class_fields select 3) pushBack (_gendarmeGroup); }; _class_fields };




cl_dave3_Town_getRandomPatrolMarker = { params ["_class_fields", "_this"];
    selectRandom (_class_fields select 2) };


cl_dave3_Town_getTownName = { params ["_class_fields", "_this"];
    (_class_fields select 1) };


cl_dave3_Town_getGendarmesGroups = { params ["_class_fields", "_this"];
    (_class_fields select 3) };


cl_dave3_Town_getGendarmesPatrolMarkers = { params ["_class_fields", "_this"];
    (_class_fields select 2) };