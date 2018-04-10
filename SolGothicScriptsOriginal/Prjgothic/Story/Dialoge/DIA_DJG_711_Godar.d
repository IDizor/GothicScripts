
instance DIA_Godar_EXIT(C_Info)
{
	npc = DJG_711_Godar;
	nr = 999;
	condition = DIA_Godar_EXIT_Condition;
	information = DIA_Godar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Godar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Godar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Godar_Hello(C_Info)
{
	npc = DJG_711_Godar;
	nr = 4;
	condition = DIA_Godar_Hello_Condition;
	information = DIA_Godar_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Godar_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Godar_Hello_Info()
{
	AI_Output(self,other,"DIA_Godar_Hello_13_00");	//�-�? ���?
};


instance DIA_Godar_ComeFrom(C_Info)
{
	npc = DJG_711_Godar;
	nr = 4;
	condition = DIA_Godar_ComeFrom_Condition;
	information = DIA_Godar_ComeFrom_Info;
	permanent = FALSE;
	description = "������ ��?";
};


func int DIA_Godar_ComeFrom_Condition()
{
	return TRUE;
};

func void DIA_Godar_ComeFrom_Info()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_15_00");	//������ ��?
	AI_Output(self,other,"DIA_Godar_ComeFrom_13_01");	//�� ������... �-�, �� ������.
	Info_ClearChoices(DIA_Godar_ComeFrom);
	Info_AddChoice(DIA_Godar_ComeFrom,"�� �������!",DIA_Godar_ComeFrom_Bandits);
	Info_AddChoice(DIA_Godar_ComeFrom,"� ���-�� �� ����� ���� � ������.",DIA_Godar_ComeFrom_NotCity);
	Info_AddChoice(DIA_Godar_ComeFrom,"�������. �� �� ������.",DIA_Godar_ComeFrom_Understand);
};

func void DIA_Godar_ComeFrom_Bandits()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_Bandits_15_00");	//�� �������!
	AI_Output(self,other,"DIA_Godar_ComeFrom_Bandits_13_01");	//������������! ���� ���� �� ������� ���� �� �����!
	Info_ClearChoices(DIA_Godar_ComeFrom);
	Info_AddChoice(DIA_Godar_ComeFrom,"����������. � �� ���� ������� ���.",DIA_Godar_ComeFrom_Bandits_KeepCalm);
	Info_AddChoice(DIA_Godar_ComeFrom,"���� �� �������� ����.",DIA_Godar_ComeFrom_Bandits_NoFear);
};

func void DIA_Godar_ComeFrom_Bandits_KeepCalm()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_Bandits_KeepCalm_15_00");	//����������. � �� ���� ������� ���.
	AI_Output(self,other,"DIA_Godar_ComeFrom_Bandits_KeepCalm_13_01");	//�������. ��� ��� ����� �� ������. � �� �� ������� ���� ������!
	Info_ClearChoices(DIA_Godar_ComeFrom);
};

func void DIA_Godar_ComeFrom_Bandits_NoFear()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_Bandits_NoFear_15_00");	//���� �� �������� ����.
	AI_Output(self,other,"DIA_Godar_ComeFrom_Bandits_NoFear_13_01");	//��, ��� �� ��� ���������.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Godar_ComeFrom_NotCity()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_NotCity_15_00");	//� ���-�� �� ����� ���� � ������.
	AI_Output(self,other,"DIA_Godar_ComeFrom_NotCity_13_01");	//�� ������ �����, ������� ���� ��� �� � ���� ����. �����?
	Info_ClearChoices(DIA_Godar_ComeFrom);
	Info_AddChoice(DIA_Godar_ComeFrom,"���.",DIA_Godar_ComeFrom_NotCity_CutThroat);
	Info_AddChoice(DIA_Godar_ComeFrom,"�����. �� ������ �� ������.",DIA_Godar_ComeFrom_NotCity_Forget);
};

func void DIA_Godar_ComeFrom_NotCity_Forget()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_NotCity_Forget_15_00");	//�����. �� ������ �� ������.
	AI_Output(self,other,"DIA_Godar_ComeFrom_NotCity_Forget_13_01");	//������.
	Info_ClearChoices(DIA_Godar_ComeFrom);
};

