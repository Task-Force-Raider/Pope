//POPES SUITCASE SCRIPT

if (!isServer) exitwith {};

BagMan_01 allowDamage false;

//CONVERSATION WITH BAGMAN BEGINS

playSound3D [MISSION_ROOT + "scripts\sounds\Money.ogg", BagMan_01, false, getPosASL BagMan_01, 5, 1, 20];

BagMan_01 removeAction 0;

sleep 10;

playSound3D [MISSION_ROOT + "scripts\sounds\Hostages.ogg", BagMan_01, false, getPosASL BagMan_01, 5, 1, 20];

sleep 10;

//ADDACTION TO DROP CASE IN FRONT OF BAGMAN

BagMan_01 addAction ["Hand Over Money", "Case_02 hideObject false"];

sleep 3;

waitUntil {(BagMan_01 distance Case_02) < 1.5};

BagMan_01 stop false;

sleep 1;

BagMan_01 call BIS_fnc_ambientAnim__terminate;

sleep 3;

//BAGMAN PICK UP SUITCASE

[BagMan_01, "REPAIR_VEH_KNEEL", "ASIS"] call BIS_fnc_ambientAnim;

sleep 3;

Case_02 attachTo [BagMan_01, [0,0,-0.2],"LeftHand"];

Case_02 setDir 75;

BagMan_01 call BIS_fnc_ambientAnim__terminate;

BagMan_01 removeAction 1;


playSound3D [MISSION_ROOT + "scripts\sounds\Bedrood.ogg", BagMan_01, false, getPosASL BagMan_01, 5, 1, 20];

//BAGMAN GETS INTO VEHICLE AND LEAVES

sleep 10;

_wp01 = BAGMAN addWaypoint [getPos Car_01, 1];
_wp01 setWaypointBehaviour "SAFE";
_wp01 setWaypointType "MOVE";
_wp01 setWaypointSpeed "LIMITED";
_wp01 setWaypointBehaviour "SAFE";
_wp01 setWaypointCompletionRadius 3; 


sleep 8;

_wp02 = BAGMAN addWaypoint [getPos Car_01, -1];
_wp02 setWaypointBehaviour "SAFE";
_wp02 setWaypointSpeed "LIMITED";
_wp02 setWaypointType "GETIN NEAREST";
_wp02 setWaypointCompletionRadius 3; 

deleteVehicle Case_02;

sleep 10;


_wp03 = BAGMAN addWaypoint [getMarkerPos "Bag_Destination_01", -1];
_wp03 setWaypointBehaviour "SAFE";
_wp03 setWaypointSpeed "LIMITED";
_wp03 setWaypointType "MOVE";
_wp03 setWaypointCompletionRadius 10; 
_wp03 setWaypointStatements ["true", "{deleteVehicle _X} forEach (crew Car_01); {deleteVehicle _x} forEach nearestObjects [this, ['Car'], 3]"];




