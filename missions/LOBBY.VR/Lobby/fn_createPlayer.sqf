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
private _side = GETVAR(GETVAR(_slot,group),side);

private _oldPlayer = player;
private _group = createGroup [_side, true];

private _unit = _group createUnit [_type, [0,0,0], [], 0, "NONE"];

[_unit, [name _oldPlayer, face _oldPlayer, speaker _oldPlayer, pitch _oldPlayer], _slot] spawn {
    _this remoteExecCall ["Lobby_fnc_setIdentity"];
};

selectPlayer _unit;
_unit setVariable ["Lobby_slot", _slot, true];

if !(_oldPlayer isKindOf "VirtualMan_F") then {
    deleteVehicle _oldPlayer;
};

[_unit] call _init;