func void DIA_Godar_ComeFrom_NotCity_CutThroat()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_NotCity_CutThroat_15_00");	//���.
	AI_Output(self,other,"DIA_Godar_ComeFrom_NotCity_CutThroat_13_01");	//����� ��� �������� ��������� ��� � �������...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Godar_ComeFrom_Understand()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_Understand_15_00");	//�������. �� �� ������.
	AI_Output(self,other,"DIA_Godar_ComeFrom_Understand_13_01");	//������! �� ��� ���������!
	AI_Output(self,other,"DIA_Godar_ComeFrom_Understand_13_02");	//���, ������!
	CreateInvItems(self,ItFo_Beer,1);
	B_GiveInvItems(self,other,ItFo_Beer,1);
	B_UseItem(other,ItFo_Beer);
	Info_ClearChoices(DIA_Godar_ComeFrom);
};


instance DIA_Godar_Plan(C_Info)
{
	npc = DJG_711_Godar;
	nr = 5;
	condition = DIA_Godar_Plan_Condition;
	information = DIA_Godar_Plan_Info;
	permanent = FALSE;
	description = "��� �� ������� �����?";
};


func int DIA_Godar_Plan_Condition()
{
	return TRUE;
};

func void DIA_Godar_Plan_Info()
{
	AI_Output(other,self,"DIA_Godar_Plan_15_00");	//��� �� ������� �����?
	AI_Output(self,other,"DIA_Godar_Plan_13_01");	//�� �������� �� ����� �� ��������. ��... �� ������� ���� ������� � ������ ����.
	AI_Output(self,other,"DIA_Godar_Plan_13_02");	//��, ������ ����������, ��� ������� �� ��������. ��� ����� ������.
	AI_Output(self,other,"DIA_Godar_Plan_13_03");	//� �������� ���� ���� ������, ������?
	AI_Output(other,self,"DIA_Godar_Plan_15_04");	//�������.
};


instance DIA_Godar_DragonLore(C_Info)
{
	npc = DJG_711_Godar;
	nr = 5;
	condition = DIA_Godar_DragonLore_Condition;
	information = DIA_Godar_DragonLore_Info;
	permanent = FALSE;
	description = "��� �� ������ � ��������?";
};


func int DIA_Godar_DragonLore_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Godar_Plan))
	{
		return TRUE;
	};
};

func void DIA_Godar_DragonLore_Info()
{
	AI_Output(other,self,"DIA_Godar_DragonLore_15_00");	//��� �� ������ � ��������?
	AI_Output(self,other,"DIA_Godar_DragonLore_13_01");	//� ���� � ��� ������ �� ������� ������.
	AI_Output(self,other,"DIA_Godar_DragonLore_13_02");	//���������, ������������, ������, �������� ������� � ��� �����.
};


instance DIA_Godar_Destination(C_Info)
{
	npc = DJG_711_Godar;
	nr = 5;
	condition = DIA_Godar_Destination_Condition;
	information = DIA_Godar_Destination_Info;
	permanent = FALSE;
	description = "� ���� �� ����������� ���� ������?";
};


func int DIA_Godar_Destination_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Godar_Plan))
	{
		return TRUE;
	};
};

func void DIA_Godar_Destination_Info()
{
	AI_Output(other,self,"DIA_Godar_Destination_15_00");	//� ���� �� ����������� ���� ������?
	AI_Output(self,other,"DIA_Godar_Destination_13_01");	//������� �� ����. �� ��� ��� ������ ��� ����.
	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
	{
		AI_Output(other,self,"DIA_Godar_Destination_15_02");	//�� ����� �� ����� � �����.
		AI_Output(self,other,"DIA_Godar_Destination_13_03");	//���� ���� ������ �� ��������. ��� ��. ������ �� � ���������.
		AI_Output(self,other,"DIA_Godar_Destination_13_04");	//� �� ���� ������� � ������. � ��� ��� ���, � ��� ����� �������.
	};
};


instance DIA_Godar_Orks(C_Info)
{
	npc = DJG_711_Godar;
	nr = 5;
	condition = DIA_Godar_Orks_Condition;
	information = DIA_Godar_Orks_Info;
	permanent = FALSE;
	description = "��� ������ �����?";
};


func int DIA_Godar_Orks_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Godar_Destination))
	{
		return TRUE;
	};
};

