private ["_crates"];

_crates = nearestObjects [getMarkerPos "marker_coast_area", ["Land_Pallet_Milboxes_F"], 1000];

spawn_secret_weapon = {
	private ["_wh"];
	_wh = "groundWeaponHolder" createVehicle _this;
	_wh addMagazineCargoGlobal [secretWeaponMagazineID, 1];
	_wh addWeaponCargoGlobal [secretWeaponID, 1];
};

magic_crate_action = {
	private ["_crate", "_isMagicCrate", "_player"];
	_crate = _this select 0;
	_isMagicCrate = _crate getVariable ["magic", -1];
	_player = _this select 1;

	if (side _player != east) then {
		hint "Looks pretty normal to me. But then, I wouldn't really know what to look for...";
	} else {
		switch (_isMagicCrate) do {
			case -1: {
				hint "I... don't know what to think of that. Let's have another look later...";
			};
			case 0: {
				hint "This is not the crate we're looking for";
			};
			case 1: {
				_crate setVariable ["magic", 2, true];
				hint "Bingo. Look what we have...";
				(getPos _player) call spawn_secret_weapon;
				hint "Let's pick that up and get away from this island!";
			};
			case 2: {
				hint "This crate was searched. It's either lying around here, or somebody picked it up already.";
			};

		};
	}
};

add_crate_action = {
    _this addAction ["search crate",  magic_crate_action];
};

{
	_x call add_crate_action;
} forEach _crates;

hint str (count _crates);