//========================================
//-----------------> GoAway
//========================================

INSTANCE DIA_Addon_Wache_02_GoAway (C_INFO)
{
   npc          = BDT_10005_Addon_Wache_02;
   nr           = 1;
   condition    = DIA_Addon_Wache_02_GoAway_Condition;
   information  = DIA_Addon_Wache_02_GoAway_Info;
   permanent	= TRUE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Wache_02_GoAway_Condition()
{
    if (Npc_IsInState (self,ZS_Talk))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Wache_02_GoAway_Info()
{
    AI_Output (self, other ,"DIA_Addon_Wache_02_GoAway_03_01"); //Nie mam czasu na pogawêdki z tob¹.
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> GoAway
//========================================

INSTANCE DIA_Addon_Wache_01_GoAway (C_INFO)
{
   npc          = BDT_1081_Addon_Wache_01;
   nr           = 1;
   condition    = DIA_Addon_Wache_01_GoAway_Condition;
   information  = DIA_Addon_Wache_01_GoAway_Info;
   permanent	= TRUE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Wache_01_GoAway_Condition()
{
    if (Npc_IsInState (self,ZS_Talk))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Wache_01_GoAway_Info()
{
    AI_Output (self, other ,"DIA_Addon_Wache_01_GoAway_03_01"); //Odwal siê ode mnie.
    AI_StopProcessInfos	(self);
};
