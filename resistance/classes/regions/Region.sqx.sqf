














cl_dave3_Region_regionName_PropIndex = 1;
cl_dave3_Region_towns_PropIndex = 2;
cl_dave3_Region_prisonCamps_PropIndex = 3;
cl_dave3_Region_gendarmeHQ_PropIndex = 4;


cl_dave3_Region_constructor = { private "_class_fields"; _class_fields = [["dave3_Region", ["dave3.ISaveable"]]];
    params ["_regionData"];


    _class_fields set [1, _regionData select 0];
    [["Initialising Region ", (_class_fields select 1)] joinString ""] call logger;


    [["Initialising Region ", (_class_fields select 1), "'s Prison Camps"] joinString ""] call logger;
    _class_fields set [3, []];
    {
        [["Reading data for prison camp ", _x] joinString ""] call logger;
        (_class_fields select 3) pushBack (([_x] call cl_dave3_PrisonCamp_constructor));
    } forEach (_regionData select 1);



    [["Initialising Region ", (_class_fields select 1), "'s Gendarme HQ at ", _regionData select 2] joinString ""] call logger;
    _class_fields set [4, ([_regionData select 2] call cl_dave3_GendarmeHQ_constructor)];
    ([(_class_fields select 4), [_class_fields]] call cl_dave3_GendarmeHQ_setRegion);


    [["Initialising Region ", (_class_fields select 1), "'s Towns"] joinString ""] call logger;
    _class_fields set [2, []];
    {
        [["Reading data for town ", _x] joinString ""] call logger;
        (_class_fields select 2) pushBack (([_x] call cl_dave3_Town_constructor));
    } forEach (_regionData select 3); _class_fields };




cl_dave3_Region_getSaveableData = { params ["_class_fields", "_this"];
    private ["_saveableData", "_gendarmeHQ", "_prisonCamps", "_towns"];
    _gendarmeHQ = (_class_fields select 4);

    _prisonCamps = [];
    {
        _prisonCamps pushBack (([_x, []] call cl_dave3_PrisonCamp_getSaveableData));
    } forEach (_class_fields select 3);

    _towns = [];
    {
        _towns pushBack (([_x, []] call cl_dave3_Town_getSaveableData));
    } forEach (_class_fields select 2);

    _saveableData = [(
    _class_fields select 1), 
    _prisonCamps, 
    ([_gendarmeHQ, []] call cl_dave3_GendarmeHQ_getSaveableData), 
    []];

    [["REGION: Save data generated as: ", _saveableData] joinString ""] call logger;
    _saveableData };