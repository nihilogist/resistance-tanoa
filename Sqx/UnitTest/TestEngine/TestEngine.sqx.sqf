












cl_Sqx_UnitTest_TestEngine_constructor = { _this select 0 };





Sqx_UnitTest_TestEngine_Init = { 
    Sqx_UnitTest_TestEngine__mTestUnits = []; };







Sqx_UnitTest_TestEngine_Register = {  params ["_namespaceName", "_className", "_methodNames"]; 
    Sqx_UnitTest_TestEngine__mTestUnits pushBack ([[["Sqx_UnitTest_TestUnit",[]]], [_namespaceName, _className, _methodNames]] call cl_Sqx_UnitTest_TestUnit_constructor); };





Sqx_UnitTest_TestEngine_Output = {  params ["_text", ["_onlyToRpt", false]]; 
    if (!_onlyToRpt) then {
        player sideChat _text; };

    ([missionLogger, [[_text], 4]] call cl_dave3_LoggerUtil_logMessage);
    diag_log _text; };






Sqx_UnitTest_TestEngine_WriteFailed = {  params ["_message"]; 
    if (Sqx_UnitTest_TestEngine__mMethodSucceeded) then {


        [("FAILED: " + Sqx_UnitTest_TestEngine__mCurrentClassName + "." + Sqx_UnitTest_TestEngine__mCurrentMethodName + " - " + _message)] call Sqx_UnitTest_TestEngine_Output;
        Sqx_UnitTest_TestEngine__mMethodSucceeded = false; }; };









Sqx_UnitTest_TestEngine_StringReplace = {  params ["_str", "_find", "_replace"]; 
    private _return = "";
    private _len = count _find;
    private _pos = _str find _find;

    while { (_pos != -1) && (count _str > 0) } do {
        _return = _return + (_str select [0, _pos]) + _replace;

        _str = (_str select [_pos + _len]);
        _pos = _str find _find; }; 


    _return + _str };




Sqx_UnitTest_TestEngine_Run = {  params ["_delayed"]; 
    private ["_sqfTestMethod", "_successCount", "_failedCount", "_testUnit", "_sqfClassName", "_sConstructorFunction", "_sqfBeforeEach", "_sqfAfterEach"];

    _successCount = 0;
    _failedCount = 0;

    if (_delayed) then {
        sleep 3; };


    ["RUNNING TESTS..."] call Sqx_UnitTest_TestEngine_Output;

    {
        _testUnit = _x;

        Sqx_UnitTest_TestEngine__mCurrentNamespaceName = (_testUnit select 1);
        Sqx_UnitTest_TestEngine__mCurrentClassName = (_testUnit select 2);
        _sqfClassName = ([Sqx_UnitTest_TestEngine__mCurrentNamespaceName, ".", "_"] call Sqx_UnitTest_TestEngine_StringReplace) + "_" + Sqx_UnitTest_TestEngine__mCurrentClassName;

        _sConstructorFunction = "cl_" + _sqfClassName + "_constructor";
        waitUntil { !(isNil compile _sConstructorFunction) };

        {
            Sqx_UnitTest_TestEngine__mCurrentMethodName = _x;
            Sqx_UnitTest_TestEngine__mMethodSucceeded = true;

            _sqfBeforeEach = _sqfClassName + "_BeforeEach";
            if (!isNil _sqfBeforeEach) then {
                call compile ("call " + _sqfBeforeEach); };


            _sqfTestMethod = _sqfClassName + "_" + Sqx_UnitTest_TestEngine__mCurrentMethodName + ";";

            if (isNil compile _sqfTestMethod) then {
                Sqx_UnitTest_TestEngine__mMethodSucceeded = false;
                [("MISSING: " + Sqx_UnitTest_TestEngine__mCurrentClassName + "." + Sqx_UnitTest_TestEngine__mCurrentMethodName + " - Test method was not found.")] call Sqx_UnitTest_TestEngine_Output; } else { 


                call compile ("call " + _sqfTestMethod); };


            if (Sqx_UnitTest_TestEngine__mMethodSucceeded) then {
                _successCount = _successCount + 1;
                [("PASSED: " + Sqx_UnitTest_TestEngine__mCurrentClassName + "." + Sqx_UnitTest_TestEngine__mCurrentMethodName), true] call Sqx_UnitTest_TestEngine_Output; } else { 


                _failedCount = _failedCount + 1; };


            _sqfAfterEach = _sqfClassName + "_AfterEach";
            if (!(isNil compile _sqfAfterEach)) then {
                call compile ("call " + _sqfAfterEach); };
        } forEach (
        _testUnit select 3);
    } forEach Sqx_UnitTest_TestEngine__mTestUnits;

    ["TOTAL: " + str (_successCount + _failedCount) + ". PASSED: " + str _successCount + ". FAILED: " + str _failedCount] call Sqx_UnitTest_TestEngine_Output; };



Sqx_UnitTest_TestEngine_RunAsync = { 
    [false] spawn Sqx_UnitTest_TestEngine_Run; };



Sqx_UnitTest_TestEngine_RunDelayedAsync = { 
    [true] spawn Sqx_UnitTest_TestEngine_Run; };