func void DIA_Godar_Orks_Info()
{
	AI_Output(other,self,"DIA_Godar_Orks_15_00");	//��� ������ �����?
	AI_Output(self,other,"DIA_Godar_Orks_13_01");	//��� ������� ���� �����.
	AI_Output(self,other,"DIA_Godar_Orks_13_02");	//�������� ���������� ���� - ������ �������. ���� �� ������ ��������� � ������, �� ����� ������ ������� ���� ������.
	AI_Output(self,other,"DIA_Godar_Orks_13_03");	//������ �� ��������� ����.
	AI_Output(other,self,"DIA_Godar_Orks_15_04");	//��, �������������.
};


instance DIA_Godar_Prison(C_Info)
{
	npc = DJG_711_Godar;
	nr = 5;
	condition = DIA_Godar_Prison_Condition;
	information = DIA_Godar_Prison_Info;
	permanent = FALSE;
	description = "�� ��� �� �����?";
};


func int DIA_Godar_Prison_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Godar_Destination) && ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL)))
	{
		return TRUE;
	};
};

func void DIA_Godar_Prison_Info()
{
	AI_Output(other,self,"DIA_Godar_Prison_15_00");	//�� ��� �� �����?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Godar_Prison_13_01");	//��� � ���� � ������! ��!
		AI_Output(self,other,"DIA_Godar_Prison_13_02");	//��, ����, ������ � ����������. ���, ������. ������ �� ����.
	}
	else
	{
		AI_Output(self,other,"DIA_Godar_Prison_13_03");	//��� ������ ������� ���� �� �������������. �� ���� ������ ������!
		AI_Output(self,other,"DIA_Godar_Prison_13_04");	//��� ���� 10 ��� �� ���!
		AI_Output(other,self,"DIA_Godar_Prison_15_05");	//��� ���?
		AI_Output(self,other,"DIA_Godar_Prison_13_06");	//��... ������� ��, � ���������...
		AI_Output(other,self,"DIA_Godar_Prison_15_07");	//�?
		AI_Output(self,other,"DIA_Godar_Prison_13_08");	//� ��� �� ������. ���� ������ ��� ������������� � ������ ���� ���. ������!
		Info_ClearChoices(DIA_Godar_Prison);
		Info_AddChoice(DIA_Godar_Prison,"�������� �����.",DIA_Godar_Prison_Court);
		Info_AddChoice(DIA_Godar_Prison,"���� �� ��������� ����������.",DIA_Godar_Prison_Pissoff);
	};
};

func void DIA_Godar_Prison_Court()
{
	AI_Output(other,self,"DIA_Godar_Prison_Court_15_00");	//�������� �������.
	AI_Output(self,other,"DIA_Godar_Prison_Court_13_01");	//�� ��������� ����? ��� �������� ������ ������� �� �����, ��� ��� ������.
	AI_Output(self,other,"DIA_Godar_Prison_Court_13_02");	//��, �� ������� ����, �� ��� �� �������.
	Info_ClearChoices(DIA_Godar_Prison);
	GodarLikesYou = TRUE;
};

func void DIA_Godar_Prison_Pissoff()
{
	AI_Output(other,self,"DIA_Godar_Prison_Pissoff_15_00");	//���� �� ��������� ����������.
	AI_Output(self,other,"DIA_Godar_Prison_Pissoff_13_01");	//(�������) �������, �� ������� �� ��� � ������, ��� ����?
	AI_Output(self,other,"DIA_Godar_Prison_Pissoff_13_02");	//������ � ������ ����, ��� ����� ����� � ��������� � ������!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Godar_Hunting(C_Info)
{
	npc = DJG_711_Godar;
	nr = 5;
	condition = DIA_Godar_Hunting_Condition;
	information = DIA_Godar_Hunting_Info;
	permanent = FALSE;
	description = "�� ������ ������� ���� ���������?";
};


func int DIA_Godar_Hunting_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Godar_Prison) && ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDF)))
	{
		return TRUE;
	};
};

func void DIA_Godar_Hunting_Info()
{
	AI_Output(other,self,"DIA_Godar_Hunting_15_00");	//�� ������ ������� ���� ���������?
	if(GodarLikesYou == FALSE)
	{
		AI_Output(self,other,"DIA_Godar_Hunting_13_01");	//�� ������? �� �� ���!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Godar_Hunting_13_03");	//�������� - ��� �� ������ ����. �� ����� ������ ��������� �� ����� ��� �����. ��� �������� ������.
		AI_Output(self,other,"DIA_Godar_Hunting_13_04");	//��������� �� ����, ����� �� ��������� �� ����� �������!
		Godar_TeachAnimalTrophy = TRUE;
	};
};


