
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Addon_Edgor_EXIT(C_INFO)
{
	npc             = BDT_1074_Addon_Edgor;
	nr              = 999;
	condition	= DIA_Addon_Edgor_EXIT_Condition;
	information	= DIA_Addon_Edgor_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Addon_Edgor_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Edgor_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HEY
//========================================

INSTANCE DIA_Addon_Edgor_HEY (C_INFO)
{
   npc          = BDT_1074_Addon_Edgor;
   nr           = 1;
   condition    = DIA_Addon_Edgor_HEY_Condition;
   information  = DIA_Addon_Edgor_HEY_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Edgor_HEY_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Fletcher_WELCOME))
    && (Npc_IsInState (self,ZS_Talk))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Edgor_HEY_Info()
{
    AI_Output (self, other ,"DIA_Addon_Edgor_HEY_03_01"); //Hej nowy!
    AI_Output (other, self ,"DIA_Addon_Edgor_HEY_15_02"); //Vinc. 
    AI_Output (self, other ,"DIA_Addon_Edgor_HEY_03_03"); //Vinc. Ja jestem Edgor.
    AI_Output (other, self ,"DIA_Addon_Edgor_HEY_15_04"); //Przychodzê od Fletchera. Mam spytaæ, czy jesteœ gotowy do roboty.
    AI_Output (self, other ,"DIA_Addon_Edgor_HEY_03_05"); //No pewnie! On zna siê na organizacji obozu. Przeka¿ mu, ¿e jestem gotów.
    AI_Output (self, other ,"DIA_Addon_Edgor_HEY_03_06"); //No i witamy wœród bandytów. Jak podró¿ morska?
    AI_Output (other, self ,"DIA_Addon_Edgor_HEY_15_07"); //Nie rozumiem.
    AI_Output (self, other ,"DIA_Addon_Edgor_HEY_03_08"); //Rzyga³eœ? 

    Info_ClearChoices		(DIA_Addon_Edgor_HEY);
    Info_AddChoice		(DIA_Addon_Edgor_HEY, "Tak.", DIA_Addon_Edgor_HEY_YES);
    Info_AddChoice		(DIA_Addon_Edgor_HEY, "Nie.", DIA_Addon_Edgor_HEY_NO);
};

FUNC VOID DIA_Addon_Edgor_HEY_YES()
{
    AI_Output (other, self ,"DIA_Addon_Edgor_HEY_YES_15_01"); //Tak.
    AI_Output (self, other ,"DIA_Addon_Edgor_HEY_YES_03_02"); //Ja tak samo. Pewnej sztormowej nocy zarzyga³em im ca³y statek.
    AI_Output (other, self ,"DIA_Addon_Edgor_HEY_YES_15_03"); //Spodziewaj siê nied³ugo jakiejœ pracy.
    AI_Output (self, other ,"DIA_Addon_Edgor_HEY_YES_03_04"); //Jasna sprawa.
    Info_ClearChoices		(DIA_Addon_Edgor_HEY);
    B_LogEntry                     (TOPIC_Report,"Spotka³em Edgora. To ciekawa osoba i wydaje siê byæ bardzo dobrze nastawiony. Z niecierpliwoœci¹ czeka na pracê od Fletchera. No i wspomnia³ o zarzyganiu statku piratów. Tylko ciekawe czy ja w te pozosta³oœci przypadkiem nie wlaz³em...?");
};

FUNC VOID DIA_Addon_Edgor_HEY_NO()
{
    AI_Output (other, self ,"DIA_Addon_Edgor_HEY_NO_15_01"); //Nie.
    AI_Output (self, other ,"DIA_Addon_Edgor_HEY_NO_03_02"); //To mia³eœ szczêœcie. Ja podczas sztormowej nocy zarzyga³em im ca³y statek.
    AI_Output (other, self ,"DIA_Addon_Edgor_HEY_NO_15_03"); //Spodziewaj siê nied³ugo jakiejœ pracy.
    AI_Output (self, other ,"DIA_Addon_Edgor_HEY_NO_03_04"); //Jasna sprawa.
    Info_ClearChoices		(DIA_Addon_Edgor_HEY);
    B_LogEntry                     (TOPIC_Report,"Spotka³em Edgora. To ciekawa osoba i wydaje siê byæ bardzo dobrze nastawiony. Z niecierpliwoœci¹ czeka na pracê od Fletchera. No i wspomnia³ o zarzyganiu statku piratów. Tylko ciekawe czy ja w te pozosta³oœci przypadkiem nie wlaz³em...?");
};

