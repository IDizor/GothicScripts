
instance DIA_1061_Wache_EXIT(C_Info)
{
	npc = BDT_1061_Wache;
	nr = 999;
	condition = DIA_1061_Wache_EXIT_Condition;
	information = DIA_1061_Wache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_1061_Wache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_1061_Wache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_1061_Wache_Hallo(C_Info)
{
	npc = BDT_1061_Wache;
	nr = 1;
	condition = DIA_1061_Wache_Hallo_Condition;
	information = DIA_1061_Wache_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_1061_Wache_Hallo_Condition()
{
	return TRUE;
};

func void DIA_1061_Wache_Hallo_Info()
{
	AI_Output(self,other,"DIA_1061_Wache_Hallo_01_00");	//����! ���� ���� ������.
	AI_Output(other,self,"DIA_1061_Wache_Hallo_15_01");	//� ���� ���������� � ����� ��������.
	AI_Output(self,other,"DIA_1061_Wache_Hallo_01_02");	//(��������) ��, �������, �� ������ ���������� � ���� ������. ��� �, ����� ������� ��, � ������� ���� ������.
	AI_Output(self,other,"DIA_1061_Wache_Hallo_01_03");	//(���������� ��������) �� ������ ���� �� �������� ��� ���. � ���� ���, ��� �������� ����� ����! ������?
	Info_ClearChoices(DIA_1061_Wache_Hallo);
	Info_AddChoice(DIA_1061_Wache_Hallo,"��.",DIA_1061_Wache_Hallo_Lee);
	if((Bdt13_Dexter_verraten == TRUE) || (Ranger_SCKnowsDexter == TRUE))
	{
		Info_AddChoice(DIA_1061_Wache_Hallo,"�������.",DIA_1061_Wache_Hallo_Dexter);
	};
	Info_AddChoice(DIA_1061_Wache_Hallo,"�����.",DIA_1061_Wache_Hallo_Diego);
	Info_AddChoice(DIA_1061_Wache_Hallo,"������� �� ����.",DIA_1061_Wache_Hallo_Ahnung);
};

func void DIA_1061_Wache_Hallo_Lee()
{
	AI_Output(other,self,"DIA_1061_Wache_Hallo_Lee_15_00");	//��.
	AI_Output(self,other,"DIA_1061_Wache_Hallo_Lee_01_01");	//��, ��� ��� �������? �� ������ ��� �������� ���� ��������, ������!
	Info_ClearChoices(DIA_1061_Wache_Hallo);
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,0);
};

func void DIA_1061_Wache_Hallo_Dexter()
{
	AI_Output(other,self,"DIA_1061_Wache_Hallo_Dexter_15_00");	//�������.
	AI_Output(self,other,"DIA_1061_Wache_Hallo_Dexter_01_01");	//��... ������, �� ������������� ������ ������ �����. ������, � ������� ���� ������. �� ������������ ����.
	AI_Output(self,other,"DIA_1061_Wache_Hallo_Dexter_01_02");	//���� �� ��������� � ����-������ ������� ������, �� �� ������� ������ �����!
	AI_Output(self,other,"DIA_1061_Wache_Hallo_Dexter_01_03");	//��� ��� ������ �������� � ����� ���� ��� � ������. �� ������� �������� � ����.
	Knows_Dexter = TRUE;
	BanditGuard.aivar[AIV_PASSGATE] = TRUE;
	Info_ClearChoices(DIA_1061_Wache_Hallo);
	AI_StopProcessInfos(self);
};

func void DIA_1061_Wache_Hallo_Diego()
{
	AI_Output(other,self,"DIA_1061_Wache_Hallo_Diego_15_00");	//�����.
	AI_Output(self,other,"DIA_1061_Wache_Hallo_Diego_01_01");	//���������!
	AI_Output(self,other,"DIA_1061_Wache_Hallo_Diego_01_02");	//���, ��� ���� �����. �� ������� �� ������, ��� ��� ����.
	AI_Output(self,other,"DIA_1061_Wache_Hallo_Diego_01_03");	//��� ��� �� ���� ������ ��������� ���� � �����.
	Info_ClearChoices(DIA_1061_Wache_Hallo);
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,0);
};

func void DIA_1061_Wache_Hallo_Ahnung()
{
	AI_Output(other,self,"DIA_1061_Wache_Hallo_Ahnung_15_00");	//������� �� ����.
	AI_Output(self,other,"DIA_1061_Wache_Hallo_Ahnung_01_01");	//����� �� ������ � ���������.
	Info_ClearChoices(DIA_1061_Wache_Hallo);
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,0);
};


instance DIA_1061_Wache_Perm(C_Info)
{
	npc = BDT_1061_Wache;
	nr = 2;
	condition = DIA_1061_Wache_Perm_Condition;
	information = DIA_1061_Wache_Perm_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_1061_Wache_Perm_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Knows_Dexter == TRUE))
	{
		return TRUE;
	};
};

func void DIA_1061_Wache_Perm_Info()
{
	AI_Output(self,other,"DIA_1061_Wache_Perm_01_00");	//�����: ����� ���� � �����, �, ����� ����, �� ������ ������ �����.
	AI_StopProcessInfos(self);
};

