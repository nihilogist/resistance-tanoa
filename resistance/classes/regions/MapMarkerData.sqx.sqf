












cl_dave3_MapMarkerData_allUserDefinedMapMarkers_PropIndex = 1;


cl_dave3_MapMarkerData_constructor = { params ["_class_fields", "_this"]; params ["_mapMarkers"]; 

    {
        ([missionLogger, [["MAPMARKER: Rendering marker: ", _x], 3]] call cl_dave3_LoggerUtil_logMessage);
        _x call BIS_fnc_stringToMarker;
    } forEach _mapMarkers; _class_fields };



cl_dave3_MapMarkerData_getSaveableData = { params ["_class_fields", "_this"];
    private ["_allMapMarkers", "_allUserMapMarkers", "_markerString", "_serialisedMarker"];

    _class_fields set [1, []];

    ([missionLogger, [["MAPMARKER: Getting all map markers."], 3]] call cl_dave3_LoggerUtil_logMessage);
    _allMapMarkers = allMapMarkers;
    ([missionLogger, [["MAPMARKER: ", _allMapMarkers], 3]] call cl_dave3_LoggerUtil_logMessage);

    ([missionLogger, [["MAPMARKER: Getting all USER map markers."], 3]] call cl_dave3_LoggerUtil_logMessage);
    _allUserMapMarkers = [];
    {
        _markerString = toArray _x;
        _markerString resize 15;
        if (toString _markerString == "_USER_DEFINED #") then {
            _allUserMapMarkers pushBack _x; };
    } forEach 
    _allMapMarkers;

    ([missionLogger, [["MAPMARKER: user defined map markers found as: ", _allUserMapMarkers], 3]] call cl_dave3_LoggerUtil_logMessage);

    ([missionLogger, [["MAPMARKER: serialising markers"], 3]] call cl_dave3_LoggerUtil_logMessage);

    {
        _serialisedMarker = _x call BIS_fnc_markerToString;
        ([missionLogger, [["MAPMARKER: user defined map marker serialised as: ", _serialisedMarker], 3]] call cl_dave3_LoggerUtil_logMessage);
        (_class_fields select 1) pushBack _serialisedMarker;
    } forEach _allUserMapMarkers; (


    _class_fields select 1) };