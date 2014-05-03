/*
	File: fn_queryPlayerHouses.sqf
	Author: Mario2002
	
	Description:
	get all houses of a player
*/
private["_uid","_side","_sql","_sql2","_query","_storage","_old","_ret","_new"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_side = [_this,1,civilian,[civilian]] call BIS_fnc_param;

//Error checks
if(_uid == "") exitWith {"Invalid UID"};

switch (_side) do
{	
	case civilian:
	{
		_query = format["SELECT houses.position, houses.storage, houses.weapon_storage FROM houses WHERE pid='%1'",_uid];
		diag_log format ["queryPlayerHouses : %1", _query];
		_sql = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['%2', '%1']", _query,(call LIFE_SCHEMA_NAME)];
		_sql = call compile format["%1", _sql];
		waitUntil {typeName _sql == "ARRAY"};
	};
};

//diag_log format ["sql join : %1 (%2)", _sql, typeName _sql];

if(isNil {((_sql select 0) select 0)}) then
{
	_ret = [];
}
	else
{
	_ret = [];
	if(count (_sql select 0) == 0) exitWith {_ret = [];};
	switch(_side) do
	{		
		case civilian:
		{
			_i = 0;
			{	
				_new = [(_x select 0)] call DB_fnc_mresToArray;
				if(typeName _new == "STRING") then {_new = call compile format["%1", _new];};
				//diag_log format ["pos : %1 (%2)", _new, typeName _new];
				
				_storage = [(_x select 1)] call DB_fnc_mresToArray;
				if(typeName _storage == "STRING") then {_storage = call compile format["%1", _storage];};
				//diag_log format ["storage : %1 (%2)", _storage, typeName _storage];
				
				_weaponStorage = [(_x select 2)] call DB_fnc_mresToArray;
				if(typeName _weaponStorage == "STRING") then {_weaponStorage = call compile format["%1", _weaponStorage];};
				//diag_log format ["_weaponStorage : %1 (%2)", _weaponStorage, typeName _weaponStorage];
				
				_ret set[_i, [_new,_storage, _weaponStorage]];
				//_ret set[_i, _new];
				_i = _i + 1;
			}forEach (_sql select 0);
		};
	};	
};
//diag_log format["return : %1", _ret];	
_ret;