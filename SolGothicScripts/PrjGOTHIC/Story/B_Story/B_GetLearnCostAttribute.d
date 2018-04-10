
func int B_GetLearnCostAttribute(var C_Npc oth,var int attribut)
{
	var int kosten;
	kosten = 0;
	if(attribut == ATR_STRENGTH)
	{
		if(oth.aivar[REAL_STRENGTH] >= 100)
		{
			kosten = 4;
		}
		else if(oth.aivar[REAL_STRENGTH] >= 75)
		{
			kosten = 3;
		}
		else if(oth.aivar[REAL_STRENGTH] >= 50)
		{
			kosten = 2;
		}
		else
		{
			kosten = 1;
		};
	};
	if(attribut == ATR_DEXTERITY)
	{
		if(oth.aivar[REAL_DEXTERITY] >= 150)
		{
			kosten = 4;
		}
		else if(oth.aivar[REAL_DEXTERITY] >= 110)
		{
			kosten = 3;
		}
		else if(oth.aivar[REAL_DEXTERITY] >= 70)
		{
			kosten = 2;
		}
		else
		{
			kosten = 1;
		};
	};
	if(attribut == ATR_MANA_MAX)
	{
		kosten = 1;
	};
	return kosten;
};

