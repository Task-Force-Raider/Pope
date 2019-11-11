[] execVM "briefing.sqf";

//FIND FOLDER ROOT FOR PLAYSOUND3D


MISSION_ROOT = call {
    private "_arr";
    _arr = toArray __FILE__;
    _arr resize (count _arr - 8);
    toString _arr
};

//INTRO TEXT

0 fadesound 0;
titleCut ["", "BLACK FADED", 999];
[
	[
		["OPERATION RED DUNES","<t align = 'center' shadow = '1' size = '1.5'>%1</t><br/>",10],
		["Reshmaan Province","<t align = 'center' shadow = '1' size = '0.9'>%1</t><br/>",10],
		["06:13","<t align = 'center' shadow = '1' size = '0.7'>%1</t>",30]
	]
] spawn BIS_fnc_typeText;

sleep 4;
30 fadesound 1;
titleCut ["", "BLACK FADED", 999];
sleep 3;
playMusic "ATrack13";
cutText ["", "BLACK IN", 10];

sleep 25;

//KILL INTRO PLANE ENGINES

introplane_01 engineOn false;
introplane_02 engineOn false;

sleep 1;

//COMPILE AMBIENT CIVILIAN SCRIPT

call compile preprocessFileLineNumbers "scripts\ambience\Ambient_Civilian.sqf";


//SPAWN AMBIENT CIVILIAN SCRIPT

sleep 1;

[] spawn {"scripts\ambience\Ambient_Civilian.sqf"};



