/*
	File: fn_preCloseHouseStorage.sqf
	Author: Mario2002
	
	Description:
	updates the house storage when the inventory menu gets closed
*/
private["_house","_containers", "_trunk"];
_house = cursorTarget;

_containers = _house getVariable ["containers", []];
_trunk = _house getVariable ["Trunk", [[],0]];

[[_house, _containers, playerSide, _trunk],"BRUUUDIS_fnc_updateHouseStorage",false,false] spawn BIS_fnc_MP;