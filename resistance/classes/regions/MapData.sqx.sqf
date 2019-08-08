













cl_dave3_MapData_regions_PropIndex = 1;


cl_dave3_MapData_constructor = { private "_class_fields"; _class_fields = [["dave3_MapData", ["dave3.ISaveable"]]]; params ["_mapDataData"]; 
    ([missionLogger, [["MAPDATA: Received data to construct campaign map data", _mapDataData], 4]] call cl_dave3_LoggerUtil_logMessage);
    private ["_regionsData"];

    _regionsData = [_mapDataData select 0];
    ([missionLogger, [["MAPDATA: Regions Data", _regionsData], 4]] call cl_dave3_LoggerUtil_logMessage);
    _class_fields set [1, []];
    {
        private ["_regionData"];
        _regionData = _x;
        ([missionLogger, [["MAPDATA: Constructing Region: ", _regionData], 4]] call cl_dave3_LoggerUtil_logMessage);
        (_class_fields select 1) pushBack (([_regionData] call cl_dave3_Region_constructor));
    } forEach _regionsData; _class_fields };


cl_dave3_MapData_getSaveableData = { params ["_class_fields", "_this"];
    private ["_saveableData", "_regionsData"];

    _regionsData = [];
    {
        private ["_saveableRegion"];
        _saveableRegion = ([_x, []] call cl_dave3_Region_getSaveableData);
        _regionsData pushBack _saveableRegion;
    } forEach (_class_fields select 1);


    _saveableData = _regionsData;
    ([missionLogger, [["MAPDATA: Reteurning data to save campaign map data", _saveableData], 4]] call cl_dave3_LoggerUtil_logMessage);
    _saveableData };