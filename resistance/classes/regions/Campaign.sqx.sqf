













cl_dave3_Campaign_mapName_PropIndex = 1;


cl_dave3_Campaign_mapData_PropIndex = 2;



cl_dave3_Campaign_constructor = { private "_class_fields"; _class_fields = [["dave3_Campaign", ["dave3.ISaveable"]]]; params ["_campaignData"]; 
    ([missionLogger, [["CAMPAIGN: Received data to construct campaign state: ", _campaignData], 4]] call cl_dave3_LoggerUtil_logMessage);
    ([missionLogger, [["CAMPAIGN: Campaign Name: ", _campaignData select 0], 4]] call cl_dave3_LoggerUtil_logMessage);
    _class_fields set [1, _campaignData select 0];
    ([missionLogger, [["CAMPAIGN: MapData: ", [_campaignData select 1]], 4]] call cl_dave3_LoggerUtil_logMessage);
    _class_fields set [2, (([_campaignData select 1]) call cl_dave3_MapData_constructor)]; _class_fields };



cl_dave3_Campaign_getSaveableData = { params ["_class_fields", "_this"];
    private ["_saveableData"];

    _saveableData = [(
    _class_fields select 1), 
    ([(_class_fields select 2), []] call cl_dave3_MapData_getSaveableData)];

    ([missionLogger, [["CAMPAIGN: Returning data to save campaign state", _saveableData], 4]] call cl_dave3_LoggerUtil_logMessage);
    _saveableData };