//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Lou_EXIT(C_INFO)
{
	npc             = BDT_10318_Lou;
	nr              = 999;
	condition		= DIA_Lou_EXIT_Condition;
	information		= DIA_Lou_EXIT_Info;
	permanent		= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Lou_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Lou_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> ScattyWantsBeer
//========================================

INSTANCE DIA_Lou_ScattyWantsBeer (C_INFO)
{
   npc          = BDT_10318_Lou;
   nr           = 1;
   condition    = DIA_Lou_ScattyWantsBeer_Condition;
   information  = DIA_Lou_ScattyWantsBeer_Info;
   permanent	= FALSE;
   description	= "Scatty chcia³by siê napiæ piwa.";
};

FUNC INT DIA_Lou_ScattyWantsBeer_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Scatty_GoodBeer))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Lou_ScattyWantsBeer_Info()
{
    AI_Output (other, self ,"DIA_Lou_ScattyWantsBeer_15_01"); //Scatty chcia³by siê napiæ piwa.
    AI_Output (self, other ,"DIA_Lou_ScattyWantsBeer_03_02"); //A kto by nie chcia³? (œmiech)
    AI_Output (other, self ,"DIA_Lou_ScattyWantsBeer_15_03"); //To jak, masz coœ?
    AI_Output (self, other ,"DIA_Lou_ScattyWantsBeer_03_04"); //Mam parê ostatnich butelek. Dok³adnie dwie.
    AI_Output (other, self ,"DIA_Lou_ScattyWantsBeer_15_05"); //Nie s¹dzê, aby mu to wystarczy³o.
    AI_Output (self, other ,"DIA_Lou_ScattyWantsBeer_03_06"); //To bêdzie musia³o. Daj mi 50 sztuk z³ota i masz butelczyny.
};

//========================================
//-----------------> MoneyForBeer
//========================================

INSTANCE DIA_Lou_MoneyForBeer (C_INFO)
{
   npc          = BDT_10318_Lou;
   nr           = 2;
   condition    = DIA_Lou_MoneyForBeer_Condition;
   information  = DIA_Lou_MoneyForBeer_Info;
   permanent	= FALSE;
   description	= "Oto twoje pieni¹dze. (50 sztuk z³ota)";
};

FUNC INT DIA_Lou_MoneyForBeer_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Lou_ScattyWantsBeer))
    && (Npc_HasItems (other, ItMi_Gold) >=50)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Lou_MoneyForBeer_Info()
{
    AI_Output (other, self ,"DIA_Lou_MoneyForBeer_15_01"); //Oto twoje pieni¹dze.
    AI_Output (self, other ,"DIA_Lou_MoneyForBeer_03_02"); //Hehe, proszê. Jeszcze zimne. Przy okazji zawsze mo¿esz wypiæ jedn¹ butelkê i daæ mu tylko tê drug¹.
    B_LogEntry                     (TOPIC_Strong_Beer,"Lou da³ mi dwie butelki zimnego piwa i zasugerowa³, ¿ebym odda³ Scattiemu tylko jedn¹ butelkê, a drug¹ sam wypi³.");
    B_GiveInvItems (other, self, ItMi_Gold, 50);
    CreateInvItems (self, ItFo_Beer_Lou, 2);
    B_GiveInvItems (self, other, ItFo_Beer_Lou, 2);
};

//========================================
//-----------------> Hello
//========================================

INSTANCE DIA_Lou_Hello (C_INFO)
{
   npc          = BDT_10318_Lou;
   nr           = 1;
   condition    = DIA_Lou_Hello_Condition;
   information  = DIA_Lou_Hello_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Lou_Hello_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Lou_Hello_Info()
{
    AI_Output (self, other ,"DIA_Lou_Hello_03_01"); //Witaj m³odzieñcze, nazywam siê Lou. Mo¿e chcesz siê napiæ?
    AI_Output (other, self ,"DIA_Lou_Hello_15_02"); //A co oferujesz?
    AI_Output (self, other ,"DIA_Lou_Hello_03_03"); //Mam najlepsze trunki w tym obozie. Jak skosztujesz to zobaczysz.
    AI_Output (other, self ,"DIA_Lou_Hello_15_04"); //Œwietnie. Co mo¿esz mi sprzedaæ?
    AI_Output (self, other ,"DIA_Lou_Hello_03_05"); //Alkohol rzecz jasna. Powiedz, jeœli bêdziesz czegoœ potrzebowa³.
};

//========================================
//-----------------> Trade
//========================================

INSTANCE DIA_Lou_Trade (C_INFO)
{
   npc          = BDT_10318_Lou;
   nr           = 2;
   condition    = DIA_Lou_Trade_Condition;
   information  = DIA_Lou_Trade_Info;
   permanent	= TRUE;
   trade        = TRUE;
   description	= "Chcê siê napiæ.";
};

FUNC INT DIA_Lou_Trade_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Lou_Hello))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Lou_Trade_Info()
{
    B_GiveTradeInv (self);
    AI_Output (other, self ,"DIA_Lou_Trade_15_01"); //Chcê siê napiæ.
    AI_Output (self, other ,"DIA_Lou_Trade_03_02"); //Œmia³o, czego potrzebujesz?
};

