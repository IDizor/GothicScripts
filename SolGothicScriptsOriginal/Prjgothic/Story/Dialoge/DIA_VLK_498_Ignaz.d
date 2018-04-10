
instance DIA_Ignaz_EXIT(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 999;
	condition = DIA_Ignaz_EXIT_Condition;
	information = DIA_Ignaz_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Ignaz_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Ignaz_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ignaz_PICKPOCKET(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 900;
	condition = DIA_Ignaz_PICKPOCKET_Condition;
	information = DIA_Ignaz_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Ignaz_PICKPOCKET_Condition()
{
	return C_Beklauen(38,50);
};

func void DIA_Ignaz_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Ignaz_PICKPOCKET);
	Info_AddChoice(DIA_Ignaz_PICKPOCKET,Dialog_Back,DIA_Ignaz_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Ignaz_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Ignaz_PICKPOCKET_DoIt);
};

func void DIA_Ignaz_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Ignaz_PICKPOCKET);
};

func void DIA_Ignaz_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Ignaz_PICKPOCKET);
};


instance DIA_Ignaz_Hallo(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 2;
	condition = DIA_Ignaz_Hallo_Condition;
	information = DIA_Ignaz_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Ignaz_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Ignaz_Hallo_Info()
{
	AI_Output(self,other,"DIA_Ignaz_Hallo_14_00");	//�� - �� �������� ��� ��� �������. ��� ����� ��������� ��� ����������� ������������.
	AI_Output(self,other,"DIA_Ignaz_Hallo_14_01");	//� ������, ��� ���� �� �������� ������� ��� ������ �� ��� �����.
	AI_Output(other,self,"DIA_Ignaz_Hallo_15_02");	//�������, ���� ���. ������� �����, � ��� �� �����������.
	AI_Output(self,other,"DIA_Ignaz_Hallo_14_03");	//� ���������� ����� ����������. ���������� ��������.
	AI_Output(self,other,"DIA_Ignaz_Hallo_14_04");	//� ��� ��������, ��� ����� ������������ ���, �� � ���� ��� ������� �� ���������� ������ ���������� �����.
};


instance DIA_Ignaz_Traenke(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 3;
	condition = DIA_Ignaz_Traenke_Condition;
	information = DIA_Ignaz_Traenke_Info;
	permanent = FALSE;
	description = "� ��� � ������ �� ��, ��� ������ ����?";
};


func int DIA_Ignaz_Traenke_Condition()
{
	if(MIS_Ignaz_Charm != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Ignaz_Traenke_Info()
{
	AI_Output(other,self,"DIA_Ignaz_Traenke_15_00");	//� ��� � ������ �� ��, ��� ������ ����?
	AI_Output(self,other,"DIA_Ignaz_Traenke_14_01");	//� ��� �� ������� ���� ��������� ������������� �����.
	AI_Output(self,other,"DIA_Ignaz_Traenke_14_02");	//� ���� ������� �������� �������� � �������� ����, � ����� ����� ���������.
};


instance DIA_Ignaz_Experiment(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 4;
	condition = DIA_Ignaz_Experiment_Condition;
	information = DIA_Ignaz_Experiment_Info;
	permanent = FALSE;
	description = "�������� ��� ��������� �� ���� ������������ � ����� ����������.";
};


func int DIA_Ignaz_Experiment_Condition()
{
	return TRUE;
};

func void DIA_Ignaz_Experiment_Info()
{
	AI_Output(other,self,"DIA_Ignaz_Experiment_15_00");	//�������� ��� ��������� �� ���� ������������ � ����� ����������.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_01");	//��� ���������� ��������� ��������� ����-������ ������ ��������� �������.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_02");	//����, � ������� ������, ��� ��� ��������, ����� ������ ����� ���������� ��������� � ������ - ��������, ���� �� ������ ��� ��� ���� � ��� ��� ��������.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_03");	//� ���� �������� �� ��, ��� ��� ������������ ��������� � ��� ������ ���, �� ��� �������.
	AI_Output(other,self,"DIA_Ignaz_Experiment_15_04");	//�� ����, � ������ ����� ����-������ � ��� � �������� �� ���� ��� ����������?
	AI_Output(other,self,"DIA_Ignaz_Add_15_00");	//��� ����� �����, ������ ���� ������ ������������� ����� ��� ����� �����.
	AI_Output(other,self,"DIA_Ignaz_Add_15_01");	//(���� ��� ���) �����, � �������� ��������, ���� �������� � ������. ��� ����� �������� ������ ���-������ � ������ �����...
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_05");	//��, �� ��� ��������� ���������. �� ����� ��������� ����-������, ���������� ������ ��������� - ����� ��� ������������� ������� ��� � ���.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_06");	//������ �� ������ ��������� ��� ��� ��� ���������� - ���� ���������� ����� ���������� ������ ����, � ���� ����������� ��������� �������� � ������ �����.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_07");	//����� �� ����� ������ �������� ��� ���������� �� ����, ��� ������� ����. ����� ���������� ������.
};


instance DIA_Ignaz_teilnehmen(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 5;
	condition = DIA_Ignaz_teilnehmen_Condition;
	information = DIA_Ignaz_teilnehmen_Info;
	permanent = FALSE;
	description = "������, � ������� ��� ����������.";
};


func int DIA_Ignaz_teilnehmen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Ignaz_Experiment))
	{
		return TRUE;
	};
};