//========================================
//-----------------> GoodToSee
//========================================

INSTANCE DIA_Addon_Edgor_GoodToSee (C_INFO)
{
   npc          = BDT_1074_Addon_Edgor;
   nr           = 1;
   condition    = DIA_Addon_Edgor_GoodToSee_Condition;
   information  = DIA_Addon_Edgor_GoodToSee_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Edgor_GoodToSee_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Fletcher_FinishedHunt))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Edgor_GoodToSee_Info()
{
    AI_Output (self, other ,"DIA_Addon_Edgor_GoodToSee_03_01"); //Dobrze, ¿e ciê widzê.
    AI_Output (other, self ,"DIA_Addon_Edgor_GoodToSee_15_02"); //O co chodzi?
    AI_Output (self, other ,"DIA_Addon_Edgor_GoodToSee_03_03"); //Chcê zapolowaæ na krwiopijce. S¹ niedaleko st¹d. Ale nikt nie garnie siê do pomocy.
    AI_Output (self, other ,"DIA_Addon_Edgor_GoodToSee_03_04"); //Nieroby chc¹ wejœæ do kopalni.
    AI_Output (other, self ,"DIA_Addon_Edgor_GoodToSee_15_05"); //Gdzie s¹ te krwiopijce?
    AI_Output (self, other ,"DIA_Addon_Edgor_GoodToSee_03_06"); //S¹ obok starego budynku. Chocia¿ to ruina, a nie stary budynek. To co, idziemy?
};

//========================================
//-----------------> LetsHunt
//========================================

INSTANCE DIA_Addon_Edgor_LetsHunt (C_INFO)
{
   npc          = BDT_1074_Addon_Edgor;
   nr           = 1;
   condition    = DIA_Addon_Edgor_LetsHunt_Condition;
   information  = DIA_Addon_Edgor_LetsHunt_Info;
   permanent	= FALSE;
   description	= "Dobra. Zapolujmy na te wredne owady.";
};

FUNC INT DIA_Addon_Edgor_LetsHunt_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Edgor_GoodToSee))
    {
    return TRUE;
    };
};

FUNC VOID DIA_Addon_Edgor_LetsHunt_Info()
{
    AI_Output (other, self ,"DIA_Addon_Edgor_LetsHunt_15_01"); //Dobra. Zapolujmy na te wredne owady.
    AI_Output (self, other ,"DIA_Addon_Edgor_LetsHunt_03_02"); //I o to chodzi. Za mn¹!
    Npc_ExchangeRoutine (self, "Hunt");
    AI_StopProcessInfos	(self);
	
    MIS_Edgors_Hunt = LOG_RUNNING;
    Log_CreateTopic            (TOPIC_Edgors_Hunt, LOG_MISSION);
    Log_SetTopicStatus       (TOPIC_Edgors_Hunt, LOG_RUNNING);
    B_LogEntry                     (TOPIC_Edgors_Hunt,"Wraz z Edgorem idê zapolowaæ na krwiopijce. Nie lubiê ich i z chêci¹ na nie zapoluje.");
};

//========================================
//-----------------> BloodfliesDead
//========================================

