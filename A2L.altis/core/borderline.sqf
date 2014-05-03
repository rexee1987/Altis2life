/* 
-------------------------------------------------------
| Blackpython's Insta-Wall Script - Version 1.0  
| Arma 3 Edit for Objects and Positioning - n0x	
-------------------------------------------------------

Call Line: _bp = [_mkrArray,_wallType] execVM "instaWall.sqf";
Script is to be called at start of mission. Preferably in the init.sqf

##############################################

Arguments:
_mkrArray = Array of Markers you wish to have walls applied to them.
_wallType = Type of Wall you wish to use, either 1, 2, or 3.
Wall Type 1 = Big Bag Fence
Wall Type 2 = HESCO Barrier
Wall Type 3 = Tall Concrete Wall

Example: _bp = [["mkr1","mkr2","mkr3"], 1] execVM "instaWall.sqf";

##############################################

*/

private ["_mkrArray","_wallType","_wallComplete","_wallClass", "_wallTypeDistance"];
_mkrArray = _this select 0;
_wallType = _this select 1;
_wallComplete = _this select 2;
_wallTypeDistance = 0;
switch (_wallType) do
{
    case 1:
    {
        _wallClass = "Land_HBarrierBig_F";
		_wallTypeDistance = 8.2;
    };
    case 2:
    {
        _wallClass = "Land_Razorwire_F";
		_wallTypeDistance = 8.2;
    };
    case 3: 
    {
        _wallClass = "Land_Mil_WiredFence_F";
		_wallTypeDistance = 7.8;
    };
	case 4:
    {
        _wallClass = "Land_Mil_WallBig_4m_F";
		_wallTypeDistance = 4.1;
    };
    case default
    {
        _wallClass = "Land_New_WiredFence_10m_F";
		_wallTypeDistance = 10;
    };
};

{_x setMarkerAlpha 0;} forEach _mkrArray;

{
    private ["_xVar","_yVar","_xPos","_yPos","_rad","_theta","_distX1","_distX2","_distY1","_distY2","_xCor1","_yCor1","_xCor2","_yCor2","_xCor3","_yCor3","_xNew1","_yNew1","_xNew2","_yNew2","_xNew3","_yNew3"];
    _distX1 = 0;
    _distX2 = 0;
    _distY1 = 0;
    _distY2 = 0;
    _xVar = getMarkerSize _x select 0;
    _yVar = getMarkerSize _x select 1;
    _theta = markerDir _x;
    _xPos = getMarkerPos _x select 0;
    _yPos = getMarkerPos _x select 1;
    _rad = sqrt((_xvar^2) + (_yVar^2));
    _xCor1 = _rad * sin ( 180 + _theta + (atan((_xVar) / (_yVar))));
    _yCor1 = _rad * cos ( 180 + _theta + (atan((_xVar) / (_yVar))));
    _xCor2 = _rad * sin ( 90 + _theta + (atan((_yVar) / (_xVar))));
    _yCor2 = _rad * cos ( 90 + _theta + (atan((_yVar) / (_xVar))));
    _xCor3 = _rad * sin ( 270 + _theta + (atan((_yVar) / (_xVar))));
    _yCor3 = _rad * cos ( 270 + _theta + (atan((_yVar) / (_xVar))));
    _xNew1 = _xCor1 + _xPos;
    _yNew1 = _yCor1 + _yPos;
    _xNew2 = _xCor2 + _xPos;
    _yNew2 = _yCor2 + _yPos;
    _xNew3 = _xCor3 + _xPos;
    _yNew3 = _yCor3 + _yPos;
	_count = 0;
	
    while {_distX1 <= ( 2 * _xvar + .1)} do
    {
        private "_Lthis";
        _Lthis = _wallClass createVehicle [0,0];
        _Lthis setPos [(_xNew1) + (_distX1 * sin(90 + _theta)) , (_yNew1) + (_distX1 * cos(90 + _theta))];
        _Lthis setDir _theta;
		_Lthis allowDamage false;
        _distX1 = _distX1 + _wallTypeDistance;
		_count = _count + 1;
    };
	hint Format["Es wurden %1 platziert", _count];
	if(_wallComplete == 1) then
	{
		while {_distY1 <= ( 2 * _yvar + .1)} do
		{
			private "_Lthis";
			_Lthis = _wallClass createVehicle [0,0];
			_Lthis setPos [(_xNew1 ) + (_distY1 * cos(90 - _theta)),(_yNew1) + (_distY1 * sin(90 - _theta))];
			_Lthis setDir (_theta - 90);
			_Lthis allowDamage false;
			_distY1 = _distY1 + _wallTypeDistance;
		};
		while {_distX2 <= ( 2 * _xvar + .5)} do
		{
			private "_Lthis";
		   if (_distX2 != (_xVar )) then 
			{
				_Lthis = _wallClass createVehicle [0,0];
				_Lthis setPos [_xNew3 + (_distX2 * sin(90 + _theta)),_yNew3 + (_distX2 * cos(90 + _theta))];
				_Lthis setDir _theta;
				_Lthis allowDamage false;
				_distX2 = _distX2 + _wallTypeDistance;
			} else {_distX2 = _distX2 + 10};
		};
		
		while {_distY2 <= ( 2 *_yvar + .5)} do
		{
				private "_Lthis";
				_Lthis = _wallClass createVehicle [0,0];
				_Lthis setPos [_xNew2 + (_distY2 * cos(90 - _theta)),_yNew2 + (_distY2 * sin(90 - _theta))];
				_Lthis setDir (_theta - 90);
				_Lthis allowDamage false;
				_distY2 = _distY2 + _wallTypeDistance;	
		};
	} else {};
} forEach _mkrArray;