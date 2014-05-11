﻿waitUntil {!isNull player && player == player};
if(player diarySubjectExists "rules")exitwith{};

player createDiarySubject ["alh","Altis2life"];
player createDiarySubject ["whe","WhiteHonorElite"];
player createDiarySubject ["changelog","Change Log"];
player createDiarySubject ["rhkatalog","Rohstoffkatalog"];
player createDiarySubject ["serverrules","Grundregeln"];
player createDiarySubject ["policerules","Verhaltensregel"];
player createDiarySubject ["safezones","Safe-Zones"];
player createDiarySubject ["mil","Militär"];
player createDiarySubject ["illegalitems","Illegale Aktivitäten"];
player createDiarySubject ["controls","Controls"];


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
	player createDiaryRecord["changelog",
		[
			"Changelog",
				"
					Ihr findet den offiziellen Changelog auf unserer Homepage.
				"
		]
	];
	

	player createDiaryRecord["alh",
		[
			"Aktuelle Version",
				"
					Altis2life v3.0.1.1 (11.05.2014)
				"
		]
	];
	
		player createDiaryRecord ["mil",
		[
			"Das Militaer", 
				"
				Das Militaer besteht aus Mitgliedern der Community, welche sich daran beteiligen den Server und Co zu verwalten.<br/>
				Ein einfaches Beitreten ist somit nicht Moeglich!<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["mil",
		[
			"Regelwerke des Miltaer", 
				"
				1.) Das Militaer fuehrt Straßenkontrollen wie die Polizei <br/>
				2.) Das Militaer ist weisungsbefugt, insofern Notstand ausgerufen wurde oder<br/>
				3.) Die Polizei das Militaer anfordert<br/><br/>
				"
		]
	];
	
		player createDiaryRecord ["mil",
		[
			"Ansprechpartner", 
				"
				1.) General: rexee87 ( A2L ) <br/>
				2.) Generalmajor: Banshee ( A2L )<br/>
				3.) 1ndGeneralleutnant: Pabelo_Escobar ( A2L ) <br/>
				4.) Brigadegeneral: Bienelvlaya ( A2L )<br/><br/>
				"
		]
	];

		player createDiaryRecord ["serverrules",
		[
			"Ausnutzung", 
				"
				Die folgenden Verstöße werden mit einem Bann bestraft.<br/><br/>

				1. Aus dem Gefängnis zu entkommen ohne Helikopter oder die Kaution zu bezahlen.<br/>
				2. Es ist nicht erlaubt Selbstmord zu begehen um sich aus einer missligen Lage zu entkommen. Off-Flucht führt direkt zum Bann.<br/>
				3. Duplizieren von Geld oder Items.<br/>
				4. Das benutzen von Waffe die jemand gecheatet hat ist verboten auch wenn diese normal im Spiel gekauft werden können.<br/>
				5. Bugs oder Fehler in der Spielmechanik ausnutzen. Hast du eine gebuggt/gecheatet Waffe gefunden sag es einem Admin und benutze sie nicht. Missachtung führt zu einem Bann.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord["safezones",
		[
			"Safe Zones",
				"
					In diesen Gebieten ist es nicht erlaubt jemanden zu töten oder zu überfallen.<br/><br/>
					
					Alle Bankautomaten <br/>
					Polizei HQ´s<br/>
					Kavala<br/>
					Spender Shop <br/><br/>
				"
		]
	];
					
	
	player createDiaryRecord ["serverrules",
		[
			"Sofortige Banngründe", 
				"
				Die folgenden Verstöße führen zu einem direkten Bann.<br/><br/>
				
				1. Hacking<br/>
				2. Cheating<br/>
				3. Bugusing<br/>
				4. Drei Verwarnungen.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Umgang mit Cop", 
				"
				Folgendes solltet ihr beachten wenn ihr es mit einem Cop zutun habt.<br/><br/>
				
				1. Wenn du in den Rucksack eines Polizisten schaust kannst du dafür verhaftet werden.<br/>
				2. Wenn du einen Cop verfolgst kannst du dafür verhaftet werden da du evtl seine Position weitergibst.<br/>
				3. Zivilisten oder Rebellen die ohne Grund Polizisten töten werden gebannt. (Siehe RDM)<br/>
				4. Wenn ihr extra Cops ärgert oder sie zuspammt werdet ihr vom Server gekickt.<br/>
				5. Cops stören und evtl. blocken oder ähnliches ist ebenso strafbar. <br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Boote", 
				"
				Folgende Vergehen können zu einem Kick/Ban führen.<br/><br/>
				
				1. Wiederholtes pushen eines Bootes ohne die Erlaubnis<br/>
				2. Pushen eines Bootes mit der Absicht jemanden zu verletzen. Das ist KEIN RP, sondern eine Lücke in der Spielmechanik.<br/>
				3. Überfahren schwimmender Personen.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Luftfahrt", 
				"
				Folgende Vergehen können zu einem Kick/Ban führen<br/><br/>
				
				1. Beabsichtigtes fliegen in Objekte, andere Helikopter, Fahrzeuge oder Gebäude.<br/>
				2. Das fliegen über Polizeilich und Staatlichen Sicherheitsbereichen ist verboten. Vorsicht Schusswaffengebrauch!<br/>
				3. Konstantes fliegen unter 150 Meter über einer Stadt. Sobald die Flugzone über einer Stadt zur Flugverbotszone erklärt wird, dann zum Eigenen Schutz und zum Schutz der Bewohner. Zuwiederhandeln ist Strafbar und wird bestraft.<br/>
				4. Stehlen eines Helikopters durch direktes einsteigen nach der Landung ohne dem Piloten die Zeit zu lassen diesen abzuschließen. Wenn ein Pilot landet und wegrennt ohne abzuschließen, gut, wenn sie landen und Du direkt einsteigst ist das ein klares Nope.<br/>
				5. weitere Regeln zur Luftfahrt siehe Flugdienstvorschrift<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Fahrezeuge", 
				"
				Folgende Vergehen können zu einem Kick/Ban führen<br/><br/>
				
				1. Beabsichtigtes Überfahren eines Spielers (VRDM). Wenn durch Unachtsamkeit ein Spieler überfahren wird, wird dieses als Unfall gewertet. Darauf folgende Entscheidungen werden von der Polizei getroffen.<br/>
				2. Sich vor ein Fahrzeug zu schmeißen um verletzt oder getötet zu werden ist Verboten.<br/>
				3. Das rammen anderer Fahrzeuge um eine Explosion zu verursachen ist Verboten<br/>
				4. Wiederholtes versuchen in ein Fahrzeug zu steigen während der Besitzer ein-/aussteigt ist Verboten ohne dabei in einem RP-Geschehen zu sein.<br/>
				5. Das stehlen eines Fahrzeuges mit der Absicht dieses zu beschädigen oder zu Zerstören. Das ist kein RP.<br/>
				6. Das kaufen mehrerer Fahrzeuge um einen der oben aufgelisteten Dinge zu tun.<br/>
				7. Der einzige Grund auf ein Fahrzeug zu schiessen, wäre dieses Fahruntüchtig zu machen und/oder in einem RP Warnschüsse abzugeben. Grundlos Fahrzeuge zu Beschädigen oder zu Zerstören ist kein RP.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Sprachregeln", 
				"
				Folgende Vergehen können zu einem Kick/Ban führen<br/><br/>
				
				1. Der Side Channel ist nur für den Schriftverkehr erlaubt. Es ist verboten zu reden oder Musik abzuspielen.<br/>
				2. Zuspammen eines beliebigen Channels ist nicht erlaubt.<br/>
				4. Teamspeak Channel sind begründet aufgeteilt. Polizisten haben zu jeder Zeit auf dem Teamspeak zu sein.<br/>
				5. Civs (Zivilisten) ist es nicht gestattet in einem Polizei Channel auf Teamspeak zu sein. Civs die dabei erwischt werden, werden umgehend entfernt. Bei wiederholtem joinen wird man vom Spiel und vom Teamspeak gekickt oder gebannt.<br/><br/>
				"
		]
	];
	
	
	player createDiaryRecord ["serverrules",
		[
			"Random Deathmatching (RDM)", 
				"
				Folgende Vergehen können zu einem Kick/Ban führen.<br/><br/>
				
				1. Töten eines Spielers ohne RP.<br/>
				2. Eine Rebbelion/Wiederstand zu gründen und zu erklären ist keine Erlaubnis einfach wahllos zu töten, auch keine Polizisten. <br/>
				3. Polizisten und Civs/Rebellen können nur eine Schießerei beginnen, wenn diese auch als RP geschieht.<br/>
				4. Wenn Du im Kreuzfeuer einer Schießerei stirbst ist es kein RDM. Deckung ist hilfreicher als nahe betrachtung des Geschehens.<br/>
				5. Töten um sich selbst oder andere zu schützen ist kein RDM.<br/>
				6. Erschießen eines Spielers der Anweisungen folgen soll ohne ihm die dafür nötige Zeit zu lassen ist kein RP und wird als RDM gewertet.<br/>
			    7. Auf Bandit Island, kann die Polizei nicht eingreifen und ist das töten von anderen Spieler erlaubt.<br/><br/>
				
				Diese Entscheidungen wurden aufgrund der Erfahrung von den Administratoren getroffen.<br/><br/>
				"
		]
	];
	player createDiaryRecord ["serverrules",
		[
			"New Life Rule", 
				"
				Die New Life Rule gilt für die Polizei und für Zivilisten!<br/><br/>
				
				Folgende Vergehen können zu einem Kick/Ban führen.<br/><br/>

				1. Wenn du getötet wurdest musst du 10 Minuten warten bevor du zu deinem alten Geschehen/Einsatz zurückkehren darfst!<br/>
				2. Wenn du während des Roleplays stirbst, sind deine Verbrechen vergessen.<br/>
				3. Wenn du durch RDM stirbst ist es kein New Life.<br/>
				4. Wenn du manuell auf Respawn klickst ist es kein New Life. Es ist dennoch verboten sich aus einer Gefährlichen Situation raus zu spawnen<br/>
				5. Wenn du dich umbringst um dich einem RP zu entziehen gilt die New Life Rule nicht. Sei kein Spielverderber!<br/>
				6. Nachdem man getötet wurde ist Rache verboten!<br/><br/>
				"
		]
	];

	player createDiaryRecord ["serverrules",
		[
			"Sei kein Idiot!", 
				"
				Wenn ein Admin dir sagt das du dich wie ein Idiot verhälst, dann wirst du wohl auch einer sein.<br/>
			        Dinge aus einem Fremden Inventar klauen, Roleplay's behindern oder kaputt machen, usw.....<br/>
				Sei einfach kein Idiot, okay?<br/>
				Diese Regel kann nach ermessen eines Admins angewandt werden.<br/><br/>
				"
		]
	];
	
// WhiteHonorElite

	player createDiaryRecord ["whe",
		[
			"Teamspeak",
				"
				Unser Teamspeakserver:<br/><br/>
				78.31.70.230 <br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["whe",
		[
			"Website/Forum",
				"
				http://www.altis2life.de ( in Arbeit )<br/>
				http://forum.altis2life.de ( aktiv ) <br/>
				http://wiki.altis2life.de ( aktiv ) <br/><br/>
				"
		]
	];
	
	
	player createDiaryRecord ["whe",
		[
			"Spenden",
				"
				Gerne koennt ihr den Server mit euren Spenden Unterstuetzen.<br/><br/>
				Dazu geht ihr auf unsere Hompage unter Spenden.<br/><br/>
				Oder ihr tretet dem Team bei und meistert Communityaufgaben.<br/><br/>
				"
		]
	];
		
	
// Police Section
	player createDiaryRecord ["policerules",
		[
			"Kriesen Verhandlung und Sprachmittlung",
				"
				Verhandlungen müssen von einem Sergeant abgehalten werden. Wenn keiner Verfügbar ist muss der Polizist vor Ort mit dem höchsten Dienstgrad die Situation übernehmen.<br/><br/>
				"
		]
	];
	player createDiaryRecord ["policerules",
		[
			"Die Behörden und Polizeiliche Sicherheitsbereiche",
				"
				1. Die Polizei HQs sind Sicherheitsbereiche und es ist CIV's verboten diese zu betreten, außer diese wurden von einem Lieutenant oder höhre authorisiert.Wenn ein CIV den Sicherheitsbereich ohne authorisation betritt, gillt es diesen zu bitten den Bereich zu verlassen. Andernfalls den CIV fesseln und aus dem Sicherheitsbereich heraus eskortieren.<br/>
				2. Helikopter die über Sicherheitsbereichen fliegen sind umgehend per Warnung aus dem Bereich zu entfernen. Bei zuwiederhandlung darf ein Warnschuss abgegeben werden. Bei Fortsetzung der Bereichsverletzung darf der Helikopter durch Schussabgabe beschädigt jedoch nicht zerstört werden!<br/>
				2. Wenn die Altis Zentralbank ausgeraubt wird, müssen umgehend alle Verfügbaren Einheiten ausrücken um die Bankräuber aufzuhalten und festzunehmen. Stationierte Polizisten die Beispielsweise in Kavala am Marktplatz stationiert sind dürfen nur auf Anweisung des Gruppenführers bzw des Leitenden Polizisten ausrücken.<br/>
				3. Die Untersuchung von Bagatellverbrechen sind während eines Bankraubes fallen zu lassen um dem Bankraub nachzugehen. Danach kann die bearbeitung des zuvorigen Auftrages wieder aufgenommen werden.<br/>
				4. Tödlicher Schusswaffengebrauch ist nur als letzte Alternative einzusetzen und auch nur wenn es keine weiteren Zugriffsmöglichkeiten mehr gibt. Bei Beschuss durch scharfer Munition der Bankräuber darf der Leitende Polizist entscheiden ob Scharfe Munition seitens der Polizei angewandt werden darf. Jeder Versuch die Bankräuber zu Tasern und zu überwältigen sollte zuvor erfolgt sein!<br/>
				5. Polizisten dürfen nicht einfach Blind in ein Gebäude schießen.<br/>
				6. Die Polizei vor Ort sollte die Zivilisten zuerst evakuieren und aus dem Gefahrenbereich entfernen um diese zu Schützen.<br/>
				7. Jeder Zivilist der aktiv die Polizei daran hindert in ein Gebäude einzurücken um Kriminelle zu fassen kann als Komplize gesehen und verhaftet werden.<br/>
				8. Befehlshabende Polizisten haben die Erlaubnis einzelne Personen oder Gruppen als Sicherheitsleute für die Bank anzustellen. Diese gilt es einzukleiden und Auszurüsten um für andere Zivilisten als klar erkenntliche Sicherheitsleute identifizierbar zu machen. Für weitere Informationen oder Bewerbungen einen Admin oder den Dienstgrad höchsten Polizisten im teamspeak ansprechen.<br/><br/>
				"
		]
	];
	player createDiaryRecord ["policerules",
		[
			"Flugdienstvorschrift",
				"
				1.Ohne die authorisation vom Dienstgradhöchsten Poliziten (online) darf kein Helikopter innerhalb einer Stadt landen. (Ausnahmen werden unten aufgelistet.)<br/>
				Kavala: Helikopterlandeplatz des Krankenhauses (037129) oder der Docks (031128).<br/>
				Athira: Die Sportfelder (138185) oder hinter dem Straßenverkehrsamt (140188).<br/>
				Pyrgos: Die Felder Nördlich/Westlich des Straßenverkehrsamts (170127).<br/>
				Sofia: Gegenüber vom Auto Shop (258214) oder die Felder Südwestlich der Garage. (257212)<br/>
				Klein Städte: Geeignette stellen können gewählt werden. Es kann jedoch von Polizisten entschieden werden ob man da Landen darf.<br/><br/>
				
				2. Helikopter dürfen nicht auf Straßen landen<br/>
				3. Polizisten dürfen die Landung eines Helikopters verbieten, jedoch nicht für einen langen Zeitraum.<br/>
				4. Helikopter dürfen ohne Erlaubnis nicht unter 150 Meter fliegen.<br/>
				5. Helikopter dürfen nicht über der Stadt schweben. Der Polizei ist dies gestattet wenn es sich um einen Einsatzflug handelt.<br/><br/>

				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Illegale Gebiete", 
				"
				1. Illegale Gebiete sind z.b. Kokainfeld, Verarbeitung, Bandit Island usw.<br/>
				2. Es ist nicht erlaubt alleine ein Solches Gebiet zu stürmen<br/>
				3. Wenn du jemanden in einem illegalen Gebiet siehst fordere Verstärkung an.<br/>
				4. Es ist nicht erlaubt eine illegales Gebiet zu campen.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Patrouillen", 
				"
				1. Die Polizei patroulliert innerhalb und außerhalb von Städten um verdächtige Personen zu kontrollieren.<br/>
				2. Patrouillen können zu Fuß oder im Fahrzeug durchgeführt werden.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Checkpoints", 
				"
				Polizisten dürfen Checkpoints aufbauen und besetzen um etwas gegen illegale Aktivitäten zu tun und um die Straßen zu sichern.<br/><br/>
				
				1. Jeder Checkpoint muss mit mindestens 2 Polizisten und 1 Fahrzeug besetzt sein.<br/>
				2. Ein Checkpoint darf nicht näher als 200m an einer illegalen Zone aufgestellt werden.<br/>
				3. Checkpoints dürfen nur auf Straßen/Wegen aufgestellt werden aber nicht direkt auf einer Kreuzung.<br/>
				4. Checkpoints müssen nicht auf der Map markiert werden.<br/><br/>


				Verhaltensweise:<br/>
				1. Fahrer anhalten und ihn auffordern den Motor auszuschalten.<br/>
				2. Den Fahrer fragen ob er oder seine Beifahrer Waffen dabei haben.<br/>
				3. Danach den Fahrer auffordern das Fahrzeug zu verlassen. Falls ein Insasse eine Waffe trägt nicht direkt festnehmen sondern im kurz Zeit fürs Holstern geben.<br/>
				4. Kleines Gespräche beginnen. Woher kommen Sie? Wohin fahren Sie?<br/>
				5. Fragen ob man das Fahrzeug durchsuchen darf und die Personen.<br/>
				6. Nach der Erlaubnis, festnehmen und durchsuchen.<br/>
				7. Wenn nichts auffälliges gefunden wird, die Personen wieder freilassen<br/>
				8. Anschließend dürfen die Personen wieder in das Fahrzeug einsteigen und weiterfahren.<br/>
				9. Falls etwas illegales gefunden wurde Ticket ausstellen oder in das Gefängnis stecken.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Vehicles", 
				"
				1. Vehicles in the parking lot, or are reasonably parked elsewhere should be left alone.<br/>
				2. Vehicles that look abandoned, broken, with no driver, can be impounded.<br/>
				3. Boats should be parked reasonably on shore.<br/>
				4. Any vehicle that hasn't moved in a significant amount of time may be impounded.<br/>
				5. Impounding is an essential job for a cop, it helps keep the server clean and less laggy.<br/>
				6. If in doubt, always search the vehicle and message the owner(s) before impounding.<br/>
				7. Police speedboats or Hunter HMGs may be used to assist in apprehending criminals. The weapon should be used to disable vehicles, not to blow them up.<br/><br/>
				"
		]
	];

	player createDiaryRecord ["policerules",
		[
			"Geschwindigkeit", 
				"
				
				In der Stadt: <br/>
				Nebenstraße: 30km/h <br/>
				Hauptstraße: 50km/h <br/>
				Außerhalb der Stadt: <br/>
				Nebenstraße: 80km/h <br/>
				Hauptstraße: 120km/h <br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"City Protocol", 
				"
				1. Officers may patrol major cities - Kavala, Athira, Pyrgos and Sofia.<br/>
				2. Officers may stop by the car shop to make sure there are no cars that need to be impounded.<br/>
				3. Officers may not stand around or loiter in the centre of town.<br/>
				4. Officers may enter the town in a large number should a rebellious act occur. After the area is clear, they need to leave the town again.<br/>
				5. Martial law may not be declared at any time.<br/>
				6. The Police HQ buildings are illegal for civilians to enter without authorization, however it is NOT illegal for civilians to be nearby unless they are causing a nuisance.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Arresting and Ticketing",
				"
				Arresting should be done to criminals who are considered a danger to themselves or others.<br/><br/>

				1. You may not arrest someone if you have given them a ticket and they paid it.<br/>
				2. You must tell the suspect why they are being arrested before you arrest them.<br/>
				3. If a civilian is wanted, you may arrest them. Do not kill them, unless the situation falls under the 'Use of Lethal Force' section.<br/><br/>


				Ticketing a civilian is considered a warning for the civilian. If they break a law, but do not pose a threat to anyone, you may ticket a civilian.<br/><br/>

				1. Tickets must be a reasonable price.<br/>
				2. Ticket prices should be based off of the crimes committed.<br/>
				3. Refusal to pay a legit ticket is grounds for arrest.<br/>
				4. Giving a civilian and illegitimate ticket, such as $100k for speeding, etc., is not allowed and will result in your removal from the police department.<br/><br/>
				
				A complete list of all crimes and the appropriate punishments should be given to officers during training. If in doubt, or if you have not been trained, ask a higher ranking officer what to do.<br/><br/>
				
				The list is available at crime.sealteamsloth.com<br/><br/>
				"
		]
	];
		
	player createDiaryRecord ["policerules",
		[
			"Weapons", 
				"
				A cop is NEVER allowed to supply civilians with weapons. This will get you banned from the server and removed from being a cop.<br/><br/>

				Legal Weapons for Civilians to carry with a permit:<br/>
				1. P07<br/>
				2. Rook<br/>
				3. ACP-C2<br/>
				4. Zubr<br/>
				5. 4-five<br/>
				6. PDW2000<br/><br/>

				Any other weapon (Including Silenced P07 [Considered a Police Weapon]) is illegal.<br/><br/>

				1. Civilians are not allowed to have a weapon out within the town limits.<br/>
				2. Civilians may have a gun out when they are not in the town. However they should submit to a license search if confronted by an officer and should have the gun lowered (Press Ctrl Twice).<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
                "Einsatz von NICHT Tödlicher Gewalt",
				"
				Momentan ist der Taser (Silenced P07) die einzige Möglichkeit nichttödliche Gewalt anzuwenden.<br/><br/>

				1. Der Taser sollte verwendet werden um gesetzesuntreue Bürger außer Gefecht zu setzten und/oder sie zurückzuhalten.<br/>
				2. Das absichtliche fallenlassen des Tasers oder das weitergeben an Zivilisten kann zur Suspendierung oder Degradierung fuehren.<br/>
				3. Verwenden Sie ihren Taser nur in Übereinstimmung mit den Gesetzen bzw. Regeln, keinesfalls um ihren Willen durchzusetzen.<br/><br/>
				"
		]
	];

	player createDiaryRecord ["policerules",
		[
			"Raiding/Camping",
				"
		        Raiden ist das Eingreifen mehrerer Polizeibeamten, auf einer Fläche von hoher krimineller Aktivität um illegale handulungen zu stoppen.<br/><br/>

				1. Man muss mindestens zu dritt sein und einer sollte ein Detective sein, um ein illegales Gebiet zuraiden.<br/>
				2. Alle Zivilisten bei einem Raid, müssen gefesselt und durchsucht werden. Wenn nichts gefunden wird, müssen sie wieder freigelassen werden.<br/>
				3. Wenn Illegale Items während der Untersuchung gefunden werden, können sie mit den Ticket ausschreiben fortfahren, und bei nicht bezahlen des Tickets mit den Inhaftieren.<br/>
				5. Tödliche Gewalt ist nur zulässig, wie es unter 'Anwendung von Gewalt' beschrieben wird.<br/>
				6. Nachdem der Bereich sicher ist, müssen die Beamten das Gebiet verlassen.<br/>
				7. Ein Bereich kann innerhalb von 20 Minuten nach einer früheren Razzia nicht mehr überfallen werden.<br/>
				8. Wenn die Razzia gescheitert ist (Alle Beamten sind gestorben), gilt der 20-Minuten-Timer für alle dieser Beamten.<br/>
				9. Unterstützung kann gerufen werden, dies gilt aber nicht für die Verstorbenen Beamten(siehe 'New Life Regel').<br/><br/>

				Camping wird als verlängerten Aufenthalt eines Beamten definiert.<br/><br/>

				1. Der Aufenthalt an den Checkpoints wird nicht als Camping bezeichnet. Siehe Abschnitt Checkpoint für eine Definition der richtigen Checkpoint Verfahren.<br/>
				2. Siehe Bankraub und Agia Marina Protokoll Abschnitte für weitere Informationen über Camping in der Kernstadt.<br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Befehlskette",
				"
				Der ranghöchste Polizist hat das Kommando .<br/><br/>

				1. Chief of Police<br/>
				2. Assistant Chief<br/>
				3. Colonel<br/>
				4. Lieutenant Colonel<br/>
				5. Major<br/>
				6. Captain<br/>
				7. First Lieutenant<br/>
				8. Second Lieutenant<br/>
				9. Sergeant Major<br/>
				10. Master Sergeant<br/>
				11. Gunnery Sergeant<br/>
				12. Saff Sergeant<br/>
				13. Sergeant<br/>
				14. Detective<br/>
				15. Officer<br/>
				16. Rekrut<br/><br/>

				.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Scharfer Schuss",
				"
				1. Es ist nur erlaubt seine Waffe zu benutzen um das eigene Leben, das eines Zivilisten oder eines anderen Polizisten zu schützen.<br/>
				2. Das Hochhalten der Waffe ist nur bei einer Bedrohung erlaubt. Bei Verletzung dieser Regeln werden verwarnt/suspendiert.<br/>
				3. Fehlverhalten mit der Waffe führen zur Suspendierung.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Teamspeakregeln",
				"
				1. Als Polizist herrscht Teamspeakpflicht. Begebt euch wenn ihr euren Dienst beginnt auf unseren Teamspeak<br/><br/>
				"
		]
	];
	
	
	
// Illegal Items Section
	player createDiaryRecord ["illegalitems",
		[
			"Rebellenregeln",
				"
				Ein Rebell ist eine Person die den bewaffneten Widerstand gegen die Regierung erklärt. In diesem Fall die Polizei. Trotzdem ist es nicht erlaubt einen Polizisten ohne Ziel und Grund zu töten.<br/><br/>
				1. Zuerst musst der Rebel eine Gang gründen und dann seine Absichten erklären(Am besten auf dem Teamspeak).<br/>
				2. Widerstand entschuldigt kein RDM<br/>
				3. Widerstand Roleplay sollte sich nicht ausschließlich in wiederholten Bankräuben oder Angriffe auf die Polizei wiederspiegeln.<br/>
				4. Der Widerstand muss koordiniert sein.<br/>
				5. Für jeden Angriff muss es einen wichtigen Grund geben.<br/><br/>
				"
		]
	];
	player createDiaryRecord ["illegalitems",
		[
			"Gangregeln",
				"
				1. Es ist nicht illegal Mitglied einer Gang zu sein. Nur wenn in dieser Verbrechen ausgeübt werden. <br/>
				2. Wenn ihr einer anderen Gang den Krieg erklärt besprecht das vorher mit einem Admin.<br/>
				3. Es ist nicht erlaubt Zivilisten zu töten außer sie gehören einer feindlichen Gang an und sind bewaffnet.<br/>
				4. Es ist nicht gestattet Zivilisten zu töten nur weil sie nicht reagieren.<br/><br/>
				"
		]
	];
	player createDiaryRecord ["illegalitems",
		[
			"Illegale Fahrzeuge",
				"

				1. Rebellenfahrzeuge<br/>
				2. Speedboot<br/>
				3. Hunter<br/>
				4. Alle Polizeifahrzeuge<br/>
				"
		]
	];
	player createDiaryRecord ["illegalitems",
		[
			"Illegale Waffen",
				"		

				1. MX Series<br/>
				2. Katiba Series<br/>
				3. TRG Series<br/>
				4. Mk.20 Series<br/>
				5. Mk.18 ABR<br/>
				6. SDAR Rifle<br/>
				7. Sting SMG<br/>
				8. Silenced P07 (Taser)<br/>
				9. Sprengstoff<br/><br/>
				"
		]
	];
	player createDiaryRecord ["illegalitems",
		[
			"Illegal Items",
				"
				Die folgenden Gegenstände sind illegal:<br/><br/>
				1. Schildkröten<br/>
				2. Kokain<br/>
				3. Heroin<br/>
				4. Marihuana<br/><br/>
				"
		]
	];

	
// Controls Section

	player createDiaryRecord ["controls",
		[
			"",
				"
				Z: Spielermenü<br/>
				U: Fahrzeug auf-/absperren<br/>
				F: Sirene(nur als Cop)<br/>
				T: Kofferraum<br/>
				links Shift + R: Festnehmen (nur als Cop)<br/>
				links Shift + G: K.O. schlagen (nur als Civ)<br/>
				"
		]
	];