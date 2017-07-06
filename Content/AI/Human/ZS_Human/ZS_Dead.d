// *****************************************
// ZS_Dead
// -------
// wird auch nach jedem Load Game ausgeführt
// wird auch vom Spieler ausgeführt
// *****************************************

func void ZS_Dead ()
{	
	// ------ aivars resetten ------
	self.aivar[AIV_RANSACKED] = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	
	B_StopLookAt	(self);
	AI_StopPointAt	(self);
		
	// ------ XP ------
	if ( Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER]==TRUE) )
	&& (self.aivar[AIV_VictoryXPGiven] == FALSE)							
	{
		B_GivePlayerXP (self.level * XP_PER_VICTORY);			
		
		self.aivar[AIV_VictoryXPGiven] = TRUE;
	};
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Swampshark_Logan))
	{
		LogansDeadSwampsharks = LogansDeadSwampsharks + 1;
	};
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Edgor_Bloodfly))
	{
		EdgorsDeadBloodflies = EdgorsDeadBloodflies + 1;
	};


	// ------ Sumpfdrohne -------
	if (self.aivar[AIV_MM_REAL_ID] == ID_SWAMPDRONE)
	{
		if (Npc_GetDistToNpc(self, other) < 300)
		{
			other.attribute[ATR_HITPOINTS] -= 50;
			//Npc_ChangeAttribute(other, ATR_HITPOINTS, -50);
		};
	};
	
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SwampDrone_Journal))
	{
		B_LogEntry	(TOPIC_Raven,"Zbada³em piedesta³ na bagnie. Tam te¿ mo¿na coœ umieœciæ.");
		checkedTeleport = TRUE;
	};
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Gobbo_Green_Journal))
	{
		B_LogEntry	(TOPIC_Raven,"Nie licz¹c kurzu i mroku, niezbyt du¿o tu widzê. Pe³no jest tutaj jakiœ dziwnych malowide³, których nie jestem w stanie zrozumieæ ani rozczytaæ. Najlepiej bêdzie jak pójdê dalej i zobaczê co tam jest.");
	};
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Gobbo_Green_Journal_MainHall))
	{
		B_LogEntry	(TOPIC_Raven,"Widzê jedn¹ z tych platform. Powiem Krukowi, ¿e znalaz³em jedn¹ w tych ruinach.");
		B_LogEntry	(TOPIC_Raven,"Nie licz¹c kolumn i zamkniêtych kamiennych drzwi, nic tu nie ma. Po co wysy³a³ mnie na zbadanie pustki?");
		checkedTemple = TRUE;
	};

		
	// ------ weil sonst Händler bevor man zum ersten Mal TRADE gewählt hat nix haben ------
	B_GiveTradeInv(self);//Joly:	STEHEN LASSEN!!!!!!!!!!!!!!!

	// ------ Monster-Inventory abhängig vom Spieler-Talent ------
	B_GiveDeathInv(self);
	B_ClearRuneInv(self); //klaue alle runen!!
	
	// ------ PetzCounter meiner Home-Location runtersetzen ------
	B_DeletePetzCrime (self); //hat bei CRIME_NONE (oder keiner Home-Location) keine Auswirkungen
	self.aivar[AIV_NpcSawPlayerCommit] = CRIME_NONE;
	
	// ------ Equippte Waffen können nicht genommen werden! ------
	AI_UnequipWeapons (self);
	
	self.aivar[AIV_TAPOSITION] = FALSE;
};

func int ZS_Dead_loop ()
{
	// Drachen 
	if (self.aivar[AIV_TAPOSITION] == FALSE)
	{
		
	self.aivar[AIV_TAPOSITION] = TRUE;
	};
	
	return LOOP_CONTINUE;
};
