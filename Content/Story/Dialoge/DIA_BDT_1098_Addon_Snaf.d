var int SnafAngered;

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Addon_Snaf_EXIT(C_INFO)
{
	npc             = BDT_1098_Addon_Snaf;
	nr              = 999;
	condition	= DIA_Addon_Snaf_EXIT_Condition;
	information	= DIA_Addon_Snaf_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Addon_Snaf_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Snaf_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> BroughtList
//========================================

INSTANCE DIA_Addon_Snaf_BroughtList (C_INFO)
{
   npc          = BDT_1098_Addon_Snaf;
   nr           = 1;
   condition    = DIA_Addon_Snaf_BroughtList_Condition;
   information  = DIA_Addon_Snaf_BroughtList_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Snaf_BroughtList_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Fisk_WannaEarnSomeMoney))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Snaf_BroughtList_Info()
{
    AI_Output (self, other ,"DIA_Addon_Snaf_BroughtList_03_01"); //Ju¿ s³ysza³em o tym. Daj mi tê listê.
    AI_Output (other, self ,"DIA_Addon_Snaf_BroughtList_15_02"); //Dobry z ciebie ober¿ysta.
    B_UseFakeScroll ();
    AI_Output (self, other ,"DIA_Addon_Snaf_BroughtList_03_03"); //Dlatego nim jestem.
    B_LogEntry                     (TOPIC_List_of_Goods,"Snaf, jak to on, wiedzia³ o moim spacerku z list¹. Bez oci¹gania siê wpisa³ swoje przyprawy.");
};

//========================================
//-----------------> PackageForYou
//========================================

INSTANCE DIA_Addon_Snaf_PackageForYou (C_INFO)
{
   npc          = BDT_1098_Addon_Snaf;
   nr           = 1;
   condition    = DIA_Addon_Snaf_PackageForYou_Condition;
   information  = DIA_Addon_Snaf_PackageForYou_Info;
   permanent	= FALSE;
   description	= "Patrz co mam.";
};

FUNC INT DIA_Addon_Snaf_PackageForYou_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Tom_GotThePacks))
    && (Npc_HasItems (other, ItMi_Packet_Snaf) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Snaf_PackageForYou_Info()
{
    AI_Output (other, self ,"DIA_Addon_Snaf_PackageForYou_15_01"); //Patrz co mam.
    AI_Output (self, other ,"DIA_Addon_Snaf_PackageForYou_03_02"); //Nareszcie! Teraz zrobiê nowe dania. Dziêki, kolego.
    B_GiveInvItems (other, self, ItMi_Packet_Snaf, 1);
    B_LogEntry                     (TOPIC_Packs_from_Pirates,"Snaf siê ucieszy³ z paczki.");
};

//========================================
//-----------------> ImHungry
//========================================

INSTANCE DIA_Addon_Snaf_ImHungry (C_INFO)
{
   npc          = BDT_1098_Addon_Snaf;
   nr           = 1;
   condition    = DIA_Addon_Snaf_ImHungry_Condition;
   information  = DIA_Addon_Snaf_ImHungry_Info;
   permanent	= FALSE;
   description	= "Jestem g³odny.";
};

FUNC INT DIA_Addon_Snaf_ImHungry_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Paul_GoToStaf))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Snaf_ImHungry_Info()
{
    AI_Output (other, self ,"DIA_Addon_Snaf_ImHungry_15_01"); //Jestem g³odny.
    AI_Output (self, other ,"DIA_Addon_Snaf_ImHungry_03_02"); //Domyœlam siê. Proszê oto gulasz. Smacznego.

    CreateInvItems (self, ItFo_Stew, 1);
    B_GiveInvItems (self, other, ItFo_Stew, 1);
    B_UseItem (other, ItFo_Stew);

    AI_Output (self, other ,"DIA_Addon_Snaf_ImHungry_03_03"); //Od razu lepiej wygl¹dasz. Marniejesz w oczach, coœ nie tak?
    AI_Output (other, self ,"DIA_Addon_Snaf_ImHungry_15_04"); //Nie s³ysza³eœ o œmierci Fletchera?
    AI_Output (self, other ,"DIA_Addon_Snaf_ImHungry_03_05"); //Pewnie, ¿e s³ysza³em.
    AI_Output (other, self ,"DIA_Addon_Snaf_ImHungry_15_06"); //To czemu... Aaa... co jest? (zaczyna siê ko³ysaæ)
    AI_Output (self, other ,"DIA_Addon_Snaf_ImHungry_03_07"); //Hej, co jest?
	Info_ClearChoices	(DIA_Addon_Snaf_ImHungry);
    Info_AddChoice		(DIA_Addon_Snaf_ImHungry, "S³a.. s³abo siê czujê.", DIA_Addon_Snaf_ImHungry_Sick);
};

