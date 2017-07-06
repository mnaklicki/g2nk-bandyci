//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_RavenGuard5_EXIT(C_INFO)
{
	npc             = BDT_10100_RavenGuard;
	nr              = 999;
	condition	= DIA_RavenGuard5_EXIT_Condition;
	information	= DIA_RavenGuard5_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_RavenGuard5_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_RavenGuard5_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

INSTANCE DIA_RavenGuard5_GoAway (C_INFO)
{
   npc          = BDT_10100_RavenGuard;
   nr           = 1;
   condition    = DIA_RavenGuard5_GoAway_Condition;
   information  = DIA_RavenGuard5_GoAway_Info;
   permanent	= TRUE;
   important	= TRUE;
};

FUNC INT DIA_RavenGuard5_GoAway_Condition()
{
    if ((!Npc_KnowsInfo (other, DIA_Addon_Raven_GotTheTablets))
    && (Npc_IsInState (self,ZS_Talk)))
	{
		return TRUE;
	};
};

FUNC VOID DIA_RavenGuard5_GoAway_Info()
{
    AI_Output (self, other ,"DIA_RavenGuard5_GoAway_03_01"); //Daj mi spokój.
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> GoToTemple
//========================================

INSTANCE DIA_RavenGuard_GoToTemple (C_INFO)
{
   npc          = BDT_10100_RavenGuard;
   nr           = 1;
   condition    = DIA_RavenGuard_GoToTemple_Condition;
   information  = DIA_RavenGuard_GoToTemple_Info;
   permanent	= FALSE;
   description	= "Kruk potrzebuje ciê w œwi¹tyni.";
};

FUNC INT DIA_RavenGuard_GoToTemple_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Raven_GotTheTablets))
    {
    return TRUE;
    };
};

FUNC VOID DIA_RavenGuard_GoToTemple_Info()
{
    AI_Output (other, self ,"DIA_RavenGuard_GoToTemple_15_01"); //Kruk potrzebuje ciê w œwi¹tyni.
    AI_Output (self, other ,"DIA_RavenGuard_GoToTemple_03_02"); //Ju¿ idê.
    Npc_ExchangeRoutine (self, "TOT");
	Npc_ExchangeRoutine (BDT_1085_Addon_Bloodwyn, "WaitBeforeAttack");
	AI_Teleport		(BDT_1085_Addon_Bloodwyn, "ADW_MINE_TO_GRUFT_02");
	Npc_ExchangeRoutine (BDT_10019_Alvaro, "WaitBeforeAttack");
	AI_Teleport		(BDT_10019_Alvaro, "ADW_MINE_TO_GRUFT_02");
    AI_StopProcessInfos	(self);
};

