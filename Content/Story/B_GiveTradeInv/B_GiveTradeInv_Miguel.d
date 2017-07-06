var int Miguel_ItemsGiven_Chapter_1;
var int Miguel_ItemsGiven_Chapter_2;
var int Miguel_ItemsGiven_Chapter_3;
var int Miguel_ItemsGiven_Chapter_4;
var int Miguel_ItemsGiven_Chapter_5;

FUNC VOID B_GiveTradeInv_Miguel (var C_NPC slf)
{
	if ((Kapitel >= 1)
	&& (Miguel_ItemsGiven_Chapter_1 == FALSE))
	{
		
		CreateInvItems (slf,ItPl_Mana_Herb_01 	,10); 
		CreateInvItems (slf,ItPl_Health_Herb_01	,10);
		CreateInvItems (slf,ItPl_Health_Herb_02 	,4); 
		CreateInvItems (slf,ItPl_Speed_Herb_01	,3);
		CreateInvItems (slf,ItPl_SwampHerb	,4);
		CreateInvItems (slf, ItPo_Health_Addon_04,	1);
						
		Miguel_ItemsGiven_Chapter_1 = TRUE;
	};
	
	if ((Kapitel >= 2)
	&& (Miguel_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems (slf,ItPl_Health_Herb_03 	,5); 
		CreateInvItems (slf,ItPl_Health_Herb_02	,5);
		CreateInvItems (slf,ItPl_Mana_Herb_03 	,2); 
		CreateInvItems (slf,ItPl_Mana_Herb_01	,2);

		Miguel_ItemsGiven_Chapter_2 = TRUE;
	};

	if ((Kapitel >= 3)
	&& (Miguel_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems (slf,ItPl_Health_Herb_03 	,5); 
		CreateInvItems (slf,ItPl_Health_Herb_02	,5);
		CreateInvItems (slf,ItPl_Mana_Herb_03 	,2); 
		CreateInvItems (slf,ItPl_Mana_Herb_01	,2);

		Miguel_ItemsGiven_Chapter_3 = TRUE;
	};
};
