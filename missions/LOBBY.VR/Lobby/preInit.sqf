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
    Player arrays (as described above) of all connected machines. <ARRAY[]>
    Updated by the server when a player connects or disconnects.
---------------------------------------------------------------------------- */
Lobby_connectedPlayers = [Lobby_localPlayer];

/* ----------------------------------------------------------------------------
Internal Variable: Lobby_slottedPlayers

Description:
    Global pseudo namespace. <OBJECT[ARRAY[]]>
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

/* ----------------------------------------------------------------------------
Internal Variable: Lobby_acceptedPlayers

Description:
    Global pseudo namespace. <OBJECT[BOOLEAN]>
    Lobby_accepted state of all clients. Identifier is stringified client owner.
    If true, the corresponding player has confirmed the slot selection. Starts
    out as false every time the lobby screen is opened. Set to true by selecting
    a slot and pressing "OK". Set to false by changing the slot selection.
---------------------------------------------------------------------------- */
Lobby_acceptedPlayers = NAMESPACE_NULL;

/* ----------------------------------------------------------------------------
Internal Variable: Lobby_localPlayerIdentity

Description:
    Name, face, speaker, and pitch of the avatar.
    <ARRAY[STRING,STRING,STRING,NUMBER]>
---------------------------------------------------------------------------- */
Lobby_localPlayerIdentity = ["Error: No vehicle","Default","",-1];

if (hasInterface) then {
    addMissionEventHandler ["EachFrame", {
        switch (true) do {
            case (isNull player): {
                selectNoPlayer;
            };
            case (typeOf player == "VirtualMan_F"): {
                Lobby_localPlayerIdentity = [name player, face player, speaker player, pitch player];
                selectNoPlayer;
                removeMissionEventHandler ["EachFrame", _thisEventHandler];
            };
        };
    }];
};

if (isServer) then {
    missionNamespace setVariable ["Lobby_slottedPlayers", CREATE_NAMESPACE_GLOBAL, true];
    missionNamespace setVariable ["Lobby_acceptedPlayers", CREATE_NAMESPACE_GLOBAL, true];

    /* ----------------------------------------------------------------------------
    Internal Variable: Lobby_ingameGroups

    Description:
        Local pseudo namespace. <LOCATION[GROUP]>
        Identifier is group id. Value is the GROUP associated with that group id.
    ---------------------------------------------------------------------------- */
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
