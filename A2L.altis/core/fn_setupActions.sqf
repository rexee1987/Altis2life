#include <macro.h>
/*
	File: fn_setupActions.sqf
	
	Description:
	Master addAction file handler for all client-based actions.
*/
switch (playerSide) do
{
	case west:
	{
	    //search house      
        life_actions = life_actions + [player addAction["<t color='#FFFF00'>Haus durchsuchen</t>",life_fnc_houseOwnerSearch,cursorTarget,5,false,false,"",
        ' !isNull cursorTarget && (player distance cursorTarget) < 10 && speed cursorTarget < 2 && (cursorTarget isKindOf "Land_i_House_Small_01_V1_F" || cursorTarget isKindOf "Land_i_House_Small_01_V2_F" || cursorTarget isKindOf "Land_i_House_Small_01_V3_F" || cursorTarget isKindOf "Land_i_House_Small_02_V1_F" || cursorTarget isKindOf "Land_i_House_Small_02_V2_F" || cursorTarget isKindOf "Land_i_House_Small_02_V3_F" || cursorTarget isKindOf "Land_i_House_Small_03_V1_F" || cursorTarget isKindOf "Land_i_House_Big_01_V1_F" || cursorTarget isKindOf "Land_i_House_Big_01_V2_F" || cursorTarget isKindOf "Land_i_House_Big_01_V3_F" || cursorTarget isKindOf "Land_i_House_Big_02_V1_F" || cursorTarget isKindOf "Land_i_House_Big_02_V2_F" || cursorTarget isKindOf "Land_i_House_Big_02_V3_F") && !life_action_inUse']];
        life_actions = life_actions + [player addAction["<t color='#FF0000'>Haus öffnen</t>",life_fnc_raidHouse,cursorTarget,5,false,false,"",
        ' !isNull cursorTarget && (player distance cursorTarget) < 10 && speed cursorTarget < 2 && (count (cursorTarget getVariable ["life_homeOwners", []]) > 0) && (cursorTarget isKindOf "Land_i_House_Small_01_V1_F" || cursorTarget isKindOf "Land_i_House_Small_01_V2_F" || cursorTarget isKindOf "Land_i_House_Small_01_V3_F" || cursorTarget isKindOf "Land_i_House_Small_02_V1_F" || cursorTarget isKindOf "Land_i_House_Small_02_V2_F" || cursorTarget isKindOf "Land_i_House_Small_02_V3_F" || cursorTarget isKindOf "Land_i_House_Small_03_V1_F" || cursorTarget isKindOf "Land_i_House_Big_01_V1_F" || cursorTarget isKindOf "Land_i_House_Big_01_V2_F" || cursorTarget isKindOf "Land_i_House_Big_01_V3_F" || cursorTarget isKindOf "Land_i_House_Big_02_V1_F" || cursorTarget isKindOf "Land_i_House_Big_02_V2_F" || cursorTarget isKindOf "Land_i_House_Big_02_V3_F") && !life_action_inUse']];     
        life_actions = life_actions + [player addAction["<t color='#FFFF00'>Haus Inventar durchsuchen</t>",life_fnc_houseInvSearch,cursorTarget,5,false,false,"",
        ' !isNull cursorTarget && (player distance cursorTarget) < 5 && speed cursorTarget < 2 && (cursorTarget getVariable ["life_locked", 1] == 0) && (cursorTarget isKindOf "Land_i_House_Small_01_V1_F" || cursorTarget isKindOf "Land_i_House_Small_01_V2_F" || cursorTarget isKindOf "Land_i_House_Small_01_V3_F" || cursorTarget isKindOf "Land_i_House_Small_02_V1_F" || cursorTarget isKindOf "Land_i_House_Small_02_V2_F" || cursorTarget isKindOf "Land_i_House_Small_02_V3_F" || cursorTarget isKindOf "Land_i_House_Small_03_V1_F" || cursorTarget isKindOf "Land_i_House_Big_01_V1_F" || cursorTarget isKindOf "Land_i_House_Big_01_V2_F" || cursorTarget isKindOf "Land_i_House_Big_01_V3_F" || cursorTarget isKindOf "Land_i_House_Big_02_V1_F" || cursorTarget isKindOf "Land_i_House_Big_02_V2_F" || cursorTarget isKindOf "Land_i_House_Big_02_V3_F") && !life_action_inUse']];
	
		//Seize Weapon/Objekt_BETA -> new system
		life_actions = life_actions + [player addAction["Waffen beschlagnahmen",life_fnc_seizeWeapon,cursorTarget,0,false,false,"",'!isNull cursorTarget && (player distance cursorTarget) < 6 && speed cursorTarget < 2 && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget == civilian) && (cursorTarget getVariable "restrained")']];
		life_actions = life_actions + [player addAction["Gegenstände beschlagnahmen",life_fnc_seizeObjects,cursorTarget,0,false,false,"",'count(nearestObjects [player,["weaponholder"],3])>0']];	
	};
	
	case civilian:
	{
		//Drop fishing net
		life_actions = [player addAction["Drop Fishing Net",life_fnc_dropFishingNet,"",0,false,false,"",'
		(surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && life_carryWeight < life_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !life_net_dropped ']];
		//Rob person
		life_actions = life_actions + [player addAction["Person überfllen",life_fnc_robAction,"",0,false,false,"",'
		!isNull cursorTarget && player distance cursorTarget < 3.5 && isPlayer cursorTarget && animationState cursorTarget == "Incapacitated" && !(cursorTarget getVariable["robbed",FALSE]) ']];
		
		//catch Frogs
		// life_actions = life_actions + [player addAction["Catch Frogs",life_fnc_CatchFrogAction,"",0,false,false,"",'
		// !life_action_in_use && (player distance (getMarkerPos "frog_swamp1") < 60) && (vehicle player == player) && (life_carryWeight + (["frog"] call life_fnc_itemWeight)) <= life_maxWeight ']];

		
		/*
		//Restrain Action
		life_actions = [player addAction["Restrain",life_fnc_restrainAction,cursorTarget,0,false,false,"",' 
		!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 3.5 && animationState cursorTarget == "Incapacitated" && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && speed cursorTarget < 1 ']];
		//Escort
		life_actions = life_actions + [player addAction["Escort",life_fnc_escortAction,[cursorTarget],0,false,false,"",'
		!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 3.5 && (cursorTarget getVariable "restrained") && !(cursorTarget getVariable "Escorting") ']]; 
		life_actions = life_actions + [player addAction["Put in Vehicle",life_fnc_putInCar,"",0,false,false,"",
		' !isNull cursorTarget && (player distance cursorTarget) < 6 && speed cursorTarget < 2 && cursorTarget isKindOf "Car" && ((((position player) nearEntities [["Man"],5]) select 0) getVariable "Escorting")' ]];
		life_actions = life_actions + [player addAction["Put in Vehicle",life_fnc_putInCar,_unit,0,false,false,"",
		' !isNull cursorTarget && (player distance cursorTarget) < 6 && speed cursorTarget < 2 && cursorTarget isKindOf "Air"' ]];
		life_actions = life_actions + [player addAction["Put in Vehicle",life_fnc_putInCar,_unit,0,false,false,"",
		' !isNull cursorTarget && (player distance cursorTarget) < 6 && speed cursorTarget < 2 && cursorTarget isKindOf "Ship"' ]];
		life_actions = life_actions + [player addAction["Stop Escorting",life_fnc_stopEscorting,_unit,0,false,false,"",
		' !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && animationState cursorTarget == "AmovPercMstpSnonWnonDnon_Ease" && player distance cursorTarget < 3.5 && (cursorTarget getVariable "Escorting")']];

		//Unrestrain Action
		life_actions = life_actions + [player addAction["Unrestrain",life_fnc_unrestrain,cursorTarget,0,false,false,"",
		' !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && animationState cursorTarget == "AmovPercMstpSnonWnonDnon_Ease" && player distance cursorTarget < 3.5 && (cursorTarget getVariable "restrained") && !(cursorTarget getVariable "Escorting") ']];

		//Pull out of car
		life_actions = life_actions + [player addAction["Pull out of vehicle",life_fnc_pulloutAction,cursorTarget,0,false,false,"",
		' !isNull cursorTarget && (player distance cursorTarget) < 4 && (count crew cursorTarget) > 0 && speed cursorTarget < 2 && cursorTarget isKindOF "Car" && !life_action_inUse']];
		life_actions = life_actions + [player addAction["Pull out of vehicle",life_fnc_pulloutAction,cursorTarget,0,false,false,"",
		' !isNull cursorTarget && (player distance cursorTarget) < 4 && (count crew cursorTarget) > 0 && speed cursorTarget < 2 && cursorTarget isKindOf "Ship" && !life_action_inUse']];
		life_actions = life_actions + [player addAction["Pull out of vehicle",life_fnc_pulloutAction,cursorTarget,0,false,false,"",
		' !isNull cursorTarget && (player distance cursorTarget) < 4 && (count crew cursorTarget) > 0 && speed cursorTarget < 2 && cursorTarget isKindOf "Air" && !life_action_inUse']];
		*/
		
	    //Houses
        life_actions = life_actions + [player addAction["<t color='#FF0000'>Haus abschließen / öffnen</t>",life_fnc_lockHouse,cursorTarget,10,false,false,"",
        '!isNull cursorTarget && (player distance cursorTarget) < 20 && cursorTarget isKindOf "House" && license_civ_home && (getPlayerUID player) in (cursorTarget getVariable["life_homeOwners", []])']];
        life_actions = life_actions + [player addAction["<t color='#FFFF00'>Lager abschließen / öffnen</t>",life_fnc_lockStorage,cursorTarget,10,false,false,"",
        '!isNull cursorTarget && (player distance cursorTarget) < 20 && cursorTarget isKindOf "House" && license_civ_home && (getPlayerUID player) in (cursorTarget getVariable["life_homeOwners", []])']];
        life_actions = life_actions + [player addAction["<t color='#00FF00'>Haus Menü</t>",life_fnc_houseMenu,cursorTarget,10,false,false,"",
        '!isNull cursorTarget && (player distance cursorTarget) < 20 && cursorTarget isKindOf "House" && ([typeOf cursorTarget] call life_fnc_housePrice) > -1 && !(([cursorTarget] call life_fnc_getBuildID) in life_public_houses)']];
        life_actions = life_actions + [player addAction["Item Lager",life_fnc_openStorage,cursorTarget,10,false,false,"",
        ' !isNull cursorTarget && (player distance cursorTarget) < 6 && cursorTarget isKindOf "House"  && speed cursorTarget < 2 && (count (cursorTarget getVariable["containers", []]) > 0) && license_civ_home && __GETC__(life_donator) >= __GETC__(HOUSING_DONATOR_LEVEL) && ((getPlayerUID player) in (cursorTarget getVariable["life_homeOwners", []]) || ((cursorTarget getVariable["storage_locked", 1]) == 0))']];// || !(cursorTarget getVariable["life_locked", true])
        life_actions = life_actions + [player addAction["Fahrzeug Garage",life_fnc_vehicleGarage,"car",0,false,false,"",
        ' !isNull cursorTarget && (player distance cursorTarget) < 20 && cursorTarget isKindOf "House" && license_civ_home && (typeOf cursorTarget == "Land_i_Garage_V1_F" || typeOf cursorTarget == "Land_i_Garage_V2_F" || typeOf cursorTarget == "Land_i_Garage_V1_dam_F") && (((getPlayerUID player) in (cursorTarget getVariable["life_homeOwners", []])) || ((cursorTarget getVariable["life_locked", 1]) == 0)) ']];
        life_actions = life_actions + [player addAction["Fahrzeug in Garage stellen",life_fnc_storeVehicle,"""",0,false,false,"""",
        ' !life_garage_store && !isNull cursorTarget && (player distance cursorTarget) < 20 && license_civ_home && cursorTarget isKindOf "House" && (typeOf cursorTarget == "Land_i_Garage_V1_F" || typeOf cursorTarget == "Land_i_Garage_V2_F" || typeOf cursorTarget == "Land_i_Garage_V1_dam_F") && (((getPlayerUID player) in (cursorTarget getVariable["life_homeOwners", []])) || (cursorTarget getVariable["life_locked", 1]) == 0) ']];
    
	};
};

//flipVehicle Car
life_actions = life_actions +
[player addAction["flip Vehicle",life_fnc_flipVehicle,"",0,false,false,"",
' !isNull cursorTarget && (player distance cursorTarget) < 6 && speed cursorTarget < 2 && cursorTarget isKindOf "Car" && !life_action_inUse' ]];

life_actions = life_actions + [player addAction["Repair Vehicle ($500)",life_fnc_pumpRepair,"",999,false,false,"",
' vehicle player != player && (typeOf cursorTarget == "Land_fs_feed_F") && (vehicle player) distance cursorTarget < 6 ']];
life_actions = life_actions + [player addAction["Place Spike Strip",{if(!isNull life_spikestrip) then {detach life_spikeStrip; life_spikeStrip = ObjNull;};},"",999,false,false,"",'!isNull life_spikestrip']];


//Service Truck Stuff
//life_actions = life_actions + [player addAction["<t color='#0000FF'>Service Nearest Car</t>",life_fnc_serviceTruck,"",99,false,false,"",' (typeOf (vehicle player) == "I_Truck_02_box_F") && ((vehicle player animationPhase "HideServices") == 0) && ((vehicle player) in life_vehicles) && (speed vehicle player) < 1 ']];

//Custom Repair
//life_actions = life_actions + [player addAction["<t color='#FF0000'>Repair Vehicle</t>",life_fnc_repairTruck,"",99,false,false,"", ' vehicle player == player && !isNull cursorTarget && ((cursorTarget isKindOf "Car") OR (cursorTarget isKindOf "Air") OR (cursorTarget isKindOf "Ship")) && (damage cursorTarget) > 0.001 && ("ToolKit" in (backpackItems player)) && (player distance cursorTarget < ((boundingBox cursorTarget select 1) select 0) + 2) ']];


/*
//Custom Heal
life_actions = life_actions + [player addAction["<t color='#FF0000'>Heal Self</t>",life_fnc_heal,"",99,false,false,"",' vehicle player == player && (damage player) > 0.25 && ("FirstAidKit" in (items player)) && (currentWeapon player == "")']];
//push Ship
life_actions = life_actions + [player addAction["Push",life_fnc_pushVehicle,"",0,false,false,"",
'!isNull cursorTarget && player distance cursorTarget < 4.5 && cursorTarget isKindOf "Ship"']];
//Pickup Water
life_actions = life_actions + 
[player addAction["Pickup Water",life_fnc_pickupItem,"",0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_BottlePlastic_V1_F" && ((cursorTarget getVariable "item") select 0) == "water" && (player distance cursorTarget) < 3 && (life_carryWeight + (["water"] call life_fnc_itemWeight)) <= life_maxWeight ']];
//Pickup Coffee
life_actions = life_actions + 
[player addAction["Pickup Coffee",life_fnc_pickupItem,"",0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Can_V3_F" && ((cursorTarget getVariable "item") select 0) == "coffee" && (player distance cursorTarget) < 3 && (life_carryWeight + (["coffee"] call life_fnc_itemWeight)) <= life_maxWeight ']];
//Pickup Money
life_actions = life_actions +
[player addAction["Pickup Money",life_fnc_pickupMoney,"",0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Money_F" && ((cursorTarget getVariable "item") select 0) == "money" && (player distance cursorTarget) < 3 ']];

//Pickup Unprocessed Oil
life_actions = life_actions +
[player addAction["Pickup Unprocessed Oil",life_fnc_pickupItem,false,0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "oilu" && (player distance cursorTarget) < 3 && (life_carryWeight + (["oilu"] call life_fnc_itemWeight)) <= life_maxWeight ']];
//Pickup Processed Oil
life_actions = life_actions +
[player addAction["Pickup Processed Oil",life_fnc_pickupItem,true,0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "oilp" && (player distance cursorTarget) < 3 && (life_carryWeight + (["oilp"] call life_fnc_itemWeight)) <= life_maxWeight ']];
//Pickup Unprocessed Heroin
life_actions = life_actions +
[player addAction["Pickup Unprocessed Heroin",life_fnc_pickupItem,false,0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "heroinu" && (player distance cursorTarget) < 3 && (life_carryWeight + (["heroinu"] call life_fnc_itemWeight)) <= life_maxWeight ']];
//Pickup Processed Heroin
life_actions = life_actions +
[player addAction["Pickup Processed Heroin",life_fnc_pickupItem,true,0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "heroinp" && (player distance cursorTarget) < 3 && (life_carryWeight + (["heroinp"] call life_fnc_itemWeight)) <= life_maxWeight ']];
//Pickup Cannabis
life_actions = life_actions +
[player addAction["Pickup Cannabis",life_fnc_pickupItem,true,0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "cannabis" && (player distance cursorTarget) < 3 && (life_carryWeight + (["cannabis"] call life_fnc_itemWeight)) <= life_maxWeight ']];
//Pickup Marijjuana
life_actions = life_actions +
[player addAction["Pickup Marijuana",life_fnc_pickupItem,true,0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "marijuana" && (player distance cursorTarget) < 3 && (life_carryWeight + (["marijuana"] call life_fnc_itemWeight)) <= life_maxWeight ']];
//Pickup Apple
life_actions = life_actions +
[player addAction["Pickup Apple",life_fnc_pickupItem,false,0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "apple" && (player distance cursorTarget) < 3 && (life_carryWeight + (["apple"] call life_fnc_itemWeight)) <= life_maxWeight ']];
//Pickup Rabbit MEat
life_actions = life_actions +
[player addAction["Pickup Rabbit Meat",life_fnc_pickupItem,"rabbit",0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "rabbit" && (player distance cursorTarget) < 3 && (life_carryWeight + (["rabbit"] call life_fnc_itemWeight)) <= life_maxWeight ']];
//Pickup salema
life_actions = life_actions +
[player addAction["Pickup Salema Meat",life_fnc_pickupItem,"salema",0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "salema" && (player distance cursorTarget) < 3 && (life_carryWeight + (["salema"] call life_fnc_itemWeight)) <= life_maxWeight ']];
//Pickup ornate
life_actions = life_actions +
[player addAction["Pickup Ornate Meat",life_fnc_pickupItem,"ornate",0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "ornate" && (player distance cursorTarget) < 3 && (life_carryWeight + (["ornate"] call life_fnc_itemWeight)) <= life_maxWeight ']];
//Pickup mackerel
life_actions = life_actions +
[player addAction["Pickup Mackerel Meat",life_fnc_pickupItem,"mackerel",0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "mackerel" && (player distance cursorTarget) < 3 && (life_carryWeight + (["mackerel"] call life_fnc_itemWeight)) <= life_maxWeight ']];
//Pickup tuna
life_actions = life_actions +
[player addAction["Pickup Tuna Meat",life_fnc_pickupItem,"tuna",0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "tuna" && (player distance cursorTarget) < 3 && (life_carryWeight + (["tuna"] call life_fnc_itemWeight)) <= life_maxWeight ']];
//Pickup mullet
life_actions = life_actions +
[player addAction["Pickup Mullet Meat",life_fnc_pickupItem,"mullet",0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "mullet" && (player distance cursorTarget) < 3 && (life_carryWeight + (["mullet"] call life_fnc_itemWeight)) <= life_maxWeight ']];
//Pickup catshark
life_actions = life_actions +
[player addAction["Pickup Catshark Meat",life_fnc_pickupItem,"catshark",0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "catshark" && (player distance cursorTarget) < 3 && (life_carryWeight + (["catshark"] call life_fnc_itemWeight)) <= life_maxWeight ']];
//Pickup turtle
life_actions = life_actions +
[player addAction["Pickup Turtle Meat",life_fnc_pickupItem,"turtle",0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "turtle" && (player distance cursorTarget) < 3 && (life_carryWeight + (["turtle"] call life_fnc_itemWeight)) <= life_maxWeight ']];
//Pickup turtle soup
life_actions = life_actions +
[player addAction["Pickup Turtle Soup",life_fnc_pickupItem,"turtlesoup",0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "turtlesoup" && (player distance cursorTarget) < 3 && (life_carryWeight + (["turtlesoup"] call life_fnc_itemWeight)) <= life_maxWeight ']];
//Pickup donut
life_actions = life_actions +
[player addAction["Pickup Donut",life_fnc_pickupItem,"donuts",0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "donuts" && (player distance cursorTarget) < 3 && (life_carryWeight + (["donuts"] call life_fnc_itemWeight)) <= life_maxWeight ']];
//Pickup Fishing Pole
life_actions = life_actions +
[player addAction["Pickup Fishing Pole",life_fnc_pickupItem,"",0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "fishing" && (player distance cursorTarget) < 3 && (life_carryWeight + (["fishing"] call life_fnc_itemWeight)) <= life_maxWeight ']];
//Pickup Fuel Can
life_actions = life_actions +
[player addAction["Pickup Fuel Can",life_fnc_pickupItem,"",0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget == "Land_CanisterFuel_F") && !isNil {(cursorTarget getVariable "item")} && (player distance cursorTarget) < 3 ']];
//Pickup Pickaxe
life_actions = life_actions +
[player addAction["Pickup Pickaxe",life_fnc_pickupItem,false,0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "pickaxe" && (player distance cursorTarget) < 3 && (life_carryWeight + (["pickaxe"] call life_fnc_itemWeight)) <= life_maxWeight ']];
//Pickup copper Ore
life_actions = life_actions +
[player addAction["Pickup Copper Ore",life_fnc_pickupItem,false,0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "copperore" && (player distance cursorTarget) < 3 && (life_carryWeight + (["copperore"] call life_fnc_itemWeight)) <= life_maxWeight ']];
//Pickup Iron Ore
life_actions = life_actions +
[player addAction["Pickup Iron Ore",life_fnc_pickupItem,false,0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "ironore" && (player distance cursorTarget) < 3 && (life_carryWeight + (["ironore"] call life_fnc_itemWeight)) <= life_maxWeight ']];
//Pickup Rock
life_actions = life_actions +
[player addAction["Pickup Rock(s)",life_fnc_pickupItem,false,0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "rock" && (player distance cursorTarget) < 3 && (life_carryWeight + (["rock"] call life_fnc_itemWeight)) <= life_maxWeight ']];
//Pickup Cement
life_actions = life_actions +
[player addAction["Pickup Cement",life_fnc_pickupItem,false,0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "cement" && (player distance cursorTarget) < 3 && (life_carryWeight + (["cement"] call life_fnc_itemWeight)) <= life_maxWeight ']];
//Pickup Refined Iron
life_actions = life_actions +
[player addAction["Pickup Refined Iron",life_fnc_pickupItem,false,0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "iron_r" && (player distance cursorTarget) < 3 && (life_carryWeight + (["iron_r"] call life_fnc_itemWeight)) <= life_maxWeight ']];
//Pickup Refined copper
life_actions = life_actions +
[player addAction["Pickup Refined Copper",life_fnc_pickupItem,false,0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "copper_r" && (player distance cursorTarget) < 3 && (life_carryWeight + (["copper_r"] call life_fnc_itemWeight)) <= life_maxWeight ']];
//Pickup Salt
life_actions = life_actions +
[player addAction["Pickup Salt",life_fnc_pickupItem,false,0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "salt" && (player distance cursorTarget) < 3 && (life_carryWeight + (["salt"] call life_fnc_itemWeight)) <= life_maxWeight ']];
life_actions = life_actions +
[player addAction["Pickup Sand",life_fnc_pickupItem,false,0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "sand" && (player distance cursorTarget) < 3 && (life_carryWeight + (["sand"] call life_fnc_itemWeight)) <= life_maxWeight ']];
life_actions = life_actions +
[player addAction["Pickup Glass",life_fnc_pickupItem,false,0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "glass" && (player distance cursorTarget) < 3 && (life_carryWeight + (["glass"] call life_fnc_itemWeight)) <= life_maxWeight ']];
life_actions = life_actions +
[player addAction["Pickup Lockpick",life_fnc_pickupItem,false,0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "lockpick" && (player distance cursorTarget) < 3 && (life_carryWeight + (["lockpick"] call life_fnc_itemWeight)) <= life_maxWeight ']];
life_actions = life_actions +
[player addAction["Pickup Peach",life_fnc_pickupItem,false,0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "peach" && (player distance cursorTarget) < 3 && (life_carryWeight + (["peach"] call life_fnc_itemWeight)) <= life_maxWeight ']];
life_actions = life_actions +
[player addAction["Pickup Redgull",life_fnc_pickupItem,false,0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Can_V3_F" && ((cursorTarget getVariable "item") select 0) == "redgull" && (player distance cursorTarget) < 3 && (life_carryWeight + (["redgull"] call life_fnc_itemWeight)) <= life_maxWeight ']];
life_actions = life_actions +
[player addAction["Pickup Tactical Bacon",life_fnc_pickupItem,false,0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_TacticalBacon_F" && ((cursorTarget getVariable "item") select 0) == "tbacon" && (player distance cursorTarget) < 3 && (life_carryWeight + (["tbacon"] call life_fnc_itemWeight)) <= life_maxWeight ']];
//Pickup Gold Bar(s)
life_actions = life_actions +
[player addAction["Pickup Gold Bar(s)",life_fnc_pickupItem,false,0,false,false,"",
'!isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "goldbar" && (player distance cursorTarget) < 3 && (life_carryWeight + (["goldbar"] call life_fnc_itemWeight)) <= life_maxWeight ']];
life_actions = life_actions +
[player addAction["Pickup Diamond Uncut",life_fnc_pickupItem,false,0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "diamond" && (player distance cursorTarget) < 3 && (life_carryWeight + (["diamond"] call life_fnc_itemWeight)) <= life_maxWeight ']];
life_actions = life_actions +
[player addAction["Pickup Diamond Cut",life_fnc_pickupItem,false,0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "diamondc" && (player distance cursorTarget) < 3 && (life_carryWeight + (["diamondc"] call life_fnc_itemWeight)) <= life_maxWeight ']];
[player addAction["Pickup Unprocessed Cocaine",life_fnc_pickupItem,false,0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "cocaine" && (player distance cursorTarget) < 3 && (life_carryWeight + (["cocaine"] call life_fnc_itemWeight)) <= life_maxWeight ']];
[player addAction["Pickup Processed Cocaine",life_fnc_pickupItem,false,0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "cocainep" && (player distance cursorTarget) < 3 && (life_carryWeight + (["cocainep"] call life_fnc_itemWeight)) <= life_maxWeight ']];
*/