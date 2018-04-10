
instance DIA_MiltenNW_EXIT(C_Info)
{
	npc = PC_Mage_NW;
	nr = 999;
	condition = DIA_MiltenNW_EXIT_Condition;
	information = DIA_MiltenNW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_MiltenNW_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MiltenNW_KAP3_EXIT(C_Info)
{
	npc = PC_Mage_NW;
	nr = 999;
	condition = DIA_MiltenNW_KAP3_EXIT_Condition;
	information = DIA_MiltenNW_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_MiltenNW_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MiltenNW_KAP3_Hello(C_Info)
{
	npc = PC_Mage_NW;
	nr = 31;
	condition = DIA_MiltenNW_KAP3_Hello_Condition;
	information = DIA_MiltenNW_KAP3_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_MiltenNW_KAP3_Hello_Condition()
{
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_KAP3_Hello_Info()
{
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_00");	//(�� ����) � �� ���� �������� � ���. �� ������������� ���� ���������?
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_01");	//������ �� ��.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_02");	//(� �������) ���� ����� ��� �� ���������� ����������, �� ����������� ������� ����� ������� ��� ������.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_03");	//�����-�� ������� ����� ��� ���� �� ��������.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_04");	//�������� �� ������ � �����.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_05");	//� ����, �� ��� ����� ������, ��� �� �� ����� �������.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_06");	//�� ��.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_07");	//��� �� ������� �����, � ���������? ��� � ������. �� ������ ���� ����������� � ��������� �����.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_08");	//��������.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_09");	//� ���� ��� - ����� ����� ���� ���������� � ��������, �� �������� �� ���, ���������. �� ������� ��� ����� ��������.
	};
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_10");	//� ����, ��� ����� ��������� �������.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_11");	//����� �����?
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_12");	//��� �� ������������� � ��������� �� ���������.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_13");	//��, �� ������� �� ��� ��������� ������. ��� �� �����, �� ���������� �� ���� ����� ����, � ������ ��� ����� ��������.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_14");	//��� ���?
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_15");	//� ���, �������, � ���� �� ����, ��� �� ���������, ��� ���� ������ ������� ����.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_16");	//���� �� ������ � �����.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_17");	//� ����, ��, ��� �� �����, ��� ���������� ��������. � �� ������ �����.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_18");	//�� ������� �������. ��� ���� ������� ����� ������������ ���� ������.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_19");	//��, �����.
	};
};


instance DIA_MiltenNW_Monastery(C_Info)
{
	npc = PC_Mage_NW;
	nr = 35;
	condition = DIA_MiltenNW_Monastery_Condition;
	information = DIA_MiltenNW_Monastery_Info;
	permanent = FALSE;
	description = "��� �� ���� ��������� �� ��������� ��� ������?";
};


func int DIA_MiltenNW_Monastery_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_Monastery_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_Monastery_15_00");	//��� �� ���� ��������� �� ��������� ��� ������?
	AI_Output(self,other,"DIA_MiltenNW_Monastery_03_01");	//������ ����� ������? � ������������ ����� ������ � ���������� ����� � ���������.
	AI_Output(self,other,"DIA_MiltenNW_Monastery_03_02");	//������ ��������, ��� ��� ���� �������� - ���� �� ���� ��������, ��� ���������� �� ��� ������� �� ������, �� ������� ��������� ��� �� ������, ��� � ������.
};


instance DIA_MiltenNW_FourFriends(C_Info)
{
	npc = PC_Mage_NW;
	nr = 35;
	condition = DIA_MiltenNW_FourFriends_Condition;
	information = DIA_MiltenNW_FourFriends_Info;
	permanent = FALSE;
	description = "�� ������, ��� ���������?";
};


