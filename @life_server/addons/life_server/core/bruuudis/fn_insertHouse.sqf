/*
	File: fn_insertHouse.sqf
	Author: Mario2002
	
	Description:
	inserts a house into the database
*/
private["_uid","_side","_type","_className","_color","_plate","_query","_sql"];

_houseId = [_this,0,"",[""]] call BIS_fnc_param;
_uid = [_this,1,"",[""]] call BIS_fnc_param;
_storage = [_this,2,[],[[]]] call BIS_fnc_param;
_position = [_this,3,[],[[]]] call BIS_fnc_param;

_storage = [_storage] call DB_fnc_mresArray;
_trunk = [[[], 0]] call DB_fnc_mresArray;
_position = [_position] call DB_fnc_mresArray;
//Stop bad data being passed.
if(_uid == "" OR _houseId == "") exitWith {};

_query = format["INSERT INTO houses (house_id, pid, storage, trunk, position, occupied) VALUES ('%1', '%2', '%3', '%4', '%5', '%6')",_houseId, _uid, _storage, _trunk, _position, 1];
_sql = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['%2', '%1']", _query,(call LIFE_SCHEMA_NAME)];
diag_log format ["query : %1", _query];