
func int B_GetBestPlayerMap()
{
	if(CurrentLevel == NEWWORLD_ZEN)
	{
		if(Npc_HasItems(hero,ItWr_Map_NewWorld) >= 1)
		{
			return ItWr_Map_NewWorld;
		}
		else if(Npc_HasItems(hero,ItWr_Map_Shrine_MIS) >= 1)
		{
			return ItWr_Map_Shrine_MIS;
		}
		else if(Npc_HasItems(hero,ItWr_Map_Caves_MIS) >= 1)
		{
			return ItWr_Map_Caves_MIS;
		}
		else if(Npc_HasItems(hero,ItWr_Map_NewWorld_Ornaments_Addon) >= 1)
		{
			return ItWr_Map_NewWorld_Ornaments_Addon;
		}
		else if(Npc_HasItems(hero,ItWr_Map_NewWorld_Dexter) >= 1)
		{
			return ItWr_Map_NewWorld_Dexter;
		}
		else if(Npc_HasItems(hero,ItWr_ShatteredGolem_MIS) >= 1)
		{
			return ItWr_ShatteredGolem_MIS;
		}
		else if(Npc_HasItems(hero,ItWr_Map_Orcelite_MIS) >= 1)
		{
			return ItWr_Map_Orcelite_MIS;
		}
		else if(Npc_HasItems(hero,ItWr_Map_NewWorld_City) >= 1)
		{
			return ItWr_Map_NewWorld_City;
		};
	}
	else if(CurrentLevel == OldWorld_Zen)
	{
		if(Npc_HasItems(hero,ItWr_Map_OldWorld) >= 1)
		{
			return ItWr_Map_OldWorld;
		}
		else if(Npc_HasItems(hero,ItWr_Map_OldWorld_Oremines_MIS) >= 1)
		{
			return ItWr_Map_OldWorld_Oremines_MIS;
		};
	}
	else if(CurrentLevel == DRAGONISLAND_ZEN)
	{
	}
	else if(CurrentLevel == ADDONWORLD_ZEN)
	{
		if(Npc_HasItems(hero,ItWr_Map_AddonWorld) >= 1)
		{
			return ItWr_Map_AddonWorld;
		}
		else if(Npc_HasItems(hero,ItWR_Addon_TreasureMap) >= 1)
		{
			return ItWR_Addon_TreasureMap;
		};
	};
	return 0;
};

func int B_GetAnyPlayerMap()
{
	if(Npc_HasItems(hero,ItWr_Map_NewWorld) >= 1)
	{
		return ItWr_Map_NewWorld;
	}
	else if(Npc_HasItems(hero,ItWr_Map_Shrine_MIS) >= 1)
	{
		return ItWr_Map_Shrine_MIS;
	}
	else if(Npc_HasItems(hero,ItWr_Map_Caves_MIS) >= 1)
	{
		return ItWr_Map_Caves_MIS;
	}
	else if(Npc_HasItems(hero,ItWr_Map_NewWorld_Ornaments_Addon) >= 1)
	{
		return ItWr_Map_NewWorld_Ornaments_Addon;
	}
	else if(Npc_HasItems(hero,ItWr_Map_NewWorld_Dexter) >= 1)
	{
		return ItWr_Map_NewWorld_Dexter;
	}
	else if(Npc_HasItems(hero,ItWr_ShatteredGolem_MIS) >= 1)
	{
		return ItWr_ShatteredGolem_MIS;
	}
	else if(Npc_HasItems(hero,ItWr_Map_Orcelite_MIS) >= 1)
	{
		return ItWr_Map_Orcelite_MIS;
	}
	else if(Npc_HasItems(hero,ItWr_Map_NewWorld_City) >= 1)
	{
		return ItWr_Map_NewWorld_City;
	}
	else if(Npc_HasItems(hero,ItWr_Map_OldWorld) >= 1)
	{
		return ItWr_Map_OldWorld;
	}
	else if(Npc_HasItems(hero,ItWr_Map_OldWorld_Oremines_MIS) >= 1)
	{
		return ItWr_Map_OldWorld_Oremines_MIS;
	}
	else if(Npc_HasItems(hero,ItWr_Map_AddonWorld) >= 1)
	{
		return ItWr_Map_AddonWorld;
	}
	else if(Npc_HasItems(hero,ItWR_Addon_TreasureMap) >= 1)
	{
		return ItWR_Addon_TreasureMap;
	};
	return 0;
};

