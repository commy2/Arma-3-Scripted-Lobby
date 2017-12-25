/* ----------------------------------------------------------------------------
Internal Function: Lobby_fnc_createPlayer

Description:
    Creates the playable entity after leaving the lobby screen.

Author:
    commy2
---------------------------------------------------------------------------- */
#include "script_component.hpp"

params [
    ["_side", west, [west]],
    ["_group", grpNull, [grpNull]]
];

private _type = "C_man_1";
private _fnc_init = {};

private _oldPlayer = player;

if (isNull _group) then {
    _group = createGroup _side;
};

private _unit = _group createUnit [_type, [0,0,0], [], 0, "NONE"];

[_unit, name _oldPlayer, face _oldPlayer, speaker _oldPlayer, pitch _oldPlayer] spawn {
    _this remoteExecCall ["Lobby_fnc_setIdentity"];
};

selectPlayer _unit;

if !(_oldPlayer isKindOf "VirtualMan_F") then {
    deleteVehicle _oldPlayer;
};

[_unit] call _fnc_init;
