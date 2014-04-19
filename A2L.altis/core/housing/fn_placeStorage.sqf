/*
	File: fn_placeStorage.sqf
	Author: Mario2002
	
	Description:
	place a storage container in a house
*/

private["_item", "_house", "_houseId", "_owners", "_uid", "_maxCount", "_count", "_handle", "_box", "_containers", "_containerId", "_pos", "_storageData"];

_item = [_this,0,"",[""]] call BIS_fnc_param;
_house = getPos player nearestObject "House_F"; 
_owners = _house getVariable["life_homeOwners", []];
_uid = getPlayerUID player;

if (player distance _house > 20) exitWith { hint "You must be inside a house to place storage."; };
if (_item == "storage2" && count (nearestObjects [position _house, ["B_supplyCrate_F"], 5]) > 0) exitWith { hint "You can just place one large storage."; };
if (_item == "storage1" && count (nearestObjects [position _house, ["Land_Box_AmmoOld_F"], 5]) > 0) exitWith { hint "You can just place one small storage."; };
if (!(_uid in _owners)) exitWith { hint "You do not own this house and cannot place storage within it."; };

_maxCount = [typeOf _house] call life_fnc_houseContainers;
if (_maxCount == 0) exitWith { hint "This house does not support storage containers."; };
//if (life_donator < 1) exitWith { hint "You must be donator rank 1 (€10) to place storage in a home."; };
//if (life_donator > 2) then { _maxCount = _maxCount + 1; }; <-- Add this back when we have preset locations per home class

_containers = _house getVariable ["containers", []];
_count = count _containers;
if (_count >= _maxCount) exitWith { hint "You cannot place any more containers at this time."; };

_pos = position _house;
_pos = [(_pos select 0), (_pos select 1), (_pos select 2) + 1];

switch (_item) do {
	case "storage1" : {
		_box = "Land_Box_AmmoOld_F" createVehicle _pos;
		_box setPosATL _pos;
	};
	case "storage2" : {
		_box = "B_supplyCrate_F" createVehicle _pos;		
		_box setPosATL _pos;
	};
};

clearWeaponCargoGlobal _box; 
clearMagazineCargoGlobal _box;
clearItemCargoGlobal _box;
clearBackpackCargoGlobal _box;

_houseId = [_house] call life_fnc_getBuildID;
_containerId = format ["%1_%2", _houseId, _count];
_storageData = [_containerId, _item, typeOf _box];
_containers set [count _containers, _storageData];
_house setVariable ["containers", _containers, true];
_box setVariable["owner", getPlayerUID player, true];
hint "Placing storage container...";

[false,_item,1] call life_fnc_handleInv;
_handle = [] spawn life_fnc_sessionUpdate;
//sleep 0.5;

[[_house, _containers, playerSide, [[],0]],"BRUUUDIS_fnc_updateHouseStorage",false,false] spawn BIS_fnc_MP;