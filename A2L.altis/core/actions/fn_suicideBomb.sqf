/*
	ALAH SNACKBAR!
*/
private["_test"];

[[player,"alahsnackbar"],"life_fnc_say3D",nil,false] spawn BIS_fnc_MP; sleep 1; //Sound

if(vest player != "V_HarnessOGL_brn") exitWith {};
_test = "Bo_Mk82" createVehicle [0,0,9999];
_test setPos (getPos player);
_test setVelocity [100,0,0];

if(alive player) then {player setDamage 1;};

[[0,format["%1 hat sich vom Leben beurlaubt.",name player]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;