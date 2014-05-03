/*
	File: fn_initSafezone.sqf
	Author: MarioF
	
	Description:
	Checks for the Player to be in Safezone
*/

private["_actSafezone"];

_actSafezone = [];

while {true} do
{
	if((count _actSafezone) > 0) then
	{
		if((player distance (getMarkerPos (_actSafezone select 0))) > _actSafezone select 3) then
		{
			if(alive player) then {
				hint parseText format["<t color='#FF0000'><t size='2'>Safezone Info</t></t><br/>Du verlässt gerade die Safezone %1",_actSafezone select 1];
			};
			player setVariable["inSafezone",false];
			life_safezone_status = false;
			_actSafezone = [];
		};
	} else {
		{
			if((player distance (getMarkerPos (_x select 0))) < _x select 3 && playerSide == _x select 2) exitWith {
				life_safezone_status = true;
				_actSafezone = _x;
				if(_x select 4) then { player setVariable["inSafezone",true]; };
				hint parseText format["<t color='#FF0000'><t size='2'>Safezone Info</t></t><br/>Du bist in einer Safezone %1",_x select 1];
			};
			sleep 1;
		} foreach life_safezone_config;
	};
	
	sleep 3;
};