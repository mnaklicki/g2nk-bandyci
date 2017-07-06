// **********************************************
// B_GiveTradeInventory
// --------------------
// Verteiler. Aufruf aller B_GiveTradeInv-Befehle
// **********************************************

func void B_GiveTradeInv (var C_NPC slf)
{
	var C_NPC Trd_Miguel;		Trd_Miguel		= Hlp_GetNpc (BDT_10022_Addon_Miguel);
	var C_NPC Trd_Huno;			Trd_Huno		= Hlp_GetNpc (BDT_1099_Addon_Huno);			
	var C_NPC Trd_Fisk;			Trd_Fisk		= Hlp_GetNpc (BDT_1097_Addon_Fisk);		
	var C_NPC Trd_Lou;			Trd_Lou			= Hlp_GetNpc (BDT_10318_Lou);		
		
	B_ClearRuneInv (slf);
	
	if (slf.aivar[AIV_ChapterInv] <= Kapitel)
	{
		if  Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Huno)			{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Huno		(slf);};
		if  Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Miguel)		{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Miguel	(slf);};
		if  Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Fisk)		{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Fisk		(slf);};
		if  Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Lou)		{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Lou		(slf);};
	};		
	
	if 	(Npc_IsInState	(slf, ZS_Dead))
	||	(Npc_IsInState	(slf, ZS_Unconscious ))
	{
		if  Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Miguel)			{B_ClearDeadTrader	(slf);};
		if  Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Huno)				{B_ClearDeadTrader	(slf);};
		if  Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Fisk)				{B_ClearDeadTrader	(slf);};
		if  Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Lou)				{B_ClearDeadTrader	(slf);};
	};
};
	
	

