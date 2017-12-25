/* ----------------------------------------------------------------------------
Function: Lobby_fnc_allSlots

Description:
    Reports all playable slots of a group on the lobby screen.

Parameters:
    _group - Report all slots of this group.
             Empty array for all slots from all groups. <STRING>

Returns:
    Array of all playable slots. <ARRAY[STRING]>

Examples:
    (begin example)
        _allSlots = [] call Lobby_fnc_allSlots;
        _allSlotsGroup1 = _group1 call Lobby_fnc_allSlots;
    (end)

Author:
    commy2
---------------------------------------------------------------------------- */
#include "script_component.hpp"

params [
    ["_group", 0, [""]]
];

if (_group isEqualTo 0) then {
    private _return = [];

    {
        _return append ALL_SLOTS(_x);
    } forEach ALL_GROUPS;

    _return // return
} else {ALL_SLOTS(_group)};
