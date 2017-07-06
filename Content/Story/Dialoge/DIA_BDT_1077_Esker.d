//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Esker_EXIT(C_INFO)
{
	npc             = BDT_1077_Esker;
	nr              = 999;
	condition	= DIA_Esker_EXIT_Condition;
	information	= DIA_Esker_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Esker_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Esker_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WhatDoYouWant
//========================================

INSTANCE DIA_Esker_WhatDoYouWant (C_INFO)
{
   npc          = BDT_1077_Esker;
   nr           = 1;
   condition    = DIA_Esker_WhatDoYouWant_Condition;
   information  = DIA_Esker_WhatDoYouWant_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Esker_WhatDoYouWant_Condition()
{
    if (Npc_IsInState (self,ZS_Talk))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Esker_WhatDoYouWant_Info()
{
    AI_Output (self, other ,"DIA_Esker_WhatDoYouWant_03_01"); //Czego chcesz?
    AI_Output (other, self ,"DIA_Esker_WhatDoYouWant_15_02"); //Nic. Chcia³em pogadaæ. 
    AI_Output (self, other ,"DIA_Esker_WhatDoYouWant_03_03"); //Jestem Esker. Jak widzisz, nie mam nic do roboty.
    AI_Output (self, other ,"DIA_Esker_WhatDoYouWant_03_04"); //Byæ mo¿e Fletcher nied³ugo da mi jakieœ zadanie.
};

//========================================
//-----------------> WhereAreYouFrom
//========================================

INSTANCE DIA_Esker_WhereAreYouFrom (C_INFO)
{
   npc          = BDT_1077_Esker;
   nr           = 2;
   condition    = DIA_Esker_WhereAreYouFrom_Condition;
   information  = DIA_Esker_WhereAreYouFrom_Info;
   permanent	= FALSE;
   description	= "Sk¹d jesteœ?";
};

FUNC INT DIA_Esker_WhereAreYouFrom_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Esker_WhatDoYouWant))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Esker_WhereAreYouFrom_Info()
{
    AI_Output (other, self ,"DIA_Esker_WhereAreYouFrom_15_01"); //Sk¹d jesteœ?
    AI_Output (self, other ,"DIA_Esker_WhereAreYouFrom_03_02"); //Ka¿dy mnie ju¿ chyba o to zapyta³. Pochodzê z jednej z wysp Wschodniego Archipelagu.
    AI_Output (self, other ,"DIA_Esker_WhereAreYouFrom_03_03"); //Mia³em wyl¹dowaæ w kolonii, ale na mój konwój napad³a inna grupa bandytów.
    AI_Output (self, other ,"DIA_Esker_WhereAreYouFrom_03_04"); //Mia³em szczêœcie. Ta banda musia³a pomyliæ konwoje. Zdo³a³em uciec.
    AI_Output (self, other ,"DIA_Esker_WhereAreYouFrom_03_05"); //Œwietnie walczê mieczem i da³em sobie radê. A po jakiœ trzech miesi¹cach upad³a bariera.
    AI_Output (other, self ,"DIA_Esker_WhereAreYouFrom_15_06"); //I co by³o dalej?
    AI_Output (self, other ,"DIA_Esker_WhereAreYouFrom_03_07"); //Nale¿a³em ju¿ wtedy do bandytów. Znaczy do niewielkiej grupki.
    AI_Output (self, other ,"DIA_Esker_WhereAreYouFrom_03_08"); //Gdy wraca³em z polowania widzia³em, jak zostali zabici przez stra¿.
    AI_Output (self, other ,"DIA_Esker_WhereAreYouFrom_03_09"); //PóŸniej spotka³em Fletchera i czêœæ tej grupki. I tak oto wyl¹dowa³em tutaj.
    AI_Output (self, other ,"DIA_Esker_WhereAreYouFrom_03_10"); //A ty? To ty jesteœ ten morderca ¿o³nierzy?
    AI_Output (other, self ,"DIA_Esker_WhereAreYouFrom_15_11"); //Tak, to ja. Chocia¿ nie wiem, co mnie do tego sk³oni³o.
    AI_Output (self, other ,"DIA_Esker_WhereAreYouFrom_03_12"); //Czasami jedna chwila zmienia ¿ycie. Wiesz dlaczego mnie aresztowano?
    AI_Output (self, other ,"DIA_Esker_WhereAreYouFrom_03_13"); //Pewnej nocy us³ysza³em o nielegalnych walkach. Nawet nie zaczê³a siê moja walka, gdy wpad³o wojsko i aresztowa³o wszystkich. 
    AI_Output (self, other ,"DIA_Esker_WhereAreYouFrom_03_14"); //Ka¿dy bandyta to inna historia. 
    AI_Output (other, self ,"DIA_Esker_WhereAreYouFrom_15_15"); //Trudno siê nie zgodziæ.
    AI_Output (self, other ,"DIA_Esker_WhereAreYouFrom_03_16"); //Dam ci radê. Nie ka¿dy z nas jest taki ''mi³y''. Pamiêtaj, ¿e komuœ mo¿e nie spodobaæ siê twoja gêba. Miej siê na bacznoœci.
};

//========================================
//-----------------> WhatsUp
//========================================

INSTANCE DIA_Esker_WhatsUp (C_INFO)
{
   npc          = BDT_1077_Esker;
   nr           = 1;
   condition    = DIA_Esker_WhatsUp_Condition;
   information  = DIA_Esker_WhatsUp_Info;
   permanent	= FALSE;
   description	= "Co s³ychaæ?";
};

FUNC INT DIA_Esker_WhatsUp_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Esker_WhatDoYouWant))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Esker_WhatsUp_Info()
{
    AI_Output (other, self ,"DIA_Esker_WhatsUp_15_01"); //Co s³ychaæ?
    if (KAPITEL >= 3)
    {
        AI_Output (self, other ,"DIA_Esker_WhatsUp_03_02"); //Franko przej¹³ stery po Fletcherze. Lepiej uwa¿aj.
    }
    else
    {
        AI_Output (self, other ,"DIA_Esker_WhatsUp_03_03"); //Wszystko po staremu.
    };
};

