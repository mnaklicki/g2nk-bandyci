//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Franco_EXIT(C_INFO)
{
	npc             = BDT_1093_Addon_Franco;
	nr              = 999;
	condition	= DIA_Franco_EXIT_Condition;
	information	= DIA_Franco_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Franco_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Franco_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WhatsUp
//========================================

INSTANCE DIA_Addon_Franco_WhatsUp (C_INFO)
{
   npc          = BDT_1093_Addon_Franco;
   nr           = 1;
   condition    = DIA_Addon_Franco_WhatsUp_Condition;
   information  = DIA_Addon_Franco_WhatsUp_Info;
   permanent	= TRUE;
   description	= "Co s³ychaæ?";
};

FUNC INT DIA_Addon_Franco_WhatsUp_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Addon_Franco_WhatsUp_Info()
{
    AI_Output (other, self ,"DIA_Addon_Franco_WhatsUp_15_01"); //Co s³ychaæ?
    AI_Output (self, other ,"DIA_Addon_Franco_WhatsUp_03_02"); //Daj mi spokój.
};

//========================================
//-----------------> NotYourBusiness
//========================================

INSTANCE DIA_Addon_Franco_NotYourBusiness (C_INFO)
{
   npc          = BDT_1093_Addon_Franco;
   nr           = 1;
   condition    = DIA_Addon_Franco_NotYourBusiness_Condition;
   information  = DIA_Addon_Franco_NotYourBusiness_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Franco_NotYourBusiness_Condition()
{
    if (MIS_Pouches_for_Miguel == LOG_SUCCESS)
    && (MIS_Edgors_Hunt == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Franco_NotYourBusiness_Info()
{
    AI_Output (self, other ,"DIA_Addon_Franco_NotYourBusiness_03_01"); //No proszê, kogo my tu mamy?
    AI_Output (other, self ,"DIA_Addon_Franco_NotYourBusiness_15_02"); //To samo mogê powiedzieæ i ja.
    AI_Output (self, other ,"DIA_Addon_Franco_NotYourBusiness_03_03"); //Pos³uchaj mnie uwa¿nie. Nie wtykaj nosa w nie swoje sprawy.
    AI_Output (other, self ,"DIA_Addon_Franco_NotYourBusiness_15_04"); //Pe³no jest ludzi, co nie zas³uguj¹, by do nich mówiæ.
    AI_Output (self, other ,"DIA_Addon_Franco_NotYourBusiness_03_05"); //Uwa¿aj co mówisz! Nie bêdê powtarza³. ZejdŸ mi z oczu i nie pokazuj siê wiêcej.

    Info_ClearChoices		(DIA_Addon_Franco_NotYourBusiness);
    Info_AddChoice		(DIA_Addon_Franco_NotYourBusiness, "(odchodzimy)", DIA_Addon_Franco_NotYourBusiness_GoAway);
    Info_AddChoice		(DIA_Addon_Franco_NotYourBusiness, "(nic nie mówimy)", DIA_Addon_Franco_NotYourBusiness_SayNothing);
    Info_AddChoice		(DIA_Addon_Franco_NotYourBusiness, "Ludzie maj¹ prawo byæ g³upimi.", DIA_Addon_Franco_NotYourBusiness_Continue);
};

FUNC VOID DIA_Addon_Franco_NotYourBusiness_GoAway()
{
    AI_Output (other, self ,"DIA_Addon_Franco_NotYourBusiness_GoAway_15_01"); //Jak sobie chcesz.
    Info_ClearChoices		(DIA_Addon_Franco_NotYourBusiness);
    AI_StopProcessInfos	(self);
    MIS_Franco = LOG_RUNNING;

    Log_CreateTopic            (TOPIC_Franco, LOG_MISSION);
    Log_SetTopicStatus       (TOPIC_Franco, LOG_RUNNING);
    B_LogEntry                     (TOPIC_Franco,"Spotka³em Franko. Ten typek grozi³ mi, abym nie wtyka³ nosa w nie swoje sprawy. Ten goœæ mo¿e sprawiaæ problemy.");
    Npc_ExchangeRoutine (self, "Start");
};

FUNC VOID DIA_Addon_Franco_NotYourBusiness_SayNothing()
{
    AI_Output (other, self ,"DIA_Addon_Franco_NotYourBusiness_SayNothing_15_01"); //...
    AI_Output (self, other ,"DIA_Addon_Franco_NotYourBusiness_SayNothing_03_02"); //Widzê, ¿e masz trochê rozs¹dku.
    Info_ClearChoices		(DIA_Addon_Franco_NotYourBusiness);
    AI_StopProcessInfos	(self);
    MIS_Franco = LOG_RUNNING;

    Log_CreateTopic            (TOPIC_Franco, LOG_MISSION);
    Log_SetTopicStatus       (TOPIC_Franco, LOG_RUNNING);
    B_LogEntry                     (TOPIC_Franco,"Spotka³em Franko. Ten typek grozi³ mi, abym nie wtyka³ nosa w nie swoje sprawy. Ten goœæ mo¿e sprawiaæ problemy.");
    Npc_ExchangeRoutine (self, "Start");
};

FUNC VOID DIA_Addon_Franco_NotYourBusiness_Continue()
{
    AI_Output (other, self ,"DIA_Addon_Franco_NotYourBusiness_Continue_15_01"); //Ludzie maj¹ prawo byæ g³upimi.
    AI_Output (self, other ,"DIA_Addon_Franco_NotYourBusiness_Continue_03_02"); //Wystawiasz sobie swoj¹ w³asn¹ ocenê. 
    AI_Output (other, self ,"DIA_Addon_Franco_NotYourBusiness_Continue_15_03"); //To nie by³a moja ocena...
    AI_Output (self, other ,"DIA_Addon_Franco_NotYourBusiness_Continue_03_04"); //Ty bezczelny œmieciu. Jeszcze tego po¿a³ujesz.
    MIS_Franco = LOG_RUNNING;

    Log_CreateTopic            (TOPIC_Franco, LOG_MISSION);
    Log_SetTopicStatus       (TOPIC_Franco, LOG_RUNNING);
    B_LogEntry                     (TOPIC_Franco,"Spotka³em Franko. Ten typek grozi³ mi, abym nie wtyka³ nosa w nie swoje sprawy. Ten goœæ mo¿e sprawiaæ problemy.");
    Npc_ExchangeRoutine (self, "Start");
    Info_ClearChoices		(DIA_Addon_Franco_NotYourBusiness);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WhatHappenedHere
//========================================

INSTANCE DIA_Addon_Franco_WhatHappenedHere (C_INFO)
{
   npc          = BDT_1093_Addon_Franco;
   nr           = 1;
   condition    = DIA_Addon_Franco_WhatHappenedHere_Condition;
   information  = DIA_Addon_Franco_WhatHappenedHere_Info;
   permanent	= FALSE;
   description	= "Co siê tu sta³o?!";
};

FUNC INT DIA_Addon_Franco_WhatHappenedHere_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Thorus_WhatHappenedThere))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Franco_WhatHappenedHere_Info()
{
    AI_Output (other, self ,"DIA_Addon_Franco_WhatHappenedHere_15_01"); //Co siê tu sta³o?!
    AI_Output (self, other ,"DIA_Addon_Franco_WhatHappenedHere_03_02"); //Ooo, proszê. Stawiasz mi takie pytania? (œmiej siê) Ha ha. Jeszcze tu jesteœ?
    AI_Output (other, self ,"DIA_Addon_Franco_WhatHappenedHere_15_03"); //Czemu go zabi³eœ?
    AI_Output (self, other ,"DIA_Addon_Franco_WhatHappenedHere_03_04"); //Bo by³ s³aby i bezu¿yteczny? ZejdŸ mi z oczu, ch³ystku. Masz wstêp do obozu, to wracaj tam i pilnuj swojego nosa.
    B_LogEntry                     (TOPIC_Riot_in_Hunters_Camp,"Tego siê nie spodziewa³em. Fletcher nie ¿yje. Zabi³ go ten Franko. Cholera! Co siê dzieje? Pogadam z innymi. Edgor i reszta mo¿e wiedz¹ wiêcej na ten temat.");
};

//========================================
//-----------------> WheresArvo
//========================================

INSTANCE DIA_Addon_Franco_WheresArvo (C_INFO)
{
   npc          = BDT_1093_Addon_Franco;
   nr           = 1;
   condition    = DIA_Addon_Franco_WheresArvo_Condition;
   information  = DIA_Addon_Franco_WheresArvo_Info;
   permanent	= FALSE;
   description	= "Gdzie jest Arvo?";
};

FUNC INT DIA_Addon_Franco_WheresArvo_Condition()
{
    if (MIS_Arvo == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Franco_WheresArvo_Info()
{
    AI_Output (other, self ,"DIA_Addon_Franco_WheresArvo_15_01"); //Gdzie jest Arvo?
    AI_Output (self, other ,"DIA_Addon_Franco_WheresArvo_03_02"); //A czego od niego chcesz? Zreszt¹, co mnie to obchodzi.
    AI_Output (self, other ,"DIA_Addon_Franco_WheresArvo_03_03"); //Jeœli masz coœ do niego to go poszukaj. A teraz zejdŸ mi z oczu.
    B_LogEntry                     (TOPIC_Arvo,"Franko chyba go kryje. Ale mi to i tak nie przeszkodzi. Spytam kogoœ innego. Ten idiota nie móg³ odejœæ za daleko.");
};

