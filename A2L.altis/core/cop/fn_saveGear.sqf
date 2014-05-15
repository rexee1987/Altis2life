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
						"9Rnd_45ACP_Mag",
						"hgun_PDW2000_F",,
						"30Rnd_9x21_Mag",
						"SMG_02_F",
						"arifle_MX_F",
						"arifle_MX_SW_F",
						"arifle_MXM_Black_F",
						"arifle_MX_GL_Black_F",
						"arifle_TRG20_Holo_F",
						"arifle_Katiba_F",
						"srifle_GM6_F",,
						"srifle_EBR_F",
						"srifle_DMR_01_F",
						"srifle_LRR_SOS_F",
						"LMG_Mk200_F",
						"LMG_Zafir_F",
						"optic_Holosight",
						"optic_Arco",
						"optic_MRCO",
						"optic_Hamr",
						"optic_Aco",
						"optic_ACO_grn",
						"optic_SOS",
						"acc_flashlight",
						"acc_pointer_IR",
						"ItemWatch",
						"ItemMap",
						"ItemGPS",
						"ToolKit",
						"FirstAidKit",
						"Medikit",
						"Binocular",
						"Rangefinder",
						"NVGoggles",
						"launch_RPG32_F",
						"optic_Nightstalker"
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