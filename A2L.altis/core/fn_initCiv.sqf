#include <macro.h>
/*
	File: fn_initCiv.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the civilian.
*/
private["_end"];
player addRating 9999999;
waitUntil {!(isNull (findDisplay 46))};
_end = false;
if((__GETC__(life_ban) == 1)) then 
{
		["Gebannt",false,true] call BIS_fnc_endMission;
		sleep 35;
};

waitUntil {!(isNull (findDisplay 46))};

if(life_is_arrested) then
{
	life_is_arrested = false;
	[player,true] spawn life_fnc_jail;
}

	else
{
	[] call life_fnc_spawnMenu;
	waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
	waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
};

// player addRating 9999999;

[] call life_fnc_zoneCreator;
[] call life_fnc_initHouses;
// Start Safezone checks
// [] spawn life_fnc_initSafezone;
