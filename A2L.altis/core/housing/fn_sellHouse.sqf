/*
	File: fn_sellHouse.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Sell a house and initiates DB removal
*/
private["_house", "_buildingID", "_buildingName", "_owners", "_isLocked", "_uid", "_price", "_val", "_i", "_j", "_house"];

_house = cursorTarget;

if (player distance _house > 20) exitWith {};
if (!(_house isKindOf "House")) exitWith {};

_owners = _house getVariable["life_homeOwners", []];
_uid = getPlayerUID player;
_price = [typeOf _house] call life_fnc_housePrice;
_buildingID = [_house] call life_fnc_getBuildID;
_buildingName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
_price = _price * 0.75; // 75% of buy price for sale

if (!(_uid in _owners)) exitWith {hint "You do not own this property!";};

_owners = _owners - [_uid];
_house setVariable["life_homeOwners", _owners, true];
_house setVariable["life_locked", 0, true];
_house setVariable["storage_locked", 0, true];
_house setVariable["containers", [], true];
_house setVariable["Trunk", [], true];
_house setVariable["life_homeOwnerName", [], true];
["atm","add",_price] call life_fnc_updateCash;
titleText[format["You have sold %1 for $%2!", _buildingName, [_price] call life_fnc_numberText],"PLAIN"];

closeDialog 0;

_j = 0;	
{	
	if((typeName _x) == "ARRAY") then {
		_house2 = nearestObject [_x select 0, "House_F"];
		//diag_log format ["position _house  : %1 (%2), %3 (%4)", (position _house) select 0, typeName ((position _house) select 0), (position _house) select 1, typeName ((position _house) select 1)];
		//diag_log format ["_x select 0  : %1 (%2), %3 (%4)", (_x select 0), typeName (_x select 0), (_x select 1), typeName (_x select 1)];
		//(_x select 0) = call compile format["%1", (_x select 0)];
		//diag_log format ["_x select 0  : %1 (%2), %3 (%4)", (_x select 0), typeName (_x select 0), (_x select 1), typeName (_x select 1)];
		if(((position _house) select 0) == ((position _house2) select 0) AND ((position _house) select 1) == ((position _house2) select 1)) then {
			life_houses set [_j, -1];
			life_houses = life_houses - [-1];
		};		
	};	
	_j = _j + 1;
}forEach life_houses;
//diag_log format ["LIFE_HOUSES  : %1", life_houses];
//diag_log format ["LIFE_HOUSES MARKERS : %1", life_houses_markers];
[] call life_fnc_deleteMarkers;

//diag_log format ["LIFE_HOUSES MARKERS : %1", life_houses_markers];

[] call life_fnc_createMarkers;

_house = cursorTarget;
_house setVariable ["life_locked", 1, true];
_boxes = nearestObjects [position _house, ["Land_Box_AmmoOld_F","B_supplyCrate_F"], 5]; 

{
	deleteVehicle _x;
}forEach _boxes;
	
[[_buildingID, position _house],"BRUUUDIS_fnc_deleteHouse",false,false] spawn BIS_fnc_MP;
[] call life_fnc_sessionUpdate;

