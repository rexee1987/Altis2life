/*
	File: fn_seizeWeaponAction.sqf
	Author: synced-gaming / David
	
	Description:
	Removes the players weapons client side
*/
removeAllWeapons player;
[] call life_fnc_civFetchGear;
[] call life_fnc_sessionUpdate;
[] call life_fnc_civLoadGear;
titleText["Ihre Waffen wurden beschlagnahmt!","PLAIN"];