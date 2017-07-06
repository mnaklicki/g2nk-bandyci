instance BDT_1074_Addon_Edgor (Npc_Default)
{
	// ------ NSC ------
	name 		= "Edgor";
	guild 		= GIL_BDT;
	id 			= 1074;
	voice 		= 6;
	flags      	= NPC_FLAG_IMMORTAL;
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_1h_Sld_Sword);
	EquipItem (self, ItRw_Sld_Bow);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_NormalBart20, BodyTex_N, ITAR_BDT_M);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 65); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_1074;
};

FUNC VOID Rtn_Start_1074 ()
{
     TA_Sit_Bench 		(09,00,12,00,"ADW_SWAMP_SIT_BENCH_03"); 
     TA_Sit_Bench	    (12,00,09,00,"ADW_SWAMP_SIT_BENCH_03");			
};

FUNC VOID Rtn_Hunt_1074 ()
{
     TA_Guide_Player   (09,00,21,00,"ADW_BANDIT_VP1_09"); 
     TA_Guide_Player   (21,00,09,00,"ADW_BANDIT_VP1_09");			
};

FUNC VOID Rtn_Drink_1074 ()
{
     TA_Sit_Bench   (09,00,18,00,"ADW_SWAMP_SIT_BENCH_03"); 
     TA_Stand_Drinking   (18,00,20,00,"BL_INN_05_D");		
     TA_Sit_Bench   (20,00,09,00,"ADW_SWAMP_SIT_BENCH_03");			
	 
};
