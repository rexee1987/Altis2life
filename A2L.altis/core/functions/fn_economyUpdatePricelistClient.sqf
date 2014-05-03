/*
	File: fn_economySell.sqf
	Author: MarioF
	
	Description:
	
*/

private["_rawList","_pList","_pListIll","_aTemp"];

_rawList = _this select 0;
_pList = [];
_pListIll = [];

for "_i" from 0 to (count _rawList) -1 do
{
	_aTemp = _rawList select _i;
	_pList set [_i,[_aTemp select 0, parseNumber (_aTemp select 1)]];
	if(_aTemp select 2 == "1") then { _pListIll set [(count _pListIll),[_aTemp select 0, parseNumber (_aTemp select 1)]]; };
};

sell_array = _pList;
life_illegal_items = _pListIll;