//========================================
//-----------------> CanYouTeachMe
//========================================

INSTANCE DIA_Esker_CanYouTeachMe (C_INFO)
{
   npc          = BDT_1077_Esker;
   nr           = 1;
   condition    = DIA_Esker_CanYouTeachMe_Condition;
   information  = DIA_Esker_CanYouTeachMe_Info;
   permanent	= FALSE;
   description	= "Mo¿esz mnie pouczyæ walki?";
};

FUNC INT DIA_Esker_CanYouTeachMe_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Esker_WhatDoYouWant))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Esker_CanYouTeachMe_Info()
{
    AI_Output (other, self ,"DIA_Esker_CanYouTeachMe_15_01"); //Mo¿esz mnie pouczyæ walki?
    AI_Output (self, other ,"DIA_Esker_CanYouTeachMe_03_02"); //Pewnie. Walka broni¹ jednorêczn¹ to jedna z najlepszych sztuk.
    AI_Output (self, other ,"DIA_Esker_CanYouTeachMe_03_03"); //Warto mieæ przewagê szybkoœci nad przeciwnikiem.
    AI_Output (self, other ,"DIA_Esker_CanYouTeachMe_03_04"); //PrzychodŸ kiedy chcesz.
	EskerTeach1H = TRUE;
};

INSTANCE DIA_Esker_Teach(C_INFO)
{
	npc			= BDT_1077_Esker;
	nr			= 7;
	condition	= DIA_Esker_Teach_Condition;
	information	= DIA_Esker_Teach_Info;
	permanent	= TRUE;
	description = "Zacznijmy trening.";
};                       

