//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Alvaro_EXIT(C_INFO)
{
	npc             = BDT_10019_Alvaro;
	nr              = 999;
	condition	= DIA_Alvaro_EXIT_Condition;
	information	= DIA_Alvaro_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Alvaro_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Alvaro_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 				  	Guard_Passage - First Warn
// ************************************************************

// -----------------------------------------------------------
	const string BDT_10019_Checkpoint	= "ADW_MINE_TO_GRUFT_02";	
// -----------------------------------------------------------
	
instance DIA_Alvaro_FirstWarn (C_INFO)
{
	npc			= BDT_10019_Alvaro;
	nr			= 1;
	condition	= DIA_Alvaro_FirstWarn_Condition;
	information	= DIA_Alvaro_FirstWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

func int DIA_Alvaro_FirstWarn_Condition()
{
	if (Npc_GetDistToWP(other, BDT_10019_Checkpoint) <= 700) //NICHT von hinten!
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_NONE		)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE		)
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE			)
	&&  (Npc_RefuseTalk(self) 							== FALSE 		)
	&&  (!Npc_KnowsInfo (other, DIA_Addon_Raven_StartAttack)))
	{
		return TRUE;
	};
};
func void DIA_Alvaro_FirstWarn_Info()
{
	AI_Output (self, other,"DIA_Alvaro_FirstWarn_07_19"); //Stój! Nikt tam nie wejdzie bez pozwolenia Kruka.
	AI_StopProcessInfos(self);
				
	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP(other,BDT_10019_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_FirstWarnGiven;
};
// ************************************************************
// 				  	Guard_Passage - Second Warn
// ************************************************************

INSTANCE DIA_Alvaro_SecondWarn (C_INFO)
{
	npc			= BDT_10019_Alvaro;
	nr			= 2;
	condition	= DIA_Alvaro_SecondWarn_Condition;
	information	= DIA_Alvaro_SecondWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT DIA_Alvaro_SecondWarn_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_FirstWarnGiven					)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE								) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE									)
	&&  (Npc_GetDistToWP(other,BDT_10019_Checkpoint)		<  (other.aivar[AIV_LastDistToWP]-50)	)
	&&  (!Npc_KnowsInfo (other, DIA_Addon_Raven_StartAttack))) 
	{
		return TRUE;
	};
};

func void DIA_Alvaro_SecondWarn_Info()
{
	AI_Output (self, other,"DIA_Alvaro_SecondWarn_07_00"); //Zrób jeszcze jeden krok bli¿ej, a bêdzie to twój ostatni!

	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP (other,BDT_10019_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_SecondWarnGiven;	
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 				  	Guard_Passage - Attack
// ************************************************************

INSTANCE DIA_Alvaro_Attack (C_INFO)
{
	npc			= BDT_10019_Alvaro;
	nr			= 3;
	condition	= DIA_Alvaro_Attack_Condition;
	information	= DIA_Alvaro_Attack_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT DIA_Alvaro_Attack_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_SecondWarnGiven					)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE								) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE									)
	&&  (Npc_GetDistToWP(other,BDT_10019_Checkpoint)		<  (other.aivar[AIV_LastDistToWP]-50)	)
	&&  (!Npc_KnowsInfo (other, DIA_Addon_Raven_StartAttack)))
	{
		return TRUE;
	};
};

func void DIA_Alvaro_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] 			= 0;
	self.aivar[AIV_Guardpassage_Status]	= GP_NONE;						//wird auch in ZS_Attack resettet
	
	AI_Output (self, other,"DIA_Alvaro_Attack_07_00"); //Pope³ni³eœ wielki b³¹d.
	
	AI_StopProcessInfos	(self);
	B_Attack (self, other, AR_GuardStopsIntruder, 0); 
};
