// *******************************************************************
// Startup und Init Funktionen der Level-zen-files
// -----------------------------------------------
// Die STARTUP-Funktionen werden NUR beim ersten Betreten eines Levels 
// (nach NewGame) aufgerufen, die INIT-Funktionen jedesmal
// Die Funktionen müssen so heissen wie die zen-files
// *******************************************************************

// *********
// GLOBAL
// *********

func void STARTUP_GLOBAL()
{
	Game_InitGerman();
};

func void INIT_GLOBAL()
{
	Game_InitGerman();
	LeGo_Init (LeGo_All & ~LeGo_Bloodsplats);
	FF_Apply (I_TriggerFadeScreen);
};

//------------------------------------------------------------
//		Addon World ADANOSTEMPEL
//------------------------------------------------------------
func void STARTUP_ADDON_PART_ADANOSTEMPLE_01 ()
{
};

func void INIT_SUB_ADDON_PART_ADANOSTEMPLE_01 ()
{
	
};

func void INIT_ADDON_PART_ADANOSTEMPLE_01 ()
{
	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();

	CurrentLevel = ADDONWORLD_ZEN;	 

	INIT_SUB_ADDON_PART_ADANOSTEMPLE_01();
};

//------------------------------------------------------------
//		Addon World GOLDMINE
//------------------------------------------------------------
func void STARTUP_ADDON_PART_GOLDMINE_01 ()
{
	//----------------------Humans----------------------------
	Wld_InsertNpc 	(STRF_1118_Addon_Patrick, 	"ADDON_GOLDMINE");
	
	Wld_InsertNpc 	(BDT_1095_Addon_Crimson, 	"ADDON_GOLDMINE");
	
	
	Wld_InsertNpc   (BDT_10023_Addon_Wache,		"ADDON_GOLDMINE");
	Wld_InsertNpc   (BDT_10024_Addon_Garaz,		"ADDON_GOLDMINE");
	
	//----------------tote Sklaven--------------------
	Wld_InsertNpc	(STRF_1133_Addon_Sklave, "ADW_MINE_SKLAVENTOD_01");
	Wld_InsertNpc	(STRF_1134_Addon_Sklave, "ADW_MINE_SKLAVENTOD_01");
	Wld_InsertNpc	(STRF_1135_Addon_Sklave, "ADW_MINE_SKLAVENTOD_01");
	B_KillNpc(STRF_1133_Addon_Sklave);
	B_KillNpc(STRF_1134_Addon_Sklave);
	B_KillNpc(STRF_1135_Addon_Sklave);
	
	Wld_InsertNpc	(Stoneguardian, "ADW_MINE_SKLAVENTOD_01");
	Wld_InsertNpc	(Stoneguardian, "ADW_MINE_SKLAVENTOD_02");
	Wld_InsertNpc	(Stoneguardian, "ADW_MINE_SKLAVENTOD_03");

	//----------------Plus Buddler, Wachen, Sklaven--------------------
	Wld_InsertNpc	(STRF_1128_Addon_Sklave, "ADDON_GOLDMINE");
	Wld_InsertNpc	(STRF_1129_Addon_Sklave, "ADDON_GOLDMINE");
	Wld_InsertNpc	(STRF_1130_Addon_Sklave, "ADDON_GOLDMINE");
	Wld_InsertNpc	(STRF_1136_Addon_Sklave, "ADDON_GOLDMINE");
	Wld_InsertNpc	(STRF_1137_Addon_Sklave, "ADDON_GOLDMINE");
	Wld_InsertNpc	(STRF_1138_Addon_Sklave, "ADDON_GOLDMINE");
	Wld_InsertNpc	(STRF_1139_Addon_Sklave, "ADDON_GOLDMINE");
	Wld_InsertNpc	(STRF_1140_Addon_Sklave, "ADDON_GOLDMINE");
	
	Wld_InsertNpc	(BDT_10025_Addon_Wache, "ADDON_GOLDMINE");
	Wld_InsertNpc	(BDT_10026_Addon_Wache, "ADDON_GOLDMINE");
	Wld_InsertNpc	(BDT_10027_Addon_Buddler, "ADDON_GOLDMINE");
	Wld_InsertNpc	(BDT_10028_Addon_Buddler, "ADDON_GOLDMINE");
	Wld_InsertNpc	(BDT_10029_Addon_Buddler, "ADDON_GOLDMINE");
	Wld_InsertNpc	(BDT_10030_Addon_Buddler, "ADDON_GOLDMINE");
	
		
		
	//------------ Monster ANZAHL (10) WICHTIG für Garaz (FIXME_FILLER) ----------------------------
	Wld_InsertNpc 	(GoldMinecrawler, 	"ADW_MINE_MC_04");
	Wld_InsertNpc 	(GoldMinecrawler, 			"ADW_MINE_MC_04");
	Wld_InsertNpc 	(GoldMinecrawler, 			"ADW_MINE_MC_03");
	Wld_InsertNpc 	(GoldMinecrawler, 			"ADW_MINE_MC_03");
	Wld_InsertNpc 	(GoldMinecrawler, 			"ADW_MINE_MC_08");
	Wld_InsertNpc 	(GoldMinecrawler, 			"ADW_MINE_MC_08");
	Wld_InsertNpc 	(GoldMinecrawler, 			"ADW_MINE_MC_07");
	Wld_InsertNpc 	(GoldMinecrawler, 			"ADW_MINE_MC_07");
	Wld_InsertNpc 	(GoldMinecrawler, 			"ADW_MINE_MC_02");
	Wld_InsertNpc 	(GoldMinecrawler, 			"ADW_MINE_MC_02");

	Wld_InsertNpc 	(Meatbug, 			"ADW_MINE_LAGER_08");
	Wld_InsertNpc 	(Meatbug, 			"ADW_MINE_LAGER_09");
	Wld_InsertNpc 	(Meatbug, 			"ADW_MINE_LAGER_05");
	Wld_InsertNpc 	(Meatbug, 			"ADW_MINE_LAGER_SIDE_04");
};

func void INIT_SUB_ADDON_PART_GOLDMINE_01 ()
{
	
};

func void INIT_ADDON_PART_GOLDMINE_01 ()
{
	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();
	
	INIT_SUB_ADDON_PART_GOLDMINE_01();
};

