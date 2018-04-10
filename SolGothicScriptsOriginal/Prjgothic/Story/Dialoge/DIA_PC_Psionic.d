
instance DIA_Lester_EXIT(C_Info)
{
	npc = PC_Psionic;
	nr = 999;
	condition = DIA_Lester_EXIT_Condition;
	information = DIA_Lester_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lester_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Lester_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lester_Hello(C_Info)
{
	npc = PC_Psionic;
	nr = 1;
	condition = DIA_Lester_Hello_Condition;
	information = DIA_Lester_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lester_Hello_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Lester_Hello_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		B_TurnToNpc(self,other);
	};
	AI_Output(self,other,"DIA_Lester_Hello_13_00");	//��� ��? - �����! ��, ��� � ��� ������ ����!
	Info_ClearChoices(DIA_Lester_Hello);
	Info_AddChoice(DIA_Lester_Hello,"� ���, ���� ����?",DIA_Lester_Hello_YouKnowMe);
	Info_AddChoice(DIA_Lester_Hello,"������! ��� �� �������� �����?",DIA_Lester_Hello_Lester);
};

func void DIA_Lester_Hello_Lester()
{
	Info_ClearChoices(DIA_Lester_Hello);
	AI_Output(other,self,"DIA_Lester_Hello_Lester_15_00");	//������! ��� �� �������� �����?
	AI_Output(self,other,"DIA_Lester_Hello_Lester_13_01");	//��� ��� �������� �����. ����� ����, ��� ������ ������, � ������ ��� ��������� ����� � ������ ��������.
	AI_Output(self,other,"DIA_Lester_Hello_Lester_13_02");	//����� � �������� ��������� ����, ���������� ����� ��� ��� ����, ����, �������, �� �������� � ���� ������.
	AI_Output(self,other,"DIA_Lester_Hello_Lester_13_03");	//�����, ������ � ���� ��� ��� � ������ ��������. �� ������� ����, � ��� �����.
};

func void DIA_Lester_Hello_YouKnowMe()
{
	Info_ClearChoices(DIA_Lester_Hello);
	AI_Output(other,self,"DIA_Lester_Hello_YouKnowMe_15_00");	//� ���, ���� ����?
	AI_Output(self,other,"DIA_Lester_Hello_YouKnowMe_13_01");	//��? � ���� ��� ����? � �������� ����� ����, ����� �� ��� ���������� ���� ������ ������.
	AI_Output(self,other,"DIA_Lester_Hello_YouKnowMe_13_02");	//�� ����� ������... ��, �� ���-�� �� ������ �������.
	AI_Output(self,other,"DIA_Lester_Hello_YouKnowMe_13_03");	//� �� ������� �����, ������� � �����?
	Info_AddChoice(DIA_Lester_Hello,"�����, ������ � ���?",DIA_Lester_Hello_WhoFourFriends);
	Info_AddChoice(DIA_Lester_Hello,"�������. ��� ���?",DIA_Lester_Hello_KnowFourFriends);
};

func void DIA_Lester_Hello_KnowFourFriends()
{
	Info_ClearChoices(DIA_Lester_Hello);
	AI_Output(other,self,"DIA_Lester_Hello_KnowFourFriends_15_00");	//�������. ��� ���?
	AI_Output(self,other,"DIA_Lester_Hello_KnowFourFriends_13_01");	//��������� � ����, ��� ������ ��� ���������� �������.
	AI_Output(self,other,"DIA_Lester_Hello_KnowFourFriends_13_02");	//�� � ������� �� ����, ��� ��� ������ - ��� ������, ��������, ��� ��� ��������� � ������ ��������.
	AI_Output(self,other,"DIA_Lester_Hello_KnowFourFriends_13_03");	//���� �� ���������� �� ���, ��� ��� �����.
};

