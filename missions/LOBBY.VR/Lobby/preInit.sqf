// by commy2
#include "script_component.hpp"

Lobby_slottedPlayers = NAMESPACE_NULL;
Lobby_localPlayer = [profileName, clientOwner];
Lobby_connectedPlayers = [Lobby_localPlayer];
Lobby_locked = true;

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
};

INIT;
