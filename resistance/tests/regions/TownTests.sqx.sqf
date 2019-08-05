













cl_dave3_tests_TownTests_constructor = { private "_class_fields"; _class_fields = [["dave3_tests_TownTests", []]]; _class_fields };



dave3_tests_TownTests_Init = { 









    ["dave3.tests", "TownTests", ["GivenTownCreatedWithArray_WhenRequestingSaveData_ExpectItToBeTheSame", "GivenTownCreatedWith2Gendarmes_WhenRequestingGendarmePatrols_Expect1"]] call Sqx_UnitTest_TestEngine_Register; };



dave3_tests_TownTests_GivenTownCreatedWithArray_WhenRequestingSaveData_ExpectItToBeTheSame = { 
    private ["_townData", "_result", "_town"];

    _townData = [["Leqa", 
    0, 
    ["gendarmeLeqaPatrol01", "gendarmeLeqaPatrol02", "gendarmeLeqaPatrol03", "gendarmeLeqaPatrol04"]]];


    _town = (_townData call cl_dave3_Town_constructor);


    _result = ([_town, []] call cl_dave3_Town_getSaveableData);


    [_result isEqualTo _townData, "Town does not return values given."] call Sqx_UnitTest_Assert_IsTrue; };



dave3_tests_TownTests_GivenTownCreatedWith2Gendarmes_WhenRequestingGendarmePatrols_Expect1 = { 
    private ["_townData", "_result", "_town"];

    _townData = [["Leqa", 
    2, 
    ["gendarmeLeqaPatrol01", "gendarmeLeqaPatrol02", "gendarmeLeqaPatrol03", "gendarmeLeqaPatrol04"]]];


    _town = (_townData call cl_dave3_Town_constructor);


    sleep 1;


    _result = count ((_town select 3));


    [_result, 1, "Expected only one gendarme patrol."] call Sqx_UnitTest_Assert_AreEqual; };