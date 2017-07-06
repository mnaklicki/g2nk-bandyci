instance BDT_1077_Esker (Npc_Default)
{
	// ------ NSC ------
	name 		= "Esker";
	guild 		= GIL_BDT;
	id 			= 1077;
	voice 		= 1;
	flags      	= NPC_FLAG_IMMORTAL;
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_STRONG;
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_1h_Sld_Sword);

	
	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic", Face_P_Normal01, BodyTex_P, ITAR_BDT_M);	
	Mdl_SetModelFatness	(self, - 0.5);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 90); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_1077;
};
FUNC VOID Rtn_Start_1077 ()
{
	TA_Stand_Eating		(8,00,10,00,"ADW_SWAMP_ROAST");
	TA_Smith_Sharp 	 	(10,00,12,00,"ADW_PATH_TO_BL_SHARP");
	TA_Practice_Sword	(12,00,18,00,"ADW_PATH_TO_BL_SHARP");
	TA_Sit_Campfire 	(18,00,20,00,"ADW_SWAMP_ROAST");
	TA_Sleep			(20,00,8,00,"ADW_SWAMP_ROAST");
};
