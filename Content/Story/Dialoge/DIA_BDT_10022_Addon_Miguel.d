//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Addon_Miguel_EXIT(C_INFO)
{
	npc             = BDT_10022_Addon_Miguel;
	nr              = 999;
	condition	= DIA_Addon_Miguel_EXIT_Condition;
	information	= DIA_Addon_Miguel_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Addon_Miguel_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Miguel_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> LookingForMiguel
//========================================

INSTANCE DIA_Addon_Miguel_LookingForMiguel (C_INFO)
{
   npc          = BDT_10022_Addon_Miguel;
   nr           = 1;
   condition    = DIA_Addon_Miguel_LookingForMiguel_Condition;
   information  = DIA_Addon_Miguel_LookingForMiguel_Info;
   permanent	= FALSE;
   description	= "Szukam Miguela.";
};

FUNC INT DIA_Addon_Miguel_LookingForMiguel_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Fletcher_WELCOME))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Miguel_LookingForMiguel_Info()
{
    AI_Output (other, self ,"DIA_Addon_Miguel_LookingForMiguel_15_01"); //Szukam Miguela.
    AI_Output (self, other ,"DIA_Addon_Miguel_LookingForMiguel_03_02"); //Witaj. To ja nim jestem.
    AI_Output (other, self ,"DIA_Addon_Miguel_LookingForMiguel_15_03"); //Witam ciê. Jestem Vinc. 
    AI_Output (other, self ,"DIA_Addon_Miguel_LookingForMiguel_15_04"); //Emm, nie jesteœ trochê za stary na bandytê? 
    AI_Output (self, other ,"DIA_Addon_Miguel_LookingForMiguel_03_05"); //(œmiech) Ha ha. Dawno siê tak nie uœmia³em.
    AI_Output (other, self ,"DIA_Addon_Miguel_LookingForMiguel_15_06"); //Wybacz jeœli ciê urazi³em. 
    AI_Output (self, other ,"DIA_Addon_Miguel_LookingForMiguel_03_07"); //Jesteœ z Khorinis, prawda?
    AI_Output (other, self ,"DIA_Addon_Miguel_LookingForMiguel_15_08"); //Tak. Sk¹d wiedzia³eœ?
    AI_Output (self, other ,"DIA_Addon_Miguel_LookingForMiguel_03_09"); //Masz w sobie trochê kultury. Wiem, ¿e to akurat niezbyt dobra cecha dla bandyty. Wiêkszoœæ bandy zgrywa twardzielów.
    AI_Output (self, other ,"DIA_Addon_Miguel_LookingForMiguel_03_10"); //Ale wracaj¹c. Ja tak¿e jestem z Khorinis. Znasz mo¿e Ignaza?
    AI_Output (other, self ,"DIA_Addon_Miguel_LookingForMiguel_15_11"); //To taki hmm... Dziwny alchemik z portu. Wydaje siê mieæ coœ z g³ow¹.
    AI_Output (self, other ,"DIA_Addon_Miguel_LookingForMiguel_03_12"); //To przez mój nieudany eksperyment. Kiedyœ by³ o wiele powa¿niejszym cz³owiekiem. Niestety, po tym incydencie sta³ siê nieco irracjonalny.
    AI_Output (other, self ,"DIA_Addon_Miguel_LookingForMiguel_15_13"); //Jesteœ gotowy na pracê od Fletchera?
    AI_Output (self, other ,"DIA_Addon_Miguel_LookingForMiguel_03_14"); //Tak. Przeka¿ mu proszê, ¿e czekam. Wspomnij jeszcze o zio³ach, które tu rosn¹.
    AI_Output (other, self ,"DIA_Addon_Miguel_LookingForMiguel_15_15"); //Nie zapomnê.
    B_LogEntry                     (TOPIC_Report,"Spotka³em Miguela. To bardzo przyjazny i uprzejmie nastawiony starszy cz³owiek. Czeka na robotê od Fletchera. Przy okazji mam wspomnieæ o zio³ach, które rosn¹ na bagnach. Myœlê, ¿e Fletcher siê ucieszy.");
};

