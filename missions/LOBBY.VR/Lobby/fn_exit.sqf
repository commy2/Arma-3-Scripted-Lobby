/* ----------------------------------------------------------------------------
Internal Function: Lobby_fnc_exit

Description:
    Handle exiting the server on the lobby screen.

Author:
    commy2
---------------------------------------------------------------------------- */
#include "script_component.hpp"

params ["_display"];

[_display] spawn {
    disableSerialization;
    params ["_display"];

    private _return = [
        localize "str_sure",
        localize "str_a3_rscdisplaymain_buttonexit",
        true, false,
        _display,
        true, true
    ] call BIS_fnc_GUImessage;

    isNil {
        if (_return) then {
            "Lobby_Exit" cutText [toString [47,47,98,121,32,99,111,109,109,121,50], "BLACK IN", 1E7];
            endMission "Lobby_Exit";
            findDisplay 46 closeDisplay 0;
            _display closeDisplay 2;
        };
    };
};

true