func int DIA_MiltenNW_FourFriends_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_FourFriends_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_FourFriends_15_00");	//�� ������, ��� ���������?
	if(Npc_IsDead(PC_Fighter_NW_vor_DJG) == FALSE)
	{
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_01");	//����, ������, ������ �� ��������� ����� ���������� � ������ �������.
		if(MIS_RescueGorn != LOG_SUCCESS)
		{
			AI_Output(other,self,"DIA_MiltenNW_FourFriends_15_02");	//��� ��� ������� ���������?
			AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_03");	//��� �������� ������� �������, ��� ��� �� ���� ��� ���������.
			AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_04");	//�� ��� ������ ����� ����, �������?
		};
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_05");	//� ����� ������, �� ����� ����������� � �� � ����������, ��� ���������� �� �����.
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_06");	//����� ��������� � �������, ��, ��������, ������ �������� ���������� ������ � ���� � ���������� �� ��������� �������� ���������.
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_07");	//���� �� �������.
	};
	if(Npc_IsDead(PC_Thief_NW) == FALSE)
	{
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_08");	//����� �������� ���-�� � ��������. �� � ������� �� ����, ��� �� ����� ������� ����.
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_09");	//�� � ����������, ��� �� ������ � ������. �� ������ ��� - �� ������ ���, ��� ����� ����������.
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_10");	//����� ������� ����� - ������, ��� ������ ������� � ���.
	};
};


instance DIA_MiltenNW_KAP3_Entry(C_Info)
{
	npc = PC_Mage_NW;
	nr = 32;
	condition = DIA_MiltenNW_KAP3_Entry_Condition;
	information = DIA_MiltenNW_KAP3_Entry_Info;
	permanent = TRUE;
	description = "��� ����� ������� � ���������. ��� ������!";
};


func int DIA_MiltenNW_KAP3_Entry_Condition()
{
	if((Kapitel == 3) && (hero.guild != GIL_KDF) && (MiltenNW_GivesMonasteryKey == FALSE))
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_KAP3_Entry_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP3_Entry_15_00");	//��� ����� ������� � ���������. ��� ������!
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_03_01");	//��, �������. ��� ����.
		CreateInvItems(self,ItKe_Innos_MIS,1);
		B_GiveInvItems(self,other,ItKe_Innos_MIS,1);
		MiltenNW_GivesMonasteryKey = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_03_02");	//� �� ���� ������� ���� � ���������. � ���� ����� �������� � ������ �������.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_03_03");	//��� ���������� ��������� �����, � ������ �� ���� ������� � ���������.
		Info_ClearChoices(DIA_MiltenNW_KAP3_Entry);
		Info_AddChoice(DIA_MiltenNW_KAP3_Entry,Dialog_Back,DIA_MiltenNW_KAP3_Entry_BACK);
		Info_AddChoice(DIA_MiltenNW_KAP3_Entry,"�� ��� �����!",DIA_MiltenNW_KAP3_Entry_Important);
		if(Npc_HasItems(other,ItWr_PermissionToWearInnosEye_MIS) >= 1)
		{
			Info_AddChoice(DIA_MiltenNW_KAP3_Entry,"� ���� ���� ������ �� ����� ������.",DIA_MiltenNW_KAP3_Entry_Permit);
		};
	};
};

func void DIA_MiltenNW_KAP3_Entry_BACK()
{
	Info_ClearChoices(DIA_MiltenNW_KAP3_Entry);
};

func void DIA_MiltenNW_KAP3_Entry_Important()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP3_Entry_Important_15_00");	//�� ��� �����!
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_Important_03_01");	//��� �� �������. ������� ������� ��� ������ �� ���.
	Info_ClearChoices(DIA_MiltenNW_KAP3_Entry);
};

func void DIA_MiltenNW_KAP3_Entry_Permit()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP3_Entry_Permit_15_00");	//� ���� ���� ������ �� ����� ������.
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_Permit_03_01");	//������.
	B_GiveInvItems(other,self,ItWr_PermissionToWearInnosEye_MIS,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_Permit_03_02");	//(���������) ������. ��� ���� �� ���������. �� ������� �������� � ������.
	CreateInvItems(self,ItKe_Innos_MIS,1);
	B_GiveInvItems(self,other,ItKe_Innos_MIS,1);
	B_GiveInvItems(self,other,ItWr_PermissionToWearInnosEye_MIS,1);
	MiltenNW_GivesMonasteryKey = TRUE;
	Info_ClearChoices(DIA_MiltenNW_KAP3_Entry);
};


