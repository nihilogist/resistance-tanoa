














cl_dave3_Region_regionName_PropIndex = 1;





cl_dave3_Region_constructor = { private "_class_fields"; _class_fields = [["dave3_Region", ["dave3.ISaveable"]]];
    params ["_regionData"];
    ([missionLogger, [["REGION: Received data to construct region: ", _regionData], 4]] call cl_dave3_LoggerUtil_logMessage);


    ([missionLogger, [["REGION: Region Name: ", _regionData select 0], 4]] call cl_dave3_LoggerUtil_logMessage);
    _class_fields set [1, _regionData select 0]; _class_fields };




















cl_dave3_Region_getSaveableData = { params ["_class_fields", "_this"];
    private ["_saveableData", "_gendarmeHQ", "_prisonCamps", "_towns"];












    _saveableData = [(
    _class_fields select 1)];

    ([missionLogger, [["REGION: Returning data to save region: ", _saveableData], 4]] call cl_dave3_LoggerUtil_logMessage);
    _saveableData };