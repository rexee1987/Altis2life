/*
	File: fn_housePrice.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Returns the buyable house price.
*/
private["_type"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
if(_type == "") exitWith {-1};

switch (_type) do
{
	case "Land_i_House_Small_01_V1_F": {700000};
	case "Land_i_House_Small_01_V2_F": {700000};
	case "Land_i_House_Small_01_V3_F": {700000};
	case "Land_i_House_Small_02_V1_F": {700000};
	case "Land_i_House_Small_02_V2_F": {700000};
	case "Land_i_House_Small_02_V3_F": {700000};
	case "Land_i_House_Small_03_V1_F": {700000};
	case "Land_i_House_Big_01_V1_F": {1500000};
	case "Land_i_House_Big_01_V2_F": {2200000};
	case "Land_i_House_Big_01_V3_F": {1500000};
	case "Land_i_House_Big_02_V1_F": {1500000};
	case "Land_i_House_Big_02_V2_F": {1500000};
	case "Land_i_House_Big_02_V3_F": {1500000};
	case "Land_i_Addon_02_V1_F": {400000};
	case "Land_i_Addon_03_V1_F": {400000};
	case "Land_i_Addon_03mid_V1": {400000};
	case "Land_i_Addon_04_V1_F": {400000};
	case "Land_i_Garage_V1_F": {600000};
	case "Land_i_Garage_V2_F": {550000};
	case "Land_i_Garage_V1_dam_F": {400000};
	default {-1};
};

