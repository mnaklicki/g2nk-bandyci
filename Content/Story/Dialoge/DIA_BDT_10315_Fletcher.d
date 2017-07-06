//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Fletcher_EXIT(C_INFO)
{
	npc             = BDT_10315_Fletcher;
	nr              = 999;
	condition	= DIA_Fletcher_EXIT_Condition;
	information	= DIA_Fletcher_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Fletcher_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Fletcher_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WELCOME
//========================================

INSTANCE DIA_Fletcher_WELCOME (C_INFO)
{
   npc          = BDT_10315_Fletcher;
   nr           = 1;
   condition    = DIA_Fletcher_WELCOME_Condition;
   information  = DIA_Fletcher_WELCOME_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Fletcher_WELCOME_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Fletcher_WELCOME_Info()
{
    AI_Output (self, other ,"DIA_Fletcher_WELCOME_03_01"); //Witaj œwie¿aku. Jestem Fletcher.
    AI_Output (other, self ,"DIA_Fletcher_WELCOME_15_02"); //Nazywam siê Vinc.
    AI_Output (self, other ,"DIA_Fletcher_WELCOME_03_03"); //Dobra, opowiem ci co i jak. Jak widzisz zorganizowaliœmy obóz. Ale nadal brakuje mu jeszcze du¿o do dobrze zorganizowanego. 
    AI_Output (self, other ,"DIA_Fletcher_WELCOME_03_04"); //Ja dowodzê pierwsz¹ czêœci¹ obozu. Tutaj znajdziesz myœliwych oraz tych, którzy nie mog¹ wejœæ do obozu.
    AI_Output (self, other ,"DIA_Fletcher_WELCOME_03_05"); //Ale ty mo¿esz to zmieniæ. Nikt nie powiedzia³, ¿e musisz tu sterczeæ.
    AI_Output (other, self ,"DIA_Fletcher_WELCOME_15_06"); //Czyli jestem w waszej bandzie?
    AI_Output (self, other ,"DIA_Fletcher_WELCOME_03_07"); //Oczywiœcie! Od teraz jesteœ jednym z poszukiwanych przez wojsko i stra¿ Khorinis.
    AI_Output (self, other ,"DIA_Fletcher_WELCOME_03_08"); //WeŸ ten pancerz i broñ. Nie jest to jakiœ szczyt dobrego ekwipunku, ale to tutaj ci siê przyda.
    AI_Output (self, other ,"DIA_Fletcher_WELCOME_03_09"); //I pozb¹dŸ siê tego starego ubrania. Teraz jesteœ bandyt¹.
    CreateInvItems (self, ItMw_1h_Sld_Axe, 1);
    B_GiveInvItems (self, other, ItMw_1h_Sld_Axe, 1);
    CreateInvItems (other, ITAR_BDT_M, 1);


    Info_ClearChoices		(DIA_Fletcher_WELCOME);
    Info_AddChoice		(DIA_Fletcher_WELCOME, "Dobra, pozbêdê siê tych ³achów.", DIA_Fletcher_WELCOME_IWILLBURN);
};

FUNC VOID DIA_Fletcher_WELCOME_IWILLBURN()
{
    AI_Output (other, self ,"DIA_Fletcher_WELCOME_IWILLBURN_15_01"); //Dobra, pozbêdê siê tych ³achów.
    AI_Output (self, other ,"DIA_Fletcher_WELCOME_IWILLBURN_03_02"); //Œwietnie. Przy okazji dostaniesz pierwsze zadanie.
    AI_Output (other, self ,"DIA_Fletcher_WELCOME_IWILLBURN_15_03"); //Zadanie?
    AI_Output (self, other ,"DIA_Fletcher_WELCOME_IWILLBURN_03_04"); //Tak. Nie zamierzasz chyba nic nie robiæ jak reszta bandy?
    AI_Output (self, other ,"DIA_Fletcher_WELCOME_IWILLBURN_03_05"); //Organizacja tego obozu to podstawa. PrzejdŸ siê i spytaj parê osób o ich gotowoœæ. 
    AI_Output (other, self ,"DIA_Fletcher_WELCOME_IWILLBURN_15_06"); //Kogo dok³adnie?
    AI_Output (self, other ,"DIA_Fletcher_WELCOME_IWILLBURN_03_07"); //Logan, Edgor, Ramon, Arvo i Miguel. 
    AI_Output (self, other ,"DIA_Fletcher_WELCOME_IWILLBURN_03_08"); //Przy okazji zapoznasz siê z nasz¹ band¹.
    MIS_Report = LOG_RUNNING;

    Log_CreateTopic            (TOPIC_Report, LOG_MISSION);
    Log_SetTopicStatus       (TOPIC_Report, LOG_RUNNING);
    B_LogEntry                     (TOPIC_Report,"Fletcher przyj¹³ mnie w poczet bandytów. Nigdy bym siê nie spodziewa³, ¿e do³¹czê do takich ludzi. Ale nie pozosta³ mi ¿aden wybór po zdarzeniach w Khorinis. Moim pierwszym zadaniem jest wypytaæ paru goœci czy s¹ gotowi. Nic trudnego. Poznam przynajmniej ludzi i bêdê nieco bezpieczniejszy. Ciekawi mnie jeszcze miejsce, w którym siê znajdujemy. W mieœcie nikt nie wiedzia³ o tej cieœninie, któr¹ przep³yn¹³em...");
    Info_ClearChoices		(DIA_Fletcher_WELCOME);
	KAPITEL = 1;
	IntroduceChapter (KapWechsel_1,KapWechsel_1_Text,"chapter1.tga","chapter_01.wav", 6000);
};

//========================================
//-----------------> AboutTheReport
//========================================

INSTANCE DIA_Fletcher_AboutTheReport (C_INFO)
{
   npc          = BDT_10315_Fletcher;
   nr           = 1;
   condition    = DIA_Fletcher_AboutTheReport_Condition;
   information  = DIA_Fletcher_AboutTheReport_Info;
   permanent	= FALSE;
   description	= "Co do gotowoœci...";
};

FUNC INT DIA_Fletcher_AboutTheReport_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Logan_REPORT))
    && (Npc_KnowsInfo (other, DIA_Addon_Edgor_HEY))
    && (Npc_KnowsInfo (other, DIA_Addon_Ramon_WhoAreYou))
    && (Npc_KnowsInfo (other, DIA_Arvo_WhoAreYou))
    && (Npc_KnowsInfo (other, DIA_Addon_Miguel_LookingForMiguel))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Fletcher_AboutTheReport_Info()
{
    AI_Output (other, self ,"DIA_Fletcher_AboutTheReport_15_01"); //Co do gotowoœci...
    AI_Output (self, other ,"DIA_Fletcher_AboutTheReport_03_02"); //Hm?
    AI_Output (other, self ,"DIA_Fletcher_AboutTheReport_15_03"); //Pozna³em Logana. Czeka na robotê od ciebie i przekazujê informacje od niego. Na polance niedaleko s¹ b³otne wê¿e. 
    AI_Output (self, other ,"DIA_Fletcher_AboutTheReport_03_04"); //Nie pró¿nowa³. Dobra robota. Bêdzie trzeba siê nimi zaj¹æ.
    AI_Output (other, self ,"DIA_Fletcher_AboutTheReport_15_05"); //Edgor bardzo chêtnie czeka na pracê.
    AI_Output (self, other ,"DIA_Fletcher_AboutTheReport_03_06"); //Doskonale. Bêdzie sporo pracy.
    AI_Output (other, self ,"DIA_Fletcher_AboutTheReport_15_07"); //Spotka³em Miguela. Czeka na robotê od ciebie oraz powiedzia³ abym wspomnia³ ci o zio³ach, które tu rosn¹.
    AI_Output (self, other ,"DIA_Fletcher_AboutTheReport_03_08"); //Nie znam siê na roœlinach, ale Miguel z pewnoœci¹ zrobi z nich u¿ytek. Alternatywa dla mikstur leczniczych bardzo siê przyda.
    AI_Output (other, self ,"DIA_Fletcher_AboutTheReport_15_09"); //Ramon nie chcia³ zbyt ze mn¹ rozmawiaæ.
    AI_Output (self, other ,"DIA_Fletcher_AboutTheReport_03_10"); //Daj sobie z nim spokój. Gbur z niego i tyle. Zapewne dostanie robotê stra¿nika.
    AI_Output (other, self ,"DIA_Fletcher_AboutTheReport_15_11"); //A co do Arvo...
    AI_Output (self, other ,"DIA_Fletcher_AboutTheReport_03_12"); //Zwyk³y œmieæ. Jest z nami odk¹d do³¹czy³ do nas Esteban i paru jego ludzi.
    AI_Output (self, other ,"DIA_Fletcher_AboutTheReport_03_13"); //Dam mu jak¹œ robotê, aby nie pa³êta³ siê mi tutaj.
    AI_Output (self, other ,"DIA_Fletcher_AboutTheReport_03_14"); //Dobra robota. Pomog³eœ mi. Teraz czeka na ciebie nowe zadanie. 
    B_LogEntry                     (TOPIC_Report,"Jeœli to by³ test zaufania to z pewnoœci¹ zdany. Pozna³em czêœæ bandy. Teraz czeka mnie kolejna robota od Fletchera.");
    Log_SetTopicStatus       (TOPIC_Report, LOG_SUCCESS);
    MIS_Report = LOG_SUCCESS;

    B_GivePlayerXP (250);
};

