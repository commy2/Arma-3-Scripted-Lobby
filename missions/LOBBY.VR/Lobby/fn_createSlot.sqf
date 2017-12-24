#include "script_component.hpp"

params [
    ["_name", "", [""]],
    ["_group", "", [""]]
];

private _slot = "";

if (_name isEqualTo "") exitWith {
    "Name cannot be empty" call BIS_fnc_error;
    _slot
};

if (_group isEqualTo "") exitWith {
    "Group does not exist" call BIS_fnc_error;
    _slot
};

_slot = SLOT_CREATE(_group);

SETVAR(_slot,name,_name);
SETVAR(_slot,group,_group);

Lobby_updateSlots = true;

_slot
