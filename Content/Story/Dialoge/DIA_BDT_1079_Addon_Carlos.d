//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Addon_Carlos_EXIT(C_INFO)
{
	npc             = BDT_1079_Addon_Carlos;
	nr              = 999;
	condition	= DIA_Addon_Carlos_EXIT_Condition;
	information	= DIA_Addon_Carlos_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Addon_Carlos_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Carlos_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WeHaveToGoTrade
//========================================

INSTANCE DIA_Addon_Carlos_WeHaveToGoTrade (C_INFO)
{
   npc          = BDT_1079_Addon_Carlos;
   nr           = 1;
   condition    = DIA_Addon_Carlos_WeHaveToGoTrade_Condition;
   information  = DIA_Addon_Carlos_WeHaveToGoTrade_Info;
   permanent	= FALSE;
   description	= "Mamy braÊ udzia≥ w transporcie.";
};

FUNC INT DIA_Addon_Carlos_WeHaveToGoTrade_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Thorus_WhatCanIDo))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Carlos_WeHaveToGoTrade_Info()
{
    AI_Output (other, self ,"DIA_Addon_Carlos_WeHaveToGoTrade_15_01"); //Mamy braÊ udzia≥ w transporcie.
    AI_Output (self, other ,"DIA_Addon_Carlos_WeHaveToGoTrade_03_02"); //Znakomicie. Senyan i Sancho czekajπ przed wejúciem do obozu.
    AI_Output (self, other ,"DIA_Addon_Carlos_WeHaveToGoTrade_03_03"); //Plan jest taki. Ja trzymam z≥oto dla piratÛw. Senyan i Sancho nas os≥aniajπ, a pÛüniej pilnujπ niewolnikÛw. Ty rozmawiasz z tymi szczurami.
    AI_Output (other, self ,"DIA_Addon_Carlos_WeHaveToGoTrade_15_04"); //Dlaczego akurat ja?
    AI_Output (self, other ,"DIA_Addon_Carlos_WeHaveToGoTrade_03_05"); //Bo ja mam z≥oto, ja dowodzÍ i ja tak chcÍ. Poza tym jeúli ciÍ zabijπ bÍdÍ mia≥ pewnoúÊ co do ich intencji...
    AI_Output (other, self ,"DIA_Addon_Carlos_WeHaveToGoTrade_15_06"); //Po innych ludziach nie powinno siÍ oczekiwaÊ zbyt wiele...
    AI_Output (self, other ,"DIA_Addon_Carlos_WeHaveToGoTrade_03_07"); //HÍ? (zdziwienie)
    AI_Output (other, self ,"DIA_Addon_Carlos_WeHaveToGoTrade_15_08"); //Ruszajmy juø.
    Npc_ExchangeRoutine (self, "WaitForHero");
};

//========================================
//-----------------> ExplainThePlan
//========================================

INSTANCE DIA_Addon_Carlos_ExplainThePlan (C_INFO)
{
   npc          = BDT_1079_Addon_Carlos;
   nr           = 2;
   condition    = DIA_Addon_Carlos_ExplainThePlan_Condition;
   information  = DIA_Addon_Carlos_ExplainThePlan_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Carlos_ExplainThePlan_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Carlos_WeHaveToGoTrade))
    && (Npc_GetDistToWP (self, "BANDIT") <= 200)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Carlos_ExplainThePlan_Info()
{
    AI_Output (self, other ,"DIA_Addon_Carlos_ExplainThePlan_03_01"); //Dobra. SprawdzÍ jeszcze raz listÍ, a ty im powiedz plan. Rozumiesz?
    AI_Output (other, self ,"DIA_Addon_Carlos_ExplainThePlan_15_02"); //Jasne.
};

//========================================
//-----------------> LetsGo
//========================================

INSTANCE DIA_Addon_Carlos_LetsGo (C_INFO)
{
   npc          = BDT_1079_Addon_Carlos;
   nr           = 1;
   condition    = DIA_Addon_Carlos_LetsGo_Condition;
   information  = DIA_Addon_Carlos_LetsGo_Info;
   permanent	= FALSE;
   description	= "Senyan i Sancho znajπ plan, idziemy.";
};

FUNC INT DIA_Addon_Carlos_LetsGo_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Sancho_Plan))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Carlos_LetsGo_Info()
{
    AI_Output (other, self ,"DIA_Addon_Carlos_LetsGo_15_01"); //Senyan i Sancho znajπ plan, idziemy.
    AI_Output (self, other ,"DIA_Addon_Carlos_LetsGo_03_02"); //A i jeszcze jedno. Piraci nie wiedzπ, øe porywamy tych ludzi.
    AI_Output (other, self ,"DIA_Addon_Carlos_LetsGo_15_03"); //Co?
    AI_Output (self, other ,"DIA_Addon_Carlos_LetsGo_03_04"); //Na razie myúlπ, øe to nasi kumple. Oni tylko przewoøπ ich dla nas. Nie spapraj tej roboty.
    AI_Output (self, other ,"DIA_Addon_Carlos_LetsGo_03_05"); //Ruszamy!
    B_LogEntry                     (TOPIC_Transport,"No to czas dzia≥aÊ! Udamy siÍ teraz do kanionu i pogadamy z piratami.");
    AI_StopProcessInfos	(self);
    Npc_ExchangeRoutine (BDT_1084_Addon_Senyan, "Trade");
    Npc_ExchangeRoutine (BDT_1073_Addon_Sancho, "Trade");
    Npc_ExchangeRoutine (self, "Guide");
};

