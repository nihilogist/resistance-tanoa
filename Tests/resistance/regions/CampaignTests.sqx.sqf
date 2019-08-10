














cl_dave3_tests_CampaignTests_constructor = { _this select 0 };



dave3_tests_CampaignTests_Init = { 









    ["dave3.tests", "CampaignTests", ["Given_CampaignDefinition_When_GettingName_Then_ExpectTanoa", "Given_CampaignDefinition_When_GettingSaveableData_Then_ExpectSameArray"]] call Sqx_UnitTest_TestEngine_Register; };



dave3_tests_CampaignTests_Given_CampaignDefinition_When_GettingName_Then_ExpectTanoa = { 
    private ["_testCampaign", "_result"];


    _testCampaign = ([[["dave3_Campaign",["dave3.ISaveable"]]], [campaignDataInitial]] call cl_dave3_Campaign_constructor);


    _result = (_testCampaign select 1);


    [_result isEqualTo "Resistance - TANOA", "Campaign name not set correctly"] call Sqx_UnitTest_Assert_IsTrue; };


dave3_tests_CampaignTests_Given_CampaignDefinition_When_GettingSaveableData_Then_ExpectSameArray = { 
    private ["_testCampaign", "_result"];


    _testCampaign = ([[["dave3_Campaign",["dave3.ISaveable"]]], [campaignDataInitial]] call cl_dave3_Campaign_constructor);


    _result = ([_testCampaign, []] call cl_dave3_Campaign_getSaveableData);


    [_result isEqualTo campaignDataInitial, "Campaign not loading correctly"] call Sqx_UnitTest_Assert_IsTrue; };