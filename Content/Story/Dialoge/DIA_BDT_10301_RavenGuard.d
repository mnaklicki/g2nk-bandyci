//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_RavenGuard3_EXIT(C_INFO)
{
	npc             = BDT_10301_RavenGuard;
	nr              = 999;
	condition	= DIA_RavenGuard3_EXIT_Condition;
	information	= DIA_RavenGuard3_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_RavenGuard3_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_RavenGuard3_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

INSTANCE DIA_RavenGuard3_GoAway (C_INFO)
{
   npc          = BDT_10100_RavenGuard;
   nr           = 1;
   condition    = DIA_RavenGuard3_GoAway_Condition;
   information  = DIA_RavenGuard3_GoAway_Info;
   permanent	= TRUE;
   important	= TRUE;
};

FUNC INT DIA_RavenGuard3_GoAway_Condition()
{
    if ((!Npc_KnowsInfo (other, DIA_Addon_Raven_GotTheTablets))
    && (Npc_IsInState (self,ZS_Talk)))
	{
		return TRUE;
	};
};

FUNC VOID DIA_RavenGuard3_GoAway_Info()
{
    AI_Output (self, other ,"DIA_RavenGuard4_GoAway_03_01"); //Nie teraz!
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> GoToTemple5
//========================================

INSTANCE DIA_RavenGuard_GoToTemple5 (C_INFO)
{
   npc          = BDT_10301_RavenGuard;
   nr           = 1;
   condition    = DIA_RavenGuard_GoToTemple5_Condition;
   information  = DIA_RavenGuard_GoToTemple5_Info;
   permanent	= FALSE;
   description	= "Masz udaæ siê do œwi¹tyni. Kruk ciê potrzebujê.";
};

FUNC INT DIA_RavenGuard_GoToTemple5_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Raven_GotTheTablets))
    {
    return TRUE;
    };
};


FUNC VOID DIA_RavenGuard_GoToTemple5_Info()
{
    AI_Output (other, self ,"DIA_RavenGuard_GoToTemple5_15_01"); //Masz udaæ siê do œwi¹tyni. Kruk ciê potrzebujê.
    AI_Output (self, other ,"DIA_RavenGuard_GoToTemple5_03_02"); //Ehh, no dobra.
    Npc_ExchangeRoutine (self, "TOT");
    AI_StopProcessInfos	(self);
};