//========================================
//-----------------> WhereAreYouFrom
//========================================

INSTANCE DIA_Lou_WhereAreYouFrom (C_INFO)
{
   npc          = BDT_10318_Lou;
   nr           = 3;
   condition    = DIA_Lou_WhereAreYouFrom_Condition;
   information  = DIA_Lou_WhereAreYouFrom_Info;
   permanent	= FALSE;
   description	= "Sk¹d pochodzisz?";
};

FUNC INT DIA_Lou_WhereAreYouFrom_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Lou_Hello))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Lou_WhereAreYouFrom_Info()
{
    AI_Output (other, self ,"DIA_Lou_WhereAreYouFrom_15_01"); //Sk¹d pochodzisz?
    AI_Output (self, other ,"DIA_Lou_WhereAreYouFrom_03_02"); //Du¿o by o tym gadaæ, ch³opcze. By³em w tak wielu miejscach, ¿e trudno powiedzieæ sk¹d.
    AI_Output (self, other ,"DIA_Lou_WhereAreYouFrom_03_03"); //Przez ca³e ¿ycie zajmowa³em siê alkoholem. Rzecz jasna to zmusza³o mnie do koczowniczego ¿ycia.
    AI_Output (self, other ,"DIA_Lou_WhereAreYouFrom_03_04"); //Nigdy nie zagrza³em w jednym miejscu zbyt du¿o czasu. A ty, gdzie wczeœniej przebywa³eœ?
    AI_Output (other, self ,"DIA_Lou_WhereAreYouFrom_15_05"); //Pochodzê z Khorinis...
    AI_Output (self, other ,"DIA_Lou_WhereAreYouFrom_03_06"); //Khorinis... Pamiêtam pewien szczególny budynek w porcie.
    AI_Output (other, self ,"DIA_Lou_WhereAreYouFrom_15_07"); //Domyœlam siê.
    AI_Output (self, other ,"DIA_Lou_WhereAreYouFrom_03_08"); //A jak ci na imiê?
    AI_Output (other, self ,"DIA_Lou_WhereAreYouFrom_15_09"); //Jestem Vinc.
    AI_Output (self, other ,"DIA_Lou_WhereAreYouFrom_03_10"); //Wpadaj kiedy chcesz, Vinc.
};

//========================================
//-----------------> WhatAreYouDoing
//========================================

INSTANCE DIA_Lou_WhatAreYouDoing (C_INFO)
{
   npc          = BDT_10318_Lou;
   nr           = 4;
   condition    = DIA_Lou_WhatAreYouDoing_Condition;
   information  = DIA_Lou_WhatAreYouDoing_Info;
   permanent	= FALSE;
   description	= "Co porabiasz?";
};

