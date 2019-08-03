















cl_dave3_Town_constructor = { private "_class_fields"; _class_fields = [["dave3_Town", []]];
    params ["_name", "_gendarmeGroupsPresent", "_gendarmesPatrolMarkers"];

    private ["_gendarmeClass"];

    _class_fields set [1, _name];
    _mGendarmesPresent = _gendarmeGroupsPresent;
    _class_fields set [2, _gendarmesPatrolMarkers];
    _gendarmeClass = "B_GEN_Soldier_F";




    for "_i" from 0 to (_gendarmeGroupsPresent - 1) do {

        _group = createGroup blufor;

        _markerToSpawnAt = ([_class_fields, []] call cl_dave3_Town_getRandomPatrolMarker);
        _spawnPosition = [[_markerToSpawnAt]] call BIS_fnc_randomPos;
        _gendarmeClass createUnit [_spawnPosition, _group];
        _gendarmeClass createUnit [_spawnPosition, _group];
        (_class_fields select 3) pushBack (_group); }; _class_fields };




cl_dave3_Town_getRandomPatrolMarker = { params ["_class_fields", "_this"];
    selectRandom (_class_fields select 2) };


cl_dave3_Town_getTownName = { params ["_class_fields", "_this"];
    (_class_fields select 1) };


cl_dave3_Town_getGendarmesGroups = { params ["_class_fields", "_this"];
    (_class_fields select 3) };