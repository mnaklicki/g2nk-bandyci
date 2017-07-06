//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Addon_Garaz_EXIT(C_INFO)
{
	npc             = BDT_10024_Addon_Garaz;
	nr              = 999;
	condition	= DIA_Addon_Garaz_EXIT_Condition;
	information	= DIA_Addon_Garaz_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Addon_Garaz_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Garaz_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> DontGoThere
//========================================

INSTANCE DIA_Addon_Garaz_DontGoThere (C_INFO)
{
   npc          = BDT_10024_Addon_Garaz;
   nr           = 1;
   condition    = DIA_Addon_Garaz_DontGoThere_Condition;
   information  = DIA_Addon_Garaz_DontGoThere_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Garaz_DontGoThere_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Addon_Garaz_DontGoThere_Info()
{
    AI_Output (self, other ,"DIA_Addon_Garaz_DontGoThere_03_01"); //Nie idŸ tam.
    AI_Output (other, self ,"DIA_Addon_Garaz_DontGoThere_15_02"); //A co siê dzieje?
    AI_Output (self, other ,"DIA_Addon_Garaz_DontGoThere_03_03"); //Pe³zacze. Chyba ca³e gniazdo.
    AI_Output (other, self ,"DIA_Addon_Garaz_DontGoThere_15_04"); //Jesteœ tu sam?
    AI_Output (self, other ,"DIA_Addon_Garaz_DontGoThere_03_05"); //A widzisz kogoœ innego? Kruk nie robi ¿adnych kroków w zwalczeniu ich gniazda.
    AI_Output (self, other ,"DIA_Addon_Garaz_DontGoThere_03_06"); //A ja muszê tu sterczeæ.
    AI_Output (other, self ,"DIA_Addon_Garaz_DontGoThere_15_07"); //Powodzenia w takim razie.
    AI_Output (self, other ,"DIA_Addon_Garaz_DontGoThere_03_08"); //Tak, tak.
};

