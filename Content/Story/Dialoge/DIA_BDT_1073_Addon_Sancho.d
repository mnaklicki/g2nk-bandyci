//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Sancho_EXIT(C_INFO)
{
	npc             = BDT_1073_Addon_Sancho;
	nr              = 999;
	condition	= DIA_Sancho_EXIT_Condition;
	information	= DIA_Sancho_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Sancho_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Sancho_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Plan
//========================================

INSTANCE DIA_Addon_Sancho_Plan (C_INFO)
{
   npc          = BDT_1073_Addon_Sancho;
   nr           = 1;
   condition    = DIA_Addon_Sancho_Plan_Condition;
   information  = DIA_Addon_Sancho_Plan_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Sancho_Plan_Condition()
{
    if (Npc_IsInState (self,ZS_Talk))
    && (Npc_KnowsInfo (other, DIA_Addon_Carlos_ExplainThePlan))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Sancho_Plan_Info()
{
    AI_Output (other, self ,"DIA_Addon_Sancho_Plan_15_01"); //S³uchaj. Ty i Senyan bêdziecie os³aniaæ nas, a póŸniej pilnowaæ wiêŸniów. Jakieœ pytania?
    AI_Output (self, other ,"DIA_Addon_Sancho_Plan_03_02"); //Nie, ¿adnych. Piwka?

    Info_ClearChoices		(DIA_Addon_Sancho_Plan);
    Info_AddChoice		(DIA_Addon_Sancho_Plan, "Nie, dziêki.", DIA_Addon_Sancho_Plan_NoThanks);
    Info_AddChoice		(DIA_Addon_Sancho_Plan, "Z chêci¹.", DIA_Addon_Sancho_Plan_Sure);
};

FUNC VOID DIA_Addon_Sancho_Plan_NoThanks()
{
    AI_Output (other, self ,"DIA_Addon_Sancho_Plan_NoThanks_15_01"); //Nie, dziêki.
    AI_Output (self, other ,"DIA_Addon_Sancho_Plan_NoThanks_03_02"); //A ja bardzo chêtnie.
    CreateInvItems (self, ItFo_Beer, 1);
    B_UseItem (self, ItFo_Beer);
    AI_Output (other, self ,"DIA_Addon_Sancho_Plan_15_03"); //Opowiem ci co masz robiæ.
    AI_Output (self, other ,"DIA_Addon_Sancho_Plan_03_04"); //Mów.
    AI_Output (other, self ,"DIA_Addon_Sancho_Plan_15_05"); //Ty i Senyan os³aniacie nas, a po udanej transakcji pilnujecie niewolników. Pytania?
    AI_Output (self, other ,"DIA_Addon_Sancho_Plan_03_06"); //Nie.
    AI_Output (other, self ,"DIA_Addon_Sancho_Plan_15_07"); //Œwietnie.
    Info_ClearChoices		(DIA_Addon_Sancho_Plan);
};

FUNC VOID DIA_Addon_Sancho_Plan_Sure()
{
    AI_Output (other, self ,"DIA_Addon_Sancho_Plan_Sure_15_01"); //Z chêci¹.
    CreateInvItems (self, ItFo_Beer, 1);
    CreateInvItems (other, ItFo_Beer, 1);
    B_UseItem (self, ItFo_Beer);
    B_UseItem (other, ItFo_Beer);
    AI_Output (other, self ,"DIA_Addon_Sancho_Plan_15_03"); //Opowiem ci co masz robiæ.
    AI_Output (self, other ,"DIA_Addon_Sancho_Plan_03_04"); //Mów.
    AI_Output (other, self ,"DIA_Addon_Sancho_Plan_15_05"); //Ty i Senyan os³aniacie nas, a po udanej transakcji pilnujecie niewolników. Pytania?
    AI_Output (self, other ,"DIA_Addon_Sancho_Plan_03_06"); //Nie.
    AI_Output (other, self ,"DIA_Addon_Sancho_Plan_15_07"); //Œwietnie.
    Info_ClearChoices		(DIA_Addon_Sancho_Plan);
};

//========================================
//-----------------> WheresArvo
//========================================

INSTANCE DIA_Addon_Sancho_WheresArvo (C_INFO)
{
   npc          = BDT_1073_Addon_Sancho;
   nr           = 1;
   condition    = DIA_Addon_Sancho_WheresArvo_Condition;
   information  = DIA_Addon_Sancho_WheresArvo_Info;
   permanent	= FALSE;
   description	= "Widzia³eœ Arvo?";
};

FUNC INT DIA_Addon_Sancho_WheresArvo_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Kyrrus_WheresArvo))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Sancho_WheresArvo_Info()
{
    AI_Output (other, self ,"DIA_Addon_Sancho_WheresArvo_15_01"); //Widzia³eœ Arvo?
    AI_Output (self, other ,"DIA_Addon_Sancho_WheresArvo_03_02"); //Nie. Odk¹d tu stojê ani razu go nie widzia³em.
};

//========================================
//-----------------> WhoAreYou
//========================================

INSTANCE DIA_Addon_Sancho_WhoAreYou (C_INFO)
{
   npc          = BDT_1073_Addon_Sancho;
   nr           = 1;
   condition    = DIA_Addon_Sancho_WhoAreYou_Condition;
   information  = DIA_Addon_Sancho_WhoAreYou_Info;
   permanent	= FALSE;
   description	= "Witaj, kim jesteœ?";
};

FUNC INT DIA_Addon_Sancho_WhoAreYou_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Addon_Sancho_WhoAreYou_Info()
{
    AI_Output (other, self ,"DIA_Addon_Sancho_WhoAreYou_15_01"); //Witaj, kim jesteœ?
    AI_Output (self, other ,"DIA_Addon_Sancho_WhoAreYou_03_02"); //Sancho, a ty?
    AI_Output (other, self ,"DIA_Addon_Sancho_WhoAreYou_15_03"); //Jestem Vinc.
    AI_Output (self, other ,"DIA_Addon_Sancho_WhoAreYou_03_04"); //Mi³o poznaæ. Aktualnie pilnujê rzeczy z tego magazynu, ale lepsze to ni¿ pi³owanie desek lub walenie m³otkiem.
    AI_Output (self, other ,"DIA_Addon_Sancho_WhoAreYou_03_05"); //Chcê popracowaæ tutaj i dostaæ siê do kopalni z³ota.
    AI_Output (other, self ,"DIA_Addon_Sancho_WhoAreYou_15_06"); //Emm, z³ota?
    AI_Output (self, other ,"DIA_Addon_Sancho_WhoAreYou_03_07"); //Nie próbuj siê ze mn¹ droczyæ. Te¿ chcesz tam iœæ i zdobyæ parê samorodków.
    AI_Output (self, other ,"DIA_Addon_Sancho_WhoAreYou_03_08"); //Ale dopóki nie wejdziemy wy¿ej, to o z³ocie mo¿emy co najwy¿ej pomarzyæ.
};

//========================================
//-----------------> WhyAreYouHere
//========================================

INSTANCE DIA_Addon_Sancho_WhyAreYouHere (C_INFO)
{
   npc          = BDT_1073_Addon_Sancho;
   nr           = 2;
   condition    = DIA_Addon_Sancho_WhyAreYouHere_Condition;
   information  = DIA_Addon_Sancho_WhyAreYouHere_Info;
   permanent	= FALSE;
   description	= "Za co ciê skazano?";
};

FUNC INT DIA_Addon_Sancho_WhyAreYouHere_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Sancho_WhoAreYou))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Sancho_WhyAreYouHere_Info()
{
    AI_Output (other, self ,"DIA_Addon_Sancho_WhyAreYouHere_15_01"); //Za co ciê skazano?
    AI_Output (self, other ,"DIA_Addon_Sancho_WhyAreYouHere_03_02"); //A co tu du¿o mówiæ, pracowa³em na statku. P³ywa³em od kontynentu do Khorinis i z powrotem.
    AI_Output (self, other ,"DIA_Addon_Sancho_WhyAreYouHere_03_03"); //A¿ pewnego dnia po paru piwach kolega namówi³ mnie do pewnego oszustwa.
    AI_Output (other, self ,"DIA_Addon_Sancho_WhyAreYouHere_15_04"); //Jakiego oszustwa?
    AI_Output (self, other ,"DIA_Addon_Sancho_WhyAreYouHere_03_05"); //Chcieliœmy ukryæ pewien worek rudy przed ¿o³nierzami, a póŸniej mieliœmy to sprzedaæ z zyskiem.
    AI_Output (self, other ,"DIA_Addon_Sancho_WhyAreYouHere_03_06"); //Ale nie uda³o siê nam. Oto ca³a moja historia.
};

