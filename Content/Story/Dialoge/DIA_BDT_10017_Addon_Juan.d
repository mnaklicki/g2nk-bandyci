//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Huan_EXIT(C_INFO)
{
	npc             = BDT_10017_Addon_Juan;
	nr              = 999;
	condition	= DIA_Huan_EXIT_Condition;
	information	= DIA_Huan_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Huan_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Huan_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Finale
//========================================

INSTANCE DIA_Huan_Finale (C_INFO)
{
   npc          = BDT_10017_Addon_Juan;
   nr           = 1;
   condition    = DIA_Huan_Finale_Condition;
   information  = DIA_Huan_Finale_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Huan_Finale_Condition()
{
    if ((MIS_Arvo == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Arvo_Finale)))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Huan_Finale_Info()
{
    var c_npc Arvo;    Arvo = Hlp_GetNpc(BDT_10316_Arvo); 
    var c_npc Huan;     Huan = Hlp_GetNpc(BDT_10017_Addon_Juan);
    
    TRIA_Invite(Arvo); 
    TRIA_Start();          

    TRIA_Next(Huan);

    AI_Output (self, other ,"DIA_Huan_Finale_03_06"); //Pozdrowienia od Estebana.

    TRIA_Next(Arvo);

    AI_Output (self, other ,"DIA_Huan_Finale_03_07"); //I Franko.
    AI_Output (other, self ,"DIA_Huan_Finale_15_08"); //(ko³ysa siê) Aaa...

    TRIA_Next(Huan);

    AI_Output (self, other ,"DIA_Huan_Finale_03_09"); //Co prawda Arvo nie spisa³ siê przy truciŸnie, ale teraz naprawi swój b³¹d.
    AI_Output (other, self ,"DIA_Huan_Finale_15_10"); //(os³abionym g³osem) Czemu... ?

    TRIA_Next(Arvo);

    AI_Output (self, other ,"DIA_Huan_Finale_03_11"); //Przyszed³eœ znik¹d i pi¹³eœ siê w obozie zbyt wysoko.
    AI_Output (self, other ,"DIA_Huan_Finale_03_12"); //A to przeszkadza³o niektórym.

    TRIA_Next(Huan);

    AI_Output (self, other ,"DIA_Huan_Finale_03_13"); //Masz coœ do powiedzenia przed œmierci¹?

    Info_ClearChoices		(DIA_Huan_Finale);
    Info_AddChoice		(DIA_Huan_Finale, "(nic nie mówimy)", DIA_Arvo_Finale_Nothing);
    Info_AddChoice		(DIA_Huan_Finale, "Œwiat jest moim wyobra¿eniem.", DIA_Arvo_Finale_Quote);
    Info_AddChoice		(DIA_Huan_Finale, "(próbujemy wyci¹gn¹æ broñ)", DIA_Arvo_Finale_TakeOutWeapon);
};

FUNC VOID DIA_Arvo_Finale_Nothing()
{
    AI_Output (other, self ,"DIA_Huan_Finale_Nothing_15_01"); //(nic nie mówimy)
    AI_Output (self, other ,"DIA_Huan_Finale_Nothing_03_02"); //Tak myœla³em.
	
    TRIA_Finish(); 
	AI_StopProcessInfos (BDT_10316_Arvo);
    Info_ClearChoices		(DIA_Huan_Finale);
    AI_StopProcessInfos (self);
};

FUNC VOID DIA_Arvo_Finale_Quote()
{
    AI_Output (other, self ,"DIA_Huan_Finale_Quote_15_01"); //Œwiat jest moim wyobra¿eniem.
    AI_Output (self, other ,"DIA_Huan_Finale_Quote_03_02"); //Jaasne. (arogancko)
	
    TRIA_Finish(); 
	AI_StopProcessInfos (BDT_10316_Arvo);
    Info_ClearChoices		(DIA_Huan_Finale);
    AI_StopProcessInfos (self);
};

FUNC VOID DIA_Arvo_Finale_TakeOutWeapon()
{
    AI_ReadyMeleeWeapon (other);
    AI_Output (self, other ,"DIA_Huan_Finale_TakeOutWeapon_03_01"); //Z³y wybór!

    TRIA_Finish(); 
	AI_StopProcessInfos (BDT_10316_Arvo);
    Info_ClearChoices		(DIA_Huan_Finale);
    AI_StopProcessInfos (self);
};

//========================================
//-----------------> WhoAreYou
//========================================

INSTANCE DIA_Addon_Juan_WhoAreYou (C_INFO)
{
   npc          = BDT_10017_Addon_Juan;
   nr           = 1;
   condition    = DIA_Addon_Juan_WhoAreYou_Condition;
   information  = DIA_Addon_Juan_WhoAreYou_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Addon_Juan_WhoAreYou_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Addon_Juan_WhoAreYou_Info()
{
    AI_Output (other, self ,"DIA_Addon_Juan_WhoAreYou_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Addon_Juan_WhoAreYou_03_02"); //Nie twój interes wiedzieæ. Nie mam czasu na pogawêdki.
};

//========================================
//-----------------> HowAreYou
//========================================

INSTANCE DIA_Addon_Juan_HowAreYou (C_INFO)
{
   npc          = BDT_10017_Addon_Juan;
   nr           = 2;
   condition    = DIA_Addon_Juan_HowAreYou_Condition;
   information  = DIA_Addon_Juan_HowAreYou_Info;
   permanent	= TRUE;
   description	= "Co tam?";
};

FUNC INT DIA_Addon_Juan_HowAreYou_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Juan_WhoAreYou))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Juan_HowAreYou_Info()
{
    AI_Output (other, self ,"DIA_Addon_Juan_HowAreYou_15_01"); //Co tam?
    AI_Output (self, other ,"DIA_Addon_Juan_HowAreYou_03_02"); //Nie przypominam sobie, ¿ebyœmy byli kolegami. Dla swojego dobra – odwal siê.
    AI_StopProcessInfos	(self);
};

