INSTANCE DIA_Addon_Tonak_EXIT(C_INFO)
{
	npc             = STRF_1120_Addon_Tonak;
	nr              = 999;
	condition	= DIA_Addon_Tonak_EXIT_Condition;
	information	= DIA_Addon_Tonak_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Addon_Tonak_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Tonak_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

INSTANCE DIA_Addon_Telbor_EXIT(C_INFO)
{
	npc             = STRF_1121_Addon_Telbor;
	nr              = 999;
	condition	= DIA_Addon_Telbor_EXIT_Condition;
	information	= DIA_Addon_Telbor_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Addon_Telbor_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Telbor_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

INSTANCE DIA_Addon_Pardos_EXIT(C_INFO)
{
	npc             = STRF_1122_Addon_Pardos;
	nr              = 999;
	condition	= DIA_Addon_Pardos_EXIT_Condition;
	information	= DIA_Addon_Pardos_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Addon_Pardos_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Pardos_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

INSTANCE DIA_Addon_Monty_EXIT(C_INFO)
{
	npc             = STRF_1119_Addon_Monty;
	nr              = 999;
	condition	= DIA_Addon_Monty_EXIT_Condition;
	information	= DIA_Addon_Monty_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Addon_Monty_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Monty_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