INSTANCE DIA_Addon_Edgor_BloodfliesDead (C_INFO)
{
   npc          = BDT_1074_Addon_Edgor;
   nr           = 1;
   condition    = DIA_Addon_Edgor_BloodfliesDead_Condition;
   information  = DIA_Addon_Edgor_BloodfliesDead_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Edgor_BloodfliesDead_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Edgor_LetsHunt))
    && (EdgorsDeadBloodflies >= 8)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Edgor_BloodfliesDead_Info()
{
    AI_Output (self, other ,"DIA_Addon_Edgor_BloodfliesDead_03_01"); //No! To by³o polowanie. 
    AI_Output (other, self ,"DIA_Addon_Edgor_BloodfliesDead_15_02"); //Nie lubiê krwiopijców. 
    AI_Output (self, other ,"DIA_Addon_Edgor_BloodfliesDead_03_03"); //Mi³o to s³yszeæ. Ja tych sukinsynów nienawidzê jeszcze bardziej ni¿ ty.
    AI_Output (self, other ,"DIA_Addon_Edgor_BloodfliesDead_03_04"); //Zanim tu przyp³yn¹³em, w swoich stronach by³em mistrzem w polowaniu na nie.
    AI_Output (self, other ,"DIA_Addon_Edgor_BloodfliesDead_03_05"); //Umiem wyrwaæ z nich skrzyd³a, ¿¹d³o i wydzielinê. Ooo tak, wyrywaæ...
    AI_Output (other, self ,"DIA_Addon_Edgor_BloodfliesDead_15_06"); //Cieszê siê, ¿e pomog³em. 
    AI_Output (self, other ,"DIA_Addon_Edgor_BloodfliesDead_03_07"); //A ty sk¹d jesteœ? Bo nie pyta³em.
    AI_Output (other, self ,"DIA_Addon_Edgor_BloodfliesDead_15_08"); //Z Khorinis.
    AI_Output (self, other ,"DIA_Addon_Edgor_BloodfliesDead_03_09"); //Heh, mog³em siê domyœliæ. S³ysza³em, ¿e za³atwi³eœ dwóch stra¿ników.
    AI_Output (other, self ,"DIA_Addon_Edgor_BloodfliesDead_15_10"); //Jak zobaczyli noc¹ pioruny i huk bariery zatrzymali siê, nie wiedz¹c co dalej. Uzna³em to za dobry moment ataku i ich za³atwi³em.
    AI_Output (other, self ,"DIA_Addon_Edgor_BloodfliesDead_15_11"); //Zobaczy³a to czêœæ z was. Po krótkiej rozmowie do³¹czy³em do waszego zgrupowania.
    AI_Output (self, other ,"DIA_Addon_Edgor_BloodfliesDead_03_12"); //Jesteœ w porz¹dku. Spotkajmy siê za jakiœ czas w karczmie Lou. Stawiam pierwsz¹ kolejkê. 
    AI_Output (other, self ,"DIA_Addon_Edgor_BloodfliesDead_15_13"); //Nie ma sprawy.
    AI_Output (self, other ,"DIA_Addon_Edgor_BloodfliesDead_03_14"); //I dziêki za pomoc przy krwiopijcach.
	Npc_ExchangeRoutine (self, "Drink");
    B_LogEntry                     (TOPIC_Edgors_Hunt,"Krwiopijcy s¹ ju¿ za nami. Edgor bardzo ich nie lubi. Nawet jeszcze bardziej ni¿ ja. Zaprosi³ mnie tak¿e do karczmy niejakiego Lou. Dawno czegoœ nie pi³em. Skorzystam z okazji.");
    Log_SetTopicStatus       (TOPIC_Edgors_Hunt, LOG_SUCCESS);
    MIS_Edgors_Hunt = LOG_SUCCESS;
	Npc_ExchangeRoutine (BDT_1093_Addon_Franco, "Fletcher");
	AI_Teleport	(BDT_1093_Addon_Franco, "ADW_PATH_TO_BL_02");
};

//========================================
//-----------------> WhatHappened
//========================================

INSTANCE DIA_Addon_Edgor_WhatHappened (C_INFO)
{
   npc          = BDT_1074_Addon_Edgor;
   nr           = 1;
   condition    = DIA_Addon_Edgor_WhatHappened_Condition;
   information  = DIA_Addon_Edgor_WhatHappened_Info;
   permanent	= FALSE;
   description	= "Co siê tu sta³o?";
};

