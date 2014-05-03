/*
	File: fn_economyGetPricelist.sqf
	Author: MarioF
	
	Description:
	
*/
private["_return","_unit"];

_unit = _this select 0;

_return = [] call ECO_fnc_economyPrices;

[[_return],"life_fnc_economyUpdatePricelistClient",_unit] spawn life_fnc_MP;