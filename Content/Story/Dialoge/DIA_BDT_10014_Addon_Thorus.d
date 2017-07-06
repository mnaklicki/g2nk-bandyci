//----------------------------------------------------------------------
//	Info EXIT 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_EXIT   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 999;
	condition   = DIA_Addon_Thorus_EXIT_Condition;
	information = DIA_Addon_Thorus_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Thorus_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Thorus_EXIT_Info()
{	
	AI_StopProcessInfos (self);
};

//========================================
//-----------------> BroughtList
//========================================

INSTANCE DIA_Addon_Thorus_BroughtList (C_INFO)
{
   npc          = BDT_10014_Addon_Thorus;
   nr           = 1;
   condition    = DIA_Addon_Thorus_BroughtList_Condition;
   information  = DIA_Addon_Thorus_BroughtList_Info;
   permanent	= FALSE;
   description	= "Potrzebujesz czegoœ?";
};

FUNC INT DIA_Addon_Thorus_BroughtList_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Fisk_WannaEarnSomeMoney))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Thorus_BroughtList_Info()
{
    AI_Output (other, self ,"DIA_Addon_Thorus_BroughtList_15_01"); //Potrzebujesz czegoœ?
    AI_Output (self, other ,"DIA_Addon_Thorus_BroughtList_03_02"); //Hê?
    AI_Output (other, self ,"DIA_Addon_Thorus_BroughtList_15_03"); //Mam listê od Fiska. Jest tu lista towarów dla piratów.
    AI_Output (self, other ,"DIA_Addon_Thorus_BroughtList_03_04"); //Mikstury lecznicze siê przydadz¹. Daj mi listê.
    B_UseFakeScroll ();
    AI_Output (self, other ,"DIA_Addon_Thorus_BroughtList_03_05"); //Trzymaj.
    B_LogEntry                     (TOPIC_List_of_Goods,"Krótka rozmowa z Thorusem i kolejna osoba, która wpisa³a mi siê do listy.");
};

//========================================
//-----------------> PackageForYou
//========================================

INSTANCE DIA_Addon_Thorus_PackageForYou (C_INFO)
{
   npc          = BDT_10014_Addon_Thorus;
   nr           = 2;
   condition    = DIA_Addon_Thorus_PackageForYou_Condition;
   information  = DIA_Addon_Thorus_PackageForYou_Info;
   permanent	= FALSE;
   description	= "Mam twoj¹ paczkê.";
};

