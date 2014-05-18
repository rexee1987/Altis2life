enableSaving [false, false];

X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;

//Initializes variables
_v = execVM "initialization\variables.sqf";
waitUntil {scriptDone _v};

if(!isDedicated) then { X_Client = true;};
/*
if(isNull player) then 
{
	if(!X_JIP && !isServer) then
	{
		[] spawn (compile PreprocessFileLineNumbers "core\jip.sqf");
	};
	X_JIP = true;
};
*/
enableSaving[false,false];

life_versionInfo = "Altis Life RPG v3.1.2";
/*
if(X_Client) then
{
	[] execVM "core\init.sqf";
};
*/
[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";
[] execVM "antihack\hackerSpanker.sqf";
[] execVM "antihack\hackerSpanker2.sqf";
[] execVM "spectre\Activate.sqf";
[] execVM "addons\fastrob\zlt_fastrope.sqf";
[] execVM "teargas.sqf";
[] execVM "safezone.sqf";
//[] execVM "addons\IgiLoad\IgiLoad.sqf";



if(!StartProgress) then
{
	[8,true,false] execFSM "core\fsm\core_time.fsm";
};
StartProgress = true;
StartProgress = true;
onPlayerDisconnected { [_id, _name, _uid] call compile preProcessFileLineNumbers "core\functions\fn_onPlayerDisconnect.sqf" };
