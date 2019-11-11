//POPES QRF SCRIPT

if (!isServer) exitwith {};


sleep 200;

//FIND ROADS 400-900 METERS AWAY FROM RAIDER 1-1, FIND A SAFE POSITION ON ROAD, FIND CLOSEST ROAD TO RAIDER 1-1 TO MOVE TO


	_QRFInitialPos_01 = [leader Raider_01, 500, 1000, 5, 0, 25, 0, [], [getMarkerPos "Spawn_Marker"]] call BIS_fnc_findSafePos; //[CENTER, MINDIST, MAXDIST, OBJDIST, WATERMODE, MAXGRAD, SHOREMODE, BLACKLISTPOS, DEFAULTPOS] CALL BIS_FNC_FINDSAFEPOS;
	_QRFInitialPos_02 = [leader Raider_01, 500, 1000, 5, 0, 25, 0, [], [getMarkerPos "Spawn_Marker"]] call BIS_fnc_findSafePos; //[CENTER, MINDIST, MAXDIST, OBJDIST, WATERMODE, MAXGRAD, SHOREMODE, BLACKLISTPOS, DEFAULTPOS] CALL BIS_FNC_FINDSAFEPOS;
	_QRFInitialPos_03 = [leader Raider_01, 600, 1000, 5, 0, 25, 0, [], [getMarkerPos "Spawn_Marker"]] call BIS_fnc_findSafePos; //[CENTER, MINDIST, MAXDIST, OBJDIST, WATERMODE, MAXGRAD, SHOREMODE, BLACKLISTPOS, DEFAULTPOS] CALL BIS_FNC_FINDSAFEPOS;

sleep 2;

	_QRFRoadPos_01 = [_QRFInitialPos_01, 1500,["#GdtForest","#GdtGrassTall","1693649:","1693546:","1693547:","1693548:","1693549:","1693552:","1693551:","1693550:","1693648:","1693647:","1693553:","1693643:","1693554:","1693642:","1693644:","1693645:","1693646:","1693556:","1693555:","1693634:","1693559:","1693558:","1693635:","1693557:","1693636:","1693632:","1693633:","1693640:","1693641:","1693639:","1693560:","1693638:","1693561:","1693637:","1693631:","1693630:","1693562:","1693564:","1693563:","1693629:","169356"]] call BIS_fnc_nearestRoad;
	_QRFRoadPos_02 = [_QRFInitialPos_02, 1500,["#GdtForest","#GdtGrassTall","1693649:","1693546:","1693547:","1693548:","1693549:","1693552:","1693551:","1693550:","1693648:","1693647:","1693553:","1693643:","1693554:","1693642:","1693644:","1693645:","1693646:","1693556:","1693555:","1693634:","1693559:","1693558:","1693635:","1693557:","1693636:","1693632:","1693633:","1693640:","1693641:","1693639:","1693560:","1693638:","1693561:","1693637:","1693631:","1693630:","1693562:","1693564:","1693563:","1693629:","169356"]] call BIS_fnc_nearestRoad;
	_QRFRoadPos_03 = [_QRFInitialPos_03, 1500,["#GdtForest","#GdtGrassTall","1693649:","1693546:","1693547:","1693548:","1693549:","1693552:","1693551:","1693550:","1693648:","1693647:","1693553:","1693643:","1693554:","1693642:","1693644:","1693645:","1693646:","1693556:","1693555:","1693634:","1693559:","1693558:","1693635:","1693557:","1693636:","1693632:","1693633:","1693640:","1693641:","1693639:","1693560:","1693638:","1693561:","1693637:","1693631:","1693630:","1693562:","1693564:","1693563:","1693629:","169356"]] call BIS_fnc_nearestRoad;

sleep 2;

	_QRFSafePos_01 = [_QRFRoadPos_01, 1, 15, 8, 0, 15, 0, [], [getMarkerPos "Spawn_Marker"]] call BIS_fnc_findSafePos; //[CENTER, MINDIST, MAXDIST, OBJDIST, WATERMODE, MAXGRAD, SHOREMODE, BLACKLISTPOS, DEFAULTPOS] CALL BIS_FNC_FINDSAFEPOS;
	_QRFSafePos_02 = [_QRFRoadPos_02, 1, 15, 8, 0, 15, 0, [], [getMarkerPos "Spawn_Marker"]] call BIS_fnc_findSafePos; //[CENTER, MINDIST, MAXDIST, OBJDIST, WATERMODE, MAXGRAD, SHOREMODE, BLACKLISTPOS, DEFAULTPOS] CALL BIS_FNC_FINDSAFEPOS;
	_QRFSafePos_03 = [_QRFRoadPos_03, 1, 15, 8, 0, 55, 0, [], [getMarkerPos "Spawn_Marker"]] call BIS_fnc_findSafePos; //[CENTER, MINDIST, MAXDIST, OBJDIST, WATERMODE, MAXGRAD, SHOREMODE, BLACKLISTPOS, DEFAULTPOS] CALL BIS_FNC_FINDSAFEPOS;

