
instance DIA_PAL_298_EXIT(C_Info)
{
	npc = PAL_298_Ritter;
	nr = 999;
	condition = DIA_PAL_298_EXIT_Condition;
	information = DIA_PAL_298_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_PAL_298_EXIT_Condition()
{
	return TRUE;
};

func void DIA_PAL_298_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_298_Pass(C_Info)
{
	npc = PAL_298_Ritter;
	nr = 2;
	condition = DIA_PAL_298_Pass_Condition;
	information = DIA_PAL_298_Pass_Info;
	permanent = FALSE;
	description = "���� ����� ��� ������?";
};


func int DIA_PAL_298_Pass_Condition()
{
	if(Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_PAL_298_Pass_Info()
{
	AI_Output(other,self,"DIA_PAL_298_Pass_15_00");	//���� ����� ��� ������?
	AI_Output(self,other,"DIA_PAL_298_Pass_09_01");	//�� ����� �������� ����� ������ � ������ ��������.
	AI_Output(self,other,"DIA_PAL_298_Pass_09_02");	//�� ���� ������� ��, � �� ������ ����.
	AI_Output(self,other,"DIA_PAL_298_Pass_09_03");	//����� �� ���� ��������� ����� - �� �� ������� ��������� ����.
};


instance DIA_PAL_298_TRESPASS(C_Info)
{
	npc = PAL_298_Ritter;
	nr = 2;
	condition = DIA_PAL_298_TRESPASS_Condition;
	information = DIA_PAL_298_TRESPASS_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_PAL_298_TRESPASS_Condition()
{
	if(MIS_OLDWORLD == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_PAL_298_TRESPASS_Info()
{
	AI_Output(self,other,"DIA_PAL_298_TRESPASS_09_00");	//�� ������, ��� ������ ����� ����? �����, ������ �� �� ������ - ��� ����.
	AI_Output(other,self,"DIA_PAL_298_TRESPASS_15_01");	//���� ���� ���� � ������ ��������, � ����� ���.
	AI_Output(self,other,"DIA_PAL_298_TRESPASS_09_02");	//������, ����� ���. ��� � �������.
};


instance DIA_PAL_298_Perm1(C_Info)
{
	npc = PAL_298_Ritter;
	nr = 3;
	condition = DIA_PAL_298_Perm1_Condition;
	information = DIA_PAL_298_Perm1_Info;
	permanent = TRUE;
	description = "� ��� ���� � ��� �� �����, �� ���� ����� � ����?";
};


func int DIA_PAL_298_Perm1_Condition()
{
	if((Kapitel == 1) && Npc_KnowsInfo(other,DIA_PAL_298_Pass))
	{
		return TRUE;
	};
};

func void DIA_PAL_298_Perm1_Info()
{
	AI_Output(other,self,"DIA_PAL_298_Perm1_15_00");	//� ��� ���� � ��� �� �����, �� ���� ����� � ����?
	AI_Output(self,other,"DIA_PAL_298_Perm1_09_01");	//����� �� ���������. ��� ������ �� �����. ����� � ���� �� ��������� ����� ��������� ����.
};


instance DIA_PAL_298_Perm2(C_Info)
{
	npc = PAL_298_Ritter;
	nr = 3;
	condition = DIA_PAL_298_Perm2_Condition;
	information = DIA_PAL_298_Perm2_Info;
	permanent = TRUE;
	description = "��� ��������?";
};


func int DIA_PAL_298_Perm2_Condition()
{
	if(Kapitel >= 2)
	{
		return TRUE;
	};
};

func void DIA_PAL_298_Perm2_Info()
{
	AI_Output(other,self,"DIA_PAL_298_Perm2_15_00");	//��� ����������?
	AI_Output(self,other,"DIA_PAL_298_Perm2_09_01");	//��� ��������. �� ������ �������� ��� ���������.
};

