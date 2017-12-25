// by commy2
#include "script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"

Lobby_accepted = false;

params ["_display"];

private _ctrlServer = _display displayCtrl IDC_LOBBY_SERVER;
private _ctrlServerName = _display displayCtrl IDC_LOBBY_SERVER_NAME;
_ctrlServer ctrlSetText "Server:";
_ctrlServerName ctrlSetText serverName;

private _ctrlMission = _display displayCtrl IDC_LOBBY_MISSION;
private _ctrlMissionName = _display displayCtrl IDC_LOBBY_MISSION_NAME;
_ctrlMission ctrlSetText localize "str_disp_srvsetup_name";
_ctrlMissionName ctrlSetText missionName;

private _ctrlMap = _display displayCtrl IDC_LOBBY_MAP;
private _ctrlMapName = _display displayCtrl IDC_LOBBY_MAP_NAME;
_ctrlMap ctrlSetText localize "str_disp_srvsetup_island";
_ctrlMapName ctrlSetText worldName;

private _ctrlDescription = _display displayCtrl IDC_LOBBY_DESCRIPTION;
private _ctrlDescriptionText = _display displayCtrl IDC_LOBBY_DESCRIPTION_TEXT;
private _description = getMissionConfigValue ["Lobby_missionDescription", ""];

if (_description != "") then {
    _ctrlDescription ctrlSetText localize "str_disp_srvsetup_desc";
};

_ctrlDescriptionText ctrlSetText _description;
_ctrlDescriptionText ctrlEnable false; // multiline text boxes are selectable by default

private _ctrlPlayers = _display displayCtrl IDC_LOBBY_PLAYERS;
private _ctrlPlayerCount = _display displayCtrl IDC_LOBBY_PLAYER_COUNT;
private _ctrlPlayerList = _display displayCtrl IDC_LOBBY_PLAYER_LIST;
_ctrlPlayers ctrlSetText localize "str_disp_mp_players";

private _fnc_updatePlayers = {
    params ["_display"];
    private _ctrlPlayerCount = _display displayCtrl IDC_LOBBY_PLAYER_COUNT;
    private _ctrlPlayerList = _display displayCtrl IDC_LOBBY_PLAYER_LIST;

    private _availableSlots = playableSlotsNumber west + playableSlotsNumber east + playableSlotsNumber independent + playableSlotsNumber civilian;
    _ctrlPlayerCount ctrlSetText format ["(%1/%2)", count Lobby_connectedPlayers, _availableSlots];

    lbClear _ctrlPlayerList;

    {
        _x params ["_playerName", "_owner"];
        private _index = _ctrlPlayerList lbAdd _playerName;
        _ctrlPlayerList lbSetValue [_index, _owner];
        _ctrlPlayerList lbSetTextRight [_index, str _owner];
    } forEach Lobby_connectedPlayers;

    lbSort _ctrlPlayerList;
};

_ctrlPlayerList ctrlAddEventHandler ["LBDblClick", {
    params ["_ctrlPlayerList", "_index"];
    [
        ctrlParent _ctrlPlayerList,
        [_ctrlPlayerList lbText _index, _ctrlPlayerList lbValue _index]
    ] call Lobby_fnc_kick;
}];

_display displayAddEventHandler ["MouseMoving", _fnc_updatePlayers];
_display displayAddEventHandler ["MouseHolding", _fnc_updatePlayers];

Lobby_updateSlots = true;

private _fnc_updateSlots = {
    params ["_display"];
    private _ctrlSlotsBackground = _display displayCtrl IDC_LOBBY_SLOTS_BACKGROUND;
    private _ctrlSlotsWest = _display displayCtrl IDC_LOBBY_SLOTS_WEST;
    private _ctrlSlotsEast = _display displayCtrl IDC_LOBBY_SLOTS_EAST;
    private _ctrlSlotsResistance = _display displayCtrl IDC_LOBBY_SLOTS_GUER;
    private _ctrlSlotsCivilian = _display displayCtrl IDC_LOBBY_SLOTS_CIV;

    if (Lobby_updateSlots) then {
        Lobby_updateSlots = false;

        private _activeControlGroups = [];

        {
            _x params ["_side", "_control", "_color"];

            lbClear _control;

            {
                _activeControlGroups pushBackUnique _control;

                private _name = GETVAR(_x,name);
                private _index = _control lbAdd _name;
                _control lbSetColor [_index, _color];
                _control lbSetSelectColor [_index, _color];

                {
                    private _name = GETVAR(_x,name);
                    private _index = _control lbAdd format ["%1: %2", _forEachIndex + 1, _name];
                    _control lbSetData [_index, _x];

                    (Lobby_slottedPlayers getVariable [_x, ["", -1]]) params ["_name", "_owner"];

                    if (_name isEqualTo "") then {
                        _control lbSetTextRight [_index, format ["<%1>", localize "str_empty_slot"]];
                        _control lbSetColorRight [_index, [COLOR_GREY]];
                        _control lbSetSelectColorRight [_index, [COLOR_GREY]];
                    } else {
                        _control lbSetTextRight [_index, _name];
                        _control lbSetColorRight [_index, [COLOR_WHITE]];
                        _control lbSetSelectColorRight [_index, [COLOR_WHITE]];
                    };

                    if (_owner isEqualTo clientOwner) then {
                        _control lbSetColor [_index, [COLOR_YELLOW]];
                        _control lbSetColorRight [_index, [COLOR_YELLOW]];
                        _control lbSetSelectColor [_index, [COLOR_YELLOW]];
                        _control lbSetSelectColorRight [_index, [COLOR_YELLOW]];
                    };
                } forEach (_x call Lobby_fnc_allSlots);

                _control lbAdd "";
            } forEach (_side call Lobby_fnc_allGroups);
        } forEach [
            [west, _ctrlSlotsWest, [COLOR_WEST]],
            [east, _ctrlSlotsEast, [COLOR_EAST]],
            [resistance, _ctrlSlotsResistance, [COLOR_GUER]],
            [civilian, _ctrlSlotsCivilian, [COLOR_CIVILIAN]]
        ];

        ctrlPosition _ctrlSlotsBackground params ["_left", "_top", "_width", "_height"];
        _width = _width / count _activeControlGroups;

        {
            private _left = _left + _width * _forEachIndex;
            _x ctrlSetPosition [_left, _top, _width, _height];
            _x ctrlCommit 0;
            _x ctrlEnable true;
        } forEach _activeControlGroups;

        {
            _x ctrlEnable false;
        } forEach ([_ctrlSlotsWest, _ctrlSlotsEast, _ctrlSlotsResistance, _ctrlSlotsCivilian] - _activeControlGroups);
    };
};

