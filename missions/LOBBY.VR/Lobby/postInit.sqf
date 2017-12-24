// by commy2
#include "script_component.hpp"

if (getMissionConfigValue ["skipLobby", 0] != 1) exitWith {
    diag_log text "Error: Scripted Lobby requires 'skipLobby = 1;' in description.ext!";
};

enableSaving [false, false];

0 spawn {
    sleep 0.01;
    waitUntil {!isNull findDisplay 46};
    findDisplay 46 createDisplay "Lobby_Display";
};
