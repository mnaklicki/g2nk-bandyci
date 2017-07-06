//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Addon_Logan_EXIT(C_INFO)
{
	npc             = BDT_1072_Addon_Logan;
	nr              = 999;
	condition	= DIA_Addon_Logan_EXIT_Condition;
	information	= DIA_Addon_Logan_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Addon_Logan_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Logan_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> REPORT
//========================================

INSTANCE DIA_Addon_Logan_REPORT (C_INFO)
{
   npc          = BDT_1072_Addon_Logan;
   nr           = 1;
   condition    = DIA_Addon_Logan_REPORT_Condition;
   information  = DIA_Addon_Logan_REPORT_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Logan_REPORT_Condition()
{
    if (Npc_IsInState (self,ZS_Talk))
    && (Npc_KnowsInfo (other, DIA_Fletcher_WELCOME))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Logan_REPORT_Info()
{
    AI_Output (self, other ,"DIA_Addon_Logan_REPORT_03_01"); //Oho nowy! Witaj wœród nas. 
    AI_Output (other, self ,"DIA_Addon_Logan_REPORT_15_02"); //Ja równie¿ witam. Jestem Vinc, a ty?
    AI_Output (self, other ,"DIA_Addon_Logan_REPORT_03_03"); //Zw¹ mnie Logan. Jestem myœliwym. Ale nie takim paniczykiem co poluje na wilki czy œcierwojady. 
    AI_Output (other, self ,"DIA_Addon_Logan_REPORT_15_04"); //Mam rozumieæ, ¿e jesteœ gotowy.
    AI_Output (self, other ,"DIA_Addon_Logan_REPORT_03_05"); //Na co?
    AI_Output (other, self ,"DIA_Addon_Logan_REPORT_15_06"); //Fletcher.
    AI_Output (self, other ,"DIA_Addon_Logan_REPORT_03_07"); //Ah tak. Œwietnie, ¿e pytasz. Czekam w³aœnie na jego ruch. Przy okazji, przeka¿ mu, ¿e niedaleko st¹d, na polance, s¹ b³otne wê¿e. 
    AI_Output (other, self ,"DIA_Addon_Logan_REPORT_15_08"); //B³otne wê¿e?
    AI_Output (self, other ,"DIA_Addon_Logan_REPORT_03_09"); //Bardzo niebezpieczne stworzenia. ¯yj¹ na bagnach jak, ich nazwa wskazuje. Pamiêtaj. Dobry b³otny w¹¿, to martwy b³otny w¹¿.
    AI_Output (other, self ,"DIA_Addon_Logan_REPORT_15_10"); //Jasne. Przeka¿ê Fletcherowi, ¿e czekasz na pracê.
    AI_Output (self, other ,"DIA_Addon_Logan_REPORT_03_11"); //Dziêki.
    B_LogEntry                     (TOPIC_Report,"Pozna³em Logana. Powiedzia³, ¿e jest myœliwym i wspomnia³ mi o b³otnych wê¿ach, a przy okazji czeka na robotê. Fletchera to ucieszy.");
};

//========================================
//-----------------> RealHunter
//========================================

INSTANCE DIA_Addon_Logan_RealHunter (C_INFO)
{
   npc          = BDT_1072_Addon_Logan;
   nr           = 1;
   condition    = DIA_Addon_Logan_RealHunter_Condition;
   information  = DIA_Addon_Logan_RealHunter_Info;
   permanent	= FALSE;
   description	= "A wiêc jesteœ prawdziwym myœliwym?";
};

FUNC INT DIA_Addon_Logan_RealHunter_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Logan_REPORT))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Logan_RealHunter_Info()
{
    AI_Output (other, self ,"DIA_Addon_Logan_RealHunter_15_01"); //A wiêc jesteœ prawdziwym myœliwym?
    AI_Output (self, other ,"DIA_Addon_Logan_RealHunter_03_02"); //He he, potraktuj to jako samochwalstwo. Owszem, polowanie na b³otne wê¿e to niebezpieczne zajêcie.
    AI_Output (self, other ,"DIA_Addon_Logan_RealHunter_03_03"); //Ale polujê tak¿e na inne zwierzêta. Zwykle z paroma ch³opakami idziemy w g³¹b wyspy i zdobywamy miêso. Tyle ile upolujemy lub ile damy rady unieœæ.
    AI_Output (other, self ,"DIA_Addon_Logan_RealHunter_15_04"); //Coœ groŸnego?
    AI_Output (self, other ,"DIA_Addon_Logan_RealHunter_03_05"); //Kilka dni temu trafiliœmy na zêbacze. Tak bardzo nas zaskoczy³y, ¿e musieliœmy uciekaæ!
    AI_Output (self, other ,"DIA_Addon_Logan_RealHunter_03_06"); //Ca³e stado bieg³o w nasz¹ stronê! Cholerne bestie. Od tamtej pory zmieniliœmy tryb polowañ.
};

//========================================
//-----------------> AnyNews
//========================================

INSTANCE DIA_Addon_Logan_AnyNews (C_INFO)
{
   npc          = BDT_1072_Addon_Logan;
   nr           = 1;
   condition    = DIA_Addon_Logan_AnyNews_Condition;
   information  = DIA_Addon_Logan_AnyNews_Info;
   permanent	= TRUE;
   description	= "Coœ ciekawego?";
};

FUNC INT DIA_Addon_Logan_AnyNews_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Addon_Logan_AnyNews_Info()
{
    AI_Output (other, self ,"DIA_Addon_Logan_AnyNews_15_01"); //Coœ ciekawego?
    if (KAPITEL >= 3)
    {
        AI_Output (self, other ,"DIA_Addon_Logan_AnyNews_03_02"); //Franko zabi³ Fletchera. Ale to ju¿ pewnie wiesz.
    }
    else
    {
        AI_Output (self, other ,"DIA_Addon_Logan_AnyNews_03_03"); //Na razie nic. Pilnujê obozu.
    };
};


//========================================
//-----------------> LetsHunt
//========================================

INSTANCE DIA_Addon_Logan_LetsHunt (C_INFO)
{
   npc          = BDT_1072_Addon_Logan;
   nr           = 1;
   condition    = DIA_Addon_Logan_LetsHunt_Condition;
   information  = DIA_Addon_Logan_LetsHunt_Info;
   permanent	= FALSE;
   description	= "Mam ci pomóc w walce z tymi wê¿ami.";
};

FUNC INT DIA_Addon_Logan_LetsHunt_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Fletcher_MoreWork))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Logan_LetsHunt_Info()
{
    AI_Output (other, self ,"DIA_Addon_Logan_LetsHunt_15_01"); //Mam ci pomóc w walce z tymi wê¿ami.
    AI_Output (self, other ,"DIA_Addon_Logan_LetsHunt_03_02"); //Ktoœ odwa¿ny. To lubiê. Reszta ch³opaków niezbyt garnie siê do pomocy, a do pomocy przy b³otnych wê¿ach to ju¿ w ogóle. 
    AI_Output (self, other ,"DIA_Addon_Logan_LetsHunt_03_03"); //ChodŸ za mn¹. Na polance s¹ trzy. Damy radê.
    Npc_ExchangeRoutine (self, "Hunt");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> SwampsharksDead
//========================================

INSTANCE DIA_Addon_Logan_SwampsharksDead (C_INFO)
{
   npc          = BDT_1072_Addon_Logan;
   nr           = 2;
   condition    = DIA_Addon_Logan_SwampsharksDead_Condition;
   information  = DIA_Addon_Logan_SwampsharksDead_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Logan_SwampsharksDead_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Logan_LetsHunt))
    && (LogansDeadSwampsharks >= 3)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Logan_SwampsharksDead_Info()
{
    AI_Output (self, other ,"DIA_Addon_Logan_SwampsharksDead_03_01"); //Dobry b³otny w¹¿, to martwy b³otny w¹¿. 
    AI_Output (other, self ,"DIA_Addon_Logan_SwampsharksDead_15_02"); //Racja. S¹ trudne do pokonania.
    AI_Output (self, other ,"DIA_Addon_Logan_SwampsharksDead_03_03"); //Nabierzesz wprawy. O to siê nie martw. 
    AI_Output (self, other ,"DIA_Addon_Logan_SwampsharksDead_03_04"); //Okolica jest bardzo ciekawa. Rozejrzê siê tutaj. Ty powiedz Fletcherowi o sukcesie.
    AI_Output (other, self ,"DIA_Addon_Logan_SwampsharksDead_15_05"); //Tak zrobiê.
	Npc_ExchangeRoutine (self, "Stay");
    B_LogEntry                     (TOPIC_Help_Logan,"Sprawa za³atwiona. Nigdy nie walczy³em z takimi stworzeniami, ale da³em radê. Logan rozejrzy siê po okolicy. Mi pozostaje tylko powiadomiæ Fletchera o wszystkim.");
};

