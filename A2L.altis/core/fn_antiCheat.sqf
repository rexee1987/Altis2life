/*
	@Version: 3.1
	@Author: [BWG] Joe
	@Edited: 30.01.2014
*/
if(isServer) exitWith {systemChat "TAWACS :: INITIALIZING CLOSED DUE TO BEING SERVER"};
waitUntil {!isnull player && player == player};
waitUntil {!isNil {life_fnc_displayHint}};
systemChat "TAWACS :: INITIATING ANTI-CHEAT";

private["_cfg","_patches","_sel","_name","_patches"];
_cfg = configFile >> "CfgPatches";
_patches = [];
for "_i" from 0 to count (_cfg)-1 do {
	_sel = _cfg select _i;
	if (isClass _sel) then {
		_name = configName _sel;
		_patches set[count _patches,_name];
	};
};

if ("DevCon" in _patches) then {
	[[format["%1 is using DevCon.",name player],player],"life_fnc_displayHint",nil,false] spawn BIS_fnc_MP;
	disableUserInput true;
};

//Check for menu based cheats

//Old Wookie & other Menus
[] spawn {
	while {true} do {
		waitUntil {sleep 5; !isNull (findDisplay 3030)};
		[[format["%1 is using a menu based cheat, please report him.",name player],player],"life_fnc_displayHint",nil,false] spawn BIS_fnc_MP;
		TAW_PVAR_cheater = [format["***ANTICHEAT***: %1:%2:%3",name player,getPlayerUID player,"MenuBasedHack_DISPLAY_3030"],player];
		publicVariableServer "TAW_PVAR_cheater";
		[[format["***ANTICHEAT***: %1:%2:%3",name player,getPlayerUID player,"MenuBasedHack_DISPLAY_3030"],player],"fnc_log_ac",false,false] spawn BIS_fnc_MP;
		closeDialog 0;
	};
};

//Another old one
[] spawn {
	while {true} do {
		waitUntil {sleep 5; !isNull ((findDisplay 64) displayCtrl 101)};
		[[format["%1 is using a menu based cheat, please report him.",name player],player],"life_fnc_displayHint",nil,false] spawn BIS_fnc_MP;
		[[format["***ANTICHEAT***: %1:%2:%3",name player,getPlayerUID player,"MenuBasedHack_DISPLAY_64_C_101"],player],"fnc_log_ac",false,false] spawn BIS_fnc_MP;
		TAW_PVAR_cheater = [format["***ANTICHEAT***: %1:%2:%3",name player,getPlayerUID player,"MenuBasedHack_DISPLAY_64_C_101"],player];
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
		[[format["***ANTICHEAT***: %1:%2:%3",name player,getPlayerUID player,"MenuBasedHack_RscDisplayRemoteMissions"],player],"fnc_log_ac",false,false] spawn BIS_fnc_MP;
		TAW_PVAR_cheater = [format["***ANTICHEAT***: %1:%2:%3",name player,getPlayerUID player,"MenuBasedHack_RscDisplayRemoteMissions"],player];
		publicVariableServer "TAW_PVAR_cheater";
		closeDialog 0;
	};
};

//Some additional checks
[] spawn {
	waitUntil {sleep 5; (unitRecoilCoefficient player) < 1};
	[[format["%1 is using a no recoil hack, please report him.",name player],player],"life_fnc_displayHint",nil,false] spawn BIS_fnc_MP;
	[[format["***ANTICHEAT***: %1:%2:%3",name player,getPlayerUID player,"RecoilBasedHack"],player],"fnc_log_ac",false,false] spawn BIS_fnc_MP;
	TAW_PVAR_cheater = [format["***ANTICHEAT***: %1:%2:%3",name player,getPlayerUID player,"RecoilBasedHack"],player];
	publicVariableServer "TAW_PVAR_cheater";
};

