instance BDT_10004_Addon_Finn (Npc_Default)
{
	// ------ NSC ------
	name 		= "Finn";
	guild 		= GIL_BDT;
	id 			= 10004;
	voice 		= 7;
	flags      	= NPC_FLAG_IMMORTAL;
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self,3);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_NORMAL;
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMW_2h_Axe_L_01);
		
	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_NormalBart02, BodyTex_N, ITAR_Prisoner);	
	Mdl_SetModelFatness	(self, -1 );
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 60); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_10004;
};

FUNC VOID Rtn_Start_10004()
{
	TA_Pick_Ore      (10,00,20,00,"ADW_MINE_PICK_06");
	TA_Pick_Ore      (20,00,10,00,"ADW_MINE_PICK_06");	
};




