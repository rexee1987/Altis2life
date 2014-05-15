#include <macro.h>
/*
	File: fn_initZeus.sqf
	Author : Blackd0g
	
	Description:
	Starts initialization of zeus slot.
	The zeus slot is basically god and is only used for admins to create stuff.	
*/

// Check if player has Admin rights when in Zeus-Slot
if((str(player) in ["bis_curatorUnit"])) then {
	if((__GETC__(life_adminlevel) < 3)) then {
		["NotWhitelisted",false,true] call BIS_fnc_endMission;
		removeAllWeapons player;
		player enableSimulation false;
		sleep 35;
	};

};