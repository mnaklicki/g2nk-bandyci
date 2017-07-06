instance BDT_10318_Lou (Npc_Default)
{
	// ------ NSC ------
	name 		= "Lou";
	guild 		= GIL_BDT;
	id 			= 10318;
	voice 		= 1;
	flags      	= NPC_FLAG_IMMORTAL;
	npctype		= NPCTYPE_MAIN;
	
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_1h_Sld_Sword);
		
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", 5, BodyTex_N, ITAR_BARKEEPER);	
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 65); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_10318;
};
FUNC VOID Rtn_Start_10318 ()
{
	TA_Stand_ArmsCrossed 	 (07,00,01,00,"BL_INN_05_C");	
    TA_Potion_Alchemy		 (01,00,07,00,"BL_INN_UP_LABOR");	
};