_display displayAddEventHandler ["MouseMoving", _fnc_updateSlots];
_display displayAddEventHandler ["MouseHolding", _fnc_updateSlots];

private _ctrlSlotsWest = _display displayCtrl IDC_LOBBY_SLOTS_WEST;
private _ctrlSlotsEast = _display displayCtrl IDC_LOBBY_SLOTS_EAST;
private _ctrlSlotsResistance = _display displayCtrl IDC_LOBBY_SLOTS_GUER;
private _ctrlSlotsCivilian = _display displayCtrl IDC_LOBBY_SLOTS_CIV;

{
    _x ctrlAddEventHandler ["LBSelChanged", {
        params ["_control", "_index"];
        private _data = _control lbData _index;

        if (_data isEqualTo "") exitWith {};

        if (Lobby_slottedPlayers getVariable [_data, []] isEqualTo Lobby_localPlayer) then {
            [Lobby_localPlayer] remoteExecCall ["Lobby_fnc_slotOut", 2];
        } else {
            [Lobby_localPlayer, _data] remoteExecCall ["Lobby_fnc_slotIn", 2];
        };
    }];
} forEach [_ctrlSlotsWest, _ctrlSlotsEast, _ctrlSlotsResistance, _ctrlSlotsCivilian];

////////////////////////////////////////////////////////////////////////////////
// Keys
_display displayAddEventHandler ["KeyDown", {
    params ["_display", "_key", "_shift"];

    if (_key isEqualTo DIK_ESCAPE && {!_shift}) then {
        _display call Lobby_fnc_exit;
        true
    };
}];

////////////////////////////////////////////////////////////////////////////////
// Buttons
private _ctrlButtonExit = _display displayCtrl IDC_LOBBY_BUTTON_EXIT;
private _ctrlButtonUnlock = _display displayCtrl IDC_LOBBY_BUTTON_UNLOCK;
private _ctrlButtonConfirm = _display displayCtrl IDC_LOBBY_BUTTON_CONFIRM;

_ctrlButtonExit ctrlSetText localize "str_a3_rscdisplaymain_buttonexit";
_ctrlButtonConfirm ctrlSetText localize "str_disp_ok";

_ctrlButtonExit ctrlAddEventHandler ["ButtonClick", {
    params ["_ctrlButtonExit"];
    private _display = ctrlParent _ctrlButtonExit;

    _display call Lobby_fnc_exit;
}];

_ctrlButtonConfirm ctrlAddEventHandler ["ButtonClick", {
    params ["_ctrlButtonConfirm"];
    private _display = ctrlParent _ctrlButtonConfirm;

    Lobby_accepted = true;
    _ctrlButtonConfirm ctrlEnable false;
}];

_ctrlButtonUnlock ctrlEnable false;

_ctrlButtonUnlock ctrlAddEventHandler ["ButtonClick", {
    if !(isServer || call BIS_fnc_admin > 0) exitWith {};
    missionNamespace setVariable ["Lobby_locked", !Lobby_locked, true];
}];

private _fnc_updateLocked = {
    params ["_display"];
    private _ctrlButtonUnlock = _display displayCtrl IDC_LOBBY_BUTTON_UNLOCK;

    _ctrlButtonUnlock ctrlEnable (isServer || call BIS_fnc_admin > 0);
    _ctrlButtonUnlock ctrlSetText localize (["str_disp_multi_lock", "str_disp_multi_unlock"] select Lobby_locked);

    if (Lobby_accepted && !Lobby_locked) then {
        // leave lobby
        _display closeDisplay 1;

        private _slot = "";

        {
            if ((Lobby_slottedPlayers getVariable _x) isEqualTo Lobby_localPlayer) exitWith {
                _slot = _x;
            };
        } forEach allVariables Lobby_slottedPlayers;

        _slot call Lobby_fnc_confirm;
    };
};

_display displayAddEventHandler ["MouseMoving", _fnc_updateLocked];
_display displayAddEventHandler ["MouseHolding", _fnc_updateLocked];
