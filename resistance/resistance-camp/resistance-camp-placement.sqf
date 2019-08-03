params ["_location"];

private _campTable = "Land_CampingTable_Small_F";
private _campMap = "Land_Map_Tanoa_F";

private _positionToSpawn = _location;

_baseTable = _campTable createVehicle (_positionToSpawn);
_baseMap = _campMap createVehicle (_positionToSpawn);
_baseMap attachTo [_baseTable, [0.15,0,0.41] ];

if (isServer) then {
	[_baseMap, ["Review Intel", {[] call reviewIntelligenceAction}, [], 10, true, true, "", "true", 3]] remoteExec ["addAction"];
};

