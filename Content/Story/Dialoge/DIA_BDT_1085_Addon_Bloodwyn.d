//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Addon_Bloodwyn_EXIT(C_INFO)
{
	npc             = BDT_1085_Addon_Bloodwyn;
	nr              = 999;
	condition	= DIA_Addon_Bloodwyn_EXIT_Condition;
	information	= DIA_Addon_Bloodwyn_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Addon_Bloodwyn_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Bloodwyn_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WelcomeNewcomer
//========================================

INSTANCE DIA_Addon_Bloodwyn_WelcomeNewcomer (C_INFO)
{
   npc          = BDT_1085_Addon_Bloodwyn;
   nr           = 1;
   condition    = DIA_Addon_Bloodwyn_WelcomeNewcomer_Condition;
   information  = DIA_Addon_Bloodwyn_WelcomeNewcomer_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Bloodwyn_WelcomeNewcomer_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Thorus_FoundButch))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Bloodwyn_WelcomeNewcomer_Info()
{
    AI_Output (self, other ,"DIA_Addon_Bloodwyn_WelcomeNewcomer_03_01"); //To ty jesteœ ten nowy! S³ysza³em o tobie wiele ciekawych rzeczy. Ponoæ jesteœ obiecuj¹cy nabytkiem na przysz³oœæ.
    AI_Output (other, self ,"DIA_Addon_Bloodwyn_WelcomeNewcomer_15_02"); //Myœlê, ¿e tak.
    AI_Output (self, other ,"DIA_Addon_Bloodwyn_WelcomeNewcomer_03_03"); //Pos³uchaj mnie uwa¿nie. Przyjêliœmy ciê do nas, bo zabi³eœ dwóch ¿o³nierzy. Nie lada wyczyn jak na takiego m³odzika.
    AI_Output (self, other ,"DIA_Addon_Bloodwyn_WelcomeNewcomer_03_04"); //Mam dla ciebie ofertê. Mo¿esz staæ siê kimœ w tym obozie. Mo¿esz byæ jednym z NAS!
    AI_Output (self, other ,"DIA_Addon_Bloodwyn_WelcomeNewcomer_03_05"); //Stra¿nikiem Kruka.
    AI_Output (other, self ,"DIA_Addon_Bloodwyn_WelcomeNewcomer_15_06"); //A co mam zrobiæ?
    AI_Output (self, other ,"DIA_Addon_Bloodwyn_WelcomeNewcomer_03_07"); //Wykonywaæ rozkazy i zadania od Kruka, a czego siê spodziewa³eœ?!
    AI_Output (self, other ,"DIA_Addon_Bloodwyn_WelcomeNewcomer_03_08"); //Ale z takim pancerzem to ty zejdŸ na ziemiê.
    AI_Output (other, self ,"DIA_Addon_Bloodwyn_WelcomeNewcomer_15_09"); //Dostanê taki jak twój?
    AI_Output (self, other ,"DIA_Addon_Bloodwyn_WelcomeNewcomer_03_10"); //JAK ŒMIESZ! Jestem najlepszym wojownikiem w tym obozie. Nabierz szacunku.
    AI_Output (self, other ,"DIA_Addon_Bloodwyn_WelcomeNewcomer_03_11"); //Jeœli zas³u¿ysz, to taki dostaniesz. Ale teraz idŸ, za³atw sobie mocniejszy pancerz. Fletcher ci w tym pomo¿e.
    AI_Output (other, self ,"DIA_Addon_Bloodwyn_WelcomeNewcomer_15_12"); //Nied³ugo wrócê.
    AI_Output (self, other ,"DIA_Addon_Bloodwyn_WelcomeNewcomer_03_13"); //No to na co czekasz?
    MIS_Better_Armour = LOG_RUNNING;

    Log_CreateTopic            (TOPIC_Better_Armour, LOG_MISSION);
    Log_SetTopicStatus       (TOPIC_Better_Armour, LOG_RUNNING);
    B_LogEntry                     (TOPIC_Better_Armour,"Spotka³em Bloodwyna. Powiedzia³, ¿e mogê staæ siê stra¿nikiem Kruka, o ile bêdê wykonywaæ jego zadania. Ale ¿eby te zadania wykonaæ, to muszê dostaæ lepszy pancerz. Czas odwiedziæ Fletchera.");
};

//========================================
//-----------------> GetSomeArmour
//========================================

