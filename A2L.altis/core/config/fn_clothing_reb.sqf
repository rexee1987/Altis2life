/*
	File: fn_clothing_reb.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Reb shop.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Mohammed's Jihadi Shop"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
		["U_I_OfficerUniform",nil,5000],
		["U_O_OfficerUniform_ocamo",nil,5000], 
		["U_I_pilotCoveralls",nil,4500],
		["U_B_PilotCoveralls",nil,4500],
		["U_B_HeliPilotCoveralls",nil,4500],
		["U_O_PilotCoveralls",nil,4500],
		["U_O_CombatUniform_oucamo",nil,6000],
		["U_O_SpecopsUniform_ocamo",nil,6000],
		["U_B_SpecopsUniform_sgg",nil,6000],
		["U_O_Wetsuit",nil,7500],
		["U_O_GhillieSuit",nil,30000]
		];
	};
	
	//Hats
	case 1:
	{
		[
			["H_ShemagOpen_tan",nil,850],
			["H_Shemag_olive",nil,850],
			["H_ShemagOpen_khk",nil,800],
			["H_HelmetO_ocamo",nil,2500],
			["H_MilCap_oucamo",nil,1200],
			["H_Bandanna_camo",nil,650],
			["H_Shemag_khk",nil,650],
			["H_Shemag_olive",nil,650],
			["H_Shemag_tan",nil,650],
			["H_PilotHelmetHeli_I",nil,8900],
			["H_PilotHelmetHeli_O",nil,8900] ,
			["H_PilotHelmetHeli_B",nil,8900],
			["H_HelmetIA_net",nil,8900],
			["H_HelmetCrew_O",nil,8900],
			["H_HelmetCrew_B",nil,8900],
			["H_Booniehat_dgtl",nil,5800],
			["H_Booniehat_mcamo",nil,5800]
		];
	};
	
	//Glasses
	case 2:
	{
		[
			["G_Shades_Black",nil,25],
			["G_Shades_Blue",nil,20],
			["G_Sport_Blackred",nil,20],
			["G_Sport_Checkered",nil,20],
			["G_Sport_Blackyellow",nil,20],
			["G_Sport_BlackWhite",nil,20],
			["G_Squares",nil,10],
			["G_Lowprofile",nil,30],
			["G_Combat",nil,55]
		];
	};
	
	//Vest
	case 3:
	{
		[
			["V_TacVest_khk",nil,12500],
			["V_BandollierB_cbr",nil,4500],
			["V_HarnessO_brn",nil,7500],
			["V_Chestrig_blk",nil,7500],
			["V_Chestrig_khk",nil,7500],
			["V_Chestrig_oli",nil,7500],
			["V_Chestrig_rgr",nil,7500],
			["V_HarnessO_brn",nil,7500],
			["V_HarnessO_gry",nil,7500],
			["V_HarnessOGL_brn",nil,7500],
			["V_HarnessOGL_gry",nil,7500],
			["V_HarnessOSpec_brn",nil,7500],
			["V_HarnessOSpec_gry",nil,7500],
			["V_PlateCarrierIA1_dgtl",nil,7500],
			["V_TacVest_blk",nil,7500],
			["V_TacVest_brn",nil,7500],
			["V_TacVest_camo",nil,7500],
			["V_TacVest_khk",nil,7500],
			["V_TacVest_oli",nil,7500],
			["V_TacVestIR_blk",nil,7500]
		];
	};
	
	//Backpacks
	case 4:
	{
		[
		["B_AssaultPack_khk",nil,2500],
		["B_AssaultPack_dgtl",nil,2500],
		["B_AssaultPack_rgr",nil,2500],
		["B_AssaultPack_sgg",nil,2500],
		["B_AssaultPack_blk",nil,2500],
		["B_AssaultPack_cbr",nil,2500],
		["B_AssaultPack_mcamo",nil,2500],
		["B_Kitbag_mcamo",nil,2500],
		["B_Kitbag_sgg",nil,2500],
		["B_Kitbag_cbr",nil,2500],
		["B_Bergen_sgg",nil,2500],
		["B_Bergen_mcamo",nil,2500],
		["B_Bergen_rgr",nil,2500],
		["B_Bergen_blk",nil,2500],
		["B_FieldPack_blk",nil,2500],
		["B_FieldPack_ocamo",nil,2500],
		["B_FieldPack_oucamo",nil,2500],
		["B_FieldPack_cbr",nil,2500],
		["B_Carryall_ocamo",nil,2500],
		["B_Carryall_oucamo",nil,2500],
		["B_Carryall_mcamo",nil,2500],
		["B_Carryall_oli",nil,2500],
		["B_Carryall_khk",nil,2500],
		["B_Carryall_cbr",nil,2500],
		["B_OutdoorPack_blk",nil,2500],
		["B_OutdoorPack_tan",nil,2500],
		["B_OutdoorPack_blu",nil,2500],
		["B_HuntingBackpack",nil,2500]
		];
	};
};