//POPES AMBIENT CIVILIAN SCRIPT

if (!isServer) exitwith {};

//MARKER, UNIT AND VEHICLE POOL


_markers = ["CIV_01", "CIV_02", "CIV_03"];

_civilian = ["UK3CB_TKC_C_CIV", "UK3CB_TKC_C_WORKER"];

_vehicle = ["UK3CB_TKC_C_Gaz24","UK3CB_TKC_C_Lada_Taxi","UK3CB_TKC_C_Datsun_Civ_Open","UK3CB_TKC_C_UAZ_Closed"];



//MAX DISTANCE FROM MARKER CENTER TO SPAWN CIVLIANS, CROWDS AND PARKED CARS


_maxDistance = 200;


//DISTANCE FROM MARKER TO DESPAWN ALL UNITS (TRAFFIC WILL REMAIN TO MAINTAIN IMMERSION)


_despawnDistance = 2500;


//AMOUNT OF CIVLIANS, CROWDS, PARKED CARS AND TRAFFIC TO SPAWN 


_civilian_number = 20;

_crowd_number = 4;

_vehicle_number = 3;

_traffic_number = 3;


//ENSURES THERE IS A "PLAYER" TO CHECK MARKER DISTANCE FROM


waitUntil {player == player};

_playerArray = [];

{
	
if (isPlayer _x) then

	{
	
		_playerArray pushBack _x;
		
	};

} forEach playableUnits;


//CREATION OF COUNTERS TO MONITOR SPAWN AMOUNTS


_pedCount = 0;
_crowdCount = 0;
_parkCount = 0;
_trafficCount = 0;


//BEGINS OVERALL LOOP TO CONSISTENTLY CHECK DISTANCE OF PLAYERS TO MARKERS

while {true} do

