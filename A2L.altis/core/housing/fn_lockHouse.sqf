#include <macro.h>
/*
	File: fn_lockHouse.sqf
	Author: Mario2002
	
	Description:
	locks/unlocks a house
*/
private["_house", "_buildingName", "_type", "_owners", "_isLocked", "_uid", "_index", "_soundFile", "_numDoors"];

_house = cursorTarget;
_isLocked = _house getVariable["life_locked", 0];
_owners = _house getVariable["life_homeOwners", []];
_uid = getPlayerUID player;
_buildingID = [_house] call life_fnc_getBuildID;

if (!(_uid in _owners)&&(__GETC__(life_coplevel) < 4)) exitWith {};
if (player distance cursorTarget > 20) exitWith {};
if (_house isKindOf "House") then
{
	_buildingName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
	_numDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
	_type = typeOf _house;
	if (_numDoors < 1) exitWith {hint "Du kannst kein Haus ohne Türen abschließen!";};
	
	if (_isLocked == 1) then
	{
		_isLocked = 0;
		hint format["Haus %1 ist geöffnet .", _buildingName];
	}
	else
	{
		_isLocked = 1;
		hint format["Haus ist %1 geschlossen.", _buildingName];
	};
	_house setVariable["life_locked", _isLocked, true];
	
	for "_i" from 1 to _numDoors do
	{
		_house animate [format["door_%1_rot", _i], 0];
		_house setVariable[format["bis_disabled_Door_%1", _i], _isLocked, true];
	};
	
	if (_isLocked == 1) then { _soundFile = "lock"; }
	else { _soundFile = "unlock"; };
};