//========================================
//-----------------> TalkToSkip
//========================================

INSTANCE DIA_Addon_Carlos_TalkToSkip (C_INFO)
{
   npc          = BDT_1079_Addon_Carlos;
   nr           = 2;
   condition    = DIA_Addon_Carlos_TalkToSkip_Condition;
   information  = DIA_Addon_Carlos_TalkToSkip_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Carlos_TalkToSkip_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Carlos_LetsGo))
    && (Npc_GetDistToWP (self, "ADW_ENTRANCE_2_PIRATECAMP_01") < 150)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Carlos_TalkToSkip_Info()
{
    AI_Output (self, other ,"DIA_Addon_Carlos_TalkToSkip_03_01"); //Ten z czerwonπ chustπ to Skip. To z nim gadaj.
    AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine (self, "Trade");
};

//========================================
//-----------------> NeedToPay
//========================================

INSTANCE DIA_Addon_Carlos_NeedToPay (C_INFO)
{
   npc          = BDT_1079_Addon_Carlos;
   nr           = 1;
   condition    = DIA_Addon_Carlos_NeedToPay_Condition;
   information  = DIA_Addon_Carlos_NeedToPay_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Carlos_NeedToPay_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Skip_FinallyYoureHere))
    && (Npc_IsInState (self,ZS_Talk))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Carlos_NeedToPay_Info()
{
    AI_Output (other, self ,"DIA_Addon_Carlos_NeedToPay_15_01"); //Czas na zap≥atÍ.
    AI_Output (self, other ,"DIA_Addon_Carlos_NeedToPay_03_02"); //Daj im te sakwy. Tylko nie upuúÊ!
    CreateInvItems (self, ItSe_Pirates, 1);
    B_GiveInvItems (self, other, ItSe_Pirates, 1);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> ReadyToGo
//========================================

INSTANCE DIA_Addon_Carlos_ReadyToGo (C_INFO)
{
   npc          = BDT_1079_Addon_Carlos;
   nr           = 1;
   condition    = DIA_Addon_Carlos_ReadyToGo_Condition;
   information  = DIA_Addon_Carlos_ReadyToGo_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Carlos_ReadyToGo_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Skip_HeresYourGold))
    {
    return TRUE;
    };
};

FUNC VOID DIA_Addon_Carlos_ReadyToGo_Info()
{
    AI_Output (self, other ,"DIA_Addon_Carlos_ReadyToGo_03_01"); //Dobra. Mamy wszystko. Senyan, Sancho do roboty!
    AI_Output (self, other ,"DIA_Addon_Carlos_ReadyToGo_03_02"); //Coú jeszcze?
    AI_Output (other, self ,"DIA_Addon_Carlos_ReadyToGo_15_03"); //Kolejna dostawa za kilka dni. Tak powiedzia≥ ten pirat.
    AI_Output (self, other ,"DIA_Addon_Carlos_ReadyToGo_03_04"); //Przekaøe reszcie, wracajmy.
    B_LogEntry                     (TOPIC_Transport,"Wymiana zakoÒczona. Teraz pozosta≥o odprowadziÊ tych ludzi do obozu. Ciekawe. Ci niewolnicy wyglπdajπ znajomo...");

    Npc_ExchangeRoutine (BDT_1084_Addon_Senyan, "WaitForHero");
    Npc_ExchangeRoutine (BDT_1073_Addon_Sancho, "WaitForHero");
    Npc_ExchangeRoutine (self, "WaitForHero");
};

//========================================
//-----------------> SanchoStays
//========================================

INSTANCE DIA_Addon_Carlos_SanchoStays (C_INFO)
{
   npc          = BDT_1079_Addon_Carlos;
   nr           = 2;
   condition    = DIA_Addon_Carlos_SanchoStays_Condition;
   information  = DIA_Addon_Carlos_SanchoStays_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Carlos_SanchoStays_Condition()
{
    if (Npc_GetDistToWP (self, "BANDIT") < 150)
    && (Npc_KnowsInfo (other, DIA_Addon_Carlos_ReadyToGo))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Carlos_SanchoStays_Info()
{
    AI_Output (self, other ,"DIA_Addon_Carlos_SanchoStays_03_01"); //Dobra, staÊ! Ja, Vinc i Senyan ich odprowadzimy. Ty, Sancho, zostajesz tutaj.
    Npc_ExchangeRoutine (BDT_1073_Addon_Sancho, "Start");
    Npc_ExchangeRoutine (BDT_1084_Addon_Senyan, "Start");
    Npc_ExchangeRoutine (self, "Start");
};

//========================================
//-----------------> GoToThorus
//========================================

INSTANCE DIA_Addon_Carlos_GoToThorus (C_INFO)
{
   npc          = BDT_1079_Addon_Carlos;
   nr           = 1;
   condition    = DIA_Addon_Carlos_GoToThorus_Condition;
   information  = DIA_Addon_Carlos_GoToThorus_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Carlos_GoToThorus_Condition()
{
    if (MIS_Move_up_the_Hierarchy == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Carlos_GoToThorus_Info()
{
    AI_Output (self, other ,"DIA_Addon_Carlos_GoToThorus_03_01"); //Idü do Thorusa.
    AI_Output (other, self ,"DIA_Addon_Carlos_GoToThorus_15_02"); //A co Tho...
    AI_Output (self, other ,"DIA_Addon_Carlos_GoToThorus_03_03"); //Op≥aci ci siÍ. Idü juø.
    AI_StopProcessInfos	(self);
};

