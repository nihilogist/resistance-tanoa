













cl_dave3_MapData_regions_PropIndex = 1;


cl_dave3_MapData_constructor = { params ["_class_fields", "_this"]; params ["_mapDataData"]; 
    ([missionLogger, [["MAPDATA: Received data to construct campaign map data ", _mapDataData], 4]] call cl_dave3_LoggerUtil_logMessage);
    private ["_regionsData", "_regionData"];

    _regionsData = [_mapDataData select 0];
    ([missionLogger, [["MAPDATA: Regions Data", _regionsData], 4]] call cl_dave3_LoggerUtil_logMessage);
    _class_fields set [1, []];
    {
        _regionData = _x;
        ([missionLogger, [["MAPDATA: Constructing Region: ", _regionData], 4]] call cl_dave3_LoggerUtil_logMessage);
        (_class_fields select 1) pushBack (([[["dave3_Region",["dave3.IBuildable", "dave3.ISaveable"]]], [_regionData]] call cl_dave3_Region_constructor));
    } forEach _regionsData;

    ([missionLogger, [["MAPDATA: ", (count ((_class_fields select 1))), " regions constructed"], 3]] call cl_dave3_LoggerUtil_logMessage); _class_fields };


cl_dave3_MapData_getSaveableData = { params ["_class_fields", "_this"];
    private ["_saveableData", "_regionsData", "_saveableRegion"];

    ([missionLogger, [["MAPDATA: Calculating Mapdata save data for ", _class_fields], 4]] call cl_dave3_LoggerUtil_logMessage);

    _regionsData = [];
    ([missionLogger, [["MAPDATA: Saving ", (count (_class_fields select 1)), " regions."], 4]] call cl_dave3_LoggerUtil_logMessage);
    {
        ([missionLogger, [["MAPDATA: Calculating Mapdata save data for region", (_x select 1)], 4]] call cl_dave3_LoggerUtil_logMessage);
        _saveableRegion = ([_x, []] call cl_dave3_Region_getSaveableData);
        _regionsData pushBack _saveableRegion;
    } forEach (_class_fields select 1);


    _saveableData = _regionsData;
    ([missionLogger, [["MAPDATA: Reteurning data to save campaign map data", _saveableData], 4]] call cl_dave3_LoggerUtil_logMessage);
    _saveableData };


cl_dave3_MapData_build = { params ["_class_fields", "_this"];
    {
        ([_x, []] call cl_dave3_Region_build);
    } forEach (_class_fields select 1); };