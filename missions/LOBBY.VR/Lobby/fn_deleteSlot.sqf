/* ----------------------------------------------------------------------------
Function: Lobby_fnc_deleteSlot

Description:
    Delete a playable slot from the lobby screen.
    Local effects: has to be executed on every machine.

Parameters:
    _slot - Slot id from Lobby_fnc_createSlot <STRING>

Returns:
    Whether the deletion of the slot was successful or not <BOOLEAN>

Examples:
    (begin example)
        _isDeleted = _slot1 call Lobby_fnc_deleteSlot;
    (end)

Author:
    commy2
---------------------------------------------------------------------------- */
#include "script_component.hpp"

params [
    ["_slot", "", [""]]
];

private _group = GETVARD(_slot,group,"");

Lobby_updateSlots = true;

SLOT_DELETE(_group,_slot)
