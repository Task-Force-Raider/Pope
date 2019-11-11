//POPES UNDERCOVER CIVILIAN SCRIPT

if (!isServer) exitwith {};


//FADE OUT SCREEN WHILE CHANGING GEAR


15 fadesound 0;
cutText ["", "BLACK OUT", 3];
sleep 4;
skipTime 0.5;
sleep 1;

private ["_playerArray", "_players", "_uniform", "_headgear", "_backpack", "_vest", "_randomWeapon", "_marksman", "_medic"];


//ROLE POOLS - PLACE VARIABLE NAMES FOR PLAYER ROLES IN THE APPROPRIATE ARRAY

_marksman =		[Marksman_01, Marksman_02, Marksman_03, Marksman_04];
_medic = 		[Medic_01, Medic_02, Medic_03, Medic_04];


//ITEM POOLS - CLASS NAMES FOR THE RANDOM GEAR TO EQUIP PLAYERS


_uniform = 		["UK3CB_TKC_C_U_02_C","UK3CB_TKM_I_U_01_B","UK3CB_TKC_C_U_01_E","UK3CB_TKC_C_U_01_B","UK3CB_TKC_C_U_02_C"];
_headgear = 	["UK3CB_TKM_I_H_Turban_02_1","UK3CB_TKM_B_H_Turban_01_1","UK3CB_TKM_B_H_Turban_04_1","UK3CB_TKM_B_H_Turban_02_1"];
_backpack = 	["UK3CB_B_Alice_K","UK3CB_CW_US_B_LATE_B_RIF_03","UK3CB_B_Alice_Medic_Bedroll_K","UK3CB_CHC_C_B_HIKER","UK3CB_B_Alice_K"];
_vest = 		["UK3CB_V_Belt_KHK"];


//WEAPON AND AMMO POOLS - CLASS NAMES FOR THE RANDOM WEAPONS, MATCHING ATTACHMENTS AND APPROPRIATE MAGAZINES TO EQUIP PLAYERS


_randomWeapon = selectRandom  	[
									["rhs_weap_ak74n", "rhs_acc_dtk1983", "","","", "rhs_30Rnd_545x39_7N10_2mag_AK"], 
									["rhs_weap_aks74u", "rhs_acc_pgs64_74u", "","","", "rhs_30Rnd_545x39_7N10_2mag_AK"]
								];

_randomWeapon params ["_weapon", "_attachment_01", "_attachment_02", "_attachment_03", "_attachment_04", "_magazines"];


//SELECT PLAYERS - CURRENTLY UNUSED


_playerArray = [];

_players = {_playerArray pushback _x} forEach allPlayers;


//SET PLAYERS TO CAPTIVE - ENEMY WILL NOT ENGAGE UNTIL SETCAPTIVE IS DISABLED, OR A PLAYER FIRES A WEAPON TOO CLOSE TO THE ENEMY


{_x setCaptive true} forEach allPlayers;


