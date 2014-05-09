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
			["B_Quadbike_01_F",1500],
			["C_Hatchback_01_F",5000],
			["C_Offroad_01_F",20000],
			["C_SUV_01_F",35000],
			["C_Van_01_transport_F",50000],
			["C_Van_01_box_F",70000]
		];
		if(__GETC__(life_donator) == 1) then
		{
			["B_Quadbike_01_F",1400],
			["C_Hatchback_01_F",4500],
			["C_Hatchback_01_sport_F",10000],
			["C_Offroad_01_F",19000],
			["C_SUV_01_F",33000],
			["C_Van_01_transport_F",45000],
			["C_Van_01_box_F",60000]
		};
		
		if(__GETC__(life_donator) == 2) then
		{
			["B_Quadbike_01_F",1200],
			["C_Hatchback_01_F",4000],
			["C_Hatchback_01_sport_F",10000],
			["C_Offroad_01_F",15000],
			["C_SUV_01_F",31000],
			["C_Van_01_transport_F",42000],
			["C_Van_01_box_F",55000]
		};
		if(__GETC__(life_donator) == 3) then
		{
			["B_Quadbike_01_F",1100],
			["C_Hatchback_01_F",3500],
			["C_Hatchback_01_sport_F",10000],
			["C_Offroad_01_F",12000],
			["C_SUV_01_F",29000],
			["C_Van_01_transport_F",40000],
			["C_Van_01_box_F",50000]
		};
		if(__GETC__(life_donator) == 4) then
		{
			["B_Quadbike_01_F",1000],
			["C_Hatchback_01_F",3000],
			["C_Hatchback_01_sport_F",10000],
			["C_Offroad_01_F",10000],
			["C_SUV_01_F",27000],
			["C_Van_01_transport_F",35000],
			["C_Van_01_box_F",45000]
		};
		if(__GETC__(life_donator) == 5) then
		{
			["B_Quadbike_01_F",800],
			["C_Hatchback_01_F",2500],
			["C_Hatchback_01_sport_F",10000],
			["C_Offroad_01_F",9500],
			["C_SUV_01_F",25000],
			["C_Van_01_transport_F",32000],
			["C_Van_01_box_F",40000]
		};
	}; 
	
	case "civ_car_2":
	{
		_return = 
		[
			["B_Quadbike_01_F",1500],
			["C_Hatchback_01_F",5000],
			["C_Offroad_01_F",20000],
			["C_SUV_01_F",35000],
			["C_Van_01_transport_F",50000],
			["C_Van_01_box_F",70000]
		];
		if(__GETC__(life_donator) == 1) then
		{
			["B_Quadbike_01_F",1400],
			["C_Hatchback_01_F",4500],
			["C_Hatchback_01_sport_F",10000],
			["C_Offroad_01_F",19000],
			["C_SUV_01_F",33000],
			["C_Van_01_transport_F",45000],
			["C_Van_01_box_F",60000]
		};
		
		if(__GETC__(life_donator) == 2) then
		{
			["B_Quadbike_01_F",1200],
			["C_Hatchback_01_F",4000],
			["C_Hatchback_01_sport_F",10000],
			["C_Offroad_01_F",15000],
			["C_SUV_01_F",31000],
			["C_Van_01_transport_F",42000],
			["C_Van_01_box_F",55000]
		};
		if(__GETC__(life_donator) == 3) then
		{
			["B_Quadbike_01_F",1100],
			["C_Hatchback_01_F",3500],
			["C_Hatchback_01_sport_F",10000],
			["C_Offroad_01_F",12000],
			["C_SUV_01_F",29000],
			["C_Van_01_transport_F",40000],
			["C_Van_01_box_F",50000]
		};
		if(__GETC__(life_donator) == 4) then
		{
			["B_Quadbike_01_F",1000],
			["C_Hatchback_01_F",3000],
			["C_Hatchback_01_sport_F",10000],
			["C_Offroad_01_F",10000],
			["C_SUV_01_F",27000],
			["C_Van_01_transport_F",35000],
			["C_Van_01_box_F",45000]
		};
		if(__GETC__(life_donator) == 5) then
		{
			["B_Quadbike_01_F",800],
			["C_Hatchback_01_F",2500],
			["C_Hatchback_01_sport_F",10000],
			["C_Offroad_01_F",9500],
			["C_SUV_01_F",25000],
			["C_Van_01_transport_F",32000],
			["C_Van_01_box_F",40000]
		};
	}; 
	
	case "civ_car_3":
	{
		_return = 
		[
			["B_Quadbike_01_F",1500],
			["C_Hatchback_01_F",5000],
			["C_Offroad_01_F",20000],
			["C_SUV_01_F",35000],
			["C_Van_01_transport_F",50000],
			["C_Van_01_box_F",70000]
		];
		if(__GETC__(life_donator) == 1) then
		{
			["B_Quadbike_01_F",1400],
			["C_Hatchback_01_F",4500],
			["C_Hatchback_01_sport_F",10000],
			["C_Offroad_01_F",19000],
			["C_SUV_01_F",33000],
			["C_Van_01_transport_F",45000],
			["C_Van_01_box_F",60000]
		};
		
		if(__GETC__(life_donator) == 2) then
		{
			["B_Quadbike_01_F",1200],
			["C_Hatchback_01_F",4000],
			["C_Hatchback_01_sport_F",10000],
			["C_Offroad_01_F",15000],
			["C_SUV_01_F",31000],
			["C_Van_01_transport_F",42000],
			["C_Van_01_box_F",55000]
		};
		if(__GETC__(life_donator) == 3) then
		{
			["B_Quadbike_01_F",1100],
			["C_Hatchback_01_F",3500],
			["C_Hatchback_01_sport_F",10000],
			["C_Offroad_01_F",12000],
			["C_SUV_01_F",29000],
			["C_Van_01_transport_F",40000],
			["C_Van_01_box_F",50000]
		};
		if(__GETC__(life_donator) == 4) then
		{
			["B_Quadbike_01_F",1000],
			["C_Hatchback_01_F",3000],
			["C_Hatchback_01_sport_F",10000],
			["C_Offroad_01_F",10000],
			["C_SUV_01_F",27000],
			["C_Van_01_transport_F",35000],
			["C_Van_01_box_F",45000]
		};
		if(__GETC__(life_donator) == 5) then
		{
			["B_Quadbike_01_F",800],
			["C_Hatchback_01_F",2500],
			["C_Hatchback_01_sport_F",10000],
			["C_Offroad_01_F",9500],
			["C_SUV_01_F",25000],
			["C_Van_01_transport_F",32000],
			["C_Van_01_box_F",40000]
		};
	};
	
	case "civ_car_5":
	{
		_return = 
		[
			["B_Quadbike_01_F",1500],
			["C_Hatchback_01_F",5000],
			["C_Offroad_01_F",20000],
			["C_SUV_01_F",35000],
			["C_Van_01_transport_F",50000],
			["C_Van_01_box_F",70000]
		];
		if(__GETC__(life_donator) == 1) then
		{
			["B_Quadbike_01_F",1400],
			["C_Hatchback_01_F",4500],
			["C_Hatchback_01_sport_F",10000],
			["C_Offroad_01_F",19000],
			["C_SUV_01_F",33000],
			["C_Van_01_transport_F",45000],
			["C_Van_01_box_F",60000]
		};
		
		if(__GETC__(life_donator) == 2) then
		{
			["B_Quadbike_01_F",1200],
			["C_Hatchback_01_F",4000],
			["C_Hatchback_01_sport_F",10000],
			["C_Offroad_01_F",15000],
			["C_SUV_01_F",31000],
			["C_Van_01_transport_F",42000],
			["C_Van_01_box_F",55000]
		};
		if(__GETC__(life_donator) == 3) then
		{
			["B_Quadbike_01_F",1100],
			["C_Hatchback_01_F",3500],
			["C_Hatchback_01_sport_F",10000],
			["C_Offroad_01_F",12000],
			["C_SUV_01_F",29000],
			["C_Van_01_transport_F",40000],
			["C_Van_01_box_F",50000]
		};
		if(__GETC__(life_donator) == 4) then
		{
			["B_Quadbike_01_F",1000],
			["C_Hatchback_01_F",3000],
			["C_Hatchback_01_sport_F",10000],
			["C_Offroad_01_F",10000],
			["C_SUV_01_F",27000],
			["C_Van_01_transport_F",35000],
			["C_Van_01_box_F",45000]
		};
		if(__GETC__(life_donator) == 5) then
		{
			["B_Quadbike_01_F",800],
			["C_Hatchback_01_F",2500],
			["C_Hatchback_01_sport_F",10000],
			["C_Offroad_01_F",9500],
			["C_SUV_01_F",25000],
			["C_Van_01_transport_F",32000],
			["C_Van_01_box_F",40000]
		};
	};
	
	case "adac_car":
	{
		_return = 
		[
			["C_Offroad_01_F",2000],
			["C_SUV_01_F",5000],
			["O_Heli_Light_02_unarmed_F",450000]	
		];
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
			["I_Truck_02_transport_F",100000],
			["I_Truck_02_covered_F",150000],
			["B_Truck_01_transport_F",200000],
			["B_Truck_01_covered_F",250000],
			["B_Truck_01_box_F",500000]
		];
		if(__GETC__(life_donator) == 1) then
		{
			["I_Truck_02_transport_F",95000],
			["I_Truck_02_covered_F",140000],
			["B_Truck_01_transport_F",190000],
			["B_Truck_01_covered_F",240000],
			["B_Truck_01_box_F",485000]
		};
		
		if(__GETC__(life_donator) == 2) then
		{
			["I_Truck_02_transport_F",90000],
			["I_Truck_02_covered_F",130000],
			["B_Truck_01_transport_F",180000],
			["B_Truck_01_covered_F",220000],
			["B_Truck_01_box_F",475000]
		};
		if(__GETC__(life_donator) == 3) then
		{
			["I_Truck_02_transport_F",80000],
			["I_Truck_02_covered_F",110000],
			["B_Truck_01_transport_F",170500],
			["B_Truck_01_covered_F",200000],
			["B_Truck_01_box_F",450000]
		};
		if(__GETC__(life_donator) == 4) then
		{
			["I_Truck_02_transport_F",75000],
			["I_Truck_02_covered_F",100000],
			["B_Truck_01_transport_F",155000],
			["B_Truck_01_covered_F",190000],
			["B_Truck_01_box_F",425000]
		};
		if(__GETC__(life_donator) == 5) then
		{
			["I_Truck_02_transport_F",65000],
			["I_Truck_02_covered_F",95000],
			["B_Truck_01_transport_F",145000],
			["B_Truck_01_covered_F",185000],
			["B_Truck_01_box_F",400000]
		};		
	};
	
	case "civ_truck_2":
	{
			_return =
		[
			["I_Truck_02_transport_F",100000],
			["I_Truck_02_covered_F",150000],
			["B_Truck_01_transport_F",200000],
			["B_Truck_01_covered_F",250000],
			["B_Truck_01_box_F",500000]
		];
		if(__GETC__(life_donator) == 1) then
		{
			["I_Truck_02_transport_F",95000],
			["I_Truck_02_covered_F",140000],
			["B_Truck_01_transport_F",190000],
			["B_Truck_01_covered_F",240000],
			["B_Truck_01_box_F",485000]
		};
		
		if(__GETC__(life_donator) == 2) then
		{
			["I_Truck_02_transport_F",90000],
			["I_Truck_02_covered_F",130000],
			["B_Truck_01_transport_F",180000],
			["B_Truck_01_covered_F",220000],
			["B_Truck_01_box_F",475000]
		};
		if(__GETC__(life_donator) == 3) then
		{
			["I_Truck_02_transport_F",80000],
			["I_Truck_02_covered_F",110000],
			["B_Truck_01_transport_F",170500],
			["B_Truck_01_covered_F",200000],
			["B_Truck_01_box_F",450000]
		};
		if(__GETC__(life_donator) == 4) then
		{
			["I_Truck_02_transport_F",75000],
			["I_Truck_02_covered_F",100000],
			["B_Truck_01_transport_F",155000],
			["B_Truck_01_covered_F",190000],
			["B_Truck_01_box_F",425000]
		};
		if(__GETC__(life_donator) == 5) then
		{
			["I_Truck_02_transport_F",65000],
			["I_Truck_02_covered_F",95000],
			["B_Truck_01_transport_F",145000],
			["B_Truck_01_covered_F",185000],
			["B_Truck_01_box_F",400000]
		};		
	};
	
	case "reb_v_1":
	{
		_return =
		[
			["B_Quadbike_01_F",1500],
			["B_G_Offroad_01_F",20000],
			["O_MRAP_02_F",500000],
			["O_Truck_03_covered_F",500000],
			["B_Heli_Light_01_F",325000]
		];
		
		if(license_civ_rebel) then
		{
			_return set[count _return,
			["B_G_Offroad_01_armed_F",500000]];
		};
	};
	
	case "reb_v_2":
	{
				_return =
		[
			["B_Quadbike_01_F",1500],
			["B_G_Offroad_01_F",20000],
			["O_MRAP_02_F",500000],
			["O_Truck_03_covered_F",500000],
			["B_Heli_Light_01_F",325000]
		];
		
		if(license_civ_rebel) then
		{
			_return set[count _return,
			["B_G_Offroad_01_armed_F",500000]];
		};
	};
			
	case "reb_car":
	{
		_return =
		[
			["B_Quadbike_01_F",1500],
			["B_G_Offroad_01_F",20000]
		];
	};
	
	case "reb_car2":
	{
		_return set[count _return,
		["B_Quadbike_01_F",1500]];
		_return set[count _return,
		["C_Offroad_01_F",20000]];
		_return set[count _return,
		["O_Truck_03_covered_F",500000]];
		_return set[count _return,
		["O_MRAP_02_F",500000]];
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
		["C_SUV_01_F",5000]];
		if(__GETC__(life_coplevel) > 1) then
		{
			_return set[count _return,
			["C_Offroad_01_F",25000]];
			
		};
		if(__GETC__(life_coplevel) > 2) then
		{
			_return set[count _return,
			["B_MRAP_01_F",30000]];
			
		};
		if(__GETC__(life_coplevel) > 2) then
		{
			_return set[count _return,
			["C_Hatchback_01_sport_F",150000]];
			
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
			_return set[count _return,
			["I_MRAP_03_F",50000]];
			_return set[count _return,
			["I_MRAP_03_hmg_F",750000]];
			_return set[count _return,
			["I_MRAP_03_gmg_F",750000]];
			
		};
	};
	
	case "cop_car_2":
		{
		_return set[count _return,
		["C_SUV_01_F",5000]];
		if(__GETC__(life_coplevel) > 1) then
		{
			_return set[count _return,
			["C_Offroad_01_F",25000]];
			
		};
		if(__GETC__(life_coplevel) > 2) then
		{
			_return set[count _return,
			["C_Hatchback_01_sport_F",150000]];
			
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
			_return set[count _return,
			["I_MRAP_03_F",750000]];
			_return set[count _return,
			["I_MRAP_03_hmg_F",750000]];
			_return set[count _return,
			["I_MRAP_03_gmg_F",750000]];
			
		};
	};
	
	case "cop_car_3":
		{
		_return set[count _return,
		["C_SUV_01_F",5000]];
		if(__GETC__(life_coplevel) > 1) then
		{
			_return set[count _return,
			["C_Offroad_01_F",25000]];
			
		};
		if(__GETC__(life_coplevel) > 2) then
		{
			_return set[count _return,
			["C_Hatchback_01_sport_F",150000]];
			
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
			_return set[count _return,
			["I_MRAP_03_F",750000]];
			_return set[count _return,
			["I_MRAP_03_hmg_F",750000]];
			_return set[count _return,
			["I_MRAP_03_gmg_F",750000]];
			
		};
	};
	
	case "cop_car_5":
	{
		_return set[count _return,
		["C_SUV_01_F",5000]];
		if(__GETC__(life_coplevel) > 1) then
		{
			_return set[count _return,
			["C_Offroad_01_F",25000]];
			
		};
		if(__GETC__(life_coplevel) > 2) then
		{
			_return set[count _return,
			["C_Hatchback_01_sport_F",150000]];
			
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
			_return set[count _return,
			["I_MRAP_03_F",750000]];
			_return set[count _return,
			["I_MRAP_03_hmg_F",750000]];
			_return set[count _return,
			["I_MRAP_03_gmg_F",750000]];
			
		};
	};
	
	case "cop_car_10":
	{
		_return set[count _return,
		["C_SUV_01_F",5000]];
		if(__GETC__(life_coplevel) > 1) then
		{
			_return set[count _return,
			["C_Offroad_01_F",25000]];
			
		};
		if(__GETC__(life_coplevel) > 2) then
		{
			_return set[count _return,
			["C_Hatchback_01_sport_F",150000]];
			
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
			_return set[count _return,
			["I_MRAP_03_F",750000]];
			_return set[count _return,
			["I_MRAP_03_hmg_F",750000]];
			_return set[count _return,
			["I_MRAP_03_gmg_F",750000]];
			
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
			["B_Heli_Light_01_F",500000],
			["O_Heli_Light_02_unarmed_F",1500000],
			["I_Heli_Transport_02_F",2500000]
		];
		if(__GETC__(life_donator) == 1) then
		{
			["B_Heli_Light_01_F",450000],
			["O_Heli_Light_02_unarmed_F",1300000],
			["I_Heli_Transport_02_F",2300000]
		};
		if(__GETC__(life_donator) == 2) then
		{
			["B_Heli_Light_01_F",420000],
			["O_Heli_Light_02_unarmed_F",1100000],
			["I_Heli_Transport_02_F",2200000]
		};
		if(__GETC__(life_donator) == 3) then
		{
			["B_Heli_Light_01_F",400000],
			["O_Heli_Light_02_unarmed_F",1000000],
			["I_Heli_Transport_02_F",2000000]
		};
		if(__GETC__(life_donator) == 4) then
		{
			["B_Heli_Light_01_F",380000],
			["O_Heli_Light_02_unarmed_F",980000],
			["I_Heli_Transport_02_F",1800000]
		};
		if(__GETC__(life_donator) == 5) then
		{
			["B_Heli_Light_01_F",350000],
			["O_Heli_Light_02_unarmed_F",900000],
			["I_Heli_Transport_02_F",1100000]
		};
	};
	
	case "civ_air_2":
	{
			_return =
		[
			["B_Heli_Light_01_F",500000],
			["O_Heli_Light_02_unarmed_F",1500000],
			["I_Heli_Transport_02_F",2500000]
		];
		if(__GETC__(life_donator) == 1) then
		{
			["B_Heli_Light_01_F",450000],
			["O_Heli_Light_02_unarmed_F",1300000],
			["I_Heli_Transport_02_F",2300000]
		};
		if(__GETC__(life_donator) == 2) then
		{
			["B_Heli_Light_01_F",420000],
			["O_Heli_Light_02_unarmed_F",1100000],
			["I_Heli_Transport_02_F",2200000]
		};
		if(__GETC__(life_donator) == 3) then
		{
			["B_Heli_Light_01_F",400000],
			["O_Heli_Light_02_unarmed_F",1000000],
			["I_Heli_Transport_02_F",2000000]
		};
		if(__GETC__(life_donator) == 4) then
		{
			["B_Heli_Light_01_F",380000],
			["O_Heli_Light_02_unarmed_F",980000],
			["I_Heli_Transport_02_F",1800000]
		};
		if(__GETC__(life_donator) == 5) then
		{
			["B_Heli_Light_01_F",350000],
			["O_Heli_Light_02_unarmed_F",900000],
			["I_Heli_Transport_02_F",1100000]
		};
	};
	
	case "cop_air_1":
	{
		if(__GETC__(life_coplevel) > 1) then
		{
			_return set[count _return,
			["B_Heli_Light_01_F",75000]];
			
			

		};
		if(__GETC__(life_coplevel) > 6) then
		{   
		    _return set[count _return,
			["B_Heli_Light_01_armed_F",200000]];
			_return set[count _return,
			["I_Heli_light_03_unarmed_F",400000]];
			_return set[count _return,
			["B_Heli_Transport_01_F",500000]];

		};
	};
	
	case "cop_air_2":
	{
		if(__GETC__(life_coplevel) > 1) then
		{
			_return set[count _return,
			["B_Heli_Light_01_F",75000]];
			

		};
		if(__GETC__(life_coplevel) > 6) then
		{
		    _return set[count _return,
			["B_Heli_Light_01_armed_F",200000]];
			_return set[count _return,
			["I_Heli_light_03_unarmed_F",400000]];
			_return set[count _return,
			["B_Heli_Transport_01_F",500000]];

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
			["B_Heli_Light_01_F",80000],
			["O_Heli_Light_02_unarmed_F",175000],
			["I_Heli_Transport_02_F",150000]
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