func int player_hotkey_screen_map()
{
	var int OldInstance;
	var int NewInstance;
	OldInstance = B_GetPlayerMap();
	if((OldInstance > 0) && (Npc_HasItems(hero,OldInstance) < 1))
	{
		OldInstance = 0;
	};
	B_SetPlayerMap(OldInstance);
	NewInstance = OldInstance;
	if(CurrentLevel != NEWWORLD_ZEN)
	{
		if((OldInstance == ItWr_Map_Caves_MIS) || (OldInstance == ItWr_Map_NewWorld) || (OldInstance == ItWr_Map_NewWorld_City) || (OldInstance == ItWr_Map_NewWorld_Dexter) || (OldInstance == ItWr_Map_NewWorld_Ornaments_Addon) || (OldInstance == ItWr_Map_Orcelite_MIS) || (OldInstance == ItWr_Map_Shrine_MIS) || (OldInstance == ItWr_ShatteredGolem_MIS))
		{
			NewInstance = 0;
		};
	};
	if(CurrentLevel != OldWorld_Zen)
	{
		if((OldInstance == ItWr_Map_OldWorld) || (OldInstance == ItWr_Map_OldWorld_Oremines_MIS))
		{
			NewInstance = 0;
		};
	};
	if(CurrentLevel != DRAGONISLAND_ZEN)
	{
	};
	if(CurrentLevel != ADDONWORLD_ZEN)
	{
		if((OldInstance == ItWr_Map_AddonWorld) || (OldInstance == ItWR_Addon_TreasureMap))
		{
			NewInstance = 0;
		};
	};
	if(NewInstance <= 0)
	{
		NewInstance = B_GetBestPlayerMap();
	};
	if((NewInstance <= 0) && (OldInstance <= 0))
	{
		NewInstance = B_GetAnyPlayerMap();
	};
	if(NewInstance > 0)
	{
		B_SetPlayerMap(NewInstance);
		return NewInstance;
	};
	return OldInstance;
};

func void B_LameSchlork()
{
	Snd_Play("DRINKBOTTLE");
};

func int IsHeroStateValid()
{
	if((hero.aivar[AIV_INVINCIBLE] == FALSE) && ( // check if no active dialog and allow following body states:
		C_BodyStateContains(hero,BS_STAND) ||
		C_BodyStateContains(hero,BS_RUN) ||
		C_BodyStateContains(hero,BS_WALK) ||
		C_BodyStateContains(hero,BS_SNEAK) ||
		C_BodyStateContains(hero,BS_SPRINT)))
	{
		return TRUE;
	};
	return FALSE;
};

func void GetReadyToUseItem()
{
	AI_Standup(hero);
	AI_RemoveWeapon(hero);
};

var int AllowSpeedPotionHPFlag;
var int AllowSpeedPotionMPFlag;

