// by commy2
#include "script_component.hpp"


/* ----------------------------------------------------------------------------
Internal Function: Lobby_localPlayer

Description:
    Local player array. <ARRAY[STRING,NUMBER]>
    Contains profile name and client owner id.
---------------------------------------------------------------------------- */
Lobby_localPlayer = [profileName, clientOwner];

/* ----------------------------------------------------------------------------
Internal Variable: Lobby_connectedPlayers

Description:
    Player arrays (as described above) of all connected machines. <ARRAY>
    Updated by the server when a player connects or disconnects.
---------------------------------------------------------------------------- */
Lobby_connectedPlayers = [Lobby_localPlayer];

/* ----------------------------------------------------------------------------
Internal Variable: Lobby_slottedPlayers

Description:
    Pseudo namespace. <OBJECT>
    Contains variables with slot (Lobby_fnc_createSlot) as identifier. Variable
    value is the player array (as described above) that is currently occupying
    the slot. Set by the server via Lobby_fnc_slotIn and Lobby_fnc_slotOut.
---------------------------------------------------------------------------- */
Lobby_slottedPlayers = NAMESPACE_NULL;

/* ----------------------------------------------------------------------------
Internal Variable: Lobby_selectedSlot

Description:
    Locally selected slot on the lobby screen. <STRING>
    Updated by the client, but only after the server ensured that the slot was
    vacant.
---------------------------------------------------------------------------- */
Lobby_selectedSlot = "";

/* ----------------------------------------------------------------------------
Internal Variable: Lobby_locked

Description:
    If true, players are stuck on the lobby screen even after confirming the
    slot selection. <BOOLEAN>
    Updated by the admin / host client.
---------------------------------------------------------------------------- */
Lobby_locked = false;

/* ----------------------------------------------------------------------------
Internal Variable: Lobby_ready

Description:
    If true, players are moved to the game from the lobby screen after they
    confirm their slot selection. <BOOLEAN>
    At mission start it is set to false. Set to true by either the admin / host
    confirming the slot selection or by everyone confirming their selection.
    The variable is set globally and never resets to false.
---------------------------------------------------------------------------- */
Lobby_ready = false;

if (isServer) then {
    missionNamespace setVariable ["Lobby_slottedPlayers", CREATE_NAMESPACE_GLOBAL, true];
    Lobby_ingameGroups = CREATE_NAMESPACE;

    addMissionEventHandler ["PlayerConnected", {
        Lobby_connectedPlayers pushBackUnique [_this select 2, _this select 4];
        missionNamespace setVariable ["Lobby_connectedPlayers", Lobby_connectedPlayers, true];
    }];

    addMissionEventHandler ["PlayerDisconnected", {
        Lobby_connectedPlayers deleteAt (Lobby_connectedPlayers find [_this select 2, _this select 4]);
        missionNamespace setVariable ["Lobby_connectedPlayers", Lobby_connectedPlayers, true];

        [[_this select 2, _this select 4]] call Lobby_fnc_slotOut;
    }];

    addMissionEventHandler ["HandleDisconnect", {
        params ["_unit"];

        if (!isNil {_unit getVariable "Lobby_slot"}) then {
            deleteVehicle _unit;
        };

        nil
    }];
};

INIT;
