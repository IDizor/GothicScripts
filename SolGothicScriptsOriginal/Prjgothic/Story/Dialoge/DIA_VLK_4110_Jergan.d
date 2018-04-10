
instance DIA_Jergan_EXIT(C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 999;
	condition = DIA_Jergan_EXIT_Condition;
	information = DIA_Jergan_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jergan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Jergan_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Jergan_Hallo(C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 2;
	condition = DIA_Jergan_Hallo_Condition;
	information = DIA_Jergan_Hallo_Info;
	permanent = FALSE;
	description = "��� �� ����� �������?";
};


func int DIA_Jergan_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Jergan_Hallo_Info()
{
	AI_Output(other,self,"DIA_Jergan_Hallo_15_00");	//��� �� ����� �������?
	AI_Output(self,other,"DIA_Jergan_Hallo_13_01");	//� ������ �� �����. ���� ������� �������� ��������� � ��������� ��� ���������.
};


instance DIA_Jergan_Vermisste(C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 2;
	condition = DIA_Jergan_Vermisste_Condition;
	information = DIA_Jergan_Vermisste_Info;
	permanent = FALSE;
	description = "���������?";
};


func int DIA_Jergan_Vermisste_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jergan_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Jergan_Vermisste_Info()
{
	AI_Output(other,self,"DIA_Jergan_Vermisste_15_00");	//���������?
	AI_Output(self,other,"DIA_Jergan_Vermisste_13_01");	//��������� �������, ����� �� ��� ������ �������. ����������� �� ��� �� ������� ������ - ��� � �������������!
	AI_Output(self,other,"DIA_Jergan_Vermisste_13_02");	//�� ��� ��, ���� ����-�� ������� ������, � ������ �������� �� �����.
};


instance DIA_Jergan_Burg(C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 3;
	condition = DIA_Jergan_Burg_Condition;
	information = DIA_Jergan_Burg_Info;
	permanent = FALSE;
	description = "�� ������ ������ ��� ���������� � �����?";
};


func int DIA_Jergan_Burg_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jergan_Hallo) && (Npc_GetDistToWP(self,"OW_STAND_JERGAN") <= 1000))
	{
		return TRUE;
	};
};

func void DIA_Jergan_Burg_Info()
{
	AI_Output(other,self,"DIA_Jergan_Burg_15_00");	//�� ������ ������ ��� ���������� � �����?
	AI_Output(self,other,"DIA_Jergan_Burg_13_01");	//�������, �� �� ������ ������� ��� ������.
	AI_Output(self,other,"DIA_Jergan_Burg_13_02");	//���� ���� ������� ��������� �� �����, �������� � ��������� ������. ����� ���, ��� ��� ���� ����� �����, � �������.
	Log_CreateTopic(Topic_OricBruder,LOG_MISSION);
	Log_SetTopicStatus(Topic_OricBruder,LOG_Running);
	B_LogEntry(Topic_OricBruder,"����� � ���� � �����, � ������ ������� �����, ��� ��� ���� ����� � �������.");
};


instance DIA_Jergan_Gegend(C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 9;
	condition = DIA_Jergan_Gegend_Condition;
	information = DIA_Jergan_Gegend_Info;
	permanent = TRUE;
	description = "��� ��� ����� ����� �� ���� ���������?";
};


func int DIA_Jergan_Gegend_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jergan_Hallo))
	{
		return TRUE;
	};
};


var int Jergan_Tell;

func void DIA_Jergan_Gegend_Info()
{
	if(Jergan_Tell == FALSE)
	{
		AI_Output(other,self,"DIA_Jergan_Gegend_15_00");	//��� ��� ����� ����� �� ���� ���������?
		AI_Output(self,other,"DIA_Jergan_Gegend_13_01");	//���� �� ������ ������, ���� �� �����, ��� ���� ����������.
		AI_Output(self,other,"DIA_Jergan_Gegend_13_02");	//��� ����������� ����� ����� ����� � ������ ��� ��������� ������ �����. � ���� ��, ���-�� ����� ���������� �������.
	};
	AI_Output(self,other,"DIA_Jergan_Gegend_13_03");	//��� ������ �������� ����� ������. ���� �� �� �� ����������, �� �������� ��������� �� ���.
	Jergan_Tell = TRUE;
};


