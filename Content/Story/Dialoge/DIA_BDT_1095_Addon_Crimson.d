//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Crimson_EXIT   (C_INFO)
{
	npc         = BDT_1095_Addon_Crimson;
	nr          = 999;
	condition   = DIA_Addon_Crimson_EXIT_Condition;
	information = DIA_Addon_Crimson_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Crimson_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Crimson_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//========================================
//-----------------> WhatAreYouDoing
//========================================

INSTANCE DIA_Addon_Crimson_WhatAreYouDoing (C_INFO)
{
   npc          = BDT_1095_Addon_Crimson;
   nr           = 1;
   condition    = DIA_Addon_Crimson_WhatAreYouDoing_Condition;
   information  = DIA_Addon_Crimson_WhatAreYouDoing_Info;
   permanent	= FALSE;
   description	= "Co robisz?";
};

FUNC INT DIA_Addon_Crimson_WhatAreYouDoing_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Addon_Crimson_WhatAreYouDoing_Info()
{
    AI_Output (other, self ,"DIA_Addon_Crimson_WhatAreYouDoing_15_01"); //Co robisz?
    AI_Output (self, other ,"DIA_Addon_Crimson_WhatAreYouDoing_03_02"); //Siekam cebulkê. Nie widzisz? Siedzê i siê nudzê.
    AI_Output (other, self ,"DIA_Addon_Crimson_WhatAreYouDoing_15_03"); //Chcesz jak¹œ robotê?
    AI_Output (self, other ,"DIA_Addon_Crimson_WhatAreYouDoing_03_04"); //A kto by nie chcia³? Za³atw mi jak¹œ.
    AI_Output (self, other ,"DIA_Addon_Crimson_WhatAreYouDoing_03_05"); //Najlepiej w kopalni. Umiem wytapiaæ z³oto.
    AI_Output (self, other ,"DIA_Addon_Crimson_WhatAreYouDoing_03_06"); //Kiedyœ by³em, to znaczy jestem kowalem, nic specjalnego.
    AI_Output (self, other ,"DIA_Addon_Crimson_WhatAreYouDoing_03_07"); //Umiem naprawiæ broñ czy narzêdzie. Jednak jak wspomnia³em lepszy jest ze mnie przetapiacz.
    AI_Output (self, other ,"DIA_Addon_Crimson_WhatAreYouDoing_03_08"); //Kiedyœ pracowa³em w pewnej kopalni. Niestety zamkniêto j¹ z powodu koñcz¹cych siê ¿y³ kruszcu.
    AI_Output (other, self ,"DIA_Addon_Crimson_WhatAreYouDoing_15_09"); //Coœ ci za³atwiê.
    AI_Output (self, other ,"DIA_Addon_Crimson_WhatAreYouDoing_03_10"); //Postaraj siê, proszê.
    MIS_Bored_Crimson = LOG_RUNNING;

    Log_CreateTopic            (TOPIC_Bored_Crimson, LOG_MISSION);
    Log_SetTopicStatus       (TOPIC_Bored_Crimson, LOG_RUNNING);
    B_LogEntry                     (TOPIC_Bored_Crimson,"Crimson jako zawodowy przetapiacz szuka roboty. Wspomnia³em mu, ¿e pomogê. Myœlê, ¿e nie bêdzie to trudne.");
};

//========================================
//-----------------> GotWorkForYou
//========================================

INSTANCE DIA_Addon_Crimson_GotWorkForYou (C_INFO)
{
   npc          = BDT_1095_Addon_Crimson;
   nr           = 1;
   condition    = DIA_Addon_Crimson_GotWorkForYou_Condition;
   information  = DIA_Addon_Crimson_GotWorkForYou_Info;
   permanent	= FALSE;
   description	= "Koniec siekania cebulki! Od teraz bêdziesz pracowa³ w kopalni.";
};

FUNC INT DIA_Addon_Crimson_GotWorkForYou_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Thorus_CrimsonNeedsWork))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Crimson_GotWorkForYou_Info()
{
    AI_Output (other, self ,"DIA_Addon_Crimson_GotWorkForYou_15_01"); //Koniec siekania cebulki! Od teraz bêdziesz pracowa³ w kopalni.
    AI_Output (self, other ,"DIA_Addon_Crimson_GotWorkForYou_03_02"); //Niesamowicie! Dziêki.
    AI_Output (other, self ,"DIA_Addon_Crimson_GotWorkForYou_15_03"); //A co z nagrod¹?
    AI_Output (self, other ,"DIA_Addon_Crimson_GotWorkForYou_03_04"); //Wpadnij do kopalni za jakiœ czas. Bêdzie coœ w sam raz dla ciebie.
    B_LogEntry                     (TOPIC_Bored_Crimson,"Od teraz Crimson bêdzie pracowa³ w kopalni. Zadanie zakoñczone. Powinienem odwiedziæ Crimsona za jakiœ czas. A mo¿e przy okazji dam mu cebulê, aby j¹ wreszcie posieka³?");
    Log_SetTopicStatus       (TOPIC_Bored_Crimson, LOG_SUCCESS);
    MIS_Bored_Crimson = LOG_SUCCESS;
    Npc_ExchangeRoutine (self, "Mine");
};

