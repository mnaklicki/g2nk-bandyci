var int WaitDayForTom;

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Addon_Tom_EXIT(C_INFO)
{
	npc             = BDT_1080_Addon_Tom;
	nr              = 999;
	condition	= DIA_Addon_Tom_EXIT_Condition;
	information	= DIA_Addon_Tom_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Addon_Tom_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Tom_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> IHaveTheList
//========================================

INSTANCE DIA_Addon_Tom_IHaveTheList (C_INFO)
{
   npc          = BDT_1080_Addon_Tom;
   nr           = 1;
   condition    = DIA_Addon_Tom_IHaveTheList_Condition;
   information  = DIA_Addon_Tom_IHaveTheList_Info;
   permanent	= FALSE;
   description	= "Czeœæ Tom. Mam listê towarów dla piratów.";
};

FUNC INT DIA_Addon_Tom_IHaveTheList_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Fisk_GotYourList))
    && (Npc_HasItems (other, ItWr_ListOfGoods) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Tom_IHaveTheList_Info()
{
    AI_Output (other, self ,"DIA_Addon_Tom_IHaveTheList_15_01"); //Czeœæ Tom. Mam listê towarów dla piratów.
    AI_Output (self, other ,"DIA_Addon_Tom_IHaveTheList_03_02"); //Œwietnie. W³aœnie czeka³em kiedy Fisk siê z ni¹ ruszy.
    AI_Output (other, self ,"DIA_Addon_Tom_IHaveTheList_15_03"); //Te¿ z ni¹ czeka³em.
    AI_Output (self, other ,"DIA_Addon_Tom_IHaveTheList_03_04"); //Fisk to Fisk. Znaj¹c go, to dostaniesz od niego niez³¹ nagrodê.
    AI_Output (other, self ,"DIA_Addon_Tom_IHaveTheList_15_05"); //Co na przyk³ad?
    AI_Output (self, other ,"DIA_Addon_Tom_IHaveTheList_03_06"); //Jak¹œ niez³¹ broñ, t¹, któr¹ ja posiadam otrzyma³em w³aœnie od niego.
    AI_Output (self, other ,"DIA_Addon_Tom_IHaveTheList_03_07"); //Za³atwi³em mu od piratów nie lada zlecenie i op³aci³o mi siê.
    AI_Output (other, self ,"DIA_Addon_Tom_IHaveTheList_15_08"); //Klasztor warty jest œwiêceñ...
    AI_Output (self, other ,"DIA_Addon_Tom_IHaveTheList_03_09"); //Co? (zdziwienie)
    AI_Output (other, self ,"DIA_Addon_Tom_IHaveTheList_15_10"); //Nie, nic.
    AI_Output (self, other ,"DIA_Addon_Tom_IHaveTheList_03_11"); //Dobra. Powiedz Fiskowi, ¿e nied³ugo wyruszam. Mo¿liwe, ¿e bêdê jutro.
    AI_Output (other, self ,"DIA_Addon_Tom_IHaveTheList_15_12"); //Przeka¿ê mu.
	WaitDayForTom = Wld_GetDay();
    B_LogEntry                     (TOPIC_List_of_Goods,"Tom oœwiadczy³, ¿e nied³ugo wyruszy i mo¿liwe, ¿e spotkam go ju¿ jutro. Pora iœæ do Fiska.");
    B_GiveInvItems (other, self, ItWr_ListOfGoods, 1);
};

//========================================
//-----------------> GotThePacks
//========================================

INSTANCE DIA_Addon_Tom_GotThePacks (C_INFO)
{
   npc          = BDT_1080_Addon_Tom;
   nr           = 1;
   condition    = DIA_Addon_Tom_GotThePacks_Condition;
   information  = DIA_Addon_Tom_GotThePacks_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Tom_GotThePacks_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Tom_IHaveTheList))
    && (WaitDayForTom < Wld_GetDay() )
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Tom_GotThePacks_Info()
{
    AI_Output (self, other ,"DIA_Addon_Tom_GotThePacks_03_01"); //Witaj. Mam paczki od piratów. Cholernie ciê¿kie.
    AI_Output (other, self ,"DIA_Addon_Tom_GotThePacks_15_02"); //Roznieœæ?
    AI_Output (self, other ,"DIA_Addon_Tom_GotThePacks_03_03"); //By³oby mi³o. Oddaj to tym, co wpisali siê na listê.
    AI_Output (other, self ,"DIA_Addon_Tom_GotThePacks_15_04"); //Jasna sprawa.
    MIS_Packs_from_Pirates = LOG_RUNNING;

    Log_CreateTopic            (TOPIC_Packs_from_Pirates, LOG_MISSION);
    Log_SetTopicStatus       (TOPIC_Packs_from_Pirates, LOG_RUNNING);
    B_LogEntry                     (TOPIC_Packs_from_Pirates,"Tom powróci³ od piratów. Przyniós³ paczki, które od nich zakupi³, a ja podj¹³em siê ich rozdania. Czasami w tym obozie jest cholernie nudno.");
    CreateInvItems (other, ItMi_Packet_Snaf, 1);
    CreateInvItems (other, ItMi_Packet_Scatty, 1);
    CreateInvItems (other, ItMi_Packet_Huno, 1);
    CreateInvItems (other, ItMi_Packet_Fletcher, 1);
    CreateInvItems (other, ItMi_Packet_Thorus, 1);
    CreateInvItems (other, ItMi_Packet_Fisk, 1);
};

