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

// [group name, side]
_group = ["Group 1", civilian] call Lobby_fnc_createGroup;

// [slot name, group, (class name), (locally executed init script)]
["Unit Civ 1", _group] call Lobby_fnc_createSlot;
["Unit Civ 2", _group] call Lobby_fnc_createSlot;
["Unit Civ 3", _group] call Lobby_fnc_createSlot;

_group = ["Group 2", civilian] call Lobby_fnc_createGroup;

["Unit Civ 1", _group] call Lobby_fnc_createSlot;
["Unit Civ 2", _group] call Lobby_fnc_createSlot;
["Unit Civ 3", _group] call Lobby_fnc_createSlot;
["Unit Civ 4", _group] call Lobby_fnc_createSlot;
["Unit Civ 5", _group] call Lobby_fnc_createSlot;
["Unit Civ 6", _group] call Lobby_fnc_createSlot;
["Unit Civ 7", _group] call Lobby_fnc_createSlot;
["Unit Civ 8", _group] call Lobby_fnc_createSlot;

_group = ["Group Opfor 1", east] call Lobby_fnc_createGroup;

["Unit A1", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit A2", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit A3", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit A4", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit A5", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit A6", _group, "", _initScriptEast] call Lobby_fnc_createSlot;

_group = ["Group Opfor 2", east] call Lobby_fnc_createGroup;

["Unit B1", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit B2", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit B3", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit B4", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit B5", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit B6", _group, "", _initScriptEast] call Lobby_fnc_createSlot;

_group = ["Group Opfor 3", east] call Lobby_fnc_createGroup;

["Unit C1", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit C2", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit C3", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit C4", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit C5", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit C6", _group, "", _initScriptEast] call Lobby_fnc_createSlot;

_group = ["Group Opfor 4", east] call Lobby_fnc_createGroup;

["Unit D1", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit D2", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit D3", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit D4", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit D5", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit D6", _group, "", _initScriptEast] call Lobby_fnc_createSlot;

_group = ["Group Opfor 5", east] call Lobby_fnc_createGroup;

["Unit E1", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit E2", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit E3", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit E4", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit E5", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit E6", _group, "", _initScriptEast] call Lobby_fnc_createSlot;

_group = ["Group Opfor 6", east] call Lobby_fnc_createGroup;

["Unit F1", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit F2", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit F3", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit F4", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit F5", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit F6", _group, "", _initScriptEast] call Lobby_fnc_createSlot;

_group = ["Group Opfor 7", east] call Lobby_fnc_createGroup;

["Unit G1", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit G2", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit G3", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit G4", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit G5", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit G6", _group, "", _initScriptEast] call Lobby_fnc_createSlot;

_group = ["Group Opfor 8", east] call Lobby_fnc_createGroup;

["Unit H1", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit H2", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit H3", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit H4", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit H5", _group, "", _initScriptEast] call Lobby_fnc_createSlot;
["Unit H6", _group, "", _initScriptEast] call Lobby_fnc_createSlot;

_group = ["Group West 1", west] call Lobby_fnc_createGroup;

["Unit A1", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit A2", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit A3", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit A4", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit A5", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit A6", _group, "", _initScriptWest] call Lobby_fnc_createSlot;

_group = ["Group West 2", west] call Lobby_fnc_createGroup;

["Unit B1", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit B2", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit B3", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit B4", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit B5", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit B6", _group, "", _initScriptWest] call Lobby_fnc_createSlot;

_group = ["Group West 3", west] call Lobby_fnc_createGroup;

["Unit C1", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit C2", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit C3", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit C4", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit C5", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit C6", _group, "", _initScriptWest] call Lobby_fnc_createSlot;

_group = ["Group West 4", west] call Lobby_fnc_createGroup;

["Unit D1", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit D2", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit D3", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit D4", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit D5", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit D6", _group, "", _initScriptWest] call Lobby_fnc_createSlot;

_group = ["Group West 5", west] call Lobby_fnc_createGroup;

["Unit E1", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit E2", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit E3", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit E4", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit E5", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit E6", _group, "", _initScriptWest] call Lobby_fnc_createSlot;

_group = ["Group West 6", west] call Lobby_fnc_createGroup;

["Unit F1", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit F2", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit F3", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit F4", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit F5", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
["Unit F6", _group, "", _initScriptWest] call Lobby_fnc_createSlot;
