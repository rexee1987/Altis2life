/*
	File: fn_zoneCreator.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Creates triggers around the map to add the addAction for specific
	fields such as apples, cocaine, heroin, etc. This method is to reduce
	CPU load.
	
	Note: 
	Triggers are NOT my preferred method so this is considered temporary until a more suitable
	option is presented.
*/
private["_appleZones","_peachZones","_heroinZones","_cocaineZones","_weedZones","_frogZones","_hopfen","_birne","_banane","_wolle","_mais","_kiwi","_atomreste","_organe"];
_appleZones = ["apple_1","apple_2","apple_3","apple_4"];
_peachZones = ["peaches_1","peaches_2","peaches_3","peaches_4","peaches_5","peaches_6","peaches_2_3","peaches_8","peaches_2_1"];
_heroinZones = ["heroin_1"];
_cocaineZones = ["cocaine_1"];
_weedZones = ["weed_1"];
_hopfen = ["hopfen"];
_birne = ["birne_1","birne_2","birne_3","birne_4","birne_5","birne_6"];//"birne" ist der Markler Name
_banane = ["ba_1"];
_wolle = ["wo_1"];
_mais = ["ma_1"];
_kiwi = ["ki_1"];
_atomreste = ["ato_1"];
_organe = ["org_1"];


//Create apple zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[25,25,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Apples = player addAction['Apfel nehmen',life_fnc_gatherApples,'',0,false,false,'','!life_action_inUse'];","player removeAction LIFE_Action_Apples;"];
} foreach _appleZones;

//Create peach zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[25,25,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Peaches = player addAction['Pfirsich nehmen',life_fnc_gatherPeaches,'',0,false,false,'','!life_action_inUse'];","player removeAction LIFE_Action_Peaches;"];
} foreach _peachZones;

//Create heroin zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[50,50,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_heroin = player addAction['Heroin nehmen',life_fnc_gatherHeroin,'',0,false,false,'','!life_action_inUse'];","player removeAction LIFE_Action_Heroin;"];
} foreach _heroinZones;

//Create Weed zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[50,50,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Cannabis = player addAction['Cannabis nehmen',life_fnc_gatherCannabis,'',0,false,false,'','!life_action_inUse'];","player removeAction LIFE_Action_Cannabis;"];
} foreach _weedZones;

//Create cocaine zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[50,50,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Coke = player addAction['Kokaine nehmen',life_fnc_gatherCocaine,'',0,false,false,'','!life_action_inUse'];","player removeAction LIFE_Action_Coke;"];
} foreach _cocaineZones;

// Hopfenzone
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[50,50,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Hopfen = player addAction['Hopfen ernten',life_fnc_gatherHopfen,'',0,false,false,'','!life_action_inUse'];","player removeAction LIFE_Action_Hopfen;"];
} foreach _hopfen;

// Birnezone
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[50,50,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Birne = player addAction['Birne sammeln',life_fnc_gatherBirne,'',0,false,false,'','!life_action_inUse'];","player removeAction LIFE_Action_Birne;"];
} foreach _birne;

// Bananen
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[50,50,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Banane = player addAction['Banane sammeln',life_fnc_gatherBanane,'',0,false,false,'','!life_action_inUse'];","player removeAction LIFE_Action_Banane;"];
} foreach _banane;

// Wolle
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[50,50,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Wolle = player addAction['Wolle sammeln',life_fnc_gatherWolle,'',0,false,false,'','!life_action_inUse'];","player removeAction LIFE_Action_Wolle;"];
} foreach _wolle;

// Mais
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[50,50,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Mais = player addAction['Mais sammeln',life_fnc_gatherMais,'',0,false,false,'','!life_action_inUse'];","player removeAction LIFE_Action_Mais;"];
} foreach _mais;

// Kiwi
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[50,50,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Kiwi = player addAction['Kiwi sammeln',life_fnc_gatherKiwi,'',0,false,false,'','!life_action_inUse'];","player removeAction LIFE_Action_Kiwi;"];
} foreach _kiwi;

// Aromreste
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[50,50,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Atomreste = player addAction['Untersuche Felsen',life_fnc_gatherAtomreste,'',0,false,false,'','!life_action_inUse'];","player removeAction LIFE_Action_Atomreste;"];
} foreach _atomreste;

// Organe
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[50,50,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Organe = player addAction['Entferne Organe',life_fnc_gatherOrgane,'',0,false,false,'','!life_action_inUse'];","player removeAction LIFE_Action_Organe;"];
} foreach _organe;