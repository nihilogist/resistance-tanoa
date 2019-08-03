// Game Manager is the master loop that manages gameplay.
// It checks every 60 seconds to determine if the players have won or lost.

while {true} do {

	waitUntil {
		sleep gameplayLoopDuration;
		true
	};

	hint "Executing Gameplay Loop";

};