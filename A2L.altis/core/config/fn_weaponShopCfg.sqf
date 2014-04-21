#include <macro.h>
/*
	File: fn_weaponShopCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for the weapon shops.
	
	Return:
	String: Close the menu
	Array: 
	[Shop Name,
	[ //Array of items to add to the store
		[classname,Custom Name (set nil for default),price]
	]]
*/
private["_shop"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {closeDialog 0}; //Bad shop type passed.

switch(_shop) do
{
	case "cop_basic":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			default
			{
				["Altis Cop Shop",
					[
						["arifle_sdar_F","Taser Rifle",7500],
						["hgun_P07_snds_F","Stun Pistol",2000],
						["hgun_P07_F",nil,7500],
						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["muzzle_snds_L",nil,650],
						["FirstAidKit",nil,150],
						["Medikit",nil,1000],
						["NVGoggles",nil,2000],
						["SmokeShell",nil,500],
						["16Rnd_9x21_Mag",nil,50],
						["20Rnd_556x45_UW_mag","Taser Rifle Magazine",125]
					]
				];
			};
		};
	};

	case "cop_patrol":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			case (__GETC__(life_coplevel) < 2): {"You are not at a patrol officer rank!"};
			default
			{
				["Altis Patrol Officer Shop",
					[
						["arifle_MX_F",nil,35000],
						["SMG_02_ACO_F",nil,30000],
						["acc_flashlight",nil,750],
						["optic_Holosight",nil,1200],
						["optic_Arco",nil,1800],
						["optic_MRCO",nil,1800],
						["SmokeShell",nil,500],
						["Chemlight_red",nil,300],
						["Chemlight_yellow",nil,300],
						["Chemlight_green",nil,300],
						["Chemlight_blue",nil,300],
						["30Rnd_65x39_caseless_mag",nil,130],
						["30Rnd_9x21_Mag",nil,250]
					]
				];
			};
		};
	};

	case "cop_sergeant":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			case (__GETC__(life_coplevel) < 3): {"You are not at a sergeant rank!"};
			default
			{
				["Altis Sergeant Officer Shop",
					[
						["hgun_ACPC2_F",nil,10000],
						["9Rnd_45ACP_Mag",nil,100],
						["arifle_MX_F",nil,30000],
						["30Rnd_65x39_caseless_mag",nil,200],
						["30Rnd_65x39_caseless_mag",nil,200],
						["srifle_DMR_01_F",nil,45000],
						["10Rnd_762x51_Mag",nil,200],
						["optic_Holosight",nil,1200],
						["optic_Arco",nil,1800],
						["optic_MRCO",nil,1800],
						["optic_Hamr",nil,1800],
						["optic_Aco",nil,1800],
						["optic_ACO_grn",nil,1800],
						["optic_SOS",nil,1800],
						["acc_flashlight",nil,1000],
						["acc_pointer_IR",nil,1000],
						["SmokeShellBlue",nil,500],
						["SmokeShellGreen",nil,500],
						["SmokeShellOrange",nil,500],
						["SmokeShellPurple",nil,500],
						["SmokeShellRed",nil,500],
						["SmokeShellYellow",nil,500],
						["SmokeShell",nil,500],
						["Chemlight_red",nil,300],
						["Chemlight_yellow",nil,300],
						["Chemlight_green",nil,300],
						["Chemlight_blue",nil,300],
						["ItemWatch",nil,450],
						["ItemMap",nil,250],
						["ItemGPS",nil,1000],
						["ToolKit",nil,250],
						["FirstAidKit",nil,350],
						["Medikit",nil,1000],
						["Binocular",nil,450],
						["Rangefinder",nil,450],
						["NVGoggles",nil,2000]
					]
				];
			};
		};
	};

	case "cop_detective":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			case (__GETC__(life_coplevel) < 4): {"You are not at a detective rank!"};
			default
			{
				["Altis Detective Shop",
					[
						["hgun_ACPC2_F",nil,10000],
						["9Rnd_45ACP_Mag",nil,100],
						["arifle_MX_F",nil,30000],
						["30Rnd_65x39_caseless_mag",nil,200],
						["arifle_MXC_F",nil,32000],
						["30Rnd_65x39_caseless_mag",nil,200],
						["srifle_EBR_F",nil,35000],
						["20Rnd_762x51_Mag",nil,200],
						["srifle_DMR_01_F",nil,45000],
						["10Rnd_762x51_Mag",nil,200],
						["optic_Holosight",nil,1200],
						["optic_Arco",nil,1800],
						["optic_MRCO",nil,1800],
						["optic_Hamr",nil,1800],
						["optic_Aco",nil,1800],
						["optic_ACO_grn",nil,1800],
						["optic_SOS",nil,1800],
						["acc_flashlight",nil,1000],
						["acc_pointer_IR",nil,1000],
						["SmokeShell",nil,500],
						["SmokeShellBlue",nil,500],
						["SmokeShellGreen",nil,500],
						["SmokeShellOrange",nil,500],
						["SmokeShellPurple",nil,500],
						["SmokeShellRed",nil,500],
						["SmokeShellYellow",nil,500],
						["Chemlight_red",nil,300],
						["Chemlight_yellow",nil,300],
						["Chemlight_green",nil,300],
						["Chemlight_blue",nil,300],
						["ItemWatch",nil,450],
						["ItemMap",nil,250],
						["ItemGPS",nil,1000],
						["ToolKit",nil,250],
						["FirstAidKit",nil,350],
						["Medikit",nil,1000],
						["Binocular",nil,450],
						["Rangefinder",nil,450],
						["NVGoggles",nil,2000]
					]
				];
			};
		};
	};

	case "cop_lieutenant":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			case (__GETC__(life_coplevel) < 5): {"You are not at a lieutenant rank!"};
			default
			{
				["Altis Lieutenant Shop",
					[
						["hgun_ACPC2_F",nil,10000],
						["9Rnd_45ACP_Mag",nil,100],
						["arifle_MX_F",nil,30000],
						["30Rnd_65x39_caseless_mag",nil,200],
						["arifle_MXC_F",nil,32000],
						["30Rnd_65x39_caseless_mag",nil,200],
						["srifle_GM6_F",nil,30000],
						["5Rnd_127x108_Mag",nil,200],
						["srifle_EBR_F",nil,35000],
						["20Rnd_762x51_Mag",nil,200],
						["srifle_DMR_01_F",nil,45000],
						["10Rnd_762x51_Mag",nil,200],
						["optic_Holosight",nil,1200],
						["optic_Arco",nil,1800],
						["optic_MRCO",nil,1800],
						["optic_Hamr",nil,1800],
						["optic_Aco",nil,1800],
						["optic_ACO_grn",nil,1800],
						["optic_SOS",nil,1800],
						["acc_flashlight",nil,1000],
						["acc_pointer_IR",nil,1000],
						["SmokeShell",nil,500],
						["SmokeShellBlue",nil,500],
						["SmokeShellGreen",nil,500],
						["SmokeShellOrange",nil,500],
						["SmokeShellPurple",nil,500],
						["SmokeShellRed",nil,500],
						["SmokeShellYellow",nil,500],
						["Chemlight_red",nil,300],
						["Chemlight_yellow",nil,300],
						["Chemlight_green",nil,300],
						["Chemlight_blue",nil,300],
						["ItemWatch",nil,450],
						["ItemMap",nil,250],
						["ItemGPS",nil,1000],
						["ToolKit",nil,250],
						["FirstAidKit",nil,350],
						["Medikit",nil,1000],
						["Binocular",nil,450],
						["Rangefinder",nil,450],
						["NVGoggles",nil,2000]
					]
				];
			};
		};
	};
	
	case "cop_captain":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			case (__GETC__(life_coplevel) < 6): {"You are not at a captain rank or higher!"};
			default
			{
				["Altis Captain Shop",
					[
						["hgun_ACPC2_F",nil,10000],
						["9Rnd_45ACP_Mag",nil,100],
						["hgun_PDW2000_F",nil,15000],
						["30Rnd_9x21_Mag",nil,100],
						["SMG_02_F",nil,20000],
						["30Rnd_9x21_Mag",nil,100],
						["arifle_MX_F",nil,30000],
						["30Rnd_65x39_caseless_mag",nil,200],
						["arifle_MXC_F",nil,32000],
						["30Rnd_65x39_caseless_mag",nil,200],
						["arifle_TRG20_Holo_F",nil,33000],
						["30Rnd_556x45_Stanag",nil,200],
						["arifle_Katiba_F",nil,35000],
						["30Rnd_65x39_caseless_green",nil,200],
						["srifle_GM6_F",nil,30000],
						["5Rnd_127x108_Mag",nil,200],
						["srifle_EBR_F",nil,35000],
						["20Rnd_762x51_Mag",nil,200],
						["srifle_DMR_01_F",nil,45000],
						["10Rnd_762x51_Mag",nil,200],
						["srifle_LRR_SOS_F",nil,45000],
						["7Rnd_408_Mag",nil,200],
						["LMG_Mk200_F",nil,45000],
						["200Rnd_65x39_cased_Box",nil,500],
						["optic_Holosight",nil,1200],
						["optic_Arco",nil,1800],
						["optic_MRCO",nil,1800],
						["optic_Hamr",nil,1800],
						["optic_Aco",nil,1800],
						["optic_ACO_grn",nil,1800],
						["optic_SOS",nil,1800],
						["acc_flashlight",nil,1000],
						["acc_pointer_IR",nil,1000],
						["SmokeShell",nil,500],
						["SmokeShellBlue",nil,500],
						["SmokeShellGreen",nil,500],
						["SmokeShellOrange",nil,500],
						["SmokeShellPurple",nil,500],
						["SmokeShellRed",nil,500],
						["SmokeShellYellow",nil,500],
						["Chemlight_red",nil,300],
						["Chemlight_yellow",nil,300],
						["Chemlight_green",nil,300],
						["Chemlight_blue",nil,300],
						["ItemWatch",nil,450],
						["ItemMap",nil,250],
						["ItemGPS",nil,1000],
						["ToolKit",nil,250],
						["FirstAidKit",nil,350],
						["Medikit",nil,1000],
						["Binocular",nil,450],
						["Rangefinder",nil,450],
						["NVGoggles",nil,2000],
						["B_UavTerminal",nil, 350000],
						["launch_RPG32_F",nil,19750],
						["RPG32_F",nil,25000],
						["200Rnd_127x99_mag_Tracer_Red",nil,2500],
						["200Rnd_40mm_G_belt",nil,2900],
						["optic_tws_mg",nil,3500],
						["optic_Nightstalker",nil,3900]
					]
				];
			};
		};
	};

	
	case "rebel":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a cop!"};
			case (!license_civ_rebel): {"You don't have a Rebel training license!"};
			default
			{
				["Mohammed's Jihadi Shop",
					[
						["hgun_ACPC2_F",nil,10500],
						["hgun_PDW2000_F",nil,12500],
						["SMG_02_F",nil,30000],
						["arifle_TRG20_F",nil,70000],						
						["arifle_MX_F",nil,70000],
						["arifle_MXC_F",nil,80000],
						["arifle_Katiba_F",nil,80000],
						["srifle_GM6_F",nil,400000],
						["srifle_DMR_01_F",nil,250000],
						["srifle_LRR_SOS_F",nil,500000],
						["srifle_EBR_ARCO_pointer_snds_F",nil,500000],
						["LMG_Mk200_F",nil,400000],
						["200Rnd_65x39_cased_Box",nil,15000],				
						["optic_Holosight",nil,15000],
						["optic_Arco",nil,19000],
						["optic_Hamr",nil,19000],
						["optic_Aco",nil,15000],
						["optic_ACO_grn",nil,15000],
						["acc_flashlight",nil,9000],
						["acc_pointer_IR",nil,9000],
						["Rangefinder",nil,50000],
						["30Rnd_65x39_caseless_mag",nil,2500],
						["30Rnd_9x21_Mag",nil,1300],
						["9Rnd_45ACP_Mag",nil,1300],
						["20Rnd_762x51_Mag",nil,2500],
						["7Rnd_408_Mag",nil,5000],
						["5Rnd_127x108_Mag",nil,2500],
						["30Rnd_65x39_caseless_green",nil,2500],
						["30Rnd_556x45_Stanag",nil,2500],
						["10Rnd_762x51_Mag",nil,2500],
						["launch_RPG32_F",nil,1000000],
						["RPG32_F",nil,100000],
						["muzzle_snds_B",nil,25000],
						["NVGoggles",nil,2000],
						["SmokeShellGreen",nil,1500],
						["SmokeShellRed",nil,1500],
						["muzzle_snds_H",nil,25000],
						["optic_NVS",nil,60000],
						["optic_SOS",nil,40000],
						["optic_LRPS",nil,40000]
					]
				];
			};
			case (__GETC__(life_donator) == 1):
			{
				["Rebellenshop",
					[
						["hgun_ACPC2_F",nil,10500],
						["hgun_PDW2000_F",nil,12500],
						["SMG_02_F",nil,30000],
						["arifle_TRG20_F",nil,70000],						
						["arifle_MX_F",nil,70000],
						["arifle_MXC_F",nil,80000],
						["arifle_Katiba_F",nil,80000],
						["srifle_GM6_F",nil,400000],
						["srifle_DMR_01_F",nil,250000],
						["srifle_LRR_SOS_F",nil,500000],
						["srifle_EBR_ARCO_pointer_snds_F",nil,500000],
						["LMG_Mk200_F",nil,400000],
						["200Rnd_65x39_cased_Box",nil,15000],				
						["optic_Holosight",nil,15000],
						["optic_Arco",nil,19000],
						["optic_Hamr",nil,19000],
						["optic_Aco",nil,15000],
						["optic_ACO_grn",nil,15000],
						["acc_flashlight",nil,9000],
						["acc_pointer_IR",nil,9000],
						["Rangefinder",nil,50000],
						["30Rnd_65x39_caseless_mag",nil,2500],
						["30Rnd_9x21_Mag",nil,1300],
						["9Rnd_45ACP_Mag",nil,1300],
						["20Rnd_762x51_Mag",nil,2500],
						["7Rnd_408_Mag",nil,5000],
						["5Rnd_127x108_Mag",nil,2500],
						["30Rnd_65x39_caseless_green",nil,2500],
						["30Rnd_556x45_Stanag",nil,2500],
						["10Rnd_762x51_Mag",nil,2500],
						["launch_RPG32_F",nil,1000000],
						["RPG32_F",nil,100000],
						["muzzle_snds_B",nil,25000],
						["NVGoggles",nil,2000],
						["SmokeShellGreen",nil,1500],
						["SmokeShellRed",nil,1500],
						["muzzle_snds_H",nil,25000],
						["optic_NVS",nil,60000],
						["optic_SOS",nil,40000],
						["optic_LRPS",nil,40000]
					]
				];
			};
			
			case (__GETC__(life_donator) == 2):
			{
				["Rebellenshop",
					[
						["hgun_ACPC2_F",nil,10500],
						["hgun_PDW2000_F",nil,12500],
						["SMG_02_F",nil,30000],
						["arifle_TRG20_F",nil,70000],						
						["arifle_MX_F",nil,70000],
						["arifle_MXC_F",nil,80000],
						["arifle_Katiba_F",nil,80000],
						["srifle_GM6_F",nil,400000],
						["srifle_DMR_01_F",nil,250000],
						["srifle_LRR_SOS_F",nil,500000],
						["srifle_EBR_ARCO_pointer_snds_F",nil,500000],
						["LMG_Mk200_F",nil,400000],
						["200Rnd_65x39_cased_Box",nil,15000],				
						["optic_Holosight",nil,15000],
						["optic_Arco",nil,19000],
						["optic_Hamr",nil,19000],
						["optic_Aco",nil,15000],
						["optic_ACO_grn",nil,15000],
						["acc_flashlight",nil,9000],
						["acc_pointer_IR",nil,9000],
						["Rangefinder",nil,50000],
						["30Rnd_65x39_caseless_mag",nil,2500],
						["30Rnd_9x21_Mag",nil,1300],
						["9Rnd_45ACP_Mag",nil,1300],
						["20Rnd_762x51_Mag",nil,2500],
						["7Rnd_408_Mag",nil,5000],
						["5Rnd_127x108_Mag",nil,2500],
						["30Rnd_65x39_caseless_green",nil,2500],
						["30Rnd_556x45_Stanag",nil,2500],
						["10Rnd_762x51_Mag",nil,2500],
						["launch_RPG32_F",nil,1000000],
						["RPG32_F",nil,100000],
						["muzzle_snds_B",nil,25000],
						["NVGoggles",nil,2000],
						["SmokeShellGreen",nil,1500],
						["SmokeShellRed",nil,1500],
						["muzzle_snds_H",nil,25000],
						["optic_NVS",nil,60000],
						["optic_SOS",nil,40000],
						["optic_LRPS",nil,40000]
					]
				];
			};
			
			case (__GETC__(life_donator) == 3):
			{
				["Rebellenshop",
					[
					["hgun_ACPC2_F",nil,10500],
						["hgun_PDW2000_F",nil,12500],
						["SMG_02_F",nil,30000],
						["arifle_TRG20_F",nil,70000],						
						["arifle_MX_F",nil,70000],
						["arifle_MXC_F",nil,80000],
						["arifle_Katiba_F",nil,80000],
						["srifle_GM6_F",nil,400000],
						["srifle_DMR_01_F",nil,250000],
						["srifle_LRR_SOS_F",nil,500000],
						["srifle_EBR_ARCO_pointer_snds_F",nil,500000],
						["LMG_Mk200_F",nil,400000],
						["200Rnd_65x39_cased_Box",nil,15000],				
						["optic_Holosight",nil,15000],
						["optic_Arco",nil,19000],
						["optic_Hamr",nil,19000],
						["optic_Aco",nil,15000],
						["optic_ACO_grn",nil,15000],
						["acc_flashlight",nil,9000],
						["acc_pointer_IR",nil,9000],
						["Rangefinder",nil,50000],
						["30Rnd_65x39_caseless_mag",nil,2500],
						["30Rnd_9x21_Mag",nil,1300],
						["9Rnd_45ACP_Mag",nil,1300],
						["20Rnd_762x51_Mag",nil,2500],
						["7Rnd_408_Mag",nil,5000],
						["5Rnd_127x108_Mag",nil,2500],
						["30Rnd_65x39_caseless_green",nil,2500],
						["30Rnd_556x45_Stanag",nil,2500],
						["10Rnd_762x51_Mag",nil,2500],
						["launch_RPG32_F",nil,1000000],
						["RPG32_F",nil,100000],
						["muzzle_snds_B",nil,25000],
						["NVGoggles",nil,2000],
						["SmokeShellGreen",nil,1500],
						["SmokeShellRed",nil,1500],
						["muzzle_snds_H",nil,25000],
						["optic_NVS",nil,60000],
						["optic_SOS",nil,40000],
						["optic_LRPS",nil,40000]
					]
				];
			};
			
			case (__GETC__(life_donator) == 4):
			{
				["Rebellenshop",
					[
						["hgun_ACPC2_F",nil,10500],
						["hgun_PDW2000_F",nil,12500],
						["SMG_02_F",nil,30000],
						["arifle_TRG20_F",nil,70000],						
						["arifle_MX_F",nil,70000],
						["arifle_MXC_F",nil,80000],
						["arifle_Katiba_F",nil,80000],
						["srifle_GM6_F",nil,400000],
						["srifle_DMR_01_F",nil,250000],
						["srifle_LRR_SOS_F",nil,500000],
						["srifle_EBR_ARCO_pointer_snds_F",nil,500000],
						["LMG_Mk200_F",nil,400000],
						["200Rnd_65x39_cased_Box",nil,15000],				
						["optic_Holosight",nil,15000],
						["optic_Arco",nil,19000],
						["optic_Hamr",nil,19000],
						["optic_Aco",nil,15000],
						["optic_ACO_grn",nil,15000],
						["acc_flashlight",nil,9000],
						["acc_pointer_IR",nil,9000],
						["Rangefinder",nil,50000],
						["30Rnd_65x39_caseless_mag",nil,2500],
						["30Rnd_9x21_Mag",nil,1300],
						["9Rnd_45ACP_Mag",nil,1300],
						["20Rnd_762x51_Mag",nil,2500],
						["7Rnd_408_Mag",nil,5000],
						["5Rnd_127x108_Mag",nil,2500],
						["30Rnd_65x39_caseless_green",nil,2500],
						["30Rnd_556x45_Stanag",nil,2500],
						["10Rnd_762x51_Mag",nil,2500],
						["launch_RPG32_F",nil,1000000],
						["RPG32_F",nil,100000],
						["muzzle_snds_B",nil,25000],
						["NVGoggles",nil,2000],
						["SmokeShellGreen",nil,1500],
						["SmokeShellRed",nil,1500],
						["muzzle_snds_H",nil,25000],
						["optic_NVS",nil,60000],
						["optic_SOS",nil,40000],
						["optic_LRPS",nil,40000]
					]
				];
			};
			
			case (__GETC__(life_donator) == 5):
			{
				["Rebellenshop",
					[
						["hgun_ACPC2_F",nil,10500],
						["hgun_PDW2000_F",nil,12500],
						["SMG_02_F",nil,30000],
						["arifle_TRG20_F",nil,70000],						
						["arifle_MX_F",nil,70000],
						["arifle_MXC_F",nil,80000],
						["arifle_Katiba_F",nil,80000],
						["srifle_GM6_F",nil,400000],
						["srifle_DMR_01_F",nil,250000],
						["srifle_LRR_SOS_F",nil,500000],
						["srifle_EBR_ARCO_pointer_snds_F",nil,500000],
						["LMG_Mk200_F",nil,400000],
						["200Rnd_65x39_cased_Box",nil,15000],				
						["optic_Holosight",nil,15000],
						["optic_Arco",nil,19000],
						["optic_Hamr",nil,19000],
						["optic_Aco",nil,15000],
						["optic_ACO_grn",nil,15000],
						["acc_flashlight",nil,9000],
						["acc_pointer_IR",nil,9000],
						["Rangefinder",nil,50000],
						["30Rnd_65x39_caseless_mag",nil,2500],
						["30Rnd_9x21_Mag",nil,1300],
						["9Rnd_45ACP_Mag",nil,1300],
						["20Rnd_762x51_Mag",nil,2500],
						["7Rnd_408_Mag",nil,5000],
						["5Rnd_127x108_Mag",nil,2500],
						["30Rnd_65x39_caseless_green",nil,2500],
						["30Rnd_556x45_Stanag",nil,2500],
						["10Rnd_762x51_Mag",nil,2500],
						["launch_RPG32_F",nil,1000000],
						["RPG32_F",nil,100000],
						["muzzle_snds_B",nil,25000],
						["NVGoggles",nil,2000],
						["SmokeShellGreen",nil,1500],
						["SmokeShellRed",nil,1500],
						["muzzle_snds_H",nil,25000],
						["optic_NVS",nil,60000],
						["optic_SOS",nil,40000],
						["optic_LRPS",nil,40000]
					]
				];
			};
		};
	};
	
	case "gun":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a cop!"};
			case (!license_civ_gun): {"You don't have a Firearms license!"};
			default
			{
				["Billy Joe's Firearms",
					[
						["hgun_Rook40_F",nil,6500],
						["16Rnd_9x21_Mag",nil,175],
						["hgun_ACPC2_F",nil,8500],
						["9Rnd_45ACP_Mag",nil,300],
						["hgun_PDW2000_F",nil,10000],
						["30Rnd_9x21_Mag",nil,300],
						["arifle_sdar_F",nil,7500],
						["20Rnd_556x45_UW_mag",nil,300],
						["30Rnd_556x45_Stanag",nil,300],
						["acc_flashlight",nil,9000],
						["acc_pointer_IR",nil,9000]
					]
				];
			};
			
			case (__GETC__(life_donator) == 1):
			{
				["STS Donator Shop Tier 1",
					[
						["hgun_Rook40_F",nil,750],
						["hgun_PDW2000_F",nil,6500],
						["optic_ACO_grn_smg",nil,750],
						["ToolKit",nil,50],
						["itemgps",nil,50],
						["16Rnd_9x21_Mag",nil,25],
						["30Rnd_9x21_Mag",nil,75]
					]
				];
			};
			case (__GETC__(life_donator) >= 3):
			{
				["STS Donator Shop Tier 3",
					[
						["hgun_Rook40_F",nil,500],
						["hgun_PDW2000_F",nil,6500],
						["hgun_pistol_heavy_01_F",nil,5850],
						["arifle_Mk20C_plain_F",nil,25000],
						["optic_ACO_grn_smg",nil,750],
						["optic_MRCO",nil,10000],
						["NVGoggles",nil,350],
						["ToolKit",nil,50],
						["itemgps",nil,50],
						["FirstAidKit",nil,25],
						["16Rnd_9x21_Mag",nil,25],
						["30Rnd_9x21_Mag",nil,75],
						["11Rnd_45ACP_Mag",nil,85],
						["30Rnd_556x45_Stanag",nil,125]
					]
				];
			};
			
			case (__GETC__(life_donator) == 2):
			{
				["STS Donator Shop Tier 2",
					[
						["hgun_Rook40_F",nil,750],
						["hgun_PDW2000_F",nil,6500],
						["arifle_MK20C_plain_F",nil,25000],
						["optic_ACO_grn_smg",nil,750],
						["NVGoggles",nil,350],
						["ToolKit",nil,50],
						["itemgps",nil,50],
						["16Rnd_9x21_Mag",nil,25],
						["30Rnd_9x21_Mag",nil,75],
						["30Rnd_556x45_Stanag",nil,125]
					]
				];
			};
		};
	};
	
	case "donator":
	{
		switch(true) do
		{
			case (__GETC__(life_donator) == 0): {"You are not a donator!"};
			case (__GETC__(life_donator) == 1):
			{
				["STS Donator Shop Tier 1",
					[
						["hgun_Rook40_F",nil,750],
						["hgun_PDW2000_F",nil,6500],
						["optic_ACO_grn_smg",nil,750],
						["ToolKit",nil,50],
						["itemgps",nil,50],
						["16Rnd_9x21_Mag",nil,25],
						["30Rnd_9x21_Mag",nil,75]
					]
				];
			};

			case (__GETC__(life_donator) == 2):
			{
				["STS Donator Shop Tier 2",
					[
						["hgun_Rook40_F",nil,750],
						["hgun_PDW2000_F",nil,6500],
						["arifle_MK20C_plain_F",nil,25000],
						["optic_ACO_grn_smg",nil,750],
						["NVGoggles",nil,350],
						["ToolKit",nil,50],
						["itemgps",nil,50],
						["16Rnd_9x21_Mag",nil,25],
						["30Rnd_9x21_Mag",nil,75],
						["30Rnd_556x45_Stanag",nil,125]
					]
				];
			};

			case (__GETC__(life_donator) >= 3):
			{
				["STS Donator Shop Tier 3",
					[
						["hgun_Rook40_F",nil,500],
						["hgun_PDW2000_F",nil,6500],
						["hgun_pistol_heavy_01_F",nil,5850],
						["arifle_Mk20C_plain_F",nil,25000],
						["optic_ACO_grn_smg",nil,750],
						["optic_MRCO",nil,10000],
						["NVGoggles",nil,350],
						["ToolKit",nil,50],
						["itemgps",nil,50],
						["FirstAidKit",nil,25],
						["16Rnd_9x21_Mag",nil,25],
						["30Rnd_9x21_Mag",nil,75],
						["11Rnd_45ACP_Mag",nil,85],
						["30Rnd_556x45_Stanag",nil,125]
					]
				];
			};
		};
	};
	
	case "genstore":
	{
		["Altis General Store",
			[
				["Binocular",nil,150],
				["ItemGPS",nil,500],
				["ToolKit",nil,250],
				["FirstAidKit",nil,150],
				["NVGoggles",nil,2000],
				["Chemlight_red",nil,300],
				["Chemlight_yellow",nil,300],
				["Chemlight_green",nil,300],
				["ItemWatch",nil,750],
				["ItemMap",nil,250]
			]
		];
	};
};
