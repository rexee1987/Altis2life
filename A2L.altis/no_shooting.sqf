/*
    Safezonescript for ArmA 3 Alpha by Banshee
    **ALTIS2LIFE.de**
    DESCRIPTION:
    Stops players from throwing grenades and shoot in safezones.
    Dieses Script soll dabei helfen Noobspawns zu schützen.
*/
private ["_inArea","_pos","_unit","_zone1","_dis"];
_unit = _this select 0;

_zone1 = getMarkerPos "Safezone1"; 						// Markernamen für die Gebiete die ihr Schützen möchtet
_dis = 600;                             				// distance 


#define MESSAGE "Safezone! Schusswaffengebrauch sowie jegliche kriminelle Handlung untersagt!"


if (_zone1 distance _unit > _dis) then {        //Check ob der Player in der Zone Spawnt
   _inArea = false;
}
else{
   _inArea = true;
};

while {true} do {

   if ((_zone1 distance _unit < _dis) && (!_inArea)) then {      //Check beim Eintritt
	
	_inArea = true;
	  _unit allowDamage false;
	  titleText [MESSAGE, "PLAIN", 3];
   }
   else{
   _inArea = false;                                //Check beim Austritt
   _unit allowDamage true;
   };
sleep 5;
};
