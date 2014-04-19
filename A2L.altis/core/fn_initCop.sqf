#include <macro.h>
/*
	File: fn_initCop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Cop Initialization file.
*/
private["_end"];
player addRating 9999999;
waitUntil {!(isNull (findDisplay 46))};
_end = false;
if(life_blacklisted) exitWith
{
	["Blacklisted",false,true] call BIS_fnc_endMission;
	sleep 30;
};

switch (__GETC__(life_coplevel)) do {
	case 1: { life_paycheck = 10000; };
	case 2: { life_paycheck = 25000; };
	case 3: { life_paycheck = 50000; };
	case 4: { life_paycheck = 80000; };
	case 5: { life_paycheck = 100000; };
	case 6: { life_paycheck = 150000; };
	case 7: { life_paycheck = 200000; };
	default { life_paycheck = 3000; };
};



if((__GETC__(life_coplevel) == 0)) then 
{
		["NotWhitelisted",false,true] call BIS_fnc_endMission;
		sleep 35;
};

[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.