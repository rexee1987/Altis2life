fn_Teleport =
{
	if(isAdmin != 1) exitWith {};
	hintSilent "Click on the map to teleport";
	openMap true;
	onMapSingleClick "vehicle player setPos _pos; onMapSingleClick ''; openMap false; true;";
};