FUNC VOID DIA_Addon_Snaf_ImHungry_Sick()
{
    AI_Output (other, self ,"DIA_Addon_Snaf_ImHungry_15_08"); //S³a.. s³abo siê czujê.
	Info_ClearChoices		(DIA_Addon_Snaf_ImHungry);
    AI_StopProcessInfos	(self);
    I_FadeScreenToBlack(1);
    Npc_SetRefuseTalk (self,5);

    MIS_Illness = LOG_RUNNING;
    Log_CreateTopic            (TOPIC_Illness, LOG_MISSION);
    Log_SetTopicStatus       (TOPIC_Illness, LOG_RUNNING);
    B_LogEntry                     (TOPIC_Illness,"Cholera, co siê sta³o! Snaf da³ mi gulasz po którym omal nie umar³em. Da³ mi truciznê? To jakiœ ¿art? Muszê z nim szczerze porozmawiaæ.");

    AI_Teleport (other, "BL_INN_UPSIDE_SLEEP_03");
    Npc_ExchangeRoutine (self, "Poisoning");
    AI_Teleport (self, "BL_INN_UP_SIDE_01");
};

//========================================
//-----------------> YouHaveAwaken
//========================================

INSTANCE DIA_Addon_Snaf_YouHaveAwaken (C_INFO)
{
   npc          = BDT_1098_Addon_Snaf;
   nr           = 2;
   condition    = DIA_Addon_Snaf_YouHaveAwaken_Condition;
   information  = DIA_Addon_Snaf_YouHaveAwaken_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Snaf_YouHaveAwaken_Condition()
{
    if (Npc_RefuseTalk(self) == false)
    && (Npc_KnowsInfo (other, DIA_Addon_Snaf_ImHungry))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Snaf_YouHaveAwaken_Info()
{
    I_FadeScreenFromBlack(1);
    AI_Output (self, other ,"DIA_Addon_Snaf_YouHaveAwaken_03_01"); //Wsta³eœ. A ja myœla³em, ¿e...
    AI_Output (other, self ,"DIA_Addon_Snaf_YouHaveAwaken_15_02"); //Ty œmieciu, jak mog³eœ to zrobiæ! I to mi?
    AI_Output (self, other ,"DIA_Addon_Snaf_YouHaveAwaken_03_03"); //Nie mia³em ¿adnego interesu, by ciê truæ. Przysiêgam.
    AI_Output (other, self ,"DIA_Addon_Snaf_YouHaveAwaken_15_04"); //Nie wierzê ci.
    AI_PlayAni (self, "T_SEARCH");
    AI_Output (self, other ,"DIA_Addon_Snaf_YouHaveAwaken_03_05"); //Uwierz mi.
    AI_Output (other, self ,"DIA_Addon_Snaf_YouHaveAwaken_15_06"); //Czemu siê rozgl¹dasz?
    AI_Output (self, other ,"DIA_Addon_Snaf_YouHaveAwaken_03_07"); //IdŸ do Miguela.
    AI_Output (other, self ,"DIA_Addon_Snaf_YouHaveAwaken_15_08"); //Hej, co siê...
    AI_Output (self, other ,"DIA_Addon_Snaf_YouHaveAwaken_03_09"); //IdŸ ju¿.
	Wld_InsertNpc (BDT_1091_Addon_Lucia ,"BL_INN_05_D");
	Npc_ExchangeRoutine (self, "Start");
    B_LogEntry                     (TOPIC_Illness,"Ta ca³a sprawa œmierdzi na odleg³oœæ. Mam mocne bóle na ca³ym ciele. Piekielnie boli mnie g³owa, a Snaf nic mi nie chce powiedzieæ. Odsy³a mnie teraz do Miguela. Mo¿e on mi w czymœ pomo¿e.");
};

//========================================
//-----------------> ItWasArvo
//========================================

INSTANCE DIA_Addon_Snaf_ItWasArvo (C_INFO)
{
   npc          = BDT_1098_Addon_Snaf;
   nr           = 1;
   condition    = DIA_Addon_Snaf_ItWasArvo_Condition;
   information  = DIA_Addon_Snaf_ItWasArvo_Info;
   permanent	= FALSE;
   description	= "To by³ Arvo. Wiem o wszystkim.";
};

FUNC INT DIA_Addon_Snaf_ItWasArvo_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Tom_WhatHappened))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Snaf_ItWasArvo_Info()
{
    AI_Output (other, self ,"DIA_Addon_Snaf_ItWasArvo_15_01"); //To by³ Arvo. Wiem o wszystkim.
    AI_Output (self, other ,"DIA_Addon_Snaf_ItWasArvo_03_02"); //(smutno) Tak, to by³ on.
    AI_Output (self, other ,"DIA_Addon_Snaf_ItWasArvo_03_03"); //Wybaczysz mi to? Proszê...

    Info_ClearChoices		(DIA_Addon_Snaf_ItWasArvo);
    Info_AddChoice		(DIA_Addon_Snaf_ItWasArvo, "Wybaczenie to jedno, a zapomnienie to co innego.", DIA_Addon_Snaf_ItWasArvo_Forgive);
    Info_AddChoice		(DIA_Addon_Snaf_ItWasArvo, "Wybaczenie to nie jest coœ, czego nale¿y oczekiwaæ. ", DIA_Addon_Snaf_ItWasArvo_DontForgive);
};

