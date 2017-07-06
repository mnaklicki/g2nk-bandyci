//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Azuro_EXIT(C_INFO)
{
	npc             = BDT_10001_Azuro;
	nr              = 999;
	condition	= DIA_Azuro_EXIT_Condition;
	information	= DIA_Azuro_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Azuro_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Azuro_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WhoAreYou
//========================================

INSTANCE DIA_Azuro_WhoAreYou (C_INFO)
{
   npc          = BDT_10001_Azuro;
   nr           = 1;
   condition    = DIA_Azuro_WhoAreYou_Condition;
   information  = DIA_Azuro_WhoAreYou_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Azuro_WhoAreYou_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Azuro_WhoAreYou_Info()
{
    AI_Output (other, self ,"DIA_Azuro_WhoAreYou_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Azuro_WhoAreYou_03_02"); //Em, zasch³o mi w gardle. Nie masz piwa przy sobie?
    if (Npc_HasItems (other, ItFo_Beer) >=1)
    {
        AI_Output (other, self ,"DIA_Azuro_WhoAreYou_15_03"); //Wypij nasze zdrowie.
        AI_Output (self, other ,"DIA_Azuro_WhoAreYou_03_04"); //Dziêki!
		B_GiveInvItems (other, self, ItFo_Beer, 1);
        B_UseItem (self, ItFo_Beer);
    }
    else
    {
        AI_Output (other, self ,"DIA_Azuro_WhoAreYou_15_05"); //Nie mam.
        AI_Output (self, other ,"DIA_Azuro_WhoAreYou_03_06"); //Dobra, niewa¿ne.
    };
    AI_Output (self, other ,"DIA_Azuro_WhoAreYou_03_07"); //Jestem Azuro, przyszed³em tu wraz z Thorusem i reszt¹. To by³a d³uga wêdrówka, a by³o tu jeszcze gorzej.
    AI_Output (self, other ,"DIA_Azuro_WhoAreYou_03_08"); //Pe³no szczurów tu siê zalêg³o, a w dodatku przez parê dni musieliœmy zabijaæ pe³zacze z kopalni.
    AI_Output (self, other ,"DIA_Azuro_WhoAreYou_03_09"); //Przynajmniej dziêki tej zasranej kopalni nie ma czêœci z nas.
    AI_Output (other, self ,"DIA_Azuro_WhoAreYou_15_10"); //Jak to?
    AI_Output (self, other ,"DIA_Azuro_WhoAreYou_03_11"); //Nie s³ysza³eœ? Gdy czêœæ ch³opaków dowiedzia³a siê, ¿e jest tam z³oto, to zaczêli siê o nie zabijaæ.
    AI_Output (self, other ,"DIA_Azuro_WhoAreYou_03_12"); //I wtedy Kruk zabi³ paru z nich. Od teraz nie ma tam wstêpu. Ciesz siê, ¿e ciê tam nie by³o.
    AI_Output (self, other ,"DIA_Azuro_WhoAreYou_03_13"); //A ty jak masz na imiê?
    AI_Output (other, self ,"DIA_Azuro_WhoAreYou_15_14"); //Jestem Vinc, niedawno mieszka³em w Khorinis.
    AI_Output (self, other ,"DIA_Azuro_WhoAreYou_03_15"); //Aaa, przypominam sobie. To ty zabi³eœ dwóch ¿o³nierzy?
    AI_Output (other, self ,"DIA_Azuro_WhoAreYou_15_16"); //Tak. Eskortowali mnie do kolonii.
    AI_Output (self, other ,"DIA_Azuro_WhoAreYou_03_17"); //He he. Mieli przykr¹ niespodziankê.
};

//========================================
//-----------------> WereYouAGuard
//========================================

INSTANCE DIA_Azuro_WereYouAGuard (C_INFO)
{
   npc          = BDT_10001_Azuro;
   nr           = 2;
   condition    = DIA_Azuro_WereYouAGuard_Condition;
   information  = DIA_Azuro_WereYouAGuard_Info;
   permanent	= FALSE;
   description	= "Sk¹d taki pancerz? By³eœ stra¿nikiem?";
};

FUNC INT DIA_Azuro_WereYouAGuard_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Azuro_WhoAreYou))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Azuro_WereYouAGuard_Info()
{
    AI_Output (other, self ,"DIA_Azuro_WereYouAGuard_15_01"); //Sk¹d taki pancerz? By³eœ stra¿nikiem?
    AI_Output (self, other ,"DIA_Azuro_WereYouAGuard_03_02"); //Zgadza siê. Dosta³em awans od Thorusa po tym jak zabi³em szkodnika z Nowego Obozu.
    AI_Output (other, self ,"DIA_Azuro_WereYouAGuard_15_03"); //Nowy Obóz?
    AI_Output (self, other ,"DIA_Azuro_WereYouAGuard_03_04"); //W kolonii by³o kilka obozów. Najstarszym by³ Stary Obóz. Chocia¿ na pocz¹tku to by³ zamek jakiegoœ lorda Tymor... Tymer... Cholera, nie pamiêtam.
    AI_Output (self, other ,"DIA_Azuro_WereYouAGuard_03_05"); //By³ jeszcze Nowy Obóz i Sekta.
    AI_Output (self, other ,"DIA_Azuro_WereYouAGuard_03_06"); //Nie ma to jak mieszkaæ na œmierdz¹cym bagnie i paliæ zielsko wœród komarów i innego œmiecia.
    AI_Output (other, self ,"DIA_Azuro_WereYouAGuard_15_07"); //Ciekawa ta kolonia...
    AI_Output (self, other ,"DIA_Azuro_WereYouAGuard_03_08"); //Szybko byœ zmieni³ zdanie o niej. By³em w kolonii dwa lata. I pozna³em j¹ doœæ dobrze.
    AI_Output (self, other ,"DIA_Azuro_WereYouAGuard_03_09"); //Ale jeœli chcesz wiêcej opowiastek o kolonii, to idŸ do kucharza Snafa.
    AI_Output (self, other ,"DIA_Azuro_WereYouAGuard_03_10"); //Ten wie ca³kiem sporo.
};

