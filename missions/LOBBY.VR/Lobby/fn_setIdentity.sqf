/* ----------------------------------------------------------------------------
Internal Function: Lobby_fnc_setIdentity

Description:
    Sets name, face etc. of the newly created playable entity.

Author:
    commy2
---------------------------------------------------------------------------- */
#include "script_component.hpp"

params ["_unit", "_identity", "_slot"];
_identity params ["_name", "_face", "_speaker", "_pitch"];

_unit setName _name;
_unit setFace _face;
_unit setSpeaker _speaker;
_unit setPitch _pitch;
_unit switchMove "amovpercmstpsnonwnondnon";

if (isServer) then {
    [_unit, _slot] call Lobby_fnc_join;
};
