//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Arvo_EXIT(C_INFO)
{
	npc             = BDT_10316_Arvo;
	nr              = 999;
	condition	= DIA_Arvo_EXIT_Condition;
	information	= DIA_Arvo_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Arvo_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Arvo_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WhatsUp
//========================================

INSTANCE DIA_Addon_Arvo_WhatsUp (C_INFO)
{
   npc          = BDT_10316_Arvo;
   nr           = 1;
   condition    = DIA_Arvo_WhatsUp_Condition;
   information  = DIA_Arvo_WhatsUp_Info;
   permanent	= TRUE;
   description	= "Co s³ychaæ?";
};

FUNC INT DIA_Arvo_WhatsUp_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Arvo_WhatsUp_Info()
{
    AI_Output (other, self ,"DIA_Addon_Franco_WhatsUp_15_01"); //Co s³ychaæ?
    AI_Output (self, other ,"DIA_Addon_Arvo_WhatsUp_03_02"); //Nie mówi³em ¿ebyœ spada³?
};


//========================================
//-----------------> WhoAreYou
//========================================

INSTANCE DIA_Arvo_WhoAreYou (C_INFO)
{
   npc          = BDT_10316_Arvo;
   nr           = 1;
   condition    = DIA_Arvo_WhoAreYou_Condition;
   information  = DIA_Arvo_WhoAreYou_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Arvo_WhoAreYou_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Fletcher_WELCOME))
    && (Npc_IsInState (self,ZS_Talk))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Arvo_WhoAreYou_Info()
{
    AI_Output (self, other ,"DIA_Arvo_WhoAreYou_03_01"); //Hê?
    AI_Output (other, self ,"DIA_Arvo_WhoAreYou_15_02"); //Jesteœ Arvo, jak mniemam? 
    AI_Output (self, other ,"DIA_Arvo_WhoAreYou_03_03"); //Wiesz co mnie obchodzi twoje mniemanie? Daj mi spokój.
    AI_Output (other, self ,"DIA_Arvo_WhoAreYou_15_04"); //To wiedz o pracy jak¹ dostaniesz od Fletchera.
    AI_Output (self, other ,"DIA_Arvo_WhoAreYou_03_05"); //Jakiej znowu pracy?!
    AI_Output (other, self ,"DIA_Arvo_WhoAreYou_15_06"); //Widzisz? Fletcher zbiera ludzi do pracy. Trzeba organizowaæ obóz.
    AI_Output (self, other ,"DIA_Arvo_WhoAreYou_03_07"); //Wiesz co? Daj mi spokój. 
    AI_Output (other, self ,"DIA_Arvo_WhoAreYou_15_08"); //Przeka¿ê o twojej "gotowoœci" do roboty.
    AI_Output (self, other ,"DIA_Arvo_WhoAreYou_03_09"); //Spadaj st¹d.
    B_LogEntry                     (TOPIC_Report,"Mia³em ''niezwyk³¹ przyjemnoœæ'' rozmowy z Arvo. Ten typ to jakaœ pora¿ka. Muszê na niego uwa¿aæ. Coœ czujê, ¿e to k³amliwy œmieæ.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WhatDoYouWant
//========================================

INSTANCE DIA_Arvo_WhatDoYouWant (C_INFO)
{
   npc          = BDT_10316_Arvo;
   nr           = 1;
   condition    = DIA_Arvo_WhatDoYouWant_Condition;
   information  = DIA_Arvo_WhatDoYouWant_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Arvo_WhatDoYouWant_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Esteban_WhatToDo))
    && (Npc_IsInState (self,ZS_Talk))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Arvo_WhatDoYouWant_Info()
{
    AI_Output (self, other ,"DIA_Arvo_WhatDoYouWant_03_01"); //Czego u licha chcesz?
    AI_Output (other, self ,"DIA_Arvo_WhatDoYouWant_15_02"); //Pójdziemy pozwiedzaæ bagna. Ruszaj siê.
    AI_Output (self, other ,"DIA_Arvo_WhatDoYouWant_03_03"); //Grozisz mi? Wiesz kim JA jestem?
    AI_Output (other, self ,"DIA_Arvo_WhatDoYouWant_15_04"); //Tak? To wrócê do Estebana i powiem mu kim TY jesteœ. (z ironi¹)
    AI_Output (self, other ,"DIA_Arvo_WhatDoYouWant_03_05"); //Hej, hej! Nie rób czegoœ pochopnie.
    AI_Output (self, other ,"DIA_Arvo_WhatDoYouWant_03_06"); //Znam Estebana. Powiedzia³, ¿e przyœle mi kogoœ do pomocy.
    AI_Output (other, self ,"DIA_Arvo_WhatDoYouWant_15_07"); //No to chodŸ.
    AI_Output (self, other ,"DIA_Arvo_WhatDoYouWant_03_08"); //Jasne. Za mn¹. (nikczemnie)
    B_LogEntry                     (TOPIC_Move_up_the_Hierarchy,"Gdy Arvo dowiedzia³ siê, ¿e przychodzê od Estebana, zmieni³ lekko swoje nastawienie. Ale nadal jest œmieciem. Muszê na niego uwa¿aæ.");
    Npc_ExchangeRoutine (self, "Guide");
};

//========================================
//-----------------> DamnBeasts
//========================================

INSTANCE DIA_Arvo_DamnBeasts (C_INFO)
{
   npc          = BDT_10316_Arvo;
   nr           = 2;
   condition    = DIA_Arvo_DamnBeasts_Condition;
   information  = DIA_Arvo_DamnBeasts_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Arvo_DamnBeasts_Condition()
{
    if (Npc_GetDistToWP (self, "ADW_CANYON_PATH_TO_BANDITS_06E") < 200)
    && (Npc_KnowsInfo (other, DIA_Arvo_WhatDoYouWant))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Arvo_DamnBeasts_Info()
{
    AI_Output (self, other ,"DIA_Arvo_DamnBeasts_03_01"); //Cholerne bestie!
    AI_Output (other, self ,"DIA_Arvo_DamnBeasts_15_02"); //Uspokój siê, przecie¿ ju¿ nie ¿yj¹.
    AI_Output (self, other ,"DIA_Arvo_DamnBeasts_03_03"); //Widzê przecie¿. Zreszt¹ niewa¿ne. Stanê na warcie przed wejœciem.
    AI_Output (other, self ,"DIA_Arvo_DamnBeasts_15_04"); //Po co? Nikt nas nie napadnie.
    AI_Output (self, other ,"DIA_Arvo_DamnBeasts_03_05"); //A jak przyjd¹ nagle jakieœ inne potwory?
    AI_Output (other, self ,"DIA_Arvo_DamnBeasts_15_06"); //Och³oñ trochê.
    AI_Output (self, other ,"DIA_Arvo_DamnBeasts_03_07"); //NIE! Bêdê tu sta³, a ty kop.
    AI_Output (other, self ,"DIA_Arvo_DamnBeasts_15_08"); //Jasne. Ca³a brudna robota dla mnie.
	Npc_ExchangeRoutine (self, "Wait");
	AI_GotoWP	(BDT_10316_Arvo, "ADW_CAVE_ARVO");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WhatIsIt
//========================================

INSTANCE DIA_Arvo_WhatIsIt (C_INFO)
{
   npc          = BDT_10316_Arvo;
   nr           = 3;
   condition    = DIA_Arvo_WhatIsIt_Condition;
   information  = DIA_Arvo_WhatIsIt_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Arvo_WhatIsIt_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Arvo_DamnBeasts))
    && (Npc_HasItems (other, ItWr_StonePlate_Cave) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Arvo_WhatIsIt_Info()
{
    AI_Output (self, other ,"DIA_Arvo_WhatIsIt_03_01"); //Widzê, ¿e coœ masz. Co to?
    AI_Output (other, self ,"DIA_Arvo_WhatIsIt_15_02"); //Tabliczka? (z ironi¹)
    AI_Output (self, other ,"DIA_Arvo_WhatIsIt_03_03"); //Nie z³oœæ siê tak. Pomog³em ci przecie¿. Wrócê do obozu. A ty zanieœ to Estebanowi.
    AI_Output (other, self ,"DIA_Arvo_WhatIsIt_15_04"); //Jasne.
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WaitAMinute
//========================================

INSTANCE DIA_Arvo_WaitAMinute (C_INFO)
{
   npc          = BDT_10316_Arvo;
   nr           = 4;
   condition    = DIA_Arvo_WaitAMinute_Condition;
   information  = DIA_Arvo_WaitAMinute_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Arvo_WaitAMinute_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Arvo_WhatIsIt))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Arvo_WaitAMinute_Info()
{
    AI_Output (self, other ,"DIA_Arvo_WaitAMinute_03_01"); //Chwila, zaczekaj!
    AI_Output (self, other ,"DIA_Arvo_WaitAMinute_03_02"); //Logan ciê szuka³.
    AI_Output (other, self ,"DIA_Arvo_WaitAMinute_15_03"); //A co on ode mnie chcia³?
    AI_Output (self, other ,"DIA_Arvo_WaitAMinute_03_04"); //A sk¹d mam wiedzieæ? Przypomnia³o mi siê w³aœnie teraz. IdŸ do niego.
    AI_Output (other, self ,"DIA_Arvo_WaitAMinute_15_05"); //Taa, jasne.
    Npc_ExchangeRoutine (self, "Start");
    AI_StopProcessInfos	(self);
    B_LogEntry                     (TOPIC_Move_up_the_Hierarchy,"Oczywiœcie ca³e kopanie spad³o na moje barki, bo Arvo 'zabezpiecza³' ty³y. Na dodatek przypomnia³o mu siê, ¿e Logan ma do mnie jak¹œ sprawê. Odwiedzê go, bo do Estebana niespecjalnie mi siê œpieszy.");
};

//========================================
//-----------------> WhoDoWeHaveHere
//========================================

INSTANCE DIA_Arvo_LoganDidntWantAnything (C_INFO)
{
   npc          = BDT_10316_Arvo;
   nr           = 1;
   condition    = DIA_Arvo_LoganDidntWantAnything_Condition;
   information  = DIA_Arvo_LoganDidntWantAnything_Info;
   permanent	= FALSE;
   description	= "Logan nic ode mnie nie chcia³...";
};

FUNC INT DIA_Arvo_LoganDidntWantAnything_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Logan_WereYouLookingForMe))
    && (!Npc_KnowsInfo (other, DIA_Addon_Esteban_FinallyYouAreHere))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Arvo_LoganDidntWantAnything_Info()
{
    AI_Output (other, self ,"LoganDidntWantAnything_03_01"); //Logan nic ode mnie nie chcia³...
    AI_Output (self, other ,"LoganDidntWantAnything_15_02"); //Tak? Mo¿e siê pomyli³em. W ka¿dym razie, idŸ oddaj t¹ tabliczkê Estebanowi.
};

//========================================
//-----------------> WhoDoWeHaveHere
//========================================

INSTANCE DIA_Arvo_WhoDoWeHaveHere (C_INFO)
{
   npc          = BDT_10316_Arvo;
   nr           = 1;
   condition    = DIA_Arvo_WhoDoWeHaveHere_Condition;
   information  = DIA_Arvo_WhoDoWeHaveHere_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Arvo_WhoDoWeHaveHere_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Esteban_FinallyYouAreHere))
    && (Npc_IsInState (self,ZS_Talk))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Arvo_WhoDoWeHaveHere_Info()
{
    AI_Output (self, other ,"DIA_Arvo_WhoDoWeHaveHere_03_01"); //Oh. Kogo my tu mamy. I jak tam rozmowa z...
    AI_Output (other, self ,"DIA_Arvo_WhoDoWeHaveHere_15_02"); //Pewnego dnia lub nocy, gdy nikogo nie bêdzie obok, dopadnê ciê.
    AI_Output (self, other ,"DIA_Arvo_WhoDoWeHaveHere_03_03"); //Nie strasz, nie strasz. Nie bojê siê takich gnojków jak ty.
    AI_Output (self, other ,"DIA_Arvo_WhoDoWeHaveHere_03_04"); //Twoje pojawienie siê w obozie by³o b³êdem.
    AI_Output (other, self ,"DIA_Arvo_WhoDoWeHaveHere_15_05"); //Jeszcze zobaczymy.
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> StillHere
//========================================

INSTANCE DIA_Arvo_StillHere (C_INFO)
{
   npc          = BDT_10316_Arvo;
   nr           = 1;
   condition    = DIA_Arvo_StillHere_Condition;
   information  = DIA_Arvo_StillHere_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Arvo_StillHere_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Franco_WhatHappenedHere))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Arvo_StillHere_Info()
{
    AI_Output (self, other ,"DIA_Arvo_StillHere_03_01"); //Jeszcze tu jesteœ?
    AI_Output (other, self ,"DIA_Arvo_StillHere_15_02"); //Ty...
    AI_Output (self, other ,"DIA_Arvo_StillHere_03_03"); //Franko rz¹dzi tutaj. Lepiej st¹d idŸ. (arogancko) I uwa¿aj na siebie.
    AI_Output (other, self ,"DIA_Arvo_StillHere_15_04"); //Jeszcze zobaczymy.
    B_LogEntry                     (TOPIC_Riot_in_Hunters_Camp,"Arvo ostrzeg³ mnie, abym nie panoszy³ siê po obozie. Mam ju¿ go doœæ.");
};

//========================================
//-----------------> Finale
//========================================

INSTANCE DIA_Arvo_Finale (C_INFO)
{
   npc          = BDT_10316_Arvo;
   nr           = 1;
   condition    = DIA_Arvo_Finale_Condition;
   information  = DIA_Arvo_Finale_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Arvo_Finale_Condition()
{
    if (MIS_Arvo == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Arvo_Finale_Info()
{
    Npc_ExchangeRoutine (BDT_10017_Addon_Juan, "Final");
	AI_Teleport (BDT_10017_Addon_Juan, "ADW_CANYON_PATH_TO_BANDITS_06F");
	AI_GotoWP	(BDT_10017_Addon_Juan, "ADW_CANYON_PATH_TO_BANDITS_06E");
    AI_Output (self, other ,"DIA_Arvo_Finale_03_01"); //Nareszcie! Teraz mi siê nie wymskniesz!
    AI_Output (other, self ,"DIA_Arvo_Finale_15_02"); //Czy¿by? (kpi¹cym g³osem)
    AI_Output (other, self ,"DIA_Arvo_Finale_03_03"); //¯adnej pokory nawet w obliczu œmierci. ¯a³osne.
    AI_Output (self, other ,"DIA_Arvo_Finale_03_04"); //To samo mogê powiedzieæ i tobie. Prawda Huan?
    AI_Output (other, self ,"DIA_Arvo_Finale_15_05"); //(zdziwienie) Huan?
	AI_StopProcessInfos (self);
};

INSTANCE DIA_Addon_Arvo_End (C_INFO)
{
	npc          = BDT_10316_Arvo;
	nr           = 1;
	condition    = DIA_Addon_Arvo_End_Condition;
	information  = DIA_Addon_Arvo_End_Info;
	permanent	= FALSE;
	important	= TRUE;
};

FUNC INT DIA_Addon_Arvo_End_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Huan_Finale))
    {
		return TRUE;
    };
};

FUNC VOID DIA_Addon_Arvo_End_Info()
{
	AI_StopProcessInfos (self);
    B_Extro_Avi();
};