//========================================
//-----------------> MoreWork
//========================================

INSTANCE DIA_Fletcher_MoreWork (C_INFO)
{
   npc          = BDT_10315_Fletcher;
   nr           = 1;
   condition    = DIA_Fletcher_MoreWork_Condition;
   information  = DIA_Fletcher_MoreWork_Info;
   permanent	= FALSE;
   description	= "Nowa robota?";
};

FUNC INT DIA_Fletcher_MoreWork_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Fletcher_AboutTheReport))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Fletcher_MoreWork_Info()
{
    AI_Output (other, self ,"DIA_Fletcher_MoreWork_15_01"); //Nowa robota?
    AI_Output (self, other ,"DIA_Fletcher_MoreWork_03_02"); //Oczywiœcie. Mówi³eœ o b³otnych wê¿ach. Pójdziesz z Loganem i zapolujesz na nie.
    AI_Output (self, other ,"DIA_Fletcher_MoreWork_03_03"); //Nie chcê mieæ tych potworów zbyt blisko obozu.
    AI_Output (other, self ,"DIA_Fletcher_MoreWork_15_04"); //Dobra. Zapolujê na te okropieñstwa.
    MIS_Help_Logan = LOG_RUNNING;

    Log_CreateTopic            (TOPIC_Help_Logan, LOG_MISSION);
    Log_SetTopicStatus       (TOPIC_Help_Logan, LOG_RUNNING);
    B_LogEntry                     (TOPIC_Help_Logan,"Mam now¹ robotê. Wraz z Loganem mamy zapolowaæ na b³otne wê¿e niedaleko jakiejœ polanki. Loganowi spodoba siê, ¿e nie pójdzie tam sam.");
};

