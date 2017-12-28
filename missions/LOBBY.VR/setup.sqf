/* ----------------------------------------------------------------------------
Script: setup.sqf

Description:
    Automates the creation of playable slots in the editor.

Parameters:
    _slotNumber - Number of dummy slots to create. <NUMBER>

Examples:
    (begin example)
        20 execVM "setup.sqf"
    (end)

Author:
    commy2
---------------------------------------------------------------------------- */
isNil {
    params ["_slotNumber"];

    private _oldDummies = entities "VirtualMan_F";
    private _oldPlayers = entities "" select {_x get3DENAttribute "ControlSP" select 0};
    private _oldPlayables = entities "" select {_x get3DENAttribute "ControlMP" select 0};

    collect3DENHistory {
        delete3DENEntities _oldDummies;

        private _group = grpNull;

        for "_i" from 1 to _slotNumber do {
            private _entitiy = _group create3DENEntity ["Object", "VirtualMan_F", [0,0,0]];
            _entitiy set3DENAttribute ["ControlMP", true];
            _entitiy set3DENAttribute ["allowDamage", false];
            _entitiy set3DENAttribute ["enableSimulation", false];

            if (_i isEqualTo 1) then {
                _group = group _entitiy;
                _entitiy set3DENAttribute ["ControlSP", true];
            };
        };

        {
            _x set3DENAttribute ["ControlSP", false];
        } forEach _oldPlayers;

        {
            _x set3DENAttribute ["ControlMP", false];
        } forEach _oldPlayables;
    };
};