instance DIA_Jergan_Hilfe(C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 3;
	condition = DIA_Jergan_Hilfe_Condition;
	information = DIA_Jergan_Hilfe_Info;
	permanent = FALSE;
	description = "��� ��� ������� � �����?";
};


func int DIA_Jergan_Hilfe_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jergan_Burg) && (Npc_GetDistToWP(self,"OW_STAND_JERGAN") <= 1000))
	{
		return TRUE;
	};
};

func void DIA_Jergan_Hilfe_Info()
{
	AI_Output(other,self,"DIA_Jergan_Hilfe_15_00");	//��� ��� ������� � �����?
	AI_Output(self,other,"DIA_Jergan_Hilfe_13_01");	//������ �����, ������ � ������ ������. �� ���� �� �������� ����� � ������ �������, ��������, � ���� ����� ����.
	AI_Output(self,other,"DIA_Jergan_Hilfe_13_02");	//���� ����� ��������� �������� �� ����� � ������������ ����. ����� �����, ���� �� ������ ����� ���� �� �������.
	AI_Output(self,other,"DIA_Jergan_Hilfe_13_03");	//���� ���������� ����� �� ������. �� ������ ������� ��� - ����������� � ����� ��� ����� �����, � ����� ������ �� ���� ��� � ������.
	AI_Output(self,other,"DIA_Jergan_Hilfe_13_04");	//� ���� ����� ����������, ���� �� ���������� �����.
};


instance DIA_Jergan_Mine(C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 3;
	condition = DIA_Jergan_Mine_Condition;
	information = DIA_Jergan_Mine_Info;
	permanent = FALSE;
	description = "��� �� ������� �����?";
};


func int DIA_Jergan_Mine_Condition()
{
	if(Npc_GetDistToWP(self,"OW_NEWMINE_04") < 1000)
	{
		return TRUE;
	};
};

func void DIA_Jergan_Mine_Info()
{
	AI_Output(other,self,"DIA_Jergan_Mine_15_00");	//��� �� ������� �����?
	AI_Output(self,other,"DIA_Jergan_Mine_13_01");	//� ���������. ��� ������ - ������� �� ������. �� ��� ��� �������� ������ �� ��������� ��� �����.
	AI_Output(self,other,"DIA_Jergan_Mine_13_02");	//����, ������ ����� ����� ���������� ������� - ����, �������, �� ������, ��� �������.
};


instance DIA_Jergan_Claw(C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 3;
	condition = DIA_Jergan_Claw_Condition;
	information = DIA_Jergan_Claw_Info;
	permanent = FALSE;
	description = "�� ������ �������� ���� �����?";
};