//========================================
//-----------------> FinishedHunt
//========================================

INSTANCE DIA_Fletcher_FinishedHunt (C_INFO)
{
   npc          = BDT_10315_Fletcher;
   nr           = 1;
   condition    = DIA_Fletcher_FinishedHunt_Condition;
   information  = DIA_Fletcher_FinishedHunt_Info;
   permanent	= FALSE;
   description	= "Sprawa za³atwiona. B³otne wê¿e nie stanowi¹ zagro¿enia.";
};

FUNC INT DIA_Fletcher_FinishedHunt_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Logan_SwampsharksDead))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Fletcher_FinishedHunt_Info()
{
    AI_Output (other, self ,"DIA_Fletcher_FinishedHunt_15_01"); //Sprawa za³atwiona. B³otne wê¿e nie stanowi¹ zagro¿enia.
    AI_Output (self, other ,"DIA_Fletcher_FinishedHunt_03_02"); //Œwietnie. Mamy pewnoœæ, ¿e nie podp³yn¹ one w nocy i nie po¿r¹ jednego z nas.
    AI_Output (other, self ,"DIA_Fletcher_FinishedHunt_15_03"); //Logan rozejrzy siê po okolicy.
    AI_Output (self, other ,"DIA_Fletcher_FinishedHunt_03_04"); //Dobrze. To nawet lepiej. Mia³em dla ciebie jeszcze robotê, ale s¹ pewne problemy, którymi muszê siê zaj¹æ. Pogadaj z reszt¹ ch³opaków, mo¿e znajd¹ ci zajêcie, na pewno wp³ynie to na korzyœæ obozu.
    AI_Output (self, other ,"DIA_Fletcher_FinishedHunt_03_05"); //W nagrodê weŸ te eliksiry. Pochodz¹ one prosto od magów z kolonii.
    B_LogEntry                     (TOPIC_Help_Logan,"Robota zakoñczona. W nagrodê dosta³em eliksiry lecznicze. Teraz Fletcher ma inne sprawy na g³owie. Mogê spokojnie rozejrzeæ siê po obozie i pomóc reszcie. Ale nigdy nie spodziewa³bym siê, ¿e bandyci to bêdzie moja nowa œcie¿ka w ¿yciu...");
    Log_SetTopicStatus       (TOPIC_Help_Logan, LOG_SUCCESS);
    MIS_Help_Logan = LOG_SUCCESS;

    B_GivePlayerXP (200);
    CreateInvItems (self, ItPo_Health_01, 6);
    B_GiveInvItems (self, other, ItPo_Health_01, 6);
};