//========================================
//-----------------> PackagesGiven
//========================================

INSTANCE DIA_Addon_Tom_PackagesGiven (C_INFO)
{
   npc          = BDT_1080_Addon_Tom;
   nr           = 1;
   condition    = DIA_Addon_Tom_PackagesGiven_Condition;
   information  = DIA_Addon_Tom_PackagesGiven_Info;
   permanent	= FALSE;
   description	= "Paczki rozdane.";
};

FUNC INT DIA_Addon_Tom_PackagesGiven_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Snaf_PackageForYou))
    && (Npc_KnowsInfo (other, DIA_Addon_Scatty_PackageForYou))
    && (Npc_KnowsInfo (other, DIA_Addon_Huno_PackageForYou))
    && (Npc_KnowsInfo (other, DIA_Fletcher_PackageForYou))
    && (Npc_KnowsInfo (other, DIA_Addon_Thorus_PackageForYou))
    && (Npc_KnowsInfo (other, DIA_Addon_Fisk_PackageForYou))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Tom_PackagesGiven_Info()
{
    AI_Output (other, self ,"DIA_Addon_Tom_PackagesGiven_15_01"); //Paczki rozdane.
    AI_Output (self, other ,"DIA_Addon_Tom_PackagesGiven_03_02"); //Œwietnie. Nied³ugo znów udam siê do piratów. Jakbyœ czegoœ potrzebowa³, to wiesz do kogo iœæ.
    AI_Output (other, self ,"DIA_Addon_Tom_PackagesGiven_15_03"); //Jasna sprawa.
    B_LogEntry                     (TOPIC_Packs_from_Pirates,"Ka¿dy otrzyma³ swoj¹ paczkê od piratów. Moje zadanie skoñczone.");
    Log_SetTopicStatus       (TOPIC_Packs_from_Pirates, LOG_SUCCESS);
    MIS_Packs_from_Pirates = LOG_SUCCESS;
};

//========================================
//-----------------> WhatHappened
//========================================

INSTANCE DIA_Addon_Tom_WhatHappened (C_INFO)
{
   npc          = BDT_1080_Addon_Tom;
   nr           = 1;
   condition    = DIA_Addon_Tom_WhatHappened_Condition;
   information  = DIA_Addon_Tom_WhatHappened_Info;
   permanent	= FALSE;
   important	= TRUE;
};

