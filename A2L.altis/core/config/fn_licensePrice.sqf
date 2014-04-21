/*
	File: fn_licensePrice.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Returns the license price.
*/
private["_type"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
if(_type == "") exitWith {-1};

switch (_type) do
{
	case "driver": {4500}; //Drivers License cost
	case "boat": {30000}; //Boating license cost
	case "pilot": {300000}; //Pilot/air license cost
	case "gun": {20000}; //Firearm/gun license cost
	case "dive": {80000}; //Diving license cost
	case "oil": {65000}; //Oil processing license cost
	case "cair": {25000}; //Cop Pilot License cost
	case "swat": {35000}; //Swat License cost
	case "cg": {25000}; //Coast guard license cost
	case "heroin": {120000}; //Heroin processing license cost
	case "marijuana": {95000}; //Marijuana processing license cost
	case "medmarijuana": {35000}; //Medical Marijuana processing license cost
	case "gang": {5000}; //Gang license cost
	case "rebel": {175000}; //Rebel license cost STC
	case "truck": {70000}; //Truck license cost
	case "diamond": {75000};
	case "salt": {15000};
	case "cocaine": {100000};
	case "sand": {7000};
	case "iron": {30000};
	case "copper": {25000};
	case "cement": {9000};
};