INSTANCE DIA_Addon_Bloodwyn_GetSomeArmour (C_INFO)
{
   npc          = BDT_1085_Addon_Bloodwyn;
   nr           = 2;
   condition    = DIA_Addon_Bloodwyn_GetSomeArmour_Condition;
   information  = DIA_Addon_Bloodwyn_GetSomeArmour_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Bloodwyn_GetSomeArmour_Condition()
{
    if (MIS_Better_Armour == LOG_RUNNING)
    && (Npc_IsInState (self,ZS_Talk))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Bloodwyn_GetSomeArmour_Info()
{
    AI_Output (self, other ,"DIA_Addon_Bloodwyn_GetSomeArmour_03_01"); //Bez lepszego pancerza nie dostaniesz ¿adnego zadania! IdŸ ju¿!
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> GoToRaven
//========================================

INSTANCE DIA_Addon_Bloodwyn_GoToRaven (C_INFO)
{
   npc          = BDT_1085_Addon_Bloodwyn;
   nr           = 1;
   condition    = DIA_Addon_Bloodwyn_GoToRaven_Condition;
   information  = DIA_Addon_Bloodwyn_GoToRaven_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Bloodwyn_GoToRaven_Condition()
{
	var C_Item BDTArmour; BDTArmour = Npc_GetEquippedArmor(other);
	
    if (Npc_KnowsInfo (other, DIA_Addon_Huno_GoldForArmour))
    && (Hlp_IsItem(BDTArmour, ITAR_BDT_H) == TRUE)
    {
		return TRUE;
    };
};


FUNC VOID DIA_Addon_Bloodwyn_GoToRaven_Info()
{
    AI_Output (self, other ,"DIA_Addon_Bloodwyn_GoToRaven_03_01"); //Od razu lepiej. Kruk czeka na ciebie przed wejœciem do kopalni. Lepiej siê zachowuj.
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> FinallyYouAreHere
//========================================

INSTANCE DIA_Addon_Bloodwyn_FinallyYouAreHere (C_INFO)
{
   npc          = BDT_1085_Addon_Bloodwyn;
   nr           = 1;
   condition    = DIA_Addon_Bloodwyn_FinallyYouAreHere_Condition;
   information  = DIA_Addon_Bloodwyn_FinallyYouAreHere_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Bloodwyn_FinallyYouAreHere_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Raven_GoodJob))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Bloodwyn_FinallyYouAreHere_Info()
{
    Npc_ExchangeRoutine (BDT_1090_Addon_Raven, "WaitBeforeAttack");
	AI_Teleport		(BDT_1090_Addon_Raven, "ADW_MINE_16");
    AI_Output (self, other ,"DIA_Addon_Bloodwyn_FinallyYouAreHere_03_01"); //No jesteœ wreszcie. Teraz czeka nas wyzwanie.
    AI_Output (other, self ,"DIA_Addon_Bloodwyn_FinallyYouAreHere_15_02"); //Co trzeba zrobiæ?
    AI_Output (self, other ,"DIA_Addon_Bloodwyn_FinallyYouAreHere_03_03"); //Niewolnicy dokopali siê do grobowca. Kruk bardzo chce go zbadaæ, a naszym zadaniem bêdzie ochranianie go.
    AI_Output (other, self ,"DIA_Addon_Bloodwyn_FinallyYouAreHere_15_04"); //Co robimy?
    AI_Output (self, other ,"DIA_Addon_Bloodwyn_FinallyYouAreHere_03_05"); //My? Niewolnicy otworz¹ wejœcie. Ja, ty i Alvaro bêdziemy na tyle wraz z Krukiem.
    AI_Output (other, self ,"DIA_Addon_Bloodwyn_FinallyYouAreHere_15_06"); //Coœ niebezpiecznego tam bêdzie?
    AI_Output (self, other ,"DIA_Addon_Bloodwyn_FinallyYouAreHere_03_07"); //Zadajesz zbyt du¿o pytañ. Oczywiœcie, ¿e tak. Zanim tu przyszed³eœ za³atwiliœmy ze trzy tuziny kamiennych stra¿ników.
    AI_Output (self, other ,"DIA_Addon_Bloodwyn_FinallyYouAreHere_03_08"); //Kruk s¹dzi, ¿e ich tu spotkamy. Wiêc siê pilnuj.

    Info_ClearChoices		(DIA_Addon_Bloodwyn_FinallyYouAreHere);
    Info_AddChoice		(DIA_Addon_Bloodwyn_FinallyYouAreHere, "Kiedy zaczynamy?", DIA_Addon_Bloodwyn_FinallyYouAreHere_WhenDoWeStart);
};

FUNC VOID DIA_Addon_Bloodwyn_FinallyYouAreHere_WhenDoWeStart()
{
    AI_Output (other, self ,"DIA_Addon_Bloodwyn_FinallyYouAreHere_WhenDoWeStart_15_01"); //Kiedy zaczynamy?
    AI_Output (self, other ,"DIA_Addon_Bloodwyn_FinallyYouAreHere_WhenDoWeStart_03_02"); //Idzie Kruk.
    Info_ClearChoices		(DIA_Addon_Bloodwyn_FinallyYouAreHere);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> AttackEnded
//========================================

INSTANCE DIA_Addon_Bloodwyn_AttackEnded (C_INFO)
{
   npc          = BDT_1085_Addon_Bloodwyn;
   nr           = 1;
   condition    = DIA_Addon_Bloodwyn_AttackEnded_Condition;
   information  = DIA_Addon_Bloodwyn_AttackEnded_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Bloodwyn_AttackEnded_Condition()
{
    var C_NPC whodie0; 	whodie0 = Hlp_GetNpc(Stoneguardian_Tomb);
    if (Npc_KnowsInfo (other, DIA_Addon_Raven_StartAttack))
    && (Npc_IsDead(whodie0))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Bloodwyn_AttackEnded_Info()
{
    AI_Output (self, other ,"DIA_Addon_Bloodwyn_AttackEnded_03_01"); //A teraz wynocha st¹d!
    AI_Output (other, self ,"DIA_Addon_Bloodwyn_AttackEnded_15_02"); //A jeœli bêdê po...
    AI_Output (self, other ,"DIA_Addon_Bloodwyn_AttackEnded_03_03"); //Wynoœ siê powiedzia³em!
    B_LogEntry                     (TOPIC_Tomb,"Uda³o siê nam otworzyæ wejœcie do grobowca. Wybieg³a z niego ca³a chmara kamiennych maszkar. Poradziliœmy sobie z nimi. Po wszystkim Kruk znikn¹³ w grobowcu, a Bloodwyn kaza³ mi siê wynosiæ. Nie mam zamiaru zostaæ w tej kopalni.");
    Log_SetTopicStatus       (TOPIC_Tomb, LOG_SUCCESS);
    MIS_Tomb = LOG_SUCCESS;
	Npc_ExchangeRoutine (BDT_10014_Addon_Thorus, "AfterAttack");
};