FUNC INT DIA_Addon_Thorus_PackageForYou_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Tom_GotThePacks))
    && (Npc_HasItems (other, ItMi_Packet_Thorus) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Thorus_PackageForYou_Info()
{
    AI_Output (other, self ,"DIA_Addon_Thorus_PackageForYou_15_01"); //Mam twoj¹ paczkê.
    AI_Output (self, other ,"DIA_Addon_Thorus_PackageForYou_03_02"); //Znakomicie. Przydajesz siê. Oby tak dalej.
    B_GiveInvItems (other, self, ItMi_Packet_Thorus, 1);
    B_LogEntry                     (TOPIC_Packs_from_Pirates,"Thorus stwierdzi³, ¿e jestem przydatny. Dobrze to s³yszeæ.");
};

//========================================
//-----------------> WhatCanIDo
//========================================

INSTANCE DIA_Addon_Thorus_WhatCanIDo (C_INFO)
{
   npc          = BDT_10014_Addon_Thorus;
   nr           = 1;
   condition    = DIA_Addon_Thorus_WhatCanIDo_Condition;
   information  = DIA_Addon_Thorus_WhatCanIDo_Info;
   permanent	= FALSE;
   description	= "Jest coœ co mogê zrobiæ?";
};

FUNC INT DIA_Addon_Thorus_WhatCanIDo_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Addon_Thorus_WhatCanIDo_Info()
{
    AI_Output (other, self ,"DIA_Addon_Thorus_WhatCanIDo_15_01"); //Jest coœ co mogê zrobiæ?
    AI_Output (self, other ,"DIA_Addon_Thorus_WhatCanIDo_03_02"); //Pewnie, dla nowego zawsze znajdzie siê robota. WeŸmiesz udzia³ w pewnym szczególnym transporcie.
    AI_Output (self, other ,"DIA_Addon_Thorus_WhatCanIDo_03_03"); //Piraci maj¹ dla nas dostawê niewolników, których potrzebuje Kruk. Naszym zadaniem jest natomiast mu ich dostarczaæ.
    AI_Output (other, self ,"DIA_Addon_Thorus_WhatCanIDo_15_04"); //Gdzie odbêdzie siê wymiana?
    AI_Output (self, other ,"DIA_Addon_Thorus_WhatCanIDo_03_05"); //W centralnej czêœci tej krainy s¹ ruiny. Niedaleko nich jest pewien w¹wóz.
    AI_Output (self, other ,"DIA_Addon_Thorus_WhatCanIDo_03_06"); //Zreszt¹, Carlos ciê tam zaprowadzi.
    AI_Output (other, self ,"DIA_Addon_Thorus_WhatCanIDo_15_07"); //Ilu z nas tam pójdzie?
    AI_Output (self, other ,"DIA_Addon_Thorus_WhatCanIDo_03_08"); //Ty, Carlos, Senyan i Sancho. Przyda siê tym dwóm ostatnim trochê ruchu.
    AI_Output (self, other ,"DIA_Addon_Thorus_WhatCanIDo_03_09"); //Carlos bêdzie dowodziæ, wiêc siê go s³uchaj.
    AI_Output (other, self ,"DIA_Addon_Thorus_WhatCanIDo_15_10"); //Jasne.

    MIS_Transport = LOG_RUNNING;
    Log_CreateTopic            (TOPIC_Transport, LOG_MISSION);
    Log_SetTopicStatus       (TOPIC_Transport, LOG_RUNNING);
    B_LogEntry                     (TOPIC_Transport,"Dosta³em od Thorusa jedno z wa¿niejszych zadañ. Wraz z Carlosem, Senyanem i Sancho mamy iœæ do w¹wozu, gdzie odbêdzie siê dostawa niewolników. Nie wiem jeszcze po co ci niewolnicy, ale zapewne wkrótce siê dowiem. Udam siê do Carlosa i omówiê z nim sprawê.");

    Npc_ExchangeRoutine (PIR_1371_Addon_Hank, "Trade");
    Npc_ExchangeRoutine (PIR_1370_Addon_Angus, "Trade");
    Npc_ExchangeRoutine (PIR_1355_Addon_Skip, "Trade");

    Wld_InsertNpc (STRF_1120_Addon_Tonak, "ADW_TRADE_PIR_SLAVE");
    Wld_InsertNpc (STRF_1122_Addon_Pardos, "ADW_ENTRANCE_2_PIRATECAMP_03");
    Wld_InsertNpc (STRF_1119_Addon_Monty, "ADW_TRADE_PIR_SLAVE");
    Wld_InsertNpc (STRF_1121_Addon_Telbor, "ADW_ENTRANCE_2_PIRATECAMP_03");

    Npc_ExchangeRoutine (BDT_1073_Addon_Sancho, "WaitForHero");
    Npc_ExchangeRoutine (BDT_1084_Addon_Senyan, "WaitForHero");
};

//========================================
//-----------------> FinishedTransport
//========================================

INSTANCE DIA_Addon_Thorus_FinishedTransport (C_INFO)
{
   npc          = BDT_10014_Addon_Thorus;
   nr           = 1;
   condition    = DIA_Addon_Thorus_FinishedTransport_Condition;
   information  = DIA_Addon_Thorus_FinishedTransport_Info;
   permanent	= FALSE;
   description	= "Transport zakoñczony sukcesem.";
};

FUNC INT DIA_Addon_Thorus_FinishedTransport_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Carlos_SanchoStays))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Thorus_FinishedTransport_Info()
{
    AI_Output (other, self ,"DIA_Addon_Thorus_FinishedTransport_03_00"); //Transport zakoñczony sukcesem.
    AI_Output (self, other ,"DIA_Addon_Thorus_FinishedTransport_15_01"); //Œwietnie. Kruk siê ucieszy.
    AI_Output (other, self ,"DIA_Addon_Thorus_FinishedTransport_03_02"); //Ja myœlê. To wszystko?
    AI_Output (self, other ,"DIA_Addon_Thorus_FinishedTransport_03_03"); //A czego siê jeszcze spodziewasz? To dla ciebie. Sakiewka ze z³otem.

    CreateInvItems (self, ItSe_GoldPocket100, 1);
    B_GiveInvItems (self, other, ItSe_GoldPocket100, 1);

    B_LogEntry                     (TOPIC_Transport,"Koniec transportu wiêŸniów. Thorus da³ mi parê leczniczych mikstur, a niewolnicy poszli do kopalni. Robota zakoñczona.");
    Log_SetTopicStatus       (TOPIC_Transport, LOG_SUCCESS);
    MIS_Transport = LOG_SUCCESS;
};

