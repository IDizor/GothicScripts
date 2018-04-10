
instance DIA_Addon_Merdarion_EXIT(C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 999;
	condition = DIA_Addon_Merdarion_EXIT_Condition;
	information = DIA_Addon_Merdarion_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Merdarion_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Merdarion_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Merdarion_Hallo(C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 5;
	condition = DIA_Addon_Merdarion_Hallo_Condition;
	information = DIA_Addon_Merdarion_Hallo_Info;
	description = "�����?";
};


func int DIA_Addon_Merdarion_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Addon_Merdarion_Hallo_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Hallo_15_00");	//�����?
	AI_Output(self,other,"DIA_Addon_Merdarion_Hallo_06_01");	//��� ���������� ��� ���� - ������� �������. ������ ����������� ����, ��� ����� ������ �� �� �����.
	AI_Output(self,other,"DIA_Addon_Merdarion_Hallo_06_02");	//��� �� ������� ����� ���� ��� ������ ����������.
	AI_Output(self,other,"DIA_Addon_Merdarion_Hallo_06_03");	//���� ��� ������ ������ ������������� ������, ��� ����� �� ������� �������� �������� �� ��� ���������.
	AI_Output(self,other,"DIA_Addon_Merdarion_Hallo_06_04");	//������� ���������� � ���� ���.
};


instance DIA_Addon_Merdarion_Aufgabe(C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 5;
	condition = DIA_Addon_Merdarion_Aufgabe_Condition;
	information = DIA_Addon_Merdarion_Aufgabe_Info;
	description = "��� �� ����������� �����?";
};


func int DIA_Addon_Merdarion_Aufgabe_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Merdarion_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_Aufgabe_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Aufgabe_15_00");	//��� �� ������ ����� �������?
	AI_Output(self,other,"DIA_Addon_Merdarion_Aufgabe_06_01");	//� ������� ��������, ���� ����� ���� ������� ������.
	AI_Output(self,other,"DIA_Addon_Merdarion_Aufgabe_06_02");	//� ��� � ������� ��������� ������ ���������� ��������.
	AI_Output(self,other,"DIA_Addon_Merdarion_Aufgabe_06_03");	//����� ������� � ������������, ��� ���� ������ ����� � �� ����� �������, ������� ������ ��� ���� ����������.
	AI_Output(self,other,"DIA_Addon_Merdarion_Aufgabe_06_04");	//(�����������) � ����, �������, ������� �� ������ � �� ����� ��� ���...
	Npc_ExchangeRoutine(self,"START");
	B_StartOtherRoutine(Cronos_NW,"START");
	if(Nefarius_NW.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		B_LogEntry(TOPIC_Addon_KDW,"�������� ���� ��������� ��������.");
	};
};


instance DIA_Addon_Merdarion_DaDurch(C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 5;
	condition = DIA_Addon_Merdarion_DaDurch_Condition;
	information = DIA_Addon_Merdarion_DaDurch_Info;
	description = "�� ������������� ������ ������ ����� ���� ������?";
};


func int DIA_Addon_Merdarion_DaDurch_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Merdarion_Aufgabe))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_DaDurch_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_DaDurch_15_00");	//�� ������������� ������ ������ ����� ���� ������?
	AI_Output(self,other,"DIA_Addon_Merdarion_DaDurch_06_01");	//��. ��, ���� �� ������ ���������� ��������, �������.
	AI_Output(self,other,"DIA_Addon_Merdarion_DaDurch_06_02");	//� �������, ��� ���������� ����������� �����.
	AI_Output(self,other,"DIA_Addon_Merdarion_DaDurch_06_03");	//�� ��� ������ ���������� ��������, ��� ��� ����� ���� ������� � ����������� ���������������.
};


instance DIA_Addon_Merdarion_Bedrohung(C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 5;
	condition = DIA_Addon_Merdarion_Bedrohung_Condition;
	information = DIA_Addon_Merdarion_Bedrohung_Info;
	description = "� ��� ���� �������� ��� �������������?";
};


