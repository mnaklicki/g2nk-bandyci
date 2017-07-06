///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Fortuno_EXIT   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 999;
	condition   = DIA_Addon_Fortuno_EXIT_Condition;
	information = DIA_Addon_Fortuno_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Fortuno_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Fortuno_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//========================================
//-----------------> NiceArmour
//========================================

INSTANCE DIA_Addon_Fortuno_NiceArmour (C_INFO)
{
   npc          = BDT_1075_Addon_Fortuno;
   nr           = 1;
   condition    = DIA_Addon_Fortuno_NiceArmour_Condition;
   information  = DIA_Addon_Fortuno_NiceArmour_Info;
   permanent	= FALSE;
   description	= "Hmm, bardzo egzotyczny pancerz.";
};

FUNC INT DIA_Addon_Fortuno_NiceArmour_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Fletcher_GoodNews))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Fortuno_NiceArmour_Info()
{
    AI_Output (other, self ,"DIA_Addon_Fortuno_NiceArmour_15_01"); //Hmm, bardzo egzotyczny pancerz.
    AI_Output (self, other ,"DIA_Addon_Fortuno_NiceArmour_03_02"); //Hê? To dawny pancerz nowicjusza.
    AI_Output (other, self ,"DIA_Addon_Fortuno_NiceArmour_15_03"); //Nowicjusza? Coœ jak tych z klasztoru ognia w Khorinis?
    AI_Output (self, other ,"DIA_Addon_Fortuno_NiceArmour_03_04"); //Nigdy o nich nie s³ysza³em. Ja pochodzê z bractwa, które od dawna ju¿ nie istnieje.
    AI_Output (self, other ,"DIA_Addon_Fortuno_NiceArmour_03_05"); //Tam paliliœmy bagienne ziele. Taaak, ziele...
    AI_Output (other, self ,"DIA_Addon_Fortuno_NiceArmour_15_06"); //Mo¿e wpadnê póŸniej.
    AI_Output (self, other ,"DIA_Addon_Fortuno_NiceArmour_03_07"); //Nie, zaczekaj. Nie mogê siê st¹d ruszyæ, bo reszta tych rzezimieszków mnie okradnie.
    AI_Output (other, self ,"DIA_Addon_Fortuno_NiceArmour_15_08"); //Z czego?
    AI_Output (self, other ,"DIA_Addon_Fortuno_NiceArmour_03_09"); //Nie widzisz? Mam tutaj fajki wodne i trochê ziela. Jak st¹d pójdê to nic z tego mi nie zostanie. Musisz mi pomóc.
    AI_Output (other, self ,"DIA_Addon_Fortuno_NiceArmour_15_10"); //Jak mam ci niby pomóc?
    AI_Output (self, other ,"DIA_Addon_Fortuno_NiceArmour_03_11"); //Zbierz dla mnie bagienne ziele. Na bagnach roœnie tego bardzo du¿o. Potrzebujê dziesiêciu sztuk. Sam bym to zrobi³, ale no wiesz.
    AI_Output (other, self ,"DIA_Addon_Fortuno_NiceArmour_15_12"); //A co ja z tego bêdê mia³?
    AI_Output (self, other ,"DIA_Addon_Fortuno_NiceArmour_03_13"); //Hmm. Mam przy sobie pewien pierœcieñ od jednego guru.
    AI_Output (other, self ,"DIA_Addon_Fortuno_NiceArmour_15_14"); //Guru? By³eœ w sekcie? (zdziwienie)
    AI_Output (self, other ,"DIA_Addon_Fortuno_NiceArmour_03_15"); //Nie by³eœ tam, wiêc nie oceniaj.
    AI_Output (other, self ,"DIA_Addon_Fortuno_NiceArmour_15_16"); //Dobra. Mo¿esz po¿egnaæ siê z pierœcieniem, bo nied³ugo dostaniesz swoje ziele.
    AI_Output (self, other ,"DIA_Addon_Fortuno_NiceArmour_03_17"); //(podekscytowany) Œwietnie!
    MIS_Swampweed = LOG_RUNNING;

    Log_CreateTopic            (TOPIC_Swampweed, LOG_MISSION);
    Log_SetTopicStatus       (TOPIC_Swampweed, LOG_RUNNING);
    B_LogEntry                     (TOPIC_Swampweed,"Dziwak o imieniu Fortuno powiedzia³, ¿e jeœli przyniosê mu bagienne ziele, to w zamian otrzymam pierœcieñ. Nie s¹dzê, aby móg³ mnie oszukaæ. Zreszt¹, ten goœæ chyba bredzi³ i myœla³ o czymœ innym. Bardzo ciekawe osoby s¹ w tym obozie...");
};

