
instance DIA_VLK_17_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_VLK_17_EXIT_Condition;
	information = DIA_VLK_17_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_VLK_17_EXIT_Condition()
{
	return TRUE;
};

func void DIA_VLK_17_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VLK_17_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_VLK_17_JOIN_Condition;
	information = DIA_VLK_17_JOIN_Info;
	permanent = TRUE;
	description = "��� ����� ��� ����, ����� ����� ����������� ����� ������?";
};


func int DIA_VLK_17_JOIN_Condition()
{
	if((hero.guild == GIL_NONE) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_VLK_17_JOIN_Info()
{
	AI_Output(other,self,"DIA_VLK_17_JOIN_15_00");	//��� ����� ��� ����, ����� ����� ����������� ����� ������?
	AI_Output(self,other,"DIA_VLK_17_JOIN_17_01");	//�������-������������ �� ������ ����� ������ ����� ����� ������� ������� �����, � ��������. ���� ����� ���������� � ����� �� ���.
};


instance DIA_VLK_17_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_VLK_17_PEOPLE_Condition;
	information = DIA_VLK_17_PEOPLE_Info;
	permanent = TRUE;
	description = "� ��� ����� ���������� ������� � ���� ������?";
};


func int DIA_VLK_17_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_VLK_17_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_VLK_17_PEOPLE_15_00");	//� ��� ����� ���������� ������� � ���� ������?
	AI_Output(self,other,"DIA_VLK_17_PEOPLE_17_01");	//� ��� ���, ��� � ����� ������ ��������, ��� ����� � ���� ���� ��� ������.
	AI_Output(self,other,"DIA_VLK_17_PEOPLE_17_02");	//���� ����� ������������ �����. �� ������� ��� � ��������.
	AI_Output(self,other,"DIA_VLK_17_PEOPLE_17_03");	//�� ���� ����� ���� � ����, ������ ���� �� ������� ����� ��� ������ �������� � ���������.
};


instance DIA_VLK_17_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_VLK_17_LOCATION_Condition;
	information = DIA_VLK_17_LOCATION_Info;
	permanent = TRUE;
	description = "� �������� ���� ���������� �����?";
};


func int DIA_VLK_17_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_VLK_17_LOCATION_Info()
{
	AI_Output(other,self,"DIA_VLK_17_LOCATION_15_00");	//� �������� ���� ���������� �����?
	AI_Output(self,other,"DIA_VLK_17_LOCATION_17_01");	//(�������) ��������, ���� ����� �������� �� ���� ������. ���� ���� ����� �����������, ������� ������� � �����.
	AI_Output(self,other,"DIA_VLK_17_LOCATION_17_02");	//�� ���� �� ������ ���-������ ������, ��� �� �������� ������� � ��������� �����, ��� � ������ ����� ������.
};


instance DIA_VLK_17_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_VLK_17_STANDARD_Condition;
	information = DIA_VLK_17_STANDARD_Info;
	permanent = TRUE;
	description = "��� ������?";
};


func int DIA_VLK_17_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_VLK_17_STANDARD_Info()
{
	AI_Output(other,self,"DIA_VLK_17_STANDARD_15_00");	//��� ����������?
	if((Kapitel == 1) || (Kapitel == 2))
	{
		AI_Output(self,other,"DIA_VLK_17_STANDARD_17_01");	//���������, ����� ���� ������� ��������? ��� ������ ��������� ������, ������� � ������, �� ���� �� ������� ������ ������ ������.
		AI_Output(self,other,"DIA_VLK_17_STANDARD_17_02");	//���� �� ��� ������� ���� �������� ��� �� ����� ��� ��������, ��� �� ������-����� ������������ � ����. ������ ����, � ��� �����-�� ������ �������...
	};
	if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_VLK_17_STANDARD_17_03");	//� ������ ��� ������, ��� ������ ����� ��������. ��� ��� ��-�� ����. �� ����� �� ��� ������ ����� �������� �����.
	};
	if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_VLK_17_STANDARD_17_04");	//�������, ��� ����� � �������� �������� �������. ����� ����� ������ �������� ���-�� �����������. �� ����� �� �� ��� ��� ������ ������ ��� �� �������� ��������.
	};
	if(Kapitel == 5)
	{
		AI_Output(self,other,"DIA_VLK_17_STANDARD_17_05");	//������, ����� ��� ������� ������, �������� ������ ����������� � ���������� �������.
	};
};

func void B_AssignAmbientInfos_VLK_17(var C_Npc slf)
{
	dia_vlk_17_exit.npc = Hlp_GetInstanceID(slf);
	dia_vlk_17_join.npc = Hlp_GetInstanceID(slf);
	dia_vlk_17_people.npc = Hlp_GetInstanceID(slf);
	dia_vlk_17_location.npc = Hlp_GetInstanceID(slf);
	dia_vlk_17_standard.npc = Hlp_GetInstanceID(slf);
};

