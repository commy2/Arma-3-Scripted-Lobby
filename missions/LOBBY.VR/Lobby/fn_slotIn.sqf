/* ----------------------------------------------------------------------------
Internal Function: Lobby_fnc_slotIn

Description:
    Handle selecting a slot on the lobby screen.

Author:
    commy2
---------------------------------------------------------------------------- */
#include "script_component.hpp"

if (!isServer) exitWith {false};

params [
    ["_player", [], [[]]],
    ["_slot", "", [""]]
];

_this call Lobby_fnc_slotOut;

if (isNil {Lobby_slottedPlayers getVariable _slot}) then {
    Lobby_slottedPlayers setVariable [_slot, _player, true];
    missionNamespace setVariable ["Lobby_updateSlots", true, true];
    true
} else {false};
