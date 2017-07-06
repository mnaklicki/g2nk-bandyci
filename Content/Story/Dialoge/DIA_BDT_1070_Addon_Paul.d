//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Addon_Paul_EXIT(C_INFO)
{
	npc             = BDT_1070_Addon_Paul;
	nr              = 999;
	condition	= DIA_Addon_Paul_EXIT_Condition;
	information	= DIA_Addon_Paul_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Addon_Paul_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Paul_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> GoToStaf
//========================================

INSTANCE DIA_Addon_Paul_GoToStaf (C_INFO)
{
   npc          = BDT_1070_Addon_Paul;
   nr           = 1;
   condition    = DIA_Addon_Paul_GoToStaf_Condition;
   information  = DIA_Addon_Paul_GoToStaf_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Paul_GoToStaf_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Thorus_FletcherIsDead))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Paul_GoToStaf_Info()
{
    AI_Output (self, other ,"DIA_Addon_Paul_GoToStaf_03_01"); //Pewnie jesteú g≥odny. Chodü do Snafa.
    AI_Output (other, self ,"DIA_Addon_Paul_GoToStaf_15_02"); //To chyba nie jest dobry pomys≥...
    AI_Output (self, other ,"DIA_Addon_Paul_GoToStaf_03_03"); //Zjesz i zrobisz co zechcesz. 
    AI_Output (other, self ,"DIA_Addon_Paul_GoToStaf_15_04"); //Dobra. Zaraz pogadam ze Snafem.
};

