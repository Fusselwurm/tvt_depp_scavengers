//* BLUFOR
//	* PRIM Opfor-Einheiten töten
//* OPFOR
//	* PRIM 30' in Basis aushalten
//	* SEC  exfiltrieren aufs Meer

private ["_flotsamCandidatePositions", "_forEachIndex"];

get_pos_by_id = {
	//xx = _this call objectFromNetId;
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
{
    _flotsamCandidatePositions set [_forEachIndex,  _x call get_pos_by_id];
} forEach flotsamCandidatePositionIds;

{
	crates set [_forEachIndex, _x call place_empty_crate];
} forEach _flotsamCandidatePositions;

magicCrate = crates select floor random count crates;
