/*
	File: fn_CatchFrogAction.sqf
	Author: [KNG]MOGGY , Killernetworkgaming.com
	
	Description:
	Gathers frogs!!!
*/
private["_sum"];
_sum = ["frog",3,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

if(_sum > 0) then
{
	life_action_in_use = true;
	titleText["Gathering frogs...","PLAIN"];
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	sleep 2;
	if(([true,"frog",_sum] call life_fnc_handleInv)) then
	{
		titleText[format["You have cought %1 frogs(s)",_sum],"PLAIN"];		
	};
}
	else
{
	hint "Your inventory space is full.";
};

life_action_in_use = false;