//========================================
//-----------------> AnyPouches
//========================================

INSTANCE DIA_Fletcher_AnyPouches (C_INFO)
{
   npc          = BDT_10315_Fletcher;
   nr           = 1;
   condition    = DIA_Fletcher_AnyPouches_Condition;
   information  = DIA_Fletcher_AnyPouches_Info;
   permanent	= FALSE;
   description	= "Jest sprawa.";
};

FUNC INT DIA_Fletcher_AnyPouches_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Miguel_HelpMe)
	&& (!Npc_KnowsInfo (other, DIA_Miguel_HereAreYourPouches)))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Fletcher_AnyPouches_Info()
{
    AI_Output (other, self ,"DIA_Fletcher_AnyPouches_15_01"); //Jest sprawa. Czy w magazynie nie ma jakiœ skórzanych sakiew?
    AI_Output (self, other ,"DIA_Fletcher_AnyPouches_03_02"); //Jest coœ takiego. Z kolonii zabraliœmy tyle, ile udŸwignêliœmy. W tej najmniejszej skrzyni bêdzie parê sztuk.
    AI_Output (self, other ,"DIA_Fletcher_AnyPouches_03_03"); //WeŸ je. Na tê chwilê s¹ nam do niczego niepotrzebne.
    AI_Output (other, self ,"DIA_Fletcher_AnyPouches_15_04"); //To dla Miguela, zbiera zio³a i nie ma gdzie ich pochowaæ.
    AI_Output (self, other ,"DIA_Fletcher_AnyPouches_03_05"); //Dobrze, ¿e coœ robisz. 
    B_LogEntry                     (TOPIC_Pouches_for_Miguel,"Sakiewki znajdê w skrzyni w prowizorycznym magazynie.");
};

//========================================
//-----------------> BeCareful
//========================================

INSTANCE DIA_Fletcher_BeCareful (C_INFO)
{
   npc          = BDT_10315_Fletcher;
   nr           = 1;
   condition    = DIA_Fletcher_BeCareful_Condition;
   information  = DIA_Fletcher_BeCareful_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Fletcher_BeCareful_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Franco_NotYourBusiness))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Fletcher_BeCareful_Info()
{
    AI_Output (self, other ,"DIA_Fletcher_BeCareful_03_01"); //Uwa¿aj na niego.

    Info_ClearChoices		(DIA_Fletcher_BeCareful);
    Info_AddChoice		(DIA_Fletcher_BeCareful, "Jest niebezpieczny.", DIA_Fletcher_BeCareful_HeIsDangerous);
    Info_AddChoice		(DIA_Fletcher_BeCareful, "Mam go gdzieœ. Nie stanowi dla mnie zagro¿enia.", DIA_Fletcher_BeCareful_HesNoDanger);
};

