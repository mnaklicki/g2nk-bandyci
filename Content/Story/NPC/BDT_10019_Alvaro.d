instance BDT_10019_Alvaro (Npc_Default)
{
	// ------ NSC ------
	name 		= "Alvaro";
	guild 		= GIL_BDT;
	id 			= 10019;
	voice 		= 6;
	flags      	= NPC_FLAG_IMMORTAL;
	npctype		= NPCTYPE_BL_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Krummschwert);
	
	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_N_Normal_Spassvogel, BodyTex_N, ITAR_Thorus_Addon);	
	Mdl_SetModelFatness	(self, -1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 60); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_10019;
};
FUNC VOID Rtn_Start_10019()
{
	TA_Guard_Passage (00,00,12,00,"ADW_MINE_TO_GRUFT_01");
	TA_Guard_Passage (12,00,00,00,"ADW_MINE_TO_GRUFT_01");
};

FUNC VOID Rtn_WaitBeforeAttack_10019 ()
{
    TA_Stand_Guarding  	  (08,00,16,00,"ADW_MINE_TO_GRUFT_02");
    TA_Stand_Guarding  	  (16,00,08,00,"ADW_MINE_TO_GRUFT_02");  
};

FUNC VOID Rtn_Attack_10019 ()
{
    TA_Stand_Guarding  	  (08,00,16,00,"ADW_MINE_TO_GRUFT_06");
    TA_Stand_Guarding  	  (16,00,08,00,"ADW_MINE_TO_GRUFT_06");  
};
