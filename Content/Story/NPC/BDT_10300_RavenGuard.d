instance BDT_10300_RavenGuard (Npc_Default)
{
	// ------ NSC ------
	name 		= "Stra¿nik Kruka";
	guild 		= GIL_BDT;
	id 			= 10300;
	voice 		= 13;
	flags       = NPC_FLAG_IMMORTAL;									//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_Addon_BanditTrader);

	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_P_Normal02, BodyTex_P, ITAR_Thorus_Addon);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 30); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_10300;
};

FUNC VOID Rtn_Start_10300 ()
{
     TA_Stand_ArmsCrossed  (09,00,21,00,"BL_UP_PLACE_03");
     TA_Stand_ArmsCrossed  (21,00,09,00,"BL_UP_PLACE_03");		
};

FUNC VOID Rtn_TOT_10300 ()
{	
	TA_Stand_ArmsCrossed  	(08,00,23,00,"BL_RAVEN_RITUAL"); 
    TA_Stand_ArmsCrossed	(23,00,08,00,"BL_RAVEN_RITUAL");
};