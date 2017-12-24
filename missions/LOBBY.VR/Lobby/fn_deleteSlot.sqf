#include "script_component.hpp"

params [
    ["_slot", "", [""]]
];

private _group = GETVARD(_slot,group,"");

Lobby_updateSlots = true;

SLOT_DELETE(_group,_slot)