//========================================
//-----------------> HowAreYou
//========================================

INSTANCE DIA_Addon_Sancho_HowAreYou (C_INFO)
{
   npc          = BDT_1073_Addon_Sancho;
   nr           = 3;
   condition    = DIA_Addon_Sancho_HowAreYou_Condition;
   information  = DIA_Addon_Sancho_HowAreYou_Info;
   permanent	= FALSE;
   description	= "Co tam?";
};

FUNC INT DIA_Addon_Sancho_HowAreYou_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Sancho_WhoAreYou))
    && (KAPITEL != 3)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Sancho_HowAreYou_Info()
{
    AI_Output (other, self ,"DIA_Addon_Sancho_HowAreYou_15_01"); //Co tam?
    AI_Output (self, other ,"DIA_Addon_Sancho_HowAreYou_03_02"); //Jestem prawie pewien, ¿e ju¿ nied³ugo Fletcher powie: Sancho zas³ugujesz na wejœcie do obozu.
    AI_Output (other, self ,"DIA_Addon_Sancho_HowAreYou_15_03"); //Powodzenia!
};

//========================================
//-----------------> FletcherDead
//========================================

INSTANCE DIA_Addon_Sancho_FletcherDead (C_INFO)
{
   npc          = BDT_1073_Addon_Sancho;
   nr           = 4;
   condition    = DIA_Addon_Sancho_FletcherDead_Condition;
   information  = DIA_Addon_Sancho_FletcherDead_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Sancho_FletcherDead_Condition()
{
    if (KAPITEL == 3)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Sancho_FletcherDead_Info()
{
    AI_Output (self, other ,"DIA_Addon_Sancho_FletcherDead_03_01"); //Niech to diabli! Franko zabi³ Fletchera. Dodatkowo powiedzia³, ¿e nic nie robi³em. I od teraz mam pilnowaæ, aby nikt ''niepowo³any'' nie wszed³ do obozu.
    AI_Output (self, other ,"DIA_Addon_Sancho_FletcherDead_03_02"); //Rozumiesz? Mam wykrywaæ szpiegów!
    AI_Output (self, other ,"DIA_Addon_Sancho_FletcherDead_03_03"); //Jakby na tym koñcu œwiata ktoœ wiedzia³ o naszej obecnoœci tutaj.
    AI_Output (other, self ,"DIA_Addon_Sancho_FletcherDead_15_04"); //Szkoda Fletchera.
    AI_Output (self, other ,"DIA_Addon_Sancho_FletcherDead_03_05"); //By³ dobrym szefem… Cholera, lepiej idŸ ju¿. Lepiej ¿eby Franko nie widzia³, ¿e nie wype³niam jego ''zadania''.
};

//========================================
//-----------------> WhatIsIt
//========================================

INSTANCE DIA_Addon_Sancho_WhatIsIt (C_INFO)
{
   npc          = BDT_1073_Addon_Sancho;
   nr           = 5;
   condition    = DIA_Addon_Sancho_WhatIsIt_Condition;
   information  = DIA_Addon_Sancho_WhatIsIt_Info;
   permanent	= TRUE;
   description	= "Co s³ychaæ?";
};

FUNC INT DIA_Addon_Sancho_WhatIsIt_Condition()
{
    if (KAPITEL == 3)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Sancho_WhatIsIt_Info()
{
    AI_Output (other, self ,"DIA_Addon_Sancho_WhatIsIt_15_01"); //Co s³ychaæ?
    AI_Output (self, other ,"DIA_Addon_Sancho_WhatIsIt_03_02"); //Sam widzisz. Nudy jak cholera.
};

