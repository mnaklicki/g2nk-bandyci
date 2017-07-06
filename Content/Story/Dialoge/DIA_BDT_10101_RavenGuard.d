//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_RavenGuard4_EXIT(C_INFO)
{
	npc             = BDT_10101_RavenGuard;
	nr              = 999;
	condition	= DIA_RavenGuard4_EXIT_Condition;
	information	= DIA_RavenGuard4_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_RavenGuard4_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_RavenGuard4_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

INSTANCE DIA_RavenGuard4_GoAway (C_INFO)
{
   npc          = BDT_10100_RavenGuard;
   nr           = 1;
   condition    = DIA_RavenGuard4_GoAway_Condition;
   information  = DIA_RavenGuard4_GoAway_Info;
   permanent	= TRUE;
   important	= TRUE;
};

FUNC INT DIA_RavenGuard4_GoAway_Condition()
{
    if ((!Npc_KnowsInfo (other, DIA_Addon_Raven_GotTheTablets))
    && (Npc_IsInState (self,ZS_Talk)))
	{
		return TRUE;
	};
};

FUNC VOID DIA_RavenGuard4_GoAway_Info()
{
    AI_Output (self, other ,"DIA_RavenGuard4_GoAway_03_01"); //Spadaj.
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> GoToTemple2
//========================================

INSTANCE DIA_RavenGuard_GoToTemple2 (C_INFO)
{
   npc          = BDT_10101_RavenGuard;
   nr           = 1;
   condition    = DIA_RavenGuard_GoToTemple2_Condition;
   information  = DIA_RavenGuard_GoToTemple2_Info;
   permanent	= FALSE;
   description	= "Masz iœæ do œwi¹tyni. To rozkaz Kruka.";
};

FUNC INT DIA_RavenGuard_GoToTemple2_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Raven_GotTheTablets))
    {
    return TRUE;
    };
};


FUNC VOID DIA_RavenGuard_GoToTemple2_Info()
{
    AI_Output (other, self ,"DIA_RavenGuard_GoToTemple2_15_01"); //Masz iœæ do œwi¹tyni. To rozkaz Kruka.
    AI_Output (self, other ,"DIA_RavenGuard_GoToTemple2_03_02"); //Idê.
    Npc_ExchangeRoutine (self, "TOT");
    AI_StopProcessInfos	(self);
};

