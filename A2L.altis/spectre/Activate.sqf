waituntil {!alive player ; !isnull (finddisplay 46)};
if ((getPlayerUID player) in ["76561198033778245","76561198060294033","76561198123037747","76561198024929748"]) then {
	sleep 30;
	player addaction [("<t color=""#0074E8"">" + ("Admin Tool") +"</t>"),"spectre\Eexcute.sqf","",5,false,true,"",""];
};