//========================================
//-----------------> HowWasTheColony
//========================================

INSTANCE DIA_Azuro_HowWasTheColony (C_INFO)
{
   npc          = BDT_10001_Azuro;
   nr           = 3;
   condition    = DIA_Azuro_HowWasTheColony_Condition;
   information  = DIA_Azuro_HowWasTheColony_Info;
   permanent	= FALSE;
   description	= "Jak zapamiêta³eœ koloniê?";
};

FUNC INT DIA_Azuro_HowWasTheColony_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Azuro_WhoAreYou))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Azuro_HowWasTheColony_Info()
{
    AI_Output (other, self ,"DIA_Azuro_HowWasTheColony_15_01"); //Jak zapamiêta³eœ koloniê?
    AI_Output (self, other ,"DIA_Azuro_HowWasTheColony_03_02"); //Cholera, zadajesz du¿o pytañ, ale ci odpowiem. Bo co mam lepszego do roboty?
    AI_Output (self, other ,"DIA_Azuro_HowWasTheColony_03_03"); //By³o parê osób które zapamiêta³em dobrze. Na przyk³ad Skorpiona.
    AI_Output (other, self ,"DIA_Azuro_HowWasTheColony_15_04"); //Skorpiona?
    AI_Output (self, other ,"DIA_Azuro_HowWasTheColony_03_05"); //Uczy³ ch³opaków jak strzelaæ z kuszy. Przy okazji nauczy³ i mnie.
    AI_Output (self, other ,"DIA_Azuro_HowWasTheColony_03_06"); //Ale pewnego dnia znikn¹³. A wraz z nim zniknê³o parê cacuszek ze zbrojowni.
    AI_Output (other, self ,"DIA_Azuro_HowWasTheColony_15_07"); //Dlaczego odszed³?
    AI_Output (self, other ,"DIA_Azuro_HowWasTheColony_03_08"); //Nasz obóz mia³ kopalniê. Paru kopaczy przybieg³o i zda³o relacjê z tego, co siê tam sta³o.
    AI_Output (self, other ,"DIA_Azuro_HowWasTheColony_03_09"); //Kopalnia siê zawali³a! Ponoæ Gomez siê nieŸle wkurzy³.
    AI_Output (self, other ,"DIA_Azuro_HowWasTheColony_03_10"); //Bez rudy handel z królem by³ na straconej pozycji. Nie by³o bez niej jedzenia, picia i ca³ej reszty.
    AI_Output (self, other ,"DIA_Azuro_HowWasTheColony_03_11"); //Gomez postanowi³ zaatakowaæ kopalniê Nowego Obozu. A sprzeciwili siê temu magowie ognia.
    AI_Output (self, other ,"DIA_Azuro_HowWasTheColony_03_12"); //Banda arogantów. No, mo¿e nie licz¹c jednego maga. By³ m³ody, a przynajmniej wygl¹da³ na takiego.
    AI_Output (self, other ,"DIA_Azuro_HowWasTheColony_03_13"); //Jak mu tam by³o... Milto? Miltes? Nieee. Cholera, nie pamiêtam.
    AI_Output (self, other ,"DIA_Azuro_HowWasTheColony_03_14"); //Ale wracaj¹c. Wiêc ci magowie, nie licz¹c tego m³odego, zabronili atakowaæ mu kopalni Nowego Obozu.
    AI_Output (self, other ,"DIA_Azuro_HowWasTheColony_03_15"); //I oni wszyscy zginêli. Potem jakieœ dwa tuziny stra¿ników na czele z Szakalem ruszy³y na kopalniê.
    AI_Output (self, other ,"DIA_Azuro_HowWasTheColony_03_16"); //I wtedy Skorpion siê jakoœ ulotni³.
    AI_Output (self, other ,"DIA_Azuro_HowWasTheColony_03_17"); //Pamiêtam tak¿e dobrze Skipa i Stone'a. Ten pierwszy handlowa³ broni¹ na zamku, a Stone by³ kowalem. To on wyku³ ten pancerz.
    AI_Output (self, other ,"DIA_Azuro_HowWasTheColony_03_18"); //Choæ czêœæ pancerzy pochodzi z cia³ zabitych ¿o³nierzy. Podczas buntu, Gomez i reszta zdjêli z nich te zbroje.
    AI_Output (self, other ,"DIA_Azuro_HowWasTheColony_03_19"); //Stone bardzo szybko nauczy³ siê wykonywaæ te pancerze.
    AI_Output (other, self ,"DIA_Azuro_HowWasTheColony_15_20"); //A co z nimi siê sta³o?
    AI_Output (self, other ,"DIA_Azuro_HowWasTheColony_03_21"); //Tak szczerze to nie wiem. Gdy wyruszy³em wraz z Thorusem i reszt¹, nic o nich nie wspomnieli. I nie s¹dzê, ¿eby zostali zabici.
    AI_Output (self, other ,"DIA_Azuro_HowWasTheColony_03_22"); //Wed³ug mnie uda³o im siê zbiec z kolonii.
};

