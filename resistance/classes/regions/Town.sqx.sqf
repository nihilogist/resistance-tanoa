













cl_dave3_Town_townName_PropIndex = 1;
cl_dave3_Town_gendarmesPatrolMarkers_PropIndex = 2;
cl_dave3_Town_gendarmePatrols_PropIndex = 3;


cl_dave3_Town_constructor = { private "_class_fields"; _class_fields = [["dave3_Town", ["dave3.ISaveable"]]];

    params ["_townData"];
    private ["_targetGendarmes", "_assignedGendarmes"];

    ([missionLogger, [["TownData array received: ", _townData], 4]] call cl_dave3_LoggerUtil_logMessage);


    _class_fields set [1, _townData select 0];
    _targetGendarmes = _townData select 1;
    _class_fields set [2, _townData select 2];



    if (_targetGendarmes > 0) then {
        _assignedGendarmes = 0;
        while { _assignedGendarmes < _targetGendarmes } do {
            if (_targetGendarmes - _assignedGendarmes > 1) then {
                (_class_fields select 3) pushback (([2, _class_fields] call cl_dave3_GendarmeGroup_constructor));
                _assignedGendarmes = _assignedGendarmes + 2; } else { 

                (_class_fields select 3) pushback (([1, _class_fields] call cl_dave3_GendarmeGroup_constructor));
                _assignedGendarmes = _assignedGendarmes + 1; }; }; }; _class_fields };








cl_dave3_Town_getRandomPatrolMarker = { params ["_class_fields", "_this"];
    selectRandom (_class_fields select 2); };



cl_dave3_Town_getNumberOfGendarmes = { params ["_class_fields", "_this"];
    private ["_numberOfGendarmes"];
    _numberOfGendarmes = 0;
    {
        _numberOfGendarmes = _numberOfGendarmes + (count units (([_x, []] call cl_dave3_GendarmeGroup_getGendarmePatrol)));
    } forEach (_class_fields select 3);
    _numberOfGendarmes };


cl_dave3_Town_getSaveableData = { params ["_class_fields", "_this"];
    private ["_saveableData"];

    _saveableData = [(
    _class_fields select 1), 
    ([_class_fields, []] call cl_dave3_Town_getNumberOfGendarmes), (
    _class_fields select 2)];


    ([missionLogger, [["TownData array returned: ", _saveableData], 4]] call cl_dave3_LoggerUtil_logMessage);

    [_saveableData] };