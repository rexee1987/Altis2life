/*
	File: fn_updateHouseStorage.sqf
	Author: Mario2002
	
	Description:
	updates the house storage
*/
private["_sql","_sql2","_query","_query2","_storage","_containerId","_containers","_house_id", "_count", "_box"];
_house = [_this,0] call BIS_fnc_param;
_data = [_this,1,[],[[]]] call BIS_fnc_param;
_side = [_this,2,civilian,[civilian]] call BIS_fnc_param;
_trunk = [_this,3,[[],0],[[]]] call BIS_fnc_param;

_houseId = [_house] call life_fnc_getBuildID;
_data = [_data] call DB_fnc_mresArray;
_trunk = [_trunk] call DB_fnc_mresArray;
switch (_side) do
{	
	case civilian:
	{
		_query = format["UPDATE houses SET storage='%1', trunk ='%2' WHERE house_id = '%3'", _data, _trunk, _houseId];
		//diag_log format ["query: %1", _query];
	};
};
_sql = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['%2', '%1']", _query,(call LIFE_SCHEMA_NAME)];
waitUntil {typeName _sql == "STRING"};
_sql = call compile format["%1", _sql];
//diag_log format ["sql : %1 (%2)", _sql, typeName _sql];