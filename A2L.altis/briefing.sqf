waitUntil {!isNull player && player == player};
if(player diarySubjectExists "rules")exitwith{};

player createDiarySubject ["ARG","ARG"];
player createDiarySubject ["safezones","Safe Zones (No Killing)"];
//player createDiarySubject ["civrules","Civilian Rules"];
//player createDiarySubject ["gangrules","Gang Rules"];
//player createDiarySubject ["terrorrules","Terrorism Rules"];
player createDiarySubject ["controls","Controls"];
player createDiarySubject ["sonstiges","Sonstiges"];

/*  Example
	player createDiaryRecord ["", //Container
		[
			"", //Subsection
				"
				TEXT HERE<br/><br/>
				"
		]
	];
*/
	
	player createDiaryRecord ["safe Zones",
		[
			"Safe Zones",
				"
					Das absichtliche Sprengen von Fahrzeugen, Raub oder das Toeten anderer Spieler in oder um die folgenden Gebiete wird mit einem Bann bestraft.<br/>
					Jede Stadt in der man spawnt ist nun safezone, dassselbe bezieht sich auf das Rebellen HQ <br/><br/>
			"
		]
	];
	
// Seal Team Sloth Section

	player createDiaryRecord ["ARG",
		[
			"Teamspeak",
				"
				ARG Teamspeak findest du unter:<br/>
				78.31.70.230:9987<br/><br/>	
				
			"
		]
	];

// Controls Section

	player createDiaryRecord ["controls",
		[
			"Controls",
				"
				Z: Spieler-Menü Öffnen<br/>
				U: Schließen und Öffnen von Fahrzeuge<br/>
				F: Polzei Sirene ( COP )<br/>
				Shift+L: Blaulicht ( COP ) <br />
				T: Fahrzeug Kofferram<br/>
			"
		]
	];
	
//  Sonstiges
	player createDiaryRecord ["sonstiges", //Container
		[
			"Regeln", //Subsection
				"
				Aktuelle Regeln entnehmt bitte aus dem Forum<br/><br/>
				"
		]
	];
