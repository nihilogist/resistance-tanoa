params ["_location"];

private _campTable = "Land_CampingTable_Small_F";
private _campMap = "Land_Map_Tanoa_F";

private _positionToSpawn = _location;

_base = _campTable createVehicle (_positionToSpawn);