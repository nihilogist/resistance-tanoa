// Performs one-time mission configuration scripts
[] call compileFinal preprocessFileLineNumbers "resistance\mission-config\variables-config.sqf";
[] call compileFinal preprocessFileLineNumbers "resistance\mission-config\unit-config\civilian-config.sqf";