func int DIA_Jergan_Claw_Condition()
{
	if((Npc_GetDistToWP(self,"OW_NEWMINE_04") < 1000) && Npc_KnowsInfo(other,DIA_Jergan_Mine) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jergan_Claw_Info()
{
	AI_Output(other,self,"DIA_Jergan_Claw_15_00");	//�� ������ �������� ���� �����?
	AI_Output(self,other,"DIA_Jergan_Claw_13_01");	//� ���� �������� ����, ��� �������� ����� ���� ������.
};


instance DIA_Jergan_Teach(C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 9;
	condition = DIA_Jergan_Teach_Condition;
	information = DIA_Jergan_Teach_Info;
	permanent = TRUE;
	description = "(������� �������� ������)";
};


func int DIA_Jergan_Teach_Condition()
{
	if((Npc_GetDistToWP(self,"OW_NEWMINE_04") < 1000) && Npc_KnowsInfo(other,DIA_Jergan_Claw) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jergan_Teach_Info()
{
	AI_Output(other,self,"DIA_Jergan_Teach_15_00");	//������ ���, ��� �������� �����.
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Claws))
	{
		AI_Output(self,other,"DIA_Jergan_Teach_13_01");	//����� ����� �������� ����� ������ � ������ ������. ��� ������ ����������, ����� �� ��������� ������.
		AI_Output(self,other,"DIA_Jergan_Teach_13_02");	//����� ������� �� ������ �������� �� ������ ����� ���������, �� ����� ������ � ����������.
	};
};


instance DIA_Jergan_Diego(C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 9;
	condition = DIA_Jergan_Diego_Condition;
	information = DIA_Jergan_Diego_Info;
	permanent = FALSE;
	description = "�� ������, ���� ���������� �����? ";
};


func int DIA_Jergan_Diego_Condition()
{
	if((Npc_GetDistToWP(self,"OW_NEWMINE_04") < 1000) && (Npc_KnowsInfo(other,DIA_DiegoOw_Hallo) == FALSE) && Npc_KnowsInfo(other,DIA_Parcival_Diego))
	{
		return TRUE;
	};
};

func void DIA_Jergan_Diego_Info()
{
	AI_Output(other,self,"DIA_Jergan_Diego_15_00");	//�� ������, ���� ���������� �����?
	AI_Output(self,other,"DIA_Jergan_Diego_13_01");	//�����? �� ��� ����� �� ���������� ����������. �� ����� ������.
	AI_Output(self,other,"DIA_Jergan_Diego_13_02");	//� ����� ��� � ����� �������� � ������, �������� ������.
	AI_Output(self,other,"DIA_Jergan_Diego_13_03");	//������ ������ ����� ��� ��� ������? ��� ����, � ����� �� ����������� � �����.
	AI_Output(self,other,"DIA_Jergan_Diego_13_04");	//������ ���� ����� ����� ������. ��� ���� ��� � �����.
};


instance DIA_Jergan_Leader(C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 3;
	condition = DIA_Jergan_Leader_Condition;
	information = DIA_Jergan_Leader_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Jergan_Leader_Condition()
{
	if((Npc_GetDistToWP(self,"OW_NEWMINE_04") < 1000) && Npc_IsDead(NewMine_LeadSnapper) && Npc_KnowsInfo(other,DIA_Bilgot_KNOWSLEADSNAPPER))
	{
		return TRUE;
	};
};

func void DIA_Jergan_Leader_Info()
{
	AI_Output(self,other,"DIA_Jergan_Leader_13_00");	//�� ���� ������ ����. � ��� - �� ������ ����� ����� �����?
	if(Npc_HasItems(other,ItAt_ClawLeader) >= 1)
	{
		AI_Output(other,self,"DIA_Jergan_Leader_15_01");	//��.
		AI_Output(self,other,"DIA_Jergan_Leader_13_02");	//���, ����� ����� ���������. ���� ����, ������� ��������������� ����� ����.
		AI_Output(self,other,"DIA_Jergan_Leader_13_03");	//���� �� ������� ����������� ����������, �� �������� �� ��� ����� ���� ������.
	}
	else
	{
		AI_Output(other,self,"DIA_Jergan_Leader_15_04");	//���.
		AI_Output(self,other,"DIA_Jergan_Leader_13_05");	//��� �� ���. � ������, ��� ����� ����� ���������.
	};
};


instance DIA_Jergan_PICKPOCKET(C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 900;
	condition = DIA_Jergan_PICKPOCKET_Condition;
	information = DIA_Jergan_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_100;
};


func int DIA_Jergan_PICKPOCKET_Condition()
{
	return C_Beklauen(84,110);
};

func void DIA_Jergan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Jergan_PICKPOCKET);
	Info_AddChoice(DIA_Jergan_PICKPOCKET,Dialog_Back,DIA_Jergan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Jergan_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Jergan_PICKPOCKET_DoIt);
};

func void DIA_Jergan_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Jergan_PICKPOCKET);
};

func void DIA_Jergan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Jergan_PICKPOCKET);
};

