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
	case "boat": {4600}; //Boating license cost
	case "pilot": {350000}; //Pilot/air license cost
	case "gun": {100000}; //Firearm/gun license cost
	case "dive": {49000}; //Diving license cost
	case "oil": {65000}; //Oil processing license cost
	case "cair": {65000}; //Cop Pilot License cost
	case "swat": {35000}; //Swat License cost
	case "cg": {35000}; //Coast guard license cost
	case "heroin": {85000}; //Heroin processing license cost
	case "marijuana": {95000}; //Marijuana processing license cost
	case "medmarijuana": {35000}; //Medical Marijuana processing license cost
	case "gang": {25000}; //Gang license cost
	case "rebel": {175000}; //Rebel license cost STC
	case "truck": {30000}; //Truck license cost
	case "diamond": {75000};
	case "salt": {12000};
	case "cocaine": {45000};
	case "sand": {14500};
	case "iron": {25000};
	case "copper": {5000};
	case "cement": {16000};
};