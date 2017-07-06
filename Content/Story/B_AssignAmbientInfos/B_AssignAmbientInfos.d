// *****************************************************
// B_AssignAmbientInfos
// --------------------
// Verteiler. Aufruf aller B_AssignAmbientInfos-Befehle,
// abhängig von Gilde und Geschlecht
// *****************************************************

FUNC VOID B_AssignAmbientInfos (var C_NPC slf)
{
	if (slf.guild == GIL_BDT)
	{			
		if (slf.npctype == NPCTYPE_BL_AMBIENT)
		{								
			if (slf.voice == 1)		{	B_AssignAmbientInfos_Addon_BL_BDT_1 (slf);	};
			if (slf.voice == 13) 	{	B_AssignAmbientInfos_Addon_BL_Bdt_13 (slf);	};
		};
		if (slf.npctype == NPCTYPE_TAL_AMBIENT)
		{
			if (slf.voice == 1)		{	B_AssignAmbientInfos_Addon_TAL_BDT_1 (slf);	};
			if (slf.voice == 13) 	{	B_AssignAmbientInfos_Addon_TAL_BDT_13 (slf);};
		};
	};
	if (slf.guild == GIL_STRF)
	{	
		if (slf.npctype == NPCTYPE_AMBIENT)
		|| (slf.npctype == NPCTYPE_OCAMBIENT)
		{
			if (slf.voice == 1)		{	B_AssignAmbientInfos_Strf_1	(slf);	};	
			if (slf.voice == 13) 	{	B_AssignAmbientInfos_Strf_13 (slf);	};
		};
		//-----Addon Sklaven----
		if (slf.npctype == NPCTYPE_BL_AMBIENT)
		{
			B_AssignAmbientInfos_Addon_Sklaven_3 (slf);
		};
	};
};	