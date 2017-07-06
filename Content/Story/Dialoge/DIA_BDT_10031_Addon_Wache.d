//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Addon_Wache_EXIT(C_INFO)
{
	npc             = BDT_10031_Addon_Wache;
	nr              = 999;
	condition	= DIA_Addon_Wache_EXIT_Condition;
	information	= DIA_Addon_Wache_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Addon_Wache_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Wache_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> GoingToMine
//========================================

INSTANCE DIA_Addon_Wache_GoingToMine (C_INFO)
{
   npc          = BDT_10031_Addon_Wache;
   nr           = 1;
   condition    = DIA_Addon_Wache_GoingToMine_Condition;
   information  = DIA_Addon_Wache_GoingToMine_Info;
   permanent	= FALSE;
   important	= TRUE;
   description	= "Idziesz do kopalni, co?";
};

FUNC INT DIA_Addon_Wache_GoingToMine_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Addon_Wache_GoingToMine_Info()
{
    AI_Output (self, other ,"DIA_Addon_Wache_GoingToMine_15_01"); //Idziesz do kopalni, co?
    AI_Output (other, self ,"DIA_Addon_Wache_GoingToMine_03_02"); //Mo¿e. Jakieœ rady?
    AI_Output (self, other ,"DIA_Addon_Wache_GoingToMine_15_03"); //Dobry kilof i worek na samorodki. I uwa¿aj na pe³zacze.
    AI_Output (other, self ,"DIA_Addon_Wache_GoingToMine_03_04"); //Pe³zacze?
    AI_Output (self, other ,"DIA_Addon_Wache_GoingToMine_15_05"); //Bardzo niebezpieczne stworzenia. Bierz nogi za pas jak jakiegoœ zobaczysz.
};

//========================================
//-----------------> WhatsUp
//========================================

INSTANCE DIA_Addon_Wache_WhatsUp (C_INFO)
{
   npc          = BDT_10031_Addon_Wache;
   nr           = 2;
   condition    = DIA_Addon_Wache_WhatsUp_Condition;
   information  = DIA_Addon_Wache_WhatsUp_Info;
   permanent	= TRUE;
   description	= "Co s³ychaæ?";
};

FUNC INT DIA_Addon_Wache_WhatsUp_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Wache_GoingToMine))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Wache_WhatsUp_Info()
{
    AI_Output (other, self ,"DIA_Addon_Wache_WhatsUp_15_01"); //Co s³ychaæ?
    AI_Output (self, other ,"DIA_Addon_Wache_WhatsUp_03_02"); //Zale¿y gdzie przy³o¿ysz ucho. Oprócz tego ca³kowita nuda.
};

