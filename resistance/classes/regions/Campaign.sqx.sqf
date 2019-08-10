













cl_dave3_Campaign_mapName_PropIndex = 1;


cl_dave3_Campaign_mapData_PropIndex = 2;


cl_dave3_Campaign_mapMarkerData_PropIndex = 3;



cl_dave3_Campaign_constructor = { params ["_class_fields", "_this"]; params ["_campaignData"]; 
    ([missionLogger, [["CAMPAIGN: Received data to construct campaign state: ", _campaignData], 4]] call cl_dave3_LoggerUtil_logMessage);

    ([missionLogger, [["CAMPAIGN: Campaign Name: ", _campaignData select 0], 4]] call cl_dave3_LoggerUtil_logMessage);
    _class_fields set [1, _campaignData select 0];

    ([missionLogger, [["CAMPAIGN: MapData: ", [_campaignData select 1]], 4]] call cl_dave3_LoggerUtil_logMessage);
    _class_fields set [2, ([[["dave3_MapData",["dave3.IBuildable", "dave3.ISaveable"]]], ([_campaignData select 1])] call cl_dave3_MapData_constructor)];

    ([missionLogger, [["CAMPAIGN: MapMarkerData: ", [_campaignData select 2]], 4]] call cl_dave3_LoggerUtil_logMessage);
    _class_fields set [3, ([[["dave3_MapMarkerData",["dave3.ISaveable"]]], ([_campaignData select 2])] call cl_dave3_MapMarkerData_constructor)]; _class_fields };



cl_dave3_Campaign_getSaveableData = { params ["_class_fields", "_this"];
    private ["_saveableData", "_saveableMapData", "_thisMapData", "_thisMapMarkerData", "_saveableMapMarkerData"];
    ([missionLogger, [["CAMPAIGN: Calculating Campaign save data for ", _class_fields], 4]] call cl_dave3_LoggerUtil_logMessage);

    _thisMapData = (_class_fields select 2);
    _thisMapMarkerData = (_class_fields select 3);

    _saveableMapData = ([_thisMapData, []] call cl_dave3_MapData_getSaveableData);
    _saveableMapMarkerData = ([_thisMapMarkerData, []] call cl_dave3_MapMarkerData_getSaveableData);

    _saveableData = [(
    _class_fields select 1), 
    _saveableMapData, 
    _saveableMapMarkerData];

    ([missionLogger, [["CAMPAIGN: Returning data to save campaign state", _saveableData], 4]] call cl_dave3_LoggerUtil_logMessage);
    _saveableData };


cl_dave3_Campaign_build = { params ["_class_fields", "_this"];
    ([(_class_fields select 2), []] call cl_dave3_MapData_build); };