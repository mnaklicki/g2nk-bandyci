//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Addon_Raven_EXIT(C_INFO)
{
	npc             = BDT_1090_Addon_Raven;
	nr              = 999;
	condition	= DIA_Addon_Raven_EXIT_Condition;
	information	= DIA_Addon_Raven_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Addon_Raven_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Raven_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> FinallyYouAreHere
//========================================

INSTANCE DIA_Addon_Raven_FinallyYouAreHere (C_INFO)
{
   npc          = BDT_1090_Addon_Raven;
   nr           = 1;
   condition    = DIA_Addon_Raven_FinallyYouAreHere_Condition;
   information  = DIA_Addon_Raven_FinallyYouAreHere_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Raven_FinallyYouAreHere_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Bloodwyn_GoToRaven))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Raven_FinallyYouAreHere_Info()
{
    AI_Output (self, other ,"DIA_Addon_Raven_FinallyYouAreHere_03_01"); //No, jesteœ wreszcie. S³ysza³em o twoich dzia³aniach tutaj, w obozie. NieŸle jak na kogoœ kto zabawi³ tutaj tak krótko. Od czasów kolonii nie widzia³em takiego zaanga¿owania.
    AI_Output (self, other ,"DIA_Addon_Raven_FinallyYouAreHere_03_02"); //Morderstwo dwóch ¿o³nierzy da³o ci niez³¹ reputacjê.
    AI_Output (self, other ,"DIA_Addon_Raven_FinallyYouAreHere_03_03"); //Ale do rzeczy. Masz zbadaæ kompleks korytarzy w centralnej czêœci krainy.
    AI_Output (other, self ,"DIA_Addon_Raven_FinallyYouAreHere_15_04"); //By³em tam ju¿ parê razy.
    AI_Output (self, other ,"DIA_Addon_Raven_FinallyYouAreHere_03_05"); //Czy pozwoli³em ci mówiæ?! Masz zwiedziæ ten kompleks i powiedzieæ czy jest tam coœ ciekawego. Rozumiesz?
    AI_Output (other, self ,"DIA_Addon_Raven_FinallyYouAreHere_15_06"); //Tak.
    AI_Output (self, other ,"DIA_Addon_Raven_FinallyYouAreHere_03_07"); //I zbadaj jeszcze piedesta³y obok tych platform.
    AI_Output (self, other ,"DIA_Addon_Raven_FinallyYouAreHere_03_08"); //Jeden taki piedesta³ jest ponoæ na bagnie, znajdziesz go bez problemu.
    AI_Output (other, self ,"DIA_Addon_Raven_FinallyYouAreHere_15_09"); //Rozumiem.
    AI_Output (self, other ,"DIA_Addon_Raven_FinallyYouAreHere_03_10"); //Ruszaj ju¿. Nie wracaj dopóki nie wykonasz polecenia.
    MIS_Raven = LOG_RUNNING;

    Log_CreateTopic            (TOPIC_Raven, LOG_MISSION);
    Log_SetTopicStatus       (TOPIC_Raven, LOG_RUNNING);
    B_LogEntry                     (TOPIC_Raven,"Porozmawia³em z Krukiem. Niezwykle nerwowy goœæ. Chyba ju¿ wiem od kogo Bloodwyn naby³ tego swojego pysza³kowatego i aroganckiego charakteru. Dosta³em od niego zadanie zbadania kompleksu ruin w centrum doliny. Drug¹ czêœci¹ zadania jest zbadanie piedesta³ów, które s¹ tu¿ obok tych dziwnych platform. Jedna taka platforma jest gdzieœ na bagnie. Czeka mnie d³ugi spacer.");

    Wld_InsertNpc (SwampDrone_Journal,"ADW_SOUTHEAST_TELEPORTSTATION");

    Wld_InsertNpc (Gobbo_Green_Journal,"ADW_PORTALTEMPEL_14");
    Wld_InsertNpc (Gobbo_Green,"ADW_PORTALTEMPEL_14");
    Wld_InsertNpc (Gobbo_Green,"FP_ITEM_ADWPORTAL_02");

    Wld_InsertNpc (Gobbo_Green_Journal_MainHall,"ADW_PORTALTEMPEL_06");
    Wld_InsertNpc (Gobbo_Green,"ADW_PORTALTEMPEL_07");
    Wld_InsertNpc (Gobbo_Green,"ADW_PORTALTEMPEL_TELEPORTSTATION");
    Wld_InsertNpc (Gobbo_Green,"ADW_PORTALTEMPEL_08B");
};

