
instance BDT_1090_Addon_Raven (Npc_Default)
{
	// ------ NSC ------
	name 		= "Kruk";
	guild 		= GIL_BDT;
	id 			= 1090;
	voice 		= 10;
	flags      	= NPC_FLAG_IMMORTAL;
	npctype		= NPCTYPE_MAIN;
	
	level = 50;
	
	attribute[ATR_STRENGTH] 		= 50; //+50 Waffe
	attribute[ATR_DEXTERITY] 		= 50;
	attribute[ATR_MANA_MAX] 		= 100;
	attribute[ATR_MANA] 			= 100;
	attribute[ATR_HITPOINTS_MAX]	= 500;
	attribute[ATR_HITPOINTS] 		= 500;

	//aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;

	attribute[ATR_MANA_MAX] = 666666; //Joly:für die Waffe

	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem (self, ItMw_Runenschwert);  

	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_N_Raven, BodyTex_N, ITAR_Raven_Addon);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 90); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_1090;
};

FUNC VOID Rtn_Start_1090 ()
{
    TA_Stand_Guarding (09,00,21,00,"BL_MINE_RAVEN"); 
    TA_Stand_Guarding (21,00,09,00,"BL_MINE_RAVEN");		
};

FUNC VOID Rtn_WaitBeforeAttack_1090 ()
{
    TA_Stand_Guarding  	  (08,00,16,00,"ADW_MINE_TO_GRUFT_01");
    TA_Stand_Guarding  	  (16,00,08,00,"ADW_MINE_TO_GRUFT_01");  
};

FUNC VOID Rtn_Attack_1090 ()
{
    TA_Stand_Guarding  	  (08,00,16,00,"ADW_GRUFT_05");
    TA_Stand_Guarding  	  (16,00,08,00,"ADW_GRUFT_05");  
};