FUNC VOID DIA_Fletcher_BeCareful_HeIsDangerous()
{
    AI_Output (other, self ,"DIA_Fletcher_BeCareful_HeIsDangerous_15_01"); //Jest niebezpieczny.
    AI_Output (self, other ,"DIA_Fletcher_BeCareful_HeIsDangerous_03_02"); //Ponoæ mia³ kiedyœ w³asn¹ bandê i straci³ j¹. 
    AI_Output (self, other ,"DIA_Fletcher_BeCareful_HeIsDangerous_03_03"); //Jak ju¿ wspomnia³eœ jest niebezpieczny. Miej go na uwadze. Ten typ mo¿e narobiæ w obozie niez³ego zamieszania.
	MIS_Franco = LOG_SUCCESS;
    Log_SetTopicStatus       (TOPIC_Franco, LOG_SUCCESS);
    B_LogEntry                     (TOPIC_Franco,"Fletcher przestrzeg³ mnie przed tym Franko. Muszê bardziej na niego uwa¿aæ. Ten bandyta bêdzie sprawia³ k³opoty. ");
    Info_ClearChoices		(DIA_Fletcher_BeCareful);
};

FUNC VOID DIA_Fletcher_BeCareful_HesNoDanger()
{
    AI_Output (other, self ,"DIA_Fletcher_BeCareful_HesNoDanger_15_01"); //Mam go gdzieœ. Nie stanowi dla mnie zagro¿enia.
    AI_Output (self, other ,"DIA_Fletcher_BeCareful_HesNoDanger_03_02"); //Nie lekcewa¿ nigdy nikogo i miej siê na bacznoœci, m³odzieñcze. Nowi, tacy jak ty, mog¹ wielu rzeczy nie dostrzegaæ.
	MIS_Franco = LOG_SUCCESS;
    Log_SetTopicStatus       (TOPIC_Franco, LOG_SUCCESS);
    B_LogEntry                     (TOPIC_Franco,"Fletcher przestrzeg³ mnie przed tym Franko. Muszê bardziej na niego uwa¿aæ. Ten bandyta bêdzie sprawia³ k³opoty. ");
    Info_ClearChoices		(DIA_Fletcher_BeCareful);
};

//========================================
//-----------------> AboutTheMages
//========================================

INSTANCE DIA_Fletcher_AboutTheMages (C_INFO)
{
   npc          = BDT_10315_Fletcher;
   nr           = 1;
   condition    = DIA_Fletcher_AboutTheMages_Condition;
   information  = DIA_Fletcher_AboutTheMages_Info;
   permanent	= FALSE;
   description	= "O jakich magach mówi³eœ?";
};

FUNC INT DIA_Fletcher_AboutTheMages_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Fletcher_FinishedHunt))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Fletcher_AboutTheMages_Info()
{
    AI_Output (other, self ,"DIA_Fletcher_AboutTheMages_15_01"); //O jakich magach mówi³eœ?
    AI_Output (self, other ,"DIA_Fletcher_AboutTheMages_03_02"); //O tych, co stworzyli barierê. W Starym Obozie byli magowie ognia, a w Nowym Obozie magowie wody.
    AI_Output (other, self ,"DIA_Fletcher_AboutTheMages_15_03"); //Co siê sta³o z tymi magami?
    AI_Output (self, other ,"DIA_Fletcher_AboutTheMages_03_04"); //Jeœli chodzi o magów wody to jestem przekonany, ¿e zdo³ali opuœciæ dolinê.
    AI_Output (self, other ,"DIA_Fletcher_AboutTheMages_03_05"); //Ale magowie ognia ju¿ nie.
    AI_Output (other, self ,"DIA_Fletcher_AboutTheMages_15_06"); //Dlaczego?
    AI_Output (self, other ,"DIA_Fletcher_AboutTheMages_03_07"); //Wszyscy nie ¿yj¹. Sprzeciwili siê Gomezowi. By³emu najpotê¿niejszemu cz³owiekowi w kolonii karnej.
    AI_Output (other, self ,"DIA_Fletcher_AboutTheMages_15_08"); //Zamordowaliœcie magów ognia?! (zdziwienie)
    AI_Output (self, other ,"DIA_Fletcher_AboutTheMages_03_09"); //Pos³uchaj. Nie by³o mnie przy tym i ja tego nie zrobi³em. Poza tym nie zna³eœ tych magów ognia. Oni wszyscy byli aroganccy.
    AI_Output (other, self ,"DIA_Fletcher_AboutTheMages_15_10"); //Hmm...
    AI_Output (self, other ,"DIA_Fletcher_AboutTheMages_03_11"); //Dodam, ¿e zostali „pomszczeni”. Pasuje?
    AI_Output (other, self ,"DIA_Fletcher_AboutTheMages_15_12"); //Kto ich pomœci³?
    AI_Output (self, other ,"DIA_Fletcher_AboutTheMages_03_13"); //Nie znam jego imienia. Widzia³em go tylko parê razy.
    AI_Output (self, other ,"DIA_Fletcher_AboutTheMages_03_14"); //Za pierwszym razem pyta³ siê mnie o Neka. PóŸniej go nie widzia³em. Ale du¿o s³ysza³em.
    AI_Output (self, other ,"DIA_Fletcher_AboutTheMages_03_15"); //Pomaga³ œwirom z sekty, a póŸniej magom wody. Zaraz po tym zawali³a siê Stara Kopalnia. Wtedy magowie ognia sprzeciwili siê Gomezowi. Po kilku dniach do zamku wpad³ ten goœæ.
    AI_Output (self, other ,"DIA_Fletcher_AboutTheMages_03_16"); //Jego krótka wizyta zaowocowa³a w œmieræ wiêkszoœci stra¿ników i magnatów. Ponoæ mia³ przy sobie niespotykane dot¹d ostrze. Jeden stra¿nik zgin¹³ od p³omieni. 
    AI_Output (self, other ,"DIA_Fletcher_AboutTheMages_03_17"); //Nie chcê mieæ do czynienia z takimi przedmiotami.
    AI_Output (other, self ,"DIA_Fletcher_AboutTheMages_15_18"); //Ciekawa historia.
};