func void DIA_Lester_Hello_WhoFourFriends()
{
	Info_ClearChoices(DIA_Lester_Hello);
	AI_Output(other,self,"DIA_Lester_Hello_WhoFourFriends_15_00");	//�����, ������ � ���?
	AI_Output(self,other,"DIA_Lester_Hello_WhoFourFriends_13_01");	//������ �� ������ ���, ��� �� ������ ����� �� �������. ������������ ����� - ������ - �������� ���� ����, ������������� ����� ����?
	AI_Output(other,self,"DIA_Lester_Hello_WhoFourFriends_15_02");	//� �� ����...
	AI_Output(self,other,"DIA_Lester_Hello_WhoFourFriends_13_03");	//������ � ���� ��� ��������. ��� ���� ������������ ��������� �����, ����� �������� ���� ������ � �������.
};


instance DIA_Lester_WhatHappened(C_Info)
{
	npc = PC_Psionic;
	nr = 1;
	condition = DIA_Lester_WhatHappened_Condition;
	information = DIA_Lester_WhatHappened_Info;
	permanent = FALSE;
	description = "��� ���������?";
};


func int DIA_Lester_WhatHappened_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lester_Hello) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Lester_WhatHappened_Info()
{
	AI_Output(other,self,"DIA_Lester_WhatHappened_15_00");	//��� ���������?
	AI_Output(self,other,"DIA_Lester_WhatHappened_13_01");	//����� ����, ��� ������ ��� ��������, ��� �������� ��� ����� ����� � ���.
	AI_Output(self,other,"DIA_Lester_WhatHappened_13_02");	//��� ������ ������� ��� ����� ���������� ������ ��������.
	AI_Output(other,self,"DIA_Lester_WhatHappened_15_03");	//� ��? ��� ������ ����?
	AI_Output(self,other,"DIA_Lester_WhatHappened_13_04");	//�� ���� ���� �� ��� ���� �����. � ���� ���� �������, � ���� ������������. �� ����� � ���� ������ �����-����� �����������, � ������� ������.
	AI_Output(self,other,"DIA_Lester_WhatHappened_13_05");	//���-�� ��� ����������, ��� � �����, ��� �������� ������ ���� �������� �� ������ �������� � ������ �� � �����, ������ ���������� ������� ����.
	AI_Output(self,other,"DIA_Lester_WhatHappened_13_06");	//����� � ���� �������, ��� ��� �������� ������, ����� ����� ����.
	AI_Output(other,self,"DIA_Lester_WhatHappened_15_07");	//�� ����� ���-������ ���?
	AI_Output(self,other,"DIA_Lester_WhatHappened_13_08");	//��� - � ������� � �������!
};


instance DIA_Lester_MineColony(C_Info)
{
	npc = PC_Psionic;
	nr = 2;
	condition = DIA_Lester_MineColony_Condition;
	information = DIA_Lester_MineColony_Info;
	permanent = FALSE;
	description = "������� �� ��� ����������� � ���� ������?";
};


func int DIA_Lester_MineColony_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lester_Hello) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Lester_MineColony_Info()
{
	AI_Output(other,self,"DIA_Lester_ReturnToColony_15_00");	//������� �� ��� ����������� � ���� ������?
	AI_Output(self,other,"DIA_Lester_ReturnToColony_13_01");	//����� �� ����. �����, ������. �� ���� ��� ���-���:
	AI_Output(self,other,"DIA_Lester_ReturnToColony_13_02");	//����� � ������ ���� �������, � �������� �� ��� ���� - ��� ������ ����� ��������� ��������.
	AI_Output(self,other,"DIA_Lester_ReturnToColony_13_03");	//� ����� � ��������� ���� �� �� ��������� ����, ��� ��� ������ ��� �����. � ����� ����������, ��� ������ �� ��� �� ����. � � ��� ��� � �� ������� ��� ������.
	AI_Output(other,self,"DIA_Lester_ReturnToColony_15_04");	//�� ������ � ���� ����� ��������? � ����, ��� �� �� ������ ��������, �� ������� ����� ��� ��� ��������...
	AI_Output(self,other,"DIA_Lester_ReturnToColony_13_05");	//�������, ���������? �� ����� � ���� �����? ��� ��� �� ��������...
	AI_Output(other,self,"DIA_Lester_ReturnToColony_15_06");	//�� ��������, ��� �� ���� ���� �� ����� �������. �� �� ����� �������.
};