func void DIA_Ignaz_teilnehmen_Info()
{
	AI_Output(other,self,"DIA_Ignaz_teilnehmen_15_00");	//������, � ������� ��� ����������.
	AI_Output(self,other,"DIA_Ignaz_teilnehmen_14_01");	//����� ������ ���� ������ � ����� ����������� ����������� �������.
	AI_Output(self,other,"DIA_Ignaz_teilnehmen_14_02");	//� ����� ���������, ����������� � �������� ��� ��� ��� ������.
	B_GiveInvItems(self,other,ItSc_Charm,1);
	MIS_Ignaz_Charm = LOG_Running;
	Log_CreateTopic(TOPIC_Ignaz,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Ignaz,LOG_Running);
	B_LogEntry(TOPIC_Ignaz,"� ������ �������� ����� ���������� ������. ��� ���������� ���������� ��������. ������ ���-������ ������� �� ���� � ���������� ����� ��� �� ������ ������� � ������ �� ����� �������� �� ����. ��� ��������� ������ ��� ������������� ����� ����������.");
	B_LogEntry(TOPIC_Ignaz,"��� ��������� ����������� �������� ����������. ���������� ����� ������� �������� � ������������ �������. � �� �����, ��� ���-���� � �������� �������� ������ ��������, ���� � ������� ���.");
	AI_StopProcessInfos(self);
};


instance DIA_Ignaz_Running(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 2;
	condition = DIA_Ignaz_Running_Condition;
	information = DIA_Ignaz_Running_Info;
	permanent = FALSE;
	description = "������ ������������...";
};


