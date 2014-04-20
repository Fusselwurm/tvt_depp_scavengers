
infiniLauncher_onFire = {
    private ["_weaponFired"];
    _weaponFired = _this select 1;

	if (_weaponFired == secretWeaponID) then {
		[] spawn {
			for "_x" from 1 to 6 do {
				playSound "electricity_loop"; 
				sleep 5;
			};
			player addMagazine secretWeaponMagazineID; 
		};
	} else {
		hint format ["you fired %1", _weaponFired];
	};
};

player addEventHandler["fired", infiniLauncher_onFire];  