//========================================
//-----------------> CrimsonNeedsWork
//========================================

INSTANCE DIA_Addon_Thorus_CrimsonNeedsWork (C_INFO)
{
   npc          = BDT_10014_Addon_Thorus;
   nr           = 1;
   condition    = DIA_Addon_Thorus_CrimsonNeedsWork_Condition;
   information  = DIA_Addon_Thorus_CrimsonNeedsWork_Info;
   permanent	= FALSE;
   description	= "Pewien wytapiacz z³ota szuka roboty.";
};

FUNC INT DIA_Addon_Thorus_CrimsonNeedsWork_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Crimson_WhatAreYouDoing))
    && (Npc_KnowsInfo (other, DIA_Addon_Thorus_FinishedTransport))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Thorus_CrimsonNeedsWork_Info()
{
    AI_Output (other, self ,"DIA_Addon_Thorus_CrimsonNeedsWork_15_01"); //Pewien wytapiacz z³ota szuka roboty.
    AI_Output (self, other ,"DIA_Addon_Thorus_CrimsonNeedsWork_03_02"); //Przyda siê ktoœ taki w kopalni. Powiedz temu komuœ, aby szed³ do kopalni.
    AI_Output (other, self ,"DIA_Addon_Thorus_CrimsonNeedsWork_15_03"); //Crimson siê zapewne ucieszy.
    AI_Output (self, other ,"DIA_Addon_Thorus_CrimsonNeedsWork_03_04"); //Zapewne tak.
    B_LogEntry                     (TOPIC_Bored_Crimson,"Thorus powiedzia³, ¿e przyda siê ktoœ do kopalni. Crimson nie bêdzie ju¿ bezrobotny.");
};

//========================================
//-----------------> LostSpy
//========================================