//========================================
//-----------------> WereYouLookingForMe
//========================================

INSTANCE DIA_Addon_Logan_WereYouLookingForMe (C_INFO)
{
   npc          = BDT_1072_Addon_Logan;
   nr           = 1;
   condition    = DIA_Addon_Logan_WereYouLookingForMe_Condition;
   information  = DIA_Addon_Logan_WereYouLookingForMe_Info;
   permanent	= FALSE;
   description	= "Szuka³eœ mnie?";
};

FUNC INT DIA_Addon_Logan_WereYouLookingForMe_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Arvo_WaitAMinute))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Logan_WereYouLookingForMe_Info()
{
    AI_Output (other, self ,"DIA_Addon_Logan_WereYouLookingForMe_15_01"); //Szuka³eœ mnie?
    AI_Output (self, other ,"DIA_Addon_Logan_WereYouLookingForMe_03_02"); //Ja? Sk¹d.
    AI_Output (other, self ,"DIA_Addon_Logan_WereYouLookingForMe_15_03"); //Ktoœ mi powiedzia³, ¿e tak.
    AI_Output (self, other ,"DIA_Addon_Logan_WereYouLookingForMe_03_04"); //A ten ktoœ to kto?
    AI_Output (other, self ,"DIA_Addon_Logan_WereYouLookingForMe_15_05"); //W sumie nikt wa¿ny.
    AI_Output (self, other ,"DIA_Addon_Logan_WereYouLookingForMe_03_06"); //To po co siê go s³uchasz? Nie daj siê zwieœæ.
    AI_Output (other, self ,"DIA_Addon_Logan_WereYouLookingForMe_15_07"); //Zapamiêtam.
    B_LogEntry                     (TOPIC_Move_up_the_Hierarchy,"Co ten Arvo kombinuje? Logan nic ode mnie nie chcia³ i wyszed³em na idiotê. Chyba bêdê musia³ siê nim zaj¹æ.");
};

