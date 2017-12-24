#include "script_component.hpp"

params [
    ["_group", "", [""]]
];

{
    SLOT_DELETE(_group,_x); 
} forEach ALL_SLOTS(_group);

Lobby_updateSlots = true;

GROUP_DELETE(_group)
