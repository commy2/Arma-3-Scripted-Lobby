/* ----------------------------------------------------------------------------
Function: Lobby_fnc_createSlot

Description:
    Create a playable slot for a group on the lobby screen.
    Local effects: has to be executed on every machine.

Parameters:
    _name  - Displayed name of the slot. <STRING>
    _group - Group id from Lobby_fnc_createGroup <STRING>

Returns:
    Id of the created slot. <STRING>

Examples:
    (begin example)
        _group = ["Team 1", west] call Lobby_fnc_createGroup;
        _slot1 = ["Squad Leader", _group] call Lobby_fnc_createSlot;
        _slot2 = ["Grenadier", _group] call Lobby_fnc_createSlot;
    (end)

Author:
    commy2
---------------------------------------------------------------------------- */
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
