/*
	File: fn_calVehWeight.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Base configuration for vehicle weight
*/
private["_vehicle","_weight","_used"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {};

_weight = -1;
_used = (_vehicle getVariable "Trunk") select 1;

switch ((typeOf _vehicle)) do
{
	case "C_Offroad_01_F": {_weight = 100;};
	case "B_G_Offroad_01_F": {_weight = 100;};
	case "B_Quadbike_01_F": {_weight = 50;};
	case "I_Truck_02_covered_F": {_weight = 300;};
	case "I_Truck_02_transport_F": {_weight = 250;};
	case "C_Hatchback_01_F": {_weight = 80;};
	case "C_Hatchback_01_sport_F": {_weight = 80;};
	case "C_SUV_01_F": {_weight = 90;};
	case "C_Van_01_transport_F": {_weight = 120;};
	case "I_G_Van_01_transport_F": {_weight = 120;};
	case "C_Van_01_box_F": {_weight = 180;};
	case "C_Boat_Civil_01_F": {_weight = 175;};
	case "C_Boat_Civil_01_police_F": {_weight = 175;};
	case "C_Boat_Civil_01_rescue_F": {_weight = 175;};
	case "B_Truck_01_box_F": {_weight = 700;};
	case "B_Truck_01_transport_F": {_weight = 520;};
	case "B_MRAP_01_F": {_weight = 65;};
	case "O_MRAP_02_F": {_weight = 60;};
	case "I_MRAP_03_F": {_weight = 58;};
	case "B_Heli_Light_01_F": {_weight = 50;};
	case "O_Heli_Light_02_unarmed_F": {_weight = 120;};
	case "I_Heli_Transport_02_F": {_weight = 250;};
	case "C_Rubberboat": {_weight = 45;};
	case "O_Boat_Armed_01_hmg_F": {_weight = 175;};
	case "B_Boat_Armed_01_minigun_F": {_weight = 175;};
	case "I_Boat_Armed_01_minigun_F": {_weight = 175;};
	case "B_G_Boat_Transport_01_F": {_weight = 175;};
	case "B_Boat_Transport_01_F": {_weight = 175;};
	case "I_Truck_02_box_F": {_weight = 175;};
	case "B_SDV_01_F": {_weight = 165;};
	case "B_MRAP_01_hmg_F": {_weight = 45;};
	case "B_MRAP_01_gmg_F": {_weight = 45;};
	case "B_Truck_01_covered_F": {_weight = 550;};
	case "Land_Box_AmmoOld_F": {_weight = 700;};
    case "B_supplyCrate_F": {_weight = 1000;};
	case "O_Truck_03_covered_F": {_weight = 400;};
};

if(isNil "_used") then {_used = 100};
[_weight,_used];