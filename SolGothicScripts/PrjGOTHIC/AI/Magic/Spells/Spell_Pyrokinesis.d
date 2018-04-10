
const int SPL_COST_Firestorm = 160;		//max mana
const int STEP_Firestorm = 40;			//min mana
const int SPL_Damage_Firestorm = 100;	//min damage
const int SPL_PYRO_DAMAGE_PER_SEC = 25; //debaf damage per second

instance Spell_Pyrokinesis(C_Spell_Proto)
{
	time_per_mana = 15;
	damage_per_level = SPL_Damage_Firestorm;
	damagetype = DAM_MAGIC;
	canTurnDuringInvest = TRUE;
};


func int Spell_Logic_Pyrokinesis(var int manaInvested)
{
	if(self.attribute[ATR_MANA] < STEP_Firestorm)
	{
		return SPL_DONTINVEST;
	};
	if(manaInvested <= (STEP_Firestorm * 1))
	{
		self.aivar[AIV_SpellLevel] = 1;
		return SPL_STATUS_CANINVEST_NO_MANADEC;
	}
	else if((manaInvested > (STEP_Firestorm * 1)) && (self.aivar[AIV_SpellLevel] <= 1))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - STEP_Firestorm;
		if(self.attribute[ATR_MANA] < 0)
		{
			self.attribute[ATR_MANA] = 0;
		};
		self.aivar[AIV_SpellLevel] = 2;
		return SPL_NEXTLEVEL;
	}
	else if((manaInvested > (STEP_Firestorm * 2)) && (self.aivar[AIV_SpellLevel] <= 2))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - STEP_Firestorm;
		if(self.attribute[ATR_MANA] < 0)
		{
			self.attribute[ATR_MANA] = 0;
		};
		self.aivar[AIV_SpellLevel] = 3;
		return SPL_NEXTLEVEL;
	}
	else if((manaInvested > (STEP_Firestorm * 3)) && (self.aivar[AIV_SpellLevel] <= 3))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - STEP_Firestorm;
		if(self.attribute[ATR_MANA] < 0)
		{
			self.attribute[ATR_MANA] = 0;
		};
		self.aivar[AIV_SpellLevel] = 4;
		return SPL_NEXTLEVEL;
	}
	else if((manaInvested > (STEP_Firestorm * 3)) && (self.aivar[AIV_SpellLevel] == 4))
	{
		return SPL_DONTINVEST;
	};
	return SPL_STATUS_CANINVEST_NO_MANADEC;
};

func void Spell_Cast_Pyrokinesis(var int spellLevel)
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - STEP_Firestorm;
	if(self.attribute[ATR_MANA] < 0)
	{
		self.attribute[ATR_MANA] = 0;
	};
	self.aivar[AIV_SelectSpell] += 1;
};

