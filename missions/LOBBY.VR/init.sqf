// EDIT THIS EDIT THIS EDIT THIS EDIT THIS
_initScriptWest = {
    params ["_unit"];
    _unit setUnitLoadout "B_soldier_F";
    _unit setPos [100,100,0];
};

_initScriptEast = {
    params ["_unit"];
    _unit setUnitLoadout "O_soldier_F";
    _unit setPos [-100,100,0];
};

/*[group name, side]*/
_group = ["Group 1", west] call Lobby_fnc_createGroup;

/*[slot name, group, class name, local init script]*/
["Unit 1", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit 2", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit 3", _group, "", _initScriptWest] call Lobby_fnc_createSlot;

_group = ["Group 2", west] call Lobby_fnc_createGroup;

["Unit A1", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit A2", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit A3", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit A4", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit A5", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit A6", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit A7", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit A8", _group, "", _initScriptWest] call Lobby_fnc_createSlot;

_group = ["Group Opfor 1", east] call Lobby_fnc_createGroup;

["Unit A1", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit A2", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit A3", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit A4", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit A5", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit A6", _group, "", _initScriptEast] call Lobby_fnc_createSlot;

_group = ["Group Opfor 2", east] call Lobby_fnc_createGroup;

["Unit A1", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit A2", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit A3", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit A4", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit A5", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit A6", _group, "", _initScriptEast] call Lobby_fnc_createSlot;

_group = ["Group Opfor 3", east] call Lobby_fnc_createGroup;

["Unit A1", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit A2", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit A3", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit A4", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit A5", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit A6", _group, "", _initScriptEast] call Lobby_fnc_createSlot;

_group = ["Group Opfor 4", east] call Lobby_fnc_createGroup;

["Unit A1", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit A2", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit A3", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit A4", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit A5", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit A6", _group, "", _initScriptEast] call Lobby_fnc_createSlot;

_group = ["Group Opfor 5", east] call Lobby_fnc_createGroup;

["Unit A1", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit A2", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit A3", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit A4", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit A5", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit A6", _group, "", _initScriptEast] call Lobby_fnc_createSlot;

_group = ["Group Opfor 6", east] call Lobby_fnc_createGroup;

["Unit A1", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit A2", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit A3", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit A4", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit A5", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit A6", _group, "", _initScriptEast] call Lobby_fnc_createSlot;

_group = ["Group Opfor 7", east] call Lobby_fnc_createGroup;

["Unit A1", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit A2", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit A3", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit A4", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit A5", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit A6", _group, "", _initScriptEast] call Lobby_fnc_createSlot;

_group = ["Group Opfor 8", east] call Lobby_fnc_createGroup;

["Unit A1", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit A2", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit A3", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit A4", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit A5", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit A6", _group, "", _initScriptEast] call Lobby_fnc_createSlot;

_group = ["Group West 1", west] call Lobby_fnc_createGroup;

["Unit A1", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit A2", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit A3", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit A4", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit A5", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit A6", _group, "", _initScriptWest] call Lobby_fnc_createSlot;

_group = ["Group West 2", west] call Lobby_fnc_createGroup;

["Unit A1", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit A2", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit A3", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit A4", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit A5", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit A6", _group, "", _initScriptWest] call Lobby_fnc_createSlot;

_group = ["Group West 3", west] call Lobby_fnc_createGroup;

["Unit A1", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit A2", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit A3", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit A4", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit A5", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit A6", _group, "", _initScriptWest] call Lobby_fnc_createSlot;

_group = ["Group West 4", west] call Lobby_fnc_createGroup;

["Unit A1", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit A2", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit A3", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit A4", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit A5", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit A6", _group, "", _initScriptWest] call Lobby_fnc_createSlot;

_group = ["Group West 5", west] call Lobby_fnc_createGroup;

["Unit A1", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit A2", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit A3", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit A4", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit A5", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit A6", _group, "", _initScriptWest] call Lobby_fnc_createSlot;

_group = ["Group West 6", west] call Lobby_fnc_createGroup;

["Unit A1", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit A2", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit A3", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit A4", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit A5", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit A6", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