instance DIA_MiltenNW_KAP3_NovizenChase(C_Info)
{
	npc = PC_Mage_NW;
	nr = 31;
	condition = DIA_MiltenNW_KAP3_NovizenChase_Condition;
	information = DIA_MiltenNW_KAP3_NovizenChase_Info;
	permanent = FALSE;
	description = "�� ������, ��� �����?";
};


func int DIA_MiltenNW_KAP3_NovizenChase_Condition()
{
	if((Kapitel == 3) && (MIS_NovizenChase == LOG_Running) && (MIS_SCKnowsInnosEyeIsBroken == FALSE))
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_KAP3_NovizenChase_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP3_NovizenChase_15_00");	//�� ������, ��� �����?
	AI_Output(self,other,"DIA_MiltenNW_KAP3_NovizenChase_03_01");	//�� �������, � ����� �� ����� ���� �� � ����, ��� ���������� ���� ���������?
	AI_Output(self,other,"DIA_MiltenNW_KAP3_NovizenChase_03_02");	//�� ������ ��������� �� ��, ��� ������. � �������, ��� ������� ������� ����.
	AI_Output(self,other,"DIA_MiltenNW_KAP3_NovizenChase_03_03");	//�� ������ ������ ���. ����� ��� � ������� ����� ���� ������.
};


instance DIA_MiltenNW_KAP3_Perm(C_Info)
{
	npc = PC_Mage_NW;
	nr = 39;
	condition = DIA_MiltenNW_KAP3_Perm_Condition;
	information = DIA_MiltenNW_KAP3_Perm_Info;
	permanent = FALSE;
	description = "�� ������, ���-������ � ����� � ������ �����?";
};


func int DIA_MiltenNW_KAP3_Perm_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_KAP3_Perm_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP3_Perm_15_00");	//�� ������, ���-������ � ����� � ������ �����?
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Perm_03_01");	//���, �� � ���� ������ ������������ ������ ���.
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Perm_03_02");	//���� ���������, ���� ���������� �� ���.
};


instance DIA_MiltenNW_KAP4_EXIT(C_Info)
{
	npc = PC_Mage_NW;
	nr = 999;
	condition = DIA_MiltenNW_KAP4_EXIT_Condition;
	information = DIA_MiltenNW_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_MiltenNW_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MiltenNW_KAP4_PERM(C_Info)
{
	npc = PC_Mage_NW;
	nr = 49;
	condition = DIA_MiltenNW_KAP4_PERM_Condition;
	information = DIA_MiltenNW_KAP4_PERM_Info;
	permanent = TRUE;
	description = "���� �������?";
};


func int DIA_MiltenNW_KAP4_PERM_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_KAP4_PERM_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP4_PERM_15_00");	//���� �������?
	AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_01");	//��� � ������ ���� ����������. �� ��� ����� ����� �����������.
	AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_02");	//������ ����� �������� ����������� ��������� ��� �����.
	AI_Output(other,self,"DIA_MiltenNW_KAP4_PERM_15_03");	//���-������ ���?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_04");	//��������� ����� ��� ������ ��������� � ��������� �����, ���� �� ��������� ������ ��������.
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_05");	//��� ��� ��� �� �������� - � �� �����, ��� � ��� �������� ����� �������.
	}
	else if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_06");	//������ ������� � ��������� ���������� ������� � ��� �����.
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_07");	//� �� ����, ��� ��� ��� ������, �� � �����, ��� ���� ���-�� �������.
	}
	else if(MIS_FindTheObesessed == LOG_Running)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_08");	//�� �������� ��� ������ ��������� �� ��������� �����. ���� ���� �����, ����������� �������, ��� � ������.
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_09");	//���, �������� ��� ��� ����� ���������. ���, ��� ��� ��������, - ��� ������ � ������.
	};
};


