/* ----------------------------------------------------------------------------
Internal Function: Lobby_fnc_confirm

Description:
    Handle confirming the slot on the lobby screen.

Author:
    commy2
---------------------------------------------------------------------------- */
#include "script_component.hpp"

params ["_slot"];

// same slot, just continue
if (player getVariable ["Lobby_slot", ""] == _slot) exitWith {};

_slot call Lobby_fnc_createPlayer;