{


{

_markerPos = getMarkerPos _x;
		
	if ((player distance _markerPos) < 900) then

	{



			//SPAWN PEDESTRIANS

			while {_pedCount < _civilian_number} do 

			{
				
			_Search_01 = [_markerPos, 5, _maxDistance, 0, 0, 10, 0, [], [getMarkerPos "Spawn_Marker"]] call BIS_fnc_findSafePos; //[CENTER, MINDIST, MAXDIST, OBJDIST, WATERMODE, MAXGRAD, SHOREMODE, BLACKLISTPOS, DEFAULTPOS] CALL BIS_FNC_FINDSAFEPOS
			_Building_01 = nearestBuilding _Search_01;

				if ([_Building_01] call BIS_fnc_isBuildingEnterable) then
		
				{
				
				
					_pedGroup = createGroup civilian;
					_ped_01 = _pedGroup createUnit [selectRandom _civilian, _Building_01 buildingPos 0, [], 0, "NONE"];		
					
					_pedGroup setBehaviour "SAFE";
					[_pedGroup, getPos _ped_01, 100] call bis_fnc_taskPatrol;

					_pedGroup deleteGroupWhenEmpty true;		
					_pedCount = _pedCount +1;
					
	
				};
				

			
			};

			//SPAWN CROWD


			while {_crowdCount < _crowd_number} do 

			{
				
				_CrowdArea_01 = [_markerPos, 5, _maxDistance, 0, 0, 10, 0, [], [getMarkerPos "Spawn_Marker"]] call BIS_fnc_findSafePos; //[CENTER, MINDIST, MAXDIST, OBJDIST, WATERMODE, MAXGRAD, SHOREMODE, BLACKLISTPOS, DEFAULTPOS] CALL BIS_FNC_FINDSAFEPOS				
			
				_crowdGroup = createGroup civilian;
				_crowd_01 = _crowdGroup createUnit [selectRandom _civilian, _CrowdArea_01, [], 0, "NONE"];				
				_crowd_02 = _crowdGroup createUnit [selectRandom _civilian, _CrowdArea_01, [], 0, "NONE"];				
				_crowd_03 = _crowdGroup createUnit [selectRandom _civilian, _CrowdArea_01, [], 0, "NONE"];
				
				crowdArray = [];

				_crowdMembers = {crowdArray pushback _x} forEach units _crowdGroup;
				
				_crowd_02 setDir 180;
				_crowd_03 setDir 170;
				_crowd_02 lookAt _crowd_01;
				_crowd_03 lookAt _crowd_01;	

				
				if (local _crowd_01) then {[_crowd_01, "SIT_LOW_U"] call BIS_fnc_ambientAnim;};
				if (local _crowd_02) then {[_crowd_02, "STAND_U1"] call BIS_fnc_ambientAnim;};				
				if (local _crowd_03) then {[_crowd_03, "STAND_U2"] call BIS_fnc_ambientAnim;};					
				
				_crowdGroup setBehaviour "SAFE";
				
				{
					_x addEventHandler
										[
											"FiredNear",
    
														{                            
														 _x call BIS_fnc_ambientAnim__terminate
														}
                                
										];
				} forEach crowdArray;						
							

				_crowdGroup deleteGroupWhenEmpty true;		
				
				_crowdCount = _crowdCount +1;
				
				sleep 1;
			
			};

			//SPAWN PARKED VEHICLES

			while {_parkCount < _vehicle_number} do 

			{
	
				
				_parkInitialPos_01 = [_markerPos, 10, _maxDistance, 8, 0, 25, 0, [], [getMarkerPos "spawn_marker"]] call BIS_fnc_findSafePos; //[CENTER, MINDIST, MAXDIST, OBJDIST, WATERMODE, MAXGRAD, SHOREMODE, BLACKLISTPOS, DEFAULTPOS] CALL BIS_FNC_FINDSAFEPOS;
			
				_parkRoadPos_01 = [_parkInitialPos_01, 100,[]] call BIS_fnc_nearestRoad;
				
				_parkInitialPos_02 = [_parkRoadPos_01, 5, 5, 6, 0, 25, 0, [], [getMarkerPos "spawn_marker"]] call BIS_fnc_findSafePos; //[CENTER, MINDIST, MAXDIST, OBJDIST, WATERMODE, MAXGRAD, SHOREMODE, BLACKLISTPOS, DEFAULTPOS] CALL BIS_FNC_FINDSAFEPOS;				
				
				_parkRoadPos_02 = [_parkInitialPos_02, 5,[]] call BIS_fnc_nearestRoad;


				_parkMarker_01 = createMarker ["parkSpawn_01", _parkRoadPos_01];
				"parkSpawn_01" setMarkerShape "RECTANGLE";	
				"parkSpawn_01" setMarkerSize [6, 6];
				"parkSpawn_01" setMarkerAlpha 0;
				
				_parkSafePos_01 = [getMarkerPos "parkSpawn_01", 1, 8, 1, 0, 15, 0, ["parkSpawn_01"], [getMarkerPos "spawn_marker"]] call BIS_fnc_findSafePos; //[CENTER, MINDIST, MAXDIST, OBJDIST, WATERMODE, MAXGRAD, SHOREMODE, BLACKLISTPOS, DEFAULTPOS] CALL BIS_FNC_FINDSAFEPOS;	
			
				_Veh_01 = createVehicle [selectRandom _vehicle, _parkSafePos_01, [], 0, "NONE"];

				_azimuth = _Veh_01 getDir _parkRoadPos_02;
		
				_Veh_01 setDir _azimuth;	
			
				_Veh_01 enableDynamicSimulation true;
			
				deleteMarker "parkSpawn_01";
			
				_parkCount = _parkCount +1;
			
				sleep 1;
			
			};

			//SPAWN TRAFFIC

			while {_trafficCount < _traffic_number} do 

			{
				
				_vehicleInitialPos_01 = [_markerPos, 10, 700, 8, 0, 25, 0, [], [getMarkerPos "spawn_marker"]] call BIS_fnc_findSafePos; //[CENTER, MINDIST, MAXDIST, OBJDIST, WATERMODE, MAXGRAD, SHOREMODE, BLACKLISTPOS, DEFAULTPOS] CALL BIS_FNC_FINDSAFEPOS;
				_vehicleRoadPos_01 = [_vehicleInitialPos_01, 200,[]] call BIS_fnc_nearestRoad;
				_vehicleSafePos_01 = [_vehicleRoadPos_01, 1, 7, 1, 0, 15, 0, [], [getMarkerPos "spawn_marker"]] call BIS_fnc_findSafePos; //[CENTER, MINDIST, MAXDIST, OBJDIST, WATERMODE, MAXGRAD, SHOREMODE, BLACKLISTPOS, DEFAULTPOS] CALL BIS_FNC_FINDSAFEPOS;	

		
				_civVehicle = selectRandom _vehicle createVehicle _vehicleSafePos_01;
				_civGroup = createGroup civilian;
				_civ_01 = _civGroup createUnit [selectRandom _civilian, getPos _civVehicle, [], 0, "NONE"];
				_civVehicle limitSpeed 45;
			
		
				_civGroup setBehaviour "SAFE"; 
				_civ_01 moveInAny _civVehicle;
				_azimuth_01 = position _civVehicle getDir position player;
				_waypointArea = player getPos [900, _azimuth_01];
				_waypointRoadPos_01 = [_waypointArea, 1000,[]] call BIS_fnc_nearestRoad;	

				sleep 1;
			
				_civGroup deleteGroupWhenEmpty true;
		
				_wp01 = _civGroup addWaypoint [_waypointRoadPos_01, -1];
				_wp01 setWaypointType "MOVE";
				_wp01 setWaypointCompletionRadius 80; 
				_wp01 setWaypointStatements ["true", "{deleteVehicle _X} forEach (crew this); {deleteVehicle _x} forEach nearestObjects [this, ['Car'], 3]"];
		
				_trafficCount = _trafficCount +1;
		
				sleep 2;
		
			};



		


			//CHECKS FOR PLAYERS TO LEAVE MARKER RADIUS AND BEGIN DE-SPAWNING
			_playerCheck = {_x} forEach allPlayers;

			waitUntil {(_playerCheck distance _markerPos) > _despawnDistance};

			{deleteVehicle _x} forEach (_markerPos nearObjects ["Civilian",500]);

			{
		
				if ({alive _x} count crew _x < 1) then 
					{
				
						{
					
							deleteVehicle _x
				
						} count (crew _x);
				
						deleteVehicle _x
					}
		
			} forEach (_markerPos nearEntities ["landvehicle",500]);


			//RESETS COUNTERS FOR NEXT LOOP 


			_pedCount = 0;
			_parkCount = 0;
			_trafficCount = 0;
	
	
	} else {};

} forEach _markers;

};