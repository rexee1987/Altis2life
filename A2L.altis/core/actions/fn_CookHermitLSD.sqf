/*
	@Author: [KNG]MOGGY , Killernetworkgaming.com
*/
private ["_amount"];
_amount = life_inv_frog;
if (life_inv_frog <= 0) exitWith { hint "You have no frogs with you."; };

if (([false, "frog", _amount] call life_fnc_handleInv)) then {
	titleText["Cooking Hermit LSD...", "PLAIN"];
	titleFadeOut 4.5;
	sleep 5;
	if (([true, "froglsd", _amount] call life_fnc_handleInv)) then 
	{
		titleText [format ["You have cooked %1 Hermit LSD.", _amount], "PLAIN"];
	};
};