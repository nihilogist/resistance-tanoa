call compile preprocessFileLineNumbers "resistance\classes\compile-all-classes.sqx.sqf";



sleep 3;



_worldName = worldData select 0;
_worldRegions = worldData select 1;


([[_worldName, _worldRegions]] call cl_dave3_WorldRegions_constructor);