INSTANCE DIA_Addon_Thorus_LostSpy (C_INFO)
{
   npc          = BDT_10014_Addon_Thorus;
   nr           = 1;
   condition    = DIA_Addon_Thorus_LostSpy_Condition;
   information  = DIA_Addon_Thorus_LostSpy_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Thorus_LostSpy_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Carlos_GoToThorus))
    && (Npc_IsInState (self,ZS_Talk))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Thorus_LostSpy_Info()
{
    AI_Output (self, other ,"DIA_Addon_Thorus_LostSpy_03_01"); //Dobrze, ¿e jesteœ.
    AI_Output (other, self ,"DIA_Addon_Thorus_LostSpy_15_02"); //O co chodzi?
    AI_Output (self, other ,"DIA_Addon_Thorus_LostSpy_03_03"); //S³ysza³em o tej akcji z Arvo.
    AI_Output (other, self ,"DIA_Addon_Thorus_LostSpy_15_04"); //Jestem niewinny.
    AI_Output (self, other ,"DIA_Addon_Thorus_LostSpy_03_05"); //Jak ka¿dy bandyta. Nie chodzi mi o to.
    AI_Output (other, self ,"DIA_Addon_Thorus_LostSpy_15_06"); //To o co?
    AI_Output (self, other ,"DIA_Addon_Thorus_LostSpy_03_07"); //Arvo jest zwyk³ym œmieciem i czyimœ przydupasem.
    AI_Output (self, other ,"DIA_Addon_Thorus_LostSpy_03_08"); //Ale ty jesteœ inny. Zlecê ci wa¿ne zadanie. Dostaniesz siê dziêki temu do obozu.
    AI_Output (other, self ,"DIA_Addon_Thorus_LostSpy_15_09"); //Do rzeczy.
    AI_Output (self, other ,"DIA_Addon_Thorus_LostSpy_03_10"); //Wymiana handlowa z piratami jest bardzo wa¿na. Ale czujnoœci nigdy za ma³o.
    AI_Output (other, self ,"DIA_Addon_Thorus_LostSpy_15_11"); //Mam ich obserwowaæ?
    AI_Output (self, other ,"DIA_Addon_Thorus_LostSpy_03_12"); //Nie, nie ty. Wys³a³em przed tob¹ pewnego kolesia.
    AI_Output (self, other ,"DIA_Addon_Thorus_LostSpy_03_13"); //Ale od tego czasu nie mam z nim kontaktu.
    AI_Output (other, self ,"DIA_Addon_Thorus_LostSpy_15_14"); //Móg³ zdradziæ?
    AI_Output (self, other ,"DIA_Addon_Thorus_LostSpy_03_15"); //Prêdzej zostaæ zabitym.
    AI_Output (other, self ,"DIA_Addon_Thorus_LostSpy_15_16"); //Piraci?
    AI_Output (self, other ,"DIA_Addon_Thorus_LostSpy_03_17"); //Raczej jakaœ bestia. Mog³em wys³aæ kogoœ innego.
    AI_Output (self, other ,"DIA_Addon_Thorus_LostSpy_03_18"); //Ale organizacja nowego miejsca na obóz poch³ania du¿o czasu.
    AI_Output (self, other ,"DIA_Addon_Thorus_LostSpy_03_19"); //I nie wyœlê byle kogo kto zaraz zostanie po¿arty.
    AI_Output (other, self ,"DIA_Addon_Thorus_LostSpy_15_20"); //Mia³ coœ szczególnego ze sob¹?
    AI_Output (self, other ,"DIA_Addon_Thorus_LostSpy_03_21"); //To jeden z dawnych szkodników pewnego obozu.
    AI_Output (self, other ,"DIA_Addon_Thorus_LostSpy_03_22"); //Na imiê mia³ Butch. Wys³aliœmy go tylko dlatego, bo uchodzi³ za groŸnego i niebezpiecznego.
    AI_Output (self, other ,"DIA_Addon_Thorus_LostSpy_03_23"); //Opinie s¹ k³amliwe, a zw³aszcza czyjeœ.
    AI_Output (self, other ,"DIA_Addon_Thorus_LostSpy_03_24"); //Zanim polaz³, pochwali³ siê paru osobom, jakoby okrad³ maga. Mówi³ 'niby stra¿nik, a œlepy'.
    AI_Output (other, self ,"DIA_Addon_Thorus_LostSpy_15_25"); //Móg³ ukraœæ?
    AI_Output (self, other ,"DIA_Addon_Thorus_LostSpy_03_26"); //Jak dla mnie to temu magowi wypad³ ten pierœcieñ.
    AI_Output (other, self ,"DIA_Addon_Thorus_LostSpy_15_27"); //Poszukiwania mog¹ trochê zaj¹æ.
    AI_Output (self, other ,"DIA_Addon_Thorus_LostSpy_03_28"); //Jeœli nie masz mapy tej czêœci wyspy, to kup j¹ od Fiska.
    AI_Output (self, other ,"DIA_Addon_Thorus_LostSpy_03_29"); //Butch mia³ przejœæ przez centralne ruiny.
    AI_Output (self, other ,"DIA_Addon_Thorus_LostSpy_03_30"); //Tam zacznij poszukiwania.
    MIS_Spy = LOG_RUNNING;

    Log_CreateTopic            (TOPIC_Spy, LOG_MISSION);
    Log_SetTopicStatus       (TOPIC_Spy, LOG_RUNNING);
    B_LogEntry                     (TOPIC_Spy,"Mam znaleŸæ kolesia imieniem Butch. Wœród zbiegów z kolonii karnej kr¹¿y³a opinia, ¿e jest on niebezpiecznym typem. Thorus wys³a³ go na przeszpiegi u piratów, uwa¿a on jednak, ¿e zosta³ po¿arty przez jakieœ bestie. Poleci³ mi, abym poszukiwania zacz¹³ od centralnych ruin w tej czêœci wyspy.");
};

