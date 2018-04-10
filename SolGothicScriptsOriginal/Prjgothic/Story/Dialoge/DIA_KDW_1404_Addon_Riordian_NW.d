
instance DIA_Addon_Riordian_EXIT(C_Info)
{
	npc = KDW_1404_Addon_Riordian_NW;
	nr = 999;
	condition = DIA_Addon_Riordian_EXIT_Condition;
	information = DIA_Addon_Riordian_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Riordian_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Riordian_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Riordian_Hallo(C_Info)
{
	npc = KDW_1404_Addon_Riordian_NW;
	nr = 5;
	condition = DIA_Addon_Riordian_Hallo_Condition;
	information = DIA_Addon_Riordian_Hallo_Info;
	description = "��� �� ����� �������?";
};


func int DIA_Addon_Riordian_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Addon_Riordian_Hallo_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Hallo_15_00");	//��� �� �����������?
	AI_Output(self,other,"DIA_Addon_Riordian_Hallo_10_01");	//� ������ �������� �������� ������.
	AI_Output(self,other,"DIA_Addon_Riordian_Hallo_10_02");	//���� �� �� �������, ��� ���� ����� � ������� �������.
	AI_Output(self,other,"DIA_Addon_Riordian_Hallo_10_03");	//� ����� �� ����, ����� ������ ��� ������� ��� ����, �� ��� � �� ����� �� ����������� ���� ���������� ��������������.
	AI_Output(self,other,"DIA_Addon_Riordian_Hallo_10_04");	//�� ������ ������� ��� ��� ��������� ���� ����� �, ��-��������, ��������� ���� �������.
};


instance DIA_Addon_Riordian_Alter(C_Info)
{
	npc = KDW_1404_Addon_Riordian_NW;
	nr = 6;
	condition = DIA_Addon_Riordian_Alter_Condition;
	information = DIA_Addon_Riordian_Alter_Info;
	description = "��� �� �������, ������� ��� ����� ������?";
};


func int DIA_Addon_Riordian_Alter_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Riordian_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_Alter_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Alter_15_00");	//��� �� �������, ������� ��� ����� ������?
	AI_Output(self,other,"DIA_Addon_Riordian_Alter_10_01");	//�� ���� ������� �����. ��������� �����.
};


instance DIA_Addon_Riordian_Atlantis(C_Info)
{
	npc = KDW_1404_Addon_Riordian_NW;
	nr = 4;
	condition = DIA_Addon_Riordian_Atlantis_Condition;
	information = DIA_Addon_Riordian_Atlantis_Info;
	description = "���������� ����� �� ��������?";
};


func int DIA_Addon_Riordian_Atlantis_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Riordian_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_Atlantis_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Atlantis_15_00");	//���������� ����� �� ��������?
	AI_Output(self,other,"DIA_Addon_Riordian_Atlantis_10_01");	//��. �� ���������� ������� �� ���� �������, ��� ����� �� ������� ���.
	AI_Output(self,other,"DIA_Addon_Riordian_Atlantis_10_02");	//�� �������, ��� ���� ������-������ ������� - ���� ������� ������ ������.
	AI_Output(self,other,"DIA_Addon_Riordian_Atlantis_10_03");	//�� �� ���������.
	AI_Output(self,other,"DIA_Addon_Riordian_Atlantis_10_04");	//�� ����� ������ ����� ������. ��� � ������������ ���� ������� �����.
	AI_Output(self,other,"DIA_Addon_Riordian_Atlantis_10_05");	//(��������) � �� ����� ����� ��������� �� ��� ��������� ������, �� ��� ��������� ����� ����������� � ����...
	B_LogEntry(TOPIC_Addon_KDW,"���� ���� �������, ��� �� �������� ��������� ������� ���������� �����.");
};


instance DIA_Addon_Riordian_SaturasWantYou(C_Info)
{
	npc = KDW_1404_Addon_Riordian_NW;
	nr = 5;
	condition = DIA_Addon_Riordian_SaturasWantYou_Condition;
	information = DIA_Addon_Riordian_SaturasWantYou_Info;
	description = "������� ����� ���� ������.";
};


