/*
    @Version: 0.2
    @Author: =IFD= Cryptonat
    @Edited: 4/4/14
    
    Description:
    Saves the player's gear every 10 minutes.
*/

while {true} do {
    sleep 600;
    if (alive player) then {
        if (playerside == west) then {
        [] call life_fnc_sessionUpdate;
        [] call life_fnc_saveGear;    //this is what allows the cop gear to save
        hint "Autosave - by altis2life.de."
    } else {
    [] call life_fnc_sessionUpdate;
    hint "Autosafe - by altis2life.de."
    };
    };
}; 




// < ----  OLD CODE BELOW ---- >
/*
	@Author: =IFD= Cryptonat
	@Created: 2/22/14
	
	Description:
	Saves the player's gear every 10 minutes.

while {true} do {    //Tells the function to continually loop.
	sleep 600;   //Sleep for 600 seconds/10 minutes
	if (alive player) then   //If the player is alive, then do this
        {
		[false] call life_fnc_sessionUpdate;  //Same function used by the "Sync" button
		hint "Game Autosaved."   //Just to tell you that the game is saving
	};
};
*/ 