//========================================
//-----------------> WhoWasNek
//========================================

INSTANCE DIA_Fletcher_WhoWasNek (C_INFO)
{
   npc          = BDT_10315_Fletcher;
   nr           = 2;
   condition    = DIA_Fletcher_WhoWasNek_Condition;
   information  = DIA_Fletcher_WhoWasNek_Info;
   permanent	= FALSE;
   description	= "Kim by³ Nek?";
};

FUNC INT DIA_Fletcher_WhoWasNek_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Fletcher_AboutTheMages))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Fletcher_WhoWasNek_Info()
{
    AI_Output (other, self ,"DIA_Fletcher_WhoWasNek_15_01"); //Kim by³ Nek?
    AI_Output (self, other ,"DIA_Fletcher_WhoWasNek_03_02"); //Szkoda gadaæ. Wraz z nim patrolowaliœmy okolice areny. Tyle, ¿e Nek lubi³ popiæ z kimkolwiek.
    AI_Output (self, other ,"DIA_Fletcher_WhoWasNek_03_03"); //Skumplowa³ siê z paroma bandytami z Nowego Obozu. Po paru dniach dowiedzia³em siê, ¿e nie ¿yje.
    AI_Output (other, self ,"DIA_Fletcher_WhoWasNek_15_04"); //Smutna historia.
    AI_Output (self, other ,"DIA_Fletcher_WhoWasNek_03_05"); //Eee tam! Wed³ug mnie ta szuja zabi³a jakiegoœ kopacza i da³a nogê do szkodników.
    AI_Output (self, other ,"DIA_Fletcher_WhoWasNek_03_06"); //Zreszt¹ to stare dzieje. 
};

//========================================
//-----------------> HowAreThings
//========================================

INSTANCE DIA_Fletcher_HowAreThings (C_INFO)
{
   npc          = BDT_10315_Fletcher;
   nr           = 1;
   condition    = DIA_Fletcher_HowAreThings_Condition;
   information  = DIA_Fletcher_HowAreThings_Info;
   permanent	= FALSE;
   description	= "Jak siê maj¹ sprawy?";
};

