
















cl_dave3_AmmoDump_constructor = { private "_class_fields"; _class_fields = [["dave3_AmmoDump", ["dave3.ISaveable"]]];
    params ["_ammoDumpData"];
    private ["_position", "_direction", "_weaponContents", "_magazineContents"];

    ([missionLogger, [["AMMODUMP: received cache state data as: ", _ammoDumpData], 4]] call cl_dave3_LoggerUtil_logMessage);

    _class_fields set [1, "Box_FIA_Support_F"];
    _position = _ammoDumpData select 0;
    _direction = _ammoDumpData select 1;
    _weaponContents = _ammoDumpData select 2;
    _magazineContents = _ammoDumpData select 3;


    _class_fields set [2, (_class_fields select 1) createVehicle (_position)];
    (_class_fields select 2) setDir _direction;
    (_class_fields select 2) setPos getPos (_class_fields select 2);

    clearItemCargoGlobal (_class_fields select 2);
    clearBackpackCargoGlobal (_class_fields select 2);
    clearMagazineCargoGlobal (_class_fields select 2);
    clearWeaponCargoGlobal (_class_fields select 2);

    ([_class_fields, [_weaponContents select 0, _weaponContents select 1]] call cl_dave3_AmmoDump_addWeaponsToCache);
    ([_class_fields, [_magazineContents select 0, _magazineContents select 1]] call cl_dave3_AmmoDump_addMagazinesToCache); _class_fields };




cl_dave3_AmmoDump_getSaveableData = { params ["_class_fields", "_this"];
    private ["_saveableData"];

    _saveableData = [
    getPos (_class_fields select 2), 
    getDir (_class_fields select 2), 
    getWeaponCargo (_class_fields select 2), 
    getMagazineCargo (_class_fields select 2)];


    _saveableData };


cl_dave3_AmmoDump_addWeaponsToCache = { params ["_class_fields", "_this"]; params ["_itemList", "_itemQuantity"]; 
    for "_i" from 0 to (count _itemList) do {
        (_class_fields select 2) addWeaponCargoGlobal [_itemList select _i, _itemQuantity select _i]; }; };



cl_dave3_AmmoDump_addMagazinesToCache = { params ["_class_fields", "_this"]; params ["_itemList", "_itemQuantity"]; 
    for "_i" from 0 to (count _itemList) do {
        (_class_fields select 2) addMagazineCargoGlobal [_itemList select _i, _itemQuantity select _i]; }; };