instance DIA_Lester_SEND_XARDAS(C_Info)
{
	npc = PC_Psionic;
	nr = 4;
	condition = DIA_Lester_SEND_XARDAS_Condition;
	information = DIA_Lester_SEND_XARDAS_Info;
	permanent = FALSE;
	description = "�� ������ ���������� �������� �� ���� ���� ...";
};


func int DIA_Lester_SEND_XARDAS_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lester_WhatHappened) && Npc_KnowsInfo(other,DIA_Lester_MineColony) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Lester_SEND_XARDAS_Info()
{
	AI_Output(other,self,"DIA_Lester_SEND_XARDAS_15_00");	//�� ������ ���������� �������� �� ���� ����. ��� ����� ���� �����.
	AI_Output(self,other,"DIA_Lester_SEND_XARDAS_13_01");	//�� �� �������, ��� ��� ����������? �� ������ �������, ��� ��� ������������� ���...
	AI_Output(other,self,"DIA_Lester_SEND_XARDAS_15_02");	//... ������. ��.
	AI_Output(self,other,"DIA_Lester_SEND_XARDAS_13_03");	//�� ����� ������ � ����� �����. � ����?
	AI_Output(other,self,"DIA_Lester_SEND_XARDAS_15_04");	//�� ������ ��, ��� � �����... ����...
	AI_Output(self,other,"DIA_Lester_SEND_XARDAS_13_05");	//(��������) ������, ���� ��� ��� �����, �� � ����� � ���� - �� �� ������.
	AI_Output(self,other,"DIA_Lester_SEND_XARDAS_13_06");	//������ � ��������� ���������. � ��� ��� ������� ����� ����� ������� �� �������.
	AI_Output(self,other,"DIA_Lester_SEND_XARDAS_13_07");	//��� �������, � ���� ������� �����. �������� ����� � ��������.
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Lester_STADT(C_Info)
{
	npc = PC_Psionic;
	nr = 1;
	condition = DIA_Addon_Lester_STADT_Condition;
	information = DIA_Addon_Lester_STADT_Info;
	description = "� ����������� � �������. ��� �� ������ �� ���� ������?";
};


func int DIA_Addon_Lester_STADT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lester_Hello) && (Mil_310_schonmalreingelassen == FALSE) && (Mil_333_schonmalreingelassen == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lester_STADT_Info()
{
	AI_Output(other,self,"DIA_Addon_Lester_STADT_15_00");	//� ����������� � �������. ��� �� ������ �� ���� ������?
	AI_Output(self,other,"DIA_Addon_Lester_STADT_13_01");	//�������? ��, ��� �������� ������� ������� ����.
	AI_Output(self,other,"DIA_Addon_Lester_STADT_13_02");	//� ������ �� �����������?
	AI_Output(other,self,"DIA_Addon_Lester_STADT_15_03");	//� ������ ���������� � ����������, ������� ������������ � ������.
	AI_Output(self,other,"DIA_Addon_Lester_STADT_13_04");	//(�������) �������? ��, �� ���� �� ������ ���� � ��� �����, �� ��, ��� � ���������.
};


instance DIA_Addon_Lester_Vorschlag(C_Info)
{
	npc = PC_Psionic;
	nr = 1;
	condition = DIA_Addon_Lester_Vorschlag_Condition;
	information = DIA_Addon_Lester_Vorschlag_Info;
	description = "����� ����, �� ������ ������, ������� ������� ��� ������� � �������?";
};


func int DIA_Addon_Lester_Vorschlag_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lester_STADT) && (Mil_310_schonmalreingelassen == FALSE) && (Mil_333_schonmalreingelassen == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lester_Vorschlag_Info()
{
	AI_Output(other,self,"DIA_Addon_Lester_Vorschlag_15_00");	//����� ����, �� ������ ������, ������� ������� ��� ������� � �������?
	AI_Output(self,other,"DIA_Addon_Lester_Vorschlag_13_01");	//����. ��������� ����� ����� � ������� �� ������� �������� �� ����� �����������.
	AI_Output(self,other,"DIA_Addon_Lester_Vorschlag_13_02");	//�� - �������� ����������� ���� � ������. ��� ������� �������� ����, ����� ��������� ���������� � ����� �������, ��� �������� ��� ������ �����.
	AI_Output(self,other,"DIA_Addon_Lester_Vorschlag_13_03");	//��� ��� �� ����� ���� ��� �������� ������. ���� ����� ������� ������� ������ �������� ����� ������� ��������, � ����� ������� ����������, ��� �� ������ �� �����������.
	AI_Output(self,other,"DIA_Addon_Lester_Vorschlag_13_04");	//�� �� �� ������ �������� ������ �����. ��������� �� ������� �������������� � � ������� �� �����������.
	AI_Output(self,other,"DIA_Addon_Lester_Vorschlag_13_05");	//����� ��� ���� ����������, ���� ������ ���� ������ �� �����������.
	AI_Output(self,other,"DIA_Addon_Lester_Vorschlag_13_06");	//�����, ������ ���������� �������� ����� ����������.
	AI_Output(other,self,"DIA_Addon_Lester_Vorschlag_15_07");	//������� �� �����.
	Log_CreateTopic(TOPIC_Addon_PickForConstantino,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_PickForConstantino,LOG_Running);
	B_LogEntry(TOPIC_Addon_PickForConstantino,"������ �������, ��� � ���� ������ ���� ��������� ������, ���� � ���� ����� 10 �������� ������ ����, � ���� � ����� ��, ��� ��� ������������� ��� �������� �����������.");
	MIS_Addon_Lester_PickForConstantino = LOG_Running;
};


instance DIA_Addon_Lester_PASSAGEPLANTSSUCCESS(C_Info)
{
	npc = PC_Psionic;
	nr = 5;
	condition = DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_Condition;
	information = DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_Info;
	description = "��� ��������� ������������.";
};


func int DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_Condition()
{
	if(MIS_Addon_Lester_PickForConstantino == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_Info()
{
	AI_Output(other,self,"DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_15_00");	//��� ��������� ������������. ����� � ������, ��� ������ ����� ��� �����������, ��������� ����� �� ���������� ����.
	AI_Output(self,other,"DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_13_01");	//��� � � �������. � ������� �� ���������, ���� ���.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Lester_Perm(C_Info)
{
	npc = PC_Psionic;
	nr = 99;
	condition = DIA_Lester_Perm_Condition;
	information = DIA_Lester_Perm_Info;
	permanent = TRUE;
	description = "��� �� ������ �� ���� ���������?";
};


func int DIA_Lester_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lester_Hello) && (Kapitel < 3) && (Npc_GetDistToWP(self,"NW_XARDAS_TOWER_LESTER") <= 2000))
	{
		return TRUE;
	};
};

func void DIA_Lester_Perm_Info()
{
	AI_Output(other,self,"DIA_Lester_Perm_15_00");	//��� �� ������ �� ���� ���������?
	AI_Output(self,other,"DIA_Lester_Perm_13_01");	//���� �� ������� �� ���� ��������, �� �������� �� �����. � ��� ���� ������ ���������� �����.
	AI_Output(self,other,"DIA_Lester_Perm_13_02");	//�� ���� ���������, �� ������ ���� ����� ����������� �� ������ ����� � �����, �� ����� ������� � �������!
};


instance DIA_Lester_Sleep(C_Info)
{
	npc = PC_Psionic;
	nr = 99;
	condition = DIA_Lester_Sleep_Condition;
	information = DIA_Lester_Sleep_Info;
	permanent = TRUE;
	description = "�� ��� ��� ���������� ���� ����������?";
};


func int DIA_Lester_Sleep_Condition()
{
	if((Kapitel < 3) && (Npc_GetDistToWP(self,"NW_XARDAS_TOWER_IN1_31") <= 500))
	{
		return TRUE;
	};
};

func void DIA_Lester_Sleep_Info()
{
	AI_Output(other,self,"DIA_Lester_Sleep_15_00");	//�� ��� ��� ���������� ���� ����������?
	AI_Output(self,other,"DIA_Lester_Sleep_13_01");	//��� ���. (������) � ��������� �������� ���. � ������ � ������ �������. �����...
	AI_Output(self,other,"DIA_Lester_Sleep_13_02");	//...������... ��� ���� ������.
	AI_StopProcessInfos(self);
};


instance DIA_Lester_KAP3_EXIT(C_Info)
{
	npc = PC_Psionic;
	nr = 999;
	condition = DIA_Lester_KAP3_EXIT_Condition;
	information = DIA_Lester_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lester_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Lester_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lester_BACKINTOWN(C_Info)
{
	npc = PC_Psionic;
	nr = 2;
	condition = DIA_Lester_BACKINTOWN_Condition;
	information = DIA_Lester_BACKINTOWN_Info;
	important = TRUE;
};


func int DIA_Lester_BACKINTOWN_Condition()
{
	if((Npc_GetDistToWP(self,"LEVELCHANGE") <= 500) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Lester_BACKINTOWN_Info()
{
	AI_Output(self,other,"DIA_Lester_BACKINTOWN_13_00");	//��, �� ��������, �������! �� ������ ���������� ��������� � ���������. �������� ��������.
	AI_Output(other,self,"DIA_Lester_BACKINTOWN_15_01");	//� ��� � ����� ��������.
	AI_Output(self,other,"DIA_Lester_BACKINTOWN_13_02");	//����� ����, ��� �� ����, ����� ������� �� ���������.
	AI_Output(self,other,"DIA_Lester_BACKINTOWN_13_03");	//�������� � ���������, �� ���� ����!
	AI_Output(self,other,"DIA_Lester_BACKINTOWN_13_04");	//������� ��� ��� ���� ��� ����. ��� ������� ���� ��������� �� ���� ���������. �������� ���.
	CreateInvItems(self,ItRu_TeleportXardas,1);
	B_GiveInvItems(self,other,ItRu_TeleportXardas,1);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Lester_PERM3(C_Info)
{
	npc = PC_Psionic;
	nr = 900;
	condition = DIA_Lester_PERM3_Condition;
	information = DIA_Lester_PERM3_Info;
	permanent = TRUE;
	description = "�� �� �����-�� ������ ���������.";
};


func int DIA_Lester_PERM3_Condition()
{
	if((Kapitel >= 3) && (Lester_IsOnBoard != LOG_SUCCESS))
	{
		return TRUE;
	};
};


var int DIA_Lester_PERM3_OneTime;

func void DIA_Lester_PERM3_Info()
{
	AI_Output(other,self,"DIA_Lester_PERM3_15_00");	//�� �� �����-�� ������ ���������.
	if(hero.guild == GIL_KDF)
	{
		if(DIA_Lester_PERM3_OneTime == FALSE)
		{
			AI_Output(self,other,"DIA_Lester_PERM3_13_01");	//� � �������� ���� �� ����� ������. � ���������� ���������, � ��� ��� ���������� �������� ����...
			AI_Output(self,other,"DIA_Lester_PERM3_13_02");	//������ ���, ����� ���� �� ���� ������ � ������ ����� ���������� �����, ��� ������ �����������.
			if(SC_KnowsMadPsi == TRUE)
			{
				AI_Output(other,self,"DIA_Lester_PERM3_15_03");	//� � ���� ������� ���� ������.
				AI_Output(self,other,"DIA_Lester_PERM3_13_04");	//��? �����, � �� ���� ����� �����.
				AI_Output(other,self,"DIA_Lester_PERM3_15_05");	//���� � ������ ����� - ��� ������, ��� ��, ����, �������� �� - ���� ��������������� �������� ����������. ���� ��� �� � ��� �� �������?
				AI_Output(self,other,"DIA_Lester_PERM3_13_06");	//���. ���. ���� ������ �� �� ������ ������� ���, ���...
				AI_Output(other,self,"DIA_Lester_PERM3_15_07");	//��, ������. ������ ���� ��������������� �������. ������� �� ����� ����������� �� ��������� ������.
				AI_Output(other,self,"DIA_Lester_PERM3_15_08");	//��� ���� ����, ������. ������ �������� �������. ������ ��� ������ ��������� ����������� ���.
				AI_Output(self,other,"DIA_Lester_PERM3_13_09");	//� ���� ���� ����������, �� � ��������, ��� ��� �� ���. �� ������ �������, �� ��������? ������ ����� �����?
				AI_Output(other,self,"DIA_Lester_PERM3_15_10");	//������� ������. � ���� ���������, ������ ��� � ������ ���������� ������ �� ����, ��� ��� ������ ������� ������.
				AI_Output(self,other,"DIA_Lester_PERM3_13_11");	//��� ��� �� ��������, �� � �����, �� ����. ��� ����� ����, �� � ���� ������� �������� �����...
				B_LogEntry(TOPIC_DEMENTOREN,"��� ���������� �������������. ���� � ������� ��� ��������, ��� ������ - ��� ������������� ������� �� ������� ������ � �������.");
				B_GivePlayerXP(XP_Lester_KnowsMadPsi);
				DIA_Lester_PERM3_OneTime = TRUE;
			};
		};
	}
	else if(Lester_IsOnBoard == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lester_PERM3_13_12");	//�������� ���� ��� ��� ������ ����, �� � �������, ��� �������� ����� ����� ������.
		AI_Output(self,other,"DIA_Lester_PERM3_13_13");	//��� ��� �����.
	}
	else if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Lester_PERM3_13_14");	//��� �������� ���� ����� ������ ������������. � ������ ��� ��� ����-����� ��������� �������� �� ����. � ����� ���� ������ - ������ ��� ��� �������.
	}
	else
	{
		AI_Output(self,other,"DIA_Lester_PERM3_13_15");	//��� �������� ���� ��� �� ������������. ������ ���-�� �������.
	};
	AI_Output(self,other,"DIA_Lester_PERM3_13_16");	//(��������) � �����, ��� ����� ���������.
};


instance DIA_Lester_KAP4_EXIT(C_Info)
{
	npc = PC_Psionic;
	nr = 999;
	condition = DIA_Lester_KAP4_EXIT_Condition;
	information = DIA_Lester_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lester_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Lester_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lester_KAP5_EXIT(C_Info)
{
	npc = PC_Psionic;
	nr = 999;
	condition = DIA_Lester_KAP5_EXIT_Condition;
	information = DIA_Lester_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lester_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Lester_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lester_XARDASWEG(C_Info)
{
	npc = PC_Psionic;
	nr = 2;
	condition = DIA_Lester_XARDASWEG_Condition;
	information = DIA_Lester_XARDASWEG_Info;
	description = "��� �������?";
};


func int DIA_Lester_XARDASWEG_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Lester_XARDASWEG_Info()
{
	AI_Output(other,self,"DIA_Lester_XARDASWEG_15_00");	//��� �������?
	AI_Output(self,other,"DIA_Lester_XARDASWEG_13_01");	//�� ����, � ��� ����� ������ ��� ������������ ��������.
	AI_Output(self,other,"DIA_Lester_XARDASWEG_13_02");	//� �����, �� ������ �� �����, ����� ���-������ ����� � ����� � ��� ����������.
	AI_Output(other,self,"DIA_Lester_XARDASWEG_15_03");	//���� �� ����������?
	AI_Output(self,other,"DIA_Lester_XARDASWEG_13_04");	//�� �� ������. �� ������ �������� ���� �������� ���� ��� ������.
	CreateInvItems(self,ItWr_XardasLetterToOpenBook_MIS,1);
	B_GiveInvItems(self,other,ItWr_XardasLetterToOpenBook_MIS,1);
	AI_Output(self,other,"DIA_Lester_XARDASWEG_13_05");	//� ������ ���. ������. ��� ������ ���� ���������.
	AI_Output(other,self,"DIA_Lester_XARDASWEG_15_06");	//�?
	AI_Output(self,other,"DIA_Lester_XARDASWEG_13_07");	//�� ����, � ������ �� �����. �� ��� ���� ����: �������� �� ������ ������ �������.
	AI_Output(self,other,"DIA_Lester_XARDASWEG_13_08");	//� �����, ����� ����� ������� ����� ��� ����, � �� ���������� � ����.
	B_LogEntry(TOPIC_BuchHallenVonIrdorath,"������� �����. ������ ������� ��� ������, ����������� ��������� ��� ����.");
};


instance DIA_Lester_KnowWhereEnemy(C_Info)
{
	npc = PC_Psionic;
	nr = 2;
	condition = DIA_Lester_KnowWhereEnemy_Condition;
	information = DIA_Lester_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = "� �����, ��� ���������� ����.";
};


func int DIA_Lester_KnowWhereEnemy_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (Lester_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lester_KnowWhereEnemy_Info()
{
	AI_Output(other,self,"DIA_Lester_KnowWhereEnemy_15_00");	//� �����, ��� ���������� ����.
	AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_13_01");	//�� ��������� ����, ������ � ��� �����, �� ��� �������, � ������ ����������� � �����.
	AI_Output(other,self,"DIA_Lester_KnowWhereEnemy_15_02");	//��� �� ������ ���� �������?
	AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_13_03");	//� �� ���� ��������� �����, �� � ����, ��� ����� �������� �����, ������ ���� ���������� � �����.
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self,"DIA_Lester_KnowWhereEnemy_15_04");	//������, �� ������� ��� �����.
		AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_13_05");	//����� ��� � �����. �����, ��� ������ ������ �� ������ �� ��������� � ���������, ��� ���� ��� �������.
		AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_13_06");	//�� ������, ��� ���� ����� ������. �������� �� ���� - � ��� ��� �� ��������.
		AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_13_07");	//��� ������ �� �����.
	}
	else
	{
		Info_ClearChoices(DIA_Lester_KnowWhereEnemy);
		Info_AddChoice(DIA_Lester_KnowWhereEnemy,"� �� ���� ����� ���� � �����.",DIA_Lester_KnowWhereEnemy_No);
		Info_AddChoice(DIA_Lester_KnowWhereEnemy,"����� ������ �� ����, � �������� ������ �� ���� �������!",DIA_Lester_KnowWhereEnemy_Yes);
	};
};

func void DIA_Lester_KnowWhereEnemy_Yes()
{
	AI_Output(other,self,"DIA_Lester_KnowWhereEnemy_Yes_15_00");	//����� ������ �� ����, � �������� ������ �� ���� �������!
	AI_Output(other,self,"DIA_Lester_KnowWhereEnemy_Yes_15_01");	//���������� � ������. � ����� ����, ����� ���� �����.
	AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_Yes_13_02");	//����������. ������� � ��� ����.
	self.flags = NPC_FLAG_IMMORTAL;
	Lester_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(DIA_Lester_KnowWhereEnemy);
};

func void DIA_Lester_KnowWhereEnemy_No()
{
	AI_Output(other,self,"DIA_Lester_KnowWhereEnemy_No_15_00");	//� �� ���� ����� ���� � �����.
	AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_No_13_01");	//�������. �, ��������, ������������� ���� ��� ����� ������ ����.
	AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_No_13_02");	//�� �����, ���� �� �������� � ����� - �������, ����� �� ������� ��.
	AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_No_13_03");	//� ������ ����.
	Lester_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Lester_KnowWhereEnemy);
};


instance DIA_Lester_LeaveMyShip(C_Info)
{
	npc = PC_Psionic;
	nr = 4;
	condition = DIA_Lester_LeaveMyShip_Condition;
	information = DIA_Lester_LeaveMyShip_Info;
	permanent = TRUE;
	description = "� ���� ��� �� ��� ����� ��� ����.";
};


func int DIA_Lester_LeaveMyShip_Condition()
{
	if((Lester_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lester_LeaveMyShip_Info()
{
	AI_Output(other,self,"DIA_Lester_LeaveMyShip_15_00");	//� ���� ��� �� ��� ����� ��� ����.
	AI_Output(self,other,"DIA_Lester_LeaveMyShip_13_01");	//�������. �, ��������, ������ �� �� �� ����� �� ����� �����.
	AI_Output(self,other,"DIA_Lester_LeaveMyShip_13_02");	//�� ���� � ����������� ����, � ���� ��� ������. �� ������, ��� ����� ����.
	Lester_IsOnBoard = LOG_OBSOLETE;
	Crewmember_Count = Crewmember_Count - 1;
	Npc_ExchangeRoutine(self,"ShipOff");
};


instance DIA_Lester_StillNeedYou(C_Info)
{
	npc = PC_Psionic;
	nr = 4;
	condition = DIA_Lester_StillNeedYou_Condition;
	information = DIA_Lester_StillNeedYou_Info;
	permanent = TRUE;
	description = "��� ����� ����, ������ ������� ������.";
};


func int DIA_Lester_StillNeedYou_Condition()
{
	if(((Lester_IsOnBoard == LOG_OBSOLETE) || (Lester_IsOnBoard == LOG_FAILED)) && (Crewmember_Count < Max_Crew))
	{
		return TRUE;
	};
};

func void DIA_Lester_StillNeedYou_Info()
{
	AI_Output(other,self,"DIA_Lester_StillNeedYou_15_00");	//��� ����� ����, ������ ������� ������.
	if(Lester_IsOnBoard == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Lester_StillNeedYou_13_01");	//� ���� ���! �� ����� ��������� ���� �� ����. ��� � ������ �������!
		AI_Output(self,other,"DIA_Lester_StillNeedYou_13_02");	//��������, ���! �� ������� ���� ���!
		self.flags = NPC_FLAG_IMMORTAL;
		Lester_IsOnBoard = LOG_SUCCESS;
		Crewmember_Count = Crewmember_Count + 1;
		if(MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine(self,"SHIP");
		}
		else
		{
			Npc_ExchangeRoutine(self,"WAITFORSHIP");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Lester_StillNeedYou_13_03");	//� �����, ����� �����, ���� � ��� �� �������� �����. �����.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Lester_KAP6_EXIT(C_Info)
{
	npc = PC_Psionic;
	nr = 999;
	condition = DIA_Lester_KAP6_EXIT_Condition;
	information = DIA_Lester_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lester_KAP6_EXIT_Condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Lester_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PC_Psionic_PICKPOCKET(C_Info)
{
	npc = PC_Psionic;
	nr = 900;
	condition = DIA_PC_Psionic_PICKPOCKET_Condition;
	information = DIA_PC_Psionic_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_PC_Psionic_PICKPOCKET_Condition()
{
	return C_Beklauen(76,20);
};

func void DIA_PC_Psionic_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_PC_Psionic_PICKPOCKET);
	Info_AddChoice(DIA_PC_Psionic_PICKPOCKET,Dialog_Back,DIA_PC_Psionic_PICKPOCKET_BACK);
	Info_AddChoice(DIA_PC_Psionic_PICKPOCKET,DIALOG_PICKPOCKET,DIA_PC_Psionic_PICKPOCKET_DoIt);
};

func void DIA_PC_Psionic_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_PC_Psionic_PICKPOCKET);
};

func void DIA_PC_Psionic_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_PC_Psionic_PICKPOCKET);
};

