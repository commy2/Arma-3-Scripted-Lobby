#define COLOR_BLACK 0,0,0,1
#define COLOR_WHITE 1,1,1,1
#define COLOR_GREY 0.25,0.25,0.25,1
#define COLOR_GREY_LIGHT 0.75,0.75,0.75,1
#define COLOR_GREY_DARK 0.1,0.1,0.1,1
#define COLOR_RED 0.95,0,0,1
#define COLOR_GREEN 0,0.95,0,1
#define COLOR_BLUE 0,0,0.95,1
#define COLOR_YELLOW 0.95,0.95,0,1
#define COLOR_ALPHA 0,0,0,0

#define COLOR_BACKGROUND_OUTER 0,0,0,1
#define COLOR_BACKGROUND 0.05,0.05,0.05,1
#define COLOR_BACKGROUND_INNER 0.08,0.08,0.08,1

#define COLOR_WEST (profilenamespace getvariable ['Map_BLUFOR_R',0]), (profilenamespace getvariable ['Map_BLUFOR_G',1]), (profilenamespace getvariable ['Map_BLUFOR_B',1]), (profilenamespace getvariable ['Map_BLUFOR_A',0.8])
#define COLOR_EAST (profilenamespace getvariable ['Map_OPFOR_R',0]), (profilenamespace getvariable ['Map_OPFOR_G',1]), (profilenamespace getvariable ['Map_OPFOR_B',1]), (profilenamespace getvariable ['Map_OPFOR_A',0.8])
#define COLOR_GUER (profilenamespace getvariable ['Map_Independent_R',0]), (profilenamespace getvariable ['Map_Independent_G',1]), (profilenamespace getvariable ['Map_Independent_B',1]), (profilenamespace getvariable ['Map_Independent_A',0.8])
#define COLOR_CIV (profilenamespace getvariable ['Map_Civilian_R',0]), (profilenamespace getvariable ['Map_Civilian_G',1]), (profilenamespace getvariable ['Map_Civilian_B',1]), (profilenamespace getvariable ['Map_Civilian_A',0.8])

#define IDC_LOBBY_SERVER 2000
#define IDC_LOBBY_SERVER_NAME 2001
#define IDC_LOBBY_MISSION 2010
#define IDC_LOBBY_MISSION_NAME 2011
#define IDC_LOBBY_MAP 2020
#define IDC_LOBBY_MAP_NAME 2021
#define IDC_LOBBY_DESCRIPTION 2030
#define IDC_LOBBY_DESCRIPTION_TEXT 2031
#define IDC_LOBBY_PLAYERS 2100
#define IDC_LOBBY_PLAYER_COUNT 2101
#define IDC_LOBBY_PLAYER_LIST 2102
#define IDC_LOBBY_SLOTS_BACKGROUND 2200
#define IDC_LOBBY_SLOTS_WEST 2211
#define IDC_LOBBY_SLOTS_EAST 2210
#define IDC_LOBBY_SLOTS_GUER 2212
#define IDC_LOBBY_SLOTS_CIV 2213
#define IDC_LOBBY_BUTTON_CONFIRM 2300
#define IDC_LOBBY_BUTTON_UNLOCK 2301
#define IDC_LOBBY_BUTTON_EXIT 2302

// make-shift cba
#define QUOTE(var) #var
#define INC(var) (call {var = var + 1; var})
#define CREATE_NAMESPACE_GLOBAL createSimpleObject ["Building", [0,0,0]]
#define CREATE_NAMESPACE createLocation ["Name", [0,0,0], 0, 0]
#define DELETE_NAMESPACE(x) deleteLocation x
#define NAMESPACE_NULL locationNull

// initialize
#define INIT (call {\
    if (isNil "Lobby_allGroups") then {\
        Lobby_allGroups = [];\
        Lobby_allContainers = CREATE_NAMESPACE;\
        Lobby_lastId = -1;\
        true\
    } else {false};\
})

#define SETVAR(id,var,value) (call {\
    private _container = Lobby_allContainers getVariable [id, NAMESPACE_NULL];\
    _container setVariable ['var', value];\
})

#define GETVAR(id,var) (call {\
    private _container = Lobby_allContainers getVariable [id, NAMESPACE_NULL];\
    _container getVariable 'var'\
})

#define GETVARD(id,var,default) (call {\
    private _container = Lobby_allContainers getVariable [id, NAMESPACE_NULL];\
    _container getVariable ['var', default]\
})

// GROUP
#define ALL_GROUPS (+ Lobby_allGroups)

#define IS_GROUP(id) (Lobby_allGroups find toUpper id != -1)

#define GROUP_CREATE (call {\
    private _id = format ["L:%1", INC(Lobby_lastId)];\
    Lobby_allGroups pushBack _id;\
    Lobby_allContainers setVariable [_id, CREATE_NAMESPACE];\
    SETVAR(_id,id,_id);\
    SETVAR(_id,slots,[]);\
    SETVAR(_id,lastId,-1);\
    _id\
})

#define GROUP_DELETE(id) (call {\
    if (!isNil {Lobby_allGroups deleteAt (Lobby_allGroups find toUpper id)}) then {\
        Lobby_allContainers setVariable [id, nil];\
        true\
    } else {false};\
})

// SLOT
//grp := id from GROUP
#define ALL_SLOTS(grp) (+ GETVARD(grp,slots,[]))

#define IS_SLOT(grp,id) (call {\
    private _slots = GETVAR(grp,slots);\
    _slots find toUpper id != -1\
})

#define SLOT_CREATE(grp) (call {\
    private _lastId = GETVAR(grp,lastId);\
    if (isNil "_lastId") exitWith {""};\
    private _id = format ["%1:%2", grp, INC(_lastId)];\
    SETVAR(grp,lastId,_lastId);\
    private _slots = GETVAR(grp,slots);\
    _slots pushBack _id;\
    Lobby_allContainers setVariable [_id, CREATE_NAMESPACE];\
    SETVAR(_id,id,_id);\
    _id\
})

#define SLOT_DELETE(grp,id) (call {\
    private _slots = GETVAR(grp,slots);\
    if (!isNil {_slots deleteAt (_slots find toUpper id)}) then {\
        Lobby_allContainers setVariable [id, nil];\
        true\
    } else {false};\
})
