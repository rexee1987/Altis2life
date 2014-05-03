#include <macro.h>
/*
*/
private["_house","_owner"];
_house = cursorTarget;
if(isNull _house) exitWith {hint "There is no house"};
if(!(_house isKindOf "House_F")) exitWith {};

_owner = _house getVariable ["life_homeOwnerName", []];

if(count _owner == 0) then {
	hint "This house belongs to nobody.";
} else {
	hint format ["The owner of this house is %1", (_owner select 0)];
};


