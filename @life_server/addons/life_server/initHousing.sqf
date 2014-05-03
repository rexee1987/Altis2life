/*
	File: initHousing.sqf
	Author: Mario2002
	
	Description:
	init
*/

diag_log "INIT HOUSING";
private ["_allHouses","_house","_numDoors","_i"];
_allHouses = [] call BRUUUDIS_fnc_queryHouses;
//diag_log format ["ALL HOUSES : %1 (%2)", _allHouses, typeName _allHouses];

{
	//diag_log format ["HOUSE POS : %1 (%2)", (_x select 0), typeName (_x select 0)];
	_house = nearestObject [(_x select 0), "House_F"];
	_house setVariable["life_homeOwners", [(_x select 1)], true];
	_house setVariable["life_locked", 1, true];
	_house setVariable["storage_locked", 1, true];
	_house setVariable["containers", (_x select 2), true];
	_house setVariable["Trunk", (_x select 3), true];
	_house setVariable["life_homeOwnerName", [(_x select 4)], true];
	
	_numDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");	
	
	for "_i" from 1 to _numDoors do
	{
		_house setVariable[format["bis_disabled_Door_%1", _i], 1, true];
	};
		
}forEach _allHouses;

onPlayerDisconnected {
	
	private ["_houses","_boxes","_numDoors","_uid"];
	_houses = [_uid, civilian] call BRUUUDIS_fnc_queryPlayerHouses;

	{
		_boxes = nearestObjects [(_x select 0), ["Land_Box_AmmoOld_F","B_supplyCrate_F"], 5]; 
		_house = (_x select 0) nearestObject "House_F"; 
		_house setVariable ["life_locked", 1, true];
		_house setVariable ["storage_locked", 1, true];
		
		{
			deleteVehicle _x;
		}forEach _boxes;
	
		_numDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");	
		
		for "_i" from 1 to _numDoors do
		{
			_house animate [format["door_%1_rot", _i], 0];
			_house setVariable[format["bis_disabled_Door_%1", _i], 1, true];
		};
	}forEach _houses;
}; 
diag_log "INIT HOUSING END";