FUNC INT DIA_Addon_Edgor_WhatHappened_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Franco_WhatHappenedHere))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Edgor_WhatHappened_Info()
{
    AI_Output (other, self ,"DIA_Addon_Edgor_WhatHappened_15_01"); //Co siê tu sta³o?
    AI_Output (self, other ,"DIA_Addon_Edgor_WhatHappened_03_02"); //Sukinsyn zabi³ Fletchera i zabroni³ ka¿demu dostêpu do obozu.
    AI_Output (self, other ,"DIA_Addon_Edgor_WhatHappened_03_03"); //Kaza³ Sanchowi pilnowaæ wejœcia, ¿eby ''unikn¹æ szpiegów''.
    AI_Output (self, other ,"DIA_Addon_Edgor_WhatHappened_03_04"); //Beznadziejny pomys³. Kto znajdzie nas na tym zatêch³ym bagnie.
    AI_Output (other, self ,"DIA_Addon_Edgor_WhatHappened_15_05"); //Dlaczego go zamordowa³?
    AI_Output (self, other ,"DIA_Addon_Edgor_WhatHappened_03_06"); //Po prostu go zabi³. Bez ostrze¿enia. Zaraz po tym krzykn¹³, ¿e to on rz¹dzi w obozie.
    AI_Output (other, self ,"DIA_Addon_Edgor_WhatHappened_15_07"); //Kawa³ œmiecia. Fletcher by³ w porz¹dku.
    AI_Output (self, other ,"DIA_Addon_Edgor_WhatHappened_03_08"); //Lepiej odejdŸ. Nie zwracajmy na siebie uwagi.
    B_LogEntry                     (TOPIC_Riot_in_Hunters_Camp,"Edgor powiedzia³, ¿e Franko od tak sobie zabi³ Fletchera i przej¹³ w³adzê nad t¹ czêœci¹ obozu. Nie zdziwiê siê, jeœli nie spotkam Edgora w obozie...");
};

//========================================
//-----------------> WheresArvo
//========================================

INSTANCE DIA_Addon_Edgor_WheresArvo (C_INFO)
{
   npc          = BDT_1074_Addon_Edgor;
   nr           = 1;
   condition    = DIA_Addon_Edgor_WheresArvo_Condition;
   information  = DIA_Addon_Edgor_WheresArvo_Info;
   permanent	= FALSE;
   description	= "Wiesz gdzie jest Arvo?";
};

FUNC INT DIA_Addon_Edgor_WheresArvo_Condition()
{
    if (MIS_Arvo == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Edgor_WheresArvo_Info()
{
    AI_Output (other, self ,"DIA_Addon_Edgor_WheresArvo_15_01"); //Wiesz gdzie jest Arvo?
    AI_Output (self, other ,"DIA_Addon_Edgor_WheresArvo_03_02"); //Daj mi spokój z tym gównem. Mam doœæ w³asnych problemów.
};

//========================================
//-----------------> WhereAreYouFrom
//========================================

INSTANCE DIA_Addon_Edgor_WhereAreYouFrom (C_INFO)
{
   npc          = BDT_1074_Addon_Edgor;
   nr           = 1;
   condition    = DIA_Addon_Edgor_WhereAreYouFrom_Condition;
   information  = DIA_Addon_Edgor_WhereAreYouFrom_Info;
   permanent	= FALSE;
   description	= "Sk¹d pochodzisz?";
};

FUNC INT DIA_Addon_Edgor_WhereAreYouFrom_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Edgor_HEY))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Edgor_WhereAreYouFrom_Info()
{
    AI_Output (other, self ,"DIA_Addon_Edgor_WhereAreYouFrom_15_01"); //Sk¹d pochodzisz?
    AI_Output (self, other ,"DIA_Addon_Edgor_WhereAreYouFrom_03_02"); //Pochodzê z okolic Waldfried. To bardzo lesista kraina, gdzie wiêkszoœæ wyspy to lasy.
    AI_Output (self, other ,"DIA_Addon_Edgor_WhereAreYouFrom_03_03"); //Tam nauczy³em siê polowaæ.
    AI_Output (other, self ,"DIA_Addon_Edgor_WhereAreYouFrom_15_04"); //By³eœ myœliwym?
    AI_Output (self, other ,"DIA_Addon_Edgor_WhereAreYouFrom_03_05"); //Nadal nim jestem. Teraz przewa¿nie polujê z Loganem i kilkoma ch³opakami na polecenie Fletchera.
    AI_Output (self, other ,"DIA_Addon_Edgor_WhereAreYouFrom_03_06"); //Swoj¹ drog¹, ciekawski z ciebie goœæ.
};

//========================================
//-----------------> WaitingForYou
//========================================

