instance BDT_10320_Butch (Npc_Default)
{
	// ------ NSC ------
	name 		= "Butch";
	guild 		= GIL_BDT;
	id 			= 10320;
	voice 		= 6;
	flags      	= 0;
	npctype		= NPCTYPE_BL_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_2h_Sld_Axe);
	CreateInvItems	(self, ItMi_OldCoin, 1);	
	CreateInvItems	(self, ItRi_Prot_Edge_02, 1);	
	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_NormalBart09, BodyTex_N, ITAR_BDT_H);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 60); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_10320;
};
FUNC VOID Rtn_Start_10320()
{
	TA_Stand_WP	(06,00,12,00,"ADW_ENTRANCE_RUIN2_02");
	TA_Stand_WP	(12,00,06,00,"ADW_ENTRANCE_RUIN2_02");
};
