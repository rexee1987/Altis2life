/*
	File: fn_robReserve.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for robbing the federal reserve.
*/
private["_vault","_funds","_timer","_toFar"];
_vault = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_funds = [_this,1,-1,[0]] call BIS_fnc_param;
_toFar = false;

if(isNull _vault OR _funds == -1) exitWith {}; //Bad data
if(player distance _vault > 125) exitWith {[[_vault,-1],"STS_fnc_robberyState",false,false] spawn life_fnc_MP; hint "You were to stay within 125m of the vault!"};

// Je mehr Spieler desto mehr Geld im Safe

if (count playableUnits < 10) then
{
	_funds = 1000000;
} else {
		_funds = count playableUnits * 150000;
	};
	
// Code Bankraub

_cops = (west countSide playableUnits);
if(_cops <= 10) exitWith{[[_vault,-1],"TON_fnc_robberyState",false,false] spawn life_fnc_MP; hint "Es sind nicht genug Polizisten Online!";};

_timer = time + (10 * 60); //Default timer is 10 minutes to rob.
titleText["Cracking the safe...","PLAIN"];
[[], "life_fnc_playBankAlarm", true, false] spawn BIS_fnc_MP;
[[2,"$$$ Vereinte Bank von Altis WIRD AUSGERAUBT!!! $$$"],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;


while {true} do
{
	//Timer display (TO BE REPLACED WITH A NICE GUI LAYER)
	_countDown = if(round(_timer - time) > 60) then {format["%1 minute(s)",round(round(_timer - time) / 60)]} else {format["%1 second(s)",round(_timer - time)]};
	hintSilent format["You need to stay within 15m!\n\nTime Remaining:\n %1\n\nDistance: %2m",_countDown,round(player distance _vault)];

	if(player distance _vault > 15) exitWith {_toFar = true;};
	if((round(_timer - time)) < 1) exitWith {};
	if(!alive player) exitWith {};
	if(life_istazed) exitWith {};
};

switch(true) do
{
	case (_toFar):
	{
		hint "You went to far from the safe, the robbery has failed!";
		[[_vault,0],"TON_fnc_robberyState",false,false] spawn life_fnc_MP;
	};
	
	case (!alive player):
	{
		hint "Because you died the robbery failed.";
		[[_vault,0],"TON_fnc_robberyState",false,false] spawn life_fnc_MP;
	};
	
	case (life_istazed):
	{
		hint "You were tazed, the robbery has failed!";
		[[_vault,0],"TON_fnc_robberyState",false,false] spawn life_fnc_MP;
	};
	
	case ((round(_timer - time)) < 1):
	{
		hint format["You have successfully robbed $%1\n\nTo avoid the cops tracing you, your bank card will not work for 8 minutes",[_funds] call life_fnc_numberText];
		[] spawn
		{
			life_use_atm = false;
			sleep 480;
			life_use_atm = true;
		};
		life_cash = life_cash + _funds;
		[[_vault,1,_funds],"TON_fnc_robberyState",false,false] spawn life_fnc_MP;
	};
};