//------------------------------------------------------------
//		Addon World CANYON
//------------------------------------------------------------
func void STARTUP_ADDON_PART_CANYON_01 ()
{
	//----------------------freies Land------------------------

	Wld_InsertNpc 	(Blattcrawler, 	"ADW_CANYON_TELEPORT_PATH_09");
	Wld_InsertNpc 	(Blattcrawler, 	"ADW_CANYON_TELEPORT_PATH_09");
	Wld_InsertNpc 	(Blattcrawler, 	"ADW_CANYON_TELEPORT_PATH_09");

	Wld_InsertNpc 	(Giant_DesertRat, 	"ADW_CANYON_TELEPORT_PATH_03");
	Wld_InsertNpc 	(Giant_DesertRat, 	"ADW_CANYON_TELEPORT_PATH_03");

	Wld_InsertNpc 	(Giant_DesertRat, 	"ADW_CANYON_TELEPORT_PATH_04");

	Wld_InsertNpc 	(CanyonRazor01, 	"ADW_CANYON_MINE1_01");
	

	Wld_InsertNpc 	(CanyonRazor02, 	"ADW_CANYON_PATH_TO_LIBRARY_07A");
	Wld_InsertNpc 	(CanyonRazor03, 	"ADW_CANYON_PATH_TO_LIBRARY_07A");
	

	Wld_InsertNpc 	(CanyonRazor04, 	"ADW_CANYON_PATH_TO_LIBRARY_36");
	Wld_InsertNpc 	(CanyonRazor05, 	"ADW_CANYON_PATH_TO_LIBRARY_36");
	

	Wld_InsertNpc 	(Giant_DesertRat, 	"ADW_CANYON_PATH_TO_LIBRARY_40");
	Wld_InsertNpc 	(Giant_DesertRat, 	"ADW_CANYON_PATH_TO_LIBRARY_40");

	Wld_InsertNpc 	(Giant_DesertRat, 	"ADW_CANYON_PATH_TO_LIBRARY_03");

	Wld_InsertNpc 	(Bloodhound, 	"ADW_CANYON_PATH_TO_BANDITS_31");

	Wld_InsertNpc 	(orcbiter, 	"ADW_CANYON_PATH_TO_BANDITS_52");
	Wld_InsertNpc 	(orcbiter, 	"ADW_CANYON_PATH_TO_BANDITS_52");

	Wld_InsertNpc 	(CanyonRazor06, 	"ADW_CANYON_PATH_TO_MINE2_04");
	

	Wld_InsertNpc 	(orcbiter, 	"ADW_CANYON_PATH_TO_LIBRARY_31A");
	Wld_InsertNpc 	(orcbiter, 	"ADW_CANYON_PATH_TO_LIBRARY_31A");
	Wld_InsertNpc 	(orcbiter, 	"ADW_CANYON_PATH_TO_LIBRARY_31A");

	Wld_InsertNpc 	(Blattcrawler, 	"ADW_CANYON_PATH_TO_BANDITS_55");
	Wld_InsertNpc 	(Blattcrawler, 	"ADW_CANYON_PATH_TO_BANDITS_55");

	Wld_InsertNpc 	(orcbiter, 	"ADW_CANYON_PATH_TO_LIBRARY_16A");
	Wld_InsertNpc 	(orcbiter, 	"ADW_CANYON_PATH_TO_LIBRARY_16A");
	Wld_InsertNpc 	(orcbiter, 	"ADW_CANYON_PATH_TO_LIBRARY_16A");

	Wld_InsertNpc 	(orcbiter, 	"ADW_CANYON_PATH_TO_LIBRARY_17");

	Wld_InsertNpc 	(orcbiter, 	"ADW_CANYON_ORCS_09");


	Wld_InsertNpc 	(Wolf, 	"ADW_CANYON_PATH_TO_LIBRARY_37");
	Wld_InsertNpc 	(Wolf, 	"ADW_CANYON_PATH_TO_LIBRARY_37");
	Wld_InsertNpc 	(Wolf, 	"ADW_CANYON_PATH_TO_LIBRARY_12A");
	Wld_InsertNpc 	(Wolf, 	"ADW_CANYON_PATH_TO_LIBRARY_12A");
	Wld_InsertNpc 	(Wolf, 	"ADW_CANYON_PATH_TO_LIBRARY_12A");
	Wld_InsertNpc 	(Wolf, 	"ADW_CANYON_PATH_TO_LIBRARY_12A");

	Wld_InsertNpc 	(OrcWarrior_Roam, 	"ADW_CANYON_ORCS_08");
	Wld_InsertNpc 	(OrcWarrior_Roam, 	"ADW_CANYON_ORCS_08");

	Wld_InsertNpc 	(OrcWarrior_Roam, 	"ADW_CANYON_PATH_TO_LIBRARY_14");
	Wld_InsertNpc 	(OrcWarrior_Roam, 	"ADW_CANYON_PATH_TO_LIBRARY_14");

	Wld_InsertNpc 	(OrcWarrior_Roam, 	"ADW_CANYON_PATH_TO_LIBRARY_19");
	Wld_InsertNpc 	(OrcWarrior_Roam, 	"ADW_CANYON_PATH_TO_LIBRARY_20");
	Wld_InsertNpc 	(OrcWarrior_Roam, 	"ADW_CANYON_PATH_TO_LIBRARY_20");

	Wld_InsertNpc 	(OrcWarrior_Roam, 	"ADW_CANYON_ORCS_04");

	Wld_InsertNpc 	(OrcWarrior_Roam, 	"ADW_CANYON_ORCS_05");
	Wld_InsertNpc 	(OrcWarrior_Roam, 	"ADW_CANYON_ORCS_05");

	Wld_InsertNpc 	(OrcWarrior_Rest, 	"ADW_CANYON_ORCS_02");
	Wld_InsertNpc 	(OrcShaman_Sit_CanyonLibraryKey, 	"ADW_CANYON_ORCS_02");
	Wld_InsertNpc 	(OrcShaman_Sit, 	"ADW_CANYON_ORCS_02");

	Wld_InsertNpc 	(Bloodhound, 	"ADW_CANYON_PATH_TO_MINE2_09");
	Wld_InsertNpc 	(Bloodhound, 	"ADW_CANYON_PATH_TO_MINE2_09");

	Wld_InsertNpc 	(Bloodhound, 	"ADW_CANYON_PATH_TO_MINE2_06");
	

	Wld_InsertNpc 	(Giant_DesertRat, 	"ADW_CANYON_PATH_TO_BANDITS_26");
	Wld_InsertNpc 	(Giant_DesertRat, 	"ADW_CANYON_PATH_TO_BANDITS_26");

	Wld_InsertNpc 	(Giant_DesertRat, 	"ADW_CANYON_PATH_TO_BANDITS_24");

	Wld_InsertNpc 	(Giant_DesertRat, 	"ADW_CANYON_PATH_TO_BANDITS_66");
	Wld_InsertNpc 	(Giant_DesertRat, 	"ADW_CANYON_PATH_TO_BANDITS_66");
	
	Wld_InsertNpc 	(Minecrawler, 			"ADW_CANYON_PATH_TO_BANDITS_22");
	Wld_InsertNpc 	(MinecrawlerWarrior, 	"ADW_CANYON_PATH_TO_BANDITS_22");

	Wld_InsertNpc 	(Minecrawler, 			"ADW_CANYON_PATH_TO_BANDITS_21");

	Wld_InsertNpc 	(Minecrawler, 			"ADW_CANYON_PATH_TO_BANDITS_17");
	Wld_InsertNpc 	(Minecrawler, 			"ADW_CANYON_PATH_TO_BANDITS_17");
	
	Wld_InsertNpc 	(MinecrawlerWarrior, 	"ADW_CANYON_PATH_TO_BANDITS_14");
	Wld_InsertNpc 	(Minecrawler, 	"ADW_CANYON_PATH_TO_BANDITS_14");
	
	Wld_InsertNpc 	(Minecrawler, 			"ADW_CANYON_PATH_TO_BANDITS_62");
	Wld_InsertNpc 	(Minecrawler, 			"ADW_CANYON_PATH_TO_BANDITS_19");
	
	Wld_InsertNpc 	(Blattcrawler, 			"ADW_CANYON_PATH_TO_BANDITS_06");

	Wld_InsertNpc 	(Blattcrawler, 			"ADW_CANYON_PATH_TO_BANDITS_09");
	
	Wld_InsertNpc 	(Gobbo_Black, 			"ADW_CANYON_PATH_TO_BANDITS_06B");
	Wld_InsertNpc 	(Gobbo_Green, 			"ADW_CANYON_PATH_TO_BANDITS_06B");
	Wld_InsertNpc 	(Gobbo_Green, 			"ADW_CANYON_PATH_TO_BANDITS_06B");
	Wld_InsertNpc 	(Gobbo_Green, 			"ADW_CANYON_PATH_TO_BANDITS_06B");
	
	Wld_InsertNpc 	(Gobbo_Black, 			"ADW_CANYON_PATH_TO_BANDITS_06E");
	Wld_InsertNpc 	(Gobbo_Green, 			"ADW_CANYON_PATH_TO_BANDITS_06E");
	Wld_InsertNpc 	(Gobbo_Green, 			"ADW_CANYON_PATH_TO_BANDITS_06E");
	Wld_InsertNpc 	(Gobbo_Green, 			"ADW_CANYON_PATH_TO_BANDITS_06E");
	Wld_InsertNpc 	(Gobbo_Green, 			"ADW_CANYON_PATH_TO_BANDITS_06E");

	//Höhle 
	Wld_InsertItem (ItRi_Addon_Health_02,"FP_ITEM_CANYON_02"); 
	
	//hintere Mine
	Wld_InsertItem (ItRi_Addon_MANA_01,"FP_ITEM_CANYON_09");
	
	//----------------------Library----------------------------
	Wld_InsertNpc 	(Shadowbeast_Addon_Fire_CanyonLib, 	"ADW_CANYON_LIBRARY_04");
	Wld_InsertNpc 	(Shadowbeast_Addon_Fire, 	"ADW_CANYON_LIBRARY_LEFT_08");
	Wld_InsertNpc 	(Stoneguardian, 	"ADW_CANYON_LIBRARY_LEFT_07");
	Wld_InsertNpc 	(Shadowbeast_Addon_Fire, 	"ADW_CANYON_LIBRARY_RIGHT_07");
	Wld_InsertNpc 	(Stoneguardian, 	"ADW_CANYON_LIBRARY_RIGHT_13");

	Wld_InsertNpc 	(Stoneguardian, 	"ADW_CANYON_LIBRARY_STONIE_01");
	Wld_InsertNpc 	(Stoneguardian, 	"ADW_CANYON_LIBRARY_STONIE_02");
	Wld_InsertNpc 	(Stoneguardian, 	"ADW_CANYON_LIBRARY_STONIE_03");
	Wld_InsertNpc 	(Stoneguardian, 	"ADW_CANYON_LIBRARY_STONIE_04");
	Wld_InsertNpc 	(Stoneguardian, 	"ADW_CANYON_LIBRARY_STONIE_05");
	Wld_InsertItem  (ItMi_Addon_Stone_05,"ADW_ITEM_CANYON_TOKEN_01"); 
	
	Wld_InsertNpc 	(MinecrawlerWarrior, 	"ADW_CANYON_MINE1_13");
	Wld_InsertNpc 	(MinecrawlerWarrior, 	"ADW_CANYON_MINE2_09");
	Wld_InsertNpc 	(MinecrawlerWarrior, 	"ADW_CANYON_MINE2_09");

	Wld_InsertNpc 	(Minecrawler, 	"ADW_CANYON_MINE1_10");
	Wld_InsertNpc 	(Minecrawler, 	"ADW_CANYON_MINE1_05");

	Wld_InsertItem  (ItMi_Zeitspalt_Addon,"FP_ITEM_CANYON_UNIQUE");  
	
};
func void INIT_SUB_ADDON_PART_CANYON_01 ()
{

};
func void INIT_ADDON_PART_CANYON_01 ()
{
	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();
	
	INIT_SUB_ADDON_PART_CANYON_01();
};
//------------------------------------------------------------
//		Addon World ENTRANCE
//------------------------------------------------------------
func void STARTUP_ADDON_PART_ENTRANCE_01 ()
{
	Wld_InsertNpc (PIR_1352_Addon_AlligatorJack,"ADW_ENTRANCE");	//Auf dem weg zu den Banditen
	
	Wld_InsertNpc (Blattcrawler ,"ADW_ENTRANCE_PLATEAU_08");
	
	
	Wld_InsertNpc (Blattcrawler ,"ADW_ENTRANCE_2_VALLEY_05");
	Wld_InsertNpc (Blattcrawler ,"ADW_ENTRANCE_2_VALLEY_05");
	Wld_InsertNpc (Blattcrawler ,"ADW_ENTRANCE_2_VALLEY_05");
	Wld_InsertNpc (Blattcrawler ,"ADW_ENTRANCE_2_VALLEY_02B");
	Wld_InsertNpc (Blattcrawler ,"ADW_ENTRANCE_2_VALLEY_02B");


	Wld_InsertNpc (Blattcrawler ,"ADW_ENTRANCE_2_VALLEY_11");
	Wld_InsertNpc (Blattcrawler ,"ADW_ENTRANCE_2_VALLEY_11");
	//Wld_InsertNpc (Blattcrawler ,"ADW_ENTRANCE_2_VALLEY_02A"); //RAUS wegen AlliJack

	Wld_InsertNpc (Waran ,"ADW_ENTRANCE_2_VALLEY_08"); 

	Wld_InsertNpc (Sleepfly ,"ADW_ENTRANCE_PATH2BANDITS_10");
	Wld_InsertNpc (Sleepfly ,"ADW_ENTRANCE_PATH2BANDITS_10");
	
	Wld_InsertNpc (Bloodfly ,"ADW_ENTRANCE_PATH2BANDITS_03");

	Wld_InsertNpc (Waran ,"ADW_ENTRANCE_PATH2BANDITS_05");

	Wld_InsertNpc (Razor ,"ADW_ENTRANCE_RUIN1_01");
	Wld_InsertNpc (Giant_Rat ,"ADW_ENTRANCE_RUIN1_01");
	
	
	Wld_InsertNpc (Blattcrawler ,"ADW_ENTRANCE_BEHINDAKROPOLIS_04");
	Wld_InsertNpc (Blattcrawler ,"ADW_ENTRANCE_BEHINDAKROPOLIS_04");
	Wld_InsertNpc (Blattcrawler ,"ADW_ENTRANCE_2_PIRATECAMP_13");
	Wld_InsertNpc (Blattcrawler ,"ADW_ENTRANCE_2_PIRATECAMP_13");

	Wld_InsertNpc (Molerat ,"ADW_ENTRANCE_PATH2BANDITSCAVE1_05");
	Wld_InsertNpc (Molerat ,"ADW_ENTRANCE_PATH2BANDITSCAVE1_06");
	Wld_InsertNpc (Molerat ,"ADW_ENTRANCE_2_PIRATECAMP_05");
	Wld_InsertNpc (Molerat ,"ADW_ENTRANCE_2_PIRATECAMP_05");

	Wld_InsertNpc (Gobbo_Warrior ,"ADW_ENTRANCE_2_PIRATECAMP_19");
	Wld_InsertNpc (Gobbo_Black ,"ADW_ENTRANCE_2_PIRATECAMP_19");
	Wld_InsertNpc (Gobbo_Black ,"ADW_ENTRANCE_2_PIRATECAMP_19");

	Wld_InsertNpc (Shadowbeast ,"ADW_ENTRANCE_2_PIRATECAMP_22");
	
	//Items
	Wld_InsertItem (ItWr_StonePlateCommon_Addon,"FP_ITEM_ADWPORTAL_01");
	Wld_InsertItem (ItWr_HitPointStonePlate3_Addon,"FP_ITEM_ADWPORTAL_02"); 
	
	Wld_InsertItem (ItRi_Addon_Health_01,"FP_ITEM_ENTRANCE_09"); 
	
};

