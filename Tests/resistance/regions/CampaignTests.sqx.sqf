














cl_dave3_tests_CampaignTests_constructor = { private "_class_fields"; _class_fields = [["dave3_tests_CampaignTests", []]]; _class_fields };



dave3_tests_CampaignTests_Init = { 









    ["dave3.tests", "CampaignTests", ["Given_CampaignDefinition_When_GettingName_Then_ExpectTanoa", "Given_CampaignDefinition_When_GettingSaveableData_Then_ExpectSameArray"]] call Sqx_UnitTest_TestEngine_Register; };



dave3_tests_CampaignTests_Given_CampaignDefinition_When_GettingName_Then_ExpectTanoa = { 
    private ["_testCampaign", "_result"];


    _testCampaign = ([campaignDataInitial] call cl_dave3_Campaign_constructor);


    _result = (_testCampaign select 1);


    [_result isEqualTo "Resistance - TANOA", "Campaign name not set correctly"] call Sqx_UnitTest_Assert_IsTrue; };


dave3_tests_CampaignTests_Given_CampaignDefinition_When_GettingSaveableData_Then_ExpectSameArray = { 
    private ["_testCampaign", "_result"];


    _testCampaign = ([campaignDataInitial] call cl_dave3_Campaign_constructor);


    _result = ([_testCampaign, []] call cl_dave3_Campaign_getSaveableData);
    ([missionLogger, [["CAMPAIGNTEST: Initial Data  ", campaignDataInitial], 4]] call cl_dave3_LoggerUtil_logMessage);
    ([missionLogger, [["CAMPAIGNTEST: Savegame Data ", _result], 4]] call cl_dave3_LoggerUtil_logMessage);


    [_result isEqualTo campaignDataInitial, "Campaign not loading correctly"] call Sqx_UnitTest_Assert_IsTrue; };