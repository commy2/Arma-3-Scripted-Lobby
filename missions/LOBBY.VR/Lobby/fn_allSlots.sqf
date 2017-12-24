#include "script_component.hpp"

params [
    ["_group", 0, [""]]
];

if (_group isEqualTo 0) then {
    private _return = [];

    {
        _return append ALL_SLOTS(_x);
    } forEach ALL_GROUPS;

    _return // return
} else {ALL_SLOTS(_group)};
