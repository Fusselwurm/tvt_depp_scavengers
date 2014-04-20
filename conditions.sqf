get_infiniLauncher_owner = {
    private ["_result"];
	_result = objNull;
	{
		if (secretWeaponID in weapons _x)  then {
			_result = _x;
		}
	} forEach allUnits;
    _result
};

opfor_has_infiniLauncher = {
    private ["_result", "_currentOwner"];
	_result = false;
	_currentOwner = [] call get_infiniLauncher_owner;
	if (not (isNull _currentOwner)) then {
		if (side _currentOwner == east) then {
			_result = true;
		}
	};

	_result
};

opfor_has_won_in_trigger = {
    private ["_trigger", "_launcher_owner", "_result"];
	_result = false;
	_trigger = _this;
	_launcher_owner = [] call get_infiniLauncher_owner;

	if (not (isNull _launcher_owner) && (side _launcher_owner == east)) then {
		_result = [_trigger, getPos _launcher_owner] call BIS_fnc_inTrigger;
	};

	_result
};
