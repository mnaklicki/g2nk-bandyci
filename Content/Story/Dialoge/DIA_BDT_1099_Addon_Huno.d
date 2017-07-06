//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Addon_Huno_EXIT(C_INFO)
{
	npc             = BDT_1099_Addon_Huno;
	nr              = 999;
	condition	= DIA_Addon_Huno_EXIT_Condition;
	information	= DIA_Addon_Huno_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Addon_Huno_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Huno_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//----------------------------------------------------------------------
//	Info Trade
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Huno_Trade  (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 888;
	condition   = DIA_Addon_Huno_Trade_Condition;
	information = DIA_Addon_Huno_Trade_Info;
	permanent   = TRUE;
	trade		= TRUE;
	description = DIALOG_TRADE;
};
FUNC INT DIA_Addon_Huno_Trade_Condition()
{		
	return TRUE;
};
FUNC VOID DIA_Addon_Huno_Trade_Info()
{	
	AI_Output (other, self ,"DIA_Addon_Huno_Trade_15_01"); //Poka¿ mi, co masz.
	B_GiveTradeInv(self);
};

//========================================
//-----------------> BroughtList
//========================================

INSTANCE DIA_Addon_Huno_BroughtList (C_INFO)
{
   npc          = BDT_1099_Addon_Huno;
   nr           = 1;
   condition    = DIA_Addon_Huno_BroughtList_Condition;
   information  = DIA_Addon_Huno_BroughtList_Info;
   permanent	= FALSE;
   description	= "Przychodzê z list¹ od Fiska. Prosi³, abyœ siê w niej podpisa³.";
};

FUNC INT DIA_Addon_Huno_BroughtList_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Fisk_WannaEarnSomeMoney))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Huno_BroughtList_Info()
{
    AI_Output (other, self ,"DIA_Addon_Huno_BroughtList_15_01"); //Przychodzê z list¹ od Fiska. Prosi³, abyœ siê w niej podpisa³.
    AI_Output (self, other ,"DIA_Addon_Huno_BroughtList_03_02"); //Œwietnie. Daj mi j¹ tutaj.
    B_UseFakeScroll ();
    AI_Output (self, other ,"DIA_Addon_Huno_BroughtList_03_03"); //Proszê. To mi siê przyda.
    AI_Output (other, self ,"DIA_Addon_Huno_BroughtList_15_04"); //Nie przeszkadzam.
    AI_Output (self, other ,"DIA_Addon_Huno_BroughtList_03_05"); //Do zobaczenia.
    B_LogEntry                     (TOPIC_List_of_Goods,"Huno wpisa³ siê do listy.");
};

//========================================
//-----------------> PackageForYou
//========================================

INSTANCE DIA_Addon_Huno_PackageForYou (C_INFO)
{
   npc          = BDT_1099_Addon_Huno;
   nr           = 1;
   condition    = DIA_Addon_Huno_PackageForYou_Condition;
   information  = DIA_Addon_Huno_PackageForYou_Info;
   permanent	= FALSE;
   description	= "Prêty prosto od piratów.";
};

