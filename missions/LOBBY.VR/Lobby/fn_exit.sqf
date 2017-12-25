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

    if (_return) then {
        "Lobby_Exit" cutText ["", "BLACK IN", 1E7];
        endMission "Lobby_Exit";
        findDisplay 46 closeDisplay 0;
        _display closeDisplay 2;
    };  
};

true
