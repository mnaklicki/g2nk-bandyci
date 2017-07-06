instance BDT_10316_Arvo (Npc_Default)
{
	// ------ NSC ------
	name 		= "Arvo";
	guild 		= GIL_BDT;
	id 			= 10316;
	voice 		= 7;
	flags      	= NPC_FLAG_IMMORTAL;
	npctype		= NPCTYPE_MAIN;
	
	//---aivars-----
	aivar[AIV_NewsOverride] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_2h_Sld_Axe);
	
	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", 65, BodyTex_L, ITAR_BDT_M);	
	Mdl_SetModelFatness	(self, 0.5);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 55); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_10316;
};
FUNC VOID Rtn_Start_10316 ()
{
  	TA_Smalltalk     (09,00,21,00,"ADW_HUNTERS_ARVO");
    TA_Smalltalk     (21,00,09,00,"ADW_HUNTERS_ARVO");		
};

FUNC VOID Rtn_Guide_10316 ()
{
   TA_Guide_Player   (06,00,20,00,"ADW_CANYON_PATH_TO_BANDITS_06E");
   TA_Guide_Player   (20,00,06,00,"ADW_CANYON_PATH_TO_BANDITS_06E");
};

FUNC VOID Rtn_Wait_10316 ()
{
   TA_Stand_Guarding   (06,00,20,00,"ADW_CAVE_ARVO");
   TA_Stand_Guarding   (20,00,06,00,"ADW_CAVE_ARVO");
};

FUNC VOID Rtn_FletcherDead_10316 ()
{
   TA_Stand_Guarding   (06,00,20,00,"BL_FIGHT_01");
   TA_Stand_Guarding   (20,00,06,00,"BL_FIGHT_01");
};

FUNC VOID Rtn_Final_10316 ()
{
   TA_Stand_Guarding   (06,00,20,00,"ADW_CANYON_PATH_TO_BANDITS_06E");
   TA_Stand_Guarding   (20,00,06,00,"ADW_CANYON_PATH_TO_BANDITS_06E");
};
