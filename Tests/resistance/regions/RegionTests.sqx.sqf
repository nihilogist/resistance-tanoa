













cl_dave3_tests_RegionTests_constructor = { _this select 0 };



dave3_tests_RegionTests_Init = { 









    ["dave3.tests", "RegionTests", ["Given_RegionDefinitionWithNoTowns_When_GettingRegionData_Then_ExpectCorrectResult", "Given_RegionDefinitionWithTowns_When_GettingRegionData_Then_ExpectCorrectResult"]] call Sqx_UnitTest_TestEngine_Register; };



dave3_tests_RegionTests_Given_RegionDefinitionWithNoTowns_When_GettingRegionData_Then_ExpectCorrectResult = { 
    private ["_testRegion", "_result", "_regionData", "_expectedRegionData"];

    _regionData = [
    "Balavu"];


    _expectedRegionData = [
    "Balavu", 
    []];



    _testRegion = ([[["dave3_Region",["dave3.ISaveable"]]], [_regionData]] call cl_dave3_Region_constructor);


    _result = ([_testRegion, []] call cl_dave3_Region_getSaveableData);


    [_result isEqualTo _expectedRegionData, "MapData not loading correctly."] call Sqx_UnitTest_Assert_IsTrue; };


dave3_tests_RegionTests_Given_RegionDefinitionWithTowns_When_GettingRegionData_Then_ExpectCorrectResult = { 
    private ["_testRegion", "_result", "_regionData"];

    _regionData = [
    "Balavu", 
    [
    [
    "Balavu", 
    "townBalavu"], 

    [
    "Tavu", 
    "townTavu"]]];





    _testRegion = ([[["dave3_Region",["dave3.ISaveable"]]], [_regionData]] call cl_dave3_Region_constructor);


    _result = ([_testRegion, []] call cl_dave3_Region_getSaveableData);


    [_result isEqualTo _regionData, "MapData not loading correctly."] call Sqx_UnitTest_Assert_IsTrue; };