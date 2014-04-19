/*
	File: fn_onPut.sqf
	Author: Mario2002
	
	Description:
	gets called when a player put something into a container
*/

private["_item", "_container", "_unit", "_house", "_owner"];

_unit = [_this,0] call BIS_fnc_param;
_container = [_this,1] call BIS_fnc_param;
_item = [_this,2,"",[""]] call BIS_fnc_param;
_house = nearestObject [position player, "House_F"];
_owner = _container getVariable ["owner", ""];

if(_owner == "") exitWith {
	_handle = [] spawn life_fnc_sessionUpdate;
};

if(typeOf _container == "B_supplyCrate_F") then {
	_wc = getWeaponCargo _container;
	_mc = getMagazineCargo _container;
	_ic = getItemCargo _container;
	_bc = getBackpackCargo _container;

	//hint format ["put %1 %2 %3 %4 %5 %6 %7", _unit, _wc, _mc, _ic, _bc, _item, _owner];	
	//sleep 0.5;
	[[_house, [_wc, _mc, _ic, _bc]],"BRUUUDIS_fnc_updateHouseWeaponStorage",false,false] spawn BIS_fnc_MP;
};
_handle = [] spawn life_fnc_sessionUpdate;