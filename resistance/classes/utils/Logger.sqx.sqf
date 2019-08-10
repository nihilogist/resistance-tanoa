















cl_dave3_LoggerUtil_constructor = { params ["_class_fields", "_this"]; params ["_logDetailLevel"]; 
    if (_logDetailLevel == 1) then {
        _class_fields set [1, [1]]; };


    if (_logDetailLevel == 2) then {
        _class_fields set [1, [1, 2]]; };


    if (_logDetailLevel == 3) then {
        _class_fields set [1, [1, 2, 3]]; };


    if (_logDetailLevel == 4) then {
        _class_fields set [1, [1, 2, 3, 4]]; }; _class_fields };



cl_dave3_LoggerUtil_logMessage = { params ["_class_fields", "_this"]; params ["_logMessage", ["_logLevel", 3]]; 
    if (debug && isServer) then {
        private ["_logOutput", "_logLevelString", "_logFinalOutput"];
        if ((_class_fields select 1) find _logLevel > -1) then {
            _logOutput = _logMessage joinString "";
            _logLevelString = ([_class_fields, [_logLevel]] call cl_dave3_LoggerUtil_translateLogLevel);
            _logFinalOutput = ["RESISTANCELOG: ", _logLevelString, ": ", _logOutput] joinString "";
            [_logFinalOutput] remoteExec ["systemChat"];
            diag_log _logFinalOutput; }; }; };




cl_dave3_LoggerUtil_translateLogLevel = { params ["_class_fields", "_this"]; params ["_logDetailLevel"]; 
    private ["_logDetailLevelString"];
    _logDetailLevelString = "FATAL";

    if (_logDetailLevel == 2) then {
        _logDetailLevelString = "ERROR"; };


    if (_logDetailLevel == 3) then {
        _logDetailLevelString = "INFO"; };


    if (_logDetailLevel == 4) then {
        _logDetailLevelString = "DEBUG"; };

    _logDetailLevelString };