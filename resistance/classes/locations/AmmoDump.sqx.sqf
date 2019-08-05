
















cl_dave3_AmmoDump_constructor = { private "_class_fields"; _class_fields = [["dave3_AmmoDump", ["dave3.ISaveable"]]];
    params ["_ammoDumpData"];

    _class_fields set [1, "Box_FIA_Support_F"];


    [["Spawning ammunition crate at ", (_ammoDumpData select 0)] joinString ""] call logger;
    _class_fields set [2, (_class_fields select 1) createVehicle (_ammoDumpData select 0)]; _class_fields };




cl_dave3_AmmoDump_getSaveableData = { params ["_class_fields", "_this"];
    private ["_saveableData"];

    _saveableData = [
    getPos (_class_fields select 2)];


    _saveableData };