FUNC INT DIA_Fletcher_HowAreThings_Condition()
{
    if (MIS_Report == LOG_SUCCESS)
    && (KAPITEL == 1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Fletcher_HowAreThings_Info()
{
    AI_Output (other, self ,"DIA_Fletcher_HowAreThings_15_01"); //Jak siê maj¹ sprawy?
    AI_Output (self, other ,"DIA_Fletcher_HowAreThings_03_02"); //Ca³kiem nieŸle. Paru coœ buduje lub pi³uje deski. Jest paru myœliwych i paru obiboków.
    AI_Output (self, other ,"DIA_Fletcher_HowAreThings_03_03"); //No i jest ca³kiem pracowity goœæ!
    AI_Output (other, self ,"DIA_Fletcher_HowAreThings_15_04"); //Kto taki?
    AI_Output (self, other ,"DIA_Fletcher_HowAreThings_03_05"); //No ty! A któ¿ inny? (œmiech)
};

//========================================
//-----------------> GoodNews
//========================================

INSTANCE DIA_Fletcher_GoodNews (C_INFO)
{
   npc          = BDT_10315_Fletcher;
   nr           = 1;
   condition    = DIA_Fletcher_GoodNews_Condition;
   information  = DIA_Fletcher_GoodNews_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Fletcher_GoodNews_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Fletcher_BeCareful))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Fletcher_GoodNews_Info()
{
    AI_Output (self, other ,"DIA_Fletcher_GoodNews_03_01"); //Mam dobre wieœci. Od teraz masz wstêp do obozu. 
    AI_Output (other, self ,"DIA_Fletcher_GoodNews_15_02"); //Œwietnie... To znaczy dziêki. Jakieœ rady?
    AI_Output (self, other ,"DIA_Fletcher_GoodNews_03_03"); //Nie daj siê nikomu! Jeœli jednak chcesz mieæ wstêp do kopalni, to pogadaj z Estebanem. To on decyduje o tym. Powodzenia.
	IntroduceChapter (KapWechsel_2,KapWechsel_2_Text,"chapter2.tga","chapter_01.wav", 6000);
	KAPITEL = 2;
};

//========================================
//-----------------> BroughtList
//========================================

INSTANCE DIA_Fletcher_BroughtList (C_INFO)
{
   npc          = BDT_10315_Fletcher;
   nr           = 1;
   condition    = DIA_Fletcher_BroughtList_Condition;
   information  = DIA_Fletcher_BroughtList_Info;
   permanent	= FALSE;
   description	= "Mam tu listê od Fiska.";
};

FUNC INT DIA_Fletcher_BroughtList_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Fisk_WannaEarnSomeMoney))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Fletcher_BroughtList_Info()
{
    AI_Output (other, self ,"DIA_Fletcher_BroughtList_15_01"); //Mam tu listê od Fiska.
    AI_Output (self, other ,"DIA_Fletcher_BroughtList_03_02"); //Oh, œwietnie. Be³ty, strza³y, trochê wytrychów...
    AI_Output (self, other ,"DIA_Fletcher_BroughtList_03_03"); //Narzêdzia i gwoŸdzie.
    AI_Output (other, self ,"DIA_Fletcher_BroughtList_15_04"); //Dobra. Zapisz to.
    AI_Output (self, other ,"DIA_Fletcher_BroughtList_03_05"); //Chwila.
    B_UseFakeScroll ();
    AI_Output (self, other ,"DIA_Fletcher_BroughtList_03_06"); //Za³atwione.
    AI_Output (other, self ,"DIA_Fletcher_BroughtList_15_07"); //To ja nie przeszkadzam.
    AI_Output (self, other ,"DIA_Fletcher_BroughtList_03_08"); //Do zobaczenia.
    B_LogEntry                     (TOPIC_List_of_Goods,"Kolejna osoba z listy za³atwiona. Fletcher dopisa³ potrzebne materia³y.");
};

//========================================
//-----------------> PackageForYou
//========================================

INSTANCE DIA_Fletcher_PackageForYou (C_INFO)
{
   npc          = BDT_10315_Fletcher;
   nr           = 1;
   condition    = DIA_Fletcher_PackageForYou_Condition;
   information  = DIA_Fletcher_PackageForYou_Info;
   permanent	= FALSE;
   description	= "Mam dla ciebie towar od piratów.";
};

