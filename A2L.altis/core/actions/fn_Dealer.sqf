//Drug dealers only appear at night and are randomly placed at one of their pre-defined locations.
fn_Dealer =
{
	_dealer = _this select 0;
	_locations = _this select 1;
	_marker = _this select 2;
	[_dealer,_locations,_marker] spawn
	{
		_dealer = _this select 0;
		_locations = _this select 1;
		_marker = _this select 2;
		if(sunOrMoon == 1) then
		{
			_marker setMarkerAlpha 0;
			_dealer setPos (position DealerAwayLogic);
		};
		
		while {true} do
		{
			waitUntil {sunOrMoon == 0};
			_marker setMarkerAlpha 1;
			_random = _locations select (round(random((count(_locations))-1)));
			_dealer setPos (position _random);
			_dealer setDir (direction _random);
			_marker setMarkerPos [(position _random) select 0, (position _random) select 1];
			waitUntil {sunOrMoon == 1};
			_marker setMarkerAlpha 0;
			_dealer setPos (position DealerAwayLogic);
		};
	};
};

//========================================

_Dealer_1Locations =
[
	Dealer_1Logic1,
	Dealer_1Logic2,
	Dealer_1Logic3,
	Dealer_1Logic4,
	Dealer_1Logic5,
	Dealer_1Logic6,
	Dealer_1Logic7,
	Dealer_1Logic8
];

[Dealer_1,_Dealer_1Locations,"Dealer_1Marker"] call fn_Dealer;