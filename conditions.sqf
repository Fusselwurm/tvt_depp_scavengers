group_has_infiniLauncher = {
    private ["_players", "_result"];
    _players = units _this;
    _result = false;
    {
        if ("launch_RPG32_F" in weapons _x)  then {
            _result = true;
        }
    } forEach _players;
    _result
};

opfor_has_infiniLauncher = {
    private ["_result"];
    {
        if (side _x == east) then {
            _result = _x call group_has_infiniLauncher;
        }
    } forEach allGroups;
    _result
};