//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Malcom_EXIT(C_INFO)
{
	npc             = PIR_1368_Addon_Malcom;
	nr              = 999;
	condition	= DIA_Malcom_EXIT_Condition;
	information	= DIA_Malcom_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Malcom_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Malcom_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 				  	Guard_Passage - First Warn
// ************************************************************

// -----------------------------------------------------------
	const string Malcom_Checkpoint	= "FP_ROAM_ADW_ENTRANCE_2_PIRATECAMP_13_03";	
// -----------------------------------------------------------
	
instance DIA_Malcom_FirstWarn (C_INFO)
{
	npc			= PIR_1368_Addon_Malcom;
	nr			= 1;
	condition	= DIA_Malcom_FirstWarn_Condition;
	information	= DIA_Malcom_FirstWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

func int DIA_Malcom_FirstWarn_Condition()
{	
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_NONE		)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE		)
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE			)
	&&  (Npc_RefuseTalk(self) 							== FALSE 		))
	{
		return TRUE;
	};
};
func void DIA_Malcom_FirstWarn_Info()
{
	AI_Output (self, other,"DIA_Malcom_FirstWarn_07_19"); //Stój! To nasz teren, bandyto. Ty tu nie wejdziesz.
	AI_StopProcessInfos(self);
	AI_GotoWP 				(PC_HERO, "ADW_ENTRANCE_2_PIRATECAMP_11" );
};