FUNC VOID DIA_Addon_Snaf_ItWasArvo_Forgive()
{
    AI_Output (other, self ,"DIA_Addon_Snaf_ItWasArvo_Forgive_15_01"); //Wybaczenie to jedno, a zapomnienie to co innego.
    AI_Output (self, other ,"DIA_Addon_Snaf_ItWasArvo_Forgive_03_02"); //Co to znaczy?
    AI_Output (other, self ,"DIA_Addon_Snaf_ItWasArvo_Forgive_15_03"); //By³eœ zastraszony i jestem ci sk³onny wybaczyæ, ale bêdê pamiêta³ o tej truciŸnie do koñca ¿ycia.
    AI_Output (self, other ,"DIA_Addon_Snaf_ItWasArvo_Forgive_03_04"); //Dziêkujê ci. Przynajmniej nie ma miêdzy nami konfliktu.
    B_LogEntry                     (TOPIC_Illness,"Wybaczy³em Snafowi jego czyn, ale nie zapomnê mu tego.");
    Info_ClearChoices		(DIA_Addon_Snaf_ItWasArvo);
};

FUNC VOID DIA_Addon_Snaf_ItWasArvo_DontForgive()
{
    AI_Output (other, self ,"DIA_Addon_Snaf_ItWasArvo_DontForgive_15_01"); //Wybaczenie to nie jest coœ, czego nale¿y oczekiwaæ. Na to trzeba sobie zapracowaæ. 
    AI_Output (self, other ,"DIA_Addon_Snaf_ItWasArvo_DontForgive_03_02"); //Pomog³em ci przecie¿.
    AI_Output (other, self ,"DIA_Addon_Snaf_ItWasArvo_DontForgive_15_03"); //Jak? Zanios³eœ mnie do ³ó¿ka, abym nie zgin¹³ na zimnej pod³odze?!
    AI_Output (self, other ,"DIA_Addon_Snaf_ItWasArvo_DontForgive_03_04"); //Dawa³em ci jedzenie i wodê. Lucia mo¿e potwierdziæ.
    AI_Output (other, self ,"DIA_Addon_Snaf_ItWasArvo_DontForgive_15_05"); //Jesteœ tym, kim chcesz byæ. Dla mnie jesteœ ju¿ nikim.
    AI_Output (self, other ,"DIA_Addon_Snaf_ItWasArvo_DontForgive_03_06"); //Nie chcê ciê znaæ.
    SnafAngered = TRUE;
    Info_ClearChoices		(DIA_Addon_Snaf_ItWasArvo);
    B_LogEntry                     (TOPIC_Illness,"Snaf nie zas³uguje na wybaczenie! Mo¿e zapomnieæ o naszej przyjaŸni.");
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> GoAway
//========================================

INSTANCE DIA_Addon_Snaf_GoAway (C_INFO)
{
   npc          = BDT_1098_Addon_Snaf;
   nr           = 1;
   condition    = DIA_Addon_Snaf_GoAway_Condition;
   information  = DIA_Addon_Snaf_GoAway_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Snaf_GoAway_Condition()
{
    if (SnafAngered == TRUE)
    && (Npc_IsInState (self,ZS_Talk))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Snaf_GoAway_Info()
{
    AI_Output (self, other ,"DIA_Addon_Snaf_GoAway_03_01"); //Zostaw mniê w spokoju.
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> AreYouHungry
//========================================

INSTANCE DIA_Addon_Snaf_AreYouHungry (C_INFO)
{
   npc          = BDT_1098_Addon_Snaf;
   nr           = 1;
   condition    = DIA_Addon_Snaf_AreYouHungry_Condition;
   information  = DIA_Addon_Snaf_AreYouHungry_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Snaf_AreYouHungry_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Addon_Snaf_AreYouHungry_Info()
{
    AI_Output (self, other ,"DIA_Addon_Snaf_AreYouHungry_03_01"); //G³odny?
    AI_Output (other, self ,"DIA_Addon_Snaf_AreYouHungry_15_02"); //Ty jesteœ pewnie Snaf.
    AI_Output (self, other ,"DIA_Addon_Snaf_AreYouHungry_03_03"); //Tak jest ch³opcze. Jestem Snaf, a ty?
    AI_Output (other, self ,"DIA_Addon_Snaf_AreYouHungry_15_04"); //Vinc.
    AI_Output (self, other ,"DIA_Addon_Snaf_AreYouHungry_03_05"); //Mi³o mi Vinc. A wiêc Fletcher pozwoli³ ci tu wejœæ.
    AI_Output (other, self ,"DIA_Addon_Snaf_AreYouHungry_15_06"); //Tak. Wykona³em dla niego parê zadañ.
    AI_Output (self, other ,"DIA_Addon_Snaf_AreYouHungry_03_07"); //I zabi³eœ parê b³otnych wê¿y.
    AI_Output (other, self ,"DIA_Addon_Snaf_AreYouHungry_15_08"); //Sk¹d to wiesz?
    AI_Output (self, other ,"DIA_Addon_Snaf_AreYouHungry_03_09"); //(œmiech) Taka moja rola.
};

//========================================
//-----------------> YoureFromTheColony
//========================================

INSTANCE DIA_Addon_Snaf_YoureFromTheColony (C_INFO)
{
   npc          = BDT_1098_Addon_Snaf;
   nr           = 2;
   condition    = DIA_Addon_Snaf_YoureFromTheColony_Condition;
   information  = DIA_Addon_Snaf_YoureFromTheColony_Info;
   permanent	= FALSE;
   description	= "Ty te¿ jesteœ z kolonii...";
};

FUNC INT DIA_Addon_Snaf_YoureFromTheColony_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Snaf_AreYouHungry))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Snaf_YoureFromTheColony_Info()
{
    AI_Output (other, self ,"DIA_Addon_Snaf_YoureFromTheColony_15_01"); //Ty te¿ jesteœ z kolonii...
    AI_Output (self, other ,"DIA_Addon_Snaf_YoureFromTheColony_03_02"); //Tak. Jestem ze Starego Obozu. (do siebie) Kto by pomyœla³, ¿e nazwa nadal pasuje...
    AI_Output (self, other ,"DIA_Addon_Snaf_YoureFromTheColony_03_03"); //By³y jeszcze dwa obozy: Nowy Obóz i Sekta.
    AI_Output (self, other ,"DIA_Addon_Snaf_YoureFromTheColony_03_04"); //Albo bractwo, obóz na bagnie. Akurat to miejsce mia³o parê nazw.
    AI_Output (self, other ,"DIA_Addon_Snaf_YoureFromTheColony_03_05"); //Hmm, chocia¿ jeœli chodzi o œcis³oœæ to gdzieœ w górach by³ obóz bandytów...
    AI_Output (other, self ,"DIA_Addon_Snaf_YoureFromTheColony_15_06"); //Bandytów?
    AI_Output (self, other ,"DIA_Addon_Snaf_YoureFromTheColony_03_07"); //Wiem, wiem. Teraz to brzmi idiotycznie.
    AI_Output (self, other ,"DIA_Addon_Snaf_YoureFromTheColony_03_08"); //No i by³ jeszcze teren orków. Ale ja tam nigdy nie chodzi³em.
    AI_Output (other, self ,"DIA_Addon_Snaf_YoureFromTheColony_15_09"); //Orkowie, s³ysza³em o nich. Toczyliœcie z nimi jakieœ bitwy, potyczki?
    AI_Output (self, other ,"DIA_Addon_Snaf_YoureFromTheColony_03_10"); //Ca³kiem wœcibski z ciebie goœæ. Kilka tygodni temu pozna³em takiego jak ty.
    AI_Output (self, other ,"DIA_Addon_Snaf_YoureFromTheColony_03_11"); //Przyniós³ dla mnie parê chrz¹szczy i grzybów, nastêpnie spyta³ o pewnego stra¿nika i tyle go widzia³em.
    AI_Output (self, other ,"DIA_Addon_Snaf_YoureFromTheColony_03_12"); //Nawet nie pamiêtam jego twarzy...
    AI_Output (other, self ,"DIA_Addon_Snaf_YoureFromTheColony_15_13"); //Hej, opowiedz mi o tych orkach.
    AI_Output (self, other ,"DIA_Addon_Snaf_YoureFromTheColony_03_14"); //Tak, tak. O ile pamiêæ mnie nie myli, jeszcze przed barier¹ wojsko toczy³o z nimi bitwy. Niezbyt wielkie, ale by³y.
    AI_Output (self, other ,"DIA_Addon_Snaf_YoureFromTheColony_03_15"); //Jednak po powstaniu bariery, sytuacja mocno siê uspokoi³a. Starcia z orkami by³ znikome.
    AI_Output (self, other ,"DIA_Addon_Snaf_YoureFromTheColony_03_16"); //Chocia¿ paru uda³o siê nam z³apaæ i zmusiæ do pracy w kopalni.
};

//========================================
//-----------------> MeatbugsAndMushrooms
//========================================

INSTANCE DIA_Addon_Snaf_MeatbugsAndMushrooms (C_INFO)
{
   npc          = BDT_1098_Addon_Snaf;
   nr           = 3;
   condition    = DIA_Addon_Snaf_MeatbugsAndMushrooms_Condition;
   information  = DIA_Addon_Snaf_MeatbugsAndMushrooms_Info;
   permanent	= FALSE;
   description	= "Mówi³eœ coœ o robakach i grzybach.";
};

FUNC INT DIA_Addon_Snaf_MeatbugsAndMushrooms_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Snaf_YoureFromTheColony))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Snaf_MeatbugsAndMushrooms_Info()
{
    AI_Output (other, self ,"DIA_Addon_Snaf_MeatbugsAndMushrooms_15_01"); //Mówi³eœ coœ o robakach i grzybach.
    AI_Output (self, other ,"DIA_Addon_Snaf_MeatbugsAndMushrooms_03_02"); //Mój w³asny przepis: potrawka z chrz¹szcza a la Snaf z ry¿em i grzybami.
    AI_Output (other, self ,"DIA_Addon_Snaf_MeatbugsAndMushrooms_15_03"); //Chrz¹szcze? Do jedzenia?
    AI_Output (self, other ,"DIA_Addon_Snaf_MeatbugsAndMushrooms_03_04"); //Nie by³byœ taki wybredny jakbyœ poby³ w kolonii.
};

//========================================
//-----------------> TellMeAboutTheColony
//========================================

INSTANCE DIA_Addon_Snaf_TellMeAboutTheColony (C_INFO)
{
   npc          = BDT_1098_Addon_Snaf;
   nr           = 4;
   condition    = DIA_Addon_Snaf_TellMeAboutTheColony_Condition;
   information  = DIA_Addon_Snaf_TellMeAboutTheColony_Info;
   permanent	= FALSE;
   description	= "Opowiesz mi o kolonii?";
};

FUNC INT DIA_Addon_Snaf_TellMeAboutTheColony_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Snaf_MeatbugsAndMushrooms))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Snaf_TellMeAboutTheColony_Info()
{
    AI_Output (other, self ,"DIA_Addon_Snaf_TellMeAboutTheColony_15_01"); //Opowiesz mi o kolonii?
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_03_02"); //A o czym dok³adnie?

    Info_ClearChoices		(DIA_Addon_Snaf_TellMeAboutTheColony);
    Info_AddChoice		(DIA_Addon_Snaf_TellMeAboutTheColony, "Powiedz mi coœ o obozach.", DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutCamps);
    Info_AddChoice		(DIA_Addon_Snaf_TellMeAboutTheColony, "Opowiedz mi coœ o ludziach z kolonii.", DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutPeople);
};

