
















cl_dave3_AmmoDump_constructor = { private "_class_fields"; _class_fields = [["dave3_AmmoDump", ["dave3.ISaveable"]]];
    params ["_ammoDumpData"];
    private ["_position", "_direction", "_weaponContents", "_magazineContents", "_backpackContents", "_itemContents"];

    ([missionLogger, [["AMMODUMP: received cache state data as: ", _ammoDumpData], 4]] call cl_dave3_LoggerUtil_logMessage);

    _class_fields set [1, "Box_FIA_Support_F"];
    _position = _ammoDumpData select 0;
    _direction = _ammoDumpData select 1;
    _weaponContents = _ammoDumpData select 2;
    _magazineContents = _ammoDumpData select 3;
    _backpackContents = _ammoDumpData select 4;
    _itemContents = _ammoDumpData select 5;


    _class_fields set [2, (_class_fields select 1) createVehicle (_position)];
    (_class_fields select 2) setDir _direction;
    (_class_fields select 2) setPos getPos (_class_fields select 2);

    clearItemCargoGlobal (_class_fields select 2);
    clearBackpackCargoGlobal (_class_fields select 2);
    clearMagazineCargoGlobal (_class_fields select 2);
    clearWeaponCargoGlobal (_class_fields select 2);

    ([_class_fields, [_weaponContents select 0, _weaponContents select 1]] call cl_dave3_AmmoDump_addWeaponsToCache);
    ([_class_fields, [_magazineContents select 0, _magazineContents select 1]] call cl_dave3_AmmoDump_addMagazinesToCache);
    ([_class_fields, [_backpackContents select 0, _backpackContents select 1]] call cl_dave3_AmmoDump_addBackpacksToCache);
    ([_class_fields, [_itemContents select 0, _itemContents select 1]] call cl_dave3_AmmoDump_addItemsToCache); _class_fields };




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



cl_dave3_AmmoDump_addBackpacksToCache = { params ["_class_fields", "_this"]; params ["_itemList", "_itemQuantity"]; 
    for "_i" from 0 to (count _itemList) do {
        (_class_fields select 2) addBackpackCargoGlobal [_itemList select _i, _itemQuantity select _i]; }; };



cl_dave3_AmmoDump_addItemsToCache = { params ["_class_fields", "_this"]; params ["_itemList", "_itemQuantity"]; 
    for "_i" from 0 to (count _itemList) do {
        (_class_fields select 2) addItemCargoGlobal [_itemList select _i, _itemQuantity select _i]; }; };