sleep 2;

	_QRF_Marker_01 = createMarker ["Spawn_01", _QRFSafePos_01];
	"Spawn_01" setMarkerType "empty";	
	_QRF_Marker_02 = createMarker ["Spawn_02", _QRFSafePos_02];
	"Spawn_02" setMarkerType "empty";	
	_QRF_Marker_03 = createMarker ["Spawn_03", _QRFSafePos_03];
	"Spawn_03" setMarkerType "empty";

sleep 2;

_count = 0;

while {_count < 1} do {

_Search_01 = [leader Raider_01, 400, 1000, 0, 0, 10, 0, [], [getMarkerPos "Spawn_Marker"]] call BIS_fnc_findSafePos; //[CENTER, MINDIST, MAXDIST, OBJDIST, WATERMODE, MAXGRAD, SHOREMODE, BLACKLISTPOS, DEFAULTPOS] CALL BIS_FNC_FINDSAFEPOS
_Building_01 = nearestBuilding _Search_01;

_Search_02 = [leader Raider_01, 400, 1000, 0, 0, 10, 0, [], [getMarkerPos "Spawn_Marker"]] call BIS_fnc_findSafePos; //[CENTER, MINDIST, MAXDIST, OBJDIST, WATERMODE, MAXGRAD, SHOREMODE, BLACKLISTPOS, DEFAULTPOS] CALL BIS_FNC_FINDSAFEPOS
_Building_02 = nearestBuilding _Search_02;
	
	if ([_Building_01] call BIS_fnc_isBuildingEnterable and [_Building_02] call BIS_fnc_isBuildingEnterable) then

	{	
	
	sleep 2;
	
		BuildingSquad_01 = [_Building_01 buildingPos 0, EAST, (configfile >> "CfgGroups" >> "East" >> "UK3CB_TKM_O" >> "Infantry" >> "UK3CB_TKM_O_RIF_FireTeam")] call BIS_fnc_spawnGroup;
		BuildingSquad_01 setBehaviour "SAFE";
		BuildingSquad_01 deleteGroupWhenEmpty true;
		{_x setVariable ["dangerAIEnabled",false]} forEach units BuildingSquad_01;

	sleep 2;		
		
		_wp01 = BuildingSquad_01 addWaypoint [position leader Raider_01, 10];
		_wp01 setWaypointType "MOVE";
		_wp01 setWaypointBehaviour "AWARE";
		_wp01 setWaypointStatements ["true", "'UGL_FlareRed_F' createVehicle ((leader _AttackSquad_01) modelToWorld [0,0,200])"];
		
		BuildingSquad_02 = [_Building_02 buildingPos 0, EAST, (configfile >> "CfgGroups" >> "East" >> "UK3CB_TKM_O" >> "Infantry" >> "UK3CB_TKM_O_RIF_FireTeam")] call BIS_fnc_spawnGroup;
		BuildingSquad_02 setBehaviour "SAFE";
		BuildingSquad_02 deleteGroupWhenEmpty true;
		{_x setVariable ["dangerAIEnabled",false]} forEach units BuildingSquad_02;	

	sleep 2;

		_wp02 = BuildingSquad_02 addWaypoint [position leader Raider_01, 10];
		_wp02 setWaypointType "MOVE";
		_wp02 setWaypointBehaviour "AWARE";		

		_flare_01 = "F_20mm_Red" createvehicle ((leader BuildingSquad_01) ModelToWorld [0,100,200]); 
		_flare_01 setVelocity [0,0,-10];

		_flare_02 = "F_20mm_Red" createvehicle ((leader BuildingSquad_02) ModelToWorld [0,100,200]); 
		_flare_02 setVelocity [0,0,-10];

	_count = _count + 1;
		
	};

sleep 2;

};