func void INIT_SUB_ADDON_PART_ENTRANCE_01 ()
{
};

func void INIT_ADDON_PART_ENTRANCE_01 ()
{
	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();
	
	INIT_SUB_ADDON_PART_ENTRANCE_01();
};
//------------------------------------------------------------
//		Addon World Banditenlager
//------------------------------------------------------------
FUNC VOID STARTUP_ADDON_PART_BANDITSCAMP_01()
{
	//FUNKTIONEN
	//Machvoll_Goldmobis_ADW();
	//ITEMS 
		
	//Pflanzen auf den Stufen von Bloodwyns Behausung
	
	Wld_InsertItem (ItPl_Health_Herb_02,"FP_ITEM_BL_STAIRS_01"); 
	Wld_InsertItem (ItPl_Mana_Herb_01,"FP_ITEM_BL_STAIRS_02");
	Wld_InsertItem (ItPl_Mana_Herb_03,"FP_ITEM_BL_STAIRS_03");
	Wld_InsertItem (ItPl_Mana_Herb_02,"FP_ITEM_BL_STAIRS_04");
	Wld_InsertItem (ItPl_Health_Herb_03,"FP_ITEM_BL_STAIRS_05");
	
	Wld_InsertItem (ItSc_LightningFlash,"FP_BL_ITEM_SMITH_01"); //Regal
	Wld_InsertItem (ItPl_Speed_Herb_01,"FP_BL_ITEM_SMITH_02"); //hinter den Kisten im Hof
	Wld_InsertItem (ItPl_Temp_Herb,"FP_BL_ITEM_SMITH_BACK_01");//links neben dem Haus
	
	Wld_InsertItem (ItPo_Mana_02,"FP_ITEM_BL_TRYSTAN");
	
	Wld_InsertItem (ItAm_Addon_Health,"FP_ITEM_MINE_01");//BALKEN VERSTECK
	
	Wld_InsertItem (ITKE_ADDON_BUDDLER_01,"FP_ITEM_BL_CHEST");
	
	Wld_InsertItem (ItPo_Health_Addon_04,"FP_RAVEN_01");
	Wld_InsertItem (ItPo_Mana_Addon_04,"FP_RAVEN_02");
	
	
	//IM SUMPF 
	Wld_InsertItem (ItPl_Temp_Herb,"FP_ITEM_BANDITSCAMP_01"); 
	Wld_InsertItem (ItPo_Mana_03,"FP_ITEM_BANDITSCAMP_02"); 
	
	Wld_InsertItem (ItRi_Addon_MANA_02,"FP_ITEM_BANDITSCAMP_03"); //TOLLES ITEM !!!
	
	Wld_InsertItem (ItSc_IceCube,"FP_ITEM_BANDITSCAMP_04"); 
	Wld_InsertItem (ItPl_Speed_Herb_01,"FP_ITEM_BANDITSCAMP_05"); 
	Wld_InsertItem (ItPo_Health_03,"FP_ITEM_BANDITSCAMP_06"); 
	Wld_InsertItem (ItPo_Mana_03,"FP_ITEM_BANDITSCAMP_07"); 
	Wld_InsertItem (ItPl_Perm_Herb,"FP_ITEM_BANDITSCAMP_08"); 
	Wld_InsertItem (ItPl_Temp_Herb,"FP_ITEM_BANDITSCAMP_09"); 
	Wld_InsertItem (ItPo_Health_02,"FP_ITEM_BANDITSCAMP_10"); 
	Wld_InsertItem (ItMi_GoldNugget_Addon,"FP_ITEM_BANDITSCAMP_11"); 
	Wld_InsertItem (ItPo_Health_02,"FP_ITEM_BANDITSCAMP_12"); 
	Wld_InsertItem (ItPo_Speed,"FP_ITEM_BANDITSCAMP_13"); 
	Wld_InsertItem (ItPl_Temp_Herb,"FP_ITEM_BANDITSCAMP_14"); 
	Wld_InsertItem (ItPo_Health_03,"FP_ITEM_BANDITSCAMP_15"); 
	Wld_InsertItem (ItMW_Addon_Keule_2h_01,"FP_ITEM_BANDITSCAMP_16"); 
	Wld_InsertItem (ItMi_GoldNugget_Addon,"FP_ITEM_BANDITSCAMP_17"); 
	Wld_InsertItem (ItPl_Speed_Herb_01,"FP_ITEM_BANDITSCAMP_19"); 
	Wld_InsertItem (ItPl_Temp_Herb,"FP_ITEM_BANDITSCAMP_20"); 
	//NSCs
	
	//-----------------VORPOSTEN--------------------------------------
	
	//Franco und seine Jäger
	Wld_InsertNpc (BDT_1093_Addon_Franco,"BANDIT");
	Wld_InsertNpc (BDT_10315_Fletcher,"BANDIT");
	Wld_InsertNpc (BDT_10317_Kyrrus,"ADW_PATH_TO_BL_COOK");
	
	Wld_InsertNpc (BDT_10011_Addon_Bandit,"BANDIT");
	Wld_InsertNpc (BDT_10012_Addon_Bandit,"BANDIT");
//	Wld_InsertNpc (BDT_1076_Addon_Bandit,"BANDIT");
	Wld_InsertNpc (BDT_1077_Esker,"ADW_SWAMP_ROAST");
	
	//Vorposten 1 Holzbau/Palisade
	
	Wld_InsertNpc (BDT_1073_Addon_Sancho,"BANDIT");
	Wld_InsertNpc (BDT_1087_Addon_Bandit,"BANDIT");
	Wld_InsertNpc (BDT_10022_Addon_Miguel,"BANDIT");
	
	//Vorposten 2 Versteck
	Wld_InsertNpc (BDT_1072_Addon_Logan,"BANDIT");
	Wld_InsertNpc (BDT_1080_Addon_Tom,"BANDIT");
	
	//Vorposten 3 Ruine
	Wld_InsertNpc (BDT_1074_Addon_Edgor,"BANDIT");
	Wld_InsertNpc (BDT_1078_Addon_Bandit,"BANDIT");//EX Wirt
	
	//Sonstige im Sumpf 
	Wld_InsertNpc (BDT_10016_Addon_Bandit,"BANDIT");
	Wld_InsertNpc (BDT_10017_Addon_Juan  ,"BANDIT");
	//--------------------LAGER-----------------------------------------
	
	Wld_InsertNpc (BDT_10014_Addon_Thorus, "BANDIT");//
	
	Wld_InsertNpc (BDT_1071_Addon_Ramon, "BANDIT");//TORWACHE
	Wld_InsertNpc (BDT_10316_Arvo, "BANDIT");
	Wld_InsertNpc (BDT_10004_Addon_Finn,"BANDIT");
	Wld_InsertNpc (BDT_1088_Addon_Torwache,"BL_ENTRANCE_GUARD_02");
	
	
	Wld_InsertNpc (BDT_1083_Addon_Esteban,"BANDIT");
	Wld_InsertNpc (BDT_1081_Addon_Wache_01,"BANDIT");
	Wld_InsertNpc (BDT_10005_Addon_Wache_02,"BANDIT");
	
	Wld_InsertNpc (BDT_1097_Addon_Fisk,"BANDIT");//Händler
	Wld_InsertNpc (BDT_1098_Addon_Snaf,"BANDIT");//Wirt
	Wld_InsertNpc (BDT_10318_Lou,"BL_INN_05_C");//Wirt
	Wld_InsertNpc (BDT_1099_Addon_Huno,"BANDIT");//Schmied
	
	
	Wld_InsertNpc (BDT_1070_Addon_Paul,"BL_DOWN_CENTER_07");
	Wld_InsertNpc (BDT_1082_Addon_Skinner,"BANDIT");
	
	Wld_InsertNpc (BDT_10319_DeadBandit,"BL_DOWN_CENTER_07_B");
	B_KillNpc(BDT_10319_DeadBandit);
	
	Wld_InsertNpc (BDT_1075_Addon_Fortuno,"BANDIT");
	Wld_InsertNpc (BDT_1084_Addon_Senyan,"BANDIT");
	Wld_InsertNpc (BDT_10015_Addon_Emilio,"BANDIT");
	
	Wld_InsertNpc (BDT_1096_Addon_Lennar,"BANDIT");
	Wld_InsertNpc (BDT_1079_Addon_Carlos,"BANDIT");
	
	//Wld_InsertNpc (BDT_1092_Addon_Isabel,"BANDIT"); 
	
	Wld_InsertNpc	(BDT_10031_Addon_Wache, "BANDIT");
	Wld_InsertNpc   (BDT_1086_Addon_Scatty,	"BANDIT");
	
	Wld_InsertNpc (BDT_1085_Addon_Bloodwyn,"BANDIT");
	
	Wld_InsertNpc (BDT_10001_Azuro,"BANDIT");
	
	Wld_InsertNpc (BDT_10006_Addon_Bandit,"BANDIT");
	Wld_InsertNpc (BDT_10007_Addon_Bandit,"BANDIT");
	Wld_InsertNpc (BDT_10008_Addon_Bandit,"BANDIT");
	
	Wld_InsertNpc (BDT_10009_Addon_Bandit,"BANDIT");
	Wld_InsertNpc (BDT_10010_Addon_Bandit,"BANDIT");
	
	Wld_InsertNpc (BDT_10018_Addon_Torwache,"BANDIT");
	Wld_InsertNpc (BDT_10019_Alvaro,"BANDIT");
	Wld_InsertNpc (BDT_10020_Addon_Wache,"BANDIT");
	Wld_InsertNpc (BDT_10021_Addon_Wache,"BANDIT");
	
	Wld_InsertNpc (BDT_10320_Butch,"ADW_ENTRANCE_RUIN2_02");
	B_KillNpc(BDT_10320_Butch);
	
	Wld_InsertNpc (Butch_StonePuma,"ADW_ENTRANCE_RUIN2_01");	
	
	//-----------------MONSTER------------------------------------ 
	Wld_InsertNpc (SwampGolem,"ADW_PATH_TO_GOLEM_05");
	Wld_InsertNpc (SwampGolem,"ADW_PATH_TO_GOLEM_06");
	Wld_InsertNpc (SwampGolem,"ADW_PATH_TO_GOLEM_08");
	
	Wld_InsertNpc (SwampGolem,"ADW_SWAMP_GOLEM_02");
	Wld_InsertNpc (SwampGolem,"ADW_SWAMP_GOLEM_03");
	Wld_InsertNpc (SwampGolem,"ADW_SWAMP_GOLEM_04");
	
	//Bloodflies rechts vom Eingang BL
	Wld_InsertNpc (Bloodfly,"ADW_BL_FLIES_03");
	Wld_InsertNpc (Bloodfly,"ADW_BL_FLIES_04");
	Wld_InsertNpc (Bloodfly,"ADW_BL_FLIES_06");
	Wld_InsertNpc (Bloodfly,"ADW_BL_FLIES_07");
	
	//Steg
	Wld_InsertNpc (Gobbo_Black,"ADW_BANDIT_VP1_05");
	
	
	//Sharks hinter Vorposten 3
	Wld_InsertNpc (Swampshark,"ADW_SHARK_02");
	Wld_InsertNpc (Swampshark,"ADW_SHARK_03");
	Wld_InsertNpc (Swampshark,"ADW_SHARK_04");
	Wld_InsertNpc (Swampshark,"ADW_SHARK_05");
	Wld_InsertNpc (Swampshark,"ADW_SHARK_06");
	Wld_InsertNpc (Swampshark,"ADW_SHARK_07");
	Wld_InsertNpc (Swampshark,"ADW_SHARK_08");
	Wld_InsertNpc (Swampshark,"ADW_SHARK_09");
	Wld_InsertNpc (Swampshark,"ADW_SHARK_10");
	
	
	//Swamp Shark Straße
	Wld_InsertNpc (SwampGolem,"ADW_SWAMP_WAND_01");
	Wld_InsertNpc (Swampdrone,"ADW_SWAMP_WAND_02");
	Wld_InsertNpc (Swampdrone,"ADW_SWAMP_WAND_03");
		
	Wld_InsertNpc (Swampshark,"ADW_SWAMP_SHARKSTREET_02");
	Wld_InsertNpc (Swampshark,"ADW_SWAMP_SHARKSTREET_03");
	Wld_InsertNpc (Swampshark,"ADW_SWAMP_SHARKSTREET_07");
	Wld_InsertNpc (Swampshark,"ADW_SWAMP_SHARKSTREET_08");
	Wld_InsertNpc (Swampshark,"ADW_SWAMP_SHARKSTREET_09");
	Wld_InsertNpc (Swampshark,"ADW_SWAMP_SHARKSTREET_10");

	Wld_InsertNpc (Swamprat,"ADW_CANYON_PATH_TO_BANDITS_01B");
	
	Wld_InsertNpc (Sleepfly,"ADW_LITTLE_HILL_03");
	Wld_InsertNpc (Sleepfly,"ADW_LITTLE_HILL_03");
	Wld_InsertNpc (Sleepfly,"ADW_LITTLE_HILL_04");
	
	//Weg rauf zum Big Sea
	Wld_InsertNpc (Sleepfly,"ADW_SWAMP_04");
	Wld_InsertNpc (Sleepfly,"ADW_SWAMP_04");
	
	Wld_InsertNpc (Sleepfly,"ADW_SWAMP_05");
	Wld_InsertNpc (Sleepfly,"ADW_SWAMP_05");

	//Little Sea 
	
	Wld_InsertNpc (Bloodfly,"ADW_SWAMP_LITTLE_SEA_01");
	Wld_InsertNpc (Bloodfly,"ADW_SWAMP_LITTLE_SEA_01");
	
	Wld_InsertNpc (Bloodfly,"ADW_SWAMP_LITTLE_SEA_02");
	Wld_InsertNpc (Bloodfly,"ADW_SWAMP_LITTLE_SEA_02");
	
	Wld_InsertNpc (Bloodfly,"ADW_SWAMP_LITTLE_SEA_03");
	Wld_InsertNpc (Bloodfly,"ADW_SWAMP_LITTLE_SEA_03");
	
	Wld_InsertNpc (Bloodfly,"ADW_SWAMP_12");
	Wld_InsertNpc (Bloodfly,"ADW_SWAMP_13");
	
	//Pfuetze 
	Wld_InsertNpc (Swamprat,"ADW_PFUETZE_01");
	Wld_InsertNpc (Swamprat,"ADW_PFUETZE_02");
	Wld_InsertNpc (Swamprat,"ADW_PFUETZE_03");
	Wld_InsertNpc (Swamprat,"ADW_PFUETZE_04");
	
	//Ruine
	Wld_InsertNpc (Gobbo_Warrior,"ADW_BANDIT_VP1_07_D");
	Wld_InsertNpc (Gobbo_Black,"ADW_BANDIT_VP1_07_E");
	Wld_InsertNpc (Gobbo_Black,"ADW_BANDIT_VP1_07_F");
	Wld_InsertNpc (Gobbo_Black,"ADW_SWAMP_LITTLE_SEA_03_B");
	Wld_InsertNpc (Gobbo_Black,"ADW_SWAMP_09_C");
	Wld_InsertNpc (Swampdrone,"ADW_SWAMP_HOHLWEG_01");
	
	
	Wld_InsertNpc (Swamprat,"ADW_SWAMP_LOCH_01");
	Wld_InsertNpc (Waran,"ADW_SWAMP_LOCH_02");
	Wld_InsertNpc (Waran,"ADW_SWAMP_LOCH_03");
	Wld_InsertNpc (Swamprat,"ADW_SWAMP_LOCH_04");

	Wld_InsertNpc (Gobbo_Black,"ADW_SWAMP_08_D");
	Wld_InsertNpc (Gobbo_Black,"ADW_SWAMP_08_E");
	
	Wld_InsertNpc (Bloodfly,"ADW_PATH_TO_BL_09");
	Wld_InsertNpc (Swampdrone,"ADW_PATH_TO_BL_10");
	Wld_InsertNpc (Bloodfly,"ADW_PATH_TO_BL_10");
	Wld_InsertNpc (Bloodfly,"ADW_PATH_TO_LOCH_01");
	Wld_InsertNpc (Bloodfly,"ADW_PATH_TO_LOCH_01");

	Wld_InsertNpc (Swampdrone,"ADW_SWAMP_HILLS_DOWN_05");
	Wld_InsertNpc (Swampdrone,"ADW_SWAMP_10");
	Wld_InsertNpc (Swampdrone,"ADW_SWAMP_13");
	Wld_InsertNpc (Swampdrone,"ADW_SWAMP_14");
	Wld_InsertNpc (Swampdrone,"ADW_SWAMP_06");
	Wld_InsertNpc (Bloodfly,"ADW_SWAMP_05");
	Wld_InsertNpc (Swampdrone,"ADW_SWAMP_12");
	Wld_InsertNpc (Swampdrone,"ADW_SWAMP_BF_NEST_06");

	Wld_InsertNpc (Swampdrone,"ADW_SWAMP_HOHLWEG_03");
	Wld_InsertNpc (Swampdrone,"ADW_SWAMP_HOHLWEG_04");
	
	//----------------Senat--- (und Wege dorthin)--------------------
	
	//Items
	Wld_InsertItem (ItPl_Mana_Herb_01,"FP_ITEM_SENAT_01");
	Wld_InsertItem (ItPl_Health_Herb_02,"FP_ITEM_SENAT_02");
	Wld_InsertItem (ItPl_Temp_Herb,"FP_ITEM_SENAT_03");
	Wld_InsertItem (ItPl_Health_Herb_03,"FP_ITEM_SENAT_04");
	Wld_InsertItem (ItPl_Mana_Herb_02,"FP_ITEM_SENAT_05");
	//Monster	
	Wld_InsertNpc (Stoneguardian_Sani01,"ADW_SENAT_SIDE_01");
	Wld_InsertNpc (Stoneguardian_Sani02,"ADW_SENAT_SIDE_02");
	Wld_InsertNpc (Stoneguardian_Sani03,"ADW_SENAT_SIDE_03");
	
	
	Wld_InsertNpc (Stoneguardian_Sani04,"ADW_SENAT_GUARDIAN_01");
	Wld_InsertNpc (Stoneguardian_Sani05,"ADW_SENAT_GUARDIAN_02");
	Wld_InsertNpc (Stoneguardian_Sani06,"ADW_SENAT_GUARDIAN_03");
	
	Wld_InsertNpc (StoneGuardian_Heiler,"ADW_SENAT_INSIDE_01");
	
	Wld_InsertNpc (Waran,"ADW_SENAT_MONSTER_01");
	Wld_InsertNpc (Waran,"ADW_SENAT_MONSTER_02");
	Wld_InsertNpc (Waran,"ADW_SENAT_MONSTER_03");
	Wld_InsertNpc (Waran,"ADW_SENAT_MONSTER_04");

	Wld_InsertNpc (Waran,"ADW_SENAT_05");
	Wld_InsertNpc (Waran,"ADW_SENAT_05");
	
	Wld_InsertNpc (Swamprat,"ADW_SWAMP_HILLS_DOWN_07");
	Wld_InsertNpc (Swamprat,"ADW_SWAMP_HILLS_DOWN_07");
	Wld_InsertNpc (Swampdrone,"ADW_SWAMP_HILLS_DOWN_05");
	Wld_InsertNpc (Swampdrone,"ADW_SWAMP_HILLS_DOWN_06");
	
	
	Wld_InsertNpc (Swampdrone,"ADW_SWAMP_HILLS_DOWN_03");
	Wld_InsertNpc (Swampdrone,"ADW_SWAMP_HILLS_DOWN_03");
	Wld_InsertNpc (Swampdrone,"ADW_SWAMP_15");
	Wld_InsertNpc (Swamprat,"ADW_HOHLWEG_CENTER");
	Wld_InsertNpc (Swamprat,"FP_ROAM_BF_NEST_26");
	Wld_InsertNpc (Swamprat,"ADW_BANDITSCAMP_RAKEPLACE_03");
	Wld_InsertNpc (Swampdrone,"ADW_CANYON_PATH_TO_BANDITS_02");
	Wld_InsertNpc (Swampdrone,"ADW_PFUETZE_02");
	Wld_InsertNpc (Swampdrone,"ADW_SWAMP_LOCH_05");
	Wld_InsertNpc (Swampdrone,"ADW_SWAMP_LOCH_06");


	Wld_InsertNpc (Swamprat,"ADW_SWAMP_TO_BIGSEA_01");
	Wld_InsertNpc (Swamprat,"ADW_SWAMP_TO_BIGSEA_01");
	
	Wld_InsertNpc (Swamprat,"ADW_SWAMP_HOHLWEG_02");
	Wld_InsertNpc (Swampdrone,"ADW_SWAMP_HOHLWEG_05");
	Wld_InsertNpc (Swampdrone,"ADW_SWAMP_HOHLWEG_05");
	
	Wld_InsertNpc (Swamprat,"ADW_SWAMP_07");
	Wld_InsertNpc (Swamprat,"ADW_SWAMP_07");
	
	
	//NOWE
	Wld_InsertNpc (Swampshark_Logan,"ADW_BANDIT_VP3_03");
	Wld_InsertNpc (Swampshark_Logan,"ADW_BANDIT_VP3_03");
	Wld_InsertNpc (Swampshark_Logan,"ADW_BANDIT_VP3_03");
	
	Wld_InsertNpc (Edgor_Bloodfly,"ADW_BANDIT_VP1_09");
	Wld_InsertNpc (Edgor_Bloodfly,"ADW_BANDIT_VP1_09");
	Wld_InsertNpc (Edgor_Bloodfly,"ADW_BANDIT_VP1_09");
	Wld_InsertNpc (Edgor_Bloodfly,"ADW_BANDIT_VP1_09");
	Wld_InsertNpc (Edgor_Bloodfly,"ADW_BANDIT_VP1_08_B");
	Wld_InsertNpc (Edgor_Bloodfly,"ADW_BANDIT_VP1_08_B");
	Wld_InsertNpc (Edgor_Bloodfly,"ADW_BANDIT_VP1_08_B");
	Wld_InsertNpc (Edgor_Bloodfly,"ADW_BANDIT_VP1_08_B");
};



