//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_RavenGuard1_EXIT(C_INFO)
{
	npc             = BDT_10102_RavenGuard;
	nr              = 999;
	condition	= DIA_RavenGuard1_EXIT_Condition;
	information	= DIA_RavenGuard1_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_RavenGuard1_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_RavenGuard1_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

INSTANCE DIA_RavenGuard1_GoAway (C_INFO)
{
   npc          = BDT_10100_RavenGuard;
   nr           = 1;
   condition    = DIA_RavenGuard1_GoAway_Condition;
   information  = DIA_RavenGuard1_GoAway_Info;
   permanent	= TRUE;
   important	= TRUE;
};

FUNC INT DIA_RavenGuard1_GoAway_Condition()
{
    if ((!Npc_KnowsInfo (other, DIA_Addon_Raven_GotTheTablets))
    && (Npc_IsInState (self,ZS_Talk)))
	{
		return TRUE;
	};
};

FUNC VOID DIA_RavenGuard1_GoAway_Info()
{
    AI_Output (self, other ,"DIA_RavenGuard1_GoAway_03_01"); //Nie mam czasu.
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> GoToTemple3
//========================================

INSTANCE DIA_RavenGuard_GoToTemple3 (C_INFO)
{
   npc          = BDT_10102_RavenGuard;
   nr           = 1;
   condition    = DIA_RavenGuard_GoToTemple3_Condition;
   information  = DIA_RavenGuard_GoToTemple3_Info;
   permanent	= FALSE;
   description	= "Kruk chce ciê widzieæ w œwi¹tyni.";
};

FUNC INT DIA_RavenGuard_GoToTemple3_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Raven_GotTheTablets))
    {
    return TRUE;
    };
};


FUNC VOID DIA_RavenGuard_GoToTemple3_Info()
{
    AI_Output (other, self ,"DIA_RavenGuard_GoToTemple3_15_01"); //Kruk chce ciê widzieæ w œwi¹tyni.
    AI_Output (self, other ,"DIA_RavenGuard_GoToTemple3_03_02"); //Jasne.
    Npc_ExchangeRoutine (self, "TOT");
    AI_StopProcessInfos	(self);
};

