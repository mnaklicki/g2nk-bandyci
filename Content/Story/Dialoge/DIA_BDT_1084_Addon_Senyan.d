//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Addon_Senyan_EXIT(C_INFO)
{
	npc             = BDT_1084_Addon_Senyan;
	nr              = 999;
	condition	= DIA_Addon_Senyan_EXIT_Condition;
	information	= DIA_Addon_Senyan_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Addon_Senyan_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Senyan_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WhatAboutMyPoisoning
//========================================

INSTANCE DIA_Addon_Senyan_WhatAboutMyPoisoning (C_INFO)
{
   npc          = BDT_1084_Addon_Senyan;
   nr           = 1;
   condition    = DIA_Addon_Senyan_WhatAboutMyPoisoning_Condition;
   information  = DIA_Addon_Senyan_WhatAboutMyPoisoning_Info;
   permanent	= FALSE;
   description	= "Wiesz coœ w sprawie mojego otrucia?";
};

FUNC INT DIA_Addon_Senyan_WhatAboutMyPoisoning_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Miguel_AreYouOkay))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Senyan_WhatAboutMyPoisoning_Info()
{
    AI_Output (other, self ,"DIA_Addon_Senyan_WhatAboutMyPoisoning_15_01"); //Wiesz coœ w sprawie mojego otrucia?
    AI_Output (self, other ,"DIA_Addon_Senyan_WhatAboutMyPoisoning_03_02"); //S³uchaj mnie uwa¿nie. To nie moja sprawa. Poza tym ¿yjesz, a to jest chyba wa¿niejsze.
    AI_Output (other, self ,"DIA_Addon_Senyan_WhatAboutMyPoisoning_15_03"); //Nie pomagasz.
    AI_Output (self, other ,"DIA_Addon_Senyan_WhatAboutMyPoisoning_03_04"); //Daj mi spokój.
    B_LogEntry                     (TOPIC_Illness,"Senyan mnie zby³. Stwierdzi³, ze jeœli ¿yje to mam daæ sobie spokój. Zwyk³y œmieæ. Któregoœ dnia przyp³aci to ¿yciem.");
};

//========================================
//-----------------> WhatDoYouWant
//========================================

INSTANCE DIA_Addon_Senyan_WhatDoYouWant (C_INFO)
{
   npc          = BDT_1084_Addon_Senyan;
   nr           = 1;
   condition    = DIA_Addon_Senyan_WhatDoYouWant_Condition;
   information  = DIA_Addon_Senyan_WhatDoYouWant_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Senyan_WhatDoYouWant_Condition()
{
    if (Npc_IsInState (self,ZS_Talk))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Senyan_WhatDoYouWant_Info()
{
    AI_Output (self, other ,"DIA_Addon_Senyan_WhatDoYouWant_15_01"); //Czego chcesz?
    AI_Output (other, self ,"DIA_Addon_Senyan_WhatDoYouWant_03_02"); //W zasadzie to nic.
    AI_Output (self, other ,"DIA_Addon_Senyan_WhatDoYouWant_15_03"); //To siê ode mnie odczep. Nie mam czasu na pogawêdki.
};

//========================================
//-----------------> HowAreYou
//========================================

INSTANCE DIA_Addon_Senyan_HowAreYou (C_INFO)
{
   npc          = BDT_1084_Addon_Senyan;
   nr           = 2;
   condition    = DIA_Addon_Senyan_HowAreYou_Condition;
   information  = DIA_Addon_Senyan_HowAreYou_Info;
   permanent	= TRUE;
   description	= "Co tam?";
};

FUNC INT DIA_Addon_Senyan_HowAreYou_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Senyan_WhatDoYouWant))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Senyan_HowAreYou_Info()
{
    AI_Output (other, self ,"DIA_Addon_Senyan_HowAreYou_15_01"); //Co tam?
    AI_Output (self, other ,"DIA_Addon_Senyan_HowAreYou_03_02"); //Brak mi s³ów do ciebie. Odczep siê, dobra?
    AI_StopProcessInfos	(self);
};