FUNC INT DIA_Fletcher_PackageForYou_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Tom_GotThePacks))
    && (Npc_HasItems (other, ItMi_Packet_Fletcher) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Fletcher_PackageForYou_Info()
{
    AI_Output (other, self ,"DIA_Fletcher_PackageForYou_15_01"); //Mam dla ciebie towar od piratów.
    AI_Output (self, other ,"DIA_Fletcher_PackageForYou_03_02"); //Œwietnie, ch³opcze! Oto w³aœnie chodzi. Nie jesteœ nierobem. Oby tak dalej.
    B_LogEntry                     (TOPIC_Packs_from_Pirates,"Fletcher pochwali³ robotê. I kolejna paczka z g³owy.");
    B_GiveInvItems (other, self, ItMi_Packet_Fletcher, 1);
	Npc_RemoveInvItems (self, ItMi_Packet_Fletcher,1); 
};

//========================================
//-----------------> NeedBetterArmour
//========================================

INSTANCE DIA_Fletcher_NeedBetterArmour (C_INFO)
{
   npc          = BDT_10315_Fletcher;
   nr           = 1;
   condition    = DIA_Fletcher_NeedBetterArmour_Condition;
   information  = DIA_Fletcher_NeedBetterArmour_Info;
   permanent	= FALSE;
   description	= "Potrzebujê lepszego pancerza.";
};

FUNC INT DIA_Fletcher_NeedBetterArmour_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Bloodwyn_WelcomeNewcomer))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Fletcher_NeedBetterArmour_Info()
{
    AI_Output (other, self ,"DIA_Fletcher_NeedBetterArmour_15_01"); //Potrzebujê lepszego pancerza.
    AI_Output (self, other ,"DIA_Fletcher_NeedBetterArmour_03_02"); //Ho ho, s³ysza³em o twojej rozmowie z Bloodwynem.
    AI_Output (other, self ,"DIA_Fletcher_NeedBetterArmour_15_03"); //Wieœci szybko siê roznosz¹.
    AI_Output (self, other ,"DIA_Fletcher_NeedBetterArmour_03_04"); //A jeszcze niedawno raczkowa³eœ w tym obozie.
    AI_Output (self, other ,"DIA_Fletcher_NeedBetterArmour_03_05"); //Dam ci taki pancerz, ale jak zrobisz coœ dla obozu.
};

//========================================
//-----------------> CanIGetArmour
//========================================

INSTANCE DIA_Fletcher_CanIGetArmour (C_INFO)
{
   npc          = BDT_10315_Fletcher;
   nr           = 2;
   condition    = DIA_Fletcher_CanIGetArmour_Condition;
   information  = DIA_Fletcher_CanIGetArmour_Info;
   permanent	= TRUE;
   description	= "Czy mogê ju¿ dostaæ pancerz?";
};

FUNC INT DIA_Fletcher_CanIGetArmour_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Fletcher_NeedBetterArmour))
    && (GetNewArmour != TRUE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Fletcher_CanIGetArmour_Info()
{
    AI_Output (other, self ,"DIA_Fletcher_CanIGetArmour_15_01"); //Czy mogê ju¿ dostaæ pancerz?
    AI_Output (self, other ,"DIA_Fletcher_CanIGetArmour_03_02"); //Niech no pomyœlê...
    if (MIS_List_of_Goods == LOG_SUCCESS)
    {
        AI_Output (self, other ,"DIA_Fletcher_CanIGetArmour_03_03"); //Pogada³eœ z ch³opakami o liœcie towarów. W tym i ze mn¹.
        GetNewArmour += 1;
    };
    if (MIS_Packs_from_Pirates == LOG_SUCCESS)
    {
        AI_Output (self, other ,"DIA_Fletcher_CanIGetArmour_03_04"); //Rozda³eœ paczki piratów, które za³atwi³ Tom.
        GetNewArmour += 1;
    };
    if (MIS_Transport == LOG_SUCCESS)
    {
        AI_Output (self, other ,"DIA_Fletcher_CanIGetArmour_03_05"); //No i by³eœ w konwoju wiêŸniów do kopalni.
        GetNewArmour += 1;
    };
    if (GetNewArmour == 3)
    {
        AI_Output (self, other ,"DIA_Fletcher_CanIGetArmour_03_06"); //IdŸ do Huno i powiedz, ¿e to ja ciê przysy³am.
        AI_Output (other, self ,"DIA_Fletcher_CanIGetArmour_15_07"); //Dobra. Dziêki za pomoc.
        GetNewArmour = TRUE;
        B_LogEntry                     (TOPIC_Better_Armour,"Fletcher kaza³ mi iœæ do kowala Huno i powiedzieæ, ¿e to on mnie przys³a³. Wtedy dostanê ten pancerz.");
    }
    else
    {
        AI_Output (self, other ,"DIA_Fletcher_CanIGetArmour_03_08"); //To nie wystarczy, musisz zrobiæ coœ jeszcze dla obozu.
        GetNewArmour = 0;
    };
};