FUNC VOID INIT_SUB_ADDON_PART_BANDITSCAMP_01()
{	
		//Die portalräume im banditenlager
		Wld_AssignRoomToGuild("tavern01"  , GIL_NONE);
		Wld_AssignRoomToGuild("beds01"	  , GIL_PUBLIC);
		Wld_AssignRoomToGuild("merchant01", GIL_PUBLIC);
		Wld_AssignRoomToGuild("schmied01" , GIL_NONE);
		Wld_AssignRoomToGuild("zoll01"	  , GIL_NONE);
		Wld_AssignRoomToGuild("raven01"	  , GIL_PUBLIC);
};
FUNC VOID INIT_ADDON_PART_BANDITSCAMP_01()
{
	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();
	
	INIT_SUB_ADDON_PART_BANDITSCAMP_01();
};

//#############################################
//###										###
//###			Piratenlager				###
//###										###
//#############################################

FUNC VOID STARTUP_ADDON_PART_PIRATESCAMP_01 ()
{
	//--------- Piraten --------------------------
	Wld_InsertNpc (PIR_1350_Addon_Francis,"STRAND");		//Vor Gregs Hütte -->SitBench
	Wld_InsertNpc (PIR_1351_Addon_Samuel,"STRAND");			//In der Höhle    
	Wld_InsertNpc (PIR_1353_Addon_Morgan,"STRAND");			//Vor Sams Höhle
	Wld_InsertNpc (PIR_1354_Addon_Henry,"STRAND");			//An der Palisade --> ArmsCrossed
	Wld_InsertNpc (PIR_1355_Addon_Skip,"STRAND");			//
	Wld_InsertNpc (PIR_1356_Addon_Bill,"STRAND");			//Am Strand -->Saw
	Wld_InsertNpc (PIR_1357_Addon_Garett ,"STRAND");		//Am Lagerschuppen
	
	Wld_InsertNpc (PIR_1360_Addon_Pirat,"STRAND");			//An der Palisade --> RepairHut
	Wld_InsertNpc (PIR_1361_Addon_Pirat,"STRAND");			//An der Palisade --> Saw
	Wld_InsertNpc (PIR_1362_Addon_Bones,"STRAND");			//Trainiert
	Wld_InsertNpc (PIR_1363_Addon_Pirat,"STRAND");			//Bank
	Wld_InsertNpc (PIR_1364_Addon_Pirat,"STRAND");			//FixME_Hoshi --> noch TA setzen!!!
	Wld_InsertNpc (PIR_1365_Addon_Matt,"STRAND");			//SmallTalk
	Wld_InsertNpc (PIR_1366_Addon_Brandon,"STRAND");			//Smalltalk
	
	Wld_InsertNpc (PIR_1367_Addon_Owen,"STRAND");			//Holzfälelrlager
	Wld_InsertNpc (PIR_1368_Addon_Malcom,"STRAND");			//tot ind er geheimen Höhle
	
	
	Wld_InsertNpc (PIR_1370_Addon_Angus,"STRAND");
	Wld_InsertNpc (PIR_1371_Addon_Hank ,"STRAND");
	
	
	
	Wld_InsertNpc (BDT_10100_RavenGuard,"BANDIT");			
	Wld_InsertNpc (BDT_10101_RavenGuard,"BANDIT");			
	Wld_InsertNpc (BDT_10102_RavenGuard,"BANDIT");	
	Wld_InsertNpc (BDT_10300_RavenGuard,"BANDIT");			
	Wld_InsertNpc (BDT_10301_RavenGuard,"BANDIT");	

	Wld_InsertItem (ItMi_Addon_GregsTreasureBottle_MIS,"FP_ADW_GREGSBOTTLE"); 		
	
	
	// --------- Monster -----------------------------
	Wld_InsertNpc (Lurker,"ADW_PIRATECAMP_ISLE1_01");
	Wld_InsertNpc (Lurker,"ADW_PIRATECAMP_ISLE1_01");
	Wld_InsertNpc (Lurker,"ADW_PIRATECAMP_ISLE1_01");
	
	// -------- Strandlurker ------------------------
	Wld_InsertNpc (BeachWaran1,"ADW_PIRATECAMP_BEACH_27");
	Wld_InsertNpc (BeachWaran2,"ADW_PIRATECAMP_BEACH_27");
	
	Wld_InsertNpc (BeachLurker1,"ADW_PIRATECAMP_BEACH_28");
	Wld_InsertNpc (BeachLurker2,"ADW_PIRATECAMP_BEACH_28");
	Wld_InsertNpc (BeachLurker2,"ADW_PIRATECAMP_BEACH_28");
	
	Wld_InsertNpc (BeachShadowbeast1,"ADW_PIRATECAMP_CAVE3_04");
	
	//-------- Einsamer Strand -----------------------
	
	Wld_InsertNpc (Waran,"ADW_PIRATECAMP_LONEBEACH_11");
	Wld_InsertNpc (Waran,"ADW_PIRATECAMP_LONEBEACH_12");
	Wld_InsertNpc (FireWaran,"ADW_PIRATECAMP_LONEBEACH_10");
	Wld_InsertNpc (FireWaran,"ADW_PIRATECAMP_LONEBEACH_10");
	Wld_InsertNpc (FireWaran,"DAW_PIRTECAMP_LONEBEACH_07");
	Wld_InsertNpc (FireWaran,"ADW_PIRATECAMP_LONEBEACH_08");
	Wld_InsertNpc (Waran,"ADW_PIRATECAMP_LONEBEACH_05");
	Wld_InsertNpc (Waran,"ADW_PIRATECAMP_LONEBEACH_04");
	
	Wld_InsertNpc (ZOMBIE01,"ADW_PIRATECAMP_LONEBEACH_CAVE_03");
	Wld_InsertNpc (MAYAZOMBIE02,"ADW_PIRATECAMP_LONEBEACH_CAVE_03");
	Wld_InsertNpc (ZOMBIE03,"ADW_PIRATECAMP_LONEBEACH_CAVE_03");
	
	// --------- Versteckte Höhle ----------------------
	Wld_InsertNpc (Lurker,"ADW_PIRATECAMP_SECRETCAVE_01");
	Wld_InsertNpc (Lurker,"ADW_PIRATECAMP_SECRETCAVE_01");
	
	//---------- Holzfällerlager -----------------------
	
	Wld_InsertNpc (Meatbug,"ADW_PIRATECAMP_LUMBER_01");
	Wld_InsertNpc (Meatbug,"ADW_PIRATECAMP_LUMBER_01");
	Wld_InsertNpc (Meatbug,"ADW_PIRATECAMP_LUMBER_01");
	
	// --------- Vor dem Turm ------------------------
	
	Wld_InsertNpc (Gobbo_Black,"ADW_PIRATECAMP_PLAIN_01");
	Wld_InsertNpc (Gobbo_Black,"ADW_PIRATECAMP_PLAIN_01");
	Wld_InsertNpc (Gobbo_Black,"ADW_PIRATECAMP_PLAIN_02");
	
	// --------- Hinter dem Turm --------------------
	
	Wld_InsertNpc (Blattcrawler,"ADW_PIRATCAMP_PLAIN_05");
	Wld_InsertNpc (Blattcrawler,"ADW_PIRATCAMP_PLAIN_05");
	
	//---------- Wasserloch -------------------------
	 
	Wld_InsertNpc (Blattcrawler,"ADW_PIRATCAMP_PLAIN_05");
	Wld_InsertNpc (Blattcrawler,"ADW_PIRATCAMP_PLAIN_05");
	
	Wld_InsertNpc (Waran,"ADW_PIRATECAMP_WATERHOLE_08");
	
	Wld_InsertNpc (Lurker,"ADW_PIRATECAMP_WATERHOLE_04");
	
	//---------- Weg ---------------------------------
	
	Wld_InsertNpc (Blattcrawler,"ADW_PIRATECAMP_WAY_SPAWN_01");
	Wld_InsertNpc (Blattcrawler,"ADW_PIRATECAMP_WAY_SPAWN_02");
	
	
	//========================================================
	//				Items
	//========================================================
	
	
	
	//-------- Treibgut im Seichten Wasser -----
	
	Wld_InsertItem (ItFo_Addon_Rum,"FP_ITEMSPAWN_SHALLOWWATER_01");	
	Wld_InsertItem (ItMi_GoldNugget_Addon,"FP_ITEMSPAWN_SHALLOWWATER_02");	
	Wld_InsertItem (ItMi_Addon_Shell_01,"FP_ITEMSPAWN_SHALLOWWATER_03");
	Wld_InsertItem (ItMi_JeweleryChest,"FP_ITEMSPAWN_SHALLOWWATER_04");
	Wld_InsertItem (ItMi_GoldChalice,"FP_ITEMSPAWN_SHALLOWWATER_05");	
	Wld_InsertItem (ItMi_Addon_Shell_02,"FP_ITEMSPAWN_SHALLOWWATER_06");	
	Wld_InsertItem (ItMi_GoldRing,"FP_ITEMSPAWN_SHALLOWWATER_07");
	Wld_InsertItem (ItMi_Addon_Shell_01,"FP_ITEMSPAWN_SHALLOWWATER_08");
	Wld_InsertItem (ItSe_GoldPocket100,"FP_ITEMSPAWN_SHALLOWWATER_09");
	Wld_InsertItem (ItMi_RuneBlank,"FP_ITEMSPAWN_SHALLOWWATER_10");	
	Wld_InsertItem (ItMi_Addon_Shell_02,"FP_ITEMSPAWN_SHALLOWWATER_11");	
	Wld_InsertItem (ItPo_Health_Addon_04,"FP_ITEMSPAWN_SHALLOWWATER_12");	
	Wld_InsertItem (ItMi_Skull,"FP_ITEMSPAWN_SHALLOWWATER_13");	
	Wld_InsertItem (ItPo_Health_Addon_04,"FP_ITEMSPAWN_SHALLOWWATER_14");	
	Wld_InsertItem (ItMi_SilverCandleHolder,"FP_ITEMSPAWN_SHALLOWWATER_15");	
	Wld_InsertItem (ItMi_Addon_Shell_02,"FP_ITEMSPAWN_SHALLOWWATER_16");
	Wld_InsertItem (ItMi_SilverRing,"FP_ITEMSPAWN_SHALLOWWATER_17");	
	Wld_InsertItem (ItMi_Addon_Shell_01,"FP_ITEMSPAWN_SHALLOWWATER_18");	
	Wld_InsertItem (ItPo_Mana_Addon_04,"FP_ITEMSPAWN_SHALLOWWATER_19");
	Wld_InsertItem (ItMi_GoldCup,"FP_ITEMSPAWN_SHALLOWWATER_20");
	Wld_InsertItem (ItMi_Addon_Shell_02,"FP_ITEMSPAWN_SHALLOWWATER_21");	
	Wld_InsertItem (ItMi_Addon_Shell_02,"FP_ITEMSPAWN_SHALLOWWATER_22");
	Wld_InsertItem (ItMi_GoldChest,"FP_ITEMSPAWN_SHALLOWWATER_23");
	Wld_InsertItem (ItMi_GoldCup,"FP_ITEMSPAWN_SHALLOWWATER_24");	
	Wld_InsertItem (ItSe_GoldPocket100,"FP_ITEMSPAWN_SHALLOWWATER_25");	
	Wld_InsertItem (ItMi_Nugget,"FP_ITEMSPAWN_SHALLOWWATER_26");
	Wld_InsertItem (ItMi_Addon_Shell_01,"FP_ITEMSPAWN_SHALLOWWATER_27");	
	Wld_InsertItem (ItMi_SilverPlate,"FP_ITEMSPAWN_SHALLOWWATER_28");
	Wld_InsertItem (ItMi_SilverCup,"FP_ITEMSPAWN_SHALLOWWATER_29");	
	Wld_InsertItem (ItMi_Addon_Shell_02,"FP_ITEMSPAWN_SHALLOWWATER_30");	
	
	
	Wld_InsertItem (ItAm_Addon_STR,"FP_ITEMSPAWN_LONEBEACH_02");	//-->Feuerwaranstrand in der Höhle
};