//========================================
//-----------------> SoYouAreAGoldsmith
//========================================

INSTANCE DIA_Addon_Crimson_SoYouAreAGoldsmith (C_INFO)
{
   npc          = BDT_1095_Addon_Crimson;
   nr           = 1;
   condition    = DIA_Addon_Crimson_SoYouAreAGoldsmith_Condition;
   information  = DIA_Addon_Crimson_SoYouAreAGoldsmith_Info;
   permanent	= FALSE;
   description	= "A wiêc znasz siê na z³ocie.";
};

FUNC INT DIA_Addon_Crimson_SoYouAreAGoldsmith_Condition()
{
    if ((MIS_Bored_Crimson == LOG_RUNNING)
	|| (MIS_Bored_Crimson == LOG_SUCCESS))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Crimson_SoYouAreAGoldsmith_Info()
{
    AI_Output (other, self ,"DIA_Addon_Crimson_SoYouAreAGoldsmith_15_01"); //A wiêc znasz siê na z³ocie.
    AI_Output (self, other ,"DIA_Addon_Crimson_SoYouAreAGoldsmith_03_02"); //Pewnie, ¿e tak. By³em jednym z lepszych wytapiaczy.
    AI_Output (self, other ,"DIA_Addon_Crimson_SoYouAreAGoldsmith_03_03"); //Ale, jak wspomnia³em, straci³em robotê. Pomyœla³em sobie – pop³ynê do Khorinis, tam na pewno jest dla mnie jakaœ praca.
    AI_Output (self, other ,"DIA_Addon_Crimson_SoYouAreAGoldsmith_03_04"); //I co? Wyl¹dowa³em na bruku, bo pró¿no szukaæ roboty.
    AI_Output (other, self ,"DIA_Addon_Crimson_SoYouAreAGoldsmith_15_05"); //A czemu jesteœ tutaj?
    AI_Output (self, other ,"DIA_Addon_Crimson_SoYouAreAGoldsmith_03_06"); //Po upadku bariery zrobi³o siê jeszcze gorzej. Wyszed³em z miasta, by pomyœleæ co dalej.
    AI_Output (self, other ,"DIA_Addon_Crimson_SoYouAreAGoldsmith_03_07"); //I wtedy spotka³em pewn¹ zgraje bandytów.
    AI_Output (other, self ,"DIA_Addon_Crimson_SoYouAreAGoldsmith_15_08"); //Nie zabili ciê?
    AI_Output (self, other ,"DIA_Addon_Crimson_SoYouAreAGoldsmith_03_09"); //Nie. Przywlekli mnie do jakiegoœ ciemnego typa w czerwonym pancerzu.
    AI_Output (self, other ,"DIA_Addon_Crimson_SoYouAreAGoldsmith_03_10"); //Fisk nosi podobny pancerz. To po jakiœ cieniach czy jakoœ tak.
    AI_Output (self, other ,"DIA_Addon_Crimson_SoYouAreAGoldsmith_03_11"); //Powiedzia³em im o mojej specjalnoœci i przyp³yn¹³em tutaj.
    AI_Output (self, other ,"DIA_Addon_Crimson_SoYouAreAGoldsmith_03_12"); //Chyba mia³em wed³ug nich harowaæ w kopalni, ale Fletcher siê za mn¹ wstawi³.
    AI_Output (other, self ,"DIA_Addon_Crimson_SoYouAreAGoldsmith_15_13"); //W jakim sensie?
    AI_Output (self, other ,"DIA_Addon_Crimson_SoYouAreAGoldsmith_03_14"); //Powiedzia³, ¿e wytapiacz bardziej siê przyda w kuŸni, ni¿ wal¹c kilofem w ¿y³y z³ota.
    AI_Output (self, other ,"DIA_Addon_Crimson_SoYouAreAGoldsmith_03_15"); //Ale nie by³o tak ³atwo. Huno by³ ju¿ kowalem i nie widzia³ mnie w kuŸni, Esteban nawet nie chcia³ ze mn¹ gadaæ, a Thorus by³ zbyt zajêty na myœlenie o mojej sprawie.
    AI_Output (self, other ,"DIA_Addon_Crimson_SoYouAreAGoldsmith_03_16"); //I tak siedzê tutaj bezczynnie.
};

//========================================
//-----------------> WhatsUp
//========================================

INSTANCE DIA_Addon_Crimson_WhatsUp (C_INFO)
{
   npc          = BDT_1095_Addon_Crimson;
   nr           = 2;
   condition    = DIA_Addon_Crimson_WhatsUp_Condition;
   information  = DIA_Addon_Crimson_WhatsUp_Info;
   permanent	= FALSE;
   description	= "Co s³ychaæ? Mo¿e chcesz cebulki?";
};

FUNC INT DIA_Addon_Crimson_WhatsUp_Condition()
{
    if ((MIS_Bored_Crimson == LOG_SUCCESS)
	&& (Npc_GetDistToWP (self, "ADW_MINE_HOEHLE_03") < 200))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Crimson_WhatsUp_Info()
{
    AI_Output (other, self ,"DIA_Addon_Crimson_WhatsUp_15_01"); //Co s³ychaæ? Mo¿e chcesz cebulki?
    AI_Output (self, other ,"DIA_Addon_Crimson_WhatsUp_03_02"); //Bardzo zabawne. Mam lepsze rzeczy do roboty.
    AI_Output (other, self ,"DIA_Addon_Crimson_WhatsUp_15_03"); //Co takiego?
    AI_Output (self, other ,"DIA_Addon_Crimson_WhatsUp_03_04"); //Kruk da³ mi matrycê do wybijania monet. S¹ naprawdê dobre.
    AI_Output (other, self ,"DIA_Addon_Crimson_WhatsUp_15_05"); //Od razu ci lepiej przy robocie.
    AI_Output (self, other ,"DIA_Addon_Crimson_WhatsUp_03_06"); //Bym zapomnia³.
    AI_Output (self, other ,"DIA_Addon_Crimson_WhatsUp_03_07"); //Zwykle za jeden samorodek dajê 10 sztuk z³ota.
    AI_Output (other, self ,"DIA_Addon_Crimson_WhatsUp_15_08"); //Cena jak dla przyjaciela.
    AI_Output (self, other ,"DIA_Addon_Crimson_WhatsUp_03_09"); //Wszyscy jesteœmy tutaj przyjació³mi.
    AI_Output (other, self ,"DIA_Addon_Crimson_WhatsUp_15_10"); //Trudno siê nie zgodziæ. (œmiech)
    AI_Output (self, other ,"DIA_Addon_Crimson_WhatsUp_03_11"); //Ale w zamian za zorganizowanie mi tej roboty dam ci 15 sztuk z³ota.
    AI_Output (other, self ,"DIA_Addon_Crimson_WhatsUp_15_12"); //Przyjmujê ofertê.
    AI_Output (self, other ,"DIA_Addon_Crimson_WhatsUp_03_13"); //Wiedzia³em, ¿e siê dogadamy. Ale cicho sza i nie mów ch³opakom.
    AI_Output (other, self ,"DIA_Addon_Crimson_WhatsUp_15_14"); //Jasne.
};

//========================================
//-----------------> AnyNews
//========================================

INSTANCE DIA_Addon_Crimson_AnyNews (C_INFO)
{
   npc          = BDT_1095_Addon_Crimson;
   nr           = 3;
   condition    = DIA_Addon_Crimson_AnyNews_Condition;
   information  = DIA_Addon_Crimson_AnyNews_Info;
   permanent	= TRUE;
   description	= "Co tam?";
};

FUNC INT DIA_Addon_Crimson_AnyNews_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Crimson_WhatsUp))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Crimson_AnyNews_Info()
{
    AI_Output (other, self ,"DIA_Addon_Crimson_AnyNews_15_01"); //Co tam?
    AI_Output (self, other ,"DIA_Addon_Crimson_AnyNews_03_02"); //Nie widzisz? Wybijam monety.
};

