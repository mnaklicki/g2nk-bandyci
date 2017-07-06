INSTANCE PIR_1352_Addon_AlligatorJack (Npc_Default)
{
	// ------ NSC ------
	name 		= "Jack Aligator";
	guild 		= GIL_PIR;
	id 			= 1352;
	voice 		= 12;
	flags       = NPC_FLAG_IMMORTAL;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Aivars ------
	aivar[AIV_FollowDist] = 800;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Piratensaebel);
		
	// ------ Inventory ------
	CreateInvItems (self, itpo_Health_02, 4);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_B_CorAngar, BodyTex_B, ITAR_PIR_M_Addon);	  
	Mdl_SetModelFatness	(self, 1.5);		
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,90); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1352;
};

FUNC VOID Rtn_Start_1352 ()
{	
	TA_Sleep			 (23,00,06,00,"ADW_PIRATECAMP_AJ_04");
	TA_Cook_Pan			 (06,00,08,30,"AD_PIRATECAMP_AJ_03");
	TA_Sit_Campfire		 (08,30,12,00,"AD_PIRATECAMP_AJ_03");
	TA_Stand_ArmsCrossed (12,30,19,00,"ADW_PIRATECAMP_WAY_07");	
	TA_Cook_Pan			 (19,00,20,30,"AD_PIRATECAMP_AJ_03");
	TA_Sit_Campfire		 (20,30,23,00,"AD_PIRATECAMP_AJ_03");
};