FUNC INT DIA_Lou_WhatAreYouDoing_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Lou_Hello))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Lou_WhatAreYouDoing_Info()
{
    AI_Output (other, self ,"DIA_Lou_WhatAreYouDoing_15_01"); //Co porabiasz?
    AI_Output (self, other ,"DIA_Lou_WhatAreYouDoing_03_02"); //Mi³o, ¿e pytasz. Ostatnio wpad³em na ciekawe receptury alkoholowe.
    AI_Output (other, self ,"DIA_Lou_WhatAreYouDoing_15_03"); //Na przyk³ad jakie?
    AI_Output (self, other ,"DIA_Lou_WhatAreYouDoing_03_04"); //Myœla³em o alkoholu na bazie bagiennego ziela...
    AI_Output (other, self ,"DIA_Lou_WhatAreYouDoing_15_05"); //Co takiego? (zdziwienie)
    AI_Output (self, other ,"DIA_Lou_WhatAreYouDoing_03_06"); //Co w tym dziwnego? Kiedyœ uwa¿a³em, i¿ wóda z ziemniaków to najgorsze okropieñstwo.
    AI_Output (self, other ,"DIA_Lou_WhatAreYouDoing_03_07"); //A smakuje dobrze. Tylko nie mów ch³opcze, ¿e nie pi³eœ.

    Info_ClearChoices		(DIA_Lou_WhatAreYouDoing);
    Info_AddChoice		(DIA_Lou_WhatAreYouDoing, "Raz siê tego napi³em.", DIA_Lou_WhatAreYouDoing_IDid);
    Info_AddChoice		(DIA_Lou_WhatAreYouDoing, "Nigdy nie próbowa³em.", DIA_Lou_WhatAreYouDoing_IDidNot);
};

FUNC VOID DIA_Lou_WhatAreYouDoing_IDid()
{
    AI_Output (other, self ,"DIA_Lou_WhatAreYouDoing_IDid_15_01"); //Raz siê tego napi³em.
    AI_Output (self, other ,"DIA_Lou_WhatAreYouDoing_IDid_03_02"); //I jak?
    AI_Output (other, self ,"DIA_Lou_WhatAreYouDoing_IDid_15_03"); //Paskudztwo jakich ma³o.
    AI_Output (self, other ,"DIA_Lou_WhatAreYouDoing_IDid_03_04"); //Ha ha, te¿ tak kiedyœ uwa¿a³em.
    Info_ClearChoices		(DIA_Lou_WhatAreYouDoing);
};

FUNC VOID DIA_Lou_WhatAreYouDoing_IDidNot()
{
    AI_Output (other, self ,"DIA_Lou_WhatAreYouDoing_IDidNot_15_01"); //Nigdy nie próbowa³em.
    AI_Output (self, other ,"DIA_Lou_WhatAreYouDoing_IDidNot_03_02"); //Ha ha, mnie nie oszukasz, ch³opcze. Dobrze znam ludzi.
    AI_Output (other, self ,"DIA_Lou_WhatAreYouDoing_IDidNot_15_03"); //Hmm...
    AI_Output (self, other ,"DIA_Lou_WhatAreYouDoing_IDidNot_03_04"); //Dobrze, nie denerwuj siê. Nie oceniam w ten sposób.
    Info_ClearChoices		(DIA_Lou_WhatAreYouDoing);
};

//========================================
//-----------------> ContinuedConversation
//========================================

INSTANCE DIA_Lou_ContinuedConversation (C_INFO)
{
   npc          = BDT_10318_Lou;
   nr           = 5;
   condition    = DIA_Lou_ContinuedConversation_Condition;
   information  = DIA_Lou_ContinuedConversation_Info;
   permanent	= FALSE;
   description	= "Lepiej rób alkohole ze sk³adnikami jakie masz pod rêk¹.";
};

FUNC INT DIA_Lou_ContinuedConversation_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Lou_WhatAreYouDoing))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Lou_ContinuedConversation_Info()
{
    AI_Output (other, self ,"DIA_Lou_ContinuedConversation_15_01"); //Lepiej rób alkohole ze sk³adnikami jakie masz pod rêk¹.
    AI_Output (self, other ,"DIA_Lou_ContinuedConversation_03_02"); //Jeszcze siê zdziwisz co ja zrobiê.
    AI_Output (other, self ,"DIA_Lou_ContinuedConversation_15_03"); //Nie zapomnij mi o tym powiedzieæ.
    AI_Output (self, other ,"DIA_Lou_ContinuedConversation_03_04"); //Nie zapomnê.
};

//========================================
//-----------------> TellMeAboutAdventures
//========================================

INSTANCE DIA_Lou_TellMeAboutAdventures (C_INFO)
{
   npc          = BDT_10318_Lou;
   nr           = 6;
   condition    = DIA_Lou_TellMeAboutAdventures_Condition;
   information  = DIA_Lou_TellMeAboutAdventures_Info;
   permanent	= FALSE;
   description	= "Opowiesz mi o swoich trunkowych przygodach?";
};

