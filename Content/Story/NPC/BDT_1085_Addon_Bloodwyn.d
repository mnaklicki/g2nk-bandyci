instance BDT_1085_Addon_Bloodwyn (Npc_Default)
{
	// ------ NSC ------
	name 		= "Bloodwyn";
	guild 		= GIL_BDT;
	id 			= 1085;
	voice 		= 4;//Stimme Lee
	flags      	= NPC_FLAG_IMMORTAL;
	npctype		= NPCTYPE_BL_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem (self, ItMw_2h_Sld_Sword);
	
	// ------ Inventory ------
	CreateInvItems (self, ITKE_Addon_Bloodwyn_01,1);
	CreateInvItems (self, ItMi_Addon_Bloodwyn_Kopf,1);

	
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Bloodwyn, BodyTex_N, ITAR_Thorus_Addon);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 65); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_1085;
};

FUNC VOID Rtn_Start_1085 ()
{
    TA_Stand_Guarding  	  (08,00,16,00,"BL_MINE_ENTRANCE_GUARD_SCATTY");
    TA_Stand_Guarding  	  (16,00,08,00,"BL_MINE_ENTRANCE_GUARD_SCATTY");  
};

FUNC VOID Rtn_WaitBeforeAttack_1085 ()
{
    TA_Stand_Guarding  	  (08,00,16,00,"ADW_MINE_TO_GRUFT_02");
    TA_Stand_Guarding  	  (16,00,08,00,"ADW_MINE_TO_GRUFT_02");  
};

FUNC VOID Rtn_Attack_1085 ()
{
    TA_Stand_Guarding  	  (08,00,16,00,"ADW_MINE_TO_GRUFT_06");
    TA_Stand_Guarding  	  (16,00,08,00,"ADW_MINE_TO_GRUFT_06");  
};
