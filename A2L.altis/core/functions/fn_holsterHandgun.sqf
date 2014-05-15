/*
	KWF fn_holsterHandgun.sqf
        by Insane
	www.tdc-clan.eu
*/
 
if (vehicle player != player) exitWith {};
if (player getVariable "restrained") exitWith {};
if (isNil("life_holstered")) then { life_holstered = false; };

KWF_holsterHandgun_holsterAction =
{
	if (currentWeapon player != handgunWeapon player) exitWith 	{ hint format["%1",Localize "STR_holsterHandgun_np1"] };
		
	life_holstered_weapon = handgunWeapon player;
	life_holstered_magazine = handgunMagazine player;
	life_holstered_ammo = player ammo life_holstered_weapon;	
	life_holstered_items = handgunItems player;
	player playMove "AmovPercMstpSrasWpstDnon_AmovPercMstpSnonWnonDnon";
	sleep 1;
	
	player removeWeapon life_holstered_weapon;
	life_holstered = true;
	player setVariable["holsteredHandgun", life_holstered_weapon, true];
};

KWF_holsterHandgun_unholsterAction =
{
	if (isNil {life_holstered_weapon}) exitWith {}; 
		
	titleText [ format["%1",Localize "STR_holsterHandgun_ziehe"] , "PLAIN"];
	sleep 2;		
		
	player addWeapon life_holstered_weapon;
	
	{ 
		player addMagazine _x;
	} forEach life_holstered_magazine;
	
	private["_details"];
	{ 
		_details = [_x] call life_fnc_fetchCfgDetails;
		if((_x != "") && (count _details != 0)) then { player addHandgunItem _x; };
	} forEach life_holstered_items;
		
	player setAmmo [life_holstered_weapon, life_holstered_ammo];
	player selectWeapon life_holstered_weapon;
		
	life_holstered_weapon = nil;
	life_holstered = false;
	player setVariable["holsteredHandgun", false, true];
};

if (!life_holstered) then {
		
	[] spawn KWF_holsterHandgun_holsterAction;	
		
} else {

	[] spawn KWF_holsterHandgun_unholsterAction;	
		
};