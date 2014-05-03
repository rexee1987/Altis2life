_pathtotools = "spectre\tools\";
_EXECscript1 = 'player execVM "'+_pathtotools+'%1"';;
//customise these menus to fit your server
if ((getPlayerUID player) in ["76561198033778245","76561198135217221","76561198123037747","76561198024929748","76561198129286538"]) then { //all admins
	if ((getPlayerUID player) in ["76561198033778245","76561198135217221","76561198123037747","76561198024929748","76561198129286538"]) then { //mods
        adminmenu =
        [
			["",true],
				["Tools Menu", [2], "#USER:ModToolsMenu", -5, [["expression", ""]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]	
        ];};
	if ((getPlayerUID player) in ["76561198033778245","76561198135217221","76561198123037747","76561198024929748","76561198129286538"]) then { //admins
        adminmenu =
        [
			["",true],
				["Tools Menu", [2], "#USER:AdminToolsMenu", -5, [["expression", ""]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]	
        ];};
	if ((getPlayerUID player) in ["76561198033778245","76561198135217221","76561198123037747","76561198024929748","76561198129286538"]) then { // super admins
		adminmenu =
		[
			["",true],
				["Tools Menu", [2], "#USER:ToolsMenu", -5, [["expression", ""]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]		
		];};
};
//customise to fit
ModToolsMenu =
[
	["",true],
		["Spectate Player", [1],  "", -5, [["expression", format[_EXECscript1,"spectate.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
//customise to fit
AdminToolsMenu =
[
	["",true],
		//["God Mode", [2],  "", -5, [["expression", format[_EXECscript1,"Godmode.sqf"]]], "1", "1"],
		//["Car God", [3],  "", -5, [["expression", format[_EXECscript1,"cargod.sqf"]]], "1", "1"],
		["Spieler beobachten", [4],  "", -5, [["expression", format[_EXECscript1,"spectate.sqf"]]], "1", "1"],
		["Spieler zu mir holen", [5], "", -5, [["expression", format[_EXECscript1, "TPtoME.sqf"]]], "1", "1"],
		["Spieler GPS", [6], "", -5, [["expression", format[_EXECscript1, "ESP.sqf"]]], "1", "1"],
		["Teleportieren", [7], "", -5, [["expression", format[_EXECscript1, "Tele.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
ToolsMenu =
[
	["",true],
		//["God Mode", [2],  "", -5, [["expression", format[_EXECscript1,"Godmode.sqf"]]], "1", "1"],
		//["Car God", [3],  "", -5, [["expression", format[_EXECscript1,"cargod.sqf"]]], "1", "1"],
		["Spieler beobachten", [4],  "", -5, [["expression", format[_EXECscript1,"spectate.sqf"]]], "1", "1"],
		["Spieler zu mir holen", [5], "", -5, [["expression", format[_EXECscript1, "TPtoME.sqf"]]], "1", "1"],
		["Spieler GPS", [6], "", -5, [["expression", format[_EXECscript1, "ESP.sqf"]]], "1", "1"],
		["Teleportieren", [7], "", -5, [["expression", format[_EXECscript1, "Tele.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
showCommandingMenu "#USER:adminmenu";