INSTANCE PIR_1370_Addon_Angus (Npc_Default)
{
	// ------ NSC ------
	name 		= "Angus";
	guild 		= GIL_STRF;
	id 			= 1370;
	voice 		= 6;
	flags       = NPC_FLAG_IMMORTAL;															
	npctype		= NPCTYPE_MAIN;
	
	//aivars 
	aivar[AIV_NoFightParker] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Addon_PIR2hAxe);
	
	// ------ Inventory ------
	CreateInvItems (self, ItRi_Addon_MorgansRing_Mission, 1);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_NormalBart21, BodyTex_N, ITAR_PIR_M_Addon);	  
	Mdl_SetModelFatness	(self, 1.3);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1370;
};

FUNC VOID Rtn_Start_1370 ()
{	
	TA_Sit_Campfire			(20,00,01,00,"ADW_PIRATECAMP_BEACH_17"); 
	TA_Sit_Campfire			(01,00,20,00,"ADW_PIRATECAMP_BEACH_17"); 
};

FUNC VOID Rtn_Trade_1370 ()
{	
	TA_Stand_WP 	(05,00,20,00,"ADW_TRADE_ANGUS");
	TA_Stand_WP		(20,00,05,00,"ADW_TRADE_ANGUS");
};
