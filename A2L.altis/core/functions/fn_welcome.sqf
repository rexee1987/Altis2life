#include <macro.h> 
/*
	File: fn_welcome.sqf
	Author: Mario2002
	
	Description:
	Displays introduction on init!
*/

private ["_text","_intro"];

_intro = [];
_text = [];
sleep 2;

switch (playerSide) do
{
	case west: 
	{
        _text = [
			format ["<t align='left'>Wenn das dein erster Besuch auf unserem Server ist, bitten wir dich, die Regeln genauestens durchzulesen. Dies kannst du auf der Homepage http://bruuudis.enjin.com tun oder alternativ auf der Karte indem du <t color='#FF8000'>M</t> drueckst.</t>"],
			format ["<t align='left'>Solltest du dich nun fragen welcher Rohstoff dir am schnellsten und meisten Geld bringt, begebe dich zu deinem lokalen Broker. Dieser hat für eine kleine Spende immer die aktuellsten Informationen zu den Rohstoffpreisen für dich, da wir in einer dynamischen Wirtschaft leben werden die Preise sich auch immer ändern im Verhältniss zu der Menge an Rohstoffen die gerade verfügbar sind.</t>"],
			format ["<t align='left'>Desyncs: Die meisten desyncs sind durch die Clients bedingt, bei einer Framerate unter 30 FPS ist der Armaclient überlastet und hat Probleme die Netzwerkkommunikation zu verwalten.</t>"],
			format ["<t align='left'>Die Admins wünschen dir viel Spaß auf diesem Server.</t>"],
			format ["<t align='left' color='#428BCA'>TS3 : ts56.nitrado.net:16150</t>"],
			format ["<t align='left' color='#428BCA'>Homepage : http://bruuudis.enjin.com/</t>"]
		];
	};
	case civilian:
	{
        _text = [
			format ["<t align='left'>Wenn das dein erster Besuch auf unserem Server ist, bitten wir dich, die Regeln genauestens durchzulesen. Dies kannst du auf der Homepage http://bruuudis.enjin.com tun oder alternativ auf der Karte indem du <t color='#FF8000'>M</t> drueckst.</t>"],
			format ["<t align='left'>Solltest du dich nun fragen welcher Rohstoff dir am schnellsten und meisten Geld bringt, begebe dich zu deinem lokalen Broker. Dieser hat für eine kleine Spende immer die aktuellsten Informationen zu den Rohstoffpreisen für dich, da wir in einer dynamischen Wirtschaft leben werden die Preise sich auch immer ändern im Verhältniss zu der Menge an Rohstoffen die gerade verfügbar sind.</t>"],
			format ["<t align='left'>Desyncs: Die meisten desyncs sind durch die Clients bedingt, bei einer Framerate unter 30 FPS ist der Armaclient überlastet und hat Probleme die Netzwerkkommunikation zu verwalten.</t>"],
			format ["<t align='left'>Die Admins wünschen dir viel Spaß auf diesem Server.</t>"],
			format ["<t align='left' color='#428BCA'>TS3 : ts56.nitrado.net:16150</t>"],
			format ["<t align='left' color='#428BCA'>Homepage : http://bruuudis.enjin.com/</t>"]
		];
	};
};

{
	_intro set [count _intro, (parseText _x)];
} forEach _text;
        
format ["Hallo %1", name player] hintC _intro;
playSound "s_welcome";