{



//EQUIP RANDOM LOADOUTS FOR LEADERS AND BASIC UNITS (152 RADIO FOR SQUAD LEADS)


	if (leader group _x == _x) then

	{

		comment "Remove existing items";
		removeAllWeapons _x;
		removeAllItems _x;
		removeAllAssignedItems _x;
		removeUniform _x;
		removeVest _x;
		removeBackpack _x;
		removeHeadgear _x;
		removeGoggles _x;

		comment "Add containers";
		_x forceAddUniform selectRandom _uniform;
		_x addVest selectRandom _vest;
		_x addBackpack selectRandom _backpack;

		_x addWeapon _weapon;
		_x addPrimaryWeaponItem _attachment_01;
		_x addPrimaryWeaponItem _attachment_02;
		_x addPrimaryWeaponItem _attachment_03;
		_x addPrimaryWeaponItem _attachment_04;
		_X addPrimaryWeaponItem _magazines;

		comment "Add items to containers";
		_x addItemToUniform "ACRE_PRC152";
		_x addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 10 do {_x addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 2 do {_x addItemToUniform "ACE_CableTie";};
		_x addItemToUniform "ACE_epinephrine";
		for "_i" from 1 to 5 do {_x addItemToUniform "ACE_morphine";};
		_x addItemToUniform "ACE_microDAGR";
		_x addItemToUniform "ACE_Flashlight_XL50";
		for "_i" from 1 to 10 do {_x addItemToUniform "ACE_packingBandage";};
		for "_i" from 1 to 2 do {_x addItemToUniform "adv_aceSplint_splint";};
		for "_i" from 1 to 5 do {_x addItemToUniform "ACE_elasticBandage";};
		for "_i" from 1 to 10 do {_x addItemToVest _magazines;};
		_x addHeadgear selectRandom _headgear;

		comment "Add items";
		_x linkItem "ItemMap";
		_x linkItem "ItemCompass";
		_x linkItem "ItemWatch";
		_x linkItem "ItemGPS";


	} 
	
	else 
	
	{

		comment "Remove existing items";
		removeAllWeapons _x;
		removeAllItems _x;
		removeAllAssignedItems _x;
		removeUniform _x;
		removeVest _x;
		removeBackpack _x;
		removeHeadgear _x;
		removeGoggles _x;

		comment "Add containers";
		_x forceAddUniform selectRandom _uniform;
		_x addVest selectRandom _vest;
		_x addBackpack selectRandom _backpack;

		_x addWeapon _weapon;
		_x addPrimaryWeaponItem _attachment_01;
		_x addPrimaryWeaponItem _attachment_02;
		_x addPrimaryWeaponItem _attachment_03;
		_x addPrimaryWeaponItem _attachment_04;
		_X addPrimaryWeaponItem _magazines;

		comment "Add items to containers";
		_x addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 10 do {_x addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 2 do {_x addItemToUniform "ACE_CableTie";};
		_x addItemToUniform "ACE_epinephrine";
		for "_i" from 1 to 5 do {_x addItemToUniform "ACE_morphine";};
		_x addItemToUniform "ACE_microDAGR";
		_x addItemToUniform "ACE_Flashlight_XL50";
		for "_i" from 1 to 10 do {_x addItemToUniform "ACE_packingBandage";};
		for "_i" from 1 to 2 do {_x addItemToUniform "adv_aceSplint_splint";};
		for "_i" from 1 to 5 do {_x addItemToUniform "ACE_elasticBandage";};
		for "_i" from 1 to 10 do {_x addItemToVest _magazines;};
		_x addHeadgear selectRandom _headgear;

		comment "Add items";
		_x linkItem "ItemMap";
		_x linkItem "ItemCompass";
		_x linkItem "ItemWatch";
		_x linkItem "ItemGPS";


	};


} forEach allPlayers;


//LOADOUT FOR MARKSMAN (152 RADIOS, RANGE CARDS, KESTRELS AND DMR'S)


{


	{

		comment "Remove existing items";
		removeAllWeapons _x;
		removeAllItems _x;
		removeAllAssignedItems _x;
		removeUniform _x;
		removeVest _x;
		removeBackpack _x;
		removeHeadgear _x;
		removeGoggles _x;

		comment "Add containers";
		_x forceAddUniform selectRandom _uniform;
		_x addVest selectRandom _vest;
		_x addBackpack selectRandom _backpack;

		_x addWeapon "rhs_weap_m76";
		_x addPrimaryWeaponItem "rhs_acc_pso1m21";
		_x addPrimaryWeaponItem "rhsgref_10Rnd_792x57_m76";

		comment "Add binoculars";
		_x addWeapon "ACE_Vector";

		comment "Add items to containers";
		_x addItemToUniform "ACRE_PRC152";
		_x addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 10 do {_x addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 2 do {_x addItemToUniform "ACE_CableTie";};
		_x addItemToUniform "ACE_epinephrine";
		for "_i" from 1 to 5 do {_x addItemToUniform "ACE_morphine";};
		_x addItemToVest "ACE_Kestrel4500";
		_x addItemToUniform "ACE_microDAGR";
		_x addItemToUniform "ACE_Flashlight_XL50";
		_x addItemToVest "ACE_RangeCard";
		for "_i" from 1 to 10 do {_x addItemToUniform "ACE_packingBandage";};
		for "_i" from 1 to 2 do {_x addItemToUniform "adv_aceSplint_splint";};
		for "_i" from 1 to 5 do {_x addItemToUniform "ACE_elasticBandage";};
		for "_i" from 1 to 15 do {_x addItemToVest "rhssaf_10Rnd_792x57_m76_tracer";};
		_x addHeadgear selectRandom _headgear;

		comment "Add items";
		_x linkItem "ItemMap";
		_x linkItem "ItemCompass";
		_x linkItem "ItemWatch";
		_x linkItem "ItemGPS";


	} forEach _marksman;

} forEach Allplayers;


//LOADOUT FOR MEDIC (BACKPACK FULL OF MEDICAL SUPPLIES AND SMOKE GRENADES)


{


	{

		comment "Remove existing items";
		removeAllWeapons _x;
		removeAllItems _x;
		removeAllAssignedItems _x;
		removeUniform _x;
		removeVest _x;
		removeBackpack _x;
		removeHeadgear _x;
		removeGoggles _x;

		comment "Add containers";
		_x forceAddUniform selectRandom _uniform;
		_x addVest selectRandom _vest;
		_x addBackpack selectRandom _backpack;

		_x addWeapon _weapon;
		_x addPrimaryWeaponItem _attachment_01;
		_x addPrimaryWeaponItem _attachment_02;
		_x addPrimaryWeaponItem _attachment_03;
		_x addPrimaryWeaponItem _attachment_04;
		_X addPrimaryWeaponItem _magazines;

		comment "Add items to containers";
		_x addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 10 do {_x addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 2 do {_x addItemToUniform "ACE_CableTie";};
		_x addItemToUniform "ACE_epinephrine";
		for "_i" from 1 to 5 do {_x addItemToUniform "ACE_morphine";};
		_x addItemToUniform "ACE_microDAGR";
		_x addItemToUniform "ACE_Flashlight_XL50";
		for "_i" from 1 to 10 do {_x addItemToUniform "ACE_packingBandage";};
		for "_i" from 1 to 2 do {_x addItemToUniform "adv_aceSplint_splint";};
		for "_i" from 1 to 5 do {_x addItemToUniform "ACE_elasticBandage";};
		for "_i" from 1 to 10 do {_x addItemToVest _magazines;};
		for "_i" from 1 to 5 do {_x addItemToBackpack "ACE_bloodIV_250";};
		for "_i" from 1 to 5 do {_x addItemToBackpack "ACE_bloodIV_500";};
		for "_i" from 1 to 10 do {_x addItemToBackpack "ACE_epinephrine";};
		for "_i" from 1 to 15 do {_x addItemToBackpack "ACE_fieldDressing";};
		for "_i" from 1 to 15 do {_x addItemToBackpack "ACE_elasticBandage";};
		for "_i" from 1 to 10 do {_x addItemToBackpack "ACE_quikclot";};
		for "_i" from 1 to 10 do {_x addItemToBackpack "ACE_morphine";};
		for "_i" from 1 to 15 do {_x addItemToBackpack "ACE_packingBandage";};
		for "_i" from 1 to 5 do {_x addItemToBackpack "ACE_personalAidKit";};
		for "_i" from 1 to 5 do {_x addItemToBackpack "adv_aceSplint_splint";};
		for "_i" from 1 to 10 do {_x addItemToBackpack "ACE_tourniquet";};
		for "_i" from 1 to 5 do {_x addItemToBackpack "SmokeShell";};
		_x addHeadgear selectRandom _headgear;

		comment "Add items";
		_x linkItem "ItemMap";
		_x linkItem "ItemCompass";
		_x linkItem "ItemWatch";
		_x linkItem "ItemGPS";

	} forEach _medic;

} forEach Allplayers;



//FADE BACK IN

15 fadesound 1;
cutText ["", "BLACK IN", 10];
sleep 10;