FUNC VOID DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutCamps()
{
    AI_Output (other, self ,"DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutCamps_15_01"); //Powiedz mi coœ o obozach.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutCamps_03_02"); //O którym konkretnie?

    Info_ClearChoices		(DIA_Addon_Snaf_TellMeAboutTheColony);
    Info_AddChoice		(DIA_Addon_Snaf_TellMeAboutTheColony, "O Starym Obozie.", DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutCamps_OldCamp);
    Info_AddChoice		(DIA_Addon_Snaf_TellMeAboutTheColony, "Opowiesz mi o tym Nowym Obozie?", DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutCamps_NewCamp);
    Info_AddChoice		(DIA_Addon_Snaf_TellMeAboutTheColony, "A ten ca³y obóz na bagnie?", DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutCamps_SwampCamp);
};

FUNC VOID DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutPeople()
{
    AI_Output (other, self ,"DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutPeople_15_01"); //Opowiedz mi coœ o ludziach z kolonii.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutPeople_03_02"); //Có¿, kolonia rz¹dzi³a siê swoimi prawami. Czêsto wilczymi.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutPeople_03_03"); //Czasami znajdowaliœmy jakieœ truch³a obok rzeki, obozu czy w lesie.
    AI_Output (other, self ,"DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutPeople_15_04"); //Zapewne to ktoœ ich mordowa³.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutPeople_03_05"); //Tak w³aœnie by³o. Kiedyœ s³ysza³em historiê, ¿e jeden kopacz zabi³ drugiego w zamian za niezardzewia³y kilof.
    AI_Output (other, self ,"DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutPeople_15_06"); //Za kilof? (zdziwienie)
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutPeople_03_07"); //Powody morderstw by³y ró¿ne. Na przyk³ad jakiœ cieñ chcia³ zabiæ pewnego maga.
    AI_Output (other, self ,"DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutPeople_15_08"); //Maga?
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutPeople_03_09"); //Gdy ten mag spa³, cieñ zakrad³ siê do niego.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutPeople_03_10"); //Rano znaleŸliœmy niedosz³ego mordercê.
    AI_Output (other, self ,"DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutPeople_15_11"); //Co mu zrobi³ ten mag?
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutPeople_03_12"); //No có¿. Cieñ by³ dos³ownie wszêdzie – w ca³ym zewnêtrznym pierœcieniu.
    AI_Output (other, self ,"DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutPeople_15_13"); //Dlaczego chcia³ go zabiæ?
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutPeople_03_14"); //Nikt tego nie wie. Mo¿e zg³upia³? Albo ktoœ mu zap³aci³?
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutPeople_03_15"); //Nie rozmyœlaj nad tym teraz. To ju¿ przesz³oœæ.
    AI_Output (other, self ,"DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutPeople_15_16"); //Wiêkszoœæ ludzi by³a niebezpieczna z tego co s³yszê.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutPeople_03_17"); //Jak dla mnie s³owo "groŸni" nawet tego nie opisz¹.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutPeople_03_18"); //By³eœ silniejszy to mia³eœ lepiej. By³eœ s³abszy – mia³eœ marne szanse.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutPeople_03_19"); //Czasami trzeba by³o kombinowaæ, jeœli wiesz co mam na myœli.
    AI_Output (other, self ,"DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutPeople_15_20"); //Wiem dobrze. W Khorinis by³o czasami podobnie.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutPeople_03_21"); //Czasy kolonii jednak siê skoñczy³y.
};

