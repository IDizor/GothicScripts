
func int B_GetLearnCostAttribute(var C_Npc oth,var int attribut)
{
	var int kosten;
	kosten = 0;
	if(attribut == ATR_STRENGTH)
	{
		if(oth.aivar[LEARN_STRENGTH] >= 90)
		{
			kosten = 4;
		}
		else if(oth.aivar[LEARN_STRENGTH] >= 65)
		{
			kosten = 3;
		}
		else if(oth.aivar[LEARN_STRENGTH] >= 40)
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
		if(oth.aivar[LEARN_DEXTERITY] >= 140)
		{
			kosten = 4;
		}
		else if(oth.aivar[LEARN_DEXTERITY] >= 100)
		{
			kosten = 3;
		}
		else if(oth.aivar[LEARN_DEXTERITY] >= 60)
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