//SPAWN FIRETEAMS
	
	_QRFSquad_01 = [getMarkerPos "Spawn_01", EAST, (configfile >> "CfgGroups" >> "East" >> "UK3CB_TKM_O" >> "Infantry" >> "UK3CB_TKM_O_RIF_FireTeam")] call BIS_fnc_spawnGroup;
	_QRFSquad_01 setBehaviour "SAFE";
	_QRFSquad_01 deleteGroupWhenEmpty true;
	{_x addPrimaryWeaponItem "acc_flashlight"} forEach units _QRFSquad_01;
	_QRFSquad_01 enableGunLights "ForceOn";
	{_x setVariable ["dangerAIEnabled",false]} forEach units _QRFSquad_01;
	
	_QRFSquad_02 = [getMarkerPos "Spawn_02", EAST, (configfile >> "CfgGroups" >> "East" >> "UK3CB_TKM_O" >> "Infantry" >> "UK3CB_TKM_O_RIF_FireTeam")] call BIS_fnc_spawnGroup;
	_QRFSquad_02 setBehaviour "SAFE";
	_QRFSquad_02 deleteGroupWhenEmpty true;
	{_x addPrimaryWeaponItem "acc_flashlight"} forEach units _QRFSquad_02;
	_QRFSquad_02 enableGunLights "ForceOn";
	{_x setVariable ["dangerAIEnabled",false]} forEach units _QRFSquad_02;
	
	_QRFSquad_03 = createGroup east;
	_QRFSquad_03 createUnit ["UK3CB_TKM_O_TL", getMarkerPos "Spawn_03", [], 0, "NONE"];
	_QRFSquad_03 createUnit ["UK3CB_TKM_O_TL", getMarkerPos "Spawn_03", [], 0, "NONE"];
	_QRFSquad_03 setBehaviour "SAFE";
	_QRFSquad_03 deleteGroupWhenEmpty true;
	{_x addPrimaryWeaponItem "acc_flashlight"} forEach units _QRFSquad_03;
	_QRFSquad_03 enableGunLights "ForceOn";
	{_x setVariable ["dangerAIEnabled",false]} forEach units _QRFSquad_03;	
		
sleep 5;


//FIND AND SET DIRECTION OF VEHICLES TO FACE RAIDER 1-1 (SAVE'S AI TRYING TO U-TURN)

	_azimuth_01 = position leader Raider_01 getDir position leader _QRFSquad_01;
	_azimuth_veh_01 = position leader _QRFSquad_01 getDir position leader Raider_01;
	_waypoint_01 = leader Raider_01 getPos [100, _azimuth_01];
	
	_azimuth_02 = position leader Raider_01 getDir position leader _QRFSquad_02;
	_azimuth_veh_02 = position leader _QRFSquad_02 getDir position leader Raider_01;
	_waypoint_02 = leader Raider_01 getPos [100, _azimuth_02];

	_azimuth_03 = position leader Raider_01 getDir position leader _QRFSquad_03;
	_azimuth_veh_03 = position leader _QRFSquad_03 getDir position leader Raider_01;
	_waypoint_03 = leader Raider_01 getPos [100, _azimuth_03];


sleep 1;


//SPAWN VEHICLES

	_Veh_01 = createVehicle ["C_Offroad_01_F", getMarkerPos "Spawn_01", [], 0, "NONE"];
	_Veh_01 setDir _azimuth_veh_01;
	_Veh_01 setUnloadInCombat [false, false];	
	_Veh_01 lock true;
	
	_Veh_02 = createVehicle ["C_Offroad_01_F", getMarkerPos "Spawn_02", [], 0, "NONE"];
	_Veh_02 setDir _azimuth_veh_02;
	_Veh_02 setUnloadInCombat [false, false];		
	_Veh_02 lock true;
	
	_Veh_03 = createVehicle ["C_Quadbike_01_F", getMarkerPos "Spawn_03", [], 0, "NONE"];
	_Veh_03 setDir _azimuth_veh_03;	
	_Veh_03 setUnloadInCombat [false, false];	
	_Veh_03 lock true;	

sleep 5;
		
//CREATE WAYPOINTS

//FIRETEAMS ENTER VEHICLES

			{_x moveInAny _Veh_01} forEach units _QRFSquad_01;
			
			{_x moveInAny _Veh_02} forEach units _QRFSquad_02;

			{_x moveInAny _Veh_03} forEach units _QRFSquad_03;						

sleep 1;

//FIRETEAMS MOVE TO RAIDER 1-1

		
			_QRFVehicle_wp01 = _QRFSquad_01 addWaypoint [_waypoint_01, 10];
			_QRFVehicle_wp01 setWaypointType "MOVE";
			_QRFVehicle_wp01 setWaypointCompletionRadius 80; 

			
			_QRFVehicle_wp02 = _QRFSquad_02 addWaypoint [_waypoint_02, 10];
			_QRFVehicle_wp02 setWaypointType "MOVE";
			_QRFVehicle_wp02 setWaypointCompletionRadius 80; 

			
			_QRFVehicle_wp03 = _QRFSquad_02 addWaypoint [_waypoint_02, 10];
			_QRFVehicle_wp03 setWaypointType "MOVE";
			_QRFVehicle_wp03 setWaypointCompletionRadius 80; 			

	
			