FUNC INT DIA_Lou_TellMeAboutAdventures_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Lou_ContinuedConversation))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Lou_TellMeAboutAdventures_Info()
{
    AI_Output (other, self ,"DIA_Lou_TellMeAboutAdventures_15_01"); //Opowiesz mi o swoich trunkowych przygodach?
    AI_Output (self, other ,"DIA_Lou_TellMeAboutAdventures_03_02"); //Jasne. Tylko gdzie ja podzia³em butelkê, hmm.
    AI_Output (self, other ,"DIA_Lou_TellMeAboutAdventures_03_03"); //O, jest tutaj!
    CreateInvItems (self, ItFo_Addon_Rum, 2);
    B_UseItem (self, ItFo_Addon_Rum);
    AI_Output (self, other ,"DIA_Lou_TellMeAboutAdventures_03_04"); //Aaa, dobrze s³uchaj uwa¿nie.
    AI_Output (self, other ,"DIA_Lou_TellMeAboutAdventures_03_05"); //Parênaœcie lat temu pierwszy raz przyp³yn¹³em do Khorinis.
    AI_Output (self, other ,"DIA_Lou_TellMeAboutAdventures_03_06"); //By³o to przed powstaniem tej magicznej bariery. Miasto jak to miasto, têtni³o ¿yciem. Pozna³em parê osób, ale nie by³em tam zbyt d³ugo.
    AI_Output (self, other ,"DIA_Lou_TellMeAboutAdventures_03_07"); //Znalaz³em za to ciekawe miejsce do destylacji alkoholowej. To by³a jaskinia za latarni¹ morsk¹, obok ciemnego lasu.
    AI_Output (other, self ,"DIA_Lou_TellMeAboutAdventures_15_08"); //Nigdy siê tam nie zapuszcza³em. Niebezpieczne miejsce.
    AI_Output (self, other ,"DIA_Lou_TellMeAboutAdventures_03_09"); //Wierutne bzdury, nie by³o tak Ÿle. Co nie si³¹, to rozumem jak to mówi¹. Mia³em umowê z pewnym myœliwym.
    AI_Output (other, self ,"DIA_Lou_TellMeAboutAdventures_15_10"); //Jak¹ umowê?
    AI_Output (self, other ,"DIA_Lou_TellMeAboutAdventures_03_11"); //On co jakiœ czas zabija³ te zwierzêta, które nie dawa³y mi spokoju i by³y dla mnie zagro¿eniem, a w zamian dawa³em mu czêœæ pe³nych butelek.
    AI_Output (other, self ,"DIA_Lou_TellMeAboutAdventures_15_12"); //Op³aca³o mu siê?
    AI_Output (self, other ,"DIA_Lou_TellMeAboutAdventures_03_13"); //Pewnie. Nie doœæ, ¿e mia³ jakieœ trofea z tych zwierz¹t, to móg³ jeszcze sprzedaæ te butelki i dorobiæ sobie. No, albo je wypiæ.
    AI_Output (other, self ,"DIA_Lou_TellMeAboutAdventures_15_14"); //Mów dalej.
    AI_Output (self, other ,"DIA_Lou_TellMeAboutAdventures_03_15"); //Poczekaj chwilê. Zasch³o mi w gardle.
    B_UseItem (self, ItFo_Addon_Rum);
    AI_Output (self, other ,"DIA_Lou_TellMeAboutAdventures_03_16"); //No, na czym to ja skoñczy³em?
    AI_Output (other, self ,"DIA_Lou_TellMeAboutAdventures_15_17"); //O uk³adzie z myœliwym.
    AI_Output (self, other ,"DIA_Lou_TellMeAboutAdventures_03_18"); //Ah tak... Wiêc trochê tam porobi³em alkoholu i przyszed³ czas na sprzedanie tego.
    AI_Output (self, other ,"DIA_Lou_TellMeAboutAdventures_03_19"); //Takie wejœcie do miasta kosztowa³o mnie osiem butelczyn, a zawsze wychodzi³em z pe³n¹ sakiewk¹.
    AI_Output (other, self ,"DIA_Lou_TellMeAboutAdventures_15_20"); //Co by³o dalej?
    AI_Output (self, other ,"DIA_Lou_TellMeAboutAdventures_03_21"); //W koñcu ktoœ wykry³, ¿e wartownicy przy bramie s¹ przekupni i zbyt du¿o nielegalnego alkoholu jest w mieœcie. Musia³em siê zwijaæ.
    AI_Output (self, other ,"DIA_Lou_TellMeAboutAdventures_03_22"); //Wsiad³em na statek i postanowi³em udaæ siê na kontynent.
    AI_Output (other, self ,"DIA_Lou_TellMeAboutAdventures_15_23"); //Uda³o ci siê?
    AI_Output (self, other ,"DIA_Lou_TellMeAboutAdventures_03_24"); //Oczywiœcie, ¿e nie. Napadli na nas piraci. Gdybyœ wiedzia³ jaka to by³a doskona³a organizacja aborda¿u. Ich kapitanem by³ taki czarnobrody jegomoœæ. Tylko jak on mia³ na imiê...
    AI_Output (self, other ,"DIA_Lou_TellMeAboutAdventures_03_25"); //Hmm, niewa¿ne, ale wracaj¹c. Wpad³em w ich ³apska. Chcieli mnie rzuciæ rekinom na po¿arcie, a ja wtedy zacz¹³em krzyczeæ, ¿e jestem bimbrownikiem i to jednym z najlepszych.
    AI_Output (other, self ,"DIA_Lou_TellMeAboutAdventures_15_26"); //I co? (zaciekawiony)
    AI_Output (self, other ,"DIA_Lou_TellMeAboutAdventures_03_27"); //Wyœmiali mnie w niebo g³osy, ale dali mi szansê. Przyp³ynêliœmy do ich obozu, gdzie poszed³em z takim jednym piratem do jaskini i tak musia³em zrobiæ rum.
    AI_Output (other, self ,"DIA_Lou_TellMeAboutAdventures_15_28"); //Jak ci posz³o?
    AI_Output (self, other ,"DIA_Lou_TellMeAboutAdventures_03_29"); //Nigdy nie robi³em rumu i obawia³em siê, ¿e mi nie wyjdzie.
    AI_Output (self, other ,"DIA_Lou_TellMeAboutAdventures_03_30"); //Po miesi¹cu przyszed³ czas na degustacjê. Bardzo siê ba³em, a jak siê okaza³o, niepotrzebnie. Mój rum smakowa³ ch³opakom.
    AI_Output (self, other ,"DIA_Lou_TellMeAboutAdventures_03_31"); //Co prawda mówili, ¿e robota Samuela jest o wiele lepsza, ale i tak sukces z mojej strony.
    AI_Output (other, self ,"DIA_Lou_TellMeAboutAdventures_15_32"); //Samuela?
    AI_Output (self, other ,"DIA_Lou_TellMeAboutAdventures_03_33"); //Samuel to ten pirat, który zaprowadzi³ mnie do swojej jaskini.
    AI_Output (self, other ,"DIA_Lou_TellMeAboutAdventures_03_34"); //I wtedy piraci mnie wypuœcili. Uznali mnie za nawet porz¹dnego szczura l¹dowego. Wypi³em z nimi trochê, a z Samuelem wymieni³em siê doœwiadczeniem bimbrownika, ha ha ha.
    AI_Output (other, self ,"DIA_Lou_TellMeAboutAdventures_15_35"); //Bardzo ciekawa historia.
    AI_Output (self, other ,"DIA_Lou_TellMeAboutAdventures_03_36"); //¯ebyœ wiedzia³, ch³opcze. Mo¿e kiedyœ opowiem ci coœ jeszcze. Teraz zmykaj, bo mam co robiæ.
    AI_Output (other, self ,"DIA_Lou_TellMeAboutAdventures_15_37"); //Jasna sprawa.
};

