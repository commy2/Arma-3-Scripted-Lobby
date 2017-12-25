class Lobby {
    class Internal {
        class preInit {
            preInit = 1;
            file = "Lobby\preInit.sqf";
        };
        class postInit {
            postInit = 1;
            file = "Lobby\postInit.sqf";
        };
        file = "Lobby";
        class onPause;
        class createPlayer;
        class setIdentity;
    };

    class InternalUI {
        file = "Lobby";
        class slotIn;
        class slotOut;
        class exit;
        class confirm;
        class kick;
    };

    class API {
        file = "Lobby";
        class createGroup;
        class deleteGroup;
        class allGroups;
        class createSlot;
        class deleteSlot;
        class allSlots;
    };
};
