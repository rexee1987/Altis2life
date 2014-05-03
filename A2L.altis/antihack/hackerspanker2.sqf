if(isServer) exitWith {systemChat "TAWACS :: INITIALIZING CLOSED DUE TO BEING SERVER"};
waitUntil {!isnull player && player == player};
waitUntil {!isNil {life_fnc_broadcast}};
systemChat "TAWACS :: INITIATING ANTI-CHEAT";

if((getPlayerUID player) in ["76561198033778245","76561198135217221","76561198123037747","76561198024929748","76561198129286538"]) exitWith {systemChat "TAWACS :: INITIALIZATION CLOSED DUE TO BEING IN WHITELIST";};

private["_cfg","_patches","_sel","_name","_patches"];
_cfg = configFile >> "CfgPatches";
_patches = [];
for "_i" from 0 to count (_cfg)-1 do
{
	_sel = _cfg select _i;
	if(isClass _sel) then
	{
		_name = configName _sel;
		_patches set[count _patches,_name];
	};
};

if("DevCon" in _patches) then
{
	[[0,format["%1 is using DevCon.",name player]],"life_fnc_broadcast",nil,false] spawn BIS_fnc_MP;
	disableUserInput true;
};

//Check for menu based cheats

//Old Wookie & other Menus
[] spawn 
{
	while {true} do
	{
		waitUntil {!isNull (findDisplay 3030)};
		[[0,format["%1 is using a menu based cheat, please report him.",name player]],"life_fnc_broadcast",nil,false] spawn BIS_fnc_MP;
		[[format["anticheat:%1:%2:%3",name player,getPlayerUID player,"MenuBasedHack_DISPLAY_3030"],player],"fnc_log_ac",false,false] spawn BIS_fnc_MP;
		closeDialog 0;
	};
};

//Another old one
[] spawn
{
	while {true} do
	{
		waitUntil {!isNull ((findDisplay 64) displayCtrl 101)};
		[[0,format["%1 is using a menu based cheat, please report him.",name player]],"life_fnc_broadcast",nil,false] spawn BIS_fnc_MP;
		[[format["anticheat:%1:%2:%3",name player,getPlayerUID player,"MenuBasedHack_DISPLAY_64_C_101"],player],"fnc_log_ac",false,false] spawn BIS_fnc_MP;
		closeDialog 0;
	};
};

[] spawn
{
	while {true} do
	{
		waitUntil {!isNull (findDisplay 162)};
		[[0,format["%1 is using a menu based cheat, please report him.",name player]],"life_fnc_broadcast",nil,false] spawn BIS_fnc_MP;
		[[format["anticheat:%1:%2:%3",name player,getPlayerUID player,"MenuBasedHack_DISPLAY_162"],player],"fnc_log_ac",false,false] spawn BIS_fnc_MP;
		ctrlactivate ((findDisplay 162) displayCtrl 2);
		closeDialog 0;
	};
};

[] spawn
{
	while {true} do
	{
		waitUntil {!isNull (findDisplay 129)};
		closeDialog 0;
	};
};

[] spawn
{
	while {true} do
	{
		waitUntil {!isNull (uiNamespace getVariable "RscDisplayRemoteMissions")};
		[[0,format["%1 is using a menu based cheat, please report him.",name player]],"life_fnc_broadcast",nil,false] spawn BIS_fnc_MP;
		[[format["anticheat:%1:%2:%3",name player,getPlayerUID player,"MenuBasedHack_RscDisplayRemoteMissions"],player],"fnc_log_ac",false,false] spawn BIS_fnc_MP;
		closeDialog 0;
	};
};

//Some additional checks
[] spawn
{
	waitUntil {(unitRecoilCoefficient player) < 1};
	[[0,format["%1 is using a no recoil hack, please report him.",name player]],"life_fnc_broadcast",nil,false] spawn BIS_fnc_MP;
	[[format["anticheat:%1:%2:%3",name player,getPlayerUID player,"RecoilBasedHack"],player],"fnc_log_ac",false,false] spawn BIS_fnc_MP;
};

[] spawn
{
	while {true} do
	{
		waitUntil {life_atmcash > 350000000 OR life_cash > 35000000};
		life_cash = 3000000;
		life_atmcash = 3000000;
	};
};

W_O_O_K_I_E_ANTI_ANTI_HAX = compileFinal """";
W_O_O_K_I_E_FUD_ANTI_ANTI_HAX = compileFinal """";

//Known Cheat Variables
[] spawn 
{
	private["_blacklist"];
	_blacklist = ["W_O_O_K_I_E_FUD_Pro_RE","W_O_O_K_I_E_FUD_Car_RE","W_O_O_K_I_E_FUD_Car_RE","W_O_O_K_I_E_FUD_FuckUp_GunStore","W_O_O_K_I_E_FUD_M_E_N_U_initMenu","W_O_O_K_I_E_FuckUp_GunStore_a","W_O_O_K_I_E_M_E_N_U_funcs_inited","Menu_Init_Lol","W_O_O_K_I_E_Pro_RE","W_O_O_K_I_E_Debug_Mon","W_O_O_K_I_E_Debug_1337","Veh_S_P_A_W_N_Shitt","sfsefse","tw4etinitMenu","tw4etgetControl","efr4243234","sdfwesrfwesf233","sdgff4535hfgvcxghn","adadawer24_1337","lkjhgfuyhgfd","dayz_serverObjectMonitor","fsfgdggdzgfd","fsdddInfectLOL","Wookie_List","Wookie_Pro_RE","Wookie_Car_RE","Wookie_Debug_Mon","faze_funcs_inited","advertising_banner_infiSTAR","atext_star_xa","Monky_hax_dbclick","qopfkqpofqk","debug_star_colorful","AntiAntiAntiAntiHax","antiantiantiantih4x",
	"hub","scrollinit","gfYJV","Lystic_LMAOOOOOOOOOOOOOOOOOOO","Lystic_Re","Lysto_Lyst","Menulocations","Lystic_Init","scroll_m_init_star","exstr1","pathtoscrdir3","Monky_funcs_inited",
	"Monky_initMenu","player_zombieCheck","godlol","playericons","abcdefGEH","wierdo","go_invisible_infiSTAR","serverObjectMonitor","enamearr","initarr3","locdb","sCode","infAmmoIndex",
	"nukeDONEstar","Wookie_List","Wookie_Pro_RE","FUCKTONIC"];
	
	while {true} do
	{
		private["_var"];
		{
			_var = missionNamespace getVariable _x;
			if(!isNil {_var}) then
			{
				missionNamespace setVariable [_x,nil];
				[[0,format["%1 was flagged for using cheats.\n\nVar flagged: %2",name player,_x]],"life_fnc_broadcast",nil,false] spawn BIS_fnc_MP;
				[[format["anticheat:%1:%2:%3",name player,getPlayerUID player,_x],player],"fnc_log_ac",false,false] spawn BIS_fnc_MP;
				waitUntil {isNull player};
			};
		} foreach _blacklist;
		sleep 1;
	};
};

systemChat "TAWACS :: ANTI-CHEAT INITIALIZED";