func int DIA_Addon_Merdarion_Bedrohung_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Merdarion_DaDurch))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_Bedrohung_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Bedrohung_15_00");	//� ��� ���� �������� ��� �������������?
	AI_Output(self,other,"DIA_Addon_Merdarion_Bedrohung_06_01");	//�� �������� �������� ���-�� �� ������ �������.
	AI_Output(self,other,"DIA_Addon_Merdarion_Bedrohung_06_02");	//��������, ��-�� ����� ������������ �������� ������.
	AI_Output(self,other,"DIA_Addon_Merdarion_Bedrohung_06_03");	//�� ��� ��� �� ��� ������. ������� � ������ ����� ���������� ���� ������.
};


instance DIA_Addon_Merdarion_Wasdahinter2(C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 5;
	condition = DIA_Addon_Merdarion_Wasdahinter2_Condition;
	information = DIA_Addon_Merdarion_Wasdahinter2_Info;
	description = "� ���, ��� �� �������, �� ��� �������?";
};


func int DIA_Addon_Merdarion_Wasdahinter2_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Merdarion_Aufgabe))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_Wasdahinter2_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Wasdahinter2_15_00");	//� ���, ��� �� �������, �� ��� �������?
	AI_Output(self,other,"DIA_Addon_Merdarion_Wasdahinter2_06_01");	//� ���� �� ����.
	AI_Output(self,other,"DIA_Addon_Merdarion_Wasdahinter2_06_02");	//� �������, ��� �� ��� ������� ������ ���� ��������, ������ � ����. � ������ ����� �������.
	AI_Output(self,other,"DIA_Addon_Merdarion_Wasdahinter2_06_03");	//��� ��������� �� ������, ������ ����� ������� ����.
};


instance DIA_Addon_Merdarion_PERM(C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 99;
	condition = DIA_Addon_Merdarion_PERM_Condition;
	information = DIA_Addon_Merdarion_PERM_Info;
	permanent = TRUE;
	description = "�� ������ ������� ���� ����-������ �� ������� �����?";
};


func int DIA_Addon_Merdarion_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Merdarion_Aufgabe))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_PERM_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_PERM_15_00");	//�� ������ ���� ������� �����?
	AI_Output(self,other,"DIA_Addon_Merdarion_PERM_06_01");	//����� �� �������� ���, � ���� � ������ ����� ������������.
};


instance DIA_Addon_Merdarion_Teleportstein(C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 5;
	condition = DIA_Addon_Merdarion_Teleportstein_Condition;
	information = DIA_Addon_Merdarion_Teleportstein_Info;
	description = "��� ������� ����� ��������� � �����?";
};


func int DIA_Addon_Merdarion_Teleportstein_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Merdarion_Aufgabe) && (MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_Teleportstein_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_15_00");	//��� ������� ����� ��������� � �����?
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_01");	//� ������� ���� ����� ��� �� �����, ��� �� � ������.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_02");	//(����������) �� �� ����� ������... ���, ��� ������� ������.
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_15_03");	//����������.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_04");	//�����. ��������� ���� ����� ������������� ����� ��������.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_05");	//��������� �� ����� ������, ��� ����� �����������������.
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_15_06");	//� ���� ��� ������ ����������.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_07");	//���������������� �����, ������� �� ����� � ��������, �� ����� ����, ������ ��������.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_08");	//�������, ��� ���������������� ������ � ���� ����� ����� ����� � �����.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_09");	//�� �� � ���� �� ��� �� ������� �������� ��� ���������.
	Info_ClearChoices(DIA_Addon_Merdarion_Teleportstein);
	Info_AddChoice(DIA_Addon_Merdarion_Teleportstein,"��� ���� ��� ����������� ������������� � ��� �������?",DIA_Addon_Merdarion_Teleportstein_ich);
	Info_AddChoice(DIA_Addon_Merdarion_Teleportstein,"��� ��������� ���� ������?",DIA_Addon_Merdarion_Teleportstein_wo);
};

