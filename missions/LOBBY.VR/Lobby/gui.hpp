// by commy2
#include "script_component.hpp"

class Lobby_Display {
    onLoad = "_this call compile preprocessFileLineNumbers 'Lobby\initDisplayLobby.sqf'";
    idd = -1;
    movingEnable = 0;
    //enableSimulation = 1;

    class controls {
        class BackgroundOuter: RscText {
            x = "safezoneXAbs";
            y = "safezoneY";
            w = "safezoneWAbs";
            h = "safezoneH";
            colorBackground[] = {COLOR_BACKGROUND_OUTER};
        };

        class Background: RscText {
            x = 1 * GUI_GRID_W + safezoneX;
            y = 1 * GUI_GRID_H + safezoneY;
            w = safezoneW - 2 * GUI_GRID_W;
            h = safezoneH - 2 * GUI_GRID_H;
            colorBackground[] = {COLOR_BACKGROUND};
        };

        class Server: RscText {
            idc = IDC_LOBBY_SERVER;
            x = 1.1 * GUI_GRID_W + safezoneX;
            y = 1.1 * GUI_GRID_H + safezoneY;
            w = 5 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;
            colorBackground[] = {COLOR_ALPHA};
        };
        class ServerName: Server {
            idc = IDC_LOBBY_SERVER_NAME;
            x = 6.2 * GUI_GRID_W + safezoneX;
            w = 10 * GUI_GRID_W;
        };

        class Mission: Server {
            idc = IDC_LOBBY_MISSION;
            y = 2.1 * GUI_GRID_H + safezoneY;
        };
        class MissionName: ServerName {
            idc = IDC_LOBBY_MISSION_NAME;
            y = 2.1 * GUI_GRID_H + safezoneY;
        };

        class Map: Server {
            idc = IDC_LOBBY_MAP;
            y = 3.1 * GUI_GRID_H + safezoneY;
        };
        class MapName: ServerName {
            idc = IDC_LOBBY_MAP_NAME;
            y = 3.1 * GUI_GRID_H + safezoneY;
        };

        class Description: Server {
            idc = IDC_LOBBY_DESCRIPTION;
            x = 16.3 * GUI_GRID_W + safezoneX;
            style = ST_RIGHT;
        };
        class DescriptionText: Description {
            idc = IDC_LOBBY_DESCRIPTION_TEXT;
            style = ST_MULTI + ST_NO_RECT;
            x = 21.4 * GUI_GRID_W + safezoneX;
            w = (30 * GUI_GRID_W) min (safezoneW - 22.5 * GUI_GRID_W);
            h = 3 * GUI_GRID_H;
        };

        class PlayersBackground: RscText {
            colorBackground[] = {COLOR_BACKGROUND_INNER};
            x = 1.1 * GUI_GRID_W + safezoneX;
            y = 4.2 * GUI_GRID_H + safezoneY;
            w = 20.2 * GUI_GRID_W;
            h = safezoneH - 15 * GUI_GRID_H;
        };
        class Players: RscText {
            idc = IDC_LOBBY_PLAYERS;
            x = 1.1 * GUI_GRID_W + safezoneX;
            y = 4.2 * GUI_GRID_H + safezoneY;
            w = 10 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;
            colorBackground[] = {COLOR_ALPHA};
        };
        class PlayerCount: Players {
            idc = IDC_LOBBY_PLAYER_COUNT;
            style = ST_RIGHT;
        };
        class PlayerList: RscListBox {
            idc = IDC_LOBBY_PLAYER_LIST;
            x = 1.1 * GUI_GRID_W + safezoneX;
            y = 5.2 * GUI_GRID_H + safezoneY;
            w = 20.2 * GUI_GRID_W;
            h = safezoneH - 16 * GUI_GRID_H;

            #define _COLOR_TEXT COLOR_WHITE
            #define _COLOR_BACKGROUND COLOR_ALPHA

            colorText[] = {_COLOR_TEXT};
            colorTextRight[] = {_COLOR_TEXT};
            colorBackground[] = {_COLOR_BACKGROUND};
            colorSelect[] = {_COLOR_TEXT};
            colorSelectRight[] = {_COLOR_TEXT};
            colorSelectBackground[] = {_COLOR_BACKGROUND};
            colorSelect2[] = {_COLOR_TEXT};
            colorSelect2Right[] = {_COLOR_TEXT};
            colorSelectBackground2[] = {_COLOR_BACKGROUND};
        };

        class SlotsBackground: RscText {
            idc = IDC_LOBBY_SLOTS_BACKGROUND;
            x = 21.4 * GUI_GRID_W + safezoneX;
            y = 4.2 * GUI_GRID_H + safezoneY;
            w = safezoneW - 22.5 * GUI_GRID_W;
            h = safezoneH - 6.4 * GUI_GRID_H;
            colorBackground[] = {COLOR_GREY_DARK};
        };
        class SlotsWest: RscListBox {
            idc = IDC_LOBBY_SLOTS_WEST;

            #define _COLOR_TEXT COLOR_WHITE
            #define _COLOR_BACKGROUND COLOR_ALPHA

            colorText[] = {_COLOR_TEXT};
            colorTextRight[] = {_COLOR_TEXT};
            colorBackground[] = {_COLOR_BACKGROUND};
            colorSelect[] = {_COLOR_TEXT};
            colorSelectRight[] = {_COLOR_TEXT};
            colorSelectBackground[] = {_COLOR_BACKGROUND};
            colorSelect2[] = {_COLOR_TEXT};
            colorSelect2Right[] = {_COLOR_TEXT};
            colorSelectBackground2[] = {_COLOR_BACKGROUND};
            period = 0;
        };
        class SlotsEast: SlotsWest {
            idc = IDC_LOBBY_SLOTS_EAST;
        };
        class SlotsResistance: SlotsWest {
            idc = IDC_LOBBY_SLOTS_GUER;
        };
        class SlotsCivilian: SlotsWest {
            idc = IDC_LOBBY_SLOTS_CIV;
        };

        class Confirm: RscButton {
            idc = IDC_LOBBY_BUTTON_CONFIRM;
            x = safezoneX + safezoneW - 9.1 * GUI_GRID_W;
            y = safezoneY + safezoneH - 2.1 * GUI_GRID_H;
            w = 8 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;
            colorBackground[] = {COLOR_GREY};
            colorBackgroundActive[] = {COLOR_GREY_LIGHT};
            colorFocused[] = {COLOR_WHITE};
        };
        class Unlock: Confirm {
            idc = IDC_LOBBY_BUTTON_UNLOCK;
            x = safezoneX + safezoneW - 17.2 * GUI_GRID_W;
        };
        class Exit: Confirm {
            idc = IDC_LOBBY_BUTTON_EXIT;
            x = 21.4 * GUI_GRID_W + safezoneX;
        };
    };
};
