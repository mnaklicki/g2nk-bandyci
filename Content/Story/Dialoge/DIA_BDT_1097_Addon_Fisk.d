//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Addon_Fisk_EXIT(C_INFO)
{
	npc             = BDT_1097_Addon_Fisk;
	nr              = 999;
	condition	= DIA_Addon_Fisk_EXIT_Condition;
	information	= DIA_Addon_Fisk_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Addon_Fisk_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Fisk_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WannaEarnSomeMoney
//========================================

INSTANCE DIA_Addon_Fisk_WannaEarnSomeMoney (C_INFO)
{
   npc          = BDT_1097_Addon_Fisk;
   nr           = 1;
   condition    = DIA_Addon_Fisk_WannaEarnSomeMoney_Condition;
   information  = DIA_Addon_Fisk_WannaEarnSomeMoney_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Fisk_WannaEarnSomeMoney_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Fisk_Hello))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Fisk_WannaEarnSomeMoney_Info()
{
    AI_Output (self, other ,"DIA_Addon_Fisk_WannaEarnSomeMoney_03_01"); //Zaczekaj chwilê. Chcesz zarobiæ?
    AI_Output (other, self ,"DIA_Addon_Fisk_WannaEarnSomeMoney_15_02"); //Pewnie.
    AI_Output (self, other ,"DIA_Addon_Fisk_WannaEarnSomeMoney_03_03"); //Œwietnie. PrzejdŸ siê po paru wa¿nych osobach w obozie i niech spisz¹ towary, które s¹ im potrzebne od piratów.
    AI_Output (other, self ,"DIA_Addon_Fisk_WannaEarnSomeMoney_15_04"); //A te osoby to kto?
    AI_Output (self, other ,"DIA_Addon_Fisk_WannaEarnSomeMoney_03_05"); //Przed jedn¹ stoisz. Reszta to kowal Huno, kucharz Snaf, Thorus, handlarz Scatty i szef myœliwych Fletcher.
    AI_Output (other, self ,"DIA_Addon_Fisk_WannaEarnSomeMoney_15_06"); //Dobra. Zabieram siê do roboty.
    AI_Output (self, other ,"DIA_Addon_Fisk_WannaEarnSomeMoney_03_07"); //Poczekaj chwilê.
    B_UseFakeScroll ();
    AI_Output (self, other ,"DIA_Addon_Fisk_WannaEarnSomeMoney_03_08"); //Na tej kartce zapisa³em swoje towary, oni niech równie¿ siê tu dopisz¹.
    AI_Output (self, other ,"DIA_Addon_Fisk_WannaEarnSomeMoney_03_09"); //I niech siê podpisz¹. Bêdzie wiadomo póŸniej co komu rozdaæ.
    AI_Output (other, self ,"DIA_Addon_Fisk_WannaEarnSomeMoney_15_10"); //Nied³ugo wrócê z list¹.
	Npc_ExchangeRoutine  (self,"START");

    MIS_List_of_Goods = LOG_RUNNING;
    Log_CreateTopic            (TOPIC_List_of_Goods, LOG_MISSION);
    Log_SetTopicStatus       (TOPIC_List_of_Goods, LOG_RUNNING);
    B_LogEntry                     (TOPIC_List_of_Goods,"Fisk zleci³ mi abym przeszed³ siê po obozie i spisa³ listê towarów, których potrzebuj¹. S¹ to Huno, Snaf, Thorus, Scatty i Fletcher. D³ugo mi to nie zajmie.");
};

//========================================
//-----------------> GotYourList
//========================================

INSTANCE DIA_Addon_Fisk_GotYourList (C_INFO)
{
   npc          = BDT_1097_Addon_Fisk;
   nr           = 1;
   condition    = DIA_Addon_Fisk_GotYourList_Condition;
   information  = DIA_Addon_Fisk_GotYourList_Info;
   permanent	= FALSE;
   description	= "Mam twoj¹ listê.";
};

