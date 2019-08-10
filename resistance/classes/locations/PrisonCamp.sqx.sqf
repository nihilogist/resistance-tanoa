













cl_dave3_PrisonCamp_locationMarker_PropIndex = 2;




cl_dave3_PrisonCamp_constructor = { params ["_class_fields", "_this"];
    params ["_prisonCampData"];


    _class_fields set [2, _prisonCampData select 0]; _class_fields };



cl_dave3_PrisonCamp_getSaveableData = { params ["_class_fields", "_this"];
    private ["_prisonCampData"];

    _prisonCampData = [(_class_fields select 2)];

    _prisonCampData };



cl_dave3_PrisonCamp_spawnPhysrep = { params ["_class_fields", "_this"];
    private ["_prisonCampShedClass", "_prisonCampGateClass", "_prisonCampSidewallClass", "_positionToSpawn"];

    _prisonCampShedClass = "Land_Metal_Shed_F";
    _prisonCampGateClass = "Land_Net_Fence_Gate_F";
    _prisonCampSidewallClass = "Land_BackAlley_02_l_1m_F";


    _positionToSpawn = markerPos (_class_fields select 2);


    _class_fields set [1, [_prisonCampShedClass, (_class_fields select 2)] call spawnObjectAtMarker];


    private _prisonCampWall1 = _prisonCampSidewallClass createVehicle (_positionToSpawn);
    _prisonCampWall1 attachTo [(_class_fields select 1), [5.2, -1.8, 0]];
    _prisonCampWall1 setVectorDirAndUp [[-1, 0, 0], [0, 0, 1]];


    private _prisonCampWall2 = _prisonCampSidewallClass createVehicle (_positionToSpawn);
    _prisonCampWall2 attachTo [(_class_fields select 1), [-5.2, -1.8, 0]];
    _prisonCampWall2 setVectorDirAndUp [[1, 0, 0], [0, 0, 1]];

    private _prisonCampGate = _prisonCampGateClass createVehicle (_positionToSpawn);
    _prisonCampGate attachTo [(_class_fields select 1), [0, 0.8, 0]];
    _prisonCampGate setVectorDirAndUp [[0, -1, 0], [0, 0, 1]]; };



cl_dave3_PrisonCamp_removePhysrep = { params ["_class_fields", "_this"]; };