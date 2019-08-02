[] call compileFinal preprocessFileLineNumbers "resistance\locations\locations.sqf";
spawnBase = compileFinal preprocessFileLineNumbers "resistance\resistance-camp\resistance-camp-placement.sqf";


execVM "resistance\save-manager\save-manager.sqf";




[markerPos ((bases select 0) select 1)] call spawnBase;