FUNC INT DIA_Addon_Fisk_GotYourList_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Fletcher_BroughtList))
    && (Npc_KnowsInfo (other, DIA_Addon_Scatty_BroughtList))
    && (Npc_KnowsInfo (other, DIA_Addon_Thorus_BroughtList))
    && (Npc_KnowsInfo (other, DIA_Addon_Snaf_BroughtList))
    && (Npc_KnowsInfo (other, DIA_Addon_Huno_BroughtList))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Fisk_GotYourList_Info()
{
    AI_Output (other, self ,"DIA_Addon_Fisk_GotYourList_15_01"); //Mam twoj¹ listê.
    AI_Output (self, other ,"DIA_Addon_Fisk_GotYourList_03_02"); //Œwietnie! Niech no na ni¹ spojrzê...
    B_UseFakeScroll ();
    AI_Output (self, other ,"DIA_Addon_Fisk_GotYourList_03_03"); //Hmm...
    AI_Output (self, other ,"DIA_Addon_Fisk_GotYourList_03_04"); //Piraci to za³atwi¹.
    AI_Output (other, self ,"DIA_Addon_Fisk_GotYourList_15_05"); //Co z nagrod¹?
    AI_Output (self, other ,"DIA_Addon_Fisk_GotYourList_03_06"); //A teraz idŸ do Toma.
    AI_Output (other, self ,"DIA_Addon_Fisk_GotYourList_15_07"); //Ale...
    AI_Output (self, other ,"DIA_Addon_Fisk_GotYourList_03_08"); //IdŸ, idŸ. Op³aci ci siê.
    AI_Output (other, self ,"DIA_Addon_Fisk_GotYourList_15_09"); //Jasne.
    B_LogEntry                     (TOPIC_List_of_Goods,"Teraz Fisk odsy³a mnie do Toma. Jestem bardzo ciekaw tej nagrody...");
    CreateInvItems (self, ItWr_ListOfGoods, 1);
    B_GiveInvItems (self, other, ItWr_ListOfGoods, 1);
};

//========================================
//-----------------> DeliveredTheList
//========================================

INSTANCE DIA_Addon_Fisk_DeliveredTheList (C_INFO)
{
   npc          = BDT_1097_Addon_Fisk;
   nr           = 1;
   condition    = DIA_Addon_Fisk_DeliveredTheList_Condition;
   information  = DIA_Addon_Fisk_DeliveredTheList_Info;
   permanent	= FALSE;
   description	= "Zanios³em listê Tomowi. Mówi³, ¿e ju¿ jutro bêdzie.";
};

FUNC INT DIA_Addon_Fisk_DeliveredTheList_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Tom_IHaveTheList))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Fisk_DeliveredTheList_Info()
{
    AI_Output (other, self ,"DIA_Addon_Fisk_DeliveredTheList_15_01"); //Zanios³em listê Tomowi. Mówi³, ¿e ju¿ jutro bêdzie.
    AI_Output (self, other ,"DIA_Addon_Fisk_DeliveredTheList_03_02"); //Znakomicie. Tom to obrotny cz³owiek. Da sobie radê.
    AI_Output (other, self ,"DIA_Addon_Fisk_DeliveredTheList_15_03"); //A co do wynagrodzenia...
    AI_Output (self, other ,"DIA_Addon_Fisk_DeliveredTheList_03_04"); //Widzê do czego zmierzasz.
    AI_Output (self, other ,"DIA_Addon_Fisk_DeliveredTheList_03_05"); //Gdy wróci Tom, dostanê swoje rzeczy. Wœród nich bêdzie pewna broñ.
    AI_Output (self, other ,"DIA_Addon_Fisk_DeliveredTheList_03_06"); //Dostaniesz j¹. Pasuje?
    AI_Output (other, self ,"DIA_Addon_Fisk_DeliveredTheList_15_07"); //No pewnie. Do jutra.
    B_LogEntry                     (TOPIC_List_of_Goods,"Sprawa za³atwiona. Tom wyruszy³ do piratów i zapewne jutro wróci. A wraz z nim moja nowiutka broñ. Ten handel jest bardzo korzystny. Mam nadziejê, ¿e bandyci tego nie zrujnuj¹.");
    Log_SetTopicStatus       (TOPIC_List_of_Goods, LOG_SUCCESS);
    MIS_List_of_Goods = LOG_SUCCESS;
};