sleep 10;

//FIRETEAM EXIT VEHICLES

			_QRFVehicle_wp04 = _QRFSquad_01 addWaypoint [_waypoint_01, 20];
			_QRFVehicle_wp04 setWaypointType "GETOUT";
			_QRFVehicle_wp04 setWaypointBehaviour "AWARE";
			_QRFVehicle_wp04 setWaypointCompletionRadius 100; 

			_QRFVehicle_wp05 = _QRFSquad_02 addWaypoint [_waypoint_02, 20];
			_QRFVehicle_wp05 setWaypointType "GETOUT";
			_QRFVehicle_wp05 setWaypointBehaviour "AWARE";
			_QRFVehicle_wp05 setWaypointCompletionRadius 100; 

			_QRFVehicle_wp06 = _QRFSquad_03 addWaypoint [_waypoint_03, 20];
			_QRFVehicle_wp06 setWaypointType "GETOUT";
			_QRFVehicle_wp06 setWaypointBehaviour "AWARE";
			_QRFVehicle_wp06 setWaypointCompletionRadius 100; 
			
			_Veh_01 setUnloadInCombat [true, true];
			_Veh_02 setUnloadInCombat [true, true];	
			_Veh_03 setUnloadInCombat [true, true];	

sleep 1;

//FIRETEAMS MOVE IN ON FOOT

			{_x setVariable ["dangerAIEnabled",true]} forEach units _QRFSquad_01;
			{_x setVariable ["dangerAIEnabled",true]} forEach units _QRFSquad_02;
			{_x setVariable ["dangerAIEnabled",true]} forEach units _QRFSquad_03;
			{_x setVariable ["dangerAIEnabled",true]} forEach units BuildingSquad_01;	
			{_x setVariable ["dangerAIEnabled",true]} forEach units BuildingSquad_02;			
		
			_QRFVehicle_wp07 = _QRFSquad_01 addWaypoint [position leader Raider_01, 30];
			_QRFVehicle_wp07 setWaypointType "MOVE";
			_QRFVehicle_wp07 setWaypointStatements ["true", "'UGL_FlareRed_F' createVehicle ((leader _QRFSquad_01) modelToWorld [0,0,200])"];

			_QRFVehicle_wp08 = _QRFSquad_02 addWaypoint [position leader Raider_01, 30];
			_QRFVehicle_wp08 setWaypointType "MOVE";

			_QRFVehicle_wp09 = _QRFSquad_03 addWaypoint [position leader Raider_01, 30];
			_QRFVehicle_wp09 setWaypointType "MOVE";
			_QRFVehicle_wp09 setWaypointStatements ["true", "'UGL_FlareRed_F' createVehicle ((leader _QRFSquad_03) modelToWorld [0,0,200])"];
			
sleep 60;
			
_QRFPos_01 = getPos leader Raider_01;

_QRFbattlemarker_01 = createMarker ["QRFBM_01", _QRFPos_01];
"QRFBM_01" setMarkerType "Empty";

if (leader Raider_01 distance getMarkerPos "QRFBM_01" > 500	) then {

				{deleteVehicle _x} foreach units _QRFSquad_01;
				{deleteVehicle _x} foreach units _QRFSquad_02;
				{deleteVehicle _x} foreach units _QRFSquad_03;
				{deleteVehicle _x} foreach units BuildingSquad_01;
				{deleteVehicle _x} foreach units BuildingSquad_02;
					
				deleteMarker "QRFBM_01";
				deleteMarker "Spawn_01";
				deleteMarker "Spawn_02";
				deleteMarker "Spawn_03";	
} else {

				waitUntil	{
								leader Raider_01 distance leader _QRFSquad_01 > 400 and
								leader Raider_01 distance leader _QRFSquad_02 > 400 and
								leader Raider_01 distance leader _QRFSquad_03 > 400	
							}

};						

deleteVehicle _Veh_01;
deleteVehicle _Veh_02;
deleteVehicle _Veh_03;

{deleteVehicle _x} foreach units _QRFSquad_01;
{deleteVehicle _x} foreach units _QRFSquad_02;
{deleteVehicle _x} foreach units _QRFSquad_03;
{deleteVehicle _x} foreach units BuildingSquad_01;
{deleteVehicle _x} foreach units BuildingSquad_02;
					
deleteMarker "QRFBM_01";
deleteMarker "Spawn_01";
deleteMarker "Spawn_02";
deleteMarker "Spawn_03";					