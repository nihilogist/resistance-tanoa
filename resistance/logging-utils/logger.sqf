// Outputs logging statements
params ["_logStatement", ["_logLevel", "LOG"]];
if (debug && isServer) then {

	_shouldShowLog = [_logLevel] call shouldShowLog;
	if (_shouldShowLog) then {
		_serverTime = [serverTime, "HH:MM:SS:MM"] call BIS_fnc_timeToString;

		_logOutput = [_serverTime, ": ", _logLevel, ": ", "RESISTANCELOG ", _logStatement] joinString "";
		[_logOutput] remoteExec ["systemChat"];	
	};
	
};