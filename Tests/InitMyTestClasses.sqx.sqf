


call compile preprocessFileLineNumbers "Tests\Example\ExampleTests.sqx.sqf";
call compile preprocessFileLineNumbers "Tests\resistance\regions\CampaignTests.sqx.sqf";
call compile preprocessFileLineNumbers "Tests\resistance\regions\MapDataTests.sqx.sqf";
call compile preprocessFileLineNumbers "Tests\resistance\regions\RegionTests.sqx.sqf";
call compile preprocessFileLineNumbers "Tests\resistance\regions\TownTests.sqx.sqf";





call dave3_tests_TownTests_Init;
call dave3_tests_RegionTests_Init;
call dave3_tests_MapDataTests_Init;
call dave3_tests_CampaignTests_Init;