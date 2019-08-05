













cl_dave3_tests_RegionTests_constructor = { private "_class_fields"; _class_fields = [["dave3_tests_RegionTests", []]]; _class_fields };



dave3_tests_RegionTests_Init = { 








    ["dave3.tests", "RegionTests", ["Given_RegionDefinition_When_GettingRegionData_Then_ExpectCorrectResult"]] call Sqx_UnitTest_TestEngine_Register; };



dave3_tests_RegionTests_Given_RegionDefinition_When_GettingRegionData_Then_ExpectCorrectResult = { 
    private ["_testRegion", "_result", "_regionData"];

    _regionData = [
    "Balavu"];

    ([missionLogger, [["REGIONTEST: Test region array data: ", _regionData], 4]] call cl_dave3_LoggerUtil_logMessage);


    _testRegion = ([_regionData] call cl_dave3_Region_constructor);


    _result = ([_testRegion, []] call cl_dave3_Region_getSaveableData);

    ([missionLogger, [["REGIONTEST: Initial Data  ", _regionData], 4]] call cl_dave3_LoggerUtil_logMessage);
    ([missionLogger, [["REGIONTEST: Savegame Data ", _result], 4]] call cl_dave3_LoggerUtil_logMessage);


    [_result isEqualTo _regionData, "MapData not loading correctly."] call Sqx_UnitTest_Assert_IsTrue; };