#include <macro.h>
/*
	File: fn_setupActions.sqf
	
	Description:
	Master addAction file handler for all client-based actions.
*/

private["_count","_itemActions"];

// Init Counter for Segmentation
_count = 0;

// Init ActionArrays
_itemActions = [];
_itemChemlights = [];
_vehActions = [];
_persActions = [];
_gatherActions = [];
_houseActions = [];
_inVehActions = [];

while{true} do
{

// Vehicle Actions
if(_count % 22 == 0) then {
if(vehicle player != player && Alive player) then {
if((count _inVehActions) == 0) then {
switch (playerSide) do
{
	case west:
	{
		//ICWS
		_inVehActions = _inVehActions + [player addAction["ICWS",{hint "Searching...."; [[player],"life_fnc_wantedFetch",false,false] spawn life_fnc_MP;},"",-1,false,false,""]];
		//Lights?
		_inVehActions = _inVehActions + [player addAction["Siren Lights ON",{[[vehicle player,0.22],"life_fnc_copLights",true,false] spawn life_fnc_MP; vehicle player setVariable["lights",true,true];},"",0,false,false,"",' vehicle player != player && (typeOf vehicle player) in ["C_Offroad_01_F","B_MRAP_01_F","C_SUV_01_F","C_Hatchback_01_sport_F"] && !isNil {vehicle player getVariable["lights",false]} && ((driver vehicle player) == player) && !(vehicle player getVariable["lights",false])']];
		_inVehActions = _inVehActions + [player addAction["Siren Lights OFF",{vehicle player setVariable["lights",false,true];},"",0,false,false,"", ' vehicle player != player && (typeOf vehicle player) in ["C_Offroad_01_F","B_MRAP_01_F","C_SUV_01_F","C_Hatchback_01_sport_F"] && !isNil {vehicle player getVariable "lights"} && ((driver vehicle player) == player) && (vehicle player getVariable "lights") ']];
	};
};
	// Fast Rope Action
	_inVehActions = _inVehActions + [player addAction["<t color='#ffff00'>Toss Ropes</t>", zlt_fnc_createropes, [], -1, false, false, '','[] call zlt_fnc_ropes_cond']];
	_inVehActions = _inVehActions + [player addAction["<t color='#ff0000'>Cut Ropes</t>", zlt_fnc_removeropes, [], -1, false, false, '','not zlt_mutexAction and count ((vehicle player) getvariable ["zlt_ropes", []]) != 0']];
	_inVehActions = _inVehActions + [player addAction["<t color='#00ff00'>FASTROPE!</t>", zlt_fnc_fastrope, [], 15, false, false, '','not zlt_mutexAction and count ((vehicle player) getvariable ["zlt_ropes", []]) != 0 and player != driver vehicle player']];
};
} else {
	if((count _inVehActions) > 0) then {
		//systemChat "REMOVE Vehicle Actions";
		{
			player removeAction _x;
		} foreach _inVehActions;
		_inVehActions = [];
	};
};
};

// Vehicle Actions
if(_count % 5 == 0) then {
if(!isNull cursorTarget && (player distance cursorTarget) < 7 && speed cursorTarget < 5 && (cursorTarget isKindOf "Car" || cursorTarget isKindOf "Air" || cursorTarget isKindOf "Ship") && !life_action_inUse && vehicle player == player && Alive player) then {
if((count _vehActions) == 0) then {
switch (playerSide) do
{
	//systemChat "ADD Vehicle Actions";
	case west:
	{
		//Impound Vehicle
		_vehActions = _vehActions + [player addAction["Impound Vehicle",life_fnc_impoundAction,"",0,false,false,"",
		' !isNull cursorTarget && (player distance cursorTarget) < 6 && speed cursorTarget < 2 && (cursorTarget isKindOf "Car" || cursorTarget isKindOf "Air" || cursorTarget isKindOf "Ship") && !life_action_inUse' ]];
		//Search Vehicle
		_vehActions = _vehActions + [player addAction["Search Vehicle",life_fnc_searchVehAction,cursorTarget,0,false,false,"",
		' !isNull cursorTarget && (player distance cursorTarget) < 5 && speed cursorTarget < 2 && (cursorTarget isKindOf "Car" || cursorTarget isKindOf "Air" || cursorTarget isKindOf "Ship") && !life_action_inUse']];
		// Search Trunk
		_vehActions = _vehActions + [player addAction["Search Trunk",life_fnc_vehInvSearch,cursorTarget,0,false,false,"",
		' !isNull cursorTarget && (player distance cursorTarget) < 6 && speed cursorTarget < 2 && (cursorTarget isKindOf "Car" || cursorTarget isKindOf "Air" || cursorTarget isKindOf "Ship") && !life_action_inUse']];
		// Put in Vehicle
		_vehActions = _vehActions + [player addAction["Put in Vehicle",life_fnc_putInCar,"",5,false,false,"",
		' !isNull cursorTarget && (player distance cursorTarget) < 6 && speed cursorTarget < 2 && (cursorTarget isKindOf "Car" || cursorTarget isKindOf "Air" || cursorTarget isKindOf "Ship") && ((((position player) nearEntities [["Man"],5]) select 0) getVariable "Escorting")' ]];
		_vehActions = _vehActions + [player addAction["Pull out of vehicle",life_fnc_pulloutAction,cursorTarget,0,false,false,"",
		' !isNull cursorTarget && (player distance cursorTarget) < 4 && (count crew cursorTarget) > 0 && speed cursorTarget < 2 && (cursorTarget isKindOf "Car" || cursorTarget isKindOf "Air" || cursorTarget isKindOf "Ship") && !life_action_inUse']];
		_vehActions = _vehActions + [player addAction["Send Vehicle to impoundment lot",{deleteVehicle cursorTarget},"",0,false,false,"",
		' !isNull cursorTarget && (player distance cursorTarget) < 4 && speed cursorTarget < 2 && (cursorTarget isKindOf "Car" || cursorTarget isKindOf "Air" || cursorTarget isKindOf "Ship") && ((player distance (getMarkerPos "police_hq_1") < 30) OR  (player distance (getMarkerPos "police_hq_2") < 30) OR (player distance (getMarkerPos "cop_spawn_3") < 30) OR  (player distance (getMarkerPos "cop_spawn_5") < 30)) && !life_action_inUse']];
	};
	case civilian:
	{
		// Put in Vehicle
		_vehActions = _vehActions + [player addAction["Put in Vehicle",life_fnc_putInCar,"",5,false,false,"",
		' !isNull cursorTarget && (player distance cursorTarget) < 6 && speed cursorTarget < 2 && (cursorTarget isKindOf "Car" || cursorTarget isKindOf "Ship") && ((((position player) nearEntities [["Man"],5]) select 0) getVariable "Escorting")' ]];
	};
};

//Custom Repair
_vehActions = _vehActions + [player addAction["<t color='#FF0000'>Repair Vehicle</t>",life_fnc_repairTruck,"",99,false,false,"", 
' vehicle player == player && !isNull cursorTarget && ((cursorTarget isKindOf "Car") OR (cursorTarget isKindOf "Air") OR (cursorTarget isKindOf "Ship")) && (damage cursorTarget) > 0.001 && ("ToolKit" in (backpackItems player)) && (player distance cursorTarget < ((boundingBox cursorTarget select 1) select 0) + 2) ']];
};
} else {
	if((count _vehActions) > 0) then {
		//systemChat "REMOVE Vehicle Actions";
		{
			player removeAction _x;
		} foreach _vehActions;
		_vehActions = [];
	};
};
};

// Actions with Persons
if(_count % 3 == 0) then {
if(!isNull cursorTarget && (player distance cursorTarget) < 6 && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && !life_action_inUse && vehicle player == player && Alive player) then {
if((count _persActions) == 0) then {
switch (playerSide) do
{
	//systemChat "ADD Person Actions";
	case west:
	{
		// Restrain Person
		_persActions = _persActions + [player addAction["Restrain",life_fnc_restrainAction,cursorTarget,9999999,false,false,"",' 
		!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget == civilian) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && speed cursorTarget < 1 ']];
		//Ticket Action
		_persActions = _persActions + [player addAction["Give Ticket",life_fnc_ticketAction,"",0,false,false,"",'
		!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget == civilian) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable "Escorting") && (cursorTarget getVariable "restrained") ']]; 
		//Escort
		_persActions = _persActions + [player addAction["Escort",life_fnc_escortAction,[cursorTarget],0,false,false,"",'
		!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget == civilian) && alive cursorTarget && cursorTarget distance player < 3.5 && (cursorTarget getVariable "restrained") && !(cursorTarget getVariable "Escorting") ']]; 
		_persActions = _persActions + [player addAction["Stop Escorting",life_fnc_stopEscorting,_unit,0,false,false,"",
		' !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && animationState cursorTarget == "AmovPercMstpSnonWnonDnon_Ease" && (side cursorTarget == civilian) && player distance cursorTarget < 3.5 && (cursorTarget getVariable "Escorting")']];
		//Unrest Action
		_persActions = _persActions + [player addAction["Unrestrain",life_fnc_unrestrain,cursorTarget,6,false,false,"",
		' !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && animationState cursorTarget == "AmovPercMstpSnonWnonDnon_Ease" && (side cursorTarget == civilian) && player distance cursorTarget < 3.5 && (cursorTarget getVariable "restrained") && !(cursorTarget getVariable "Escorting") ']];
		//Send to jail
		_persActions = _persActions + [player addAction["Send to Jail",life_fnc_arrestAction,"",0,false,false,"",'
		!isNull cursorTarget && isPlayer cursorTarget && (side cursorTarget == civilian) && (cursorTarget getVariable "restrained") && alive cursorTarget && (player distance cursorTarget < 3.5) && ((player distance (getMarkerPos "police_hq_1") < 30) OR  (player distance (getMarkerPos "police_hq_2") < 30) OR (player distance (getMarkerPos "cop_spawn_3") < 30) OR  (player distance (getMarkerPos "cop_spawn_5") < 30)) && !(cursorTarget getVariable "Escorting") ']];
		//Search Action
		_persActions = _persActions + [player addAction["Search",life_fnc_searchAction,cursorTarget,0,false,false,"",
		' !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && animationState cursorTarget == "AmovPercMstpSnonWnonDnon_Ease" && (side cursorTarget == civilian) && player distance cursorTarget < 3.5 && !(cursorTarget getVariable "Escorting") ']];
		// Seize Weapons 
		_persActions = _persActions + [player addAction["Seize Player Weapon",life_fnc_seizePlayerWeapon,cursorTarget,0,false,false,"",
		'!isNull cursorTarget && (player distance cursorTarget) < 5 && speed cursorTarget < 2 && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget == civilian) && (cursorTarget getVariable "restrained")']];
		// Drug test
		_persActions = _persActions + [player addAction["Drug test",life_fnc_drugtestAction,cursorTarget,0,false,true,"",
		' !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && animationState cursorTarget == "AmovPercMstpSnonWnonDnon_Ease" && (cursorTarget getVariable "restrained") && (side cursorTarget == civilian) && player distance cursorTarget < 3.5 && !(cursorTarget getVariable "Escorting") ']];
		// Extinguish Joint
		_persActions = _persActions + [player addAction["<t color='#FF0000'>Extinguish Joint</t>",life_fnc_extinguishJoint,"",6, false, true, "", 
		' !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && animationState cursorTarget == "AmovPercMstpSnonWnonDnon_Ease" && (cursorTarget getVariable "restrained") && (side cursorTarget == civilian) && player distance cursorTarget < 3.5 && (cursorTarget getVariable ["smoke_weed",false]) && (cursorTarget getVariable ["restrained",false]) ']];

	};
	case civilian:
	{
		//Restrain Action
		_persActions = [player addAction["Fesseln",life_fnc_restrainAction,cursorTarget,9999999,false,false,"",' 
		!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && animationState cursorTarget == "Incapacitated" && (side cursorTarget == civilian) && alive cursorTarget && cursorTarget distance player < 5 && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && speed cursorTarget < 1 ']];
		//Escorting
		_persActions = _persActions + [player addAction["Abführen",life_fnc_escortAction,[cursorTarget],0,false,false,"",'
		!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget == civilian) && alive cursorTarget && cursorTarget distance player < 5 && (cursorTarget getVariable "restrained") && !(cursorTarget getVariable "Escorting") ']]; 
		_persActions = _persActions + [player addAction["Abführen stoppen",life_fnc_stopEscorting,_unit,0,false,false,"",
		' !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && animationState cursorTarget == "AmovPercMstpSnonWnonDnon_Ease" && (side cursorTarget == civilian) && player distance cursorTarget < 3.5 && (cursorTarget getVariable "Escorting")']];
		_persActions = _persActions + [player addAction["Entfesseln",life_fnc_unrestrain,cursorTarget,6,false,false,"",
		' !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && animationState cursorTarget == "AmovPercMstpSnonWnonDnon_Ease" && (side cursorTarget == civilian) && player distance cursorTarget < 3 && (cursorTarget getVariable "restrained") && !(cursorTarget getVariable "Escorting") ']];
		//Rob person
		//_persActions = _persActions + [player addAction["Rob Person",life_fnc_robAction,"",0,false,false,"",'
		//!isNull cursorTarget && player distance cursorTarget < 3.5 && isPlayer cursorTarget && animationState cursorTarget == "Incapacitated" && !(cursorTarget getVariable["robbed",FALSE]) ']];
        life_actions = life_actions + [player addAction["Rob Person",life_fnc_robAction,"",0,false,false,"",'
		!isNull cursorTarget && player distance cursorTarget < 3.5 && isPlayer cursorTarget && animationState cursorTarget in ["Incapacitated","amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon"] && !(cursorTarget getVariable["robbed",FALSE]) ']];
	};
	
};
};
} else {
	if((count _persActions) > 0) then {
		//systemChat "REMOVE Person Actions";
		{
			player removeAction _x;
		} foreach _persActions;
		_persActions = [];
	};
};
};

// Gathering Actions
if(_count % 28 == 0) then {
if(vehicle player == player && Alive player && !life_action_in_use && ((player distance (getMarkerPos "heroin_1") < 150) || (player distance (getMarkerPos "apple_1") < 50) || (player distance (getMarkerPos "apple_2") < 50) || (player distance (getMarkerPos "peaches_1") < 50) || (player distance (getMarkerPos "peaches_2") < 50) || (player distance (getMarkerPos "peaches_3") < 50) || (player distance (getMarkerPos "apple_3") < 50) || (player distance (getMarkerPos "apple_4") < 50) || (player distance (getMarkerPos "oil_field_1") < 40) || (player distance (getMarkerPos "oil_field_2") < 20) || (player distance (getMarkerPos "turtle_1") < 350) || (player distance (getMarkerPos "turtle_2") < 350) || (player distance (getMarkerPos "turtle_3") < 350) || (player distance (getMarkerPos "weed_1") < 60) || (player distance (getMarkerPos "cocaine_1") < 150))) then {
if((count _gatherActions) == 0) then {
switch (playerSide) do
{
	case civilian:
	{
		//Gather Heroin
		_gatherActions = _gatherActions + [player addAction["Gather Heroin",life_fnc_gatherHeroin,"",5,false,false,"",'
		!life_action_in_use && (player distance (getMarkerPos "heroin_1") < 150) && (vehicle player == player) && (life_carryWeight + (["heroinu"] call life_fnc_itemWeight)) <= life_maxWeight ']];
		//Pick Apples, fields 1 and 2
		_gatherActions = _gatherActions + [player addAction["Pick Apples",life_fnc_gatherApples,"",5,false,false,"",'
		!life_action_in_use && ((player distance (getMarkerPos "apple_1") < 50) OR (player distance (getMarkerPos "apple_2") < 50)) && (vehicle player == player) ']];
		_gatherActions = _gatherActions + [player addAction["Pick Peaches",life_fnc_gatherPeaches,"",5,false,false,"",'
		!life_action_in_use && ((player distance (getMarkerPos "peaches_1") < 50) OR (player distance (getMarkerPos "peaches_2") < 50)) && (vehicle player == player) ']];
		_gatherActions = _gatherActions + [player addAction["Pick Peaches",life_fnc_gatherPeaches,"",5,false,false,"",'
		!life_action_in_use && (player distance (getMarkerPos "peaches_3") < 50) && (vehicle player == player) ']];
		//Pick Apples, fields 3 and 4
		_gatherActions = _gatherActions + [player addAction["Pick Apples",life_fnc_gatherApples,"",5,false,false,"",'
		!life_action_in_use && ((player distance (getMarkerPos "apple_3") < 50) OR (player distance (getMarkerPos "apple_4") < 50)) && (vehicle player == player) ']];
		//Collect Oil
		_gatherActions = _gatherActions + [player addAction["Collect Oil",life_fnc_gatherOil,"",5,false,false,"",'
		!life_action_in_use && ((player distance (getMarkerPos "oil_field_1") < 40) OR (player distance (getMarkerPos "oil_field_2") < 20)) && (vehicle player == player) && (life_carryWeight + (["oilu"] call life_fnc_itemWeight)) <= life_maxWeight ']];
		//Grab turtle
		_gatherActions = _gatherActions + [player addAction["Grab Turtle",life_fnc_catchTurtle,"",5,false,false,"",'
		!isNull cursorTarget && (typeOf cursorTarget) == "Turtle_F" && ((player distance (getMarkerPos "turtle_1") < 350) OR (player distance (getMarkerPos "turtle_2") < 350) OR (player distance (getMarkerPos "turtle_3") < 350)) && !alive cursorTarget && (life_carryWeight + (["turtle"] call life_fnc_itemWeight)) <= life_maxWeight']];
		//Gather Cannabis
		_gatherActions = _gatherActions + [player addAction["Gather Cannabis",life_fnc_gatherCannabis,"",5,false,false,"",'
		!life_action_in_use && (player distance (getMarkerPos "weed_1") < 60) && (vehicle player == player) && (life_carryWeight + (["cannabis"] call life_fnc_itemWeight)) <= life_maxWeight ']];
		_gatherActions = _gatherActions + [player addAction["Gather Cocaine",life_fnc_gatherCocaine,"",5,false,false,"",'
		!life_action_in_use && (player distance (getMarkerPos "cocaine_1") < 150) && (vehicle player == player) && (life_carryWeight + (["cocaine"] call life_fnc_itemWeight)) <= life_maxWeight ']];

	};
	
};
};
} else {
	if((count _gatherActions) > 0) then {
		//systemChat "REMOVE Gather Actions";
		{
			player removeAction _x;
		} foreach _gatherActions;
		_gatherActions = [];
	};
};
};

// House Actions
if(_count % 10 == 0) then {
if(!isNull cursorTarget && (player distance cursorTarget) < 21 && (cursorTarget isKindOf "House_F") && !life_action_inUse && vehicle player == player) then {
if((count _houseActions) == 0) then {
switch (playerSide) do
{
	//systemChat "ADD House Actions";
	case west:
	{
		//search house		
		_houseActions = _houseActions + [player addAction["<t color='#FFFF00'>Search House</t>",life_fnc_houseOwnerSearch,cursorTarget,5,false,false,"",
		' !isNull cursorTarget && (player distance cursorTarget) < 10 && speed cursorTarget < 2 && (cursorTarget isKindOf "Land_i_House_Small_01_V1_F" || cursorTarget isKindOf "Land_i_House_Small_01_V2_F" || cursorTarget isKindOf "Land_i_House_Small_01_V3_F" || cursorTarget isKindOf "Land_i_House_Small_02_V1_F" || cursorTarget isKindOf "Land_i_House_Small_02_V2_F" || cursorTarget isKindOf "Land_i_House_Small_02_V3_F" || cursorTarget isKindOf "Land_i_House_Small_03_V1_F" || cursorTarget isKindOf "Land_i_House_Big_01_V1_F" || cursorTarget isKindOf "Land_i_House_Big_01_V2_F" || cursorTarget isKindOf "Land_i_House_Big_01_V3_F" || cursorTarget isKindOf "Land_i_House_Big_02_V1_F" || cursorTarget isKindOf "Land_i_House_Big_02_V2_F" || cursorTarget isKindOf "Land_i_House_Big_02_V3_F") && !life_action_inUse']];
		_houseActions = _houseActions + [player addAction["<t color='#FF0000'>Raid House</t>",life_fnc_raidHouse,cursorTarget,5,false,false,"",
		' !isNull cursorTarget && (player distance cursorTarget) < 10 && speed cursorTarget < 2 && (count (cursorTarget getVariable ["life_homeOwners", []]) > 0) && (cursorTarget isKindOf "Land_i_House_Small_01_V1_F" || cursorTarget isKindOf "Land_i_House_Small_01_V2_F" || cursorTarget isKindOf "Land_i_House_Small_01_V3_F" || cursorTarget isKindOf "Land_i_House_Small_02_V1_F" || cursorTarget isKindOf "Land_i_House_Small_02_V2_F" || cursorTarget isKindOf "Land_i_House_Small_02_V3_F" || cursorTarget isKindOf "Land_i_House_Small_03_V1_F" || cursorTarget isKindOf "Land_i_House_Big_01_V1_F" || cursorTarget isKindOf "Land_i_House_Big_01_V2_F" || cursorTarget isKindOf "Land_i_House_Big_01_V3_F" || cursorTarget isKindOf "Land_i_House_Big_02_V1_F" || cursorTarget isKindOf "Land_i_House_Big_02_V2_F" || cursorTarget isKindOf "Land_i_House_Big_02_V3_F") && !life_action_inUse']];		
		_houseActions = _houseActions + [player addAction["<t color='#FFFF00'>Search House Inventory</t>",life_fnc_houseInvSearch,cursorTarget,5,false,false,"",
		' !isNull cursorTarget && (player distance cursorTarget) < 5 && speed cursorTarget < 2 && (cursorTarget getVariable ["life_locked", 1] == 0) && (cursorTarget isKindOf "Land_i_House_Small_01_V1_F" || cursorTarget isKindOf "Land_i_House_Small_01_V2_F" || cursorTarget isKindOf "Land_i_House_Small_01_V3_F" || cursorTarget isKindOf "Land_i_House_Small_02_V1_F" || cursorTarget isKindOf "Land_i_House_Small_02_V2_F" || cursorTarget isKindOf "Land_i_House_Small_02_V3_F" || cursorTarget isKindOf "Land_i_House_Small_03_V1_F" || cursorTarget isKindOf "Land_i_House_Big_01_V1_F" || cursorTarget isKindOf "Land_i_House_Big_01_V2_F" || cursorTarget isKindOf "Land_i_House_Big_01_V3_F" || cursorTarget isKindOf "Land_i_House_Big_02_V1_F" || cursorTarget isKindOf "Land_i_House_Big_02_V2_F" || cursorTarget isKindOf "Land_i_House_Big_02_V3_F") && !life_action_inUse']];
	};
	case civilian:
	{
		//Houses
		_houseActions = _houseActions + [player addAction["<t color='#FF0000'>Toggle House Locks</t>",life_fnc_lockHouse,cursorTarget,10,false,false,"",
		'!isNull cursorTarget && (player distance cursorTarget) < 20 && cursorTarget isKindOf "House" && license_civ_home && __GETC__(life_donator) > 0 && (getPlayerUID player) in (cursorTarget getVariable["life_homeOwners", []])']];
		_houseActions = _houseActions + [player addAction["<t color='#FFFF00'>Toggle Storage Locks</t>",life_fnc_lockStorage,cursorTarget,10,false,false,"",
		'!isNull cursorTarget && (player distance cursorTarget) < 20 && cursorTarget isKindOf "House" && license_civ_home && __GETC__(life_donator) > 0 && (getPlayerUID player) in (cursorTarget getVariable["life_homeOwners", []])']];
		_houseActions = _houseActions + [player addAction["<t color='#00FF00'>House Menu</t>",life_fnc_houseMenu,cursorTarget,10,false,false,"",
		'!isNull cursorTarget && (player distance cursorTarget) < 20 && cursorTarget isKindOf "House" && ([typeOf cursorTarget] call life_fnc_housePrice) > -1 && !(([cursorTarget] call life_fnc_getBuildID) in life_public_houses)']];
		_houseActions = _houseActions + [player addAction["Item Storage",life_fnc_openStorage,cursorTarget,10,false,false,"",
		' !isNull cursorTarget && (player distance cursorTarget) < 6 && cursorTarget isKindOf "House"  && speed cursorTarget < 2 && (count (cursorTarget getVariable["containers", []]) > 0) && license_civ_home && __GETC__(life_donator) > 0 && ((getPlayerUID player) in (cursorTarget getVariable["life_homeOwners", []]) || ((cursorTarget getVariable["storage_locked", 1]) == 0))']];// || !(cursorTarget getVariable["life_locked", true])
		_houseActions = _houseActions + [player addAction["Vehicle Garage",life_fnc_vehicleGarage,"car",0,false,false,"",
		' !isNull cursorTarget && (player distance cursorTarget) < 20 && cursorTarget isKindOf "House" && license_civ_home && __GETC__(life_donator) > 0 && (typeOf cursorTarget == "Land_i_Garage_V1_F" || typeOf cursorTarget == "Land_i_Garage_V2_F" || typeOf cursorTarget == "Land_i_Garage_V1_dam_F") && (((getPlayerUID player) in (cursorTarget getVariable["life_homeOwners", []])) || ((cursorTarget getVariable["life_locked", 1]) == 0)) ']];
		_houseActions = _houseActions + [player addAction["Store Vehicle in Garage",life_fnc_storeVehicle,"""",0,false,false,"""",
		' !life_garage_store && !isNull cursorTarget && (player distance cursorTarget) < 20 && license_civ_home && __GETC__(life_donator) > 0 && cursorTarget isKindOf "House" && (typeOf cursorTarget == "Land_i_Garage_V1_F" || typeOf cursorTarget == "Land_i_Garage_V2_F" || typeOf cursorTarget == "Land_i_Garage_V1_dam_F") && (((getPlayerUID player) in (cursorTarget getVariable["life_homeOwners", []])) || (cursorTarget getVariable["life_locked", 1]) == 0) ']];
	};
	
};
};
} else {
	if((count _houseActions) > 0) then {
		//systemChat "REMOVE House Actions";
		{
			player removeAction _x;
		} foreach _houseActions;
		_houseActions = [];
	};
};
};

// Chemlights
if(_count % 25 == 0) then {
if(isNil "life_chemlight" && ("Chemlight_blue" in (magazines player) || "Chemlight_green" in (magazines player) || "Chemlight_yellow" in (magazines player) || "Chemlight_red" in (magazines player)) && vehicle player == player && Alive player) then
{
if((count _itemChemlights) == 0) then {
	//systemChat "ADD Chemlights";
	//Use Chemlights in hand
	_itemChemlights = _itemChemlights + [player addAction["Chemlight (RED) in Hand",life_fnc_chemlightUse,"red",-1,false,false,"",
	' isNil "life_chemlight" && "Chemlight_red" in (magazines player) && vehicle player == player ']];
	_itemChemlights = _itemChemlights + [player addAction["Chemlight (YELLOW) in Hand",life_fnc_chemlightUse,"yellow",-1,false,false,"",
	' isNil "life_chemlight" && "Chemlight_yellow" in (magazines player) && vehicle player == player ']];
	_itemChemlights = _itemChemlights + [player addAction["Chemlight (GREEN) in Hand",life_fnc_chemlightUse,"green",-1,false,false,"",
	' isNil "life_chemlight" && "Chemlight_green" in (magazines player) && vehicle player == player ']];
	_itemChemlights = _itemChemlights + [player addAction["Chemlight (BLUE) in Hand",life_fnc_chemlightUse,"blue",-1,false,false,"",
	' isNil "life_chemlight" && "Chemlight_blue" in (magazines player) && vehicle player == player ']];
};
} else {
	if((count _itemChemlights) > 0) then {
		//systemChat "REMOVE Chemlights";
		{
			player removeAction _x;
		} foreach _itemChemlights;
		_itemChemlights = [];
	};
};
};

// Actions to Pickup an Item
if(_count % 8 == 5) then {
if(!isNull cursorTarget && vehicle player == player && (player distance cursorTarget) < 4 && typeName (cursorTarget getVariable ["item",""]) == (typeName []) && Alive player) then {
if((count _itemActions) == 0) then {
	//systemChat "ADD Item Pickup";
	//Pickup Water
	_itemActions = _itemActions + 
	[player addAction["Pickup Water",life_fnc_pickupItem,"",5,false,false,"",
	' !isNull cursorTarget && (typeOf cursorTarget) == "Land_BottlePlastic_V1_F" && ((cursorTarget getVariable "item") select 0) == "water" && (player distance cursorTarget) < 3 && (life_carryWeight + (["water"] call life_fnc_itemWeight)) <= life_maxWeight ']];
	//Pickup Coffee
	_itemActions = _itemActions + 
	[player addAction["Pickup Coffee",life_fnc_pickupItem,"",5,false,false,"",
	' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Can_V3_F" && ((cursorTarget getVariable "item") select 0) == "coffee" && (player distance cursorTarget) < 3 && (life_carryWeight + (["coffee"] call life_fnc_itemWeight)) <= life_maxWeight ']];
	//Pickup Money
	_itemActions = _itemActions +
	[player addAction["Pickup Money",life_fnc_pickupMoney,"",5,false,false,"",
	' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Money_F" && ((cursorTarget getVariable "item") select 0) == "money" && (player distance cursorTarget) < 3 ']];
	//Pickup Unprocessed Oil
	_itemActions = _itemActions +
	[player addAction["Pickup Unprocessed Oil",life_fnc_pickupItem,false,5,false,false,"",
	' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "oilu" && (player distance cursorTarget) < 3 && (life_carryWeight + (["oilu"] call life_fnc_itemWeight)) <= life_maxWeight ']];
	//Pickup Processed Oil
	_itemActions = _itemActions +
	[player addAction["Pickup Processed Oil",life_fnc_pickupItem,true,5,false,false,"",
	' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "oilp" && (player distance cursorTarget) < 3 && (life_carryWeight + (["oilp"] call life_fnc_itemWeight)) <= life_maxWeight ']];
	//Pickup Unprocessed Heroin
	_itemActions = _itemActions +
	[player addAction["Pickup Unprocessed Heroin",life_fnc_pickupItem,false,5,false,false,"",
	' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "heroinu" && (player distance cursorTarget) < 3 && (life_carryWeight + (["heroinu"] call life_fnc_itemWeight)) <= life_maxWeight ']];
	//Pickup Processed Heroin
	_itemActions = _itemActions +
	[player addAction["Pickup Processed Heroin",life_fnc_pickupItem,true,5,false,false,"",
	' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "heroinp" && (player distance cursorTarget) < 3 && (life_carryWeight + (["heroinp"] call life_fnc_itemWeight)) <= life_maxWeight ']];
	//Pickup Cannabis
	_itemActions = _itemActions +
	[player addAction["Pickup Cannabis",life_fnc_pickupItem,true,5,false,false,"",
	' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "cannabis" && (player distance cursorTarget) < 3 && (life_carryWeight + (["cannabis"] call life_fnc_itemWeight)) <= life_maxWeight ']];
	//Pickup Marijjuana
	_itemActions = _itemActions +
	[player addAction["Pickup Marijuana",life_fnc_pickupItem,true,5,false,false,"",
	' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "marijuana" && (player distance cursorTarget) < 3 && (life_carryWeight + (["marijuana"] call life_fnc_itemWeight)) <= life_maxWeight ']];
	//Pickup Apple
	_itemActions = _itemActions +
	[player addAction["Pickup Apple",life_fnc_pickupItem,false,5,false,false,"",
	' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "apple" && (player distance cursorTarget) < 3 && (life_carryWeight + (["apple"] call life_fnc_itemWeight)) <= life_maxWeight ']];
	//Pickup Rabbit MEat
	_itemActions = _itemActions +
	[player addAction["Pickup Rabbit Meat",life_fnc_pickupItem,"rabbit",5,false,false,"",
	' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "rabbit" && (player distance cursorTarget) < 3 && (life_carryWeight + (["rabbit"] call life_fnc_itemWeight)) <= life_maxWeight ']];
	//Pickup salema
	_itemActions = _itemActions +
	[player addAction["Pickup Salema Meat",life_fnc_pickupItem,"salema",5,false,false,"",
	' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "salema" && (player distance cursorTarget) < 3 && (life_carryWeight + (["salema"] call life_fnc_itemWeight)) <= life_maxWeight ']];
	//Pickup ornate
	_itemActions = _itemActions +
	[player addAction["Pickup Ornate Meat",life_fnc_pickupItem,"ornate",5,false,false,"",
	' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "ornate" && (player distance cursorTarget) < 3 && (life_carryWeight + (["ornate"] call life_fnc_itemWeight)) <= life_maxWeight ']];
	//Pickup mackerel
	_itemActions = _itemActions +
	[player addAction["Pickup Mackerel Meat",life_fnc_pickupItem,"mackerel",5,false,false,"",
	' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "mackerel" && (player distance cursorTarget) < 3 && (life_carryWeight + (["mackerel"] call life_fnc_itemWeight)) <= life_maxWeight ']];
	//Pickup tuna
	_itemActions = _itemActions +
	[player addAction["Pickup Tuna Meat",life_fnc_pickupItem,"tuna",5,false,false,"",
	' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "tuna" && (player distance cursorTarget) < 3 && (life_carryWeight + (["tuna"] call life_fnc_itemWeight)) <= life_maxWeight ']];
	//Pickup mullet
	_itemActions = _itemActions +
	[player addAction["Pickup Mullet Meat",life_fnc_pickupItem,"mullet",5,false,false,"",
	' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "mullet" && (player distance cursorTarget) < 3 && (life_carryWeight + (["mullet"] call life_fnc_itemWeight)) <= life_maxWeight ']];
	//Pickup catshark
	_itemActions = _itemActions +
	[player addAction["Pickup Catshark Meat",life_fnc_pickupItem,"catshark",5,false,false,"",
	' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "catshark" && (player distance cursorTarget) < 3 && (life_carryWeight + (["catshark"] call life_fnc_itemWeight)) <= life_maxWeight ']];
	//Pickup turtle
	_itemActions = _itemActions +
	[player addAction["Pickup Turtle Meat",life_fnc_pickupItem,"turtle",5,false,false,"",
	' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "turtle" && (player distance cursorTarget) < 3 && (life_carryWeight + (["turtle"] call life_fnc_itemWeight)) <= life_maxWeight ']];
	//Pickup turtle soup
	_itemActions = _itemActions +
	[player addAction["Pickup Turtle Soup",life_fnc_pickupItem,"turtlesoup",5,false,false,"",
	' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "turtlesoup" && (player distance cursorTarget) < 3 && (life_carryWeight + (["turtlesoup"] call life_fnc_itemWeight)) <= life_maxWeight ']];
	//Pickup donut
	_itemActions = _itemActions +
	[player addAction["Pickup Donut",life_fnc_pickupItem,"donuts",5,false,false,"",
	' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "donuts" && (player distance cursorTarget) < 3 && (life_carryWeight + (["donuts"] call life_fnc_itemWeight)) <= life_maxWeight ']];
	//Pickup Fishing Pole
	_itemActions = _itemActions +
	[player addAction["Pickup Fishing Pole",life_fnc_pickupItem,"",5,false,false,"",
	' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "fishing" && (player distance cursorTarget) < 3 && (life_carryWeight + (["fishing"] call life_fnc_itemWeight)) <= life_maxWeight ']];
	//Pickup Fuel Can
	_itemActions = _itemActions +
	[player addAction["Pickup Fuel Can",life_fnc_pickupItem,"",5,false,false,"",
	' !isNull cursorTarget && (typeOf cursorTarget == "Land_CanisterFuel_F") && !isNil {(cursorTarget getVariable "item")} && (player distance cursorTarget) < 3 ']];
	//Pickup Pickaxe
	_itemActions = _itemActions +
	[player addAction["Pickup Pickaxe",life_fnc_pickupItem,false,5,false,false,"",
	' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "pickaxe" && (player distance cursorTarget) < 3 && (life_carryWeight + (["pickaxe"] call life_fnc_itemWeight)) <= life_maxWeight ']];
	//Pickup copper Ore
	_itemActions = _itemActions +
	[player addAction["Pickup Copper Ore",life_fnc_pickupItem,false,5,false,false,"",
	' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "copperore" && (player distance cursorTarget) < 3 && (life_carryWeight + (["copperore"] call life_fnc_itemWeight)) <= life_maxWeight ']];
	//Pickup Iron Ore
	_itemActions = _itemActions +
	[player addAction["Pickup Iron Ore",life_fnc_pickupItem,false,5,false,false,"",
	' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "ironore" && (player distance cursorTarget) < 3 && (life_carryWeight + (["ironore"] call life_fnc_itemWeight)) <= life_maxWeight ']];
	//Pickup Rock
	_itemActions = _itemActions +
	[player addAction["Pickup Rock(s)",life_fnc_pickupItem,false,5,false,false,"",
	' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "rock" && (player distance cursorTarget) < 3 && (life_carryWeight + (["rock"] call life_fnc_itemWeight)) <= life_maxWeight ']];
	//Pickup Cement
	_itemActions = _itemActions +
	[player addAction["Pickup Cement",life_fnc_pickupItem,false,5,false,false,"",
	' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "cement" && (player distance cursorTarget) < 3 && (life_carryWeight + (["cement"] call life_fnc_itemWeight)) <= life_maxWeight ']];
	//Pickup Refined Iron
	_itemActions = _itemActions +
	[player addAction["Pickup Refined Iron",life_fnc_pickupItem,false,5,false,false,"",
	' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "iron_r" && (player distance cursorTarget) < 3 && (life_carryWeight + (["iron_r"] call life_fnc_itemWeight)) <= life_maxWeight ']];
	//Pickup Refined copper
	_itemActions = _itemActions +
	[player addAction["Pickup Refined Copper",life_fnc_pickupItem,false,5,false,false,"",
	' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "copper_r" && (player distance cursorTarget) < 3 && (life_carryWeight + (["copper_r"] call life_fnc_itemWeight)) <= life_maxWeight ']];
	//Pickup Salt
	_itemActions = _itemActions +
	[player addAction["Pickup Salt",life_fnc_pickupItem,false,5,false,false,"",
	' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "salt" && (player distance cursorTarget) < 3 && (life_carryWeight + (["salt"] call life_fnc_itemWeight)) <= life_maxWeight ']];
	_itemActions = _itemActions +
	[player addAction["Pickup Sand",life_fnc_pickupItem,false,5,false,false,"",
	' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "sand" && (player distance cursorTarget) < 3 && (life_carryWeight + (["sand"] call life_fnc_itemWeight)) <= life_maxWeight ']];
	_itemActions = _itemActions +
	[player addAction["Pickup Glass",life_fnc_pickupItem,false,5,false,false,"",
	' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "glass" && (player distance cursorTarget) < 3 && (life_carryWeight + (["glass"] call life_fnc_itemWeight)) <= life_maxWeight ']];
	_itemActions = _itemActions +
	[player addAction["Pickup Lockpick",life_fnc_pickupItem,false,5,false,false,"",
	' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "lockpick" && (player distance cursorTarget) < 3 && (life_carryWeight + (["lockpick"] call life_fnc_itemWeight)) <= life_maxWeight ']];
	_itemActions = _itemActions +
	[player addAction["Pickup Peach",life_fnc_pickupItem,false,5,false,false,"",
	' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "peach" && (player distance cursorTarget) < 3 && (life_carryWeight + (["peach"] call life_fnc_itemWeight)) <= life_maxWeight ']];
	_itemActions = _itemActions +
	[player addAction["Pickup Redgull",life_fnc_pickupItem,false,5,false,false,"",
	' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Can_V3_F" && ((cursorTarget getVariable "item") select 0) == "redgull" && (player distance cursorTarget) < 3 && (life_carryWeight + (["redgull"] call life_fnc_itemWeight)) <= life_maxWeight ']];
	_itemActions = _itemActions +
	[player addAction["Pickup Tactical Bacon",life_fnc_pickupItem,false,5,false,false,"",
	' !isNull cursorTarget && (typeOf cursorTarget) == "Land_TacticalBacon_F" && ((cursorTarget getVariable "item") select 0) == "tbacon" && (player distance cursorTarget) < 3 && (life_carryWeight + (["tbacon"] call life_fnc_itemWeight)) <= life_maxWeight ']];
	//Pickup Gold Bar(s)
	_itemActions = _itemActions +
	[player addAction["Pickup Gold Bar(s)",life_fnc_pickupItem,false,5,false,false,"",
	'!isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "goldbar" && (player distance cursorTarget) < 3 && (life_carryWeight + (["goldbar"] call life_fnc_itemWeight)) <= life_maxWeight ']];
	_itemActions = _itemActions +
	[player addAction["Pickup Diamond Uncut",life_fnc_pickupItem,false,5,false,false,"",
	' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "diamond" && (player distance cursorTarget) < 3 && (life_carryWeight + (["diamond"] call life_fnc_itemWeight)) <= life_maxWeight ']];
	_itemActions = _itemActions +
	[player addAction["Pickup Diamond Cut",life_fnc_pickupItem,false,5,false,false,"",
	' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "diamondc" && (player distance cursorTarget) < 3 && (life_carryWeight + (["diamondc"] call life_fnc_itemWeight)) <= life_maxWeight ']];
	_itemActions = _itemActions +
	[player addAction["Pickup Unprocessed Cocaine",life_fnc_pickupItem,false,5,false,false,"",
	' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "cocaine" && (player distance cursorTarget) < 3 && (life_carryWeight + (["cocaine"] call life_fnc_itemWeight)) <= life_maxWeight ']];
	_itemActions = _itemActions +
	[player addAction["Pickup Processed Cocaine",life_fnc_pickupItem,false,5,false,false,"",
	' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "cocainep" && (player distance cursorTarget) < 3 && (life_carryWeight + (["cocainep"] call life_fnc_itemWeight)) <= life_maxWeight ']];
	_itemActions = _itemActions +
	[player addAction["Pickup Frogs",life_fnc_pickupItem,false,5,false,false,"",
	' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "frog" && (player distance cursorTarget) < 3 && (life_carryWeight + (["frog"] call life_fnc_itemWeight)) <= life_maxWeight ']];
	_itemActions = _itemActions +
	[player addAction["Pickup Froglegs",life_fnc_pickupItem,false,5,false,false,"",
	' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "frogleg" && (player distance cursorTarget) < 3 && (life_carryWeight + (["frogleg"] call life_fnc_itemWeight)) <= life_maxWeight ']];
	_itemActions = _itemActions +
	[player addAction["Pickup LSD",life_fnc_pickupItem,false,5,false,false,"",
	' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "lsd" && (player distance cursorTarget) < 3 && (life_carryWeight + (["lsd"] call life_fnc_itemWeight)) <= life_maxWeight ']];
	_itemActions = _itemActions +
	[player addAction["Pickup Frog Net",life_fnc_pickupItem,false,5,false,false,"",
	' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "frognet" && (player distance cursorTarget) < 3 && (life_carryWeight + (["frognet"] call life_fnc_itemWeight)) <= life_maxWeight ']];

	
};	
} else {
	if((count _itemActions) > 0) then {
		//systemChat "REMOVE Item Pickup";
		{
			player removeAction _x;
		} foreach _itemActions;
		_itemActions = [];
	};
};
};

_count = _count + 1;
if(_count > 29) then { _count = 0 };
sleep 0.1;
};
