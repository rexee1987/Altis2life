private["_sum"];
_sum = ["birne",3,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

if(_sum > 0) then
{
	life_action_inUse = true;
	titleText["Pflücke Birnen...","PLAIN"];
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	sleep 2;
	if(([true,"birne",_sum] call life_fnc_handleInv)) then
	{
		titleText[format["Du hast %1 Birnen geerntet",_sum],"PLAIN"];
	};
}
	else
{
	hint localize "STR_NOTF_InvFull";
};

life_action_inUse = false;