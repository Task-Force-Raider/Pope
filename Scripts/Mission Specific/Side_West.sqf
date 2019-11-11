//POPES QUICK CHANGE LOADOUT SCRIPT

if (!isServer) exitwith {};

//FADE OUT WHILE CHANGING GEAR


15 fadesound 0;
cutText ["", "BLACK OUT", 3];
sleep 4;
skipTime 0.5;
sleep 1;

private ["_playerArray", "_players", "_uniform", "_headgear", "_backpack", "_vest", "_randomWeapon"];

//ROLE POOLS - PLACE VARIABLE NAMES FOR PLAYER ROLES IN THE APPROPRIATE ARRAY

_marksman =		[Marksman_01, Marksman_02, Marksman_03, Marksman_04];
_medic = 		[Medic_01, Medic_02, Medic_03, Medic_04];


//WEAPON AND AMMO POOLS


_randomWeapon =	 selectRandom [
									["rhs_weap_m4a1_carryhandle", "rhsusf_acc_anpeq15_bk_top", "rhsusf_acc_eotech_552", "rhsusf_acc_rvg_blk", "", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], 
									["rhs_weap_m16a4_imod", "rhsusf_acc_tdstubby_blk", "rhsusf_acc_wmx_bk", "rhsusf_acc_ACOG_RMR", "", "rhs_mag_30Rnd_556x45_Mk318_PMAG"]
							  ];

_randomWeapon params ["_weapon", "_attachment_01", "_attachment_02", "_attachment_03", "_attachment_04", "_magazines"];


//ITEM POOLS


_uniform = 		["U_I_L_Uniform_01_tshirt_black_F","U_BG_Guerilla2_2","U_BG_Guerilla2_1","U_BG_Guerilla2_3","USP_CRYE_G3C_CUT_BLK_AOR1","milgp_u_tshirt_g3_field_pants_rgr","U_I_C_Soldier_Bandit_2_F"];
_headgear = 	["rhsusf_opscore_bk_pelt","USP_OPS_FASTXP_CU"];
_backpack = 	["B_AssaultPack_blk"];
_vest = 		["USP_VEST_STRANDHOGG"];



//SELECT PLAYERS


_playerArray = [];

_players = {_playerArray pushback _x} forEach allPlayers;


//SET PLAYERS TO NOT-CAPTIVE


