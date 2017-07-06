instance BDT_10317_Kyrrus (Npc_Default)
{
	// ------ NSC ------
	name 		= "Kyrrus";
	guild 		= GIL_BDT;
	id 			= 10317;
	voice 		= 1;
	flags      	= NPC_FLAG_IMMORTAL;
	npctype		= NPCTYPE_MAIN;

	// ------ Attribute ------
	B_SetAttributesToChapter (self,3);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_NORMAL;
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_1h_Mil_Sword);

	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_NormalBart06, BodyTex_N, ITAR_BDT_M);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 90); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_10317;
};
FUNC VOID Rtn_Start_10317 ()
{
    TA_Cook_Cauldron   (08,00,19,00,"ADW_PATH_TO_BL_COOK"); 
    TA_Roast_Scavenger   (19,00,20,00,"ADW_SWAMP_ROAST");			
	TA_Sleep   (20,00,8,00,"ADW_HUNTERS_SAW");			
};
