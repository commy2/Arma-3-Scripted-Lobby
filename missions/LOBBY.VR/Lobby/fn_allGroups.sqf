/* ----------------------------------------------------------------------------
Function: Lobby_fnc_allGroups

Description:
    Reports all groups on the lobby screen.

Parameters:
    _side - Report groups from this side.
            Empty array for groups from all sides. <SIDE>

Returns:
    Array of all groups. <ARRAY[STRING]>

Examples:
    (begin example)
        _allGroups = [] call Lobby_fnc_allGroups;
        _allGroupsOpFor = [east] call Lobby_fnc_allGroups;
    (end)

Author:
    commy2
---------------------------------------------------------------------------- */
#include "script_component.hpp"

params [
    ["_side", 0, [west]]
];

if (_side isEqualTo 0) then {ALL_GROUPS} else {
    ALL_GROUPS select {
        GETVARD(_x,side,0) isEqualTo _side
    } // return
};
