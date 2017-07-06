//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Addon_Esteban_EXIT(C_INFO)
{
	npc             = BDT_1083_Addon_Esteban;
	nr              = 999;
	condition	= DIA_Addon_Esteban_EXIT_Condition;
	information	= DIA_Addon_Esteban_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Addon_Esteban_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Esteban_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WhatToDo
//========================================

INSTANCE DIA_Addon_Esteban_WhatToDo (C_INFO)
{
   npc          = BDT_1083_Addon_Esteban;
   nr           = 1;
   condition    = DIA_Addon_Esteban_WhatToDo_Condition;
   information  = DIA_Addon_Esteban_WhatToDo_Info;
   permanent	= FALSE;
   description	= "Wiêc co muszê zrobiæ, ¿eby dostaæ siê wy¿ej?";
};

FUNC INT DIA_Addon_Esteban_WhatToDo_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Esteban_YouAreEsteban))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Esteban_WhatToDo_Info()
{
    AI_Output (other, self ,"DIA_Addon_Esteban_WhatToDo_15_01"); //Wiêc co muszê zrobiæ, ¿eby dostaæ siê wy¿ej?
    AI_Output (self, other ,"DIA_Addon_Esteban_WhatToDo_03_02"); //Najlepiej nie spadnij na sam dó³.
    AI_Output (other, self ,"DIA_Addon_Esteban_WhatToDo_15_03"); //Nie ¿artuj sobie!
    AI_Output (self, other ,"DIA_Addon_Esteban_WhatToDo_03_04"); //Proszê, a¿ tak ci zale¿y? Dobra, dam ci szansê.
    AI_Output (self, other ,"DIA_Addon_Esteban_WhatToDo_03_05"); //Wpuszczam tylko utalentowanych kopaczy. Nie wygl¹dasz mi na takiego. Mam dla ciebie coœ innego.
    AI_Output (other, self ,"DIA_Addon_Esteban_WhatToDo_15_06"); //S³ucham?
    AI_Output (self, other ,"DIA_Addon_Esteban_WhatToDo_03_07"); //W jakiejœ jaskini na bagnie jest ponoæ ukryta tablica.
    AI_Output (other, self ,"DIA_Addon_Esteban_WhatToDo_15_08"); //Hm?
    AI_Output (self, other ,"DIA_Addon_Esteban_WhatToDo_03_09"); //Zlecenie z góry. Uda ci siê to wejdziesz. Nie uda... Lepiej nie przychodŸ.
    AI_Output (other, self ,"DIA_Addon_Esteban_WhatToDo_15_10"); //Jasne. Gdzie ta jaskinia?
    AI_Output (self, other ,"DIA_Addon_Esteban_WhatToDo_03_11"); //Przecie¿ mówiê, ¿e gdzieœ na bagnie.
    AI_Output (other, self ,"DIA_Addon_Esteban_WhatToDo_15_12"); //A dok³adniej?
    AI_Output (self, other ,"DIA_Addon_Esteban_WhatToDo_03_13"); //IdŸ do Arvo.
    AI_Output (other, self ,"DIA_Addon_Esteban_WhatToDo_15_14"); //A co on ma do tego?
    AI_Output (self, other ,"DIA_Addon_Esteban_WhatToDo_03_15"); //On ciê tam zaprowadzi, a teraz zejdŸ mi z oczu.
    MIS_Move_up_the_Hierarchy = LOG_RUNNING;

    Log_CreateTopic            (TOPIC_Move_up_the_Hierarchy, LOG_MISSION);
    Log_SetTopicStatus       (TOPIC_Move_up_the_Hierarchy, LOG_RUNNING);
    B_LogEntry                     (TOPIC_Move_up_the_Hierarchy,"Aby dostaæ siê do ostatniej czêœci obozu muszê znaleŸæ dla Estebana jak¹œ tabliczkê. Oczywiœcie ten idiota pos³a³ mnie do Arvo, bo tylko on wie gdzie jest ta jaskinia. Zapowiada siê œwietna robota, przed wyruszeniem powinienem zajrzeæ do Huno i kupiæ kilof. Kto wie, mo¿e siê przyda.");
};

//========================================
//-----------------> FinallyYouAreHere
//========================================

