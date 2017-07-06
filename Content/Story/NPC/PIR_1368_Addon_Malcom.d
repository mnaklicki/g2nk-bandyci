INSTANCE PIR_1368_Addon_Malcom (Npc_Default)
{
	// ------ NSC ------
	name 		= "Malcom";
	guild 		= GIL_STRF;
	id 			= 1368;
	voice 		= 4;
	flags       = NPC_FLAG_IMMORTAL;															
	npctype		= NPCTYPE_MAIN;
	
	//aivars 
	aivar[AIV_NewsOverride] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_NoFightParker] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Addon_PIR1hAxe);

	// ------ Inventory ------
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", Face_N_Normal_Sly, BodyTex_N, ITAR_PIR_L_Addon);	  
	Mdl_SetModelFatness	(self, 1.1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,10); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1368;
};

FUNC VOID Rtn_Start_1368 ()
{	
	TA_Guard_Passage (06,00,10,00,"ADW_ENTRANCE_2_PIRATECAMP_12");
	TA_Guard_Passage (10,00,06,00,"ADW_ENTRANCE_2_PIRATECAMP_12");
};