//========================================
//-----------------> HelpMe
//========================================

INSTANCE DIA_Addon_Miguel_HelpMe (C_INFO)
{
   npc          = BDT_10022_Addon_Miguel;
   nr           = 1;
   condition    = DIA_Addon_Miguel_HelpMe_Condition;
   information  = DIA_Addon_Miguel_HelpMe_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Miguel_HelpMe_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Fletcher_FinishedHunt))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Miguel_HelpMe_Info()
{
    AI_Output (self, other ,"DIA_Addon_Miguel_HelpMe_03_01"); //Ch³opcze, pomo¿esz mi?
    AI_Output (other, self ,"DIA_Addon_Miguel_HelpMe_15_02"); //W czym rzecz?
    AI_Output (self, other ,"DIA_Addon_Miguel_HelpMe_03_03"); //Nazbiera³em tyle zió³, ¿e nie mam gdzie ich schowaæ.
    AI_Output (self, other ,"DIA_Addon_Miguel_HelpMe_03_04"); //Przyda³yby mi siê teraz jakieœ sakiewki. Najlepiej skórzane.
    AI_Output (other, self ,"DIA_Addon_Miguel_HelpMe_15_05"); //Wiesz gdzie mog¹ byæ?
    AI_Output (self, other ,"DIA_Addon_Miguel_HelpMe_03_06"); //Fletcher powinien mieæ kilka w zrobionym przez nas, prowizorycznym magazynie. Móg³byœ mi przynieœæ kilka sakiew?
    AI_Output (other, self ,"DIA_Addon_Miguel_HelpMe_15_07"); //Pewnie. Nic nie mam do roboty.
    AI_Output (self, other ,"DIA_Addon_Miguel_HelpMe_03_08"); //To dobrze.
    MIS_Pouches_for_Miguel = LOG_RUNNING;

    Log_CreateTopic            (TOPIC_Pouches_for_Miguel, LOG_MISSION);
    Log_SetTopicStatus       (TOPIC_Pouches_for_Miguel, LOG_RUNNING);
    B_LogEntry                     (TOPIC_Pouches_for_Miguel,"Miguel potrzebuje skórzanych sakiewek do przechowania zió³. Wspomnia³ o prowizorycznym magazynie. Myœlê, ¿e Fletcher bêdzie wiedzia³, czy maj¹ na sk³adzie coœ takiego.");
};

//========================================
//-----------------> HereAreYourPouches
//========================================

INSTANCE DIA_Miguel_HereAreYourPouches (C_INFO)
{
   npc          = BDT_10022_Addon_Miguel;
   nr           = 1;
   condition    = DIA_Miguel_HereAreYourPouches_Condition;
   information  = DIA_Miguel_HereAreYourPouches_Info;
   permanent	= FALSE;
   description	= "Mam sakiewki.";
};

