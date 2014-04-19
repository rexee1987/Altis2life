/*
	File: fn_equipGear.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Initializes custom gear textures
*/

if (playerSide == west) then {
	if ((uniform player) == "U_Rangemaster") then
	{
		[[player,"texture\police_shirt.paa"], "life_fnc_setUniform", true, true] spawn BIS_fnc_mp;
	};
	if ((uniform player) == "U_B_CombatUniform_mcam") then
	{
		[[player,"texture\swat_shirt.paa"], "life_fnc_setUniform", true, true] spawn BIS_fnc_mp;
	};
};