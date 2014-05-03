/*
	@Version: 3.1
	@Author: Varmonger
	@Edited: 30.01.2014
*/
if (isServer) exitWith {};

waitUntil {!isnull player && player == player};
waitUntil {!isNil {life_fnc_displayHint}};

private ["_cfg","_patches","_sel","_name","_patches"];

_cfg = configFile >> "CfgPatches";
_patches = [];
for "_i" from 0 to count (_cfg)-1 do {
	_sel = _cfg select _i;
	if (isClass _sel) then {
		_name = configName _sel;
		_patches set [count _patches,_name];
	};
};

if ("DevCon" in _patches) then {
	[[format ["%1 is using DevCon.", name player], player], "life_fnc_displayHint", nil, false] spawn BIS_fnc_MP;
	disableUserInput true;
};

//Old Wookie & other Menus
[] spawn {
	while {true} do {
		waitUntil {sleep 5; !isNull (findDisplay 3030)};
		[[format["%1 is using a menu based cheat, please report him.",name player],player],"life_fnc_displayHint",nil,false] spawn BIS_fnc_MP;
		TAW_PVAR_cheater = [format["***ANTI-HACK***: %1:%2:%3",name player,getPlayerUID player,"MenuBasedHack_DISPLAY_3030"],player];
		publicVariableServer "TAW_PVAR_cheater";
		[[format["***ANTI-HACK***: %1:%2:%3",name player,getPlayerUID player,"MenuBasedHack_DISPLAY_3030"],player],"fnc_log_ac",false,false] spawn BIS_fnc_MP;
		closeDialog 0;
	};
};

//Another old one
[] spawn {
	while {true} do {
		waitUntil {sleep 5; !isNull ((findDisplay 64) displayCtrl 101)};
		[[format["%1 is using a menu based cheat, please report him.",name player],player],"life_fnc_displayHint",nil,false] spawn BIS_fnc_MP;
		[[format["***ANTI-HACK***: %1:%2:%3",name player,getPlayerUID player,"MenuBasedHack_DISPLAY_64_C_101"],player],"fnc_log_ac",false,false] spawn BIS_fnc_MP;
		TAW_PVAR_cheater = [format["***ANTI-HACK***: %1:%2:%3",name player,getPlayerUID player,"MenuBasedHack_DISPLAY_64_C_101"],player];
		publicVariableServer "TAW_PVAR_cheater";
		closeDialog 0;
	};
};

[] spawn {
	while {true} do {
		waitUntil {sleep 5; !isNull (findDisplay 129)};
		closeDialog 0;
	};
};

[] spawn {
	while {true} do {
		waitUntil {sleep 5; !isNull (uiNamespace getVariable "RscDisplayRemoteMissions")};
		[[format["%1 is using a menu based cheat, please report him.",name player],player],"life_fnc_displayHint",nil,false] spawn BIS_fnc_MP;
		[[format["***ANTI-HACK***: %1:%2:%3",name player,getPlayerUID player,"MenuBasedHack_RscDisplayRemoteMissions"],player],"fnc_log_ac",false,false] spawn BIS_fnc_MP;
		TAW_PVAR_cheater = [format["***ANTI-HACK***: %1:%2:%3",name player,getPlayerUID player,"MenuBasedHack_RscDisplayRemoteMissions"],player];
		publicVariableServer "TAW_PVAR_cheater";
		closeDialog 0;
	};
};

if (life_adminlevel < 1) then {
	// Vehicle spawning hack
	[] spawn {
		private ["_blacklist","_vehicle"];
		_blacklist = ["O_APC_Tracked_02_AA_F","O_APC_Tracked_02_cannon_F","O_APC_Wheeled_02_rcws_F","O_MBT_02_arty_F","O_MBT_02_cannon_F","O_Plane_CAS_02_F","I_Plane_Fighter_03_CAS_F","I_Plane_Fighter_03_AA_F","6Rnd_155mm_Mo_AT_mine","6Rnd_155mm_Mo_mine",
						"B_APC_Tracked_01_AA_F","B_APC_Tracked_01_rcws_F","B_MBT_01_arty_F","B_MBT_01_cannon_F","B_MBT_01_mlrs_F","B_Plane_CAS_01_F","ATMine_Range_Mag","APERSMine_Range_Mag","SLAMDirectionalMine_Wire_Mag"];
		while {true} do {
			_vehicle = typeOf (vehicle player);
			if (_vehicle in _blacklist) then {
				player action ["Eject", vehicle player];
				titleText ["Bye bye hacker...", "BLACK", 0.1];
				_msg = format ["%1 decided to get in a hacker spawned vehicle (%2).", name player, _vehicle];
				[[0, _msg], "life_fnc_broadcastMessage", true, false] spawn BIS_fnc_MP;
				disableUserinput true;
				deleteVehicle (vehicle player);
			};
			sleep 10;
		};
	};

	// AFK kick script
	[] spawn {
		private ["_new","_old","_kick"];
		_old = getPos player;
		_kick = false;
		while {true} do {
			sleep (5*60);
			_new = getPos player;
			if ((_new select 0 == _old select 0) && (_new select 1 == _old select 1)) then {
				if (_kick) then {
					endMission "Loser";
				} else {
					_kick = true;
					hint "You will be kicked in 5 minutes for being AFK.";
				};
			} else {
				_kick = false;
			};
			_old = _new;
		};
	};
};

diag_log "::Life Client:: Loading Wolf Pack Hacker Spanker...";
"AHAH_WP" addPublicVariableEventHandler { [] spawn (_this select 1) };
clientStarted_WP = player;
publicVariableServer "clientStarted_WP";
waitUntil { (!isNil {AHAH_WP}) };
diag_log "::Life Client:: Wolf Pack Hacker Spanker Loaded.";

waitUntil { !isNil {life_fnc_injectionDetection} };
[] call life_fnc_injectionDetection;