FUNC INT DIA_Miguel_HereAreYourPouches_Condition()
{
    if ((Npc_KnowsInfo (other, DIA_Addon_Miguel_HelpMe))
    && (Npc_HasItems (other, ItSe_Empty) >=4))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Miguel_HereAreYourPouches_Info()
{
    AI_Output (other, self ,"DIA_Miguel_HereAreYourPouches_15_01"); //Mam sakiewki.
    AI_Output (self, other ,"DIA_Miguel_HereAreYourPouches_03_02"); //Dziêkujê. Nikt mi tu nie pomaga, ale ty jesteœ inny, ch³opcze.
    AI_Output (other, self ,"DIA_Miguel_HereAreYourPouches_15_03"); //Mali ludzie czerpi¹ olbrzymi¹ radoœæ z b³êdów i gaf pope³nianych przez ludzi wielkich.
    AI_Output (self, other ,"DIA_Miguel_HereAreYourPouches_03_04"); //Jakie to prawdziwe. Jeszcze raz dziêkujê.
	B_GiveInvItems (other, self, ItSe_Empty, 4);
	Npc_RemoveInvItems (self, ItSe_Empty,4); 
    B_LogEntry                     (TOPIC_Pouches_for_Miguel,"Pomog³em staremu Miguelowi. Od teraz bêdzie mia³ gdzie chowaæ roœliny.");
    Log_SetTopicStatus       (TOPIC_Pouches_for_Miguel, LOG_SUCCESS);
    MIS_Pouches_for_Miguel = LOG_SUCCESS;
};

//========================================
//-----------------> CanWeTrade
//========================================

INSTANCE DIA_Addon_Miguel_CanWeTrade (C_INFO)
{
   npc          = BDT_10022_Addon_Miguel;
   nr           = 1;
   condition    = DIA_Addon_Miguel_CanWeTrade_Condition;
   information  = DIA_Addon_Miguel_CanWeTrade_Info;
   permanent	= FALSE;
   description	= "Skoro zbierasz zio³a, to mo¿e sprzedasz mi ich parê?";
};

FUNC INT DIA_Addon_Miguel_CanWeTrade_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Miguel_LookingForMiguel))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Miguel_CanWeTrade_Info()
{
    AI_Output (other, self ,"DIA_Addon_Miguel_CanWeTrade_15_01"); //Skoro zbierasz zio³a, to mo¿e sprzedasz mi ich parê?
    AI_Output (self, other ,"DIA_Addon_Miguel_CanWeTrade_03_02"); //Oczywiœcie. Czego potrzebujesz?
};

//========================================
//-----------------> Trade
//========================================

INSTANCE DIA_Addon_Miguel_Trade (C_INFO)
{
   npc          = BDT_10022_Addon_Miguel;
   nr           = 2;
   condition    = DIA_Addon_Miguel_Trade_Condition;
   information  = DIA_Addon_Miguel_Trade_Info;
   permanent	= TRUE;
   trade        = TRUE;
   description	= "Mogê kupiæ zio³a?";
};

FUNC INT DIA_Addon_Miguel_Trade_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Miguel_CanWeTrade))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Miguel_Trade_Info()
{
    AI_Output (other, self ,"DIA_Addon_Miguel_Trade_15_01"); //Mogê kupiæ zio³a?
    AI_Output (self, other ,"DIA_Addon_Miguel_Trade_03_02"); //Pewnie.
    B_GiveTradeInv (self);
};

//========================================
//-----------------> LookingForSwampweed
//========================================

INSTANCE DIA_Addon_Miguel_LookingForSwampweed (C_INFO)
{
   npc          = BDT_10022_Addon_Miguel;
   nr           = 1;
   condition    = DIA_Addon_Miguel_LookingForSwampweed_Condition;
   information  = DIA_Addon_Miguel_LookingForSwampweed_Info;
   permanent	= FALSE;
   description	= "Szukam bagiennego ziela. ";
};

