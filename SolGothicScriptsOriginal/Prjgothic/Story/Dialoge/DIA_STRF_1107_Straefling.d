
instance DIA_STRF_1107_EXIT(C_Info)
{
	npc = STRF_1107_Straefling;
	nr = 999;
	condition = DIA_STRF_1107_EXIT_Condition;
	information = DIA_STRF_1107_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_STRF_1107_EXIT_Condition()
{
	return TRUE;
};

func void DIA_STRF_1107_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_STRF_1107_FINGER(C_Info)
{
	npc = STRF_1107_Straefling;
	condition = DIA_STRF_1107_FINGER_Condition;
	information = DIA_STRF_1107_FINGER_Info;
	important = TRUE;
};


func int DIA_STRF_1107_FINGER_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_STRF_1107_FINGER_Info()
{
	AI_Output(self,other,"DIA_STRF_1107_FINGER_01_00");	//���� ����� �� ���� �������! ������ �� ��������� �������������� � ���� �������, �������?!
	AI_Output(self,other,"DIA_STRF_1107_FINGER_01_01");	//� ������� �� ����, � ��� ��������, ��� ����� ������ �� ����� � ��� ����! �������, � ������� ���������!
};


instance DIA_STRF_1107_COOK(C_Info)
{
	npc = STRF_1107_Straefling;
	condition = DIA_STRF_1107_COOK_Condition;
	information = DIA_STRF_1107_COOK_Info;
	description = "��� �������� ���� �������?";
};


func int DIA_STRF_1107_COOK_Condition()
{
	if(Npc_KnowsInfo(hero,dia_strf_1107_finger))
	{
		return TRUE;
	};
};

func void DIA_STRF_1107_COOK_Info()
{
	AI_Output(other,self,"DIA_STRF_1107_COOK_15_00");	//��� �������� ���� �������?
	AI_Output(self,other,"DIA_STRF_1107_COOK_01_01");	//����������� ������. �� ����, ��� � ���� �����������, � ��� ������� � '�������� ������'.
	AI_Output(other,self,"DIA_STRF_1107_COOK_15_02");	//� �� ��� ���� ��������?
	AI_Output(self,other,"DIA_STRF_1107_COOK_01_03");	//��, ����� ����� �� �����������, ����������, � ���� ��������� �������������.
};


instance DIA_STRF_1107_PERM(C_Info)
{
	npc = STRF_1107_Straefling;
	nr = 900;
	condition = DIA_STRF_1107_PERM_Condition;
	information = DIA_STRF_1107_PERM_Info;
	permanent = TRUE;
	description = "���� ���-������ ���������?";
};


func int DIA_STRF_1107_PERM_Condition()
{
	if(Npc_KnowsInfo(hero,dia_strf_1107_finger))
	{
		return TRUE;
	};
};

func void DIA_STRF_1107_PERM_Info()
{
	AI_Output(other,self,"DIA_STRF_1107_PERM_15_00");	//���� �����-������ �������?
	AI_Output(self,other,"DIA_STRF_1107_PERM_01_01");	//���� �� ������ ������ �������, ������ � �������. � � ����� ���� ������� �����-�����������.
};