//========================================
//-----------------> WhenDidYouStartBrewing
//========================================

INSTANCE DIA_Lou_WhenDidYouStartBrewing (C_INFO)
{
   npc          = BDT_10318_Lou;
   nr           = 7;
   condition    = DIA_Lou_WhenDidYouStartBrewing_Condition;
   information  = DIA_Lou_WhenDidYouStartBrewing_Info;
   permanent	= FALSE;
   description	= "Kiedy zacz¹³eœ bawiæ siê w bimbrownictwo?";
};

FUNC INT DIA_Lou_WhenDidYouStartBrewing_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Lou_TellMeAboutAdventures))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Lou_WhenDidYouStartBrewing_Info()
{
    AI_Output (other, self ,"DIA_Lou_WhenDidYouStartBrewing_15_01"); //Kiedy zacz¹³eœ bawiæ siê w bimbrownictwo?
    AI_Output (self, other ,"DIA_Lou_WhenDidYouStartBrewing_03_02"); //Wiesz, to by³o szmat czasu temu, ale zacznijmy od samego pocz¹tku.
    AI_Output (self, other ,"DIA_Lou_WhenDidYouStartBrewing_03_03"); //Jak skoñczy³em dziesiêæ lat, ojciec kaza³ mi siê czymœ zaj¹æ. Zacz¹³em siê uczyæ alchemii od miejscowego alchemika Hortenca.
    AI_Output (self, other ,"DIA_Lou_WhenDidYouStartBrewing_03_04"); //Z pocz¹tku by³y to jakieœ wywary i esencje. Bardzo szybko pod³apa³em ten zawód. A¿ pewnego dnia mój mistrz zmar³, a jego syn sprzeda³ jego laboratorium.
    AI_Output (self, other ,"DIA_Lou_WhenDidYouStartBrewing_03_05"); //Wtedy pozna³em znajomego Hortenca. Opowiedzia³ mi o swoim zajêciu i, ¿e przyda³by siê mu ktoœ taki jak ja.
    AI_Output (self, other ,"DIA_Lou_WhenDidYouStartBrewing_03_06"); //I tak oto w³aœnie m³ody Lou zacz¹³ swój fach.
    AI_Output (other, self ,"DIA_Lou_WhenDidYouStartBrewing_15_07"); //Nie ¿a³owa³eœ czasami tego wyboru?
    AI_Output (self, other ,"DIA_Lou_WhenDidYouStartBrewing_03_08"); //Niby dlaczego? Gdy by³em mniej wiêcej w twoim wieku, opuœci³em Starego – bo tak kaza³ siê nazywaæ – i uda³em siê w œwiat.
    AI_Output (self, other ,"DIA_Lou_WhenDidYouStartBrewing_03_09"); //Mo¿e ci kiedyœ o tym opowiem. Zwiedzi³em naprawdê wiele.
    AI_Output (other, self ,"DIA_Lou_WhenDidYouStartBrewing_15_10"); //Z chêci¹ pos³ucham.
    AI_Output (self, other ,"DIA_Lou_WhenDidYouStartBrewing_03_11"); //Nie zapomnê o tym.
};

