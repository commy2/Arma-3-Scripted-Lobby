/* ----------------------------------------------------------------------------
Function: Lobby_fnc_deleteGroup

Description:
    Delete a group and all it's playable slots from the lobby screen.
    Local effects: has to be executed on every machine.

Parameters:
    _group - Group id from Lobby_fnc_createGroup <STRING>

Returns:
    Whether the deletion of the group was successful or not <BOOLEAN>

Examples:
    (begin example)
        _isDeleted = _group1 call Lobby_fnc_deleteGroup;
    (end)

Author:
    commy2
---------------------------------------------------------------------------- */
#include "script_component.hpp"

params [
    ["_group", "", [""]]
];

{
    SLOT_DELETE(_group,_x); 
} forEach ALL_SLOTS(_group);

Lobby_updateSlots = true;

GROUP_DELETE(_group)
