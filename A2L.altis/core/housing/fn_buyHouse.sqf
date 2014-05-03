/*
	File: fn_buyHouse.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Purchases a house and initiates DB entry
*/
private["_house", "_buildingID", "_buildingName", "_owners", "_isLocked", "_uid", "_price"];

_house = cursorTarget;

if (player distance _house > 20) exitWith {};
if (!(_house isKindOf "House")) exitWith {};

_owners = _house getVariable["life_homeOwners", []];
_uid = getPlayerUID player;
_price = [typeOf _house] call life_fnc_housePrice;
_buildingID = [_house] call life_fnc_getBuildID;
_buildingName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");

if (!license_civ_home) exitWith {hint "Du hast keine Haus-Lizenz!";};
if (count life_houses > 4) exitWith {hint "Tut uns leid, mehr wie 5 Häuser geht nicht.";};
if (_price < 0 || _buildingID in life_public_houses || format["%1", _owners] != "[]") exitWith{hint "Das Haus ist nicht verfügbar";};
if (life_atmcash < _price) exitWith {hint format["You do not have $%1 in your bank to purchase %2",[_price] call life_fnc_numberText,_buildingName];};

_house setVariable["life_homeOwners", [_uid], true];
_house setVariable["containers", [], true];
_house setVariable["life_locked", 1, true];
_house setVariable["storage_locked", 1, true];
_house setVariable["Trunk", [], true];
_house setVariable["life_homeOwnerName", [], true];
["atm","take",_price] call life_fnc_updateCash;
titleText[format["You have purchased %1 for %2!", _buildingName, [_price] call life_fnc_numberText],"PLAIN"];

closeDialog 0;
[] call life_fnc_deleteMarkers;

life_houses set [count life_houses, [position _house, _uid, []]];

[] call life_fnc_createMarkers;
		
[[_buildingID, _uid, [], position _house],"BRUUUDIS_fnc_insertHouse",false,false] spawn BIS_fnc_MP;
[] call life_fnc_sessionUpdate;