FUNC INT DIA_Esker_Teach_Condition()
{
	if (EskerTeach1H == TRUE)
	{
		return TRUE;
	};	
};
 
FUNC VOID DIA_Esker_Teach_Info()
{	
	AI_Output (other,self ,"DIA_Esker_Teach_15_00"); //Zacznijmy trening.		
	Info_ClearChoices 	(DIA_Esker_Teach);
	Info_AddChoice 		(DIA_Esker_Teach,	DIALOG_BACK		,DIA_Esker_Teach_Back);
	Info_AddChoice		(DIA_Esker_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Esker_Teach_1H_1);
	Info_AddChoice		(DIA_Esker_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Esker_Teach_1H_5);
};

FUNC VOID DIA_Esker_Teach_Back ()
{
	Info_ClearChoices (DIA_Esker_Teach);
};

var int EskerOneTime;

FUNC VOID DIA_Esker_Teach_1H_1 ()
{
	if B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 1, 75)
	{
		if ((Npc_GetTalentSkill (other, NPC_TALENT_1H) == 1) && (EskerOneTime != 1))
		{
			AI_Output (self, other ,"DIA_Esker_Teach_03_01"); //Czas nabraæ wprawy we w³adaniu takim orê¿em.
			AI_Output (self, other ,"DIA_Esker_Teach_03_02"); //Rozstaw stopy szeroko, broñ trzymaj u boku, ostrzem do góry.
			AI_Output (self, other ,"DIA_Esker_Teach_03_03"); //Musisz nauczyæ siê zgraæ twoje ruchy z bezw³adnoœci¹ orê¿a.
			AI_Output (self, other ,"DIA_Esker_Teach_03_04"); //Dziêki temu twoje ruchy bêd¹ szybsze i bardziej zaskocz¹ przeciwnika.
			AI_Output (self, other ,"DIA_Esker_Teach_03_04"); //A i jeszcze coœ. Podczas walki zauwa¿ysz, ¿e twoje ataki spowoduj¹ wiêksze obra¿enia ni¿ zwykle. Oczywiœcie wraz z nauk¹ takie ataki bêd¹ zdarzaæ siê czêœciej.
			EskerOneTime = 1;
		};
		Info_ClearChoices 	(DIA_Esker_Teach);
		Info_AddChoice 		(DIA_Esker_Teach,	DIALOG_BACK		,DIA_Esker_Teach_Back);
		Info_AddChoice		(DIA_Esker_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Esker_Teach_1H_1);
		Info_AddChoice		(DIA_Esker_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Esker_Teach_1H_5);
	};
};
FUNC VOID DIA_Esker_Teach_1H_5 ()
{
	if B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 5, 75)
	{
		Info_ClearChoices 	(DIA_Esker_Teach);
		Info_AddChoice 		(DIA_Esker_Teach,	DIALOG_BACK		,DIA_Esker_Teach_Back);
		Info_AddChoice		(DIA_Esker_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Esker_Teach_1H_1);
		Info_AddChoice		(DIA_Esker_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Esker_Teach_1H_5);
	};	
};

//========================================
//-----------------> WheresArvo
//========================================

INSTANCE DIA_Esker_WheresArvo (C_INFO)
{
   npc          = BDT_1077_Esker;
   nr           = 1;
   condition    = DIA_Esker_WheresArvo_Condition;
   information  = DIA_Esker_WheresArvo_Info;
   permanent	= FALSE;
   description	= "Widzia³eœ Arvo?";
};

FUNC INT DIA_Esker_WheresArvo_Condition()
{
    if (MIS_Arvo == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Esker_WheresArvo_Info()
{
    AI_Output (other, self ,"DIA_Esker_WheresArvo_15_01"); //Widzia³eœ Arvo?
    AI_Output (self, other ,"DIA_Esker_WheresArvo_03_02"); //Nie. Spytaj kogoœ innego.
};

