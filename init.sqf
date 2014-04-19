secretWeaponID = "launch_RPG_32_F";

crates = [];
magicCrate = nullObj;

if (side player != east) then {
	"marker_opfor_extract" setMarkerAlphaLocal 0;
	"marker_opfor_objective_1" setMarkerAlphaLocal 0;
	"marker_opfor_objective_2" setMarkerAlphaLocal 0;
	"marker_opfor_objective_3" setMarkerAlphaLocal 0;
};

if (isServer) then {
	[] execVM "spawnCrates.sqf";
	[] execVM "conditions.sqf";
	
	publicVariable "crates";
	publicVariable "magicCrate";
} else {
	sleep 5;
	[] execVM "crateAction.sqf";
};
