/* ----------------------------------------------------------------------------
Internal Function: Lobby_fnc_slotOut

Description:
    Handle leaving a slot on the lobby screen.

Author:
    commy2
---------------------------------------------------------------------------- */
#include "script_component.hpp"

if (!isServer) exitWith {false};

params [
    ["_player", [], [[]]]
];

private _return = false;

{
    if ((Lobby_slottedPlayers getVariable _x select 1) isEqualTo (_player select 1)) then {
        Lobby_slottedPlayers setVariable [_x, nil, true];
        missionNamespace setVariable ["Lobby_updateSlots", true, true];
    };
} forEach allVariables Lobby_slottedPlayers;

_return
