// Game Manager is the master loop that manages gameplay.
// It checks every 60 seconds to determine if the players have won or lost.

while {!gameIsOver} do {

	waitUntil {
		sleep gameplayLoopDuration;
		true
	};
	
	//["Executing gameplay loop update"] call logger;

	if ((random 10) > 8) then {
		governmentStability = governmentStability + 1;
	//	["Government stability increased"] call logger;
	};
	
	if ((random 10) < 2) then {
		governmentStability = governmentStability - 1;
	//	["Government stability decreased"] call logger;
	};
	
	if (governmentStability < 10) then {
	//	["Government stability critical!"] call logger;
		gameIsOver = true;
	};

};