instance DIA_MiltenNW_KAP5_EXIT(C_Info)
{
	npc = PC_Mage_NW;
	nr = 999;
	condition = DIA_MiltenNW_KAP5_EXIT_Condition;
	information = DIA_MiltenNW_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_MiltenNW_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MiltenNW_AllDragonsDead(C_Info)
{
	npc = PC_Mage_NW;
	nr = 900;
	condition = DIA_MiltenNW_AllDragonsDead_Condition;
	information = DIA_MiltenNW_AllDragonsDead_Info;
	permanent = FALSE;
	description = "� ���� ���� ��������.";
};


func int DIA_MiltenNW_AllDragonsDead_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_AllDragonsDead_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_AllDragonsDead_15_00");	//� ���� ���� ��������.
	AI_Output(self,other,"DIA_MiltenNW_AllDragonsDead_03_01");	//������? ������, ���� ��� �������� ������� �� ���������. ������ ���, ��� ��� ��������, - ��� �������� ������ ���.
	AI_Output(self,other,"DIA_MiltenNW_AllDragonsDead_03_02");	//���� �� ������������� ������ ���, �� ����������� ������� � ���� �����.
	AI_Output(other,self,"DIA_MiltenNW_AllDragonsDead_15_03");	//����, ���?
	AI_Output(self,other,"DIA_MiltenNW_AllDragonsDead_03_04");	//����, ������� ��. ���� �� ���?
	if(MiltenNW_IsOnBoard == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_MiltenNW_AllDragonsDead_03_05");	//�� ������ ��������� ��� ����� ������, ����� ����� ����� ������� ������.
	};
};


instance DIA_MiltenNW_SCWasInLib(C_Info)
{
	npc = PC_Mage_NW;
	nr = 3;
	condition = DIA_MiltenNW_SCWasInLib_Condition;
	information = DIA_MiltenNW_SCWasInLib_Info;
	important = TRUE;
};


func int DIA_MiltenNW_SCWasInLib_Condition()
{
	if(MIS_SCKnowsWayToIrdorath == TRUE)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_SCWasInLib_Info()
{
	AI_Output(self,other,"DIA_MiltenNW_SCWasInLib_03_00");	//��, � ������, �� ������ ����� ������� � ������������ �������. ��� �� ����� ���?
};


instance DIA_MiltenNW_KnowWhereEnemy(C_Info)
{
	npc = PC_Mage_NW;
	nr = 55;
	condition = DIA_MiltenNW_KnowWhereEnemy_Condition;
	information = DIA_MiltenNW_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = "� ����, ��� ���������� ����.";
};


func int DIA_MiltenNW_KnowWhereEnemy_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (MiltenNW_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};


var int SCToldMiltenHeKnowWhereEnemy;

func void DIA_MiltenNW_KnowWhereEnemy_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_KnowWhereEnemy_15_00");	//� ����, ��� ���������� ����. �� ��������� �������, �������� ������.
	AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_01");	//��� ��� ����. �� ������ ������������ ���� ���������� � ���������� ��� ��� � ��������.
	SCToldMiltenHeKnowWhereEnemy = TRUE;
	Log_CreateTopic(Topic_Crew,LOG_MISSION);
	Log_SetTopicStatus(Topic_Crew,LOG_Running);
	if(Npc_IsDead(DiegoNW) == FALSE)
	{
		AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_02");	//�� ������� � �����? � �����, �� ���������� �������������� � ����.
		B_LogEntry(Topic_Crew,"����� ����� ��������� ��������. �� ������� ������� �� ������������� �� ����� �����.");
	};
	if(Npc_IsDead(GornNW_nach_DJG) == FALSE)
	{
		AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_03");	//� ��� ������ �����? �������� � ���. � ������, �� �������� �� ������ ��������.
		B_LogEntry(Topic_Crew,"����, �����������, ����� ��������� ��������. ������� �� �������� ����� �� ����� ������� ������ ����������� �����. ��������, �� ������ ����������� ����.");
	};
	if(Npc_IsDead(Lester) == FALSE)
	{
		AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_04");	//� �� ������ �������. ���� �� �� �������� ��� �� ������, �� ������ ���.
		B_LogEntry(Topic_Crew,"���� � �� ������ ������� � �����, ��� ������� �� ��������� �� ���� ������.");
	};
	AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_05");	//� ����� ���� ���� ���� �� ���� ����. � ���� �������� ���� ���� � ������ � �������� ���. ����� �� ���������?
	B_LogEntry(Topic_Crew,"���� ������ ���������� � ���� �� ����, �� ����� ������� ���� ��������� ���� � �������� ��� ����.");
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self,"DIA_MiltenNW_KnowWhereEnemy_15_06");	//�� ��� ������, � ���� ��� ���������� �����.
		AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_07");	//�� ������, � ������ ����� ����� � �����. ���� �����������, ������ �����.
		AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_08");	//�����, �� �� ������� ���� ����� ��� ����� ������.
	}
	else
	{
		Info_ClearChoices(DIA_MiltenNW_KnowWhereEnemy);
		Info_AddChoice(DIA_MiltenNW_KnowWhereEnemy,"������ � �� ���� ����� ���� �����.",DIA_MiltenNW_KnowWhereEnemy_No);
		Info_AddChoice(DIA_MiltenNW_KnowWhereEnemy,"����� ���������� �� ����!",DIA_MiltenNW_KnowWhereEnemy_Yes);
	};
};

