// script to determine if a log statement should be shown based on logging config
params ["_logLevel"];

/* Order of logging levels is:
*  DEBUG - lowest level debug data
*  INFO  - Information level debug data
*  LOG   - standard level debug data
*  ERROR - error logging
*/

if (_logLevel isEqualTo "ERROR") then {
	true
} else {
	if (_logLevel isEqualTo "LOG") then {
		if (logLevel < 4) then {true} else {false};
	};
	
	if (_logLevel isEqualTo "INFO") then {
		if (logLevel < 3) then {true} else {false};
	};
	
	if (_logLevel isEqualTo "DEBUG") then {
		if (logLevel < 2) then {true} else {false};
	};
 
};
true