FUNC INT DIA_Addon_Tom_WhatHappened_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Miguel_AreYouOkay))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Tom_WhatHappened_Info()
{
    AI_Output (self, other ,"DIA_Addon_Tom_WhatHappened_03_01"); //Ch³opie, ¿yjesz?
    AI_Output (other, self ,"DIA_Addon_Tom_WhatHappened_15_02"); //Jedyny, który spyta³.
    AI_Output (self, other ,"DIA_Addon_Tom_WhatHappened_03_03"); //Upad³eœ na ziemiê z du¿ym hukiem. Miguel da³ mi jak¹œ recepturê, ¿eby by³o ci lepiej.
    AI_Output (self, other ,"DIA_Addon_Tom_WhatHappened_03_04"); //Mia³eœ gor¹czkê. Lucia nieustannie by³a obok ciebie.
    AI_Output (other, self ,"DIA_Addon_Tom_WhatHappened_15_05"); //Lucia...?
    AI_Output (self, other ,"DIA_Addon_Tom_WhatHappened_03_06"); //Nie myœl o niej teraz. Wygl¹dasz ju¿ lepiej.
    AI_Output (other, self ,"DIA_Addon_Tom_WhatHappened_15_07"); //Wiesz kto móg³ mi to zrobiæ?
    AI_Output (self, other ,"DIA_Addon_Tom_WhatHappened_03_08"); //Wiem. 
    AI_Output (other, self ,"DIA_Addon_Tom_WhatHappened_15_09"); //(spokojnie) Kto?
    AI_Output (self, other ,"DIA_Addon_Tom_WhatHappened_03_10"); //Jak po³o¿yliœmy ciê na górze, spotka³em noc¹ Arvo.
    AI_Output (self, other ,"DIA_Addon_Tom_WhatHappened_03_11"); //By³ strasznie z³y i chyba przestraszony. Zwykle kogoœ zaczepia przechodz¹c, ale mnie ca³kowicie ola³. Jakbym by³ duchem.
    AI_Output (self, other ,"DIA_Addon_Tom_WhatHappened_03_12"); //I wtedy wypad³a mu pewna kartka. Sam j¹ przeczytaj.

    CreateInvItems (self, ItWr_ArvoPoisoning, 1);
    B_GiveInvItems (self, other, ItWr_ArvoPoisoning, 1);

	Npc_ExchangeRoutine (BDT_10316_Arvo, "Final");
	AI_Teleport (BDT_10316_Arvo, "ADW_CANYON_PATH_TO_BANDITS_06E");
	
    B_LogEntry                     (TOPIC_Illness,"Tom jak zwykle by³ pomocny. Ale teraz czas na szczer¹ rozmowê ze Snafem.");
};

//========================================
//-----------------> WhatDidYouDo
//========================================

INSTANCE DIA_Addon_Tom_WhatDidYouDo (C_INFO)
{
   npc          = BDT_1080_Addon_Tom;
   nr           = 1;
   condition    = DIA_Addon_Tom_WhatDidYouDo_Condition;
   information  = DIA_Addon_Tom_WhatDidYouDo_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Tom_WhatDidYouDo_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Snaf_ItWasArvo))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Tom_WhatDidYouDo_Info()
{
    AI_Output (self, other ,"DIA_Addon_Tom_WhatDidYouDo_03_01"); //Co zrobi³eœ ze Snafem?
    if (SnafAngered == TRUE)
    {
        AI_Output (other, self ,"DIA_Addon_Tom_WhatDidYouDo_15_02"); //Nie wybaczê mu tego nigdy.
        AI_Output (self, other ,"DIA_Addon_Tom_WhatDidYouDo_03_03"); //Ale czy to dobra droga? Zreszt¹ ja tego nie oceniam.
    }
    else
    {
        AI_Output (other, self ,"DIA_Addon_Tom_WhatDidYouDo_15_04"); //Wybaczy³em mu to, ale zapamiêtam to sobie.
        AI_Output (self, other ,"DIA_Addon_Tom_WhatDidYouDo_03_05"); //Nie wiem czy ja by³bym sk³onny coœ takiego wybaczyæ.
    };
    AI_Output (self, other ,"DIA_Addon_Tom_WhatDidYouDo_03_06"); //A co z Arvo?
    AI_Output (other, self ,"DIA_Addon_Tom_WhatDidYouDo_15_07"); //Dorwê go i zabije. 
    AI_Output (self, other ,"DIA_Addon_Tom_WhatDidYouDo_03_08"); //Uwa¿aj lepiej na siebie.
    AI_Output (other, self ,"DIA_Addon_Tom_WhatDidYouDo_15_09"); //Nic mi nie... Aaa...

    Mdl_ApplyOverlayMds(other,"HUMANS_DRUNKEN.MDS");

    AI_Output (self, other ,"DIA_Addon_Tom_WhatDidYouDo_03_10"); //Spokojnie. Usi¹dŸ i odpocznij. Jesteœ nadal os³abiony.
    AI_Output (other, self ,"DIA_Addon_Tom_WhatDidYouDo_15_11"); //Nie!

    Mdl_RemoveOverlayMds(other,"HUMANS_DRUNKEN.MDS");

    AI_Output (self, other ,"DIA_Addon_Tom_WhatDidYouDo_03_12"); //Zrobisz jak uwa¿asz. Ale pamiêtaj o tym co ci powiedzia³em.

    B_LogEntry                     (TOPIC_Illness,"Wiem ju¿ ¿e ta trucizna by³a win¹ Arvo. Teraz pora dzia³aæ.");
    Log_SetTopicStatus       (TOPIC_Illness, LOG_SUCCESS);
    MIS_Illness = LOG_SUCCESS;

    MIS_Arvo = LOG_RUNNING;
    Log_CreateTopic            (TOPIC_Arvo, LOG_MISSION);
    Log_SetTopicStatus       (TOPIC_Arvo, LOG_RUNNING);
    B_LogEntry                     (TOPIC_Arvo,"Przyszed³ czas na tego œmiecia. Arvo zap³aci krwi¹ za to co chcia³ mi zrobiæ!");
};