//========================================
//-----------------> FoundButch
//========================================

INSTANCE DIA_Addon_Thorus_FoundButch (C_INFO)
{
   npc          = BDT_10014_Addon_Thorus;
   nr           = 2;
   condition    = DIA_Addon_Thorus_FoundButch_Condition;
   information  = DIA_Addon_Thorus_FoundButch_Info;
   permanent	= FALSE;
   description	= "Odnalaz³em twojego szpiega. Jest ju¿ w innym œwiecie.";
};

FUNC INT DIA_Addon_Thorus_FoundButch_Condition()
{
    var C_NPC whodie0; 	whodie0 = Hlp_GetNpc(Butch_StonePuma);
    if (Npc_KnowsInfo (other, DIA_Addon_Thorus_LostSpy))
    && (Npc_IsDead(whodie0))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Thorus_FoundButch_Info()
{
    AI_Output (other, self ,"DIA_Addon_Thorus_FoundButch_15_01"); //Odnalaz³em twojego szpiega. Jest ju¿ w innym œwiecie.
    AI_Output (self, other ,"DIA_Addon_Thorus_FoundButch_03_02"); //Wiedzia³em, ¿e zgin¹³. Dobrze, ¿e go odnalaz³eœ.
    AI_Output (self, other ,"DIA_Addon_Thorus_FoundButch_03_03"); //Pierœcieñ sobie zatrzymaj. Nie jest mi potrzebny.
    AI_Output (self, other ,"DIA_Addon_Thorus_FoundButch_03_04"); //Reszt¹ zajmie siê pewnie Kruk.
    AI_Output (self, other ,"DIA_Addon_Thorus_FoundButch_03_05"); //A co do ciebie. Masz moje pozwolenie, a teraz odejdŸ, bo mam wa¿niejsze sprawy na g³owie.
    AI_Output (self, other ,"DIA_Addon_Thorus_FoundButch_03_06"); //Nied³ugo czêœæ z nas siê pozabija, ¿eby wejœæ do kopalni. Trzeba ogarn¹æ ten burdel.
    AI_Output (other, self ,"DIA_Addon_Thorus_FoundButch_15_07"); //Do zobaczenia.
    B_LogEntry                     (TOPIC_Spy,"Uzyska³em pozwolenie od Thorusa na wejœcie do kopalni. Wolê trzymaæ siê jego ni¿ tego idioty Estebana. Nie zdziwiê siê, jak pewnego dnia ktoœ go wykiwa i zabije. Pogratulowa³bym temu cz³owiekowi za wykonan¹ przys³ugê.");
    Log_SetTopicStatus       (TOPIC_Spy, LOG_SUCCESS);
    MIS_Spy = LOG_SUCCESS;
};

//========================================
//-----------------> WhatHappenedThere
//========================================

INSTANCE DIA_Addon_Thorus_WhatHappenedThere (C_INFO)
{
   npc          = BDT_10014_Addon_Thorus;
   nr           = 1;
   condition    = DIA_Addon_Thorus_WhatHappenedThere_Condition;
   information  = DIA_Addon_Thorus_WhatHappenedThere_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Thorus_WhatHappenedThere_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Bloodwyn_AttackEnded))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Thorus_WhatHappenedThere_Info()
{
    AI_Output (self, other ,"DIA_Addon_Thorus_WhatHappenedThere_03_01"); //Mia³em zobaczyæ co siê dzieje w kopalni.
    AI_Output (other, self ,"DIA_Addon_Thorus_WhatHappenedThere_15_02"); //Kruk otworzy³ grobowiec. Pokonaliœmy kamiennych stra¿ników, którzy stamt¹d wyszli. Nastêpnie Kruk wszed³ do grobowca.
    AI_Output (other, self ,"DIA_Addon_Thorus_WhatHappenedThere_15_03"); //A Bloodwyn kaza³ mi siê wynosiæ.
    AI_Output (self, other ,"DIA_Addon_Thorus_WhatHappenedThere_03_04"); //Pos³uchaj mnie teraz. Gdy mia³em wejœæ do kopalni, jeden ze stra¿ników powiedzia³ o jakiœ zamieszkach na dole.
    AI_Output (self, other ,"DIA_Addon_Thorus_WhatHappenedThere_03_05"); //W obozie myœliwych. Fletcher bêdzie wiedzia³ wiêcej. IdŸ do niego. Sam mia³em siê tym zaj¹æ, ale...
    AI_Output (self, other ,"DIA_Addon_Thorus_WhatHappenedThere_03_06"); //Muszê zobaczyæ na w³asne oczy co siê sta³o w kopalni.
    AI_Output (other, self ,"DIA_Addon_Thorus_WhatHappenedThere_15_07"); //Nie ma sprawy, sprawdzê to.

    IntroduceChapter (KapWechsel_3,KapWechsel_3_Text,"chapter3.tga","chapter_01.wav", 6000);
	KAPITEL = 3;
    MIS_Riot_in_Hunters_Camp = LOG_RUNNING;
    Log_CreateTopic            (TOPIC_Riot_in_Hunters_Camp, LOG_MISSION);
    Log_SetTopicStatus       (TOPIC_Riot_in_Hunters_Camp, LOG_RUNNING);
    B_LogEntry                     (TOPIC_Riot_in_Hunters_Camp,"Thorus wysy³a mnie do obozu Fletchera, bo by³y tam jakieœ zamieszki. Muszê to sprawdziæ.");

    B_KillNpc	 (BDT_10315_Fletcher);
    Npc_ExchangeRoutine (BDT_10316_Arvo, "FletcherDead");
	AI_Teleport (BDT_10316_Arvo, "BL_FIGHT_01");
	
	Npc_ExchangeRoutine (BDT_1073_Addon_Sancho, "Final");
    Npc_ExchangeRoutine (BDT_1093_Addon_Franco, "Fletcher");
};