func void DIA_MiltenNW_KnowWhereEnemy_Yes()
{
	AI_Output(other,self,"DIA_MiltenNW_KnowWhereEnemy_Yes_15_00");	//����� ���������� �� ����!
	AI_Output(other,self,"DIA_MiltenNW_KnowWhereEnemy_Yes_15_01");	//���������� � ������. ��� ���� ���.
	AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_Yes_03_02");	//������. � ���� ���, ����� �� ������ �����.
	self.flags = NPC_FLAG_IMMORTAL;
	MiltenNW_IsOnBoard = LOG_SUCCESS;
	B_GivePlayerXP(XP_Crewmember_Success);
	Crewmember_Count = Crewmember_Count + 1;
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(DIA_MiltenNW_KnowWhereEnemy);
};

func void DIA_MiltenNW_KnowWhereEnemy_No()
{
	AI_Output(other,self,"DIA_MiltenNW_KnowWhereEnemy_No_15_00");	//������ � �� ���� ����� ���� �����.
	AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_No_03_01");	//�� ������, ��� � ����� ���� � ����� �� �����. ���� �����������, ������ �����.
	MiltenNW_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_MiltenNW_KnowWhereEnemy);
};


instance DIA_MiltenNW_WhereCaptain(C_Info)
{
	npc = PC_Mage_NW;
	nr = 3;
	condition = DIA_MiltenNW_WhereCaptain_Condition;
	information = DIA_MiltenNW_WhereCaptain_Info;
	description = "��� ��� ����� ��������?";
};


func int DIA_MiltenNW_WhereCaptain_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (SCToldMiltenHeKnowWhereEnemy == TRUE) && (SCGotCaptain == FALSE))
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_WhereCaptain_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_WhereCaptain_15_00");	//��� ��� ����� ��������?
	AI_Output(self,other,"DIA_MiltenNW_WhereCaptain_03_01");	//������ �������. �� ���� �����. ��, ������ ����, ��� ��� � ���������.
	AI_Output(self,other,"DIA_MiltenNW_WhereCaptain_03_02");	//�� ���� �� �� ������ ������, �������� ������������ �� ������ ��� � ������, ����� ����, �������� �������, ��������� ��������� ����� ��������.
	AI_Output(self,other,"DIA_MiltenNW_WhereCaptain_03_03");	//����� ����� ���������� � �� ��� ������������ � ������ ��������. ������ ������ ������ ��� � ������ �� ��������.
	Log_CreateTopic(Topic_Captain,LOG_MISSION);
	Log_SetTopicStatus(Topic_Captain,LOG_Running);
	B_LogEntry(Topic_Captain,"��������, ����� ����� � ����� ������� � �������� ��������. �� ��� ��� ������ ���� � ���������. ����, ����� ���� ���� � ������ ��������� �� ������ � � ������. ��������, ��� ����� ���������� � �� ��� ������������ � ������.");
};


