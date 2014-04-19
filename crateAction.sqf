
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
    _this addAction ["search crate",  magic_crate_action, magicCrate];
};

{
	_x call add_crate_action;   
} forEach crates;