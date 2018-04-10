
instance DIA_Talbin_EXIT(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 999;
	condition = DIA_Talbin_EXIT_Condition;
	information = DIA_Talbin_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Talbin_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Talbin_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


var int Talbin_Runs;

instance DIA_Talbin_HALLO(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 5;
	condition = DIA_Talbin_HALLO_Condition;
	information = DIA_Talbin_HALLO_Info;
	important = TRUE;
};


func int DIA_Talbin_HALLO_Condition()
{
	if(Kapitel <= 3)
	{
		return TRUE;
	};
};

func void DIA_Talbin_HALLO_Info()
{
	AI_Output(self,other,"DIA_Talbin_HALLO_07_00");	//����! �� ���� ������!
	AI_Output(other,self,"DIA_Talbin_HALLO_15_01");	//��! ��� �������!
	AI_Output(self,other,"DIA_Talbin_HALLO_07_02");	//��! ��� ���� ��������� �������, ��? ������� � ������ ���� �� ������ �� ���� ��������, ��� ��������� ������� �����.
	AI_Output(self,other,"DIA_Talbin_HALLO_07_03");	//�� ������ � ����, ��� �� �� ���� �� ���. �� ��������� ������� �����������!
};


instance DIA_Talbin_WASMACHTIHR(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 6;
	condition = DIA_Talbin_WASMACHTIHR_Condition;
	information = DIA_Talbin_WASMACHTIHR_Info;
	description = "� �� ����� �� ��������, ������� �� �����, ���� ������ ��������� �����.";
};


func int DIA_Talbin_WASMACHTIHR_Condition()
{
	if(Talbin_Runs == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Talbin_WASMACHTIHR_Info()
{
	AI_Output(other,self,"DIA_Talbin_WASMACHTIHR_15_00");	//� �� ����� �� ��������, ������� �� �����, ���� ������ ��������� �����.
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_07_01");	//��-��! �� - �� ������. �� ��� ��� ��� ������ - � �� ���� ��������� ����� ������!
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_07_02");	//������� � ������� ����� � ��������� ���, ��� ���� ����� �����.
	if(Npc_IsDead(Engrom) == FALSE)
	{
		AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_07_03");	//��� ����, �������, ����� �������� �������.
	};
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_07_04");	//������ ����� � ����� ������. �������� �������.
	Info_ClearChoices(DIA_Talbin_WASMACHTIHR);
	Info_AddChoice(DIA_Talbin_WASMACHTIHR,Dialog_Back,DIA_Talbin_WASMACHTIHR_back);
	Info_AddChoice(DIA_Talbin_WASMACHTIHR,"�� ��� �������, �� ��������� ���������� ���� �����.",DIA_Talbin_WASMACHTIHR_gut);
	Info_AddChoice(DIA_Talbin_WASMACHTIHR,"�� ������ ��������� ��-�� �������?",DIA_Talbin_WASMACHTIHR_strf);
};

func void DIA_Talbin_WASMACHTIHR_back()
{
	Info_ClearChoices(DIA_Talbin_WASMACHTIHR);
};

func void DIA_Talbin_WASMACHTIHR_strf()
{
	AI_Output(other,self,"DIA_Talbin_WASMACHTIHR_strf_15_00");	//�� ������ ��������� ��-�� �������?
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_strf_07_01");	//���, ���! � ���� �� ����? � ������ ����� ������������� �����.
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_strf_07_02");	//���-�� ������ ���, ��� ����� ������ ��������� ������ �� �������.
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_strf_07_03");	//������� ������, ���� �� ���������, ��� � ���� � ����.
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_strf_07_04");	//�� ������������, ��� ����� ���������� ����� ����� ����, ��� ��������� ��� ������� ����, - ��� ���� �������, ���� ������� ������� ������!
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_strf_07_05");	//� � �������� ���� ������� �������� ����.
	AI_Output(other,self,"DIA_Talbin_WASMACHTIHR_strf_15_06");	//� ���� ���� ��������!
};

func void DIA_Talbin_WASMACHTIHR_gut()
{
	AI_Output(other,self,"DIA_Talbin_WASMACHTIHR_gut_15_00");	//�� ��� �������, �� ��������� ���������� ���� �����.
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_gut_07_01");	//� ��! � �����, ��� �� �� ��� ����������. �������� �� ���� �������� �����, ����� � ���� �������� ������.
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_gut_07_02");	//������, ��� �� ������������ ������������ � ����. ���. ����, ��������, ��� ������ ����������.
};


instance DIA_Talbin_SORRYFORENGROM(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 7;
	condition = DIA_Talbin_SORRYFORENGROM_Condition;
	information = DIA_Talbin_SORRYFORENGROM_Info;
	description = "������ ���� ���� �������?";
};


func int DIA_Talbin_SORRYFORENGROM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Talbin_WASMACHTIHR) && (Npc_IsDead(Engrom) == FALSE) && (Talbin_FollowsThroughPass == 0) && (Kapitel <= 3) && (Talbin_Runs == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Talbin_SORRYFORENGROM_Info()
{
	AI_Output(other,self,"DIA_Talbin_SORRYFORENGROM_15_00");	//������ ���� ���� �������?
	AI_Output(self,other,"DIA_Talbin_SORRYFORENGROM_07_01");	//������ ��� �� ������ ����� �� ����, �� ������� ��������.
	AI_Output(self,other,"DIA_Talbin_SORRYFORENGROM_07_02");	//� ��� �� ������ � ��� ���������. �������� ������� �� ������� �� �����.
};


instance DIA_Talbin_WASJAGDIHR(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 8;
	condition = DIA_Talbin_WASJAGDIHR_Condition;
	information = DIA_Talbin_WASJAGDIHR_Info;
	description = "� �� ���� �� ��������� � ����?";
};


func int DIA_Talbin_WASJAGDIHR_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Talbin_WASMACHTIHR) && (Talbin_FollowsThroughPass == 0) && (Talbin_Runs == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Talbin_WASJAGDIHR_Info()
{
	AI_Output(other,self,"DIA_Talbin_WASJAGDIHR_15_00");	//� �� ���� �� ��������� � ����?
	AI_Output(self,other,"DIA_Talbin_WASJAGDIHR_07_01");	//��� �� ������! ������ ������ ����� ����, � �� �������, �� ���� � �������. �� ��������, ������� ��!
	AI_Output(self,other,"DIA_Talbin_WASJAGDIHR_07_02");	//���� ������ ������� ��������, �� �� ���� ����� �������.
	AI_Output(self,other,"DIA_Talbin_WASJAGDIHR_07_03");	//������ ����� � ��������� �� �����������. � �� �������������, � �� ��� ��� ���� �� ������!
};


instance DIA_Talbin_ENGROMANGRY(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 9;
	condition = DIA_Talbin_ENGROMANGRY_Condition;
	information = DIA_Talbin_ENGROMANGRY_Info;
	description = "��� �������, ���� �������� �����-�� �����������!";
};


func int DIA_Talbin_ENGROMANGRY_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Engrom_WhatAboutLeaving) && Npc_KnowsInfo(other,DIA_Talbin_SORRYFORENGROM) && (Npc_IsDead(Engrom) == FALSE) && (Talbin_FollowsThroughPass == 0) && (Kapitel <= 3) && (Talbin_Runs == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Talbin_ENGROMANGRY_Info()
{
	AI_Output(other,self,"DIA_Talbin_ENGROMANGRY_15_00");	//��� �������, ���� �������� �����-�� �����������!
	AI_Output(self,other,"DIA_Talbin_ENGROMANGRY_07_01");	//�����. �� ���������� ���, ��� �� ���� ���������. ������ � ����� �� ���� ������ ���.
	AI_Output(self,other,"DIA_Talbin_ENGROMANGRY_07_02");	//�� � ���-������ ��������!
};


instance DIA_Talbin_AskTeacher(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 10;
	condition = DIA_Talbin_AskTeacher_Condition;
	information = DIA_Talbin_AskTeacher_Info;
	description = "�� ������ ������� ���� ���������?";
};


func int DIA_Talbin_AskTeacher_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Talbin_WASJAGDIHR) && (Talbin_FollowsThroughPass == 0) && (Talbin_Runs == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Talbin_AskTeacher_Info()
{
	AI_Output(other,self,"DIA_Talbin_AskTeacher_15_00");	//�� ������ ������� ���� ���������?
	AI_Output(self,other,"DIA_Talbin_AskTeacher_07_01");	//�������! ��� � ���� �������. ������. �� �� ���������!
	AI_Output(other,self,"DIA_Talbin_AskTeacher_15_02");	//��� �� ������ �� ���?
	AI_Output(self,other,"DIA_Talbin_AskTeacher_07_03");	//� ���� ������ ��� ������ ����� ���� ��������? ����� ����, ����� ����? ��, ����� ����. ����� �� ����� �� ���� �����...
	AI_Output(other,self,"DIA_Talbin_AskTeacher_15_04");	//� ��������, ��� ����� �������.
	Log_CreateTopic(TOPIC_Teacher,LOG_NOTE);
	B_LogEntry(TOPIC_Teacher,"������ ����� ������� ���� �������� ������ ��������.");
};


instance DIA_Talbin_PayTeacher(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 11;
	condition = DIA_Talbin_PayTeacher_Condition;
	information = DIA_Talbin_PayTeacher_Info;
	permanent = TRUE;
	description = "��� ���� ���. �� ������� ���� ������?";
};


var int DIA_Talbin_PayTeacher_noPerm;

func int DIA_Talbin_PayTeacher_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Talbin_AskTeacher) && (DIA_Talbin_PayTeacher_noPerm == FALSE) && (Talbin_FollowsThroughPass == 0) && (Talbin_Runs == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Talbin_PayTeacher_Info()
{
	if(B_GiveInvItems(other,self,ItFo_Cheese,1))
	{
		AI_Output(other,self,"DIA_Talbin_PayTeacher_15_00");	//��� ���� ���. �� ������� ���� ������?
		AI_Output(self,other,"DIA_Talbin_PayTeacher_07_01");	//� ���� ������������� ���� ���? ��, ��������� � �� �� ������ ���������. �������. ��, � ��� ������... ��, ��, �������!
		Talbin_TeachAnimalTrophy = TRUE;
		DIA_Talbin_PayTeacher_noPerm = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Talbin_PayTeacher_15_02");	//� ���� ������ ��� ����!
		AI_Output(self,other,"DIA_Talbin_PayTeacher_07_03");	//��� ���� �� ������� ������, ����� ���� �������. �����, �������, ����� ����������� ���!
	};
};


instance DIA_Talbin_TEACHHUNTING(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 12;
	condition = DIA_Talbin_TEACHHUNTING_Condition;
	information = DIA_Talbin_TEACHHUNTING_Info;
	permanent = TRUE;
	description = "���� �� ������ ������� ����?";
};


func int DIA_Talbin_TEACHHUNTING_Condition()
{
	if((Talbin_TeachAnimalTrophy == TRUE) && (Talbin_FollowsThroughPass == 0) && (Talbin_Runs == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Talbin_TEACHHUNTING_Info()
{
	AI_Output(other,self,"DIA_Talbin_TEACHHUNTING_15_00");	//���� �� ������ ������� ����?
	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Heart] == FALSE))
	{
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_07_01");	//� ��� �� ������ �����?
		Info_AddChoice(DIA_Talbin_TEACHHUNTING,Dialog_Back,DIA_Talbin_TEACHHUNTING_BACK);
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
		{
			Info_AddChoice(DIA_Talbin_TEACHHUNTING,B_BuildLearnString("�������� ������",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Claws)),DIA_Talbin_TEACHHUNTING_Claws);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
		{
			Info_AddChoice(DIA_Talbin_TEACHHUNTING,B_BuildLearnString("������ ����",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Fur)),DIA_Talbin_TEACHHUNTING_Fur);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] == FALSE)
		{
			Info_AddChoice(DIA_Talbin_TEACHHUNTING,B_BuildLearnString("��� ���������",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_ShadowHorn)),DIA_Talbin_TEACHHUNTING_ShadowHorn);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Heart] == FALSE)
		{
			Info_AddChoice(DIA_Talbin_TEACHHUNTING,B_BuildLearnString("�������� ������",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Heart)),DIA_Talbin_TEACHHUNTING_Heart);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_07_02");	//� ��������� ����. �� ��� ������ ���, ���� � ���� �������. �� ��� ��, ������� �� ���!
	};
};