//========================================
//-----------------> LookedAtPedestals
//========================================

INSTANCE DIA_Addon_Raven_LookedAtPedestals (C_INFO)
{
   npc          = BDT_1090_Addon_Raven;
   nr           = 1;
   condition    = DIA_Addon_Raven_LookedAtPedestals_Condition;
   information  = DIA_Addon_Raven_LookedAtPedestals_Info;
   permanent	= FALSE;
   description	= "Zbada³em te piedesta³y.";
};

FUNC INT DIA_Addon_Raven_LookedAtPedestals_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Raven_FinallyYouAreHere))
    && (checkedTemple == TRUE)
    && (checkedTeleport == TRUE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Raven_LookedAtPedestals_Info()
{
    AI_Output (other, self ,"DIA_Addon_Raven_LookedAtPedestals_15_01"); //Zbada³em te piedesta³y. Maj¹ one jakieœ niewielkie ¿³obienia, w które mo¿na coœ umieœciæ.
    AI_Output (self, other ,"DIA_Addon_Raven_LookedAtPedestals_03_02"); //Znakomicie... A ruiny?
    AI_Output (other, self ,"DIA_Addon_Raven_LookedAtPedestals_15_03"); //W ruinach nie ma nic ciekawego, nie licz¹c piedesta³u oraz...
    AI_Output (self, other ,"DIA_Addon_Raven_LookedAtPedestals_03_04"); //Wystarczy, wystarczy! Nie obchodzi mnie reszta. Teraz mam wa¿niejsze sprawy.
    AI_Output (self, other ,"DIA_Addon_Raven_LookedAtPedestals_03_05"); //Potrzebujê piêciu starych kamiennych tablic. Przynieœ mi je.
    AI_Output (other, self ,"DIA_Addon_Raven_LookedAtPedestals_15_06"); //A gdzie ja je...
    AI_Output (self, other ,"DIA_Addon_Raven_LookedAtPedestals_03_07"); //NA co ty czekasz! Ruszaj siê!
    B_LogEntry                     (TOPIC_Raven,"Kruk nie zareagowa³ w ogóle na moje zbadanie ruin i piedesta³ów. Zby³ mnie gadk¹, ¿e potrzebuje jakiœ starych tabliczek. Na parê z nich ju¿ siê natkn¹³em.");
};

//========================================
//-----------------> GotTheTablets
//========================================

INSTANCE DIA_Addon_Raven_GotTheTablets (C_INFO)
{
   npc          = BDT_1090_Addon_Raven;
   nr           = 2;
   condition    = DIA_Addon_Raven_GotTheTablets_Condition;
   information  = DIA_Addon_Raven_GotTheTablets_Info;
   permanent	= FALSE;
   description	= "Mam ju¿ te tabliczki.";
};

FUNC INT DIA_Addon_Raven_GotTheTablets_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Raven_LookedAtPedestals))
    && (Npc_HasItems (other, ItWr_StonePlateCommon_Addon) >=5)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Raven_GotTheTablets_Info()
{
    AI_Output (other, self ,"DIA_Addon_Raven_GotTheTablets_15_01"); //Mam ju¿ te tabliczki.
    AI_Output (self, other ,"DIA_Addon_Raven_GotTheTablets_03_02"); //Daj mi je. Hmm...
    B_GiveInvItems (other, self, ItWr_StonePlateCommon_Addon, 5);
    B_UseFakeTablet();
    AI_Output (self, other ,"DIA_Addon_Raven_GotTheTablets_03_03"); //Dobra. Zbierz mi kilku stra¿ników. Maj¹ wejœæ do œwi¹tyni. Powiedz im, ¿e to JA wyda³em to polecenie.
    AI_Output (other, self ,"DIA_Addon_Raven_GotTheTablets_15_04"); //Jasne.
    B_LogEntry                     (TOPIC_Raven,"Oczywiœcie Kruk wyda³ mi kolejne polecenie. Mam zebraæ paru stra¿ników do œwi¹tyni. To znaczy oni maj¹ tam wejœæ, a ja mam im to powiedzieæ. Co za bezsens.");
};

