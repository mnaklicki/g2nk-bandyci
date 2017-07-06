//*******************************
//			NPC Globals
//*******************************

//*******************************************************
//			NPC Globals füllen
//*******************************************************
var C_NPC Skinner;

func void  B_InitNpcGlobals ()
{
	Skinner = Hlp_GetNpc (BDT_1082_Addon_Skinner);
 	// **********************
 	if (Kapitel == 0)
	{
		Kapitel = 1; //HACK - wenn man mal wieder Xardas nicht anquatscht...
	};
	// **********************
};
