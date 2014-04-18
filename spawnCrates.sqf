//* BLUFOR
//	* PRIM Opfor-Einheiten töten
//* OPFOR
//	* PRIM 30' in Basis aushalten
//	* SEC  exfiltrieren aufs Meer
private ["_flotsamCandidatePositions", "_pos"];

getPosById = {
    xx = [0,0,0] nearestObject _this; 
    getPos xx
};

place_empty_crate = {
    private ["_crate"];
    _crate =  "Box_East_Wps_F" createVehicle _this;
    ClearWeaponCargo _crate; ClearMagazineCargo _crate; 
    _crate
};

add_crate_action = {
    _this addAction ["search crate",  ""];
};

flotsamCandidatePositionIds = [
    1550,1745,
    1514,1820,
    1887,1894,
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

_flotsamCandidatePositions = [];

{
    _pos = _x call getPosById;
    _flotsamCandidatePositions set [_forEachIndex, _pos];
} forEach flotsamCandidatePositionIds;

{
    (_x call place_empty_crate) call add_crate_action;
} forEach _flotsamCandidatePositions;


