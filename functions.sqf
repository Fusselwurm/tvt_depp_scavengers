//* BLUFOR
//	* PRIM Opfor-Einheiten töten
//* OPFOR
//	* PRIM 30' in Basis aushalten
//	* SEC  exfiltrieren aufs Meer
	
	
getPosById = {
   xx = [0,0,0] nearestObject 24307; pos = getPos xx;  "Box_East_Wps_F" createVehicle pos;
};
	