//========================================
//-----------------> Hi
//========================================

INSTANCE DIA_Addon_Tom_Hi (C_INFO)
{
   npc          = BDT_1080_Addon_Tom;
   nr           = 1;
   condition    = DIA_Addon_Tom_Hi_Condition;
   information  = DIA_Addon_Tom_Hi_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Tom_Hi_Condition()
{
    if (Npc_IsInState (self,ZS_Talk))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Tom_Hi_Info()
{
    AI_Output (self, other ,"DIA_Addon_Tom_Hi_03_01"); //Czeœæ m³okosie. Widzê, ¿e uda³o ci siê dostaæ.
    AI_Output (self, other ,"DIA_Addon_Tom_Hi_03_02"); //Jestem Tom. Gdybyœ czegoœ potrzebowa³ to zg³oœ siê do mnie.
    AI_Output (other, self ,"DIA_Addon_Tom_Hi_15_03"); //Nazywam siê Vinc.
    AI_Output (self, other ,"DIA_Addon_Tom_Hi_03_04"); //Mi³o mi, Vinc.
};

//========================================
//-----------------> WhatDoYouDo
//========================================

INSTANCE DIA_Addon_Tom_WhatDoYouDo (C_INFO)
{
   npc          = BDT_1080_Addon_Tom;
   nr           = 2;
   condition    = DIA_Addon_Tom_WhatDoYouDo_Condition;
   information  = DIA_Addon_Tom_WhatDoYouDo_Info;
   permanent	= FALSE;
   description	= "Czym siê zajmujesz?";
};

FUNC INT DIA_Addon_Tom_WhatDoYouDo_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Tom_Hi))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Tom_WhatDoYouDo_Info()
{
    AI_Output (other, self ,"DIA_Addon_Tom_WhatDoYouDo_15_01"); //Mówi³eœ, ¿e gdybym czegoœ potrzebowa³ to mam zg³osiæ siê do ciebie. Czym siê zajmujesz?
    AI_Output (self, other ,"DIA_Addon_Tom_WhatDoYouDo_03_02"); //Handlujê z piratami. Mam z nimi bardzo dobre kontakty.
    AI_Output (self, other ,"DIA_Addon_Tom_WhatDoYouDo_03_03"); //Bez fa³szywej skromnoœci – najlepsze w tym obozie.
    AI_Output (self, other ,"DIA_Addon_Tom_WhatDoYouDo_03_04"); //Za³atwiam mnóstwo rzeczy dla ca³ego obozu.
};

//========================================
//-----------------> WhyAreYouHere
//========================================

INSTANCE DIA_Addon_Tom_WhyAreYouHere (C_INFO)
{
   npc          = BDT_1080_Addon_Tom;
   nr           = 3;
   condition    = DIA_Addon_Tom_WhyAreYouHere_Condition;
   information  = DIA_Addon_Tom_WhyAreYouHere_Info;
   permanent	= FALSE;
   description	= "Mogê spytaæ za co tu jesteœ?";
};

