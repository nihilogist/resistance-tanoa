// Script that spawns a given object onto a given marker, respecting the rotation of the marker.
// Returns the object that was spawned
params ["_objectClassName", "_markerName"];

private ["_objectToSpawn", "_positionToSpawnAt", "_directionToSpawn", "_objectSpawned"];

_objectToSpawn = _objectClassName;
_positionToSpawnAt = markerPos _markerName;
_directionToSpawn = markerDir _markerName;

_objectSpawned = _objectToSpawn createVehicle (_positionToSpawnAt);
_objectSpawned setDir _directionToSpawn;
_objectSpawned setPos getPos _objectSpawned;

_objectSpawned