//========================================
//-----------------> FletcherIsDead
//========================================

INSTANCE DIA_Addon_Thorus_FletcherIsDead (C_INFO)
{
   npc          = BDT_10014_Addon_Thorus;
   nr           = 1;
   condition    = DIA_Addon_Thorus_FletcherIsDead_Condition;
   information  = DIA_Addon_Thorus_FletcherIsDead_Info;
   permanent	= FALSE;
   description	= "Mam smutne wieœci. Fletcher nie ¿yje.";
};

FUNC INT DIA_Addon_Thorus_FletcherIsDead_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Logan_WhatDoYouKnow))
    && (Npc_KnowsInfo (other, DIA_Addon_Miguel_WhyDidHeKill))
    && (Npc_KnowsInfo (other, DIA_Addon_Edgor_WhatHappened))
    && (Npc_KnowsInfo (other, DIA_Arvo_StillHere))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Thorus_FletcherIsDead_Info()
{
	Npc_ExchangeRoutine (BDT_1070_Addon_Paul, "GoToSnaf");
	AI_Teleport (BDT_1070_Addon_Paul,"BL_SMITH_STAIRS");
	AI_GotoWP	(BDT_1070_Addon_Paul,"BL_SMITH_STAIRS");

    AI_Output (other, self ,"DIA_Addon_Thorus_FletcherIsDead_15_01"); //Mam smutne wieœci. Fletcher nie ¿yje.
    AI_Output (self, other ,"DIA_Addon_Thorus_FletcherIsDead_03_02"); //Kto go zabi³?
    AI_Output (other, self ,"DIA_Addon_Thorus_FletcherIsDead_15_03"); //Franko. Po prostu zaszed³ go i zabi³. Og³osi³ siê samozwañczym szefem. Teraz ka¿dy siê go boi.
    AI_Output (other, self ,"DIA_Addon_Thorus_FletcherIsDead_15_04"); //W zastraszaniu pomóg³ mu Arvo...
    AI_Output (self, other ,"DIA_Addon_Thorus_FletcherIsDead_03_05"); //Banda œmieci!
    AI_Output (other, self ,"DIA_Addon_Thorus_FletcherIsDead_15_06"); //Co z Frankiem? Zabijemy go?
    AI_Output (self, other ,"DIA_Addon_Thorus_FletcherIsDead_03_07"); //Nie, nie... Ka¿de morderstwo to roz³am w obozie.
    AI_Output (self, other ,"DIA_Addon_Thorus_FletcherIsDead_03_08"); //Daj mi spokój. IdŸ ju¿ st¹d.
    AI_Output (other, self ,"DIA_Addon_Thorus_FletcherIsDead_15_09"); //Nie rozumiem.
    AI_Output (self, other ,"DIA_Addon_Thorus_FletcherIsDead_03_10"); //Po prostu idŸ st¹d! Muszê pomyœleæ na spokojnie.

    B_LogEntry                     (TOPIC_Riot_in_Hunters_Camp,"Thorus wydawa³ siê wœciek³y, ale w jakiœ sposób opanowa³ zdenerwowanie. Szkoda mi Fletchera. Sam bym zabi³ tego Franko. Chocia¿by z zemsty. Ale pamiêtam s³owa, aby nie lekcewa¿yæ nikogo. Cholera! Co ja mam teraz zrobiæ?");
    Log_SetTopicStatus       (TOPIC_Riot_in_Hunters_Camp, LOG_SUCCESS);
    MIS_Riot_in_Hunters_Camp = LOG_SUCCESS;
};