//========================================
//-----------------> HowDidBecomeGuard
//========================================

INSTANCE DIA_Azuro_HowDidBecomeGuard (C_INFO)
{
   npc          = BDT_10001_Azuro;
   nr           = 4;
   condition    = DIA_Azuro_HowDidBecomeGuard_Condition;
   information  = DIA_Azuro_HowDidBecomeGuard_Info;
   permanent	= FALSE;
   description	= "Mówi³eœ o awansie od Thorusa. Jak go dosta³eœ?";
};

FUNC INT DIA_Azuro_HowDidBecomeGuard_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Azuro_WereYouAGuard))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Azuro_HowDidBecomeGuard_Info()
{
    AI_Output (other, self ,"DIA_Azuro_HowDidBecomeGuard_15_01"); //Mówi³eœ o awansie od Thorusa. Jak go dosta³eœ?
    AI_Output (self, other ,"DIA_Azuro_HowDidBecomeGuard_03_02"); //Ca³kiem prosto. Jako cieñ dosta³em zadanie pójœcia do kopalni i wtedy zobaczy³em jak jeden ze szkodników okrada³ skrzyniê.
    AI_Output (self, other ,"DIA_Azuro_HowDidBecomeGuard_03_03"); //Z³odziejaszek mia³ przy sobie du¿o cennych rzeczy. W tym pierœcieñ szefa kopalni.
    AI_Output (self, other ,"DIA_Azuro_HowDidBecomeGuard_03_04"); //Wieœæ o czynie szybko siê rozesz³a i Thorus da³ mi szansê bycia stra¿nikiem. Dosta³em pancerz i zacz¹³em s³u¿bê.
};

//========================================
//-----------------> AnyNews
//========================================

INSTANCE DIA_Azuro_AnyNews (C_INFO)
{
   npc          = BDT_10001_Azuro;
   nr           = 5;
   condition    = DIA_Azuro_AnyNews_Condition;
   information  = DIA_Azuro_AnyNews_Info;
   permanent	= TRUE;
   description	= "Coœ nowego?";
};

FUNC INT DIA_Azuro_AnyNews_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Azuro_WhoAreYou))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Azuro_AnyNews_Info()
{
    AI_Output (other, self ,"DIA_Azuro_AnyNews_15_01"); //Coœ nowego?
    if (KAPITEL == 2)
    {
        AI_Output (self, other ,"DIA_Azuro_AnyNews_03_02"); //Nie, wszystko po staremu.
    }
    else if (KAPITEL == 3)
    {
        AI_Output (self, other ,"DIA_Azuro_AnyNews_03_03"); //Ponoæ otwarto jak¹œ kryptê. Cholera, dobrze, ¿e mnie tam nie by³o.
    };
};

