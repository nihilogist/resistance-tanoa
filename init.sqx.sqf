call compile preprocessFileLineNumbers "resistance\interfaces\compile-all-interfaces.sqx.sqf";
call compile preprocessFileLineNumbers "resistance\classes\compile-all-classes.sqx.sqf";

call compile preprocessFileLineNumbers "Sqx\UnitTest\Init.sqx.sqf" call compile preprocessFileLineNumbers "resistance\tests\compile-all-tests.sqx.sqf";



private ["_saveManager", "_gameMaster", "_savedWorldData"];

sleep 3;




missionLogger = ([[["dave3_LoggerUtil",[]]], [3]] call cl_dave3_LoggerUtil_constructor);
([missionLogger, [["---"], 3]] call cl_dave3_LoggerUtil_logMessage);
([missionLogger, [["---"], 3]] call cl_dave3_LoggerUtil_logMessage);
([missionLogger, [["---"], 3]] call cl_dave3_LoggerUtil_logMessage);
([missionLogger, [["---"], 3]] call cl_dave3_LoggerUtil_logMessage);
([missionLogger, [["---"], 3]] call cl_dave3_LoggerUtil_logMessage);
([missionLogger, [["Logger initialised"], 3]] call cl_dave3_LoggerUtil_logMessage);
([missionLogger, [["---"], 3]] call cl_dave3_LoggerUtil_logMessage);
([missionLogger, [["---"], 3]] call cl_dave3_LoggerUtil_logMessage);
([missionLogger, [["---"], 3]] call cl_dave3_LoggerUtil_logMessage);
([missionLogger, [["---"], 3]] call cl_dave3_LoggerUtil_logMessage);
([missionLogger, [["---"], 3]] call cl_dave3_LoggerUtil_logMessage);

if (testBuild) then {
    call Sqx_UnitTest_TestEngine_RunDelayedAsync;
    sleep 10; };



_saveManager = ([[["dave3_SaveManager",[]]], [nukeTheSave, saveGameName, 30]] call cl_dave3_SaveManager_constructor);
_gameMaster = ([[["dave3_GameMaster",[]]], []] call cl_dave3_GameMaster_constructor);


_savedWorldData = ([_saveManager, []] call cl_dave3_SaveManager_getSavedData);


([missionLogger, [["INIT: Parsing saved world data", _savedWorldData], 3]] call cl_dave3_LoggerUtil_logMessage);


if (count _savedWorldData == 0) then {
    ([missionLogger, [["INIT: No campaign data in save file."], 2]] call cl_dave3_LoggerUtil_logMessage);
    _savedWorldData = [campaignDataInitial]; } else { 

    ([missionLogger, [["INIT: Selecting campaign data from save file"], 3]] call cl_dave3_LoggerUtil_logMessage); };


([missionLogger, [["INIT: Using data to construct campaign state: ", _savedWorldData], 3]] call cl_dave3_LoggerUtil_logMessage);
theWorld = ([[["dave3_Campaign",["dave3.IBuildable", "dave3.ISaveable"]]], _savedWorldData] call cl_dave3_Campaign_constructor);

sleep 5;

([missionLogger, [["INIT: Building world from save and spawning physreps."], 3]] call cl_dave3_LoggerUtil_logMessage);
([theWorld, []] call cl_dave3_Campaign_build);


([_saveManager, [theWorld]] call cl_dave3_SaveManager_setWorldToSave);
([_saveManager, []] call cl_dave3_SaveManager_requestSave);
([_saveManager, []] call cl_dave3_SaveManager_RunAsync);
([_saveManager, []] call cl_dave3_SaveManager_runAutosaveAsync);



sleep 10;


([_gameMaster, []] call cl_dave3_GameMaster_startGameMasterAsync);