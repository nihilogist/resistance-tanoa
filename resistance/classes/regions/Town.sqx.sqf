













cl_dave3_Town_townName_PropIndex = 1;




cl_dave3_Town_constructor = { params ["_class_fields", "_this"];

    params ["_townData"];

    ([missionLogger, [["TownData array received: ", _townData], 4]] call cl_dave3_LoggerUtil_logMessage);


    _class_fields set [1, _townData select 0]; _class_fields };




cl_dave3_Town_getSaveableData = { params ["_class_fields", "_this"];
    private ["_saveableData"];

    _saveableData = [(
    _class_fields select 1)];


    ([missionLogger, [["TownData array returned: ", _saveableData], 4]] call cl_dave3_LoggerUtil_logMessage);

    _saveableData };