INSTANCE DIA_Addon_Esteban_FinallyYouAreHere (C_INFO)
{
   npc          = BDT_1083_Addon_Esteban;
   nr           = 1;
   condition    = DIA_Addon_Esteban_FinallyYouAreHere_Condition;
   information  = DIA_Addon_Esteban_FinallyYouAreHere_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Esteban_FinallyYouAreHere_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Arvo_WaitAMinute))
    && (Npc_HasItems (other, ItWr_StonePlate_Cave) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Esteban_FinallyYouAreHere_Info()
{
    AI_Output (self, other ,"DIA_Addon_Esteban_FinallyYouAreHere_03_01"); //NO jesteœ ju¿! Nie s¹dzi³em, ¿e tu przyjdziesz.
    AI_Output (other, self ,"DIA_Addon_Esteban_FinallyYouAreHere_15_02"); //O co ci chodzi?
    AI_Output (self, other ,"DIA_Addon_Esteban_FinallyYouAreHere_03_03"); //Masz tabliczkê?
    AI_Output (other, self ,"DIA_Addon_Esteban_FinallyYouAreHere_15_04"); //Trzymaj.
    B_GiveInvItems (other, self, ItWr_StonePlate_Cave, 1);
    AI_Output (self, other ,"DIA_Addon_Esteban_FinallyYouAreHere_03_05"); //I jak posz³o?
    AI_Output (other, self ,"DIA_Addon_Esteban_FinallyYouAreHere_15_06"); //Musia³em kopaæ w poszukiwaniu tej tabliczki, podczas gdy Arvo nic nie zrobi³.
    AI_Output (self, other ,"DIA_Addon_Esteban_FinallyYouAreHere_03_07"); //Czy¿by? Arvo mówi³ co innego.
    AI_Output (other, self ,"DIA_Addon_Esteban_FinallyYouAreHere_15_08"); //Co znowu?
    AI_Output (self, other ,"DIA_Addon_Esteban_FinallyYouAreHere_03_09"); //Ponoæ to TY nic nie robi³eœ. A Arvo musia³ kopaæ.
    AI_Output (other, self ,"DIA_Addon_Esteban_FinallyYouAreHere_15_10"); //Bzdury.
    AI_Output (self, other ,"DIA_Addon_Esteban_FinallyYouAreHere_03_11"); //ZejdŸ mi z oczu. Jesteœ bezu¿ytecznym œmieciem.
    B_LogEntry                     (TOPIC_Move_up_the_Hierarchy,"Œwietnie! Arvo zrobi³ z siebie ofiarê, a teraz nie mam wstêpu do kopalni. Nie wiem, jak ta banda mo¿e utrzymywaæ takiego mazgaja. Jak spotkam Arvo, to wyrwê mu ten k³amliwy jêzyk.");
    Log_SetTopicStatus       (TOPIC_Move_up_the_Hierarchy, LOG_SUCCESS);
    MIS_Move_up_the_Hierarchy = LOG_SUCCESS;
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> YouAreEsteban
//========================================

INSTANCE DIA_Addon_Esteban_YouAreEsteban (C_INFO)
{
   npc          = BDT_1083_Addon_Esteban;
   nr           = 1;
   condition    = DIA_Addon_Esteban_YouAreEsteban_Condition;
   information  = DIA_Addon_Esteban_YouAreEsteban_Info;
   permanent	= FALSE;
   description	= "Ty jesteœ Esteban?";
};

FUNC INT DIA_Addon_Esteban_YouAreEsteban_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Fletcher_GoodNews))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Esteban_YouAreEsteban_Info()
{
    AI_Output (other, self ,"DIA_Addon_Esteban_YouAreEsteban_15_01"); //Ty jesteœ Esteban?
    AI_Output (self, other ,"DIA_Addon_Esteban_YouAreEsteban_03_02"); //Tak, to ja. A ty to kto?
    AI_Output (other, self ,"DIA_Addon_Esteban_YouAreEsteban_15_03"); //Vinc.
    AI_Output (self, other ,"DIA_Addon_Esteban_YouAreEsteban_03_04"); //I czego ode mnie chcesz?
    AI_Output (other, self ,"DIA_Addon_Esteban_YouAreEsteban_15_05"); //Dostaæ siê kopalni.
    AI_Output (self, other ,"DIA_Addon_Esteban_YouAreEsteban_03_06"); //(œmiech) A kto by nie chcia³?
};

//========================================
//-----------------> GoAway
//========================================

INSTANCE DIA_Addon_Esteban_GoAway (C_INFO)
{
   npc          = BDT_1083_Addon_Esteban;
   nr           = 2;
   condition    = DIA_Addon_Esteban_GoAway_Condition;
   information  = DIA_Addon_Esteban_GoAway_Info;
   permanent	= TRUE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Esteban_GoAway_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Esteban_FinallyYouAreHere))
    && (Npc_IsInState (self,ZS_Talk))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Esteban_GoAway_Info()
{
    AI_Output (self, other ,"DIA_Addon_Esteban_GoAway_03_01"); //Wynoœ siê st¹d!
    AI_StopProcessInfos	(self);
};

