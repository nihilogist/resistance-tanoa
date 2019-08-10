










cl_Sqx_UnitTest_Assert_constructor = { _this select 0 };


Sqx_UnitTest_Assert_AreEqual = {  params ["_expected", "_actual", ["_message", ""]]; 
    private ["_fullMsg"];

    if (!(_expected == _actual)) then {
        _fullMsg = "Expected '" + str _expected + "' but got '" + str _actual + "'. ";

        if (_message != "") then {
            _fullMsg = _fullMsg + _message; };


        [_fullMsg] call Sqx_UnitTest_TestEngine_WriteFailed; }; };




Sqx_UnitTest_Assert_AreNotEqual = {  params ["_expected", "_actual", ["_message", ""]]; 
    private ["_fullMsg"];

    if (_expected == _actual) then {
        _fullMsg = "Expected '" + str _expected + "' but got '" + str _actual + "'. ";

        if (_message != "") then {
            _fullMsg = _fullMsg + _message; };


        [_fullMsg] call Sqx_UnitTest_TestEngine_WriteFailed; }; };




Sqx_UnitTest_Assert_IsTrue = {  params ["_actual", ["_message", ""]]; 
    private ["_fullMsg"];

    if (!_actual) then {
        _fullMsg = "Expected 'true' but got '" + str _actual + "'. ";

        if (_message != "") then {
            _fullMsg = _fullMsg + _message; };


        [_fullMsg] call Sqx_UnitTest_TestEngine_WriteFailed; }; };




Sqx_UnitTest_Assert_IsFalse = {  params ["_actual", ["_message", ""]]; 
    private ["_fullMsg"];

    if (_actual) then {
        _fullMsg = "Expected 'false' but got '" + str _actual + "'. ";

        if (_message != "") then {
            _fullMsg = _fullMsg + _message; };


        [_fullMsg] call Sqx_UnitTest_TestEngine_WriteFailed; }; };




Sqx_UnitTest_Assert_ValueIsNull = {  params ["_value"]; 
    private ["_valueSqxClass", "_isNull"];

    _valueSqxClass = _value;
    _isNull = false;

    if ((_valueSqxClass isEqualTo ["null"]) || { isNull _value }) then {
        _isNull = true; };


    _isNull };



Sqx_UnitTest_Assert_IsNull = {  params ["_actual", ["_message", ""]]; 
    private ["_fullMsg"];

    if (!([_actual] call Sqx_UnitTest_Assert_ValueIsNull)) then {
        _fullMsg = "Expected NULL but got '" + str _actual + "'. ";

        if (_message != "") then {
            _fullMsg = _fullMsg + _message; };


        [_fullMsg] call Sqx_UnitTest_TestEngine_WriteFailed; }; };



Sqx_UnitTest_Assert_IsNotNull = {  params ["_actual", ["_message", ""]]; 
    private ["_fullMsg"];

    if ([_actual] call Sqx_UnitTest_Assert_ValueIsNull) then {
        _fullMsg = "Expected NOT NULL but got '" + str _actual + "'. ";

        if (_message != "") then {
            _fullMsg = _fullMsg + _message; };


        [_fullMsg] call Sqx_UnitTest_TestEngine_WriteFailed; }; };