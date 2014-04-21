infiniWeaponID = "launch_RPG32_F";
infiniWeaponMagazineID = "RPG32_F";

if (side player != east) then {
	"marker_opfor_extract" setMarkerAlphaLocal 0;
	"marker_opfor_objective_1" setMarkerAlphaLocal 0;
	"marker_coast_area" setMarkerAlphaLocal 0;
	"marker_opfor_objective_3" setMarkerAlphaLocal 0;
};

if (isServer) then {
	[] execVM "spawnCrates.sqf";
	
	crates = true;
	publicVariable "crates";	
};

if (isNil("crates")) then {
	"crates" addPublicVariableEventHandler {[] execVM "crateAction.sqf";};
} else {
	[] execVM "crateAction.sqf";
};

[] execVM "conditions.sqf";
[infiniWeaponID, infiniWeaponMagazineID] execVM "infiniWeapon.sqf";
