














cl_dave3_Region_regionName_PropIndex = 1;
cl_dave3_Region_towns_PropIndex = 2;
cl_dave3_Region_prisonCamps_PropIndex = 3;
cl_dave3_Region_gendarmeHQ_PropIndex = 4;


cl_dave3_Region_constructor = { private "_class_fields"; _class_fields = [["dave3_Region", ["dave3.ISaveable"]]];
    params ["_regionData"];


    _class_fields set [1, _regionData select 0];


    _class_fields set [3, []];
    {
        (_class_fields select 3) pushBack (([_x] call cl_dave3_PrisonCamp_constructor));
    } forEach (_regionData select 1);



    _class_fields set [4, ([[(_regionData select 2) select 0, (_class_fields select 1)]] call cl_dave3_GendarmeHQ_constructor)];


    _class_fields set [2, []];
    {
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

    _saveableData };