call compile preprocessFileLineNumbers "Sqx\UnitTest\TestEngine\Assert.sqx.sqf";
call compile preprocessFileLineNumbers "Sqx\UnitTest\TestEngine\TestUnit.sqx.sqf";
call compile preprocessFileLineNumbers "Sqx\UnitTest\TestEngine\TestEngine.sqx.sqf";


call Sqx_UnitTest_TestEngine_Init;


call compile preprocessFileLineNumbers "Tests\InitMyTestClasses.sqx.sqf";