















cl_dave3_PrisonCamp_constructor = { private "_class_fields"; _class_fields = [["dave3_PrisonCamp", []]];
    params ["_locationMarker"];
    private ["_prisonCampShedClass", "_prisonCampGateClass", "_prisonCampSidewallClass", "_positionToSpawn", "_directionToSpawn", "_prisonCampShed"];


    _prisonCampShedClass = "Land_Metal_Shed_F";
    _prisonCampGateClass = "Land_Net_Fence_Gate_F";
    _prisonCampSidewallClass = "Land_BackAlley_02_l_1m_F";


    _class_fields set [1, _locationMarker];
    _positionToSpawn = markerPos (_class_fields select 1);


    _prisonCampShed = [_prisonCampShedClass, (_class_fields select 1)] call spawnObjectAtMarker;


    private _prisonCampWall1 = _prisonCampSidewallClass createVehicle (_positionToSpawn);
    _prisonCampWall1 attachTo [_prisonCampShed, [5.2, -1.8, 0]];
    _prisonCampWall1 setVectorDirAndUp [[-1, 0, 0], [0, 0, 1]];


    private _prisonCampWall2 = _prisonCampSidewallClass createVehicle (_positionToSpawn);
    _prisonCampWall2 attachTo [_prisonCampShed, [-5.2, -1.8, 0]];
    _prisonCampWall2 setVectorDirAndUp [[1, 0, 0], [0, 0, 1]];

    private _prisonCampGate = _prisonCampGateClass createVehicle (_positionToSpawn);
    _prisonCampGate attachTo [_prisonCampShed, [0, 0.8, 0]];
    _prisonCampGate setVectorDirAndUp [[0, -1, 0], [0, 0, 1]]; _class_fields };