secretWeaponID = "launch_RPG_32_F";

[] execVM "conditions.sqf";
[] execVM "spawnCrates.sqf";

if (side player != east) then {
	"marker_opfor_extract" setMarkerAlphaLocal 0;
	"marker_opfor_objective_1" setMarkerAlphaLocal 0;
	"marker_opfor_objective_2" setMarkerAlphaLocal 0;
	"marker_opfor_objective_3" setMarkerAlphaLocal 0;
};