//W_O_O_K_I_E_ANTI_ANTI_HAX = compileFinal """";
//W_O_O_K_I_E_FUD_ANTI_ANTI_HAX = compileFinal """";

//Known Cheat Variables
[] spawn {
	private["_blacklist"];
	_blacklist = ["W_O_O_K_I_E_FUD_Pro_RE","W_O_O_K_I_E_FUD_Car_RE","W_O_O_K_I_E_FUD_Car_RE","W_O_O_K_I_E_FUD_FuckUp_GunStore","W_O_O_K_I_E_FUD_M_E_N_U_initMenu","W_O_O_K_I_E_FuckUp_GunStore_a","W_O_O_K_I_E_M_E_N_U_funcs_inited","Menu_Init_Lol","W_O_O_K_I_E_Pro_RE","W_O_O_K_I_E_Debug_Mon","W_O_O_K_I_E_Debug_1337","Veh_S_P_A_W_N_Shitt","sfsefse","tw4etinitMenu","tw4etgetControl","efr4243234","sdfwesrfwesf233","sdgff4535hfgvcxghn","adadawer24_1337","lkjhgfuyhgfd","dayz_serverObjectMonitor","fsfgdggdzgfd","fsdddInfectLOL","Wookie_List","Wookie_Pro_RE","Wookie_Car_RE","Wookie_Debug_Mon","faze_funcs_inited","advertising_banner_infiSTAR","atext_star_xa","Monky_hax_dbclick","qopfkqpofqk","debug_star_colorful","AntiAntiAntiAntiHax","antiantiantiantih4x",
	"hub","scrollinit","gfYJV","Lystic_LMAOOOOOOOOOOOOOOOOOOO","Lystic_Re","Lysto_Lyst","Menulocations","Lystic_Init","scroll_m_init_star","exstr1","pathtoscrdir3","Monky_funcs_inited",
	"Monky_initMenu","player_zombieCheck","godlol","playericons","abcdefGEH","wierdo","go_invisible_infiSTAR","serverObjectMonitor","enamearr","initarr3","locdb","sCode","infAmmoIndex",
	"nukeDONEstar","Wookie_List","Wookie_Pro_RE"];
	
	while {true} do {
		private["_var"]; {
			_var = missionNamespace getVariable _x;
			if(!isNil {_var}) then {
				missionNamespace setVariable [_x,nil];
				[[format["%1 is using a hack, please report him.",name player],player],"life_fnc_displayHint",nil,false] spawn BIS_fnc_MP;
				[[format["***ANTICHEAT***: %1:%2:%3",name player,getPlayerUID player,_x],player],"fnc_log_ac",false,false] spawn BIS_fnc_MP;
				TAW_PVAR_cheater = [format ["***ANTICHEAT***: %1:%2:%3", name player, getPlayerUID player, _x], player];
				publicVariableServer "TAW_PVAR_cheater";
				waitUntil {isNull player};
			};
		} forEach _blacklist;
		sleep 10;
	};
};

if (life_adminlevel < 1) then {
	// Vehicle spawning hack
	[] spawn {
		private ["_blacklist","_vehicle"];
		_blacklist = ["I_APC_Wheeled_03_cannon_F","O_APC_Tracked_02_AA_F","O_APC_Tracked_02_cannon_F","O_APC_Wheeled_02_rcws_F","O_MBT_02_arty_F","O_MBT_02_cannon_F",
						"B_APC_Tracked_01_AA_F","B_APC_Tracked_01_rcws_F","B_APC_Wheeled_01_cannon_F","B_MBT_01_arty_F","B_MBT_01_cannon_F","B_MBT_01_mlrs_F"];
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

diag_log "::Life Client:: Loading anti-hack from the server...";
clientStarted = player;
publicVariableServer "clientStarted";
waitUntil { (!isNil {AHAH}) };
diag_log "::Life Client:: Anti-hack received from the server.";

waitUntil { !isNil {life_fnc_injectionDetection} };
[] call life_fnc_injectionDetection;