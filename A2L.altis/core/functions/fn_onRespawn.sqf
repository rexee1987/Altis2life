/*
	File: fn_onRespawn.sqf
	Author: Bryan "Tonic" Boardwine // Edited by Lars "Somma" Sommer
	
	Description:
	Execute various actions when the _unit respawns.
*/
private["_unit","_corpse","_handle","_spawn"];
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_corpse = [_this,1,objNull,[objNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {};
if(!isNull _corpse) then{deleteVehicle _corpse;};

hideBody _corpse;
deleteVehicle _corpse;
_handle = [] spawn life_fnc_setupActions;
waitUntil {scriptDone _handle};

switch(playerSide) do
{
	case west: 
	{
		//[] spawn life_fnc_loadGear;
		[] call life_fnc_copFetchGear;
		if(headGear player != "") then {removeHeadgear player;};
		if(goggles player != "") then {removeGoggles player;};
	};
	
	case civilian:
	{
		_unit setVariable["restrained",false,true];
		_unit setVariable["Escorting",false,true];
		_unit setVariable["transporting",false,true];
		if(headGear player != "") then {removeHeadgear player;};
		if(goggles player != "") then {removeGoggles player;};
	};
};

if(life_is_arrested) then
{
	hint "Du wolltest dich im Gefängnis umbrigen, um sicher zu sein, dass du das nicht nochmal versuchst werden wir dich etwas länger im Gefängnis behalten und dich beobachten.";
	life_is_arrested = false;
	[_unit,true] spawn life_fnc_jail;
}
	else
{
	titleText["","BLACK FADED"];
	titleFadeOut 9999999999;
	[] call life_fnc_spawnMenu;
	waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
};

_unit addRating 100000;

life_holstered = false;

[[_unit,life_sidechat,playerSide],"STS_fnc_managesc",false,false] spawn life_fnc_MP;
[] call life_fnc_hudUpdate;
cutText ["","BLACK IN"];

[] call life_fnc_civFetchGear;
[1,true] call life_fnc_sessionHandle;

[] call life_fnc_equipGear;