func void DrinkSpeedPotion(var int allowSpeedPotion)
{
	if(allowSpeedPotion)
	{
		var int schnellerHeringCount;
		var int speedPotionCount;
		schnellerHeringCount = Npc_HasItems(hero,ItFo_Addon_SchnellerHering);
		speedPotionCount = Npc_HasItems(hero,ItPo_Speed);
		if(schnellerHeringCount > 0)
		{
			GetReadyToUseItem();
			PrintScreen(ConcatStrings(ConcatStrings("Использовано: Быстрая селедка (осталось: ",IntToString(schnellerHeringCount - 1)),")"),
				-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
			B_UseItem(hero,ItFo_Addon_SchnellerHering);
			AI_Wait(hero,0.01);
		}
		else if(speedPotionCount > 0)
		{
			GetReadyToUseItem();
			PrintScreen(ConcatStrings(ConcatStrings("Использовано: Зелье ускорения (осталось: ",IntToString(speedPotionCount - 1)),")"),
				-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
			B_UseItem(hero,ItPo_Speed);
			AI_Wait(hero,0.01);
		}
		else
		{
			PrintScreen("Нет зелий ускорения!",-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
		};
	}
	else
	{
		PrintScreen("Нажмите еще раз чтобы выпить зелье ускорения",-1,YPOS_LOGENTRY,FONT_ScreenSmall,4);
	};
};

func void player_hotkey_lame_potion()
{
	if((Npc_IsInState(hero,ZS_Dead) == FALSE) && (IsHeroStateValid() == TRUE))
	{
		if(Npc_HasItems(hero,ItPo_Mana_03) && ((hero.attribute[ATR_MANA_MAX] - hero.attribute[ATR_MANA]) >= (Mana_Elixier - 50))) // allow overpay 50 points
		{
			//Npc_ChangeAttribute(hero,ATR_MANA,Mana_Elixier);
			//Npc_RemoveInvItem(hero,ItPo_Mana_03);
			//B_LameSchlork();
			AllowSpeedPotionMPFlag = FALSE;
			GetReadyToUseItem();
			B_UseItem(hero,ItPo_Mana_03);
			AI_Wait(hero,0.01);
		}
		else if(Npc_HasItems(hero,ItPo_Mana_02) && ((hero.attribute[ATR_MANA_MAX] - hero.attribute[ATR_MANA]) >= (Mana_Extrakt - 30))) // allow overpay 30 points
		{
			//Npc_ChangeAttribute(hero,ATR_MANA,Mana_Extrakt);
			//Npc_RemoveInvItem(hero,ItPo_Mana_02);
			//B_LameSchlork();
			AllowSpeedPotionMPFlag = FALSE;
			GetReadyToUseItem();
			B_UseItem(hero,ItPo_Mana_02);
			AI_Wait(hero,0.01);
		}
		else if(Npc_HasItems(hero,ItPo_Mana_01) && ((hero.attribute[ATR_MANA_MAX] - hero.attribute[ATR_MANA]) >= (Mana_Essenz - 20))) // allow overpay 20 points
		{
			//Npc_ChangeAttribute(hero,ATR_MANA,Mana_Essenz);
			//Npc_RemoveInvItem(hero,ItPo_Mana_01);
			//B_LameSchlork();
			AllowSpeedPotionMPFlag = FALSE;
			GetReadyToUseItem();
			B_UseItem(hero,ItPo_Mana_01);
			AI_Wait(hero,0.01);
		}
		else if(hero.attribute[ATR_MANA_MAX] != hero.attribute[ATR_MANA])
		{
			if(Npc_HasItems(hero,ItPo_Mana_01))
			{
				//Npc_ChangeAttribute(hero,ATR_MANA,Mana_Essenz);
				//Npc_RemoveInvItem(hero,ItPo_Mana_01);
				//B_LameSchlork();
				AllowSpeedPotionMPFlag = FALSE;
				GetReadyToUseItem();
				B_UseItem(hero,ItPo_Mana_01);
				AI_Wait(hero,0.01);
			}
			else if(Npc_HasItems(hero,ItPo_Mana_02))
			{
				//Npc_ChangeAttribute(hero,ATR_MANA,Mana_Extrakt);
				//Npc_RemoveInvItem(hero,ItPo_Mana_02);
				//B_LameSchlork();
				AllowSpeedPotionMPFlag = FALSE;
				GetReadyToUseItem();
				B_UseItem(hero,ItPo_Mana_02);
				AI_Wait(hero,0.01);
			}
			else if(Npc_HasItems(hero,ItPo_Mana_03))
			{
				//Npc_ChangeAttribute(hero,ATR_MANA,Mana_Elixier);
				//Npc_RemoveInvItem(hero,ItPo_Mana_03);
				//B_LameSchlork();
				AllowSpeedPotionMPFlag = FALSE;
				GetReadyToUseItem();
				B_UseItem(hero,ItPo_Mana_03);
				AI_Wait(hero,0.01);
			}
			else
			{
				PrintScreen("Нет зелий маны!",-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
				DrinkSpeedPotion(AllowSpeedPotionMPFlag);
				if(AllowSpeedPotionMPFlag == FALSE)
				{
					AllowSpeedPotionMPFlag = TRUE;
				};
			};
		}
		else
		{
			PrintScreen("Уже максимальная мана!",-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
			DrinkSpeedPotion(AllowSpeedPotionMPFlag);
			if(AllowSpeedPotionMPFlag == FALSE)
			{
				AllowSpeedPotionMPFlag = TRUE;
			};
		};
	};
};

func void player_hotkey_lame_heal()
{
	if(Npc_IsInState(hero,ZS_Dead) == FALSE && (IsHeroStateValid() == TRUE))
	{
		var int hpCurrent;
		var int hpMax;
		var int hpToHeal;
		var int hpPercent;
		hpCurrent = hero.attribute[ATR_HITPOINTS];
		hpMax = hero.attribute[ATR_HITPOINTS_MAX];
		hpToHeal = hpMax - hpCurrent;
		hpPercent = (hpCurrent * 100) / hpMax;
		//Print(IntToString(hpPercent));
		if((hpMax >= 500) && Npc_HasItems(hero,ItAt_Sting) && (hpPercent <= 20) && (Knows_Bloodfly == TRUE) && (Bloodfly_Bonus <= 10))
		{
			//Npc_ChangeAttribute(hero,ATR_HITPOINTS,hpMax);
			//Npc_RemoveInvItem(hero,ItPo_Health_Addon_04);
			//B_LameSchlork();
			AllowSpeedPotionHPFlag = FALSE;
			GetReadyToUseItem();
			B_UseItem(hero,ItAt_Sting);
			AI_Wait(hero,0.01);
		}
		else if((hpMax >= 500) && Npc_HasItems(hero,ItPo_Health_Addon_04) && (hpPercent <= 20))
		{
			//Npc_ChangeAttribute(hero,ATR_HITPOINTS,hpMax);
			//Npc_RemoveInvItem(hero,ItPo_Health_Addon_04);
			//B_LameSchlork();
			AllowSpeedPotionHPFlag = FALSE;
			GetReadyToUseItem();
			B_UseItem(hero,ItPo_Health_Addon_04);
			AI_Wait(hero,0.01);
		}
		else if(Npc_HasItems(hero,ItPo_Health_03) && (hpToHeal >= (HP_Elixier - 10))) // allow overheal 10 points
		{
			//Npc_ChangeAttribute(hero,ATR_HITPOINTS,HP_Elixier);
			//Npc_RemoveInvItem(hero,ItPo_Health_03);
			//B_LameSchlork();
			AllowSpeedPotionHPFlag = FALSE;
			GetReadyToUseItem();
			B_UseItem(hero,ItPo_Health_03);
			AI_Wait(hero,0.01);
		}
		else if(Npc_HasItems(hero,ItPo_Health_02) && (hpToHeal >= (HP_Extrakt - 10))) // allow overheal 10 points
		{
			//Npc_ChangeAttribute(hero,ATR_HITPOINTS,HP_Extrakt);
			//Npc_RemoveInvItem(hero,ItPo_Health_02);
			//B_LameSchlork();
			AllowSpeedPotionHPFlag = FALSE;
			GetReadyToUseItem();
			B_UseItem(hero,ItPo_Health_02);
			AI_Wait(hero,0.01);
		}
		else if(Npc_HasItems(hero,ItPo_Health_01) && (hpToHeal >= (HP_Essenz - 10))) // allow overheal 10 points
		{
			//Npc_ChangeAttribute(hero,ATR_HITPOINTS,HP_Essenz);
			//Npc_RemoveInvItem(hero,ItPo_Health_01);
			//B_LameSchlork();
			AllowSpeedPotionHPFlag = FALSE;
			GetReadyToUseItem();
			B_UseItem(hero,ItPo_Health_01);
			AI_Wait(hero,0.01);
		}
		else if(hpMax > hpCurrent)
		{
			if(Npc_HasItems(hero,ItPo_Health_01))
			{
				//Npc_ChangeAttribute(hero,ATR_HITPOINTS,HP_Essenz);
				//Npc_RemoveInvItem(hero,ItPo_Health_01);
				//B_LameSchlork();
				AllowSpeedPotionHPFlag = FALSE;
				GetReadyToUseItem();
				B_UseItem(hero,ItPo_Health_01);
				AI_Wait(hero,0.01);
			}
			else if(Npc_HasItems(hero,ItPo_Health_02))
			{
				//Npc_ChangeAttribute(hero,ATR_HITPOINTS,HP_Extrakt);
				//Npc_RemoveInvItem(hero,ItPo_Health_02);
				//B_LameSchlork();
				AllowSpeedPotionHPFlag = FALSE;
				GetReadyToUseItem();
				B_UseItem(hero,ItPo_Health_02);
				AI_Wait(hero,0.01);
			}
			else if(Npc_HasItems(hero,ItPo_Health_03))
			{
				//Npc_ChangeAttribute(hero,ATR_HITPOINTS,HP_Elixier);
				//Npc_RemoveInvItem(hero,ItPo_Health_03);
				//B_LameSchlork();
				AllowSpeedPotionHPFlag = FALSE;
				GetReadyToUseItem();
				B_UseItem(hero,ItPo_Health_03);
				AI_Wait(hero,0.01);
			}
			else
			{
				PrintScreen("Нет лечебных зелий!",-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
				DrinkSpeedPotion(AllowSpeedPotionHPFlag);
				if(AllowSpeedPotionHPFlag == FALSE)
				{
					AllowSpeedPotionHPFlag = TRUE;
				};
			};
		}
		else
		{
			PrintScreen("Уже максимальное здоровье!",-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
			DrinkSpeedPotion(AllowSpeedPotionHPFlag);
			if(AllowSpeedPotionHPFlag == FALSE)
			{
				AllowSpeedPotionHPFlag = TRUE;
			};
		};
	};
};

