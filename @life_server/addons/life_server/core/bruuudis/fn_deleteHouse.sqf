/*
	File: fn_deleteHouse.sqf
	Author: Mario2002
	
	Description:
	deletes a house
*/
private["_sql","_sql2","_query","_houseId","_ret","_new", "_query", "_query2"];
_houseId = [_this,0,"",[""]] call BIS_fnc_param;;
_query = format["DELETE FROM houses WHERE house_id='%1'",_houseId];

_sql = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['%2', '%1']", _query,(call LIFE_SCHEMA_NAME)];
waitUntil {typeName _sql == "STRING"};
_sql = call compile format["%1", _sql];
diag_log format ["sql : %1 (%2)", _sql, typeName _sql];