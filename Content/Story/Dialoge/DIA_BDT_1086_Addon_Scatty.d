//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Addon_Scatty_EXIT(C_INFO)
{
	npc             = BDT_1086_Addon_Scatty;
	nr              = 999;
	condition	= DIA_Addon_Scatty_EXIT_Condition;
	information	= DIA_Addon_Scatty_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Addon_Scatty_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Scatty_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> BroughtList
//========================================

INSTANCE DIA_Addon_Scatty_BroughtList (C_INFO)
{
   npc          = BDT_1086_Addon_Scatty;
   nr           = 1;
   condition    = DIA_Addon_Scatty_BroughtList_Condition;
   information  = DIA_Addon_Scatty_BroughtList_Info;
   permanent	= FALSE;
   description	= "Hej Scatty. Mam tu listê od Fiska. Chcesz coœ od piratów?";
};

FUNC INT DIA_Addon_Scatty_BroughtList_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Fisk_WannaEarnSomeMoney))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Scatty_BroughtList_Info()
{
    AI_Output (other, self ,"DIA_Addon_Scatty_BroughtList_15_01"); //Hej Scatty. Mam tu listê od Fiska. Chcesz coœ od piratów?
    AI_Output (self, other ,"DIA_Addon_Scatty_BroughtList_03_02"); //Hmm. Sam nie wiem. Wszystko mam.
    AI_Output (self, other ,"DIA_Addon_Scatty_BroughtList_03_03"); //Chocia¿ czekaj. Daj mi listê.
    B_UseFakeScroll ();
    AI_Output (self, other ,"DIA_Addon_Scatty_BroughtList_03_04"); //To powinno wystarczyæ.
    AI_Output (other, self ,"DIA_Addon_Scatty_BroughtList_15_05"); //Nie bêdê przeszkadza³.
    AI_Output (self, other ,"DIA_Addon_Scatty_BroughtList_03_06"); //Nie ma problemu.
    B_LogEntry                     (TOPIC_List_of_Goods,"Scatty tak¿e wpisa³ siê na liœcie.");
};

//========================================
//-----------------> PackageForYou
//========================================

INSTANCE DIA_Addon_Scatty_PackageForYou (C_INFO)
{
   npc          = BDT_1086_Addon_Scatty;
   nr           = 1;
   condition    = DIA_Addon_Scatty_PackageForYou_Condition;
   information  = DIA_Addon_Scatty_PackageForYou_Info;
   permanent	= FALSE;
   description	= "Hej Scatty. Przesy³ka dla ciebie.";
};