//========================================
//-----------------> GoodJob
//========================================

INSTANCE DIA_Addon_Raven_GoodJob (C_INFO)
{
   npc          = BDT_1090_Addon_Raven;
   nr           = 1;
   condition    = DIA_Addon_Raven_GoodJob_Condition;
   information  = DIA_Addon_Raven_GoodJob_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Raven_GoodJob_Condition()
{
    if (Npc_KnowsInfo (other, DIA_RavenGuard_GoToTemple))
    && (Npc_KnowsInfo (other, DIA_RavenGuard_GoToTemple2))
    && (Npc_KnowsInfo (other, DIA_RavenGuard_GoToTemple3))
    && (Npc_KnowsInfo (other, DIA_RavenGuard_GoToTemple4))
    && (Npc_KnowsInfo (other, DIA_RavenGuard_GoToTemple5))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Raven_GoodJob_Info()
{
    AI_Output (self, other ,"DIA_Addon_Raven_GoodJob_03_01"); //Znakomicie! To teraz idŸ do Bloodwyna. Jest w kopalni. Ja zaraz do was do³¹czê.
    AI_StopProcessInfos	(self);

    B_LogEntry                     (TOPIC_Raven,"Zadanie zakoñczone. ¯adnej zap³aty i podziêkowania. Nie bardzo mi siê chce pomagaæ Krukowi. Ale po tym co zrobi³em na Khorinis, to nie mam innego wyjœcia.");
    Log_SetTopicStatus       (TOPIC_Raven, LOG_SUCCESS);
    MIS_Raven = LOG_SUCCESS;

    MIS_Tomb = LOG_RUNNING;
    Log_CreateTopic            (TOPIC_Tomb, LOG_MISSION);
    Log_SetTopicStatus       (TOPIC_Tomb, LOG_RUNNING);
    B_LogEntry                     (TOPIC_Tomb,"Teraz mam iœæ do kopalni, gdzie czeka na mnie Bloodwyn. Nie mam pojêcia co oni planuj¹, ale nie mam chyba innego wyjœcia ni¿ pójœæ tam i zobaczyæ co siê dzieje.");
	
	Wld_InsertNpc	(Stoneguardian_Tomb, "ADW_MINE_SKLAVENTOD_03");
	Wld_InsertNpc	(Stoneguardian, "ADW_MINE_SKLAVENTOD_04");
	Wld_InsertNpc	(Stoneguardian, "ADW_MINE_SKLAVENTOD_05");
};

//========================================
//-----------------> StartAttack
//========================================

INSTANCE DIA_Addon_Raven_StartAttack (C_INFO)
{
   npc          = BDT_1090_Addon_Raven;
   nr           = 1;
   condition    = DIA_Addon_Raven_StartAttack_Condition;
   information  = DIA_Addon_Raven_StartAttack_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Raven_StartAttack_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Bloodwyn_FinallyYouAreHere))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Raven_StartAttack_Info()
{
    AI_Output (self, other ,"DIA_Addon_Raven_StartAttack_03_01"); //Wszystko ju¿ rozumiem. Fortuno przesta³ byæ u¿yteczny. A co do ciebie...
    AI_Output (self, other ,"DIA_Addon_Raven_StartAttack_03_02"); //Tymi tabliczkami bardzo siê przys³u¿y³eœ. Teraz wiem wszystko.
    AI_Output (self, other ,"DIA_Addon_Raven_StartAttack_03_03"); //Do dzie³a!
    Npc_ExchangeRoutine (self, "Attack");
    Npc_ExchangeRoutine (BDT_1085_Addon_Bloodwyn, "Attack");
    Npc_ExchangeRoutine (BDT_10019_Alvaro, "Attack");
    B_LogEntry                     (TOPIC_Tomb,"Wed³ug planu Bloodwyna mam wraz z paroma stra¿nikami walczyæ z kamiennymi stra¿nikami. Przynêt¹ bêd¹ niewolnicy. Kruk mamrota³ coœ tak¿e o braku przydatnoœci Fortuno. Nie wiem co z tego wyniknie.");
    AI_StopProcessInfos	(self);
};