FUNC INT DIA_Addon_Tom_WhyAreYouHere_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Tom_Hi))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Tom_WhyAreYouHere_Info()
{
    AI_Output (other, self ,"DIA_Addon_Tom_WhyAreYouHere_15_01"); //Mogê spytaæ za co tu jesteœ?
    AI_Output (self, other ,"DIA_Addon_Tom_WhyAreYouHere_03_02"); //Pewnie, to nie jest ¿adna tajemnica.
    AI_Output (self, other ,"DIA_Addon_Tom_WhyAreYouHere_03_03"); //Kiedyœ by³em przemytnikiem. Wraz ze swoj¹ grup¹ handlowaliœmy, szmuglowaliœmy ró¿ne towary.
    AI_Output (self, other ,"DIA_Addon_Tom_WhyAreYouHere_03_04"); //Spotka³em naprawdê wiele ró¿nych osób – w tym tych samych piratów z którymi teraz handlujê.
    AI_Output (other, self ,"DIA_Addon_Tom_WhyAreYouHere_15_05"); //A jak wpad³eœ?
    AI_Output (self, other ,"DIA_Addon_Tom_WhyAreYouHere_03_06"); //Zostaliœmy zdradzeni. Zrobiliœmy kilka naprawdê udanych akcji i przynios³a nam to du¿e zyski.
    AI_Output (self, other ,"DIA_Addon_Tom_WhyAreYouHere_03_07"); //Ale i jeszcze wiêksz¹ uwagê ¿o³nierzy. Ju¿ wtedy wystawiono za nami listy goñcze.
    AI_Output (self, other ,"DIA_Addon_Tom_WhyAreYouHere_03_08"); //Mieliœmy spotkaæ siê z piratami. Oni mieli daæ nam grog i rum, a my im paczki stali.
    AI_Output (self, other ,"DIA_Addon_Tom_WhyAreYouHere_03_09"); //Nie przyp³ynêli do zatoki w której siê spotykaliœmy. Tego dnia wieczorem otoczy³ nas ca³y oddzia³ gwardzistów króla.
    AI_Output (other, self ,"DIA_Addon_Tom_WhyAreYouHere_15_10"); //Kto was zdradzi³?
    AI_Output (self, other ,"DIA_Addon_Tom_WhyAreYouHere_03_11"); //Mój najlepszy „przyjaciel” Badger. Sukinsyn zrobi³ to dla z³ota i pewnej amnestii.
    AI_Output (other, self ,"DIA_Addon_Tom_WhyAreYouHere_15_12"); //Jakiej amnestii?
    AI_Output (self, other ,"DIA_Addon_Tom_WhyAreYouHere_03_13"); //Nie zosta³ aresztowany oraz mia³ szansê uciec, gdzie pieprz roœnie.
    AI_Output (other, self ,"DIA_Addon_Tom_WhyAreYouHere_15_14"); //Co siê sta³o z reszt¹ twojej grupy?
    AI_Output (self, other ,"DIA_Addon_Tom_WhyAreYouHere_03_15"); //Jeden wyskoczy³ ze statku, ale nie uda³o mu siê w starciu z morzem.
    AI_Output (self, other ,"DIA_Addon_Tom_WhyAreYouHere_03_16"); //Reszta trafi³a do kolonii.
    AI_Output (other, self ,"DIA_Addon_Tom_WhyAreYouHere_15_17"); //Jak uda³o ci siê tam przetrwaæ?
    AI_Output (self, other ,"DIA_Addon_Tom_WhyAreYouHere_03_18"); //Tylko dziêki moim umiejêtnoœciom i znajomoœciom. Choæ to drugie to czysty przypadek.
    AI_Output (self, other ,"DIA_Addon_Tom_WhyAreYouHere_03_19"); //A teraz dalej zajmujê siê tym, czym umiem najlepiej.
};

//========================================
//-----------------> WhatsUp
//========================================

INSTANCE DIA_Addon_Tom_WhatsUp (C_INFO)
{
   npc          = BDT_1080_Addon_Tom;
   nr           = 4;
   condition    = DIA_Addon_Tom_WhatsUp_Condition;
   information  = DIA_Addon_Tom_WhatsUp_Info;
   permanent	= TRUE;
   description	= "Co s³ychaæ?";
};

FUNC INT DIA_Addon_Tom_WhatsUp_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Tom_Hi))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Tom_WhatsUp_Info()
{
    AI_Output (other, self ,"DIA_Addon_Tom_WhatsUp_15_01"); //Co s³ychaæ?
    if (KAPITEL == 3)
    {
        AI_Output (self, other ,"DIA_Addon_Tom_WhatsUp_03_02"); //To raczej ja powinienem zapytaæ. Uwa¿aj na siebie m³okosie.
    }
    else
    {
        AI_Output (self, other ,"DIA_Addon_Tom_WhatsUp_03_03"); //U mnie po staremu.
    };
};