func int DIA_Addon_Riordian_SaturasWantYou_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Riordian_Hallo) && (MIS_Addon_Saturas_BringRiordian2Me == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_SaturasWantYou_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_SaturasWantYou_15_00");	//������� ����� ���� ������.
	AI_Output(self,other,"DIA_Addon_Riordian_SaturasWantYou_10_01");	//��� ������� �������� ��������� � �������������? � ����� ������ � ����������� � ���� ����������.
	if(Nefarius_NW.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Riordian_SaturasWantYou_10_02");	//���� �� ������ ������ �� ���� ��������� ������, �������� � ����������.
		AI_Output(self,other,"DIA_Addon_Riordian_SaturasWantYou_10_03");	//�� ������� ��� � ������� ����� �����.
	};
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Saturas");
	MIS_Addon_Saturas_BringRiordian2Me = LOG_SUCCESS;
	B_GivePlayerXP(XP_Ambient);
};


var int Riordian_PermNews;

instance DIA_Addon_Riordian_Perm(C_Info)
{
	npc = KDW_1404_Addon_Riordian_NW;
	nr = 99;
	condition = DIA_Addon_Riordian_Perm_Condition;
	information = DIA_Addon_Riordian_Perm_Info;
	permanent = TRUE;
	description = "���� ���-������ �����?";
};


func int DIA_Addon_Riordian_Perm_Condition()
{
	if(MIS_Addon_Saturas_BringRiordian2Me == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_Perm_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Perm_15_00");	//���� ���-������ �����?
	if(Riordian_PermNews == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Riordian_Perm_10_01");	//��! � ����� �������������, ��� ��� ������� ����������� ������������� ����������� �������!
		Riordian_PermNews = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Riordian_Perm_10_02");	//���, ���� ���. ������� �����.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Riordian_TeachPre(C_Info)
{
	npc = KDW_1404_Addon_Riordian_NW;
	nr = 5;
	condition = DIA_Addon_Riordian_TeachPre_Condition;
	information = DIA_Addon_Riordian_TeachPre_Info;
	description = "������ ��� ��� ���� ������ ������� �������...";
};


func int DIA_Addon_Riordian_TeachPre_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Riordian_Hallo) && Npc_HasItems(other,ItAm_Addon_WispDetector))
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_TeachPre_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_TeachPre_15_00");	//������ ��� ��� ���� ������ ������� �������...
	AI_Output(self,other,"DIA_Addon_Riordian_TeachPre_10_01");	//���! (���������������) ��� ������ ��������... �� ������, ��� �� ������ ������� ������ �������?
	AI_Output(other,self,"DIA_Addon_Riordian_TeachPre_15_02");	//�� ������ ������� ���� �����?
	AI_Output(self,other,"DIA_Addon_Riordian_TeachPre_10_03");	//��, �������. � ������ ����� ��������� ���� �������� �����.
	Riordian_Addon_TeachPlayer = TRUE;
	Log_CreateTopic(TOPIC_Addon_KDWTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_Addon_KDWTeacher,LogText_Addon_RiordianTeach);
};


instance DIA_Addon_Riordian_Teach(C_Info)
{
	npc = KDW_1404_Addon_Riordian_NW;
	nr = 90;
	condition = DIA_Addon_Riordian_Teach_Condition;
	information = DIA_Addon_Riordian_Teach_Info;
	permanent = TRUE;
	description = "������ ���, ��� ����������� ���� ���������� ������.";
};


var int DIA_Addon_Riordian_Teach_NoPerm;