FUNC VOID DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutCamps_OldCamp()
{
    AI_Output (other, self ,"DIA_Addon_Snaf_TellMeAboutTheColony_OldCamp_15_01"); //O Starym Obozie.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_OldCamp_03_02"); //Jasne, mój stary dom.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_OldCamp_03_03"); //Zosta³ tak nazwany, bo by³ pierwszym obozem w dolinie. Wokó³ zamku powsta³o wiele drewnianych chatek oraz palisada. To by³ zewnêtrzny pierœcieñ.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_OldCamp_03_04"); //By³ to najpotê¿niejszy obóz w kolonii. Handlowaliœmy z królem. My dawaliœmy mu worki z rud¹, a on nam ¿ywnoœæ, broñ, wodê. Po prostu wszystko czego chcieliœmy.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_OldCamp_03_05"); //Mieliœmy tam arenê, targowisko...
    AI_Output (other, self ,"DIA_Addon_Snaf_TellMeAboutTheColony_OldCamp_15_06"); //A co by³o w zamku?
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_OldCamp_03_07"); //Nie by³em tam. To znaczy raz uda³o mi siê zwiedziæ plac zamkowy.
    AI_Output (other, self ,"DIA_Addon_Snaf_TellMeAboutTheColony_OldCamp_15_08"); //I co tam siê znajdowa³o?
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_OldCamp_03_09"); //By³a kuŸnia, kaplica magów, sale stra¿ników i rzecz jasna siedziba magnatów.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_OldCamp_03_10"); //Obozem rz¹dzi³ Gomez, a jego praw¹ rêk¹ by³ Kruk. Gomez mia³ wszystko co chcia³.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_OldCamp_03_11"); //Kobiety, alkohol, najlepsze jedzenie, w³asn¹ œwitê i stra¿.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_OldCamp_03_12"); //W obozie byli kopacze, cienie, stra¿nicy, magowie ognia oraz magnaci. To by³a ca³a hierarchia obozu.
    AI_Output (other, self ,"DIA_Addon_Snaf_TellMeAboutTheColony_OldCamp_15_13"); //Co jeszcze ciekawego mi opowiesz?
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_OldCamp_03_14"); //Parê lat temu zawali³a siê wie¿a w obozie.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_OldCamp_03_15"); //Ponoæ jacyœ rabusie ukradli worek rudy i porwali kobietê Gomeza.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_OldCamp_03_16"); //Wpadli w pu³apkê wchodz¹c do wie¿y, ale mimo to zabarykadowali drzwi.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_OldCamp_03_17"); //Wtedy jeden z magów rzuci³ jakiœ czar i wie¿a runê³a.
    AI_Output (other, self ,"DIA_Addon_Snaf_TellMeAboutTheColony_OldCamp_15_18"); //Ciekawa historia.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_OldCamp_03_19"); //A wiesz jaki by³ huk? Paru kopaczy przyp³aci³o za to ¿yciem.
    AI_Output (other, self ,"DIA_Addon_Snaf_TellMeAboutTheColony_OldCamp_15_20"); //A co z rabusiami?
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_OldCamp_03_21"); //Nie odnaleziono ich, ale iloœæ plotek i domys³ów na ich temat by³a ogromna.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_OldCamp_03_22"); //Ale ma³o kto z tych, co tutaj s¹, pamiêta to zdarzenie.
};

