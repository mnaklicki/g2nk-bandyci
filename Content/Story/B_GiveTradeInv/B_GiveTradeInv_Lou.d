var int Lou_ItemsGiven_Chapter_1;
var int Lou_ItemsGiven_Chapter_2;
var int Lou_ItemsGiven_Chapter_3;

FUNC VOID B_GiveTradeInv_Lou (var C_NPC slf)
{
	if ((Kapitel >= 1)
	&& (Lou_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 100); 

		CreateInvItems (slf, ItFo_Addon_Rum,2);
		CreateInvItems (slf, ItFo_Booze,3);
		CreateInvItems (slf, ItFo_Beer,6);
		CreateInvItems (slf, Itfo_Wine,2);
						
		Lou_ItemsGiven_Chapter_1 = TRUE;
	};
	
	if ((Kapitel >= 2)
	&& (Lou_ItemsGiven_Chapter_2 == FALSE))
	{
	
		CreateInvItems (slf, ItMi_Gold, 100); 

		CreateInvItems (slf, ItFo_Addon_Rum,2);
		CreateInvItems (slf, ItFo_Booze,3);
		CreateInvItems (slf, ItFo_Beer,6);
		CreateInvItems (slf, Itfo_Wine,2);
				
		Lou_ItemsGiven_Chapter_2 = TRUE;
	};

	if ((Kapitel >= 3)
	&& (Lou_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 100); 

		CreateInvItems (slf, ItFo_Addon_Rum,2);
		CreateInvItems (slf, ItFo_Booze,3);
		CreateInvItems (slf, ItFo_Beer,6);
		CreateInvItems (slf, Itfo_Wine,2);

		Lou_ItemsGiven_Chapter_3 = TRUE;
	};
};
