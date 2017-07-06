//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Addon_Ramon_EXIT(C_INFO)
{
	npc             = BDT_1071_Addon_Ramon;
	nr              = 999;
	condition	= DIA_Addon_Ramon_EXIT_Condition;
	information	= DIA_Addon_Ramon_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Addon_Ramon_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Ramon_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WhoAreYou
//========================================

INSTANCE DIA_Addon_Ramon_WhoAreYou (C_INFO)
{
   npc          = BDT_1071_Addon_Ramon;
   nr           = 1;
   condition    = DIA_Addon_Ramon_WhoAreYou_Condition;
   information  = DIA_Addon_Ramon_WhoAreYou_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Addon_Ramon_WhoAreYou_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Fletcher_WELCOME))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Ramon_WhoAreYou_Info()
{
    AI_Output (other, self ,"DIA_Addon_Ramon_WhoAreYou_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Addon_Ramon_WhoAreYou_03_02"); //A bo co?

    Info_ClearChoices		(DIA_Addon_Ramon_WhoAreYou);
    Info_AddChoice		(DIA_Addon_Ramon_WhoAreYou, "Pyta³em kim jesteœ.", DIA_Addon_Ramon_WhoAreYou_IAsked);
    Info_AddChoice		(DIA_Addon_Ramon_WhoAreYou, "Bo Fletcher szuka ludzi do pracy.", DIA_Addon_Ramon_WhoAreYou_LookingForWorkers);
};

FUNC VOID DIA_Addon_Ramon_WhoAreYou_IAsked()
{
    AI_Output (other, self ,"DIA_Addon_Ramon_WhoAreYou_IAsked_15_01"); //Pyta³em kim jesteœ.
    AI_Output (self, other ,"DIA_Addon_Ramon_WhoAreYou_IAsked_03_02"); //Ch³optasiu, lepiej siê uspokój. Jestem Ramon, a ty?
    AI_Output (other, self ,"DIA_Addon_Ramon_WhoAreYou_IAsked_15_03"); //Vinc. Fletcher nied³ugo da ci robotê.
    AI_Output (self, other ,"DIA_Addon_Ramon_WhoAreYou_IAsked_03_04"); //Œwietnie. Zaczynam siê nudziæ. A teraz daj mi spokój.
    Info_ClearChoices		(DIA_Addon_Ramon_WhoAreYou);
    AI_StopProcessInfos	(self);
    B_LogEntry                     (TOPIC_Report,"''Znajomoœæ'' z Ramonem mam ju¿ za sob¹. Niezbyt uprzejmy goœæ, dla tego lepiej darujê sobie przyjemnoœæ przeprowadzenia z nim d³u¿szych konwersacji. Przynajmniej on chce jak¹œ robotê, szef siê ucieszy.");
};

FUNC VOID DIA_Addon_Ramon_WhoAreYou_LookingForWorkers()
{
    AI_Output (other, self ,"DIA_Addon_Ramon_WhoAreYou_LookingForWorkers_15_01"); //Bo Fletcher szuka ludzi do pracy.
    AI_Output (self, other ,"DIA_Addon_Ramon_WhoAreYou_LookingForWorkers_03_02"); //Aaa, Fletcher. Dobra, jestem gotowy.
    AI_Output (other, self ,"DIA_Addon_Ramon_WhoAreYou_LookingForWorkers_15_03"); //Ekhem.
    AI_Output (self, other ,"DIA_Addon_Ramon_WhoAreYou_LookingForWorkers_03_04"); //Ramon. A teraz sp³ywaj st¹d.
    B_LogEntry                     (TOPIC_Report,"''Znajomoœæ'' z Ramonem mam ju¿ za sob¹. Niezbyt uprzejmy goœæ, dla tego lepiej darujê sobie przyjemnoœæ przeprowadzenia z nim d³u¿szych konwersacji. Przynajmniej on chce jak¹œ robotê, szef siê ucieszy.");
    Info_ClearChoices		(DIA_Addon_Ramon_WhoAreYou);
    AI_StopProcessInfos	(self);
};

// ************************************************************
// 				  	Guard_Passage - First Warn
// ************************************************************

// -----------------------------------------------------------
	const string BDT_1071_Checkpoint	= "BL_UP_CHECK";	
// -----------------------------------------------------------
	
instance DIA_Addon_Ramon_FirstWarn (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 1;
	condition	= DIA_Addon_Ramon_FirstWarn_Condition;
	information	= DIA_Addon_Ramon_FirstWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

func int DIA_Addon_Ramon_FirstWarn_Condition()
{
	if (Npc_GetDistToWP(other, BDT_1071_Checkpoint) <= 700) //NICHT von hinten!
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_NONE		)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE		)
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE			)
	&&  (Npc_RefuseTalk(self) 							== FALSE 		)
	&&  (!Npc_KnowsInfo (other, DIA_Fletcher_GoodNews)))
	{
		return TRUE;
	};
};
func void DIA_Addon_Ramon_FirstWarn_Info()
{
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_19"); //Hej, stój! Nie wejdziesz tam, wiêc zje¿d¿aj.
				
	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP(other,BDT_1071_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_FirstWarnGiven;
};
// ************************************************************
// 				  	Guard_Passage - Second Warn
// ************************************************************

INSTANCE DIA_Addon_Ramon_SecondWarn (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 2;
	condition	= DIA_Addon_Ramon_SecondWarn_Condition;
	information	= DIA_Addon_Ramon_SecondWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT DIA_Addon_Ramon_SecondWarn_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_FirstWarnGiven					)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE								) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE									)
	&&  (Npc_GetDistToWP(other,BDT_1071_Checkpoint)		<  (other.aivar[AIV_LastDistToWP]-50)	)
	&&  (!Npc_KnowsInfo (other, DIA_Fletcher_GoodNews))) 
	{
		return TRUE;
	};
};

func void DIA_Addon_Ramon_SecondWarn_Info()
{
	AI_Output (self, other,"DIA_Addon_Ramon_SecondWarn_07_00"); //Zrób jeszcze jeden krok bli¿ej, a bêdzie to twój ostatni!

	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP (other,BDT_1071_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_SecondWarnGiven;	
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 				  	Guard_Passage - Attack
// ************************************************************

INSTANCE DIA_Addon_Ramon_Attack (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 3;
	condition	= DIA_Addon_Ramon_Attack_Condition;
	information	= DIA_Addon_Ramon_Attack_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT DIA_Addon_Ramon_Attack_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_SecondWarnGiven					)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE								) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE									)
	&&  (Npc_GetDistToWP(other,BDT_1071_Checkpoint)		<  (other.aivar[AIV_LastDistToWP]-50)	)
	&&  (!Npc_KnowsInfo (other, DIA_Fletcher_GoodNews)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Ramon_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] 			= 0;
	self.aivar[AIV_Guardpassage_Status]	= GP_NONE;						//wird auch in ZS_Attack resettet
	
	AI_Output (self, other,"DIA_Addon_Ramon_Attack_07_00"); //Niektórzy nigdy siê nie naucz¹...
	
	AI_StopProcessInfos	(self);
	B_Attack (self, other, AR_GuardStopsIntruder, 0); 
};
