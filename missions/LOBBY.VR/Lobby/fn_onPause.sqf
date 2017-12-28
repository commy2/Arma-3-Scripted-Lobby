/* ----------------------------------------------------------------------------
Internal Function: Lobby_fnc_onPause

Description:
    Handle opening the pause menu via ESC key.

Author:
    commy2
---------------------------------------------------------------------------- */
#include "script_component.hpp"

isNil {
    params ["_display"];

    private _ctrlButtonAbort = _display displayCtrl 104;
    _ctrlButtonAbort ctrlSetText localize "STR_DISP_MP_DS_REASSIGN";
    _ctrlButtonAbort ctrlSetTooltip "";

    _ctrlButtonAbort ctrlSetEventHandler ["ButtonClick", "
        params ['_control'];
        ctrlParent _control closeDisplay 2;
        0 spawn {findDisplay 46 createDisplay 'Lobby_Display'};
        true
    "];
};

true
