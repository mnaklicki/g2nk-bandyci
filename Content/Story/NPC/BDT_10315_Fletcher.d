instance BDT_10315_Fletcher (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Fletcher";
	npctype		=	npctype_main;
	guild 		=	GIL_BDT;
	flags       =   NPC_FLAG_IMMORTAL;
	level 		=	15;
	voice 		=	6;
	id 			=	10315;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 70;
	attribute[ATR_DEXTERITY] 	= 50;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 220;
	attribute[ATR_HITPOINTS] 	= 220;

	//-------- visuals --------
	// 			animations
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_P_Normal_Fletcher, BodyTex_N, ITAR_Bloodwyn_Addon);	
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	Mdl_SetModelFatness	(self, 0);
    	
    fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
	B_GiveNpcTalents (self);		
	
	//-------- inventory --------
	EquipItem	(self, ItMw_1h_Sld_Sword);
	EquipItem	(self, ItRw_Mil_Crossbow);
	
	B_CreateAmbientInv 	(self);

	//-------------Daily Routine-------------
	daily_routine = Rtn_Start_255;
};

FUNC VOID Rtn_Start_255 ()
{
   TA_Stand_Guarding   (06,00,20,00,"ADW_PATH_TO_BL_02");
   TA_Stand_Guarding   (20,00,00,00,"BANDIT_FIGHT");
   TA_Stand_Eating     (00,00,03,00,"BANDIT_FIGHT");
   TA_Stand_Drinking   (03,00,06,00,"BANDIT_FIGHT");   	
};