INSTANCE DIA_Addon_Edgor_WaitingForYou (C_INFO)
{
   npc          = BDT_1074_Addon_Edgor;
   nr           = 2;
   condition    = DIA_Addon_Edgor_WaitingForYou_Condition;
   information  = DIA_Addon_Edgor_WaitingForYou_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Edgor_WaitingForYou_Condition()
{
    if (Wld_IsTime (18,00,20,00))
    && (Npc_KnowsInfo (other, DIA_Addon_Edgor_BloodfliesDead))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Edgor_WaitingForYou_Info()
{
    AI_Output (self, other ,"DIA_Addon_Edgor_WaitingForYou_03_01"); //O jesteœ ju¿! Czeka³em na ciebie.
    AI_Output (other, self ,"DIA_Addon_Edgor_WaitingForYou_15_02"); //Nie zapomnia³em. Stawiasz pierwsz¹ kolejkê.
    AI_Output (self, other ,"DIA_Addon_Edgor_WaitingForYou_03_03"); //No to chlust.
    CreateInvItems (other, ItFo_Beer, 1);
    CreateInvItems (self, ItFo_Beer, 1);
    B_UseItem (self, ItFo_Beer);
    B_UseItem (other, ItFo_Beer);
    AI_Output (other, self ,"DIA_Addon_Edgor_WaitingForYou_15_04"); //Niesamowity smak.
    AI_Output (self, other ,"DIA_Addon_Edgor_WaitingForYou_03_05"); //Stary Lou wie co dobre. Mówi³eœ, ¿e jesteœ z Khorinis. Jak oceniasz to miasto?
    AI_Output (other, self ,"DIA_Addon_Edgor_WaitingForYou_15_06"); //Czêœæ ludzi by³a w porz¹dku, a czêœæ mia³a coœ na sumieniu.
    AI_Output (self, other ,"DIA_Addon_Edgor_WaitingForYou_03_07"); //Jak to w mieœcie bywa. Jesteœ strasznie m³ody, a przynajmniej na takiego wygl¹dasz.
    AI_Output (other, self ,"DIA_Addon_Edgor_WaitingForYou_15_08"); //S³ysza³em to kiedyœ.
    AI_Output (self, other ,"DIA_Addon_Edgor_WaitingForYou_03_09"); //No to co? Pijemy drugie piwo.
    AI_Output (other, self ,"DIA_Addon_Edgor_WaitingForYou_15_10"); //A masz coœ?
    AI_Output (self, other ,"DIA_Addon_Edgor_WaitingForYou_03_11"); //Pewnie!
    CreateInvItems (other, ItFo_Beer, 1);
    CreateInvItems (self, ItFo_Beer, 1);
    B_UseItem (self, ItFo_Beer);
    B_UseItem (other, ItFo_Beer);    AI_Output (self, other ,"DIA_Addon_Edgor_WaitingForYou_03_12"); //Aaaa. Bêdê siê zbiera³, bo Fletcher nie pozwoli³ mi byæ tu za d³ugo.
    AI_Output (other, self ,"DIA_Addon_Edgor_WaitingForYou_15_13"); //Do zobaczenia.
    AI_Output (self, other ,"DIA_Addon_Edgor_WaitingForYou_03_14"); //Trzymaj siê, ch³opcze.
    Npc_ExchangeRoutine (self, "Start");
};

//========================================
//-----------------> HowAreYou
//========================================

INSTANCE DIA_Addon_Edgor_HowAreYou (C_INFO)
{
   npc          = BDT_1074_Addon_Edgor;
   nr           = 3;
   condition    = DIA_Addon_Edgor_HowAreYou_Condition;
   information  = DIA_Addon_Edgor_HowAreYou_Info;
   permanent	= TRUE;
   description	= "Co u ciebie?";
};

FUNC INT DIA_Addon_Edgor_HowAreYou_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Edgor_HEY))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Edgor_HowAreYou_Info()
{
    AI_Output (other, self ,"DIA_Addon_Edgor_HowAreYou_15_01"); //Co u ciebie?
    if (KAPITEL == 1)
    {
        AI_Output (self, other ,"DIA_Addon_Edgor_HowAreYou_03_02"); //Jest dobrze.
    }
    else if (KAPITEL == 2)
    {
        AI_Output (self, other ,"DIA_Addon_Edgor_HowAreYou_03_03"); //S³ysza³em, ¿e Fletcher pozwoli³ ci na dobre wejœæ do obozu. Powodzenia.
    }
    else if (KAPITEL == 3)
    {
        AI_Output (self, other ,"DIA_Addon_Edgor_HowAreYou_03_04"); //Sam widzisz, fatalnie.
    };
};

