/*
	File: fn_seizeWeapon.sqf
	Author: synced-gaming.de David
	
	Description:
	Seize Weapon Script
*/
[[],"life_fnc_seizeWeaponAction",cursorTarget,false] spawn life_fnc_MP;
[[52, player, format["Sie haben die Waffen von %1 beschlagnahmt.", name cursorTarget]],"STS_fnc_logIt",false,false] spawn life_fnc_MP;