FUNC INT DIA_Addon_Scatty_PackageForYou_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Tom_GotThePacks))
    && (Npc_HasItems (other, ItMi_Packet_Scatty) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Scatty_PackageForYou_Info()
{
    AI_Output (other, self ,"DIA_Addon_Scatty_PackageForYou_15_01"); //Hej Scatty. Przesy³ka dla ciebie.
    AI_Output (self, other ,"DIA_Addon_Scatty_PackageForYou_03_02"); //Dziêki. Przyda siê do asortymentu moich towarów.
    B_LogEntry                     (TOPIC_Packs_from_Pirates,"Scatty jest zadowolony z przesy³ki.");
    B_GiveInvItems (other, self, ItMi_Packet_Scatty, 1);
};

//========================================
//-----------------> GoodBeer
//========================================

INSTANCE DIA_Addon_Scatty_GoodBeer (C_INFO)
{
   npc          = BDT_1086_Addon_Scatty;
   nr           = 1;
   condition    = DIA_Addon_Scatty_GoodBeer_Condition;
   information  = DIA_Addon_Scatty_GoodBeer_Info;
   permanent	= FALSE;
   description	= "Jak samopoczucie?";
};

FUNC INT DIA_Addon_Scatty_GoodBeer_Condition()
{
    if (MIS_List_of_Goods == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Scatty_GoodBeer_Info()
{
    AI_Output (other, self ,"DIA_Addon_Scatty_GoodBeer_15_01"); //Jak samopoczucie?
    AI_Output (self, other ,"DIA_Addon_Scatty_GoodBeer_03_02"); //Emm, napi³bym siê piwa. Od kilkunastu dni go nie pi³em, mo¿e zechcesz pomóc?
    AI_Output (other, self ,"DIA_Addon_Scatty_GoodBeer_15_03"); //Na pewno mam jakieœ piwko przy sobie.
    AI_Output (self, other ,"DIA_Addon_Scatty_GoodBeer_03_04"); //Nie, nie. Ja chcê piwa, ale od Lou. Ten stary gorzelnik wie, co dobre, ma zapewne jeszcze kilka butelek dobrego porteru. 
    AI_Output (self, other ,"DIA_Addon_Scatty_GoodBeer_03_05"); //Pyszne piwko z piank¹...
    AI_Output (other, self ,"DIA_Addon_Scatty_GoodBeer_15_06"); //No dobra. Nied³ugo dostaniesz takie piwo. Tylko powiedz mi, czemu nie zapisa³eœ tego w swojej liœcie towarów?
    AI_Output (self, other ,"DIA_Addon_Scatty_GoodBeer_03_07"); //Eee, no wiesz... Zapomnia³em. Myœla³em, ¿e Snaf albo Fisk to za³atwi¹.
    AI_Output (other, self ,"DIA_Addon_Scatty_GoodBeer_15_08"); //Umiesz liczyæ? Licz na siebie...
    AI_Output (self, other ,"DIA_Addon_Scatty_GoodBeer_03_09"); //Co? (zdziwienie)
    AI_Output (other, self ,"DIA_Addon_Scatty_GoodBeer_15_10"); //Nie, nic. Nied³ugo wracam.
    MIS_Strong_Beer = LOG_RUNNING;

    Log_CreateTopic            (TOPIC_Strong_Beer, LOG_MISSION);
    Log_SetTopicStatus       (TOPIC_Strong_Beer, LOG_RUNNING);
    B_LogEntry                     (TOPIC_Strong_Beer,"Scatty zapomnia³ o dopisaniu piwa do swojej listy towarów i nasz³o go teraz pragnienie. Napi³by siê piwa od Lou. Przyniosê mu to piwo.");
};

//========================================
//-----------------> HeresTheBeer
//========================================

INSTANCE DIA_Addon_Scatty_HeresTheBeer (C_INFO)
{
   npc          = BDT_1086_Addon_Scatty;
   nr           = 1;
   condition    = DIA_Addon_Scatty_HeresTheBeer_Condition;
   information  = DIA_Addon_Scatty_HeresTheBeer_Info;
   permanent	= FALSE;
   description	= "Mam piwo.";
};

FUNC INT DIA_Addon_Scatty_HeresTheBeer_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Lou_MoneyForBeer))
    && (Npc_HasItems (other, ItFo_Beer_Lou) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Scatty_HeresTheBeer_Info()
{
    AI_Output (other, self ,"DIA_Addon_Scatty_HeresTheBeer_15_01"); //Mam piwo.
    AI_Output (self, other ,"DIA_Addon_Scatty_HeresTheBeer_03_02"); //(z radoœci¹) Ile masz tego?

    Info_ClearChoices		(DIA_Addon_Scatty_HeresTheBeer);
	if (Npc_HasItems (other, ItFo_Beer_Lou) >= 2)
	{
		Info_AddChoice		(DIA_Addon_Scatty_HeresTheBeer, "Dwie butelki.", DIA_Addon_Scatty_HeresTheBeer_Two);
	};
	Info_AddChoice		(DIA_Addon_Scatty_HeresTheBeer, "Tylko jedn¹.", DIA_Addon_Scatty_HeresTheBeer_One);
};

FUNC VOID DIA_Addon_Scatty_HeresTheBeer_One()
{
    AI_Output (other, self ,"DIA_Addon_Scatty_HeresTheBeer_One_15_01"); //Tylko jedn¹.
    AI_Output (self, other ,"DIA_Addon_Scatty_HeresTheBeer_One_03_02"); //A to sknera. Pewnie ma wiêcej i nie chce siê podzieliæ.
    AI_Output (self, other ,"DIA_Addon_Scatty_HeresTheBeer_One_03_03"); //Ale z niego kawa³...
    AI_Output (other, self ,"DIA_Addon_Scatty_HeresTheBeer_One_15_04"); //Bandyty?
    AI_Output (self, other ,"DIA_Addon_Scatty_HeresTheBeer_One_03_05"); //Emm, no, po prawdzie to tak.
    AI_Output (other, self ,"DIA_Addon_Scatty_HeresTheBeer_One_15_06"); //Wypij moje zdrowie.
    AI_Output (self, other ,"DIA_Addon_Scatty_HeresTheBeer_One_03_07"); //Wypijê to piwko wieczorem przy ognisku. Trzymaj parê z³otych samorodków.

    B_LogEntry                     (TOPIC_Strong_Beer,"Da³em Scattiemu tylko jedno piwo. Nazwa³ Lou skner¹, który nie chce siê dzieliæ. Ale zadanie wykona³em. Otrzyma³em tak¿e kilka z³otych samorodków.");
    Log_SetTopicStatus       (TOPIC_Strong_Beer, LOG_SUCCESS);
    MIS_Strong_Beer = LOG_SUCCESS;

    B_GiveInvItems (other, self, ItFo_Beer_Lou, 1);

    CreateInvItems (self, ItMi_GoldNugget_Addon, 6);
    B_GiveInvItems (self, other, ItMi_GoldNugget_Addon, 6);
	
    Info_ClearChoices		(DIA_Addon_Scatty_HeresTheBeer);
};

FUNC VOID DIA_Addon_Scatty_HeresTheBeer_Two()
{
    AI_Output (other, self ,"DIA_Addon_Scatty_HeresTheBeer_Two_15_01"); //Dwie butelki.
    AI_Output (self, other ,"DIA_Addon_Scatty_HeresTheBeer_Two_03_02"); //Lepsze to ni¿ nic. Chocia¿ i tak z niego sknera. Móg³by siê dzieliæ bardziej.
    AI_Output (other, self ,"DIA_Addon_Scatty_HeresTheBeer_Two_15_03"); //Hej¿e, przecie¿ to JA kupi³em te piwa. Zawsze mog³em ci oddaæ jedn¹ butelkê.
    AI_Output (self, other ,"DIA_Addon_Scatty_HeresTheBeer_Two_03_04"); //No mog³eœ, ale uczciwy jesteœ.
    AI_Output (other, self ,"DIA_Addon_Scatty_HeresTheBeer_Two_15_05"); //Uczciwy bandyta?
    AI_Output (self, other ,"DIA_Addon_Scatty_HeresTheBeer_Two_03_06"); //Ju¿ nie napuszaj siê tak. Masz tu parê z³otych samorodków. Na pewno coœ z nimi zrobisz.
    AI_Output (other, self ,"DIA_Addon_Scatty_HeresTheBeer_Two_15_07"); //Pewnie.

    B_LogEntry                     (TOPIC_Strong_Beer,"Odda³em Scattiemu dwie butelki piwa. Nazwa³ mnie uczciwym bandyt¹ i w nagrodê da³ parê z³otych samorodków.");
    Log_SetTopicStatus       (TOPIC_Strong_Beer, LOG_SUCCESS);
    MIS_Strong_Beer = LOG_SUCCESS;

    B_GiveInvItems (other, self, ItFo_Beer_Lou, 2);

    CreateInvItems (self, ItMi_GoldNugget_Addon, 6);
    B_GiveInvItems (self, other, ItMi_GoldNugget_Addon, 6);

    Info_ClearChoices		(DIA_Addon_Scatty_HeresTheBeer);
};

//========================================
//-----------------> Hello
//========================================

INSTANCE DIA_Addon_Scatty_Hello (C_INFO)
{
   npc          = BDT_1086_Addon_Scatty;
   nr           = 1;
   condition    = DIA_Addon_Scatty_Hello_Condition;
   information  = DIA_Addon_Scatty_Hello_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Scatty_Hello_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Addon_Scatty_Hello_Info()
{
    AI_Output (self, other ,"DIA_Addon_Scatty_Hello_03_01"); //Witaj ¿ó³todziobie. Jestem Scatty.
    AI_Output (other, self ,"DIA_Addon_Scatty_Hello_15_02"); //Nazywam siê Vinc.
    AI_Output (self, other ,"DIA_Addon_Scatty_Hello_03_03"); //Wiêc to ty jesteœ ten morderca ¿o³nierzy.
    AI_Output (other, self ,"DIA_Addon_Scatty_Hello_15_04"); //Zabi³em tylko dwóch...
    AI_Output (self, other ,"DIA_Addon_Scatty_Hello_03_05"); //He he, skromnoœæ, co?
    AI_Output (self, other ,"DIA_Addon_Scatty_Hello_03_06"); //Spokojnie, tak sobie gadam. W kolonii by³ pewien kopacz, który twierdzi³, ¿e zabi³ go³ymi rêkoma dwunastu ludzi.
    AI_Output (other, self ,"DIA_Addon_Scatty_Hello_15_07"); //To by³a prawda?
    AI_Output (self, other ,"DIA_Addon_Scatty_Hello_03_08"); //No co ty. Po prostu chcia³ wzbudziæ strach wœród innych lub przy nowych. Oprych jakich ma³o.
    AI_Output (other, self ,"DIA_Addon_Scatty_Hello_15_09"); //Racja.
};

//========================================
//-----------------> YouWereInColony
//========================================

INSTANCE DIA_Addon_Scatty_YouWereInColony (C_INFO)
{
   npc          = BDT_1086_Addon_Scatty;
   nr           = 2;
   condition    = DIA_Addon_Scatty_YouWereInColony_Condition;
   information  = DIA_Addon_Scatty_YouWereInColony_Info;
   permanent	= FALSE;
   description	= "Jesteœ z kolonii, tak?";
};

FUNC INT DIA_Addon_Scatty_YouWereInColony_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Scatty_Hello))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Scatty_YouWereInColony_Info()
{
    AI_Output (other, self ,"DIA_Addon_Scatty_YouWereInColony_15_01"); //Jesteœ z kolonii, tak?
    AI_Output (self, other ,"DIA_Addon_Scatty_YouWereInColony_03_02"); //Tak, ale jak widzisz, wolnoœci nadal nie mam. To znaczy cieszê siê, ¿e nie siedzê pod barier¹.
    AI_Output (self, other ,"DIA_Addon_Scatty_YouWereInColony_03_03"); //Jednak wola³bym ju¿ siedzieæ w mieœcie, w karczmie, przy pysznym piwie i pieczonym miêsiwie.
    AI_Output (self, other ,"DIA_Addon_Scatty_YouWereInColony_03_04"); //Zaraz, ty jesteœ z miasta. Opowiedz mi coœ o nim.
    AI_Output (other, self ,"DIA_Addon_Scatty_YouWereInColony_15_05"); //A co chcesz wiedzieæ?
    AI_Output (self, other ,"DIA_Addon_Scatty_YouWereInColony_03_06"); //Po prostu opowiedz mi coœ o Khorinis.
    AI_Output (other, self ,"DIA_Addon_Scatty_YouWereInColony_15_07"); //W mieœcie jest pewien mag wody o imieniu Vatras. Lubi³em s³uchaæ jego opowiadañ o bogach. Czêsto te¿ z nim rozmawia³em na wszelakie tematy.
    AI_Output (self, other ,"DIA_Addon_Scatty_YouWereInColony_03_08"); //Mag wody, hmm. Byli pewni w kolonii. O ile pamiêtam, to te¿ byli to magowie wody.
    AI_Output (self, other ,"DIA_Addon_Scatty_YouWereInColony_03_09"); //A powiesz coœ o samym mieœcie?
    AI_Output (other, self ,"DIA_Addon_Scatty_YouWereInColony_15_10"); //No có¿, przyp³ywa³y statki z kontynentu, handel sta³ na wysokim poziomie. Ka¿dy móg³ znaleŸæ pracê.
    AI_Output (self, other ,"DIA_Addon_Scatty_YouWereInColony_03_11"); //A Czerwona Latarnia nadal jest?
    AI_Output (other, self ,"DIA_Addon_Scatty_YouWereInColony_15_12"); //Tak, nadal tam jest. Czemu pytasz?
    AI_Output (self, other ,"DIA_Addon_Scatty_YouWereInColony_03_13"); //Emm, nooo... emm...
    AI_Output (other, self ,"DIA_Addon_Scatty_YouWereInColony_15_14"); //Dobra rozumiem.
    AI_Output (self, other ,"DIA_Addon_Scatty_YouWereInColony_03_15"); //Bardzo lubi³em spotykaæ tam pewn¹ kobietê.
    AI_Output (other, self ,"DIA_Addon_Scatty_YouWereInColony_15_16"); //Jasne.
};

//========================================
//-----------------> HowsBusiness
//========================================

INSTANCE DIA_Addon_Scatty_HowsBusiness (C_INFO)
{
   npc          = BDT_1086_Addon_Scatty;
   nr           = 3;
   condition    = DIA_Addon_Scatty_HowsBusiness_Condition;
   information  = DIA_Addon_Scatty_HowsBusiness_Info;
   permanent	= TRUE;
   description	= "Jak tam maj¹ siê sprawy?";
};

FUNC INT DIA_Addon_Scatty_HowsBusiness_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Scatty_Hello))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Scatty_HowsBusiness_Info()
{
    AI_Output (other, self ,"DIA_Addon_Scatty_HowsBusiness_15_01"); //Jak tam maj¹ siê sprawy?
    AI_Output (self, other ,"DIA_Addon_Scatty_HowsBusiness_03_02"); //Kopacze kopi¹ z³oto, niewolnicy kopi¹ coœ dla Kruka. Z³oto p³ynie.
};

//========================================
//-----------------> HowAreYou
//========================================

INSTANCE DIA_Addon_Scatty_HowAreYou (C_INFO)
{
   npc          = BDT_1086_Addon_Scatty;
   nr           = 4;
   condition    = DIA_Addon_Scatty_HowAreYou_Condition;
   information  = DIA_Addon_Scatty_HowAreYou_Info;
   permanent	= FALSE;
   description	= "Co u ciebie?";
};

FUNC INT DIA_Addon_Scatty_HowAreYou_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Scatty_Hello))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Scatty_HowAreYou_Info()
{
    AI_Output (other, self ,"DIA_Addon_Scatty_HowAreYou_15_01"); //Co u ciebie?
    AI_Output (self, other ,"DIA_Addon_Scatty_HowAreYou_03_02"); //Wszystko po staremu. ¯adnych zmian.
};

