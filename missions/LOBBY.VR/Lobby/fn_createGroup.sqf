#include "script_component.hpp"

params [
    ["_name", "", [""]],
    ["_side", sideEmpty, [west]]
];

private _group = "";

if (_name isEqualTo "") exitWith {
    "Name cannot be empty" call BIS_fnc_error;
    _group
};

if !(_side in [west, east, resistance, civilian]) exitWith {
    "Invalid side" call BIS_fnc_error;
    _group
};

_group = GROUP_CREATE;

SETVAR(_group,name,_name);
SETVAR(_group,side,_side);

Lobby_updateSlots = true;

_group