instance DIA_MiltenNW_LeaveMyShip(C_Info)
{
	npc = PC_Mage_NW;
	nr = 55;
	condition = DIA_MiltenNW_LeaveMyShip_Condition;
	information = DIA_MiltenNW_LeaveMyShip_Info;
	permanent = TRUE;
	description = "� �� ���� ����� ���� � �����.";
};


func int DIA_MiltenNW_LeaveMyShip_Condition()
{
	if((MiltenNW_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_LeaveMyShip_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_LeaveMyShip_15_00");	//� �� ���� ����� ���� � �����.
	AI_Output(self,other,"DIA_MiltenNW_LeaveMyShip_03_01");	//�� ����� ������, ��� ���� �����. ���� �����������, � ���� ����� ���� � ���������.
	MiltenNW_IsOnBoard = LOG_OBSOLETE;
	Crewmember_Count = Crewmember_Count - 1;
	Npc_ExchangeRoutine(self,"ShipOff");
};


instance DIA_MiltenNW_StillNeedYou(C_Info)
{
	npc = PC_Mage_NW;
	nr = 55;
	condition = DIA_MiltenNW_StillNeedYou_Condition;
	information = DIA_MiltenNW_StillNeedYou_Info;
	permanent = TRUE;
	description = "�� ����� ���.";
};


func int DIA_MiltenNW_StillNeedYou_Condition()
{
	if(((MiltenNW_IsOnBoard == LOG_OBSOLETE) || (MiltenNW_IsOnBoard == LOG_FAILED)) && (Crewmember_Count < Max_Crew))
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_StillNeedYou_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_StillNeedYou_15_00");	//�� ����� ���.
	AI_Output(self,other,"DIA_MiltenNW_StillNeedYou_03_01");	//���� ������� ������ ��� �����. ������, �� �� ����� ������ �������!
	AI_Output(self,other,"DIA_MiltenNW_StillNeedYou_03_02");	//� ����������� � ����. ���������� ���.
	self.flags = NPC_FLAG_IMMORTAL;
	MiltenNW_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	AI_StopProcessInfos(self);
};


instance DIA_MiltenNW_Teach(C_Info)
{
	npc = PC_Mage_NW;
	nr = 90;
	condition = DIA_MiltenNW_Teach_Condition;
	information = DIA_MiltenNW_Teach_Info;
	permanent = TRUE;
	description = "� ���� ������� ����� ����������.";
};


func int DIA_MiltenNW_Teach_Condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_Teach_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_Teach_15_00");	//� ���� ������� ���-����� ����������.
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2)
	{
		Info_ClearChoices(DIA_MiltenNW_Teach);
		Info_AddChoice(DIA_MiltenNW_Teach,Dialog_Back,DIA_MiltenNW_Teach_BACK);
		if(PLAYER_TALENT_RUNES[SPL_WindFist] == FALSE)
		{
			Info_AddChoice(DIA_MiltenNW_Teach,B_BuildLearnString(NAME_SPL_WINDFIST,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_WindFist)),DIA_MiltenNW_Teach_Windfist);
		};
		if(PLAYER_TALENT_RUNES[SPL_InstantFireball] == FALSE)
		{
			Info_AddChoice(DIA_MiltenNW_Teach,B_BuildLearnString(NAME_SPL_InstantFireball,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_InstantFireball)),DIA_MiltenNW_Teach_Feuerball);
		};
		if(PLAYER_TALENT_RUNES[SPL_Icebolt] == FALSE)
		{
			Info_AddChoice(DIA_MiltenNW_Teach,B_BuildLearnString(NAME_SPL_Icebolt,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Icebolt)),DIA_MiltenNW_Teach_Eispfeil);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_Teach_03_01");	//�� ��� ��� �� ������ ������� ����� �����. � ������ �� ���� ������� ����.
	};
};

