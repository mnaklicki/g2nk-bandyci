//--------------------------------------------------------------------
//	Info EXIT 
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Lucia_EXIT   (C_INFO)
{
	npc         = BDT_1091_Addon_Lucia;
	nr          = 999;
	condition   = DIA_Addon_Lucia_EXIT_Condition;
	information = DIA_Addon_Lucia_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Lucia_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Lucia_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//========================================
//-----------------> HowAreYou
//========================================

INSTANCE DIA_Addon_Lucia_HowAreYou (C_INFO)
{
   npc          = BDT_1091_Addon_Lucia;
   nr           = 1;
   condition    = DIA_Addon_Lucia_HowAreYou_Condition;
   information  = DIA_Addon_Lucia_HowAreYou_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Lucia_HowAreYou_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Addon_Lucia_HowAreYou_Info()
{
    AI_Output (self, other ,"DIA_Addon_Lucia_HowAreYou_15_01"); //I jak siê czujesz?
    AI_Output (other, self ,"DIA_Addon_Lucia_HowAreYou_03_02"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Addon_Lucia_HowAreYou_15_03"); //Nie udawaj, ¿e mnie nie znasz. Jestem Lucia.
    AI_Output (other, self ,"DIA_Addon_Lucia_HowAreYou_03_04"); //Nie udajê.
    AI_Output (self, other ,"DIA_Addon_Lucia_HowAreYou_15_05"); //No dobrze. Zreszt¹ nigdy nie s¹dzi³am, ¿e ktoœ z Khorinis tutaj bêdzie.
    AI_Output (self, other ,"DIA_Addon_Lucia_HowAreYou_03_06"); //A ju¿ w szczególnoœci taki ch³opak jak ty...
    AI_Output (other, self ,"DIA_Addon_Lucia_HowAreYou_15_07"); //Nie jestem w nastroju do takiej rozmowy.
    AI_Output (self, other ,"DIA_Addon_Lucia_HowAreYou_03_08"); //(westchnienie) Szkoda... Ale gdybyœ chcia³ porozmawiaæ to wiesz gdzie mnie znaleŸæ.
};

//========================================
//-----------------> TomSaid
//========================================

INSTANCE DIA_Addon_Lucia_TomSaid (C_INFO)
{
   npc          = BDT_1091_Addon_Lucia;
   nr           = 2;
   condition    = DIA_Addon_Lucia_TomSaid_Condition;
   information  = DIA_Addon_Lucia_TomSaid_Info;
   permanent	= FALSE;
   description	= "Tom wspomnia³, ¿e mi pomog³aœ gdy by³em zatruty.";
};

FUNC INT DIA_Addon_Lucia_TomSaid_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Tom_WhatHappened))
    && (Npc_KnowsInfo (other, DIA_Addon_Lucia_HowAreYou))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Lucia_TomSaid_Info()
{
    AI_Output (other, self ,"DIA_Addon_Lucia_TomSaid_15_01"); //Tom wspomnia³, ¿e mi pomog³aœ gdy by³em zatruty.
    AI_Output (self, other ,"DIA_Addon_Lucia_TomSaid_03_02"); //Gdy tu przyby³am, zobaczy³am jak zanosili ciê na górê. By³eœ strasznie blady.
    AI_Output (other, self ,"DIA_Addon_Lucia_TomSaid_15_03"); //Co by³o dalej?
    AI_Output (self, other ,"DIA_Addon_Lucia_TomSaid_03_04"); //(œmiech) A co byœ chcia³?
    AI_Output (self, other ,"DIA_Addon_Lucia_TomSaid_03_05"); //Mia³eœ gor¹czkê i wymiotowa³eœ. Tom przyrz¹dza³ jakieœ lekarstwo dla ciebie, a ja dba³am o twój stan.
    AI_Output (other, self ,"DIA_Addon_Lucia_TomSaid_15_06"); //Dziêkujê.
    AI_Output (self, other ,"DIA_Addon_Lucia_TomSaid_03_07"); //Nie ma za co. (puszcza oko)
};

//========================================
//-----------------> HowDidYouGetHere
//========================================

INSTANCE DIA_Addon_Lucia_HowDidYouGetHere (C_INFO)
{
   npc          = BDT_1091_Addon_Lucia;
   nr           = 3;
   condition    = DIA_Addon_Lucia_HowDidYouGetHere_Condition;
   information  = DIA_Addon_Lucia_HowDidYouGetHere_Info;
   permanent	= FALSE;
   description	= "Jak siê tutaj zjawi³aœ?";
};

FUNC INT DIA_Addon_Lucia_HowDidYouGetHere_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Lucia_HowAreYou))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Lucia_HowDidYouGetHere_Info()
{
    AI_Output (other, self ,"DIA_Addon_Lucia_HowDidYouGetHere_15_01"); //Jak siê tutaj zjawi³aœ?
    AI_Output (self, other ,"DIA_Addon_Lucia_HowDidYouGetHere_03_02"); //Uciek³am razem z moim by³ym ch³opakiem. Mieliœmy doœæ miasta.
    AI_Output (other, self ,"DIA_Addon_Lucia_HowDidYouGetHere_15_03"); //By³ym? Nie ¿yje?
    AI_Output (self, other ,"DIA_Addon_Lucia_HowDidYouGetHere_03_04"); //Gdyby wtedy pad³ martwy to op³akiwa³abym go.
    AI_Output (self, other ,"DIA_Addon_Lucia_HowDidYouGetHere_03_05"); //Ale to by³ tchórz jakich ma³o!
    AI_Output (self, other ,"DIA_Addon_Lucia_HowDidYouGetHere_03_06"); //Napadli na nas bandyci, a on nic nie zrobi³.
    AI_Output (self, other ,"DIA_Addon_Lucia_HowDidYouGetHere_03_07"); //Poza tym mia³am doœæ tego co zaczn¹ robiæ stra¿nicy i paladyni!
    AI_Output (self, other ,"DIA_Addon_Lucia_HowDidYouGetHere_03_08"); //Du¿o s³ysza³am od klientów co siê dzieje na kontynencie. Wojna z orkami trwa zbyt d³ugo.
    AI_Output (other, self ,"DIA_Addon_Lucia_HowDidYouGetHere_15_09"); //A co s¹dzisz o tym obozie?
    AI_Output (self, other ,"DIA_Addon_Lucia_HowDidYouGetHere_03_10"); //Podoba mi siê tutaj, ch³opaki nieŸle siê tu urz¹dzili. Zreszt¹ spójrz na te dolinê.
    AI_Output (self, other ,"DIA_Addon_Lucia_HowDidYouGetHere_03_11"); //Bez statku i znajomoœci tych klifów nie dasz rady tu przyp³yn¹æ.
    AI_Output (self, other ,"DIA_Addon_Lucia_HowDidYouGetHere_03_12"); //Wiêc ani paladyni ani orkowie tutaj nie przyp³yn¹.
    AI_Output (other, self ,"DIA_Addon_Lucia_HowDidYouGetHere_15_13"); //Doskonale ciê rozumiem.
    AI_Output (self, other ,"DIA_Addon_Lucia_HowDidYouGetHere_03_14"); //Jeœli byœ czegoœ ode mnie chcia³ wiesz gdzie mnie jestem.
    AI_Output (other, self ,"DIA_Addon_Lucia_HowDidYouGetHere_15_15"); //Nie zapomnê.
    AI_Output (self, other ,"DIA_Addon_Lucia_HowDidYouGetHere_03_16"); //No ja myœlê...
};

