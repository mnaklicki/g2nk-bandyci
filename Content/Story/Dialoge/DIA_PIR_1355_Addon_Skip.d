//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Addon_Skip_EXIT(C_INFO)
{
	npc             = PIR_1355_Addon_Skip;
	nr              = 999;
	condition	= DIA_Addon_Skip_EXIT_Condition;
	information	= DIA_Addon_Skip_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Addon_Skip_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Skip_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> FinallyYoureHere
//========================================

INSTANCE DIA_Addon_Skip_FinallyYoureHere (C_INFO)
{
   npc          = PIR_1355_Addon_Skip;
   nr           = 1;
   condition    = DIA_Addon_Skip_FinallyYoureHere_Condition;
   information  = DIA_Addon_Skip_FinallyYoureHere_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Skip_FinallyYoureHere_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Carlos_TalkToSkip))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Skip_FinallyYoureHere_Info()
{
    AI_Output (self, other ,"DIA_Addon_Skip_FinallyYoureHere_03_01"); //No, nareszcie jesteœcie! Macie z³oto?
    AI_Output (other, self ,"DIA_Addon_Skip_FinallyYoureHere_15_02"); //A wy naszych towarzyszy?
    AI_Output (self, other ,"DIA_Addon_Skip_FinallyYoureHere_03_03"); //A ci za nami to co? Œlepy jesteœ?
    AI_Output (other, self ,"DIA_Addon_Skip_FinallyYoureHere_15_04"); //Z³oto ma Carlos. Upewniamy siê tylko.
    AI_Output (self, other ,"DIA_Addon_Skip_FinallyYoureHere_03_05"); //Jasne. Angus, Hank dawajcie ich tutaj!
    AI_Output (self, other ,"DIA_Addon_Skip_FinallyYoureHere_03_06"); //A ty idŸ po z³oto.
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HeresYourGold
//========================================

INSTANCE DIA_Addon_Skip_HeresYourGold (C_INFO)
{
   npc          = PIR_1355_Addon_Skip;
   nr           = 1;
   condition    = DIA_Addon_Skip_HeresYourGold_Condition;
   information  = DIA_Addon_Skip_HeresYourGold_Info;
   permanent	= FALSE;
   description	= "Oto z³oto.";
};

FUNC INT DIA_Addon_Skip_HeresYourGold_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Carlos_NeedToPay))
    && (Npc_HasItems (other, ItSe_Pirates) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Skip_HeresYourGold_Info()
{
    AI_Output (other, self ,"DIA_Addon_Skip_HeresYourGold_15_01"); //Oto z³oto.
    AI_Output (self, other ,"DIA_Addon_Skip_HeresYourGold_03_02"); //Hmm... Wszystko gra, zabierajcie ich st¹d.
    AI_Output (other, self ,"DIA_Addon_Skip_HeresYourGold_15_03"); //Nie przeliczysz?
    AI_Output (self, other ,"DIA_Addon_Skip_HeresYourGold_03_04"); //A powinienem?
    AI_Output (other, self ,"DIA_Addon_Skip_HeresYourGold_15_05"); //Nie.
    AI_Output (self, other ,"DIA_Addon_Skip_HeresYourGold_03_06"); //To po co pytasz? Nastêpna dostawa za kilka dni. Przeka¿ to swoim.

    B_GiveInvItems (other, self, ItSe_Pirates, 1);
    Npc_RemoveInvItems (self, ItSe_Pirates,1); 

    AI_StopProcessInfos	(self);

    Npc_ExchangeRoutine (STRF_1120_Addon_Tonak, "Mine");
    Npc_ExchangeRoutine (STRF_1121_Addon_Telbor, "Mine");
    Npc_ExchangeRoutine (STRF_1119_Addon_Monty, "Mine");
    Npc_ExchangeRoutine (STRF_1122_Addon_Pardos, "Mine");

    Npc_ExchangeRoutine (self, "Start");
    Npc_ExchangeRoutine (PIR_1370_Addon_Angus, "Start");
    Npc_ExchangeRoutine (PIR_1371_Addon_Hank, "Start");
};

