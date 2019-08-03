call compile preprocessFileLineNumbers "resistance\classes\compile-all-classes.sqx.sqf";



sleep 3;

{
    _regionName = _x select 0;
    _regionMilitarisation = _x select 1;
    _regionPrisonCampLocations = _x select 2;
    _regionGendarmeHQ = _x select 3;
    ([_regionName, _regionMilitarisation, _regionPrisonCampLocations, _regionGendarmeHQ] call cl_dave3_Region_constructor);
} forEach regions;