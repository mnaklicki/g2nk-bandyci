
instance BDT_10301_RavenGuard (Npc_Default)
{
	// ------ NSC ------
	name 		= "Stra¿nik Kruka";
	guild 		= GIL_BDT;
	id 			= 10301;
	voice 		= 1;
	flags       = NPC_FLAG_IMMORTAL;									//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_1h_Bau_Mace);
	EquipItem			(self, ItRw_SLD_Bow);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Normal03, BodyTex_N, ITAR_Thorus_Addon);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 40); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA ------
	daily_routine 		= Rtn_Start_10301;
};

FUNC VOID Rtn_Start_10301 ()
{	
	TA_Stand_ArmsCrossed  	(08,00,23,00,"BL_MINE_ENTRANCE_01"); 
    TA_Stand_ArmsCrossed	(23,00,08,00,"BL_MINE_ENTRANCE_01");
};

FUNC VOID Rtn_TOT_10301 ()
{	
	TA_Stand_ArmsCrossed  	(08,00,23,00,"BL_RAVEN_RITUAL"); 
    TA_Stand_ArmsCrossed	(23,00,08,00,"BL_RAVEN_RITUAL");
};