//========================================
//-----------------> PackageForYou
//========================================

INSTANCE DIA_Addon_Fisk_PackageForYou (C_INFO)
{
   npc          = BDT_1097_Addon_Fisk;
   nr           = 1;
   condition    = DIA_Addon_Fisk_PackageForYou_Condition;
   information  = DIA_Addon_Fisk_PackageForYou_Info;
   permanent	= FALSE;
   description	= "Zobacz co mam. Paczka od Toma.";
};

FUNC INT DIA_Addon_Fisk_PackageForYou_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Tom_GotThePacks))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Fisk_PackageForYou_Info()
{
    AI_Output (other, self ,"DIA_Addon_Fisk_PackageForYou_15_01"); //Zobacz co mam. Paczka od Toma.
    AI_Output (self, other ,"DIA_Addon_Fisk_PackageForYou_03_02"); //Widzisz. Uda³o mu siê.
    AI_Output (other, self ,"DIA_Addon_Fisk_PackageForYou_15_03"); //A moja nagroda?
    AI_Output (self, other ,"DIA_Addon_Fisk_PackageForYou_03_04"); //WeŸ ten miecz. Bardzo ci siê przyda.
    B_LogEntry                     (TOPIC_Packs_from_Pirates,"Fisk by³ zadowolony. Otrzyma³em od niego tak¿e swoj¹ nagrodê. Ten miecz bardzo mi siê przyda.");
    B_GiveInvItems (other, self, ItMi_Packet_Fisk, 1);
	Npc_RemoveInvItems (self, ItMi_Packet_Fisk,1);
    CreateInvItems (self, ItMw_Schwert1, 1);
    B_GiveInvItems (self, other, ItMw_Schwert1, 1);
};

//========================================
//-----------------> Hello
//========================================

INSTANCE DIA_Addon_Fisk_Hello (C_INFO)
{
   npc          = BDT_1097_Addon_Fisk;
   nr           = 1;
   condition    = DIA_Addon_Fisk_Hello_Condition;
   information  = DIA_Addon_Fisk_Hello_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Fisk_Hello_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Addon_Fisk_Hello_Info()
{
    AI_Output (self, other ,"DIA_Addon_Fisk_Hello_03_01"); //Witaj nieznajomy, nazywam siê Fisk. Jeœli czegoœ potrzebujesz zajrzyj do mnie.
    AI_Output (other, self ,"DIA_Addon_Fisk_Hello_15_02"); //Jestem Vinc. Gdy tylko zajdzie taka potrzeba trafiê do ciebie.
};

//========================================
//-----------------> Trade
//========================================

INSTANCE DIA_Addon_Fisk_Trade (C_INFO)
{
   npc          = BDT_1097_Addon_Fisk;
   nr           = 2;
   condition    = DIA_Addon_Fisk_Trade_Condition;
   information  = DIA_Addon_Fisk_Trade_Info;
   permanent	= TRUE;
   trade        = TRUE;
   description	= "Poka¿ swoje towary.";
};

FUNC INT DIA_Addon_Fisk_Trade_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Fisk_Hello))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Fisk_Trade_Info()
{
    AI_Output (other, self ,"DIA_Addon_Fisk_Trade_15_01"); //Poka¿ swoje towary.
    AI_Output (self, other ,"DIA_Addon_Fisk_Trade_03_02"); //Pewnie.
    B_GiveTradeInv (self);
};

