// Game Manager is the master loop that manages gameplay.
// It checks every 60 seconds to determine if the players have won or lost.

while {true} do {

	waitUntil {
		sleep gameplayLoopDuration;
		true
	};
	
	["Executing gameplay loop update"] call logger;

	if ((random 10) > 8) then {
		popularSupport = popularSupport + 1;
	};
	
	if ((random 10) < 2) then {
		popularSupport = popularSupport - 1;
	};

};