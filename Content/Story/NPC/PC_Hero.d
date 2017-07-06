instance PC_Hero (NPC_DEFAULT)
{
	// ------ SC ------
	name 		= "Vinc";
	guild		= GIL_BDT;
	id			= 0;
	voice		= 15;
	level		= 0;
	Npctype		= NPCTYPE_MAIN;
	
	//***************************************************
	bodyStateInterruptableOverride 	= TRUE;
	//***************************************************
	
	// ------ XP Setup ------
	exp				= 0;
	exp_next		= 500;
	lp				= 20;
	
	// ------ Attribute ------
	attribute[ATR_STRENGTH] 		= 50;
	attribute[ATR_DEXTERITY] 		= 10;
	attribute[ATR_MANA_MAX] 		= 10;
	attribute[ATR_MANA] 			= 10;
	attribute[ATR_HITPOINTS_MAX]	= 40;
	attribute[ATR_HITPOINTS] 		= 40;
	
	// ------ visuals ------
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", 68, BodyTex_N, ITAR_Hero);
		
	// ------ Kampf-Talente ------
	B_SetFightSkills 	(self, 10); 
};
