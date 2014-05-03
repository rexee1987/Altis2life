/*
	File: welcome.sqf
	Author: Banshee

	Description:
	Creates an intro on the bottom-right hand corner of the screen.
*/

_onScreenTime = 20;

sleep 60; //Wait in seconds before the credits start after player is in-game
 
_role1 = "Willkommen auf";
_role1names = ["Altis2Life!"];
_role2 = "Unser Teamspeak 3";
_role2names = ["78.31.70.230"];
_role3 = "Wichtig";
_role3names = ["Drücke M und lies dir die Regeln aufmerksam durch!"];
_role4 = "SaveZones";
_role4names = ["In der Nähe von SaveZones ist Töten, Ausrauben, Stehlen usw. nicht erlaubt."];
_role5 = "Housing";
_role5names = ["Miete dir ein Haus mit einer 'Homeowner Licence'. Features: Türen ab/aufschliessbar, Inventarsystem"];
_role6 = "Changelog";
_role6names = ["Der Changelog ist hier zu finden: http://forum.altis2life.de"];
_role7 = "Donator Info";
_role7names = ["Donator/Ehrenbürger haben neben dem Donatorshop ein erhötes Einkommen."];
_role8 = "Roleplay";
_role8names = ["Dies ist ein RPG-Server. Willkürlich auf Spieler zu schiessen, RANDOM-DEATHMATCHING, ist nicht erwünscht."];
_role9 = "Viel Spaß";
_role9names = ["wünscht dir das Admin Team: Rexee, Banshee, Heisenberg, Pablo Escobar und Bienelvlaya"];
 
{
sleep 2;
_memberFunction = _x select 0;
_memberNames = _x select 1;
_finalText = format ["<t size='0.45' color='#FF0000' align='right'>%1<br /></t>", _memberFunction];
_finalText = _finalText + "<t size='0.50' color='#FFFFFF' align='right'>";
{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
_finalText = _finalText + "</t>";
_onScreenTime + (((count _memberNames) - 1) * 0.5);
[
_finalText,
[safezoneX + safezoneW - 0.8,0.50], //DEFAULT: 0.5,0.35
[safezoneY + safezoneH - 0.8,0.7], //DEFAULT: 0.8,0.7
_onScreenTime,
0.5
] spawn BIS_fnc_dynamicText;
sleep (_onScreenTime);
} forEach [
//The list below should have exactly the same amount of roles as the list above
[_role1, _role1names],
[_role2, _role2names],
[_role3, _role3names],
[_role4, _role4names],
[_role5, _role5names],
[_role6, _role6names],
[_role7, _role7names],
[_role8, _role8names],
[_role9, _role9names]


];