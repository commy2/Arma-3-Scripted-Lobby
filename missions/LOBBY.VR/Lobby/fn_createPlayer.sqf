/* ----------------------------------------------------------------------------
Internal Function: Lobby_fnc_createPlayer

Description:
    Creates the playable entity after leaving the lobby screen.

Author:
    commy2
---------------------------------------------------------------------------- */
#include "script_component.hpp"

params ["_slot"];

private _type = GETVAR(_slot,className);
private _init = GETVAR(_slot,init);

private _oldPlayer = player;
private _group = group _oldPlayer;

private _unit = _group createUnit [_type, [0,0,0], [], 0, "NONE"];

[_unit, [name _oldPlayer, face _oldPlayer, speaker _oldPlayer, pitch _oldPlayer], _slot] spawn {
    _this remoteExecCall ["Lobby_fnc_setIdentity"];
};

selectPlayer _unit;

if !(_oldPlayer isKindOf "VirtualMan_F") then {
    deleteVehicle _oldPlayer;
};

[_unit] call _init;
