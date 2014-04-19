#include <macro.h>
/*
	File:
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration list / array for buyable vehicles & prices and their shop.
*/
private["_shop","_return"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {[]};
_return = [];
switch (_shop) do
{
	case "civ_car_1":
	{
		_return = 
		[
			["B_Quadbike_01_F",2500],
			["C_Hatchback_01_F",11500],
			["C_Offroad_01_F",17500],
			["C_SUV_01_F",39000],
			["C_Van_01_transport_F",50000],
			["C_Van_01_box_F",65000]
		];
		if(__GETC__(life_donator) > 1) then
		{
			["B_Quadbike_01_F",2400],
			["C_Hatchback_01_F",11000],
			["C_Offroad_01_F",17000],
			["C_SUV_01_F",33000],
			["C_Van_01_transport_F",45000],
			["C_Van_01_box_F",60000]
		};
		
		if(__GETC__(life_donator) > 2) then
		{
			["B_Quadbike_01_F",2200],
			["C_Hatchback_01_F",10000],
			["C_Offroad_01_F",15000],
			["C_SUV_01_F",31000],
			["C_Van_01_transport_F",42000],
			["C_Van_01_box_F",58000]
		};
	}; 
	
	case "civ_car_2":
	{
		_return = 
		[
			["B_Quadbike_01_F",2500],
			["C_Hatchback_01_F",11500],
			["C_Offroad_01_F",17500],
			["C_SUV_01_F",39000],
			["C_Van_01_transport_F",50000],
			["C_Van_01_box_F",65000]
		];
		if(__GETC__(life_donator) > 1) then
		{
			["B_Quadbike_01_F",2400],
			["C_Hatchback_01_F",11000],
			["C_Offroad_01_F",17000],
			["C_SUV_01_F",33000],
			["C_Van_01_transport_F",45000],
			["C_Van_01_box_F",60000]
		};
		
		if(__GETC__(life_donator) > 2) then
		{
			["B_Quadbike_01_F",2200],
			["C_Hatchback_01_F",10000],
			["C_Offroad_01_F",15000],
			["C_SUV_01_F",31000],
			["C_Van_01_transport_F",42000],
			["C_Van_01_box_F",58000]
		};
	};
	
	case "civ_car_3":
	{
		_return = 
		[
			["B_Quadbike_01_F",2500],
			["C_Hatchback_01_F",11500],
			["C_Offroad_01_F",17500],
			["C_SUV_01_F",39000],
			["C_Van_01_transport_F",50000],
			["C_Van_01_box_F",65000]
		];
		if(__GETC__(life_donator) > 1) then
		{
			["B_Quadbike_01_F",2400],
			["C_Hatchback_01_F",11000],
			["C_Offroad_01_F",17000],
			["C_SUV_01_F",33000],
			["C_Van_01_transport_F",45000],
			["C_Van_01_box_F",60000]
		};
		
		if(__GETC__(life_donator) > 2) then
		{
			["B_Quadbike_01_F",2200],
			["C_Hatchback_01_F",10000],
			["C_Offroad_01_F",15000],
			["C_SUV_01_F",31000],
			["C_Van_01_transport_F",42000],
			["C_Van_01_box_F",58000]
		};
	}; 
	
	case "civ_car_4":
	{
		_return = 
		[
			["B_Quadbike_01_F",2500],
			["C_Hatchback_01_F",11500],
			["C_Offroad_01_F",17500],
			["C_SUV_01_F",39000],
			["C_Van_01_transport_F",50000],
			["C_Van_01_box_F",65000]
		];
		if(__GETC__(life_donator) > 1) then
		{
			["B_Quadbike_01_F",2400],
			["C_Hatchback_01_F",11000],
			["C_Offroad_01_F",17000],
			["C_SUV_01_F",33000],
			["C_Van_01_transport_F",45000],
			["C_Van_01_box_F",60000]
		};
		
		if(__GETC__(life_donator) > 2) then
		{
			["B_Quadbike_01_F",2200],
			["C_Hatchback_01_F",10000],
			["C_Offroad_01_F",15000],
			["C_SUV_01_F",31000],
			["C_Van_01_transport_F",42000],
			["C_Van_01_box_F",58000]
		};
	}; 
	
	case "donator_1":
	{
		_return =
		[
			["B_Quadbike_01_F",500],
			["C_Offroad_01_F",2500],
			["C_SUV_01_F",20000]
		];

		if(__GETC__(life_donator) > 1) then
		{
			_return set[count _return,["C_Van_01_Fuel_F",7500]];
			_return set[count _return,["B_Truck_01_box_F",250000]];
			_return set[count _return,["B_Heli_Light_01_F",200000]];
			_return set[count _return,["O_Heli_Light_02_unarmed_F",600000]];
			_return set[count _return,["I_Heli_Transport_02_F2",80000]];
		};
		if(__GETC__(life_donator) > 2) then
		{
			_return set[count _return,["C_Hatchback_01_sport_F",10000]];
			_return set[count _return,["I_Heli_Transport_02_F",1200000]];
		};
		if(__GETC__(life_donator) > 3) then
		{
			_return set[count _return,["C_Hatchback_01_sport_F",10000]];
			_return set[count _return,["I_Heli_Transport_02_F",1200000]];
		};
		if(__GETC__(life_donator) > 4) then
		{
			_return set[count _return,["C_Hatchback_01_sport_F",10000]];
			_return set[count _return,["I_Heli_Transport_02_F",1200000]];
		};
		if(__GETC__(life_donator) > 5) then
		{
			_return set[count _return,["C_Hatchback_01_sport_F",10000]];
			_return set[count _return,["I_Heli_Transport_02_F",1200000]];
		};
	};
	
	case "donator_2":
	{
		_return =
		[
			["B_Quadbike_01_F",500],
			["C_Offroad_01_F",2500],
			["C_SUV_01_F",20000]
		];

		if(__GETC__(life_donator) > 1) then
		{
			_return set[count _return,["C_Van_01_Fuel_F",7500]];
			_return set[count _return,["B_Truck_01_box_F",250000]];
			_return set[count _return,["B_Heli_Light_01_F",200000]];
			_return set[count _return,["O_Heli_Light_02_unarmed_F",600000]];
		};
		if(__GETC__(life_donator) > 2) then
		{
			_return set[count _return,["C_Hatchback_01_sport_F",10000]];
			_return set[count _return,["I_Heli_Transport_02_F",1200000]];
		};
	};
			
	case "civ_servt_1":
	{	
		//_return =
		//[
		//	["B_Quadbike_01_F",500],
		//	["C_Offroad_01_F",2500],
		//	["C_SUV_01_F",20000]
		//];
		
		if(__GETC__(life_adminlevel) > 0) then
		{
			_return set[count _return,["I_Truck_02_box_F",15000]]; //Service Truck
		};
	};

	case "civ_servt_2":
	{	
		//_return =
		//[
		//	["B_Quadbike_01_F",500],
		//	["C_Offroad_01_F",2500],
		//	["C_SUV_01_F",20000]
		//];
		
		if(__GETC__(life_adminlevel) > 0) then
		{
			_return set[count _return,["I_Truck_02_box_F",15000]]; //Service Truck
		};
	};
	
	case "civ_truck_1":
	{
		_return =
		[
			["I_Truck_02_transport_F",75000],
			["I_Truck_02_covered_F",100000],
			["B_Truck_01_transport_F",247500],
			["B_Truck_01_covered_F",1089000],
			["B_Truck_01_box_F",3200000]
		];
		if(__GETC__(life_donator) > 1) then
		{
			["I_Truck_02_transport_F",73000],
			["I_Truck_02_covered_F",90000],
			["B_Truck_01_transport_F",235500],
			["B_Truck_01_covered_F",1019000],
			["B_Truck_01_box_F",3000000]
		};
		
		if(__GETC__(life_donator) > 2) then
		{
			["I_Truck_02_transport_F",71000],
			["I_Truck_02_covered_F",85000],
			["B_Truck_01_transport_F",217500],
			["B_Truck_01_covered_F",999000],
			["B_Truck_01_box_F",2900000]
		};		
	};
	
	case "civ_truck_2":
	{
		_return =
		[
			["I_Truck_02_transport_F",75000],
			["I_Truck_02_covered_F",100000],
			["B_Truck_01_transport_F",247500],
			["B_Truck_01_covered_F",1089000],
			["B_Truck_01_box_F",3200000]
		];	
		if(__GETC__(life_donator) > 1) then
		{
			["I_Truck_02_transport_F",73000],
			["I_Truck_02_covered_F",90000],
			["B_Truck_01_transport_F",235500],
			["B_Truck_01_covered_F",1019000],
			["B_Truck_01_box_F",3000000]
		};
		
		if(__GETC__(life_donator) > 2) then
		{
			["I_Truck_02_transport_F",71000],
			["I_Truck_02_covered_F",85000],
			["B_Truck_01_transport_F",217500],
			["B_Truck_01_covered_F",999000],
			["B_Truck_01_box_F",2900000]
		};
	};
	
	case "reb_v_1":
	{
		_return =
		[
			["B_Quadbike_01_F",2500],
			["B_G_Offroad_01_F",15000],
			["O_MRAP_02_F",500000],
			["B_Heli_Light_01_F",325000]
		];
		
		if(license_civ_rebel) then
		{
			_return set[count _return,
			["B_G_Offroad_01_armed_F",750000]];
		};
	};
	
	case "reb_v_2":
	{
		_return =
		[
			["B_Quadbike_01_F",2500],
			["B_G_Offroad_01_F",15000],
			["O_MRAP_02_F",500000],
			["B_Heli_Light_01_F",325000]
		];
		
		if(license_civ_rebel) then
		{
			_return set[count _return,
			["B_G_Offroad_01_armed_F",750000]];
		};
	};
			
	case "reb_car":
	{
		_return =
		[
			["B_Quadbike_01_F",2500],
			["B_G_Offroad_01_F",13000]
		];
	};
	
	case "reb_car2":
	{
		_return set[count _return,
		["B_Quadbike_01_F",2500]];
		_return set[count _return,
		["C_Offroad_01_F",9000]];
		_return set[count _return,
		["O_MRAP_02_F",250000]];
	};
	
	case "reb_air":
	{
		_return set[count _return,
		["B_Heli_Light_01_F",275000]];
		_return set[count _return,
		["O_Heli_Light_02_unarmed_F",350000]];
	};
	
	case "cop_car_1":
		{
		_return set[count _return,
		["C_Offroad_01_F",5000]];
		if(__GETC__(life_coplevel) > 1) then
		{
			_return set[count _return,
			["C_SUV_01_F",25000]];
			
		};
		if(__GETC__(life_coplevel) > 2) then
		{
			_return set[count _return,
			["B_MRAP_01_F",30000]];
			
		};
		if(__GETC__(life_coplevel) > 3) then
		{
			_return set[count _return,
			["B_MRAP_01_hmg_F",500000]];
			
		};
		if(__GETC__(life_coplevel) > 7) then
		{
			_return set[count _return,
			["B_MRAP_01_gmg_F",750000]];
			
		};
	};
	
	case "cop_car_2":
		{
		_return set[count _return,
		["C_Offroad_01_F",5000]];
		if(__GETC__(life_coplevel) > 1) then
		{
			_return set[count _return,
			["C_SUV_01_F",25000]];
			
		};
		if(__GETC__(life_coplevel) > 2) then
		{
			_return set[count _return,
			["B_MRAP_01_F",30000]];
			
		};
		if(__GETC__(life_coplevel) > 3) then
		{
			_return set[count _return,
			["B_MRAP_01_hmg_F",500000]];
			
		};
		if(__GETC__(life_coplevel) > 4) then
		{
			_return set[count _return,
			["B_MRAP_01_gmg_F",750000]];
			
		};
	};
	
	case "cop_car_3":
		{
		_return set[count _return,
		["C_Offroad_01_F",5000]];
		if(__GETC__(life_coplevel) > 1) then
		{
			_return set[count _return,
			["C_SUV_01_F",25000]];
			
		};
		if(__GETC__(life_coplevel) > 2) then
		{
			_return set[count _return,
			["B_MRAP_01_F",30000]];
			
		};
		if(__GETC__(life_coplevel) > 3) then
		{
			_return set[count _return,
			["B_MRAP_01_hmg_F",500000]];
			
		};
		if(__GETC__(life_coplevel) > 4) then
		{
			_return set[count _return,
			["B_MRAP_01_gmg_F",750000]];
			
		};
	};
	
	case "cop_car_5":
	{
		_return set[count _return,
		["C_Offroad_01_F",5000]];
		if(__GETC__(life_coplevel) > 1) then
		{
			_return set[count _return,
			["C_SUV_01_F",25000]];
			
		};
		if(__GETC__(life_coplevel) > 2) then
		{
			_return set[count _return,
			["B_MRAP_01_F",30000]];
			
		};
		if(__GETC__(life_coplevel) > 3) then
		{
			_return set[count _return,
			["B_MRAP_01_hmg_F",500000]];
			
		};
		if(__GETC__(life_coplevel) > 4) then
		{
			_return set[count _return,
			["B_MRAP_01_gmg_F",750000]];
			
		};
	};
	
	case "cop_car_10":
	{
		_return set[count _return,
		["C_Offroad_01_F",5000]];
		if(__GETC__(life_coplevel) > 1) then
		{
			_return set[count _return,
			["C_SUV_01_F",25000]];
			
		};
		if(__GETC__(life_coplevel) > 2) then
		{
			_return set[count _return,
			["B_MRAP_01_F",30000]];
			
		};
		if(__GETC__(life_coplevel) > 3) then
		{
			_return set[count _return,
			["B_MRAP_01_hmg_F",500000]];
			
		};
		if(__GETC__(life_coplevel) > 4) then
		{
			_return set[count _return,
			["B_MRAP_01_gmg_F",750000]];
			
		};
	};
	
	case "fed_car":
	{
		_return set[count _return,
		["B_Quadbike_01_F",0]];
		_return set[count _return,
		["C_Offroad_01_F",0]];
		_return set[count _return,
		["B_MRAP_01_F",0]];
		_return set[count _return,
		["I_MRAP_03_F",0]];
		_return set[count _return,
		["I_Truck_02_covered_F",0]];
		_return set[count _return,
		["I_Truck_02_transport_F",0]];
		_return set[count _return,
		["B_Truck_01_covered_F",0]];
		_return set[count _return,
		["B_Truck_01_transport_F",0]];
	};
	
	case "fed_air":
	{
		_return set[count _return,
		["B_Heli_Light_01_F",0]];
		_return set[count _return,
		["O_Heli_Light_02_unarmed_F",0]];
		_return set[count _return,
		["B_Heli_Transport_01_F",0]];
		_return set[count _return,
		["I_Heli_Transport_02_F",0]];
	};
	
	case "civ_air_1":
	{
		_return =
		[
			["B_Heli_Light_01_F",750000],
			["O_Heli_Light_02_unarmed_F",2560000],
			["I_Heli_Transport_02_F",3150000]
		];
	};
	
	case "civ_air_2":
	{
		_return =
		[
			["B_Heli_Light_01_F",750000],
			["O_Heli_Light_02_unarmed_F",2560000],
			["I_Heli_Transport_02_F",3150000]
		];
	};
	
	case "cop_air_1":
	{
		_return set[count _return,
		["B_Heli_Light_01_F",75000]];
		if(__GETC__(life_coplevel) > 3) then
		{
			_return set[count _return,
			["B_Heli_Transport_01_F",200000]];

		};
		if(__GETC__(life_coplevel) > 5) then
		{
			_return set[count _return,
			["B_Heli_Light_01_armed_F",200000]];
			_return set[count _return,
			["I_Heli_Light_03_unarmed_F",350000]];

		};
	};
	
	case "cop_air_2":
	{
		_return set[count _return,
		["B_Heli_Light_01_F",75000]];
		if(__GETC__(life_coplevel) > 3) then
		{
			_return set[count _return,
			["B_Heli_Transport_01_F",200000]];

		};
		if(__GETC__(life_coplevel) > 5) then
		{
			_return set[count _return,
			["B_Heli_Light_01_armed_F",200000]];
			_return set[count _return,
			["I_Heli_Light_03_unarmed_F",350000]];

		};
	};
	
	case "civ_ship_1":
	{
		_return =
		[
			["C_Rubberboat",5000],
			["C_Boat_Civil_01_F",22000],
			["B_SDV_01_F",150000]
		];
	};
	
	case "civ_ship_2":
	{
		_return =
		[
			["C_Rubberboat",5000],
			["C_Boat_Civil_01_F",22000],
			["B_SDV_01_F",150000]
		];
	};
	
	case "civ_ship_3":
	{
		_return =
		[
			["C_Rubberboat",5000],
			["C_Boat_Civil_01_F",22000],
			["B_SDV_01_F",150000]
		];
	};
	
	case "cop_ship_1":
	{
		_return =
		[
			["B_Boat_Transport_01_F",3000],
			["C_Boat_Civil_01_police_F",20000],
			["B_Boat_Armed_01_minigun_F",75000],
			["B_SDV_01_F",100000]
		];
	};
	
	case "cop_ship_2":
	{
		_return =
		[
			["B_Boat_Transport_01_F",3000],
			["C_Boat_Civil_01_police_F",20000],
			["B_Boat_Armed_01_minigun_F",75000],
			["B_SDV_01_F",100000]
		];
	};
	
	case "donator_heli":
	{
		_return =
		[
			["B_Heli_Light_01_F",100000],
			["O_Heli_Light_02_unarmed_F",175000],
			["I_Heli_Transport_02_F",650000]
		];
	};
	
	case "donator_car":
	{
		_return =
		[
			["B_Quadbike_01_F",500],
			["C_Offroad_01_F",2500],
			["C_Hatchback_01_sport_F",10000],
			["C_SUV_01_F",20000],
			["C_Van_01_fuel_F",7500],
			["B_MRAP_01_hmg_F",1700000]
		];
	};
};

_return;
