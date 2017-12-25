/* ----------------------------------------------------------------------------
Internal Function: Lobby_fnc_join

Description:
    Make newly created player join the correct ingame group.

Author:
    commy2
---------------------------------------------------------------------------- */
#include "script_component.hpp"

params ["_unit", "_slot"];

private _groupId = GETVAR(_slot,group);
private _side = GETVAR(_groupId,side);

_group = Lobby_ingameGroups getVariable [_groupId, grpNull];

if (isNull _group) then {
    _group = createGroup [_side, true];
    Lobby_ingameGroups setVariable [_groupId, _group];
};

[_unit] joinSilent _group;