func void DIA_Talbin_TEACHHUNTING_BACK()
{
	Info_ClearChoices(DIA_Talbin_TEACHHUNTING);
};

func void DIA_Talbin_TEACHHUNTING_Claws()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Claws))
	{
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_Claws_07_00");	//�������� ����� - ��� ������. ������ ������ �� ��������� � ���������� ��� � �����.
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_Claws_07_01");	//����� ������ ��� � ��������� ��������� ������.
	};
	Info_ClearChoices(DIA_Talbin_TEACHHUNTING);
};

func void DIA_Talbin_TEACHHUNTING_Fur()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Fur))
	{
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_Fur_07_00");	//����� ����� ����� ����� � �������, ������ ������ ����� ����� ������...
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_Fur_07_01");	//...����� ������ �� ������ ���� � ���������� ����� � ���� �������.
	};
	Info_ClearChoices(DIA_Talbin_TEACHHUNTING);
};

func void DIA_Talbin_TEACHHUNTING_ShadowHorn()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_ShadowHorn))
	{
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_ShadowHorn_07_00");	//���� ���������� ����� �������, � �� ��� ������ ������ � �����������.
	};
	Info_ClearChoices(DIA_Talbin_TEACHHUNTING);
};

func void DIA_Talbin_TEACHHUNTING_Heart()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Heart))
	{
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_Heart_07_00");	//������ ���������� ������� ����� �����, � �� ����� ������ ������. ���� ���������, ����� ��������� ������� ���, �������� � ������ �������.
	};
	Info_ClearChoices(DIA_Talbin_TEACHHUNTING);
};