func void DIA_MiltenNW_Teach_BACK()
{
	Info_ClearChoices(DIA_MiltenNW_Teach);
};

func void DIA_MiltenNW_Teach_Windfist()
{
	B_TeachPlayerTalentRunes(self,other,SPL_WindFist);
};

func void DIA_MiltenNW_Teach_Feuerball()
{
	B_TeachPlayerTalentRunes(self,other,SPL_InstantFireball);
};

func void DIA_MiltenNW_Teach_Eispfeil()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Icebolt);
};


instance DIA_MiltenNW_Mana(C_Info)
{
	npc = PC_Mage_NW;
	nr = 100;
	condition = DIA_MiltenNW_Mana_Condition;
	information = DIA_MiltenNW_Mana_Info;
	permanent = TRUE;
	description = "� ���� �������� ��� ���������� �����������.";
};


func int DIA_MiltenNW_Mana_Condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_Mana_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_Mana_15_00");	//� ���� �������� ���� ���������� �����������.
	Info_ClearChoices(DIA_MiltenNW_Mana);
	Info_AddChoice(DIA_MiltenNW_Mana,Dialog_Back,DIA_MiltenNW_Mana_BACK);
	Info_AddChoice(DIA_MiltenNW_Mana,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_MiltenNW_Mana_1);
	Info_AddChoice(DIA_MiltenNW_Mana,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_MiltenNW_Mana_5);
};

func void DIA_MiltenNW_Mana_BACK()
{
	if(other.attribute[ATR_MANA_MAX] >= T_MED)
	{
		AI_Output(self,other,"DIA_MiltenNW_Mana_03_00");	//���� ���������� ������� ������. ������� ������, ����� � ��� ��������� ��.
	};
	Info_ClearChoices(DIA_MiltenNW_Mana);
};

func void DIA_MiltenNW_Mana_1()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_MED);
	Info_ClearChoices(DIA_MiltenNW_Mana);
	Info_AddChoice(DIA_MiltenNW_Mana,Dialog_Back,DIA_MiltenNW_Mana_BACK);
	Info_AddChoice(DIA_MiltenNW_Mana,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_MiltenNW_Mana_1);
	Info_AddChoice(DIA_MiltenNW_Mana,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_MiltenNW_Mana_5);
};

func void DIA_MiltenNW_Mana_5()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_MED);
	Info_ClearChoices(DIA_MiltenNW_Mana);
	Info_AddChoice(DIA_MiltenNW_Mana,Dialog_Back,DIA_MiltenNW_Mana_BACK);
	Info_AddChoice(DIA_MiltenNW_Mana,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_MiltenNW_Mana_1);
	Info_AddChoice(DIA_MiltenNW_Mana,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_MiltenNW_Mana_5);
};


instance DIA_Mage_NW_PICKPOCKET(C_Info)
{
	npc = PC_Mage_NW;
	nr = 900;
	condition = DIA_Mage_NW_PICKPOCKET_Condition;
	information = DIA_Mage_NW_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Mage_NW_PICKPOCKET_Condition()
{
	return C_Beklauen(56,75);
};

func void DIA_Mage_NW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Mage_NW_PICKPOCKET);
	Info_AddChoice(DIA_Mage_NW_PICKPOCKET,Dialog_Back,DIA_Mage_NW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Mage_NW_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Mage_NW_PICKPOCKET_DoIt);
};

func void DIA_Mage_NW_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Mage_NW_PICKPOCKET);
};

func void DIA_Mage_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Mage_NW_PICKPOCKET);
};

