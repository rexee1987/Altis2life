/*
	File: fn_gatherApples.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gathers apples?
*/
private["_sum"];
_sum = ["apple",3,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

if(_sum > 0) then
{
	life_action_inUse = true;
	titleText["Gathering Apples...","PLAIN"];
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	sleep 1;
	if(([true,"apple",_sum] call life_fnc_handleInv)) then
	{
		titleText[format["Du hast %1 Aepfel gepfluegt",_sum],"PLAIN"];
	};
}
	else
{
	hint localize "STR_NOTF_InvFull";
};

life_action_inUse = false;