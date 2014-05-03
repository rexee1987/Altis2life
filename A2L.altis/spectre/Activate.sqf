waituntil {!alive player ; !isnull (finddisplay 46)};
if ((getPlayerUID player) in ["76561198033778245","76561198135217221","76561198123037747","76561198024929748","76561198129286538"]) then {
	sleep 30;
	player addaction [("<t color=""#0074E8"">" + ("Admin Tool") +"</t>"),"spectre\Eexcute.sqf","",5,false,true,"",""];
};