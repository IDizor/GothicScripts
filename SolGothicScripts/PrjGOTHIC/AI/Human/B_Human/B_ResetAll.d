
func void UpdateManaItems()
{
	//ItPo_Mana_01.value = ItPo_Mana_01.value + 1;
	//PrintScreen(IntToString(ItPo_Mana_01.value),-1,-1,FONT_Screen,1);
	ItPo_Perm_Mana.count[1] = ManaPoints(ManaMax_Elixier);
	ItPo_Perm_LittleMana.count[1] = ManaPoints(ManaLittlePotion);
};

func void B_ResetAll(var C_Npc slf)
{
	UpdateManaItems();
	B_StopLookAt(slf);
	AI_RemoveWeapon(slf);
};

