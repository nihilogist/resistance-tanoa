params ["_location"];

private _prisonCampShedClass = "Land_Metal_Shed_F";
private _prisonCampGateClass = "Land_Net_Fenc_Gate_F";
private _prisonCampSidewallClass = "Land_BackAlley_02_I_1m_F";

private _positionToSpawn = _location;

private _prisonCampShed = _prisonCampShedClass createVehicle (_positionToSpawn);
private _prisonCampWall1 = _prisonCampSidewallClass createVehicle (_positionToSpawn);
_prisonCampWall1 attachTo [_prisonCampShed];
private _prisonCampWall2 = _prisonCampSidewallClass createVehicle (_positionToSpawn);
_prisonCampWall2 attachTo [_prisonCampShed];
private _prisonCampGate = _prisonCampGateClass createVehicle (_positionToSpawn);
_prisonCampGate attachTo [_prisonCampShed];