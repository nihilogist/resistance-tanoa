












cl_dave3_tests_TownTests_constructor = { _this select 0 };



dave3_tests_TownTests_Init = { 








    ["dave3.tests", "TownTests", ["Given_TownDefinition_When_GettingTownData_Then_ExpectCorrectResult"]] call Sqx_UnitTest_TestEngine_Register; };



dave3_tests_TownTests_Given_TownDefinition_When_GettingTownData_Then_ExpectCorrectResult = { 
    private ["_testTown", "_result", "_townData"];

    _townData = [
    "Balavu", 
    "townBalavu"];

    ([missionLogger, [["TOWNTEST: Test region array data: ", _townData], 4]] call cl_dave3_LoggerUtil_logMessage);


    _testTown = ([[["dave3_Town",["dave3.ISaveable"]]], [_townData]] call cl_dave3_Town_constructor);


    _result = ([_testTown, []] call cl_dave3_Town_getSaveableData);

    ([missionLogger, [["TOWNTEST: Initial Data  ", _townData], 4]] call cl_dave3_LoggerUtil_logMessage);
    ([missionLogger, [["TOWNTEST: Savegame Data ", _result], 4]] call cl_dave3_LoggerUtil_logMessage);


    [_result isEqualTo _townData, "MapData not loading correctly."] call Sqx_UnitTest_Assert_IsTrue; };