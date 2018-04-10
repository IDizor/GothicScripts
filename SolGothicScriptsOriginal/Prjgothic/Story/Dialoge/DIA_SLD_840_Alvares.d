
instance DIA_Alvares_EXIT(C_Info)
{
	npc = SLD_840_Alvares;
	nr = 999;
	condition = DIA_Alvares_EXIT_Condition;
	information = DIA_Alvares_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Alvares_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Alvares_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Alvares_HAUAB(C_Info)
{
	npc = SLD_840_Alvares;
	nr = 4;
	condition = DIA_Alvares_HAUAB_Condition;
	information = DIA_Alvares_HAUAB_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Alvares_HAUAB_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Alvares_HAUAB_Info()
{
	Akils_SLDStillthere = TRUE;
	AI_Output(self,other,"DIA_Alvares_HAUAB_11_00");	//��� �� �� ������� ���� ���� - ���� ����� ������ �� ���� � �������� ��������.
	Log_CreateTopic(TOPIC_AkilsSLDStillthere,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AkilsSLDStillthere,LOG_Running);
	B_LogEntry(TOPIC_AkilsSLDStillthere,"������� ����� �������� ��������.");
	AI_StopProcessInfos(self);
};


instance DIA_Alvares_ATTACK(C_Info)
{
	npc = SLD_840_Alvares;
	nr = 6;
	condition = DIA_Alvares_ATTACK_Condition;
	information = DIA_Alvares_ATTACK_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Alvares_ATTACK_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Alvares_HAUAB) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Alvares_ATTACK_Info()
{
	AI_Output(self,other,"DIA_Alvares_ATTACK_11_00");	//��, �� ��� ��� �����. � ��� ���� �����, �����: ���������� ��� ����!
	Info_ClearChoices(DIA_Alvares_ATTACK);
	Info_AddChoice(DIA_Alvares_ATTACK,"��� �� �����, ����� - ���� �������?",DIA_Alvares_ATTACK_Kerle);
	Info_AddChoice(DIA_Alvares_ATTACK,"� ���� �������������� � ���, ���������.",DIA_Alvares_ATTACK_Soeldner);
	Info_AddChoice(DIA_Alvares_ATTACK,"��, �����, ������ ��������� ������ ...",DIA_Alvares_ATTACK_Witz);
	Info_AddChoice(DIA_Alvares_ATTACK,"��� �� ����� ��������.",DIA_Alvares_ATTACK_Aerger);
	if(MIS_Baltram_ScoutAkil == LOG_Running)
	{
		Info_AddChoice(DIA_Alvares_ATTACK,"� ������ ������ ���� �� �������.",DIA_Alvares_ATTACK_Lieferung);
	};
};

func void DIA_Alvares_ATTACK_Witz()
{
	AI_Output(other,self,"DIA_Alvares_ATTACK_Witz_15_00");	//��, �����, ������ ��������� ������. ��� �������?
	AI_Output(self,other,"DIA_Alvares_ATTACK_Witz_11_01");	//������-��, ����� ����� ����������� - � ����� ������ �����.
	AI_Output(self,other,"DIA_Alvares_ATTACK_Witz_11_02");	//�� ������, � ��� � �����?
	AI_Output(other,self,"DIA_Alvares_ATTACK_Witz_15_03");	//�� ���� ����� ����, � ��� �� �������?
	AI_Output(self,other,"DIA_Alvares_ATTACK_Witz_11_04");	//� �����, ��� ������� ����� - ��� ������� �����. ��� ��� ������ ��� ��������� - ���� ��������!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
};

func void DIA_Alvares_ATTACK_Kerle()
{
	AI_Output(other,self,"DIA_Alvares_ATTACK_Kerle_15_00");	//��� �� �����, ����� - ���� �������?
	AI_Output(self,other,"DIA_Alvares_ATTACK_Kerle_11_01");	//�� ��������� �����. � � ���� ���������� ��������, ����� ���� ���� ����� ������ � �������� ����.
	AI_Output(self,other,"DIA_Alvares_ATTACK_Kerle_11_02");	//(�����) �������, ����� ��������! �� ������ �� ���� ������� - � � ��������� � ���� �������!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
};

func void DIA_Alvares_ATTACK_Aerger()
{
	AI_Output(other,self,"DIA_Alvares_ATTACK_Aerger_15_00");	//��� �� ����� ��������.
	AI_Output(self,other,"DIA_Alvares_ATTACK_Aerger_11_01");	//� �� ��� ��� ���� ��������. �� ��������� ������ ����, ����� ����� ��.
	AI_Output(self,other,"DIA_Alvares_ATTACK_Aerger_11_02");	//��, �� ���������� ������� ����� ���� �������. � ����� � � ����, ���� �� ������ �� �� ������� ������.
	AI_StopProcessInfos(self);
};

func void DIA_Alvares_ATTACK_Lieferung()
{
	AI_Output(other,self,"DIA_Alvares_ATTACK_Lieferung_15_00");	//� ������ ������ ���� �� �������.
	AI_Output(self,other,"DIA_Alvares_ATTACK_Lieferung_11_01");	//� �� ����. �� �� ���� ����� �������. ��� ��� ����������, ���� � �� ������ ���� ������.
	AI_StopProcessInfos(self);
};

func void DIA_Alvares_ATTACK_Soeldner()
{
	AI_Output(other,self,"DIA_Alvares_ATTACK_Soeldner_15_00");	//� ���� �������������� � ���, ���������.
	AI_Output(self,other,"DIA_Alvares_ATTACK_Soeldner_11_01");	//��, ������? ����� ���������� - ��� �� ��� ������� �� ������� �� � ���� ��������������.
	AI_StopProcessInfos(self);
};


instance DIA_Alvares_Schluss(C_Info)
{
	npc = SLD_840_Alvares;
	nr = 4;
	condition = DIA_Alvares_Schluss_Condition;
	information = DIA_Alvares_Schluss_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Alvares_Schluss_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && Npc_KnowsInfo(other,DIA_Alvares_ATTACK))
	{
		return TRUE;
	};
};

func void DIA_Alvares_Schluss_Info()
{
	AI_Output(self,other,"DIA_Alvares_Schluss_11_00");	//� ��� ���� ����. ��, ������, �� �� ��������������� � �������� ������.
	AI_Output(self,other,"DIA_Alvares_Schluss_11_01");	//������ - ������, ��� �������� ����� ����. (�����) �������, �����, ��������� ��!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
};


instance DIA_Alvares_PICKPOCKET(C_Info)
{
	npc = SLD_840_Alvares;
	nr = 900;
	condition = DIA_Alvares_PICKPOCKET_Condition;
	information = DIA_Alvares_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Alvares_PICKPOCKET_Condition()
{
	return C_Beklauen(20,15);
};

func void DIA_Alvares_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Alvares_PICKPOCKET);
	Info_AddChoice(DIA_Alvares_PICKPOCKET,Dialog_Back,DIA_Alvares_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Alvares_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Alvares_PICKPOCKET_DoIt);
};

func void DIA_Alvares_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Alvares_PICKPOCKET);
};

func void DIA_Alvares_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Alvares_PICKPOCKET);
};

