//* BLUFOR
//	* PRIM Opfor-Einheiten töten
//* OPFOR
//	* PRIM 30' in Basis aushalten
//	* SEC  exfiltrieren aufs Meer

private ["_flotsamCandidatePositions", "_forEachIndex", "_crate", "_crates", "_magicCrate"];

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


place_empty_crate = {
    private ["_crate"];
	_crate = "Land_Pallet_Milboxes_F" createVehicle _this;
	_crate setVariable ["magic", 0, true];
    ClearWeaponCargo _crate; ClearMagazineCargo _crate; 
    _crate
};

flotsamCandidatePositionIds = [
	1820, 1887, 1890, 1894,
	1927,1980,
	2085,2061, 2090,
	2106, 2150, 2156,
	2173,
	3371, 3388,
	4001, 4006, 4012, 4070,
	4100, 4146, 4147, 4156, 4168, 4179, 4180,

	4612, 4623,
	6521, 6574,
	6606
];

flotsamCandidatePositionIds = [flotsamCandidatePositionIds, 10] call array_get_random;

_flotsamCandidatePositions = [];
{
    _flotsamCandidatePositions set [_forEachIndex,  _x call get_pos_by_id];
} forEach flotsamCandidatePositionIds;

_crates = [];
{
	_crate = _x call place_empty_crate;
	_crates set [_forEachIndex, _crate];

} forEach _flotsamCandidatePositions;

_magicCrate = _crates select floor random count _crates;
_magicCrate setVariable ["magic", 1, true];