//========================================
//-----------------> HeresYourWeed
//========================================

INSTANCE DIA_Addon_Fortuno_HeresYourWeed (C_INFO)
{
   npc          = BDT_1075_Addon_Fortuno;
   nr           = 2;
   condition    = DIA_Addon_Fortuno_HeresYourWeed_Condition;
   information  = DIA_Addon_Fortuno_HeresYourWeed_Info;
   permanent	= FALSE;
   description	= "Mam twoje ³odygi.";
};

FUNC INT DIA_Addon_Fortuno_HeresYourWeed_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Fortuno_NiceArmour))
    && (Npc_HasItems (other, ItPl_SwampHerb) >=10)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Fortuno_HeresYourWeed_Info()
{
    AI_Output (other, self ,"DIA_Addon_Fortuno_HeresYourWeed_15_01"); //Mam twoje ³odygi.
    AI_Output (self, other ,"DIA_Addon_Fortuno_HeresYourWeed_03_02"); //Doskonale. Dziêki temu skupiê swoj¹ magiczn¹ moc tak jak robili to guru.
    AI_Output (other, self ,"DIA_Addon_Fortuno_HeresYourWeed_15_03"); //Do czego skupisz swoje magiczne moce?
    AI_Output (self, other ,"DIA_Addon_Fortuno_HeresYourWeed_03_04"); //Ahh, niewa¿ne. Proszê, oto pierœcieñ.
    AI_Output (other, self ,"DIA_Addon_Fortuno_HeresYourWeed_15_05"); //Dziêki.
	B_GiveInvItems (other, self, ItPl_SwampHerb, 10);
    CreateInvItems (self, ItRi_Protection, 1);
    B_GiveInvItems (self, other, ItRi_Protection, 1);
    B_LogEntry                     (TOPIC_Swampweed,"Fortuno otrzyma³ ode mnie zielsko. Gada³ coœ o magicznej mocy, skupieniu i o guru. Dziwny cz³owiek i jeszcze dziwniejsza sekta. Ale w zamian otrzyma³em cenny pierœcieñ.");
    Log_SetTopicStatus       (TOPIC_Swampweed, LOG_SUCCESS);
    MIS_Swampweed = LOG_SUCCESS;
};

//========================================
//-----------------> Brainwashed
//========================================

INSTANCE DIA_Addon_Fortuno_Brainwashed (C_INFO)
{
   npc          = BDT_1075_Addon_Fortuno;
   nr           = 1;
   condition    = DIA_Addon_Fortuno_Brainwashed_Condition;
   information  = DIA_Addon_Fortuno_Brainwashed_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Fortuno_Brainwashed_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Miguel_AreYouOkay))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Fortuno_Brainwashed_Info()
{
    AI_Output (self, other ,"DIA_Addon_Fortuno_Brainwashed_03_01"); //Zielony... Nowicjusz...
    AI_Output (other, self ,"DIA_Addon_Fortuno_Brainwashed_15_02"); //Fortuno, wiesz coœ w sprawie mojego zatrucia?
    AI_Output (self, other ,"DIA_Addon_Fortuno_Brainwashed_03_03"); //On... Pojawi³ siê znik¹d... 
    AI_Output (self, other ,"DIA_Addon_Fortuno_Brainwashed_03_04"); //Krypta... Nowicjusz...
    AI_Output (other, self ,"DIA_Addon_Fortuno_Brainwashed_15_05"); //(do siebie) Chyba mu odbi³o.
    B_LogEntry                     (TOPIC_Illness,"Fortuno nie by³ w stanie ze mn¹ rozmawiaæ. Nie pomo¿e mi w ¿aden sposób.");
};