//========================================
//-----------------> DontGoThere
//========================================

INSTANCE DIA_Addon_Thorus_DontGoThere (C_INFO)
{
   npc          = BDT_10014_Addon_Thorus;
   nr           = 1;
   condition    = DIA_Addon_Thorus_DontGoThere_Condition;
   information  = DIA_Addon_Thorus_DontGoThere_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Thorus_DontGoThere_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Addon_Thorus_DontGoThere_Info()
{
    AI_Output (self, other ,"DIA_Addon_Thorus_DontGoThere_03_01"); //Nawet nie myœl o pójœciu dalej.
    AI_Output (other, self ,"DIA_Addon_Thorus_DontGoThere_15_02"); //Nawet nie myœla³em.
    AI_Output (self, other ,"DIA_Addon_Thorus_DontGoThere_03_03"); //Œwietnie, ¿e siê zgadzamy. Gdybyœ jednak czegoœ potrzebowa³ to zg³oœ siê do mnie.
    AI_Output (other, self ,"DIA_Addon_Thorus_DontGoThere_15_04"); //Dobrze.
    AI_Output (self, other ,"DIA_Addon_Thorus_DontGoThere_03_05"); //Jestem Thorus. Zapamiêtaj to imiê.
    AI_Output (other, self ,"DIA_Addon_Thorus_DontGoThere_15_06"); //Jasne. Ja jestem Vinc.
    AI_Output (self, other ,"DIA_Addon_Thorus_DontGoThere_03_07"); //Pogada³bym z tob¹ o tym wydarzeniu z ¿o³nierzami, ale mam masê spraw na g³owie.
    AI_Output (other, self ,"DIA_Addon_Thorus_DontGoThere_15_08"); //Nie przeszkadzam.
};

