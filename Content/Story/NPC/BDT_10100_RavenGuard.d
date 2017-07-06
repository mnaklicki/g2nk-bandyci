instance BDT_10100_RavenGuard (Npc_Default)
{
	// ------ NSC ------
	name 		= "Stra¿nik Kruka";
	guild 		= GIL_BDT;
	id 			= 10100;
	voice 		= 1;
	flags      	= NPC_FLAG_IMMORTAL;
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self,1);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_STRONG;
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_1h_Sld_Sword);
	EquipItem (self, ItRw_Mil_Crossbow);
		
	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_N_NormalBart12, BodyTex_N, ITAR_Thorus_Addon);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 60); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_10100;
};
FUNC VOID Rtn_Start_10100 ()
{
    TA_Stand_Eating  (09,00,21,00,"BL_RAVEN_STAIRS_DOWN");
    TA_Stand_Eating  (21,00,09,00,"BL_RAVEN_STAIRS_DOWN");		
};

FUNC VOID Rtn_TOT_10100 ()
{	
	TA_Stand_ArmsCrossed  	(08,00,23,00,"BL_RAVEN_RITUAL"); 
    TA_Stand_ArmsCrossed	(23,00,08,00,"BL_RAVEN_RITUAL");
};