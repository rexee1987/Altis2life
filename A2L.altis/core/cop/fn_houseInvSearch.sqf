#include <macro.h>
/*
*/
private["_vehicle","_vehicleInfo","_value"];
_vehicle = cursorTarget;
if(isNull _vehicle) exitWith {hint "There is no house"};
if(!(_vehicle isKindOf "House_F")) exitWith {};

_vehicleInfo = _vehicle getVariable ["Trunk",[]];
if(count _vehicleInfo == 0) exitWith {hint "This house is empty"};

_value = 0;
{
	_var = _x select 0;
	_val = _x select 1;
	
	_index = [_var,life_illegal_items] call fnc_index;
	if(_index != -1) then
	{
		_vIndex = [_var,__GETC__(sell_array)] call fnc_index;
		if(_vIndex != -1) then
		{
			_value = _value + (_val * ((__GETC__(sell_array) select _vIndex) select 1));
		};
	};
} foreach (_vehicleInfo select 0);

if(_value > 0) then
{
	[[0,format["A house was searched and has $%1 worth of drugs / contraband.",[_value] call life_fnc_numberText]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
	life_atmcash = life_atmcash + _value;
	_vehicle setVariable["Trunk",[[],0],true];
}
	else
{
	hint "Nothing illegal in this house.";
};