//========================================
//-----------------> WhatAboutThem
//========================================

INSTANCE DIA_Lou_WhatAboutThem (C_INFO)
{
   npc          = BDT_10318_Lou;
   nr           = 8;
   condition    = DIA_Lou_WhatAboutThem_Condition;
   information  = DIA_Lou_WhatAboutThem_Info;
   permanent	= FALSE;
   description	= "Opowiesz mi o Hortencie i Starym?";
};

FUNC INT DIA_Lou_WhatAboutThem_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Lou_WhenDidYouStartBrewing))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Lou_WhatAboutThem_Info()
{
    AI_Output (other, self ,"DIA_Lou_WhatAboutThem_15_01"); //Opowiesz mi o Hortencie i Starym?
    AI_Output (self, other ,"DIA_Lou_WhatAboutThem_03_02"); //Czemu by nie? Zacznê od Hortenca.
    AI_Output (self, other ,"DIA_Lou_WhatAboutThem_03_03"); //By³ to znany alchemik, który s³yn¹³ ze swojej dobroci. By³ bardzo spokojny i opanowany.
    AI_Output (self, other ,"DIA_Lou_WhatAboutThem_03_04"); //Niestety, mia³ on k³opoty z sercem. Gdy uczy³ mnie podstaw leku na czarn¹ gor¹czkê, pad³ na pod³ogê i ju¿ siê nie podniós³.
    AI_Output (self, other ,"DIA_Lou_WhatAboutThem_03_05"); //Jego syn mia³ w nosie dorobek ojca. Jak ju¿ powiedzia³em wczeœniej, sprzeda³ wszystko.
    AI_Output (self, other ,"DIA_Lou_WhatAboutThem_03_06"); //A ja wyl¹dowa³em na bruku. Snu³em siê po ulicy i wpad³em na Starego. Hortenc kilka razy o nim mi wspomnia³. Mówi³: to wariat, ale uczciwy.
    AI_Output (other, self ,"DIA_Lou_WhatAboutThem_15_07"); //Ciekawe.
    AI_Output (self, other ,"DIA_Lou_WhatAboutThem_03_08"); //No nie? Stary mówi³, ¿e jak chcê to mogê u niego siê uczyæ, bo potrzebuje kogoœ takiego jak ja.
    AI_Output (self, other ,"DIA_Lou_WhatAboutThem_03_09"); //Przyj¹³em ofertê. Pamiêtam minê ojca, gdy przynios³em mu pieni¹dze. ''Widzisz? Mieszanie butelek siê op³aca''. Tak powiedzia³.
    AI_Output (other, self ,"DIA_Lou_WhatAboutThem_15_10"); //Wiedzia³ co robi³eœ?
    AI_Output (self, other ,"DIA_Lou_WhatAboutThem_03_11"); //Chyba tak, sam nie wiem. Po paru latach opuœci³em dom i odp³yn¹³em w inne strony.
    AI_Output (other, self ,"DIA_Lou_WhatAboutThem_15_12"); //Zostawi³eœ ojca?
    AI_Output (self, other ,"DIA_Lou_WhatAboutThem_03_13"); //Pok³óci³em siê z nim, a powodem by³a w³aœnie ta podró¿. Zreszt¹ relacje by³y czasami napiête miêdzy nami.
    AI_Output (self, other ,"DIA_Lou_WhatAboutThem_03_14"); //Ale jeœli chodzi o Starego... Mia³ bardzo oryginalne podejœcie do pracy. Co dzieñ z rana wypija³ szklankê alkoholu.
    AI_Output (self, other ,"DIA_Lou_WhatAboutThem_03_15"); //Z czasem musia³em coraz czêœciej pilnowaæ destylacji, gdy on albo szuka³ sk³adników albo mia³ mocnego kaca.
    AI_Output (self, other ,"DIA_Lou_WhatAboutThem_03_16"); //Tydzieñ po tygodniu uczy³ mnie jak i z czego robiæ ka¿dy alkohol. Stare czasy.
};