FUNC INT DIA_Addon_Miguel_LookingForSwampweed_Condition()
{
	if (MIS_Swampweed == LOG_RUNNING)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Addon_Miguel_LookingForSwampweed_Info()
{
    AI_Output (other, self ,"DIA_Addon_Miguel_LookingForSwampweed_15_01"); //Szukam bagiennego ziela. 
    AI_Output (self, other ,"DIA_Addon_Miguel_LookingForSwampweed_03_02"); //Dobrze trafi³eœ. Tutaj znajdziesz tego pe³no. Mogê zapytaæ po co ci ono?
    AI_Output (other, self ,"DIA_Addon_Miguel_LookingForSwampweed_15_03"); //Fortuno potrzebuje tego zielska.
    AI_Output (self, other ,"DIA_Addon_Miguel_LookingForSwampweed_03_04"); //Fortuno... Nie znam go. Ale uwa¿aj z tym zielem. Mo¿e ono prowadziæ do bardzo szkodliwych dzia³añ.
    AI_Output (other, self ,"DIA_Addon_Miguel_LookingForSwampweed_15_05"); //Bêdê o tym pamiêta³.
};

//========================================
//-----------------> WhatsUp
//========================================

INSTANCE DIA_Addon_Miguel_WhatsUp (C_INFO)
{
   npc          = BDT_10022_Addon_Miguel;
   nr           = 1;
   condition    = DIA_Addon_Miguel_WhatsUp_Condition;
   information  = DIA_Addon_Miguel_WhatsUp_Info;
   permanent	= FALSE;
   description	= "Co u ciebie?";
};

FUNC INT DIA_Addon_Miguel_WhatsUp_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Miguel_HereAreYourPouches))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Miguel_WhatsUp_Info()
{
    AI_Output (other, self ,"DIA_Addon_Miguel_WhatsUp_15_01"); //Co u ciebie?
    if (KAPITEL == 3)
    {
        AI_Output (self, other ,"DIA_Addon_Miguel_WhatsUp_03_02"); //Fletcher nie ¿yje. Bojê siê Franka.
    }
    else if (KAPITEL == 2)
    {
        AI_Output (self, other ,"DIA_Addon_Miguel_WhatsUp_03_03"); //Widzê, ¿e pniesz siê w hierarchii obozu. Uwa¿aj na siebie.
    }
    else
    {
        AI_Output (self, other ,"DIA_Addon_Miguel_WhatsUp_03_04"); //Wreszcie mam w co zbieraæ roœliny. Dziêkujê.
    };
};

//========================================
//-----------------> WhyDidHeKill
//========================================

INSTANCE DIA_Addon_Miguel_WhyDidHeKill (C_INFO)
{
   npc          = BDT_10022_Addon_Miguel;
   nr           = 1;
   condition    = DIA_Addon_Miguel_WhyDidHeKill_Condition;
   information  = DIA_Addon_Miguel_WhyDidHeKill_Info;
   permanent	= FALSE;
   description	= "Dlaczego Franko zabi³ Fletchera?";
};

FUNC INT DIA_Addon_Miguel_WhyDidHeKill_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Franco_WhatHappenedHere))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Miguel_WhyDidHeKill_Info()
{
    AI_Output (other, self ,"DIA_Addon_Miguel_WhyDidHeKill_15_01"); //Dlaczego Franko zabi³ Fletchera?
    AI_Output (self, other ,"DIA_Addon_Miguel_WhyDidHeKill_03_02"); //Nie myœla³em o tym...
    AI_Output (other, self ,"DIA_Addon_Miguel_WhyDidHeKill_15_03"); //Do cholery! Fletcher organizowa³ obóz. Co z tob¹?
    AI_Output (self, other ,"DIA_Addon_Miguel_WhyDidHeKill_03_04"); //On... Po prostu podszed³ i zabi³ go. Na dodatek Arvo zastraszy³ czêœæ obozu.
    AI_Output (self, other ,"DIA_Addon_Miguel_WhyDidHeKill_03_05"); //Proszê, odejdŸ ju¿. Nie... Nie chcê o tym rozmawiaæ.
    B_LogEntry                     (TOPIC_Riot_in_Hunters_Camp,"Swoim czynem Franko wystraszy³ czêœæ obozu. Miguel nie by³ skory do rozmowy. Wspomnia³ natomiast, ¿e Arvo zastraszy³ parê osób.");
};

//========================================
//-----------------> AreYouOkay
//========================================