func int DIA_Ignaz_Running_Condition()
{
	if((MIS_Ignaz_Charm == LOG_Running) && (Charm_Test == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ignaz_Running_Info()
{
	AI_Output(other,self,"DIA_Ignaz_Running_15_00");	//������ ������������...
	AI_Output(self,other,"DIA_Ignaz_Running_14_01");	//� ���� ����������, ��? ��� �� ������ ������� �������� ��� ������?
	AI_Output(self,other,"DIA_Ignaz_Running_14_02");	//���� ���� ����� ��� ������ � ���� �����������, �� ������ ������ �� � ����.
};


instance DIA_Ignaz_Danach(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 6;
	condition = DIA_Ignaz_Danach_Condition;
	information = DIA_Ignaz_Danach_Info;
	permanent = FALSE;
	description = "� ����������� ������.";
};


func int DIA_Ignaz_Danach_Condition()
{
	if((Charm_Test == TRUE) && (MIS_Ignaz_Charm == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Ignaz_Danach_Info()
{
	AI_Output(other,self,"DIA_Ignaz_Danach_15_00");	//� ����������� ������.
	AI_Output(self,other,"DIA_Ignaz_Danach_14_01");	//�������, �������. � ���� ��� ����������?
	AI_Output(other,self,"DIA_Ignaz_Danach_15_02");	//��, ���������� ���������.
	AI_Output(self,other,"DIA_Ignaz_Danach_14_03");	//�����������. �����, � ����� ������ ����� ��� � �� ����� ������� ����������, �� ��� ���� ��� ����� ����� ������!
	AI_Output(self,other,"DIA_Ignaz_Danach_14_04");	//������ � ���� ������� ���� ����� � ������� ���� ��������� �������.
	AI_Output(self,other,"DIA_Ignaz_Danach_14_05");	//� ����� ���� ������� ���� ���-������ ��������, ���� ��, �������, ������ �����.
	Ignaz_TeachAlchemy = TRUE;
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_CityTeacher,"����� ����� �������� ��� ������� ������������� �����. �� ����� � �������� ��������.");
	MIS_Ignaz_Charm = LOG_SUCCESS;
	B_GivePlayerXP(XP_MIS_Ignaz_Charm);
	CreateInvItems(self,ItSc_Charm,3);
};


instance DIA_Ignaz_Trade(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 6;
	condition = DIA_Ignaz_Trade_Condition;
	information = DIA_Ignaz_Trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "������ ��� ���� ������.";
};


func int DIA_Ignaz_Trade_Condition()
{
	if((MIS_Ignaz_Charm == LOG_SUCCESS) || Npc_KnowsInfo(other,DIA_Ignaz_Running))
	{
		return TRUE;
	};
};

func void DIA_Ignaz_Trade_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other,self,"DIA_Ignaz_Trade_15_00");	//������ ��� ���� ������.
};


instance DIA_Ignaz_Teach(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 2;
	condition = DIA_Ignaz_Teach_Condition;
	information = DIA_Ignaz_Teach_Info;
	permanent = TRUE;
	description = "����� ���� ��������� �������.";
};


var int DIA_Ignaz_Teach_permanent;

func int DIA_Ignaz_Teach_Condition()
{
	if((DIA_Ignaz_Teach_permanent == FALSE) && (Ignaz_TeachAlchemy == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Ignaz_Teach_Info()
{
	var int talente;
	talente = 0;
	AI_Output(other,self,"DIA_Ignaz_Teach_15_00");	//����� ���� ��������� �������.
	if((PLAYER_TALENT_ALCHEMY[POTION_Speed] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE))
	{
		Info_ClearChoices(DIA_Ignaz_Teach);
		Info_AddChoice(DIA_Ignaz_Teach,Dialog_Back,DIA_Ignaz_Teach_BACK);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Speed] == FALSE)
	{
		Info_AddChoice(DIA_Ignaz_Teach,B_BuildLearnString("����� ���������",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Speed)),DIA_Ignaz_Teach_Speed);
		talente = talente + 1;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice(DIA_Ignaz_Teach,B_BuildLearnString("�������� ����",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_01)),DIA_Ignaz_Teach_Mana);
		talente = talente + 1;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice(DIA_Ignaz_Teach,B_BuildLearnString("�������� ��������",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_01)),DIA_Ignaz_Teach_Health);
		talente = talente + 1;
	};
	if(talente > 0)
	{
		if(Alchemy_Explain != TRUE)
		{
			AI_Output(self,other,"DIA_Ignaz_Teach_14_01");	//����� ����������� ����� �� ������������ �����, ���� ����������� ������������ ��������.
			AI_Output(self,other,"DIA_Ignaz_Teach_14_02");	//����� ���� ����������� ��������� �������� � ������ �����������.
			Alchemy_Explain = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Ignaz_Teach_14_04");	//��� �� ������ ������?
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Ignaz_Teach_14_05");	//�� ��� ������ ���, ���� � ��� ������� ����.
		DIA_Ignaz_Teach_permanent = TRUE;
	};
};

func void DIA_Ignaz_Teach_Health()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_01);
	Info_ClearChoices(DIA_Ignaz_Teach);
};

func void DIA_Ignaz_Teach_Mana()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_01);
	Info_ClearChoices(DIA_Ignaz_Teach);
};

func void DIA_Ignaz_Teach_Speed()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Speed);
	Info_ClearChoices(DIA_Ignaz_Teach);
};

func void DIA_Ignaz_Teach_BACK()
{
	Info_ClearChoices(DIA_Ignaz_Teach);
};

