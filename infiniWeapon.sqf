private ["_weaponId", "_magazineId"];

_weaponId = _this select 0;
_magazineId = _this select 1;

infiniWeapon_onFire = {
    private ["_weaponFired"];
    _weaponFired = _this select 1;

	if (_weaponFired == _weaponId) then {
		[] spawn {
			for "_x" from 1 to 6 do {
				playSound "electricity_loop"; 
				sleep 5;
			};
			player addMagazine _magazineId; 
		};
	} else {
		hint format ["you fired %1", _weaponFired];
	};
};

player addEventHandler["fired", infiniWeapon_onFire];  
