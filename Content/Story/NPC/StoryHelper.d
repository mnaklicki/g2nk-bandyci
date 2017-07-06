/*
//**************************************
//Storyhelper
//**************************************
INSTANCE SH (NPC_DEFAULT)
{
	name 		= "Storyhelper";
	guild 		= GIL_BDT;
	id 			= 9999;
	voice 		= 15;
	flags       = 0 ;																
	npctype		= NPCTYPE_FRIEND ;
	B_SetAttributesToChapter (self, 1);																	
	B_GiveNpcTalents (self);
	fight_tactic		= FAI_HUMAN_MASTER;	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", FACE_N_Player, bodyTex_Player, -1);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	daily_routine 		= Rtn_Start_9999;
};

FUNC VOID Rtn_Start_9999 ()
{	
	TA_Stand_ArmsCrossed(08,00,23,00,"XXX");
    TA_Stand_ArmsCrossed(23,00,08,00,"XXX");
};

instance  StoryHelper_Exit (C_INFO)
{
	npc			=  SH;
	nr			=  999;
	condition	=  StoryHelper_Exit_Condition;
	information	=  StoryHelper_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  StoryHelper_Exit_Condition()
{
	return 1;
};

FUNC VOID  StoryHelper_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

//**************************************************************************
//								KAPITEL 1
//							--------------------
//***************************************************************************
INSTANCE StoryHelper_INFO1 (C_INFO)
{
	npc				= SH;
	condition		= StoryHelper_INFO1_Condition;
	information		= StoryHelper_INFO1_Info;
	important		= 0;
	permanent		= 1;
	description		= "Rozdzia³ 1"; 
};

FUNC INT StoryHelper_INFO1_Condition()
{		
	return TRUE;
};
var int GoToR2;
func VOID StoryHelper_INFO1_Info()
{

	Info_ClearChoices	( StoryHelper_INFO1 );
	Info_AddChoice		( StoryHelper_INFO1, DIALOG_BACK, StoryHelper_BACK1);
	Info_AddChoice		( StoryHelper_INFO1, "Omiñ Rozdzia³ 1.", StoryHelper_GoToR2);
};
//---------------------------------------------------------------------
//	BACK
//---------------------------------------------------------------------
FUNC VOID StoryHelper_BACK1()
{
	Info_ClearChoices	( StoryHelper_INFO1 );
};	
//---------------------------------------------------------------------
//	Kapitelanfang
//---------------------------------------------------------------------
FUNC VOID StoryHelper_GoToR2()
{
	GoToR2 = TRUE;
	AI_StopProcessInfos	( self );
};
//**************************************************************************
//								KAPITEL 2
//							--------------------
//***************************************************************************
INSTANCE StoryHelper_INFO2 (C_INFO)
{
	npc				= SH;
	condition		= StoryHelper_INFO2_Condition;
	information		= StoryHelper_INFO2_Info;
	important		= 0;
	permanent		= 1;
	description		= "Rozdzia³ 2"; 
};

FUNC INT StoryHelper_INFO2_Condition()
{		
	return TRUE;
};

func VOID StoryHelper_INFO2_Info()
{

	Info_ClearChoices	( StoryHelper_INFO2 );
	Info_AddChoice		( StoryHelper_INFO2, DIALOG_BACK			                			, StoryHelper_BACK2);
	Info_AddChoice		( StoryHelper_INFO2, "Bug z zadaniem 'Transport'.", StoryHelper_Transport);
	Info_AddChoice		( StoryHelper_INFO2, "Bug z zadaniem 'Dostaæ siê wy¿ej'.", StoryHelper_MoveUp);
	Info_AddChoice		( StoryHelper_INFO2, "Bug z zadaniem 'Kruk' (piedesta³y).", StoryHelper_Raven);
};
//---------------------------------------------------------------------
//	BACK
//---------------------------------------------------------------------
FUNC VOID StoryHelper_BACK2()
{
	Info_ClearChoices	( StoryHelper_INFO2 );
};	
FUNC VOID StoryHelper_MoveUp()
{
	MIS_Move_up_the_Hierarchy = LOG_SUCCESS;
	AI_StopProcessInfos	( self );
};

FUNC VOID StoryHelper_Transport()
{
	MIS_Transport = LOG_SUCCESS;
	AI_StopProcessInfos	( self );
};
FUNC VOID StoryHelper_Raven()
{
	checkedTemple = TRUE;
    checkedTeleport = TRUE;
	AI_StopProcessInfos	( self );
};

//**************************************************************************
//								KAPITEL 3
//							--------------------
//***************************************************************************
INSTANCE StoryHelper_INFO3 (C_INFO)
{
	npc				= SH;
	condition		= StoryHelper_INFO3_Condition;
	information		= StoryHelper_INFO3_Info;
	important		= 0;
	permanent		= 1;
	description		= "Rozdzia³ 3"; 
};

FUNC INT StoryHelper_INFO3_Condition()
{		
	return TRUE;
};

func VOID StoryHelper_INFO3_Info()
{

	Info_ClearChoices	( StoryHelper_INFO3 );
	Info_AddChoice		( StoryHelper_INFO3, DIALOG_BACK			                			, StoryHelper_BACK3);
	Info_AddChoice		( StoryHelper_INFO3, "Rozpocznij zadanie 'Arvo'."			                			, StoryHelper_Arvo);
	Info_AddChoice		( StoryHelper_INFO3, "Creditsy."			                			, StoryHelper_Credits);
};
//---------------------------------------------------------------------
//	BACK
//---------------------------------------------------------------------
FUNC VOID StoryHelper_BACK3()
{
	Info_ClearChoices	( StoryHelper_INFO3 );
};	
//---------------------------------------------------------------------
//	Kapitelanfang
//---------------------------------------------------------------------
FUNC VOID StoryHelper_Arvo()
{
	MIS_Arvo = LOG_RUNNING;
	Npc_ExchangeRoutine (BDT_10316_Arvo, "Final");
	AI_Teleport (BDT_10316_Arvo, "ADW_CANYON_PATH_TO_BANDITS_06E");
	AI_PrintScreen ("Mo¿esz iœæ od razu do Arvo lub zrobiæ resztê zadania.",  	 -1, 43, FONT_ScreenSmall, 2);
	Info_ClearChoices	( StoryHelper_INFO3 );
	AI_StopProcessInfos	( self );
};

FUNC VOID StoryHelper_Credits()
{
	AI_StopProcessInfos	( self );
	B_Extro_Avi();
};

*/
