if(name player == "") then 
{
	titleText ["PLEASE CHANGE YOUR NAME","BLACK OUT",0.05];
	sleep 5;
	endMission "LOSER";
};

//[[getPlayerUID player],"fn_KickPlayer",nil,false] spawn BIS_fnc_MP; //Test call
fn_KickPlayer =
{
	_kickedPlayer = _this select 0;
	server globalChat format ["UID:%1 was kicked",_kickedPlayer];
	if(getPlayerUID player == _kickedPlayer) exitWith
	{
		closeDialog 0;
		disableUserInput true;
		0 fadeSound 0;
		0 fadeRadio 0;
		0 fadeMusic 1;
		playMusic "kicked";
		titleText ["YOU HAVE BEEN KICKED","BLACK OUT",0.05];
		sleep 5;
		endMission "LOSER";
	};
};

//[[getPlayerUID player],"fn_BanPlayer",nil,false] spawn BIS_fnc_MP; //Test call
fn_BanPlayer =
{
	_bannedPlayer = _this select 0;
	server globalChat format ["UID:%1 was banned",_bannedPlayer];
	if(getPlayerUID player == _bannedPlayer) exitWith
	{
		["banlist", getPlayerUID player, "Account Name", name player] call fn_SaveToServer;
		["banlist", getPlayerUID player, "UIDBanned",  getPlayerUID player] call fn_SaveToServer;
		closeDialog 0;
		disableUserInput true;
		0 fadeSound 0;
		0 fadeRadio 0;
		0 fadeMusic 1;
		playMusic "banned";
		titleText ["YOU HAVE BEEN BANNED","BLACK OUT",0.05];
		sleep 5;
		endMission "LOSER";
	};
};

fn_BannedPlayer =
{
	titleText ["YOU ARE BANNED","BLACK OUT",0.05];
	sleep 2;
	endMission "LOSER";
};

fn_FreezePlayer =
{
	_target = _this select 0;
	server globalChat format ["UID:%1 was frozen",_target];
	if(getPlayerUID player == _target) exitWith
	{
		disableUserInput true;
		player enableSimulation false;
	};
};

fn_UnfreezePlayer =
{
	_target = _this select 0;
	server globalChat format ["UID:%1 was unfrozen",_target];
	if(getPlayerUID player == _target) exitWith
	{
		disableUserInput false;
		player enableSimulation true;
	};
};


adminPunish = 1;