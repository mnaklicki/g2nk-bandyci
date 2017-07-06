INSTANCE PIR_1355_Addon_Skip (Npc_Default)
{
	// ------ NSC ------
	name 		= "Skip";
	guild 		= GIL_STRF;
	id 			= 1355;
	voice 		= 8;
	flags       = NPC_FLAG_IMMORTAL;															
	npctype		= NPCTYPE_MAIN;
	
	//aivars 
	aivar[AIV_NoFightParker] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;

	// ------ Aivars ------
	aivar[AIV_FollowDist] = 300;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_ShortSword2);
	EquipItem (self, ItRw_sld_bow); 
	
	// ------ Inventory ------
	CreateInvItems (self, itpo_Health_03, 2);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", Face_N_Pirat01, BodyTex_N, ITAR_PIR_L_Addon);
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,70); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1355;
};

FUNC VOID Rtn_Start_1355 ()
{	
	TA_Stand_WP				(07,30,11,30,"ADW_PIRATECAMP_HUT3_01");
	TA_Sit_Bench			(11,30,20,30,"ADW_PIRATECAMP_HUT3_BENCH");	
	TA_Sit_Campfire			(20,30,01,30,"ADW_PIRATECAMP_BEACH_17"); 
	TA_Stand_Drinking		(01,30,02,30,"ADW_PIRATECAMP_BEACH_17"); 
	TA_Sleep				(02,30,07,30,"ADW_PIRATECAMP_HUT3_02");
};

FUNC VOID Rtn_Trade_1355 ()
{	
	TA_Stand_WP				(07,00,11,00,"ADW_ENTRANCE_2_PIRATECAMP_02");
	TA_Stand_WP				(11,00,07,00,"ADW_ENTRANCE_2_PIRATECAMP_02");	
};
