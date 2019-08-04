













cl_dave3_MarkerUtils_constructor = { private "_class_fields"; _class_fields = [["dave3_MarkerUtils", []]]; _class_fields };


cl_dave3_MarkerUtils_getRandomPositionInMarker = { params ["_class_fields", "_this"];
    params ["_markerName"];

    [_markerName, nil, nil] call BIS_fnc_randomPos };