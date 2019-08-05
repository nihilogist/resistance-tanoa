













cl_dave3_tests_MapDataTests_constructor = { private "_class_fields"; _class_fields = [["dave3_tests_MapDataTests", []]]; _class_fields };



dave3_tests_MapDataTests_Init = { 








    ["dave3.tests", "MapDataTests", ["Given_CampaignDefinition_When_GettingMapData_Then_ExpectCorrectResult"]] call Sqx_UnitTest_TestEngine_Register; };



dave3_tests_MapDataTests_Given_CampaignDefinition_When_GettingMapData_Then_ExpectCorrectResult = { 
    private ["_testMapData", "_result", "_mapDataData"];

    _mapDataData = [
    [
    "Balavu"]];



    ([missionLogger, [["MAPDATATEST: MapData data ", _mapDataData], 4]] call cl_dave3_LoggerUtil_logMessage);


    _testMapData = ([_mapDataData] call cl_dave3_MapData_constructor);


    _result = ([_testMapData, []] call cl_dave3_MapData_getSaveableData);

    ([missionLogger, [["MAPDATATEST: Initial Data  ", _mapDataData], 4]] call cl_dave3_LoggerUtil_logMessage);
    ([missionLogger, [["MAPDATATEST: Savegame Data ", _result], 4]] call cl_dave3_LoggerUtil_logMessage);


    [_result isEqualTo _mapDataData, "MapData not loading correctly."] call Sqx_UnitTest_Assert_IsTrue; };