INSTANCE DIA_Addon_Crimson_Gold   (C_INFO)
{
	npc         = BDT_1095_Addon_Crimson;
	nr          = 99;
	condition   = DIA_Addon_Crimson_Gold_Condition;
	information = DIA_Addon_Crimson_Gold_Info;
	permanent   = TRUE;
	description = "(wymieñ samorodki z³ota.)";
};
FUNC INT DIA_Addon_Crimson_Gold_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Crimson_WhatsUp)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Crimson_Gold_Info()
{
	AI_Output (other, self, "DIA_Addon_Crimson_Gold_15_00");//Pohandlujmy.
	
	Info_ClearChoices (DIA_Addon_Crimson_Gold);
	Info_AddChoice (DIA_Addon_Crimson_Gold,DIALOG_BACK,DIA_Addon_Crimson_Gold_BACK);
	
	if (Npc_HasItems (other,ItMi_GoldNugget_Addon ) >= 1)
	{
		Info_AddChoice (DIA_Addon_Crimson_Gold,"Wymieñ wszystkie samorodki z³ota",DIA_Addon_Crimson_Gold_ALLE);
		Info_AddChoice (DIA_Addon_Crimson_Gold,"Wymieñ 1 samorodek z³ota",DIA_Addon_Crimson_Gold_1);
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Crimson_Gold_10_01");//Ale nie masz ¿adnych samorodków.
	};
};	
FUNC VOID DIA_Addon_Crimson_Gold_BACK()
{
	Info_ClearChoices (DIA_Addon_Crimson_Gold);
};
FUNC VOID DIA_Addon_Crimson_Gold_ALLE()
{
	var int CurrentNuggets;
	CurrentNuggets = Npc_HasItems (other, ItMi_GoldNugget_Addon);
	
	B_GiveInvItems (other, self, ItMi_GoldNugget_Addon, CurrentNuggets);
	B_GiveInvItems (self, other, ItMI_Gold, (CurrentNuggets * 15));
	
	Info_ClearChoices (DIA_Addon_Crimson_Gold);
	Info_AddChoice (DIA_Addon_Crimson_Gold,DIALOG_BACK,DIA_Addon_Crimson_Gold_BACK);
	
	if (Npc_HasItems (other,ItMi_GoldNugget_Addon ) >= 1)
	{
		Info_AddChoice (DIA_Addon_Crimson_Gold,"Wymieñ wszystkie samorodki z³ota",DIA_Addon_Crimson_Gold_ALLE);
		Info_AddChoice (DIA_Addon_Crimson_Gold,"Wymieñ 1 samorodek z³ota",DIA_Addon_Crimson_Gold_1);
	};
};
FUNC VOID DIA_Addon_Crimson_Gold_1()
{
	B_GiveInvItems (other, self, ItMi_GoldNugget_Addon, 1);
	B_GiveInvItems (self, other, ItMI_Gold, 15);
	
	Info_ClearChoices (DIA_Addon_Crimson_Gold);
	Info_AddChoice (DIA_Addon_Crimson_Gold,DIALOG_BACK,DIA_Addon_Crimson_Gold_BACK);
	
	if (Npc_HasItems (other,ItMi_GoldNugget_Addon ) >= 1)
	{
		Info_AddChoice (DIA_Addon_Crimson_Gold,"Wymieñ wszystkie samorodki z³ota",DIA_Addon_Crimson_Gold_ALLE);
		Info_AddChoice (DIA_Addon_Crimson_Gold,"Wymieñ 1 samorodek z³ota",DIA_Addon_Crimson_Gold_1);
	};
};
