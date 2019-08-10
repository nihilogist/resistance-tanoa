













cl_Tests_Example_ExampleTests_constructor = { _this select 0 };



Tests_Example_ExampleTests_Init = { 









    ["Tests.Example", "ExampleTests", ["Given10_WhenMultipliedBy2_Then20", "GivenEmptyGroup_WhenAiUnitAdded_ThenOneAiInGroup"]] call Sqx_UnitTest_TestEngine_Register; };



Tests_Example_ExampleTests_BeforeEach = { };




Tests_Example_ExampleTests_AfterEach = { };



Tests_Example_ExampleTests_Given10_WhenMultipliedBy2_Then20 = { 
    private ["_value", "_result"];


    _value = 10;


    _result = _value * 2;


    [_result, 20, "Multiplication in SQF is broken!"] call Sqx_UnitTest_Assert_AreEqual; };


Tests_Example_ExampleTests_GivenEmptyGroup_WhenAiUnitAdded_ThenOneAiInGroup = { 
    private ["_group"];


    _group = createGroup west;


    "B_Soldier_F" createUnit [[0, 0, 100], _group];


    [count units _group, 1, "Multiplication in SQF is broken!"] call Sqx_UnitTest_Assert_AreEqual;


    deleteVehicle (units _group select 1);
    deleteGroup _group; };