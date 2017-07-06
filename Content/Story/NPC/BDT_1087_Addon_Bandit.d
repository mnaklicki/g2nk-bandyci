instance BDT_1087_Addon_Bandit (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_Bandit;
	guild 		= GIL_BDT;
	id 			= 1087;
	voice 		= 1;
	flags      	= NPC_FLAG_IMMORTAL;
	npctype		= NPCTYPE_TAL_AMBIENT;

	// ------ Attribute ------
	B_SetAttributesToChapter (self,3);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_NORMAL;
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_1h_Mil_Sword);

	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_P_ToughBald, BodyTex_P, ITAR_BDT_M);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 90); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_1087;
};
FUNC VOID Rtn_Start_1087 ()
{
     TA_Saw   (09,00,21,00,"ADW_HUNTERS_SAW"); 
     TA_Saw   (21,00,09,00,"ADW_HUNTERS_SAW");			
};