//========================================
//-----------------> WhatAboutCave
//========================================

INSTANCE DIA_Lou_WhatAboutCave (C_INFO)
{
   npc          = BDT_10318_Lou;
   nr           = 9;
   condition    = DIA_Lou_WhatAboutCave_Condition;
   information  = DIA_Lou_WhatAboutCave_Info;
   permanent	= FALSE;
   description	= "A co z t¹ jaskini¹ w Khorinis?";
};

FUNC INT DIA_Lou_WhatAboutCave_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Lou_TellMeAboutAdventures))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Lou_WhatAboutCave_Info()
{
    AI_Output (other, self ,"DIA_Lou_WhatAboutCave_15_01"); //A co z t¹ jaskini¹ w Khorinis?
    AI_Output (self, other ,"DIA_Lou_WhatAboutCave_03_02"); //Stoi chyba pusta, a na pewno zamkniêta.
    AI_Output (other, self ,"DIA_Lou_WhatAboutCave_15_03"); //Ktoœ j¹ przej¹³ po tobie?
    AI_Output (self, other ,"DIA_Lou_WhatAboutCave_03_04"); //Jeœli mnie pamiêæ nie myli, to goœæ nazywa³ siê Vino.
    AI_Output (other, self ,"DIA_Lou_WhatAboutCave_15_05"); //Vino? Chyba go znam. To jeden z parobków Lobarta.
    AI_Output (self, other ,"DIA_Lou_WhatAboutCave_03_06"); //Lobart? Szmat czasu go nie widzia³em. Ale nie mówmy o nim, pyta³eœ o jaskiniê.
    AI_Output (self, other ,"DIA_Lou_WhatAboutCave_03_07"); //Gdy powsta³a ta ca³a bariera, wytwórnie nielegalnego alkoholu by³y jeszcze bardziej ryzykowne.
    AI_Output (other, self ,"DIA_Lou_WhatAboutCave_15_08"); //Pamiêtam, ¿e król og³osi³ bardzo ostre prawa.
    AI_Output (self, other ,"DIA_Lou_WhatAboutCave_03_09"); //Te¿ to pamiêtam. Biedny Jeremiasz przekona³ siê o tym na w³asnej skórze.
    AI_Output (other, self ,"DIA_Lou_WhatAboutCave_15_10"); //Jeremiasz?
    AI_Output (self, other ,"DIA_Lou_WhatAboutCave_03_11"); //Gdy powsta³a bariera by³em na wyspie ju¿ kolejny raz. W tej jaskini ja, Vino i Jeremiasz destylowaliœmy trunki.
    AI_Output (self, other ,"DIA_Lou_WhatAboutCave_03_12"); //Zrobiliœmy tyle butelek, ¿e nie mieliœmy ju¿ w co wlewaæ wytworzonego alkoholu.
    AI_Output (self, other ,"DIA_Lou_WhatAboutCave_03_13"); //Wiêc postanowiliœmy „pozbyæ” siê towaru. Jeremiasz podj¹³ siê udania na farmê w³aœciciela ziemskiego. Chcia³ tam sprzedaæ z zyskiem nasz towar.
    AI_Output (other, self ,"DIA_Lou_WhatAboutCave_15_14"); //I wpad³.
    AI_Output (self, other ,"DIA_Lou_WhatAboutCave_03_15"); //Niestety tak. Akurat wtedy stra¿ zbiera³a plony na rzecz armii.
    AI_Output (self, other ,"DIA_Lou_WhatAboutCave_03_16"); //Biedny Jeremiasz nawet nie mia³ szans na ucieczkê. Ale z³ego demony nie bior¹!
    AI_Output (other, self ,"DIA_Lou_WhatAboutCave_15_17"); //Hm?
    AI_Output (self, other ,"DIA_Lou_WhatAboutCave_03_18"); //Od paru osób s³ysza³em, ¿e w kolonii robi³ alkohol z ry¿u.
    AI_Output (other, self ,"DIA_Lou_WhatAboutCave_15_19"); //(œmiech) To siê nazywa mieæ fach w rêku.
    AI_Output (self, other ,"DIA_Lou_WhatAboutCave_03_20"); //¯ebyœ wiedzia³, ale sam wiesz, bariera upad³a...
    AI_Output (other, self ,"DIA_Lou_WhatAboutCave_15_21"); //A co wtedy zrobiliœcie z Vino?
    AI_Output (self, other ,"DIA_Lou_WhatAboutCave_03_22"); //Vino by³ bardziej wystraszony ni¿ ja. Chocia¿ jego wystraszyæ nie jest trudno. Wystarczy, ¿e zobaczy³ cieñ w lesie i bra³ nogi za pas.
    AI_Output (self, other ,"DIA_Lou_WhatAboutCave_03_23"); //Aa, zagada³em siê. Po tygodniu rozeznaliœmy siê w terenie. Postanowiliœmy sprzedaæ towar w ma³ych iloœciach.
    AI_Output (self, other ,"DIA_Lou_WhatAboutCave_03_24"); //Uda³o siê nam, a Vino nawet nabra³ pewnoœci siebie. Rozstaliœmy siê w zgodzie.
    AI_Output (self, other ,"DIA_Lou_WhatAboutCave_03_25"); //On produkowa³ dalej alkohol, a ja opuœci³em wyspê. Tym razem uda³o mi siê dotrzeæ na kontynent. Spêdzi³em tam kilka lat i wróci³em tu na wyspê.
    AI_Output (self, other ,"DIA_Lou_WhatAboutCave_03_26"); //W koñcu bariera upad³a i trafi³em na bandytów. Od teraz to mój dom.
    AI_Output (other, self ,"DIA_Lou_WhatAboutCave_15_27"); //¯ycie bez podró¿y jest jak potrawa bez soli.
    AI_Output (self, other ,"DIA_Lou_WhatAboutCave_03_28"); //Oho, chyba odkry³em twoj¹ ciekawoœæ œwiata. Powiedz teraz coœ o sobie.
    AI_Output (other, self ,"DIA_Lou_WhatAboutCave_15_29"); //A co tu mówiæ. Tydzieñ spêdzi³em w wiêzieniu w koszarach. Nastêpnie stra¿nicy odprowadzali mnie do Górniczej Doliny.
    AI_Output (self, other ,"DIA_Lou_WhatAboutCave_03_30"); //Ale ich zabi³eœ. Dlaczego? Co ciê do tego sk³oni³o?
    AI_Output (other, self ,"DIA_Lou_WhatAboutCave_15_31"); //Sam nie wiem...
    AI_Output (self, other ,"DIA_Lou_WhatAboutCave_03_32"); //Nie chcesz to nie mów.
    AI_Output (other, self ,"DIA_Lou_WhatAboutCave_15_33"); //Przy tym zostañmy.
    AI_Output (self, other ,"DIA_Lou_WhatAboutCave_03_34"); //Mam parê spraw na g³owie.
    AI_Output (other, self ,"DIA_Lou_WhatAboutCave_15_35"); //Nie przeszkadzam. Do zobaczenia.
};