instance DIA_Godar_Dragonstuff(C_Info)
{
	npc = DJG_711_Godar;
	nr = 5;
	condition = DIA_Godar_Dragonstuff_Condition;
	information = DIA_Godar_Dragonstuff_Info;
	permanent = TRUE;
	description = "�������� ���, ��� ��������� �������.";
};


var int Godar_TeachDragonStuff;

func int DIA_Godar_Dragonstuff_Condition()
{
	if((Godar_TeachAnimalTrophy == TRUE) && ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL)) && ((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] == FALSE)) && (Godar_TeachDragonStuff == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Godar_Dragonstuff_Info()
{
	AI_Output(other,self,"DIA_Godar_Dragonstuff_15_00");	//�������� ���, ��� ��������� �������.
	AI_Output(self,other,"DIA_Godar_Dragonstuff_13_01");	//����� �� ������� ��� ��������� ����, ��?
	AI_Output(self,other,"DIA_Godar_Dragonstuff_13_02");	//�����, ������, �� �� ��������� ���� � 1000 �������.
	Info_ClearChoices(DIA_Godar_Dragonstuff);
	Info_AddChoice(DIA_Godar_Dragonstuff,"��� ��� �� ����� ���������.",DIA_Godar_Dragonstuff_nein);
	Info_AddChoice(DIA_Godar_Dragonstuff,"��� ������.",DIA_Godar_Dragonstuff_fair);
};

func void DIA_Godar_Dragonstuff_fair()
{
	AI_Output(other,self,"DIA_Godar_Dragonstuff_fair_15_00");	//��� ������.
	if(B_GiveInvItems(other,self,ItMi_Gold,1000))
	{
		Godar_TeachDragonStuff = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Godar_Dragonstuff_fair_13_01");	//��� ����� �� �����. ������� ��������� ������.
	};
	Info_ClearChoices(DIA_Godar_Dragonstuff);
};

func void DIA_Godar_Dragonstuff_nein()
{
	AI_Output(other,self,"DIA_Godar_Dragonstuff_nein_15_00");	//��� ��� �� ����� ���������.
	AI_Output(self,other,"DIA_Godar_Dragonstuff_nein_13_01");	//��� ������.
	Info_ClearChoices(DIA_Godar_Dragonstuff);
};


instance DIA_Godar_Teach(C_Info)
{
	npc = DJG_711_Godar;
	nr = 5;
	condition = DIA_Godar_Teach_Condition;
	information = DIA_Godar_Teach_Info;
	permanent = TRUE;
	description = "����� ���� ���������.";
};


func int DIA_Godar_Teach_Condition()
{
	if((Godar_TeachAnimalTrophy == TRUE) && ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL)))
	{
		return TRUE;
	};
};

func void DIA_Godar_Teach_Info()
{
	AI_Output(other,self,"DIA_Godar_Teach_15_00");	//����� ���� ���������.
	if((Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] == FALSE))
	{
		Info_AddChoice(DIA_Godar_Teach,Dialog_Back,DIA_Godar_Teach_Back);
		if(Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == FALSE)
		{
			Info_AddChoice(DIA_Godar_Teach,B_BuildLearnString("��������",B_GetLearnCostTalent(other,NPC_TALENT_SNEAK,1)),DIA_Godar_Teach_Thief_Sneak);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE)
		{
			Info_AddChoice(DIA_Godar_Teach,B_BuildLearnString("�������� �����",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Teeth)),DIA_Godar_Teach_TROPHYS_Teeth);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == FALSE)
		{
			Info_AddChoice(DIA_Godar_Teach,B_BuildLearnString("���� �������� ����",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFSting)),DIA_Godar_Teach_TROPHYS_BFSting);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == FALSE)
		{
			Info_AddChoice(DIA_Godar_Teach,B_BuildLearnString("������ �������� ����",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFWing)),DIA_Godar_Teach_TROPHYS_BFWing);
		};
		if(Godar_TeachDragonStuff == TRUE)
		{
			if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] == FALSE)
			{
				Info_AddChoice(DIA_Godar_Teach,B_BuildLearnString("�������� ����� ��������",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DragonScale)),DIA_Godar_Teach_TROPHYS_DragonScale);
			};
			if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] == FALSE)
			{
				Info_AddChoice(DIA_Godar_Teach,B_BuildLearnString("���� ����� �������",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DragonBlood)),DIA_Godar_Teach_TROPHYS_DragonBlood);
			};
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNYOUREBETTER");
	};
};

