instance BDT_10319_DeadBandit (Npc_Default)
{
	// ------ NSC ------
	name 		= "Martwy bandyta";
	guild 		= GIL_BDT;
	id 			= 10319;
	voice 		= 1;
	flags      	= 0;
	npctype		= NPCTYPE_BL_AMBIENT;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self,2);
	attribute[ATR_HITPOINTS_MAX]	= 1;
	attribute[ATR_HITPOINTS] 		= 1;

	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_NORMAL;
	CreateInvItems	(self, ItMi_OldCoin, 1);	
	
	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_N_Important_Arto, BodyTex_N, ITAR_BDT_M);	
	Mdl_SetModelFatness	(self, -1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_10319;
};

FUNC VOID Rtn_Start_10319 ()
{
   TA_Stand_WP      (10,00,12,00,"BL_DOWN_CENTER_07_B");
   TA_Stand_WP      (12,00,10,00,"BL_DOWN_CENTER_07_B");		
};			