FUNC VOID DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutCamps_NewCamp()
{
    AI_Output (other, self ,"DIA_Addon_Snaf_TellMeAboutTheColony_NewCamp_15_01"); //Opowiesz mi o tym Nowym Obozie?
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_NewCamp_03_02"); //Teraz to ju¿ nie Nowy Obóz, he he.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_NewCamp_03_03"); //Powsta³ bardzo szybko, choæ nie wiem dok³adnie po jakim czasie. W kolonii nie by³em od samego pocz¹tku.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_NewCamp_03_04"); //By³a tam banda ludzi, którzy uznali, ¿e uciekn¹ z kolonii.
    AI_Output (other, self ,"DIA_Addon_Snaf_TellMeAboutTheColony_NewCamp_15_05"); //W jaki sposób?
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_NewCamp_03_06"); //Ich magowie mieli zdetonowaæ kopiec rudy czy coœ.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_NewCamp_03_07"); //Magów chroni³ by³y genera³ króla – Lee. On dowodzi³ grup¹ najemników, która ich chroni³a.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_NewCamp_03_08"); //By³y jeszcze szkodniki. Paru z nich mia³o ochronê od magów, bo byli kurierami. Ale zdecydowana wiêkszoœæ robi³a co im siê podoba.
    AI_Output (other, self ,"DIA_Addon_Snaf_TellMeAboutTheColony_NewCamp_15_09"); //Na przyk³ad co?
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_NewCamp_03_10"); //Krad³a, mordowa³a, napada³a na wszystko.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_NewCamp_03_11"); //Stary i Nowy Obóz nigdy siê nie lubi³y. Ale do wiêkszego starcia nigdy nie dosz³o.
    AI_Output (other, self ,"DIA_Addon_Snaf_TellMeAboutTheColony_NewCamp_15_12"); //Czemu?
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_NewCamp_03_13"); //Gomez co prawda mia³ du¿o ludzi, ale Lee mia³ talent taktyczny. Sytuacja by³a patowa.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_NewCamp_03_14"); //Ale wszystko ma swój koniec.
    AI_Output (other, self ,"DIA_Addon_Snaf_TellMeAboutTheColony_NewCamp_15_15"); //Co siê sta³o?
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_NewCamp_03_16"); //Kilka tygodni temu runê³a nasza kopalnia. Kilku kopaczy przybieg³o ze strasznymi wieœciami.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_NewCamp_03_17"); //Woda wdar³a siê do kopalni i pêk³y podpory.
    AI_Output (other, self ,"DIA_Addon_Snaf_TellMeAboutTheColony_NewCamp_15_18"); //Katastrofa.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_NewCamp_03_19"); //Ma³o powiedziane. No i wtedy w³aœnie Gomez kaza³ zaatakowaæ kopalnie Nowego Obozu.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_NewCamp_15_20"); //Wtedy kolonia sta³a siê jeszcze bardziej niebezpieczna.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_NewCamp_03_21"); //Ale to stare czasy.
};