FUNC VOID INIT_SUB_ADDON_PART_PIRATESCAMP_01 ()
{
};

FUNC VOID INIT_ADDON_PART_PIRATESCAMP_01 ()
{
	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();
	
	INIT_SUB_ADDON_PART_PIRATESCAMP_01();
};

//#############################################
//###										###
//###			Part VALLEY					###
//###										###
//#############################################

FUNC VOID STARTUP_ADDON_PART_VALLEY_01 ()
{
	Wld_InsertNpc (None_Addon_115_Eremit,"ADW_VALLEY_PATH_031_HUT");
	
	// ------ Troll ------
	Wld_InsertNpc (Valley_Troll,"ADW_VALLEY_BIGCAVE_07");
	Wld_InsertNpc (Valley_Troll,"ADW_VALLEY_PATH_048_B");

	// ------ Gobbo_Black ------
	Wld_InsertNpc (Gobbo_Black,"ADW_VALLEY_PATH_003_A");
	Wld_InsertNpc (Gobbo_Warrior,"ADW_VALLEY_BIGCAVE_08");
	Wld_InsertNpc (Gobbo_Black,"ADW_VALLEY_BIGCAVE_08");
	Wld_InsertNpc (Gobbo_Black,"ADW_VALLEY_BIGCAVE_08");
	Wld_InsertNpc (Gobbo_Black,"ADW_VALLEY_BIGCAVE_08");
	Wld_InsertNpc (MayaZombie03,"ADW_VALLEY_BIGCAVE_18");
	Wld_InsertNpc (Gobbo_Black,"ADW_VALLEY_PATH_012");
	Wld_InsertNpc (Gobbo_Warrior_Visir,"ADW_VALLEY_PATH_115_F");
	Wld_InsertNpc (Gobbo_Warrior,"ADW_VALLEY_PATH_115_F");
	Wld_InsertNpc (Gobbo_Warrior,"ADW_VALLEY_PATH_054_B");
	Wld_InsertNpc (Gobbo_Black,"ADW_VALLEY_PATH_054_B");
	Wld_InsertNpc (Gobbo_Black,"ADW_VALLEY_PATH_054_D");
	Wld_InsertNpc (Gobbo_Black,"ADW_VALLEY_PATH_054_E");
	Wld_InsertNpc (Gobbo_Warrior,"ADW_VALLEY_PATH_054_F");
	Wld_InsertNpc (Gobbo_Warrior,"ADW_VALLEY_PATH_058_CAVE_09");
	Wld_InsertNpc (Gobbo_Warrior_Visir,"ADW_VALLEY_PATH_058_CAVE_09");
	Wld_InsertNpc (Gobbo_Warrior,"ADW_VALLEY_PATH_058_CAVE_09");

	// ------ Harpie ------
	Wld_InsertNpc (Harpie,"ADW_VALLEY_BIGCAVE_06");
	Wld_InsertNpc (Harpie,"ADW_VALLEY_BIGCAVE_06");
	Wld_InsertNpc (Harpie,"ADW_VALLEY_BIGCAVE_15");
	Wld_InsertNpc (Harpie,"ADW_VALLEY_BIGCAVE_15");
	Wld_InsertNpc (Harpie,"ADW_VALLEY_BIGCAVE_15");
	Wld_InsertNpc (Harpie,"ADW_VALLEY_PATH_110");
	Wld_InsertNpc (Harpie,"ADW_VALLEY_PATH_110");

	// ------ Snapper ------
	Wld_InsertNpc (Snapper,"ADW_VALLEY_PATH_020");
	Wld_InsertNpc (Snapper,"ADW_VALLEY_PATH_020");
	Wld_InsertNpc (Snapper,"ADW_VALLEY_BIGCAVE_01");
	Wld_InsertNpc (Snapper,"ADW_VALLEY_PATH_048_A");
	Wld_InsertNpc (Snapper,"ADW_VALLEY_PATH_048_A");
	Wld_InsertNpc (Snapper,"ADW_VALLEY_PATH_048_A");
	Wld_InsertNpc (Snapper,"ADW_VALLEY_PATH_047_D");
	Wld_InsertNpc (Snapper,"ADW_VALLEY_PATH_047_D");
	Wld_InsertNpc (Snapper,"ADW_VALLEY_PATH_047_D");
	Wld_InsertNpc (Snapper,"ADW_VALLEY_PATH_047_G");
	Wld_InsertNpc (Snapper,"ADW_VALLEY_PATH_047_G");
	Wld_InsertNpc (Snapper,"ADW_VALLEY_PATH_038_E");
	Wld_InsertNpc (Snapper,"ADW_VALLEY_PATH_038_E");
	Wld_InsertNpc (Snapper,"ADW_VALLEY_PATH_038_J");
	
	// ------ Shadowbeast ------
	Wld_InsertNpc (Shadowbeast,"ADW_VALLEY_PATH_029");

	// ------ Skeleton ------
	Wld_InsertNpc (Skeleton,"ADW_VALLEY_PATH_020_CAVE_05");
	Wld_InsertNpc (Skeleton,"ADW_VALLEY_PATH_020_CAVE_05");
	
	// ------Scavenger ------
	Wld_InsertNpc (Scavenger_Demon,"ADW_VALLEY_PATH_032_G");
	Wld_InsertNpc (Scavenger_Demon,"ADW_VALLEY_PATH_032_G");
	Wld_InsertNpc (Scavenger_Demon,"ADW_VALLEY_PATH_032_G");
	Wld_InsertNpc (Scavenger_Demon,"ADW_VALLEY_PATH_121_A");
	Wld_InsertNpc (Scavenger_Demon,"ADW_VALLEY_PATH_121_A");
	Wld_InsertNpc (Scavenger_Demon,"ADW_VALLEY_PATH_121_A");
	Wld_InsertNpc (Scavenger_Demon,"ADW_VALLEY_PATH_120_A");
	Wld_InsertNpc (Scavenger_Demon,"ADW_VALLEY_PATH_120_A");
	Wld_InsertNpc (Scavenger_Demon,"ADW_VALLEY_PATH_120_A");

	// ------ Molerat ------
	Wld_InsertNpc (Swamprat,"ADW_VALLEY_PATH_027");
	Wld_InsertNpc (Swamprat,"ADW_VALLEY_PATH_045");
	Wld_InsertNpc (Swamprat,"ADW_VALLEY_PATH_129_B");
	Wld_InsertNpc (Swamprat,"ADW_VALLEY_PATH_129_B");
	Wld_InsertNpc (Swamprat,"ADW_VALLEY_PATH_129_B");

	// ------ Minecrawler ------
	Wld_InsertNpc (Minecrawler,"ADW_VALLEY_PATH_131");
	Wld_InsertNpc (Minecrawler,"ADW_VALLEY_PATH_131");
	Wld_InsertNpc (Minecrawler,"ADW_VALLEY_PATH_132_A");
	Wld_InsertNpc (Minecrawler,"ADW_VALLEY_PATH_132_A");
	Wld_InsertNpc (Minecrawler_Priest,"ADW_VALLEY_PATH_134");
	Wld_InsertNpc (Minecrawler,"ADW_VALLEY_PATH_134");
	Wld_InsertNpc (Minecrawler,"ADW_VALLEY_PATH_135");
	Wld_InsertNpc (Minecrawler,"ADW_VALLEY_PATH_135");
	Wld_InsertNpc (Minecrawler,"ADW_VALLEY_PATH_135");
	Wld_InsertNpc (Minecrawler,"ADW_VALLEY_PATH_135");
	Wld_InsertNpc (Minecrawler,"ADW_VALLEY_PATH_135");
	Wld_InsertNpc (MinecrawlerWarrior,"ADW_VALLEY_PATH_058_CAVE_13");
	
	// ------ Blattcrawler ------
	Wld_InsertNpc (Blattcrawler,"ADW_VALLEY_PATH_024_A");
	Wld_InsertNpc (Blattcrawler,"ADW_VALLEY_PATH_024_A");
	Wld_InsertNpc (Blattcrawler,"ADW_VALLEY_PATH_125");
	Wld_InsertNpc (SwampGolem_Valley,"ADW_VALLEY_PATH_064_A");	
	Wld_InsertNpc (Blattcrawler,"ADW_VALLEY_PATH_062");
	Wld_InsertNpc (Blattcrawler,"ADW_VALLEY_PATH_062");

	// ------ Bloodfly ------
	Wld_InsertNpc (Blattcrawler,"ADW_VALLEY_PATH_102_A");
	Wld_InsertNpc (Blattcrawler,"ADW_VALLEY_PATH_102_A");
	Wld_InsertNpc (Scavenger_Demon,"ADW_VALLEY_PATH_116_A");
	Wld_InsertNpc (Swamprat,"ADW_VALLEY_PATH_043");
	Wld_InsertNpc (Swamprat,"ADW_VALLEY_PATH_043");
	Wld_InsertNpc (Blattcrawler,"ADW_VALLEY_PATH_053");
	Wld_InsertNpc (Bloodfly,"ADW_VALLEY_PATH_017");
	
	// ------ Meatbug ------
	Wld_InsertNpc (Meatbug,"ADW_VALLEY_PATH_058");

	// ------ Orcs ------
	Wld_InsertNpc (OrcWarrior_Rest,"ADW_VALLEY_PATH_033_A");
	Wld_InsertNpc (OrcWarrior_Sit,"ADW_VALLEY_PATH_035");
	Wld_InsertNpc (OrcWarrior_Sit,"ADW_VALLEY_PATH_036");
	Wld_InsertNpc (OrcElite_Roam,"FP_ROAM_VALLEY_116");
	Wld_InsertNpc (OrcElite_Roam,"ADW_VALLEY_PATH_040");
	Wld_InsertNpc (OrcElite_Roam,"FP_ROAM_VALLEY_117");
	Wld_InsertNpc (OrcElite_Roam,"ADW_VALLEY_PATH_041");
	Wld_InsertNpc (OrcElite_Roam,"ADW_VALLEY_PATH_043");
	Wld_InsertNpc (OrcElite_Roam,"ADW_VALLEY_PATH_039");
	
	Wld_InsertNpc (OrcShaman_Sit,"ADW_VALLEY_PATH_115_E");
	
	// ------ Zombie ------
	Wld_InsertNpc (MayaZombie01,"ADW_VALLEY_PATH_072");
	Wld_InsertNpc (Zombie04,"ADW_VALLEY_PATH_072");
	Wld_InsertNpc (Zombie03,"ADW_VALLEY_PATH_073");
	Wld_InsertNpc (MayaZombie04_Totenw,"ADW_VALLEY_PATH_072");
	Wld_InsertNpc (Zombie04,"ADW_VALLEY_PATH_073");
	Wld_InsertNpc (Zombie02,"ADW_VALLEY_PATH_073");
	
	
	Wld_InsertNpc (Stoneguardian_NailedValleyShowcase_01,"ADW_VALLEY_SHOWCASE1_02");
	Wld_InsertNpc (Stoneguardian_NailedValleyShowcase_02,"ADW_VALLEY_SHOWCASE1_03");
	Wld_InsertItem (ItMi_Zeitspalt_Addon,"FP_ITEM_VALLEY_02");
	
	//Qurahodrons Grab
	Wld_InsertItem (ItRi_Addon_STR_02,"FP_ITEM_VALLEY_12");
};

