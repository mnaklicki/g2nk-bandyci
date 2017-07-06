
INSTANCE Addon_10008_Bandit_EXIT   (C_INFO)
{
	npc         = BDT_10008_Addon_Bandit;
	nr          = 999;
	condition   = Addon_10008_Bandit_EXIT_Condition;
	information = Addon_10008_Bandit_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT Addon_10008_Bandit_EXIT_Condition()
{	
		return TRUE;
};
FUNC VOID Addon_10008_Bandit_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//========================================
//-----------------> DontWakeHim
//========================================

INSTANCE DIA_Addon_Bandit_DontWakeHim (C_INFO)
{
   npc          = BDT_10008_Addon_Bandit;
   nr           = 1;
   condition    = DIA_Addon_Bandit_DontWakeHim_Condition;
   information  = DIA_Addon_Bandit_DontWakeHim_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Bandit_DontWakeHim_Condition()
{
    if (Npc_GetDistToNpc(other, Skinner) <= 600)
    && (!Npc_IsDead(Skinner))
    && (Skinner.aivar[AIV_TalkedToPlayer] == FALSE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Bandit_DontWakeHim_Info()
{
    AI_Output (self, other ,"DIA_Addon_Bandit_DontWakeHim_03_01"); //Nie idŸ do niego!
    AI_Output (other, self ,"DIA_Addon_Bandit_DontWakeHim_15_02"); //A co z nim nie tak?
    AI_Output (self, other ,"DIA_Addon_Bandit_DontWakeHim_03_03"); //Zabi³ tego kolesia, bo ten chcia³ go obudziæ. Nie przechodŸ obok niego.
    AI_Output (other, self ,"DIA_Addon_Bandit_DontWakeHim_15_04"); //Dziêki za radê.
    AI_Output (self, other ,"DIA_Addon_Bandit_DontWakeHim_03_05"); //Proszê bardzo.
};

//========================================
//-----------------> WhatsUp
//========================================

INSTANCE DIA_Addon_Bandit_WhatsUp (C_INFO)
{
   npc          = BDT_10008_Addon_Bandit;
   nr           = 2;
   condition    = DIA_Addon_Bandit_WhatsUp_Condition;
   information  = DIA_Addon_Bandit_WhatsUp_Info;
   permanent	= TRUE;
   description	= "Co tam?";
};

FUNC INT DIA_Addon_Bandit_WhatsUp_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Bandit_DontWakeHim))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Bandit_WhatsUp_Info()
{
    AI_Output (other, self ,"DIA_Addon_Bandit_WhatsUp_15_01"); //Co tam?
    AI_Output (self, other ,"DIA_Addon_Bandit_WhatsUp_03_02"); //Nic ciekawego. Ot, gotujê zupê.
};