INSTANCE DIA_Addon_Miguel_AreYouOkay (C_INFO)
{
   npc          = BDT_10022_Addon_Miguel;
   nr           = 1;
   condition    = DIA_Addon_Miguel_AreYouOkay_Condition;
   information  = DIA_Addon_Miguel_AreYouOkay_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Miguel_AreYouOkay_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Snaf_YouHaveAwaken))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Miguel_AreYouOkay_Info()
{
    AI_Output (self, other ,"DIA_Addon_Miguel_AreYouOkay_03_01"); //Jesteœ ca³y?
    AI_Output (other, self ,"DIA_Addon_Miguel_AreYouOkay_15_02"); //Teraz siê o mnie martwicie?
    AI_Output (self, other ,"DIA_Addon_Miguel_AreYouOkay_03_03"); //Franko zakaza³ mi wejœcia do obozu. Chcia³em ci pomóc.
    AI_Output (other, self ,"DIA_Addon_Miguel_AreYouOkay_15_04"); //Co mi siê sta³o?
    AI_Output (self, other ,"DIA_Addon_Miguel_AreYouOkay_03_05"); //Ten, kto poda³ ci truciznê, by³ wyj¹tkowo g³upi.
    AI_Output (other, self ,"DIA_Addon_Miguel_AreYouOkay_15_06"); //Znam kilku takich.
    AI_Output (self, other ,"DIA_Addon_Miguel_AreYouOkay_03_07"); //Nie obwiniaj Snafa. On by tego nie zrobi³.
    AI_Output (self, other ,"DIA_Addon_Miguel_AreYouOkay_03_08"); //Ten, kto chcia³ ciê otruæ, wla³ ci tylko po³owê zawartoœci. Gdyby to by³a ca³a fiolka, ju¿ byœ nie ¿y³.
    AI_Output (self, other ,"DIA_Addon_Miguel_AreYouOkay_03_09"); //Masz szczêœcie w nieszczêœciu. Twoje cia³o jest nadal sparali¿owane.
    AI_Output (other, self ,"DIA_Addon_Miguel_AreYouOkay_15_10"); //Znajdê tego goœcia. Zap³aci mi za to.
    AI_Output (self, other ,"DIA_Addon_Miguel_AreYouOkay_03_11"); //Wyœpij siê lepiej.
    AI_Output (other, self ,"DIA_Addon_Miguel_AreYouOkay_15_12"); //Nie! Znajdê go teraz.
    AI_Output (self, other ,"DIA_Addon_Miguel_AreYouOkay_03_13"); //Zrobisz jak uwa¿asz.
    B_LogEntry                     (TOPIC_Illness,"Miguel powiedzia³, ¿e ten, kto wla³ mi truciznê, by³ g³upi, bo nie wla³ ca³ej zawartoœci. Znajdê tego, kto mi to zrobi³. Zacznê od tych, co s¹ najbli¿ej knajpy Lou.");
};

//========================================
//-----------------> WheresArvo
//========================================

INSTANCE DIA_Addon_Miguel_WheresArvo (C_INFO)
{
   npc          = BDT_10022_Addon_Miguel;
   nr           = 1;
   condition    = DIA_Addon_Miguel_WheresArvo_Condition;
   information  = DIA_Addon_Miguel_WheresArvo_Info;
   permanent	= FALSE;
   description	= "Jedno wa¿ne pytanie. Gdzie jest Arvo?";
};

FUNC INT DIA_Addon_Miguel_WheresArvo_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Kyrrus_WheresArvo))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Miguel_WheresArvo_Info()
{
    AI_Output (other, self ,"DIA_Addon_Miguel_WheresArvo_15_01"); //Jedno wa¿ne pytanie. Gdzie jest Arvo?
    AI_Output (self, other ,"DIA_Addon_Miguel_WheresArvo_03_02"); //Szed³ na pó³noc. Tam gdzie ty z Loganem polowaliœcie na b³otne wê¿e.
    AI_Output (other, self ,"DIA_Addon_Miguel_WheresArvo_15_03"); //To mi wystarczy.
    B_LogEntry                     (TOPIC_Arvo,"Arvo poszed³ w kierunku pó³nocnym. Niedawno tam by³em. Czas to zakoñczyæ.");
};