{_x setCaptive false} forEach allPlayers;


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
		_x addItemToVest "ACE_CableTie";
		_x addItemToBackpack "NVGoggles_OPFOR";
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
		_x addItemToVest "ACE_CableTie";
		_x addItemToBackpack "NVGoggles_OPFOR";
		_x addHeadgear selectRandom _headgear;

		comment "Add items";
		_x linkItem "ItemMap";
		_x linkItem "ItemCompass";
		_x linkItem "ItemWatch";
		_x linkItem "ItemGPS";


	};

	if (_x == Pope_01) then

	{


		comment "Remove existing items";
		removeAllWeapons Pope_01;
		removeAllItems Pope_01;
		removeAllAssignedItems Pope_01;
		removeUniform Pope_01;
		removeVest Pope_01;
		removeBackpack Pope_01;
		removeHeadgear Pope_01;
		removeGoggles Pope_01;

		comment "Add weapons";
		Pope_01 addWeapon "rhs_weap_m16a4_imod";
		Pope_01 addPrimaryWeaponItem "rhsusf_acc_wmx_bk";
		Pope_01 addPrimaryWeaponItem "rhsusf_acc_ACOG_RMR";
		Pope_01 addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk318_PMAG";
		Pope_01 addPrimaryWeaponItem "rhsusf_acc_tdstubby_blk";
		Pope_01 addWeapon "rhsusf_weap_m1911a1";
		Pope_01 addHandgunItem "rhsusf_mag_7x45acp_MHP";

		comment "Add containers";
		Pope_01 forceAddUniform "U_BG_Guerilla2_2";
		Pope_01 addVest "USP_CRYE_CPC_FAST";
		Pope_01 addBackpack "milgp_bp_hydration_cb";

		comment "Add items to containers";
		Pope_01 addItemToUniform "ACRE_PRC152";
		Pope_01 addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 14 do {Pope_01 addItemToUniform "ACE_fieldDressing";};
		Pope_01 addItemToVest "ACE_elasticBandage";
		for "_i" from 1 to 5 do {Pope_01 addItemToVest "ACE_quikclot";};
		Pope_01 addItemToVest "ACE_microDAGR";
		Pope_01 addItemToVest "ACE_Flashlight_XL50";
		for "_i" from 1 to 5 do {Pope_01 addItemToVest "ACE_morphine";};
		for "_i" from 1 to 2 do {Pope_01 addItemToVest "ACE_epinephrine";};
		for "_i" from 1 to 5 do {Pope_01 addItemToVest "ACE_packingBandage";};
		Pope_01 addItemToVest "ACE_personalAidKit";
		Pope_01 addItemToVest "adv_aceSplint_splint";
		Pope_01 addItemToVest "ACE_CableTie";
		for "_i" from 1 to 5 do {Pope_01 addItemToVest "UK3CB_BAF_SmokeShell";};
		for "_i" from 1 to 2 do {Pope_01 addItemToVest "SmokeShellRed";};
		for "_i" from 1 to 5 do {Pope_01 addItemToVest "ACE_M84";};
		for "_i" from 1 to 2 do {Pope_01 addItemToVest "MiniGrenade";};
		for "_i" from 1 to 10 do {Pope_01 addItemToVest "rhs_mag_30Rnd_556x45_Mk318_PMAG";};
		Pope_01 addItemToBackpack "NVGoggles_OPFOR";
		Pope_01 addHeadgear "USP_BASEBALL_CAP_KHK_C";
		Pope_01 addGoggles "G_Spectacles";

		comment "Add items";
		Pope_01 linkItem "ItemMap";
		Pope_01 linkItem "ItemCompass";
		Pope_01 linkItem "ItemWatch";
		Pope_01 linkItem "ItemGPS";



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

		_x addWeapon "rhs_weap_sr25_ec_d";
		_x addPrimaryWeaponItem "rhsgref_sdn6_suppressor";
		_x addPrimaryWeaponItem "rhsusf_acc_M8541_mrds";
		_x addPrimaryWeaponItem "rhsusf_20Rnd_762x51_SR25_m118_special_Mag";
		_x addPrimaryWeaponItem "bipod_01_F_blk";

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
		_x addItemToBackpack "rhsusf_acc_premier_anpvs27";
		for "_i" from 1 to 10 do {_x addItemToUniform "ACE_packingBandage";};
		for "_i" from 1 to 2 do {_x addItemToUniform "adv_aceSplint_splint";};
		for "_i" from 1 to 5 do {_x addItemToUniform "ACE_elasticBandage";};
		for "_i" from 1 to 15 do {_x addItemToVest "rhsusf_20Rnd_762x51_SR25_m118_special_Mag";};
		_x addHeadgear selectRandom _headgear;
		_x addItemToBackpack "NVGoggles_OPFOR";

		comment "Add items";
		_x linkItem "ItemMap";
		_x linkItem "ItemCompass";
		_x linkItem "ItemWatch";
		_x linkItem "ItemGPS";


	} forEach _marksman;

}forEach allPlayers;

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
		_x addItemToBackpack "NVGoggles_OPFOR";

		comment "Add items";
		_x linkItem "ItemMap";
		_x linkItem "ItemCompass";
		_x linkItem "ItemWatch";
		_x linkItem "ItemGPS";

	} forEach _medic;


} forEach allPlayers;
						


15 fadesound 1;
cutText ["", "BLACK IN", 10];
sleep 10;