//========================================
//-----------------> Hello
//========================================

INSTANCE DIA_Addon_Fortuno_Hello (C_INFO)
{
   npc          = BDT_1075_Addon_Fortuno;
   nr           = 1;
   condition    = DIA_Addon_Fortuno_Hello_Condition;
   information  = DIA_Addon_Fortuno_Hello_Info;
   permanent	= FALSE;
   description	= "Witaj.";
};

FUNC INT DIA_Addon_Fortuno_Hello_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Addon_Fortuno_Hello_Info()
{
    AI_Output (other, self ,"DIA_Addon_Fortuno_Hello_15_01"); //Witaj.
    AI_Output (self, other ,"DIA_Addon_Fortuno_Hello_03_02"); //Witaj nieznajomy. Jestem Fortuno.
    AI_Output (other, self ,"DIA_Addon_Fortuno_Hello_15_03"); //Vinc.
    AI_Output (self, other ,"DIA_Addon_Fortuno_Hello_03_04"); //Jeœli chcesz sobie zapaliæ to podejdŸ do tamtej fajki.
    AI_Output (self, other ,"DIA_Addon_Fortuno_Hello_03_05"); //Ale oczywiœcie musisz mieæ swój tytoñ.
    AI_Output (other, self ,"DIA_Addon_Fortuno_Hello_15_06"); //Jasna sprawa.
};

//========================================
//-----------------> SwampCamp
//========================================

INSTANCE DIA_Addon_Fortuno_SwampCamp (C_INFO)
{
   npc          = BDT_1075_Addon_Fortuno;
   nr           = 2;
   condition    = DIA_Addon_Fortuno_SwampCamp_Condition;
   information  = DIA_Addon_Fortuno_SwampCamp_Info;
   permanent	= FALSE;
   description	= "Wiêc jesteœ z obozu na bagnie.";
};

FUNC INT DIA_Addon_Fortuno_SwampCamp_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Snaf_YoureFromTheColony))
    {
		return TRUE;
    };
};


