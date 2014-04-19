/*
	File: fn_saveGear.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Saves the player / cops gear in a formatted array.
*/
private["_allowedItems","_primary","_handgun","_magazines","_uniform","_vest","_backpack","_items","_primitems","_secitems","_handgunitems","_uitems","_vitems","_bitems","_curWep"];

//Pre-approved weapons / attachments
_allowedItems =
[
	"hgun_ACPC2_F",
	"hgun_PDW2000_F",
	"SMG_02_F",
	"arifle_MX_F",
	"arifle_MXC_F",
	"arifle_TRG20_Holo_F",
	"arifle_Katiba_F",
	"srifle_GM6_F",
	"srifle_EBR_F",
	"srifle_DMR_01_F",
	"srifle_LRR_SOS_F",
	"LMG_Mk200_F",
	"muzzle_snds_acp",
	"muzzle_snds_M",
	"muzzle_snds_H",
	"muzzle_snds_H_MG",
	"muzzle_snds_B",
	"muzzle_snds_L",
	"optic_Holosight",
	"optic_Arco",
	"optic_Hamr",
	"optic_Aco",
	"optic_ACO_grn",
	"acc_flashlight",
	"acc_pointer_IR",
	"launch_RPG32_F",						
	"arifle_sdar_F",
	"hgun_P07_snds_F",
	"hgun_p07_F",
	"optic_MRCO",
	"U_B_CombatUniform_mcam",
	"H_Beret_blk_POLICE",
	"B_Bergen_sgg"
];

//Old format / code
_primary = primaryWeapon player;
_handgun = handGunWeapon player;
_magazines = [];
_uniform = uniform player;
_vest = vest player;
_backpack = backpack player;
_items = assignedItems player;
_primitems = primaryWeaponItems player;
_secitems = secondaryWeaponItems player;
_handgunitems = handGunItems player;
_uitems = [];
_vitems = [];
_bitems = [];

if(!(_primary in _allowedItems)) then {_primary = ""};
if(!(_handgun in _allowedItems)) then {_handgun = ""};
if(_uniform != "") then {{_uitems set[count _uitems,_x];} foreach (uniformItems player);};
if(_vest != "") then {{_vitems set[count _vitems,_x];} foreach (vestItems player);};
if(_backpack != "") then {{_bitems set[count _bitems,_x];} foreach (backPackItems player);};

if(goggles player != "") then { _items set[count _items, goggles player]; };
if(headgear player != "") then { _items set[count _items, headgear player]; };
if(count (primaryWeaponMagazine player) > 0) then
{
	{
		_magazines set[count _magazines,_x];
	} foreach (primaryWeaponMagazine player);
};

if(count (handgunMagazine player) > 0) then
{
	{
		_magazines set[count _magazines,_x];
	} foreach (handgunMagazine player);
};

//Hard code for Laser Desigantor batteries
_curWep = currentWeapon player;
if("Laserdesignator" in assignedItems player) then
{
	player selectWeapon "Laserdesignator";
	if(currentMagazine player != "") then {_magazines set[count _magazines,(currentMagazine player)];};
};

player selectWeapon _curWep;

cop_gear = [_primary,_handgun,_magazines,_uniform,_vest,_backpack,_items,_primitems,_secitems,_handgunitems,_uitems,_vitems,_bitems];