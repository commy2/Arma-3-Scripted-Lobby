/* ----------------------------------------------------------------------------
Function: Lobby_fnc_createGroup

Description:
    Create a group on the lobby screen.
    Local effects: has to be executed on every machine.

Parameters:
    _name - Displayed name of the group. <STRING>
    _side - Side of the crated group.
            Can be west, east, resistance or civlian. <SIDE>

Returns:
    Id of the created group. <STRING>

Examples:
    (begin example)
        _group1 = ["Team 1", west] call Lobby_fnc_createGroup;
    (end)

Author:
    commy2
---------------------------------------------------------------------------- */
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