instance DIA_Talbin_KAP3_EXIT(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 999;
	condition = DIA_Talbin_KAP3_EXIT_Condition;
	information = DIA_Talbin_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Talbin_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Talbin_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Talbin_KAP4_EXIT(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 999;
	condition = DIA_Talbin_KAP4_EXIT_Condition;
	information = DIA_Talbin_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Talbin_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Talbin_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Talbin_KAP4_WASNEUES(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 13;
	condition = DIA_Talbin_KAP4_WASNEUES_Condition;
	information = DIA_Talbin_KAP4_WASNEUES_Info;
	description = "����� ����� �� ��������?";
};


func int DIA_Talbin_KAP4_WASNEUES_Condition()
{
	if((Kapitel >= 4) && (Talbin_FollowsThroughPass == 0) && (Talbin_Runs == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Talbin_KAP4_WASNEUES_Info()
{
	AI_Output(other,self,"DIA_Talbin_KAP4_WASNEUES_15_00");	//����� ����� �� ��������?
	AI_Output(self,other,"DIA_Talbin_KAP4_WASNEUES_07_01");	//�������. ������� ����� ���� ����� �������� �����! ��� ����������� � ������������� ��������, � � ��� ��� ����� ������ � ���������� ���.
};


instance DIA_Talbin_KAP4_WASWOLLTENDJG(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 14;
	condition = DIA_Talbin_KAP4_WASWOLLTENDJG_Condition;
	information = DIA_Talbin_KAP4_WASWOLLTENDJG_Info;
	description = "� ��� ���� '�������� ������' ���� ����� �����?";
};


func int DIA_Talbin_KAP4_WASWOLLTENDJG_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Talbin_KAP4_WASNEUES) && (Kapitel >= 4) && (Talbin_FollowsThroughPass == 0) && (Talbin_Runs == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Talbin_KAP4_WASWOLLTENDJG_Info()
{
	AI_Output(other,self,"DIA_Talbin_KAP4_WASWOLLTENDJG_15_00");	//� ��� ���� '�������� ������' ���� ����� �����?
	AI_Output(self,other,"DIA_Talbin_KAP4_WASWOLLTENDJG_07_01");	//��� ���������� ���� ������ �������� � ����������. � � ���-�� ��� ����� � ������� �����!
	AI_Output(self,other,"DIA_Talbin_KAP4_WASWOLLTENDJG_07_02");	//��� ������� ���-�� � ���, ��� ���������� ����� �������. ������ ���� ������, ������ ��� ������� �����, �� ��� �� ������� � ���� ������� �������!
	if(Kapitel == 4)
	{
		B_LogEntry(TOPIC_Dragonhunter,"��������� ��������� �� �������� ������������ �� ���������� ������� �������.");
	};
};


instance DIA_Talbin_WOENGROM(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 15;
	condition = DIA_Talbin_WOENGROM_Condition;
	information = DIA_Talbin_WOENGROM_Info;
	description = "�� ������ ����?";
};


func int DIA_Talbin_WOENGROM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Talbin_WASMACHTIHR) && (Kapitel >= 4) && (Talbin_FollowsThroughPass == 0) && (EngromIsGone == TRUE) && (Talbin_Runs == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Talbin_WOENGROM_Info()
{
	AI_Output(other,self,"DIA_Talbin_WOENGROM_15_00");	//�� ������ ����?
	AI_Output(self,other,"DIA_Talbin_WOENGROM_07_01");	//��. ��� �������� ������ ����. ����� �� ������, ��� ��� ���� ������� - ���-�� ����� ������� ������� � ���.
	AI_Output(self,other,"DIA_Talbin_WOENGROM_07_02");	//� ������ �� ������. � ������� ��� ����, ��� �� ������ ����� �� �����...
	AI_Output(self,other,"DIA_Talbin_WOENGROM_07_03");	//...� ����� �� ���������� �����. ������� �� ����, ���� �� ����������.
	AI_Output(self,other,"DIA_Talbin_WOENGROM_07_04");	//���� �� ���-������ ������� �������, ����� ���, ��� �� ��� ��� ������ ��� ����� �������.
	if(Npc_KnowsInfo(other,DIA_Engrom_WhatAboutLeaving))
	{
		AI_Output(other,self,"DIA_Talbin_WOENGROM_15_05");	//�� � ���� ���� �����������, ��� �� �� ��������� ������� ������, ���� ���� ��� ��� � ������.
		AI_Output(self,other,"DIA_Talbin_WOENGROM_07_06");	//� �� ������: � ���� ����� �������.
	};
	MIS_Tabin_LookForEngrom = LOG_Running;
};


instance DIA_Talbin_FOUNDENGROM(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 16;
	condition = DIA_Talbin_FOUNDENGROM_Condition;
	information = DIA_Talbin_FOUNDENGROM_Info;
	description = "� ����� ������ �������� �������.";
};


func int DIA_Talbin_FOUNDENGROM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Talbin_WOENGROM) && ((NpcObsessedByDMT_Engrom == TRUE) || Npc_HasItems(other,ItAt_TalbinsLurkerSkin)) && (Kapitel >= 4) && (Talbin_FollowsThroughPass == 0) && (Talbin_Runs == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Talbin_FOUNDENGROM_Info()
{
	AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_00");	//� ����� ������ �������� �������.
	AI_Output(self,other,"DIA_Talbin_FOUNDENGROM_07_01");	//��? ��� ��?
	if(Npc_IsDead(Engrom))
	{
		AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_02");	//�� �����.
	}
	else
	{
		AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_03");	//� �� �����, ��� �� �����-������ ��� �������.
	};
	if(B_GiveInvItems(other,self,ItAt_TalbinsLurkerSkin,1))
	{
		AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_04");	//���. � ����� ��� ��� ��� ����� �������.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_05");	//������ �������� ��.
		AI_Output(self,other,"DIA_Talbin_FOUNDENGROM_07_06");	//������? ��� ��� �����?
		AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_07");	//����������� �����������. ��� ��� ��������� ������.
	};
	AI_Output(self,other,"DIA_Talbin_FOUNDENGROM_07_08");	//�, �����. ��� ����� ���������� ������, ���� ���� � ��� ���� ����� ���� ������. ������ ��� �������!
	AI_StopProcessInfos(self);
	Log_CreateTopic(TOPIC_Talbin_Runs,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Talbin_Runs,LOG_Running);
	B_LogEntry(TOPIC_Talbin_Runs,"������, ������� �� ������ ��������, ����� ����� ������, ��� ����� �� ��� �� ����� ������ ��� �������� ���. � �����, �� ���������� � �������.");
	B_GivePlayerXP(XP_Ambient);
	Npc_ExchangeRoutine(self,"FleePass");
	Wld_InsertNpc(Snapper,"START");
	Talbin_Runs = TRUE;
};


instance DIA_Talbin_WOHIN(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 17;
	condition = DIA_Talbin_WOHIN_Condition;
	information = DIA_Talbin_WOHIN_Info;
	permanent = TRUE;
	description = "���� �� ��������? ";
};


func int DIA_Talbin_WOHIN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Talbin_FOUNDENGROM) && (Talbin_FollowsThroughPass == 0))
	{
		return TRUE;
	};
};

func void DIA_Talbin_WOHIN_Info()
{
	AI_Output(other,self,"DIA_Talbin_WOHIN_15_00");	//���� �� ��������?
	if(Npc_GetDistToWP(self,"START") < 1000)
	{
		AI_Output(self,other,"DIA_Talbin_WOHIN_07_01");	//������ ���� �� �������. ����������!!
		Info_ClearChoices(DIA_Talbin_WOHIN);
		Info_AddChoice(DIA_Talbin_WOHIN,"� ���� ��� ������� �� ����.",DIA_Talbin_WOHIN_);
		Info_AddChoice(DIA_Talbin_WOHIN,"������ ��� ������.",DIA_Talbin_WOHIN_durch);
		Info_AddChoice(DIA_Talbin_WOHIN,"������.",DIA_Talbin_WOHIN_ok);
	}
	else
	{
		AI_Output(self,other,"DIA_Talbin_WOHIN_07_02");	//� ������ ��������� ������, ����� ������!
		AI_StopProcessInfos(self);
	};
};

func void DIA_Talbin_WOHIN_ok()
{
	AI_Output(other,self,"DIA_Talbin_WOHIN_ok_15_00");	//������.
	AI_Output(self,other,"DIA_Talbin_WOHIN_ok_07_01");	//�������. � ������ ����� �� �����.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"IntoPass");
	Talbin_FollowsThroughPass = LOG_Running;
	self.flags = NPC_FLAG_IMMORTAL;
};

func void DIA_Talbin_WOHIN_durch()
{
	AI_Output(other,self,"DIA_Talbin_WOHIN_durch_15_00");	//������ ��� ������.
	AI_Output(self,other,"DIA_Talbin_WOHIN_durch_07_01");	//��� ��� �����. � �� �� �� ��� �� ����� �� ���� ����.
};

func void DIA_Talbin_WOHIN_()
{
	AI_Output(other,self,"DIA_Talbin_WOHIN_schwein_15_00");	//� ���� ��� ������� �� ����.
	AI_Output(self,other,"DIA_Talbin_WOHIN_schwein_07_01");	//�� ���������� ���� ����� �������?! �� ������ ������ � ��� �� ���!
	Talbin_FollowsThroughPass = LOG_OBSOLETE;
	AI_StopProcessInfos(self);
};


instance DIA_Talbin_VERSCHWINDE(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 15;
	condition = DIA_Talbin_VERSCHWINDE_Condition;
	information = DIA_Talbin_VERSCHWINDE_Info;
	permanent = TRUE;
	description = "��.";
};


func int DIA_Talbin_VERSCHWINDE_Condition()
{
	if(Talbin_FollowsThroughPass == LOG_OBSOLETE)
	{
		return TRUE;
	};
};

func void DIA_Talbin_VERSCHWINDE_Info()
{
	AI_Output(other,self,"DIA_Talbin_VERSCHWINDE_15_00");	//��.
	AI_Output(self,other,"DIA_Talbin_VERSCHWINDE_07_01");	//����������. � ��������� � ��� ����, ������!
	AI_StopProcessInfos(self);
};


instance DIA_Talbin_KAP5_EXIT(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 999;
	condition = DIA_Talbin_KAP5_EXIT_Condition;
	information = DIA_Talbin_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Talbin_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Talbin_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Talbin_KAP6_EXIT(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 999;
	condition = DIA_Talbin_KAP6_EXIT_Condition;
	information = DIA_Talbin_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Talbin_KAP6_EXIT_Condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Talbin_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Talbin_PICKPOCKET(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 900;
	condition = DIA_Talbin_PICKPOCKET_Condition;
	information = DIA_Talbin_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Talbin_PICKPOCKET_Condition()
{
	return C_Beklauen(40,25);
};

func void DIA_Talbin_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Talbin_PICKPOCKET);
	Info_AddChoice(DIA_Talbin_PICKPOCKET,Dialog_Back,DIA_Talbin_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Talbin_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Talbin_PICKPOCKET_DoIt);
};

func void DIA_Talbin_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Talbin_PICKPOCKET);
};

func void DIA_Talbin_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Talbin_PICKPOCKET);
};

