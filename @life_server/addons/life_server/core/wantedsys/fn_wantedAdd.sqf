/*
	File: fn_wantedAdd.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Adds or appends a unit to the wanted list.
*/
private["_uid","_type","_index","_data","_crimes","_val","_customBounty","_name"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;
_type = [_this,2,"",[""]] call BIS_fnc_param;
_customBounty = [_this,3,-1,[0]] call BIS_fnc_param;
if(_uid == "" OR _type == "" OR _name == "") exitWith {}; //Bad data passed.

//What is the crime?
switch(_type) do
{
	case "187V": {_type = ["Mord mit einem Fahrzeug",50000]};
	case "187": {_type = ["Mord",150000]};
	case "901": {_type = ["Gefaengnisausbruch",150000]};
	case "261": {_type = ["Raub",50000]};
	case "261A": {_type = ["versuchter Raub",30000]};
	case "215": {_type = ["Versuchter Diebstahl",20000]};
	case "213": {_type = ["Use of illegal explosives",100000]};
	case "211": {_type = ["Bankraub",100000]};
	case "207": {_type = ["Kidnapping",30500]};
	case "207A": {_type = ["Attempted Kidnapping",2000]};
	case "487": {_type = ["Autodiebstahl",1500]};
	case "488": {_type = ["kleiner-Dieb",7000]};
	case "480": {_type = ["Fahrerflucht",15000]};
	case "481": {_type = ["Drogenschmuckel",200000]};
	case "482": {_type = ["Drogenhandel",150000]};
	case "483": {_type = ["Fahren unter Drogeneinfluss",5000]};
	case "1": {_type = ["Fahren/Fliegen o. Führerschein",5000]}; //name and price
	case "2": {_type = ["Versuchter Diebstahl Fahrzeugs",5000]};
	case "3": {_type = ["Diebstahl Zivilfahrzeugs",10000]};
	case "4": {_type = ["Fahren ohne Licht",5000]};
	case "5": {_type = ["Überhöhte Geschwindigkeit",15000]};
	case "6": {_type = ["Fahren auf der falschen Seite",5000]}; //name and price
	case "7": {_type = ["Versuchter Diebstahl Polizeifahrzeugs",50000]};
	case "8": {_type = ["Diebstahl von Polizeifahrzeugen",75000]};
	case "9": {_type = ["Landen in einer Flugverbotszone",15000]};
	case "10": {_type = ["Fahren von illegalen Fahrzeugen",120000]};
	case "11": {_type = ["Fahrerflucht nach Unfall",30000]}; //name and price
	case "12": {_type = ["Fahrerflucht vor der Polizei",50000]};
	case "13": {_type = ["Überfahren eines anderen Spielers",35000]};
	case "14": {_type = ["Illegale Strassensperren",55000]};
	case "15": {_type = ["Widerstand gegen die Staatsgewalt",65000]};
	case "16": {_type = ["Nicht befolgen e.pol.Anordnung",25000]}; //name and price
	case "17": {_type = ["Beamtenbeleidigung",25000]};
	case "18": {_type = ["Belästigung eines Polizisten",5000]};
	case "19": {_type = ["Betreten der pol.Sperrzone",15000]};
	case "20": {_type = ["Töten eines Polizisten",200000]};
	case "21": {_type = ["Beschuss auf Polizei/Beamte/Eigentum",50000]}; //name and price
	case "22": {_type = ["Zerstörung von Polizeieigentum",50000]};
	case "23": {_type = ["Drogendelikte",10000]};
	case "24": {_type = ["Waffenbesitz ohne Lizenz",15000]};
	case "25": {_type = ["Mit gez.Waffe durch Stadt",12000]};
	case "26": {_type = ["Besitz einer verbotenen Waffe",50000]}; //name and price
	case "27": {_type = ["Schusswaffengebrauch innerhalb Städte",50000]};
	case "28": {_type = ["Geiselnahme",100000]};
	case "29": {_type = ["Überfall auf Personen/Fahrzeuge",15000]};
	case "30": {_type = ["Bankraub",200000]};
	case "31": {_type = ["Mord",250000]}; //name and price
	case "32": {_type = ["Aufstand",50000]};
	case "33": {_type = ["Angriff durch Rebellen",10000]};
	case "34": {_type = ["Angriff/Belagerung von Hauptstädten",15000]};
	case "35": {_type = ["Vers.Landung in einer Flugverbotszone",12000]};
	case "36": {_type = ["Fliegen/Schweben unterhalb 150m ü.Stadt",5000]};
	case "37": {_type = ["Ausbruch aus dem Gefaengnis",150000]};
	case "38": {_type = ["Fliegen ohne Fluglizenz",20000]};
	case "39": {_type = ["Dauerhaft störendes Hupen",25000]};
	default {_type = [];};
};

if(count _type == 0) exitWith {}; //Not our information being passed...
//Is there a custom bounty being sent? Set that as the pricing.
if(_customBounty != -1) then {_type set[1,_customBounty];};
//Search the wanted list to make sure they are not on it.
_index = [_uid,life_wanted_list] call fnc_index;

if(_index != -1) then
{
	_data = life_wanted_list select _index;
	_crimes = _data select 2;
	_crimes set[count _crimes,(_type select 0)];
	_val = _data select 3;
	life_wanted_list set[_index,[_name,_uid,_crimes,(_type select 1) + _val]];
}
	else
{
	life_wanted_list set[count life_wanted_list,[_name,_uid,[(_type select 0)],(_type select 1)]];
};