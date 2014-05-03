/*
	File: fn_queryHouses.sqf
	Author: Mario2002
	
	Description:
	get all the houses
*/
private["_sql","_query","_queryCount","_old","_ret","_new", "_i", "_count"];

_queryCount = "SELECT COUNT(*) FROM houses";
_count = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['%2', '%1']", _queryCount,(call LIFE_SCHEMA_NAME)];
_count = call compile format["%1", _count];
_count = ((_count select 0) select 0) select 0;
_count = parseNumber _count;
diag_log format ["Houses Count : %1 (%2)", _count , typeName _count];

_ret = [];

for[{_j = 0},{_j < _count},{_j = _j + 10}] do {

	_query = format ["SELECT position, pid, storage, trunk, players.name FROM houses JOIN players ON houses.pid = players.playerid LIMIT %1, 10", _j];

	_sql = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['%2', '%1']", _query,(call LIFE_SCHEMA_NAME)];
	waitUntil {typeName _sql == "STRING"};
	_sql = call compile format["%1", _sql];
	diag_log format ["sql : %1 (%2)", _sql, typeName _sql];

	if(isNil {((_sql select 0) select 0)}) then
	{
		//[];
	}
		else
	{		
		if(count (_sql select 0) == 0) exitWith {[]};
		
		_i = 0;
		{	
			_new = [(_x select 0)] call DB_fnc_mresToArray;
			if(typeName _new == "STRING") then {_new = call compile format["%1", _new];};
			diag_log format ["new : %1 (%2)", _new, typeName _new];
					
			_containers = [(_x select 2)] call DB_fnc_mresToArray;
			if(typeName _containers == "STRING") then {_containers = call compile format["%1", _containers];};
			diag_log format ["newContainer : %1 (%2)", _containers, typeName _containers];
			
			_trunk = [(_x select 3)] call DB_fnc_mresToArray;
			if(typeName _trunk == "STRING") then {_trunk = call compile format["%1", _trunk];};
			diag_log format ["trunk : %1 (%2)", _trunk, typeName _trunk];
			
			_ret set [count _ret, [_new, (_x select 1), _containers, _trunk, (_x select 4)]];
			
			_i = _i + 1;
		
		}forEach (_sql select 0);
		//diag_log format["return pos: %1", _ret];		
	};
};

_ret;