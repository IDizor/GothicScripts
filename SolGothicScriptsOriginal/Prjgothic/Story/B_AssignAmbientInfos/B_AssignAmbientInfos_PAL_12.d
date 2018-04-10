
instance DIA_PAL_12_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_PAL_12_EXIT_Condition;
	information = DIA_PAL_12_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_PAL_12_EXIT_Condition()
{
	return TRUE;
};

func void DIA_PAL_12_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_12_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_PAL_12_JOIN_Condition;
	information = DIA_PAL_12_JOIN_Info;
	permanent = TRUE;
	description = "� ���� ����� ���������!";
};


func int DIA_PAL_12_JOIN_Condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_PAL_12_JOIN_Info()
{
	AI_Output(other,self,"DIA_PAL_12_JOIN_15_00");	//� ���� ����� ���������!
	AI_Output(self,other,"DIA_PAL_12_JOIN_12_01");	//��? �� ����� ����! �� �� ���� �� ������� � ��������� ������.
	AI_Output(self,other,"DIA_PAL_12_JOIN_12_02");	//���� �� � �� �����, ��� ������ ���� ������ ����� �����������, � �� �������, ��� �� ����������� ���� ����.
	AI_Output(self,other,"DIA_PAL_12_JOIN_12_03");	//������ ������ �� ������, ����� ��������� ������������� ������ � ������ ������� ������ ����� ���� ������� � ��������.
};


instance DIA_PAL_12_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_PAL_12_PEOPLE_Condition;
	information = DIA_PAL_12_PEOPLE_Info;
	permanent = TRUE;
	description = "��� ��������� �����?";
};


func int DIA_PAL_12_PEOPLE_Condition()
{
	if(other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void DIA_PAL_12_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_PAL_12_PEOPLE_15_00");	//��� ��������� �����?
	AI_Output(self,other,"DIA_PAL_12_PEOPLE_12_01");	//�������������� ���� �����. �� ���� ����� �������� �� ��� ����, ���������� �������� ������.
	AI_Output(self,other,"DIA_PAL_12_PEOPLE_12_02");	//�� ������� ��� � ��������. �����, ���� �������, � �� ������ ���� ��������� ����� ������ ������������ �������.
};


instance DIA_PAL_12_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_PAL_12_LOCATION_Condition;
	information = DIA_PAL_12_LOCATION_Info;
	permanent = TRUE;
	description = "��� ��, ��������, ������� �����, � ��������?";
};


func int DIA_PAL_12_LOCATION_Condition()
{
	if(Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_PAL_12_LOCATION_Info()
{
	AI_Output(other,self,"DIA_PAL_12_LOCATION_15_00");	//��� ��, ��������, ������� �����, � ��������?
	AI_Output(self,other,"DIA_PAL_12_LOCATION_12_01");	//����, �������� ����� �������, ������� ���� ����� �� �������� ��� �� ����, ��� ������ ���.
	AI_Output(self,other,"DIA_PAL_12_LOCATION_12_02");	//������������, ��� ���� ����� �� ����� ���� ���������, ��� ���������, ����� ���������� � ����� ������� ������ � ���� �������.
	AI_Output(self,other,"DIA_PAL_12_LOCATION_12_03");	//��� ��� ����� ����� �� ������ ���������.
};


instance DIA_PAL_12_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_PAL_12_STANDARD_Condition;
	information = DIA_PAL_12_STANDARD_Info;
	permanent = TRUE;
	description = "��� ����?";
};


func int DIA_PAL_12_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_PAL_12_STANDARD_Info()
{
	AI_Output(other,self,"DIA_PAL_12_STANDARD_15_00");	//��� ����?
	if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
	{
		if(Kapitel <= 4)
		{
			if(MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_PAL_12_STANDARD_12_01");	//������, ����� �� �����, ��� ����� ���� � ���������, ��� ����������� ��������� ������ ���-�� ����������.
			}
			else
			{
				AI_Output(self,other,"DIA_PAL_12_STANDARD_12_02");	//� ��� ��� ��� ��� ������� �������� �� ������ ������ � ������ ��������. ��� ��������� ����.
			};
		};
		if(Kapitel >= 5)
		{
			AI_Output(self,other,"DIA_PAL_12_STANDARD_12_03");	//����� ������! ������� ������ �� �������� ���. ������, ��� �������� ������ ����������� � ������, ����� ������ �������� �������� ����.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_12_STANDARD_12_04");	//�� ���, ������������� �������������, ��� � ������ �� ���� ������, �����?!
	};
};

func void B_AssignAmbientInfos_PAL_12(var C_Npc slf)
{
	dia_pal_12_exit.npc = Hlp_GetInstanceID(slf);
	dia_pal_12_join.npc = Hlp_GetInstanceID(slf);
	dia_pal_12_people.npc = Hlp_GetInstanceID(slf);
	dia_pal_12_location.npc = Hlp_GetInstanceID(slf);
	dia_pal_12_standard.npc = Hlp_GetInstanceID(slf);
};

