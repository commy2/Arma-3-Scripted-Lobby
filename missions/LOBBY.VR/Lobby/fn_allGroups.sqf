#include "script_component.hpp"

params [
    ["_side", 0, [west]]
];

if (_side isEqualTo 0) then {ALL_GROUPS} else {
    ALL_GROUPS select {
        GETVARD(_x,side,0) isEqualTo _side
    } // return
};