func int DIA_Addon_Riordian_Teach_Condition()
{
	if((Riordian_Addon_TeachPlayer == TRUE) && (DIA_Addon_Riordian_Teach_NoPerm == FALSE) && Npc_HasItems(other,ItAm_Addon_WispDetector))
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_Teach_Info()
{
	B_DIA_Addon_Riordian_Teach_15_00();
	if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NF] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] == FALSE))
	{
		Info_ClearChoices(DIA_Addon_Riordian_Teach);
		Info_AddChoice(DIA_Addon_Riordian_Teach,Dialog_Back,DIA_Addon_Riordian_Teach_BACK);
		B_DIA_Addon_Riordian_Teach_10_01();
		if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF] == FALSE)
		{
			Info_AddChoice(DIA_Addon_Riordian_Teach,B_BuildLearnString(NAME_ADDON_WISPSKILL_FF,B_GetLearnCostTalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_FF)),DIA_Addon_Riordian_Teach_WISPSKILL_FF);
		};
		if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] == FALSE)
		{
			Info_AddChoice(DIA_Addon_Riordian_Teach,B_BuildLearnString(NAME_ADDON_WISPSKILL_NONE,B_GetLearnCostTalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_NONE)),DIA_Addon_Riordian_Teach_WISPSKILL_NONE);
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] == FALSE) && (WISPSKILL_LEVEL >= 2))
		{
			Info_AddChoice(DIA_Addon_Riordian_Teach,B_BuildLearnString(NAME_ADDON_WISPSKILL_RUNE,B_GetLearnCostTalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_RUNE)),DIA_Addon_Riordian_Teach_WISPSKILL_RUNE);
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] == FALSE) && (WISPSKILL_LEVEL >= 2))
		{
			Info_AddChoice(DIA_Addon_Riordian_Teach,B_BuildLearnString(NAME_ADDON_WISPSKILL_MAGIC,B_GetLearnCostTalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_MAGIC)),DIA_Addon_Riordian_Teach_WISPSKILL_MAGIC);
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] == FALSE) && (WISPSKILL_LEVEL >= 3))
		{
			Info_AddChoice(DIA_Addon_Riordian_Teach,B_BuildLearnString(NAME_ADDON_WISPSKILL_FOOD,B_GetLearnCostTalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_FOOD)),DIA_Addon_Riordian_Teach_WISPSKILL_FOOD);
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] == FALSE) && (WISPSKILL_LEVEL >= 3))
		{
			Info_AddChoice(DIA_Addon_Riordian_Teach,B_BuildLearnString(NAME_ADDON_WISPSKILL_POTIONS,B_GetLearnCostTalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_POTIONS)),DIA_Addon_Riordian_Teach_WISPSKILL_POTIONS);
		};
	}
	else
	{
		B_DIA_Addon_Riordian_Teach_10_08();
		DIA_Addon_Riordian_Teach_NoPerm = TRUE;
	};
};

func void DIA_Addon_Riordian_Teach_WISPSKILL_X()
{
	B_DIA_Addon_Riordian_Teach_WISPSKILL_X_10_00();
};

func void DIA_Addon_Riordian_Teach_BACK()
{
	Info_ClearChoices(DIA_Addon_Riordian_Teach);
};

func void DIA_Addon_Riordian_Teach_WISPSKILL_FF()
{
	if(B_TeachPlayerTalentWispDetector(self,other,WISPSKILL_FF))
	{
		if(WISPSKILL_LEVEL < 2)
		{
			WISPSKILL_LEVEL = 2;
		};
		DIA_Addon_Riordian_Teach_WISPSKILL_X();
	};
	Info_ClearChoices(DIA_Addon_Riordian_Teach);
};

func void DIA_Addon_Riordian_Teach_WISPSKILL_NONE()
{
	if(B_TeachPlayerTalentWispDetector(self,other,WISPSKILL_NONE))
	{
		if(WISPSKILL_LEVEL < 2)
		{
			WISPSKILL_LEVEL = 2;
		};
		DIA_Addon_Riordian_Teach_WISPSKILL_X();
	};
	Info_ClearChoices(DIA_Addon_Riordian_Teach);
};

func void DIA_Addon_Riordian_Teach_WISPSKILL_RUNE()
{
	if(B_TeachPlayerTalentWispDetector(self,other,WISPSKILL_RUNE))
	{
		if(WISPSKILL_LEVEL < 3)
		{
			WISPSKILL_LEVEL = 3;
		};
		DIA_Addon_Riordian_Teach_WISPSKILL_X();
	};
	Info_ClearChoices(DIA_Addon_Riordian_Teach);
};

func void DIA_Addon_Riordian_Teach_WISPSKILL_MAGIC()
{
	if(B_TeachPlayerTalentWispDetector(self,other,WISPSKILL_MAGIC))
	{
		if(WISPSKILL_LEVEL < 3)
		{
			WISPSKILL_LEVEL = 3;
		};
		DIA_Addon_Riordian_Teach_WISPSKILL_X();
	};
	Info_ClearChoices(DIA_Addon_Riordian_Teach);
};

func void DIA_Addon_Riordian_Teach_WISPSKILL_FOOD()
{
	if(B_TeachPlayerTalentWispDetector(self,other,WISPSKILL_FOOD))
	{
		DIA_Addon_Riordian_Teach_WISPSKILL_X();
	};
	Info_ClearChoices(DIA_Addon_Riordian_Teach);
};

func void DIA_Addon_Riordian_Teach_WISPSKILL_POTIONS()
{
	if(B_TeachPlayerTalentWispDetector(self,other,WISPSKILL_POTIONS))
	{
		DIA_Addon_Riordian_Teach_WISPSKILL_X();
	};
	Info_ClearChoices(DIA_Addon_Riordian_Teach);
};