FUNC VOID DIA_Addon_Fortuno_SwampCamp_Info()
{
    AI_Output (other, self ,"DIA_Addon_Fortuno_SwampCamp_15_01"); //Wiêc jesteœ z obozu na bagnie.
    AI_Output (self, other ,"DIA_Addon_Fortuno_SwampCamp_03_02"); //Tak. To by³ wspania³y obóz.
    AI_Output (other, self ,"DIA_Addon_Fortuno_SwampCamp_15_03"); //Opowiesz mi coœ o nim?
    AI_Output (self, other ,"DIA_Addon_Fortuno_SwampCamp_03_04"); //Naszym duchowym przywódc¹ by³ Y'berion. By³ to najwy¿szy i najpotê¿niejszy guru.
    AI_Output (self, other ,"DIA_Addon_Fortuno_SwampCamp_03_05"); //Oprócz niego by³o tak¿e kilku innych guru. Baal Cadar zajmowa³ siê nauczaniem magii.
    AI_Output (self, other ,"DIA_Addon_Fortuno_SwampCamp_03_06"); //Baal Tondral naucza³ nowicjuszy o Œni¹cym, Baal Tyon wyg³asza³ opowieœci o jego potêdze...
    AI_Output (other, self ,"DIA_Addon_Fortuno_SwampCamp_15_07"); //Dobrze. A reszta obozu?
    AI_Output (self, other ,"DIA_Addon_Fortuno_SwampCamp_03_08"); //Cor Angar by³ dowódc¹ stra¿ników œwi¹tynnych. To by³a nasza stra¿.
    AI_Output (self, other ,"DIA_Addon_Fortuno_SwampCamp_03_09"); //Dyscyplin¹ dorównywali królewskiej armii, a nawet j¹ przewy¿szali...
    AI_Output (self, other ,"DIA_Addon_Fortuno_SwampCamp_03_10"); //I byliœmy my, czyli nowicjusze.
    AI_Output (self, other ,"DIA_Addon_Fortuno_SwampCamp_03_11"); //W obozie zajmowa³em siê sprzeda¿¹ bagiennego ziela.
    AI_Output (other, self ,"DIA_Addon_Fortuno_SwampCamp_15_12"); //Gdzie reszta twoich pobratymców?
    AI_Output (self, other ,"DIA_Addon_Fortuno_SwampCamp_03_13"); //Niestety, pad³a czarna godzina dla naszego zgromadzenia. Dowiedzieliœmy siê, ¿e Œni¹cy to demon.
    AI_Output (other, self ,"DIA_Addon_Fortuno_SwampCamp_15_14"); //Rzeczywiœcie to by³a sekta. (do siebie)
    AI_Output (self, other ,"DIA_Addon_Fortuno_SwampCamp_03_15"); //Odwróciliœmy siê od niego i przestaliœmy w niego wierzyæ.
    AI_Output (self, other ,"DIA_Addon_Fortuno_SwampCamp_03_16"); //Po paru dniach ogarnê³a nas ciemnoœæ. Ból g³owy nie da³ nam spokoju.
    AI_Output (self, other ,"DIA_Addon_Fortuno_SwampCamp_03_17"); //A¿ wszyscy uciekli w ró¿ne strony... Nikogo wiêcej nie zobaczy³em.
    AI_Output (other, self ,"DIA_Addon_Fortuno_SwampCamp_15_18"); //A co z tob¹?
    AI_Output (self, other ,"DIA_Addon_Fortuno_SwampCamp_03_19"); //Nie mam pojêcia co siê dok³adnie sta³o.
    AI_Output (self, other ,"DIA_Addon_Fortuno_SwampCamp_03_20"); //Obudzi³em siê przy prze³êczy, a nade mn¹ sta³ Snaf i Scatty. Zabrali mnie ze sob¹.
    AI_Output (self, other ,"DIA_Addon_Fortuno_SwampCamp_03_21"); //Bóle g³owy usta³y, choæ mia³em koszmary.
    AI_Output (other, self ,"DIA_Addon_Fortuno_SwampCamp_15_22"); //Co ci siê œni³o?
    AI_Output (self, other ,"DIA_Addon_Fortuno_SwampCamp_03_23"); //Wielki cieñ i ludzie w kapturach. Oni patrzyli i wskazywali na mnie rêk¹.
    AI_Output (self, other ,"DIA_Addon_Fortuno_SwampCamp_03_24"); //(ze strachem) To by³o tak rzeczywiste...
    AI_Output (self, other ,"DIA_Addon_Fortuno_SwampCamp_03_25"); //I wtedy pojawi³o siê œwiat³o.
    AI_Output (other, self ,"DIA_Addon_Fortuno_SwampCamp_15_26"); //Œwiat³o?
    AI_Output (self, other ,"DIA_Addon_Fortuno_SwampCamp_03_27"); //Zakapturzone postacie uciek³y, a cieñ znikn¹³. Us³ysza³em: wiara w spokój ciê uratuje.
    AI_Output (other, self ,"DIA_Addon_Fortuno_SwampCamp_15_28"); //To móg³ byæ Adanos.
    AI_Output (self, other ,"DIA_Addon_Fortuno_SwampCamp_03_29"); //Uzna³em to za ³askê, drug¹ szansê od samego boga równowagi.
    AI_Output (other, self ,"DIA_Addon_Fortuno_SwampCamp_15_30"); //Jak trwoga to do boga... (do siebie)
    AI_Output (self, other ,"DIA_Addon_Fortuno_SwampCamp_03_31"); //Hê?
    AI_Output (other, self ,"DIA_Addon_Fortuno_SwampCamp_15_32"); //Nie, nic.
    AI_Output (self, other ,"DIA_Addon_Fortuno_SwampCamp_03_33"); //Jednak ¿a³ujê, ¿e nie ma ju¿ obozu. Przepad³a wiedza i badania guru...
    AI_Output (other, self ,"DIA_Addon_Fortuno_SwampCamp_15_34"); //Muszê lecieæ.
    AI_Output (self, other ,"DIA_Addon_Fortuno_SwampCamp_03_35"); //Dziêki za rozmowê.
};

