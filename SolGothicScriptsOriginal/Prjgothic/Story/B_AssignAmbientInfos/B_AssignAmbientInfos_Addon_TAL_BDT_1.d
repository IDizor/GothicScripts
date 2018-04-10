
instance DIA_Addon_TAL_BDT_1_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_Addon_TAL_BDT_1_EXIT_Condition;
	information = DIA_Addon_TAL_BDT_1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_TAL_BDT_1_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_TAL_BDT_1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_TAL_BDT_1_Hi(C_Info)
{
	nr = 2;
	condition = DIA_Addon_TAL_BDT_1_Hi_Condition;
	information = DIA_Addon_TAL_BDT_1_Hi_Info;
	permanent = TRUE;
	description = "��� ����?";
};


func int DIA_Addon_TAL_BDT_1_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_TAL_BDT_1_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_TAL_BDT_1_Hi_15_00");	//��� ����?
	AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Hi_01_01");	//� ���, ���� ��� �� �� ����������� ���-������ ����� � �� ������ ��� �������.
	if(!Npc_IsDead(Franco))
	{
		AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Hi_01_02");	//�� ���� �����, ��� �������, ������ ������ ��� ����� ����.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Hi_01_03");	//� ������ ������ �����, �, ����� ����, � ���� �������� ����.
	};
};


instance DIA_Addon_TAL_BDT_1_Lager(C_Info)
{
	nr = 3;
	condition = DIA_Addon_TAL_BDT_1_Lager_Condition;
	information = DIA_Addon_TAL_BDT_1_Lager_Info;
	permanent = TRUE;
	description = "������ ���������� ��� ���-������ � ������.";
};


func int DIA_Addon_TAL_BDT_1_Lager_Condition()
{
	return TRUE;
};

func void DIA_Addon_TAL_BDT_1_Lager_Info()
{
	AI_Output(other,self,"DIA_Addon_TAL_BDT_1_Lager_15_00");	//������ ���������� ��� ���-������ � ������.
	AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Lager_01_01");	//������, � ��� ������������! ���� �� ������� ������� ��� �������, ��� ��� ����� ������ ���������� �� ����!
	AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Lager_01_02");	//����������� �� ��� �������� ������� � ����� ������ � ��������� ����������� ������ �� �������.
};


instance DIA_Addon_TAL_BDT_1_Raven(C_Info)
{
	nr = 4;
	condition = DIA_Addon_TAL_BDT_1_Raven_Condition;
	information = DIA_Addon_TAL_BDT_1_Raven_Info;
	permanent = TRUE;
	description = "��� ���� �������� ��� ������?";
};


func int DIA_Addon_TAL_BDT_1_Raven_Condition()
{
	return TRUE;
};

func void DIA_Addon_TAL_BDT_1_Raven_Info()
{
	AI_Output(other,self,"DIA_Addon_TAL_BDT_1_Raven_15_00");	//��� ���� �������� ��� ������?
	AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Raven_01_01");	//���� ������� ������ �������� ����� �� ������ ��������.
	AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Raven_01_02");	//�� - �������� ������. � ���� ������� �� ��������� ������ ����.
	AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Raven_01_03");	//������� �� ������������� ���� ����� ������, ������ ��� �� ������ ���� ������ �� ����� �� �����.
};

func void B_AssignAmbientInfos_Addon_TAL_BDT_1(var C_Npc slf)
{
	DIA_Addon_TAL_BDT_1_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_TAL_BDT_1_Hi.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_TAL_BDT_1_Lager.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_TAL_BDT_1_Raven.npc = Hlp_GetInstanceID(slf);
};