func void DIA_Godar_Teach_Back()
{
	Info_ClearChoices(DIA_Godar_Teach);
};

func void DIA_Godar_Teach_TROPHYS_Teeth()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Teeth))
	{
		AI_Output(self,other,"DIA_Godar_TEACHHUNTING_Teeth_13_00");	//���� ����� ����� �������� ��� ������ �������� ����.
	};
	Info_ClearChoices(DIA_Godar_Teach);
};

func void DIA_Godar_Teach_TROPHYS_BFSting()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_BFSting))
	{
		AI_Output(self,other,"DIA_Godar_TEACHHUNTING_BFSting_13_00");	//����� ������ ���� �������� ����, ����� ������� �������� ��� �� �� ����.
	};
	Info_ClearChoices(DIA_Godar_Teach);
};

func void DIA_Godar_Teach_TROPHYS_BFWing()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_BFWing))
	{
		AI_Output(self,other,"DIA_Godar_TEACHHUNTING_BFWing_13_00");	//������ �������� ��� ����� ������. ����� ���� ����� ����������, ����� ��������� ��.
	};
	Info_ClearChoices(DIA_Godar_Teach);
};

func void DIA_Godar_Teach_Thief_Sneak()
{
	if(B_TeachThiefTalent(self,other,NPC_TALENT_SNEAK))
	{
		AI_Output(self,other,"DIA_Godar_TEACHHUNTING_Sneak_13_00");	//����� �������� ��������, ����� ����� ������������ ������ �����. ������� ������� ������ ������� ����� ����.
	};
	Info_ClearChoices(DIA_Godar_Teach);
};

func void DIA_Godar_Teach_TROPHYS_DragonScale()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_DragonScale))
	{
		AI_Output(self,other,"DIA_Godar_TEACHHUNTING_DragonScale_13_00");	//����� �������� ����� �������, ����� ����� ����� ���. �� �� ����������.
	};
	Info_ClearChoices(DIA_Godar_Teach);
};

func void DIA_Godar_Teach_TROPHYS_DragonBlood()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_DragonBlood))
	{
		AI_Output(self,other,"DIA_Godar_TEACHHUNTING_DragonBlood_13_00");	//����� ������ ����� �� ������ �������. ��� ����� ����� ������� ��� �����.
	};
	Info_ClearChoices(DIA_Godar_Teach);
};


instance DIA_Godar_AllDragonsDead(C_Info)
{
	npc = DJG_711_Godar;
	nr = 5;
	condition = DIA_Godar_AllDragonsDead_Condition;
	information = DIA_Godar_AllDragonsDead_Info;
	permanent = FALSE;
	description = "� ���� ���� ��������.";
};


func int DIA_Godar_AllDragonsDead_Condition()
{
	if(MIS_AllDragonsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Godar_AllDragonsDead_Info()
{
	AI_Output(other,self,"DIA_Godar_AllDragonsDead_15_00");	//� ���� ���� ��������.
	AI_Output(self,other,"DIA_Godar_AllDragonsDead_13_01");	//�� � �����. �����, � ������, �� ��� ����� ������, ��� ����������.
};


instance DIA_Godar_PICKPOCKET(C_Info)
{
	npc = DJG_711_Godar;
	nr = 900;
	condition = DIA_Godar_PICKPOCKET_Condition;
	information = DIA_Godar_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Godar_PICKPOCKET_Condition()
{
	return C_Beklauen(16,160);
};

func void DIA_Godar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Godar_PICKPOCKET);
	Info_AddChoice(DIA_Godar_PICKPOCKET,Dialog_Back,DIA_Godar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Godar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Godar_PICKPOCKET_DoIt);
};

func void DIA_Godar_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Godar_PICKPOCKET);
};

func void DIA_Godar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Godar_PICKPOCKET);
};

