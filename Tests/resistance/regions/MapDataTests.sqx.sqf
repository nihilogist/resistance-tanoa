













cl_dave3_tests_MapDataTests_constructor = { _this select 0 };



dave3_tests_MapDataTests_Init = { 








    ["dave3.tests", "MapDataTests", ["Given_CampaignDefinition_When_GettingMapData_Then_ExpectCorrectResult"]] call Sqx_UnitTest_TestEngine_Register; };



dave3_tests_MapDataTests_Given_CampaignDefinition_When_GettingMapData_Then_ExpectCorrectResult = { 
    private ["_testMapData", "_result", "_mapDataData"];

    _mapDataData = [
    [
    "Balavu", 
    [
    [
    "Balavu", 
    "townBalavu"]]]];






    _testMapData = ([[["dave3_MapData",["dave3.ISaveable"]]], [_mapDataData]] call cl_dave3_MapData_constructor);


    _result = ([_testMapData, []] call cl_dave3_MapData_getSaveableData);


    [_result isEqualTo _mapDataData, "MapData not loading correctly."] call Sqx_UnitTest_Assert_IsTrue; };