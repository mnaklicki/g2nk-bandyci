//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_RavenGuard2_EXIT(C_INFO)
{
	npc             = BDT_10300_RavenGuard;
	nr              = 999;
	condition	= DIA_RavenGuard2_EXIT_Condition;
	information	= DIA_RavenGuard2_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_RavenGuard2_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_RavenGuard2_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

INSTANCE DIA_RavenGuard2_GoAway (C_INFO)
{
   npc          = BDT_10100_RavenGuard;
   nr           = 1;
   condition    = DIA_RavenGuard2_GoAway_Condition;
   information  = DIA_RavenGuard2_GoAway_Info;
   permanent	= TRUE;
   important	= TRUE;
};

FUNC INT DIA_RavenGuard2_GoAway_Condition()
{
    if ((!Npc_KnowsInfo (other, DIA_Addon_Raven_GotTheTablets))
    && (Npc_IsInState (self,ZS_Talk)))
	{
		return TRUE;
	};
};

FUNC VOID DIA_RavenGuard2_GoAway_Info()
{
    AI_Output (self, other ,"DIA_RavenGuard2_GoAway_03_01"); //Odczep siê.
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> GoToTemple4
//========================================

INSTANCE DIA_RavenGuard_GoToTemple4 (C_INFO)
{
   npc          = BDT_10300_RavenGuard;
   nr           = 1;
   condition    = DIA_RavenGuard_GoToTemple4_Condition;
   information  = DIA_RavenGuard_GoToTemple4_Info;
   permanent	= FALSE;
   description	= "Masz iœæ do œwi¹tyni. Taki jest rozkaz Kruka.";
};

FUNC INT DIA_RavenGuard_GoToTemple4_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Raven_GotTheTablets))
    {
    return TRUE;
    };
};


FUNC VOID DIA_RavenGuard_GoToTemple4_Info()
{
    AI_Output (other, self ,"DIA_RavenGuard_GoToTemple4_15_01"); //Masz iœæ do œwi¹tyni. Taki jest rozkaz Kruka.
    AI_Output (self, other ,"DIA_RavenGuard_GoToTemple4_03_02"); //Tak, tak.
    Npc_ExchangeRoutine (self, "TOT");
    AI_StopProcessInfos	(self);
};