FUNC INT DIA_Addon_Huno_PackageForYou_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Tom_GotThePacks))
    && (Npc_HasItems (other, ItMi_Packet_Huno) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Huno_PackageForYou_Info()
{
    AI_Output (other, self ,"DIA_Addon_Huno_PackageForYou_15_01"); //Prêty prosto od piratów.
    AI_Output (self, other ,"DIA_Addon_Huno_PackageForYou_03_02"); //Mam nadziejê, ¿e to wystarczy. W przeciwnym razie Tom znowu bêdzie musia³ to za³atwiæ.
    B_LogEntry                     (TOPIC_Packs_from_Pirates,"Huno nie podziêkowa³ i zmartwi³ siê czy, aby na pewno wystarczy mu prêtów.");
    B_GiveInvItems (other, self, ItMi_Packet_Huno, 1);
	Npc_RemoveInvItems (self, ItMi_Packet_Huno,1);
};

//========================================
//-----------------> NeedBetterArmour
//========================================

INSTANCE DIA_Addon_Huno_NeedBetterArmour (C_INFO)
{
   npc          = BDT_1099_Addon_Huno;
   nr           = 1;
   condition    = DIA_Addon_Huno_NeedBetterArmour_Condition;
   information  = DIA_Addon_Huno_NeedBetterArmour_Info;
   permanent	= FALSE;
   description	= "Przychodzê po lepszy pancerz.";
};

FUNC INT DIA_Addon_Huno_NeedBetterArmour_Condition()
{
    if (GetNewArmour == TRUE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Huno_NeedBetterArmour_Info()
{
    AI_Output (other, self ,"DIA_Addon_Huno_NeedBetterArmour_15_01"); //Przychodzê po lepszy pancerz.
    AI_Output (self, other ,"DIA_Addon_Huno_NeedBetterArmour_03_02"); //To ciê bêdzie kosztowaæ...
    AI_Output (other, self ,"DIA_Addon_Huno_NeedBetterArmour_15_03"); //Przysy³a mnie Fletcher.
    AI_Output (self, other ,"DIA_Addon_Huno_NeedBetterArmour_03_04"); //Czy¿by? W takim razie zap³aæ mi 500 sztuk z³ota i masz pancerz.
};

//========================================
//-----------------> GoldForArmour
//========================================

INSTANCE DIA_Addon_Huno_GoldForArmour (C_INFO)
{
   npc          = BDT_1099_Addon_Huno;
   nr           = 2;
   condition    = DIA_Addon_Huno_GoldForArmour_Condition;
   information  = DIA_Addon_Huno_GoldForArmour_Info;
   permanent	= FALSE;
   description	= "Oto z³oto.";
};

FUNC INT DIA_Addon_Huno_GoldForArmour_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Huno_NeedBetterArmour))
    && (Npc_HasItems (other, ItMi_Gold) >=500)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Huno_GoldForArmour_Info()
{
    AI_Output (other, self ,"DIA_Addon_Huno_GoldForArmour_15_01"); //Oto z³oto.
    AI_Output (self, other ,"DIA_Addon_Huno_GoldForArmour_03_02"); //Trzymaj. Co prawda te pancerze nosi³y te gnidy z Nowego Obozu, ale to ju¿ przesz³oœæ.
    AI_Output (self, other ,"DIA_Addon_Huno_GoldForArmour_03_03"); //Zreszt¹ nie mam nawet planów pancerzy Starego Obozu...
    AI_Output (other, self ,"DIA_Addon_Huno_GoldForArmour_15_04"); //Do zobaczenia.
	Wld_InsertNpc (BDT_1090_Addon_Raven ,"BL_MINE_RAVEN");
    B_GiveInvItems (other, self, ItMi_Gold, 500);
    CreateInvItems (other, ITAR_BDT_H, 1);
    B_LogEntry                     (TOPIC_Better_Armour,"Kupi³em pancerz od Huno. Czas zacz¹æ prace u tego Kruka i jego jak¿e mi³ego s³ugi Bloodwyna.");
    Log_SetTopicStatus       (TOPIC_Better_Armour, LOG_SUCCESS);
    MIS_Better_Armour = LOG_SUCCESS;
};

//========================================
//-----------------> Hello
//========================================

INSTANCE DIA_Addon_Huno_Hello (C_INFO)
{
   npc          = BDT_1099_Addon_Huno;
   nr           = 1;
   condition    = DIA_Addon_Huno_Hello_Condition;
   information  = DIA_Addon_Huno_Hello_Info;
   permanent	= FALSE;
   description	= "Witaj kowalu.";
};

FUNC INT DIA_Addon_Huno_Hello_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Addon_Huno_Hello_Info()
{
    AI_Output (other, self ,"DIA_Addon_Huno_Hello_15_01"); //Witaj kowalu.
    AI_Output (self, other ,"DIA_Addon_Huno_Hello_03_02"); //Hmm, witaj. Jestem Huno. Mo¿e i bym pogada³, ale zajêty jestem.
    AI_Output (other, self ,"DIA_Addon_Huno_Hello_15_03"); //Jestem Vinc. Nie bêdê przeszkadza³.
    AI_Output (self, other ,"DIA_Addon_Huno_Hello_03_04"); //Masz racjê, bo naprawiam i wytwarzam przedmioty potrzebne do obozu.
};

//========================================
//-----------------> WhatsUp
//========================================

INSTANCE DIA_Addon_Huno_WhatsUp (C_INFO)
{
   npc          = BDT_1099_Addon_Huno;
   nr           = 2;
   condition    = DIA_Addon_Huno_WhatsUp_Condition;
   information  = DIA_Addon_Huno_WhatsUp_Info;
   permanent	= FALSE;
   description	= "Co s³ychaæ?";
};

FUNC INT DIA_Addon_Huno_WhatsUp_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Huno_Hello))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Huno_WhatsUp_Info()
{
    AI_Output (other, self ,"DIA_Addon_Huno_WhatsUp_15_01"); //Co s³ychaæ?
    AI_Output (self, other ,"DIA_Addon_Huno_WhatsUp_03_02"); //Widzisz jak jest. Miecz, topór, kilof – wszystko wymaga naostrzenia lub ponownego przekucia.
};

//========================================
//-----------------> NeedAPickaxe
//========================================

INSTANCE DIA_Addon_Huno_NeedAPickaxe (C_INFO)
{
   npc          = BDT_1099_Addon_Huno;
   nr           = 1;
   condition    = DIA_Addon_Huno_NeedAPickaxe_Condition;
   information  = DIA_Addon_Huno_NeedAPickaxe_Info;
   permanent	= FALSE;
   description	= "Potrzebujê kilofa. Masz jakiœ na stanie?";
};

FUNC INT DIA_Addon_Huno_NeedAPickaxe_Condition()
{
    if (MIS_Move_up_the_Hierarchy == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Huno_NeedAPickaxe_Info()
{
    AI_Output (other, self ,"DIA_Addon_Huno_NeedAPickaxe_15_01"); //Potrzebujê kilofa. Masz jakiœ na stanie?
    AI_Output (self, other ,"DIA_Addon_Huno_NeedAPickaxe_03_02"); //Co za dziwne pytanie. Pewnie, ¿e mam. 50 sztuk z³ota i jest twój.
};

//========================================
//-----------------> HeresTheGold
//========================================

INSTANCE DIA_Addon_Huno_HeresTheGold (C_INFO)
{
   npc          = BDT_1099_Addon_Huno;
   nr           = 2;
   condition    = DIA_Addon_Huno_HeresTheGold_Condition;
   information  = DIA_Addon_Huno_HeresTheGold_Info;
   permanent	= FALSE;
   description	= "Bierz to z³oto.";
};

FUNC INT DIA_Addon_Huno_HeresTheGold_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Huno_NeedAPickaxe))
    && (Npc_HasItems (other, ItMi_Gold) >=50)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Huno_HeresTheGold_Info()
{
    AI_Output (other, self ,"DIA_Addon_Huno_HeresTheGold_15_01"); //Bierz to z³oto.
    AI_Output (self, other ,"DIA_Addon_Huno_HeresTheGold_03_02"); //A oto i nowiutki kilof. Niech ci s³u¿y.
    B_GiveInvItems (other, self, ItMi_Gold, 50);
    CreateInvItems (self, ItMw_2H_Axe_L_01, 1);
    B_GiveInvItems (self, other, ItMw_2H_Axe_L_01, 1);
};

