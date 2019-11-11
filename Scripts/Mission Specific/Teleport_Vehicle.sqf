//POPES TELEPORT VEHICLE SCRIPT

if (!isServer) exitwith {};

15 fadesound 0;
cutText ["", "BLACK OUT", 4];
sleep 5;
skipTime 10.5;
sleep 1;
truck_01 setPosATL getmarkerPos "tele_01";
truck_01 setDir 48;
truck_02 setPosATL getmarkerPos "tele_02";
truck_02 setDir 48;
15 fadesound 1;
cutText ["Several hours later...", "BLACK IN", 8];
sleep 15;