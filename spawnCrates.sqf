//* BLUFOR
//	* PRIM Opfor-Einheiten töten
//* OPFOR
//	* PRIM 30' in Basis aushalten
//	* SEC  exfiltrieren aufs Meer

private ["_flotsamCandidatePositions", "_forEachIndex", "_crates", "_magicCrate"];

get_pos_by_id = {
	//xx = _this call objectFromNetId;
	//getPos xx
    xx = [0,0,0] nearestObject _this; 
    getPos xx
};

array_get_random = {
	private ["_input", "_number", "_output", "_i"];
	_input = + _this select 0;
	_number = _this select 1;
	_output = [];
	
	for [{_i = 0}, {_i < _number && (count _input) > 0}, {_i = _i + 1}] do {
		_output = _output + [_input select (floor random count _input)];
		_input = _input - _output;
	};
	_output
};

spawn_secret_weapon = {
	private ["_wh"];
	_wh = "groundWeaponHolder" createVehicle _this;
	_wh addMagazineCargo ["RPG32_F", 1];
	_wh addWeaponCargo ["launch_RPG32_F", 1];
};

place_empty_crate = {
    private ["_crate"];
    //_crate =  "Box_East_Wps_F" createVehicle _this;
	_crate =  "Land_Pallet_Milboxes_F" createVehicle _this;
    ClearWeaponCargo _crate; ClearMagazineCargo _crate; 
    _crate
};

magic_crate_action = {
	private ["_crate", "_magicCrate", "_player"];
	_crate = _this select 0;
	_magicCrate = _this select 3;
	_player = _this select 1;
	
	if (side _player != east) then {
		hint "Looks pretty normal to me. But then, I don't really know what to look for...";
	} else {
		if (_crate == _magicCrate) then {
			hint "Bingo. Look what we have...";
			(getPos _player) call spawn_secret_weapon;
			hint "Let's pick that up and get away from this island!";
			// trigger_opfor_retrieved_weapon
			
		} else {
			hint "This is not the crate we're looking for";            
		}
	}
};

add_crate_action = {
    _this addAction ["search crate",  magic_crate_action, _magicCrate];
};

flotsamCandidatePositionIds = [
    1550,1745,
    1514,1820,
    1887,1894,
    1890,
    1927,1980,
    2085,2061,
    2090,2150,
    2106,2156,
    3371,3388,
    4156,4168,
    4100,4146,
    4147,4179,
    4180,4612
];

flotsamCandidatePositionIds = [flotsamCandidatePositionIds, 10] call array_get_random;

_flotsamCandidatePositions = [];
_crates = [];

{
    _flotsamCandidatePositions set [_forEachIndex,  _x call get_pos_by_id];
} forEach flotsamCandidatePositionIds;

{
	_crates set [_forEachIndex, _x call place_empty_crate];
} forEach _flotsamCandidatePositions;

_magicCrate = _crates select floor random count _crates;

{
	_x call add_crate_action;   
} forEach _crates;