//========================================
//-----------------> Hello
//========================================

INSTANCE DIA_Addon_Finn_Hello (C_INFO)
{
   npc          = BDT_10004_Addon_Finn;
   nr           = 1;
   condition    = DIA_Addon_Finn_Hello_Condition;
   information  = DIA_Addon_Finn_Hello_Info;
   permanent	= FALSE;
   description	= "Witaj.";
};

FUNC INT DIA_Addon_Finn_Hello_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Addon_Finn_Hello_Info()
{
    AI_Output (other, self ,"DIA_Addon_Finn_Hello_15_01"); //Witaj.
    AI_Output (self, other ,"DIA_Addon_Finn_Hello_03_02"); //Witam.
    AI_Output (other, self ,"DIA_Addon_Finn_Hello_15_03"); //Od razu widaæ, ¿e jesteœ profesjonalist¹.
    AI_Output (self, other ,"DIA_Addon_Finn_Hello_03_04"); //Racja. Jestem 35 lat w tym zawodzie. Pracowa³em w wielu kopalniach i wykopaliskach.
    AI_Output (other, self ,"DIA_Addon_Finn_Hello_15_05"); //Dasz mi jak¹œ radê?
    AI_Output (self, other ,"DIA_Addon_Finn_Hello_03_06"); //Pewnie. Czas po³upaæ trochê z³ota. Gdy uderzasz, to zdecyduj siê na si³ê. Czasami mocne uderzenia nic nie daj¹, a gdy tak robisz, to szybko siê mêczysz.
    AI_Output (self, other ,"DIA_Addon_Finn_Hello_03_07"); //Pierwsze uderzenia powinny sprawdzaæ ¿y³ê z³ota. Rada od doœwiadczonego Finna. 
    B_Upgrade_Hero_HackChance (10);
    AI_Output (other, self ,"DIA_Addon_Finn_Hello_15_08"); //Jestem Vinc. Dziêki za poradê.
    AI_Output (self, other ,"DIA_Addon_Finn_Hello_03_09"); //Do us³ug.
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> NotNow
//========================================

INSTANCE DIA_Addon_Finn_NotNow (C_INFO)
{
   npc          = BDT_10004_Addon_Finn;
   nr           = 2;
   condition    = DIA_Addon_Finn_NotNow_Condition;
   information  = DIA_Addon_Finn_NotNow_Info;
   permanent	= TRUE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Finn_NotNow_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Finn_Hello))
    && (Npc_IsInState (self,ZS_Talk))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Finn_NotNow_Info()
{
    AI_Output (self, other ,"DIA_Addon_Finn_NotNow_03_01"); //Jak widzisz mam robotê. Mo¿e jak skoñczê to pogadamy.
    AI_StopProcessInfos	(self);
};