func void DIA_Addon_Merdarion_Teleportstein_wo()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_wo_15_00");	//��� ��������� ���� ������?
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_wo_06_01");	//�� ������, � ������� � ���������. � ����� ��� ���.
	Info_AddChoice(DIA_Addon_Merdarion_Teleportstein,"��� ��� ����. � ���� ���������� �� ����.",DIA_Addon_Merdarion_Teleportstein_key);
};

func void DIA_Addon_Merdarion_Teleportstein_ich()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_ich_15_00");	//��� ���� ��� ����������� ������������� � ��� �������?
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_ich_06_01");	//�� ����. ��� ������� ���� �� ���� ��������. ��������, �� �� ��������.
};

func void DIA_Addon_Merdarion_Teleportstein_key()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_key_15_00");	//��� ��� ����. � ���� ���������� �� ����.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_key_06_01");	//(����������) ������? �� � �� ������� �� �����������.
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_key_15_02");	//����� ����.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_key_06_03");	//���� �� ��� ������. ����������.
	CreateInvItems(self,itke_portaltempelwalkthrough_addon,1);
	B_GiveInvItems(self,other,itke_portaltempelwalkthrough_addon,1);
	SC_GotPORTALTEMPELWALKTHROUGHKey = TRUE;
	Log_CreateTopic(TOPIC_Addon_TeleportsNW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_TeleportsNW,LOG_Running);
	B_LogEntry(TOPIC_Addon_TeleportsNW,"��������� ��� ��� ���� �� �������� �����. �� ��� ��������� ��������, ������� ��������� ���� ������� � ������.");
	Info_ClearChoices(DIA_Addon_Merdarion_Teleportstein);
};


instance DIA_Addon_Merdarion_WHereOtherTeleports(C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 5;
	condition = DIA_Addon_Merdarion_WHereOtherTeleports_Condition;
	information = DIA_Addon_Merdarion_WHereOtherTeleports_Info;
	description = "��� ��������� ���������������� �����?";
};


func int DIA_Addon_Merdarion_WHereOtherTeleports_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Merdarion_Teleportstein))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_WHereOtherTeleports_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_WHereOtherTeleports_15_00");	//��� ��������� ���������������� �����?
	AI_Output(self,other,"DIA_Addon_Merdarion_WHereOtherTeleports_06_01");	//�� ���� ��� ����� ������ ����, ���-�� ���������� ��������.
	AI_Output(self,other,"DIA_Addon_Merdarion_WHereOtherTeleports_06_02");	//����� � �������� '������� ������'.
	B_LogEntry(TOPIC_Addon_TeleportsNW,"����� � �������� '������� ������' ������ ���� ��� ���� ��������.");
};


instance DIA_Addon_Merdarion_TeleportsteinSuccess(C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 5;
	condition = DIA_Addon_Merdarion_TeleportsteinSuccess_Condition;
	information = DIA_Addon_Merdarion_TeleportsteinSuccess_Info;
	description = "���������������� �����, ������, �������� ���������.";
};


func int DIA_Addon_Merdarion_TeleportsteinSuccess_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Merdarion_Teleportstein) && (SCUsed_NW_TELEPORTSTATION_MAYA == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_TeleportsteinSuccess_Info()
{
	B_GivePlayerXP(XP_Ambient);
	AI_Output(other,self,"DIA_Addon_Merdarion_TeleportsteinSuccess_15_00");	//���������������� �����, ������, �������� ���������.
	AI_Output(self,other,"DIA_Addon_Merdarion_TeleportsteinSuccess_06_01");	//�� ������ ���? �� ������������� ����� ����?
	AI_Output(other,self,"DIA_Addon_Merdarion_TeleportsteinSuccess_15_02");	//��. ��������, ��� ��� ��� ��������.
	AI_Output(self,other,"DIA_Addon_Merdarion_TeleportsteinSuccess_06_03");	//(����������) ����������. ��� ����� ����� ������� ��������� �� ���.
};

