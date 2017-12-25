/* ----------------------------------------------------------------------------
Internal Function: Lobby_fnc_kick

Description:
    Handle attempting to kick a player off the server on the lobby screen.

Author:
    commy2
---------------------------------------------------------------------------- */
#include "script_component.hpp"

params ["_display", "_player"];

if (!serverCommandAvailable "#kick" || {_player select 1 <= 2}) exitWith {false};

[_display, _player] spawn {
    disableSerialization;
    params ["_display", "_player"];

    private _return = [
        localize "str_sure",
        format ["%1 %2", localize "STR_DISP_MP_DS_KICK", _player select 0],
        true, false,
        _display,
        true, true
    ] call BIS_fnc_GUImessage;

    if (_return) then {
        isNil {
            private _dummy = _display ctrlCreate ["RscEdit", -1];
            _dummy ctrlSetEventHandler ["SetFocus", format ["serverCommand '#kick %1'", _player select 0]];
            ctrlSetFocus _dummy;
            ctrlDelete _dummy;
        };
    };  
};

true
