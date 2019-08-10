













cl_dave3_MarkerUtils_constructor = { params ["_class_fields", "_this"]; _class_fields };


cl_dave3_MarkerUtils_getRandomPositionInMarker = { params ["_class_fields", "_this"];
    params ["_markerName"];

    [_markerName, nil, nil] call BIS_fnc_randomPos };