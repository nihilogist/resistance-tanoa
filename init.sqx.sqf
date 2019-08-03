call compile preprocessFileLineNumbers "resistance\classes\locations\PrisonCamp.sqx.sqf";
call compile preprocessFileLineNumbers "resistance\classes\regions\Region.sqx.sqf";



private ["_region"];

sleep 3;

_region = (["Balavu Region", ["locationBalavuPrisonCamp01", "locationBalavuPrisonCamp02", "locationBalavuPrisonCamp03"]] call cl_dave3_Region_constructor);