//========================================
//-----------------> WhatDoYouKnow
//========================================

INSTANCE DIA_Addon_Logan_WhatDoYouKnow (C_INFO)
{
   npc          = BDT_1072_Addon_Logan;
   nr           = 1;
   condition    = DIA_Addon_Logan_WhatDoYouKnow_Condition;
   information  = DIA_Addon_Logan_WhatDoYouKnow_Info;
   permanent	= FALSE;
   description	= "Co wiesz o zabójstwie Fletchera?";
};

FUNC INT DIA_Addon_Logan_WhatDoYouKnow_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Franco_WhatHappenedHere))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Logan_WhatDoYouKnow_Info()
{
    AI_Output (other, self ,"DIA_Addon_Logan_WhatDoYouKnow_15_01"); //Co wiesz o zabójstwie Fletchera?
    AI_Output (self, other ,"DIA_Addon_Logan_WhatDoYouKnow_03_02"); //Pos³uchaj, ja... Chcê siê dostaæ do obozu. Muszê tam byæ.
    AI_Output (other, self ,"DIA_Addon_Logan_WhatDoYouKnow_15_03"); //Logan, nie poznajê ciê. Co siê dzieje?
    AI_Output (self, other ,"DIA_Addon_Logan_WhatDoYouKnow_03_04"); //Nie mieszaj siê w to. Masz wstêp do obozu, to tam zostañ.
    AI_Output (self, other ,"DIA_Addon_Logan_WhatDoYouKnow_03_05"); //A teraz zostaw mnie samego.
    B_LogEntry                     (TOPIC_Riot_in_Hunters_Camp,"Logan jest nie do poznania. Po krótkiej rozmowie ³atwo stwierdziæ, ¿e jego te¿ ktoœ zastraszy³.");
};

//========================================
//-----------------> WheresArvo
//========================================

INSTANCE DIA_Addon_Logan_WheresArvo (C_INFO)
{
   npc          = BDT_1072_Addon_Logan;
   nr           = 1;
   condition    = DIA_Addon_Logan_WheresArvo_Condition;
   information  = DIA_Addon_Logan_WheresArvo_Info;
   permanent	= FALSE;
   description	= "By³ tu Arvo?";
};

FUNC INT DIA_Addon_Logan_WheresArvo_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Miguel_WheresArvo))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Logan_WheresArvo_Info()
{
    AI_Output (other, self ,"DIA_Addon_Logan_WheresArvo_15_01"); //By³ tu Arvo?
    AI_Output (self, other ,"DIA_Addon_Logan_WheresArvo_03_02"); //By³ tutaj przez chwilê i st¹d poszed³.
    AI_Output (other, self ,"DIA_Addon_Logan_WheresArvo_15_03"); //Gdzie?
    AI_PointAtNpc(self, BDT_10316_Arvo);
    AI_Output (other, self ,"DIA_Addon_Logan_WheresArvo_15_04"); //Tam! By³ wœciek³y i bredzi³ coœ po nosem.
    AI_StopPointAt(self);
    AI_Output (self, other ,"DIA_Addon_Logan_WheresArvo_03_05"); //Cieszê siê, ¿e nie zawraca³ mi g³owy.
    AI_Output (other, self ,"DIA_Addon_Logan_WheresArvo_15_06"); //Jasne.
    B_LogEntry                     (TOPIC_Arvo,"Logan powiedzia³ mi o kierunku w którym uda³ siê Arvo. Mniej wiêcej tam gdzie by³a jaskinia z tabliczk¹. Zemszczê siê!");
};

