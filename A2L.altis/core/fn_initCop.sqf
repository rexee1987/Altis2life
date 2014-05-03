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
	["gebannt",false,true] call BIS_fnc_endMission;
	sleep 30;
};

switch (__GETC__(life_coplevel)) do {
	case 1: { life_paycheck = 5000; };
	case 2: { life_paycheck = 7500; };
	case 3: { life_paycheck = 10000; };
	case 4: { life_paycheck = 30000; };
	case 5: { life_paycheck = 40000; };
	case 6: { life_paycheck = 45000; };
	case 7: { life_paycheck = 60000; };
	case 8: { life_paycheck = 80000; };
	case 9: { life_paycheck = 90000; };
	case 10: { life_paycheck = 100000; };
	case 11: { life_paycheck = 120000; };
	case 12: { life_paycheck = 200000; };
	default { life_paycheck = 3000; };
};

if((__GETC__(life_coplevel) == 0)) then 
{
		["NotWhitelisted",false,true] call BIS_fnc_endMission;
		sleep 35;
};

[] call life_fnc_spawnMenu;
[] call life_fnc_copUniform;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.