FUNC VOID DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutCamps_SwampCamp()
{
    AI_Output (other, self ,"DIA_Addon_Snaf_TellMeAboutTheColony_SwampCamp_15_01"); //A ten ca³y obóz na bagnie?
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_SwampCamp_03_02"); //Powsta³ jakieœ 5 lat temu. Jeden z kopaczy mia³ jak¹œ wizjê o jakimœ nowym bóstwie.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_SwampCamp_03_03"); //Przekona³ on kilkanaœcie osób i odeszli z obozu. Osiedlili siê na bagnach.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_SwampCamp_03_04"); //By³em w ich obozie kilka razy. Mieli wielki kamienny plac i domki na drzewach. Wiêkszoœæ ich architektury opiera³a siê na drewnie.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_SwampCamp_03_05"); //Ka¿dy z nich pali³ bagienne ziele. I to ca³kiem sporo.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_SwampCamp_03_06"); //Przez ca³y okres ich istnienia rz¹dzi³ nimi Y'Berion. By³ on tym kopaczem, któremu przyœni³o siê to bóstwo – Œni¹cy.
    AI_Output (other, self ,"DIA_Addon_Snaf_TellMeAboutTheColony_SwampCamp_15_07"); //Wiêc to by³a sekta?
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_SwampCamp_03_08"); //Jak dla mnie tak, bo w ostatnim miesi¹cu przysz³y wieœci, ¿e czcili demona.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_SwampCamp_03_09"); //Ale po co ja ci to mówiê? Te obozy to przesz³oœæ.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_SwampCamp_03_10"); //Fortuno mo¿e ci coœ opowie o sekcie. On by³ w ich obozie.
    AI_Output (other, self ,"DIA_Addon_Snaf_TellMeAboutTheColony_SwampCamp_15_11"); //Nie omieszkam siê go o to zapytaæ.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_SwampCamp_03_12"); //Ale jeszcze o tej sekcie. Byli tam guru, nowicjusze oraz stra¿ œwi¹tynna.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_SwampCamp_03_13"); //Stra¿nikami rz¹dzi³ Angar. Em, to znaczy Cor Angar.
    AI_Output (other, self ,"DIA_Addon_Snaf_TellMeAboutTheColony_SwampCamp_15_14"); //Cor?
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_SwampCamp_03_15"); //Mieli dziwne tytu³y. Spytaj siê o to Fortuno.
};

