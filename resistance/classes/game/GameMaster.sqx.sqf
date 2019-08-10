













cl_dave3_GameMaster_isRunning_PropIndex = 2;




cl_dave3_GameMaster_constructor = { params ["_class_fields", "_this"];

    _class_fields set [1, 60]; _class_fields };


cl_dave3_GameMaster_run = { params ["_class_fields", "_this"];
    while { (_class_fields select 2) } do {
        waitUntil {
            sleep (_class_fields select 1);
            true };


        ["Main game state evaluation called."] call logger; }; };



cl_dave3_GameMaster_startGameMasterAsync = { params ["_class_fields", "_this"];
    _class_fields set [2, true];
    ([_class_fields, []] spawn cl_dave3_GameMaster_run); };