FUNC VOID INIT_SUB_ADDON_PART_VALLEY_01 ()
{
};

FUNC VOID INIT_ADDON_PART_VALLEY_01 ()
{
	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();
	
	INIT_SUB_ADDON_PART_VALLEY_01();
};

// ------ Bandits -------
FUNC VOID STARTUP_Bandits ()
{	
	STARTUP_ADDON_PART_BANDITSCAMP_01 ();
	STARTUP_ADDON_PART_PIRATESCAMP_01 ();
	STARTUP_ADDON_PART_ENTRANCE_01 ();
	STARTUP_ADDON_PART_GOLDMINE_01 ();
	STARTUP_ADDON_PART_CANYON_01 ();
	STARTUP_ADDON_PART_VALLEY_01 ();
	STARTUP_ADDON_PART_ADANOSTEMPLE_01 ();
		
	// ------ StartUps der Unter-Parts ------ 
	ENTERED_ADDONWORLD = TRUE;
	CurrentLevel = ADDONWORLD_ZEN;	 
};

FUNC VOID INIT_Bandits ()
{
	INIT_SUB_ADDON_PART_BANDITSCAMP_01 ();
	INIT_SUB_ADDON_PART_PIRATESCAMP_01 ();
 	INIT_SUB_ADDON_PART_ENTRANCE_01 ();
   	INIT_SUB_ADDON_PART_GOLDMINE_01 ();
   	INIT_SUB_ADDON_PART_CANYON_01 ();
   	INIT_SUB_ADDON_PART_VALLEY_01 ();
   	INIT_SUB_ADDON_PART_ADANOSTEMPLE_01 ();
   
    B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();
	
	B_ENTER_ADDONWORLD ();
	
	// ------ INITS der Unter-Parts ------ 
};

