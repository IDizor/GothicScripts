
instance DIA_Dexter_EXIT(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 999;
	condition = DIA_Dexter_EXIT_Condition;
	information = DIA_Dexter_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dexter_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Dexter_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Dexter_Hallo(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 1;
	condition = DIA_Dexter_Hallo_Condition;
	information = DIA_Dexter_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dexter_Hallo_Condition()
{
	if(Knows_Dexter == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Dexter_Hallo_Info()
{
	AI_Output(self,other,"DIA_Dexter_Hallo_09_00");	//����������, ��� ������. ������� ������������. ��� �, �����, ��� �� ������� �����?
	AI_Output(other,self,"DIA_Dexter_Hallo_15_01");	//� ���� �������� ������ �� ��������� ��������.
	if(Ranger_SCKnowsDexter == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_00");	//�� ������ �, ��� �� ������� ���� �����������.
		AI_Output(other,self,"DIA_Addon_Dexter_Hallo_15_01");	//��� �� ������ � ����?
		AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_02");	//� ���� � ����, ��� � ���������� ����. ������� ���� �� ���������� ��� ���������� � �������?
		AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_03");	//�� ��� ���������� ���� ����. ��-��, ���� �������� �����������. ����� �� �� ����?
	}
	else
	{
		AI_Output(other,self,"DIA_Dexter_Hallo_15_02");	//���-�� �������������� ������ ������ � ���� ������������. ���-��� ������ ���, ��� ��� ��.
		AI_Output(self,other,"DIA_Dexter_Hallo_09_03");	//���-�� ������� ����� �������.
		AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_04");	//�������, �� ����. � ������������� ���������� � �������. � ����� ���� - � �� ������.
		MIS_Steckbriefe = LOG_SUCCESS;
		B_GivePlayerXP(XP_Ambient);
	};
	AI_Output(other,self,"DIA_Addon_Dexter_Hallo_15_05");	//����, ��� ���� �� ���� ����?
	AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_06");	//���? ��������� ������. �� ��� ������ ������ ���������� ������ ����� ������.
	AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_07");	//������� �� �������� ��� ����� ���� � ��������� ��� ���� ������.
};


instance DIA_Dexter_Glaube(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 5;
	condition = DIA_Dexter_Glaube_Condition;
	information = DIA_Dexter_Glaube_Info;
	permanent = FALSE;
	description = "� �� ���� �� ������ ������ �����.";
};


func int DIA_Dexter_Glaube_Condition()
{
	if(Knows_Dexter == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Dexter_Glaube_Info()
{
	AI_Output(other,self,"DIA_Dexter_Glaube_15_00");	//� �� ���� �� ������ ������ �����.
	AI_Output(self,other,"DIA_Dexter_Glaube_09_01");	//��������, ��� ��� ������. ������� ������� ����� ������!
};


instance DIA_Addon_Dexter_Patrick(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 2;
	condition = DIA_Addon_Dexter_Patrick_Condition;
	information = DIA_Addon_Dexter_Patrick_Info;
	description = "� ��� �������� ������� �� ����� ������?";
};


func int DIA_Addon_Dexter_Patrick_Condition()
{
	if((MIS_Addon_Cord_Look4Patrick == LOG_Running) && (Knows_Dexter == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Dexter_Patrick_Info()
{
	AI_Output(other,self,"DIA_Addon_Dexter_Patrick_15_00");	//� ��� �������� ������� �� ����� ������?
	AI_Output(self,other,"DIA_Addon_Dexter_Patrick_09_01");	//������? �� �������, � ��� �� ��������.
	AI_Output(self,other,"DIA_Addon_Dexter_Patrick_09_02");	//� ���������� ������-�� ���������� ��������, ������� ������ ����� ��������� � ������ � ��������.
	AI_Output(self,other,"DIA_Addon_Dexter_Patrick_09_03");	//�� � �� ����� ��� ��� ���� ����� ������� �������.
	AI_Output(self,other,"DIA_Addon_Dexter_Patrick_09_04");	//��������, �� � ����� ������ �������� �� ������������. ��� ��� ����������.
	Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_MissingPeople,"������� ����������, ��� �� ����� �������� �������.");
	Dexter_KnowsPatrick = TRUE;
	B_GivePlayerXP(XP_Addon_Dexter_KnowsPatrick);
};


instance DIA_Addon_Dexter_Greg(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 5;
	condition = DIA_Addon_Dexter_Greg_Condition;
	information = DIA_Addon_Dexter_Greg_Info;
	description = "���� ���� ������� � �������� �� �����!";
};


func int DIA_Addon_Dexter_Greg_Condition()
{
	if((SC_KnowsGregsSearchsDexter == TRUE) && (Knows_Dexter == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Dexter_Greg_Info()
{
	AI_Output(other,self,"DIA_Addon_Dexter_Greg_15_00");	//���� ���� ������� � �������� �� �����!
	AI_Output(self,other,"DIA_Addon_Dexter_Greg_09_01");	//���� ��� ����. �� ��� �� ����.
	AI_Output(self,other,"DIA_Addon_Dexter_Greg_09_02");	//���� ����� �������� ����, ��� �������, �� ����� �� �������� ����.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Addon_Dexter_missingPeople(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 2;
	condition = DIA_Addon_Dexter_missingPeople_Condition;
	information = DIA_Addon_Dexter_missingPeople_Info;
	description = "�� ��������� ������� ��������!";
};


func int DIA_Addon_Dexter_missingPeople_Condition()
{
	if((SC_KnowsDexterAsKidnapper == TRUE) && (Knows_Dexter == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Dexter_missingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Dexter_missingPeople_15_00");	//�� ��������� ������� ��������!
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_09_01");	//����, �� ��� �������. ������� ������, ��������.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_09_02");	//� �-�� �����, � ������� ������� ��� �����.
	Info_ClearChoices(DIA_Addon_Dexter_missingPeople);
	Info_AddChoice(DIA_Addon_Dexter_missingPeople,"��� ������ ���� �������?",DIA_Addon_Dexter_missingPeople_wer);
	Info_AddChoice(DIA_Addon_Dexter_missingPeople,"���� �������� ���������� ����? �������� ���-�� ����� � ��������?",DIA_Addon_Dexter_missingPeople_Wo);
};

func void DIA_Addon_Dexter_missingPeople_Wo()
{
	AI_Output(other,self,"DIA_Addon_Dexter_missingPeople_Wo_15_00");	//���� �������� ���������� ����? �������� ���-�� ����� � ��������?
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Wo_09_01");	//(�������) ���-���, ��� ������ �� ������-�������. ���� ���� �� ���������.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Wo_09_02");	//� ��� �� �������� ����, ��� ������, �� ��� ���������� �� �������.
};

func void DIA_Addon_Dexter_missingPeople_wer()
{
	AI_Output(other,self,"DIA_Addon_Dexter_missingPeople_wer_15_00");	//��� ������ ���� �������?
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_wer_09_01");	//������. ����� ������� �������. �������, �� ��� ������. ��� �����, ���� �� ������ ������ ������� �� ������ ��������.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_wer_09_02");	//��� ���� ����� ��� ��� ���������� ��� ������. � ��� ���, ��� ���� ����� �����.
	Info_AddChoice(DIA_Addon_Dexter_missingPeople,"����� ������? ���������...",DIA_Addon_Dexter_missingPeople_Raven);
	Info_AddChoice(DIA_Addon_Dexter_missingPeople,"������ ����� �����, � ��������?",DIA_Addon_Dexter_missingPeople_RavenTot);
};

func void DIA_Addon_Dexter_missingPeople_Raven()
{
	AI_Output(other,self,"DIA_Addon_Dexter_missingPeople_Raven_15_00");	//����� ������? ���������...
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Raven_09_01");	//(�����������) �� ��� ���� ��������? �� �� ������ ���, ��� � ����.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Raven_09_02");	//(����������) ����� �� ������������� ��� ������ �������, �� ������...
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Raven_09_03");	//����� ������� ������� �� ���������. �� ��� ���� ����� ������ ����.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Raven_09_04");	//(�� �������) ���� ������� ����� �������� ��� � �����, ��� ������ ������� ����, ��� ����� �������.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Raven_09_05");	//� ��� ���� ���� �����. ���� �� ��������. ����, ���� ��� �� ������� ������.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Raven_09_06");	//(������) ����� ���� ���� ���� ������ ������.
	Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_WhoStolePeople,"� �������� ���� ������. ����� ��� �����. ����� - ������ ������ �����. ������, ��� ������ ����� ����� �� ����� ����� ����������� �����. ������ ��� ����� ������ �������� �������������� �����.");
	Info_ClearChoices(DIA_Addon_Dexter_missingPeople);
};

func void DIA_Addon_Dexter_missingPeople_RavenTot()
{
	AI_Output(other,self,"DIA_Addon_Dexter_missingPeople_RavenTot_15_00");	//������ ����� �����, � ��������?
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_RavenTot_09_01");	//�� ������ �� ������ �����. � ���� ���� �����, � ����� ������� ����� � ��� �����.
};


instance DIA_Addon_Dexter_Boss(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 3;
	condition = DIA_Addon_Dexter_Boss_Condition;
	information = DIA_Addon_Dexter_Boss_Info;
	description = "���� ������? ��� ��� �����?";
};


func int DIA_Addon_Dexter_Boss_Condition()
{
	if((Knows_Dexter == TRUE) && (SC_KnowsDexterAsKidnapper == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Dexter_Boss_Info()
{
	AI_Output(other,self,"DIA_Addon_Dexter_Boss_15_00");	//���� ������? ��� ��� �����?
	AI_Output(self,other,"DIA_Addon_Dexter_Boss_09_01");	//(�������) ����, ���������, �� �������� ��� ������? �������.
	AI_Output(self,other,"DIA_Addon_Dexter_Boss_09_02");	//(��������) �� ���� �� ����� �������, �� ������� � ������ ���� ��� �������.
};


instance DIA_Dexter_Vor(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 5;
	condition = DIA_Dexter_Vor_Condition;
	information = DIA_Dexter_Vor_Info;
	permanent = FALSE;
	description = "� ��� �� ����������� ������ ������? ����� ����?";
};


func int DIA_Dexter_Vor_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Dexter_missingPeople))
	{
		return TRUE;
	};
};

func void DIA_Dexter_Vor_Info()
{
	AI_Output(other,self,"DIA_Dexter_Vor_15_00");	//� ��� �� ����������� ������ ������? ����� ����?
	AI_Output(self,other,"DIA_Dexter_Vor_09_01");	//��. �� �� ��������� ��� ����. ��� ������ � ��� ���� ��� ���� ����. �������� - �������, �������� ���������. ����� � ������ �� ��������� ��� �� ����.
	AI_Output(other,self,"DIA_Addon_Dexter_Vor_15_00");	//� ������ ������, ���� �� �������� �����.
	AI_Output(self,other,"DIA_Addon_Dexter_Vor_09_01");	//(�������) �� ��� �� ����������� ����� ��������� ���� ��������...
	AI_Output(self,other,"DIA_Addon_Dexter_Vor_09_02");	//(���������) �����, ���� ����� ����.
	AI_Output(self,other,"DIA_Dexter_Vor_09_02");	//���� � ����� ���� ��� ���, �� ��� ��������� ����!
	Dexter_NoMoreSmallTalk = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_Dexter_Kill(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 2;
	condition = DIA_Dexter_Kill_Condition;
	information = DIA_Dexter_Kill_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dexter_Kill_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && ((Dexter_NoMoreSmallTalk == TRUE) || (Knows_Dexter == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_Dexter_Kill_Info()
{
	if(Knows_Dexter == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Dexter_Add_09_02");	//�� ��� ����������...
	}
	else
	{
		AI_Output(self,other,"DIA_Dexter_Kill_09_01");	//��, ���� �� ������ ������������ �����. �� �������� �� � �� ����� � �� � ��� �����.
	};
	MIS_Steckbriefe = LOG_OBSOLETE;
	B_CheckLog();
	B_Greg_ComesToDexter();
	Info_ClearChoices(DIA_Dexter_Kill);
	Info_AddChoice(DIA_Dexter_Kill,Dialog_Ende,DIA_Dexter_Kill_ENDE);
};

func void DIA_Dexter_Kill_ENDE()
{
	var C_Item itm;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
	itm = Npc_GetEquippedArmor(Greg_NW);
	if(Hlp_IsItem(itm,ITAR_PIR_H_Addon) == FALSE)
	{
		AI_EquipArmor(Greg_NW,ITAR_PIR_H_Addon);
	};
};


instance DIA_Dexter_Kopf(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 5;
	condition = DIA_Dexter_Kopf_Condition;
	information = DIA_Dexter_Kopf_Info;
	permanent = FALSE;
	description = "���� ����� ��� ������? ��� �, �������� �� �����!";
};


func int DIA_Dexter_Kopf_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dexter_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Dexter_Kopf_Info()
{
	AI_Output(other,self,"DIA_Addon_Dexter_Add_15_00");	//���� ����� ��� ������? ��� �, �������� �� �����!
	AI_Output(self,other,"DIA_Addon_Dexter_Add_09_01");	//��, ���� �� ��� ������...
	DIA_Dexter_Kill_ENDE();
};


instance DIA_Dexter_PICKPOCKET(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 900;
	condition = DIA_Dexter_PICKPOCKET_Condition;
	information = DIA_Dexter_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_100;
};


func int DIA_Dexter_PICKPOCKET_Condition()
{
	return C_Beklauen(96,370);
};

func void DIA_Dexter_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Dexter_PICKPOCKET);
	Info_AddChoice(DIA_Dexter_PICKPOCKET,Dialog_Back,DIA_Dexter_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Dexter_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Dexter_PICKPOCKET_DoIt);
};

func void DIA_Dexter_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Dexter_PICKPOCKET);
};

func void DIA_Dexter_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Dexter_PICKPOCKET);
};

