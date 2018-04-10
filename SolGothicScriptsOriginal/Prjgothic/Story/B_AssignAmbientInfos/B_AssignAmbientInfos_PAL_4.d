
instance DIA_PAL_4_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_PAL_4_EXIT_Condition;
	information = DIA_PAL_4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_PAL_4_EXIT_Condition()
{
	return TRUE;
};

func void DIA_PAL_4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_4_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_PAL_4_JOIN_Condition;
	information = DIA_PAL_4_JOIN_Info;
	permanent = TRUE;
	description = "��� ��� ����� ���������?";
};


func int DIA_PAL_4_JOIN_Condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_PAL_4_JOIN_Info()
{
	AI_Output(other,self,"DIA_PAL_4_JOIN_15_00");	//��� ��� ����� ���������?
	AI_Output(self,other,"DIA_PAL_4_JOIN_04_01");	//���� � ���� ������������� ��������� ���������, �� ������� �� ������ ��������� � ��������� ���������.
	AI_Output(self,other,"DIA_PAL_4_JOIN_04_02");	//��� � ������� � �������� � ������ �����. �������� �������� � ���������.
	AI_Output(self,other,"DIA_PAL_4_JOIN_04_03");	//��������, ��� � ���� �������� ���� �������� ����.
};


instance DIA_PAL_4_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_PAL_4_PEOPLE_Condition;
	information = DIA_PAL_4_PEOPLE_Info;
	permanent = TRUE;
	description = "��� ��������� �����?";
};


func int DIA_PAL_4_PEOPLE_Condition()
{
	if(other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void DIA_PAL_4_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_PAL_4_PEOPLE_15_00");	//��� ��������� �����?
	AI_Output(self,other,"DIA_PAL_4_PEOPLE_04_01");	//���� ����� - ����������������� ����� �������� �� ���� �������. �� �������� ��� �����������, ���� �� ��������������� �����.
	AI_Output(self,other,"DIA_PAL_4_PEOPLE_04_02");	//�� �� ����� �����. ���� ���� ���-�� �����, ��� � ������� � �������� � ������ �����.
};


instance DIA_PAL_4_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_PAL_4_LOCATION_Condition;
	information = DIA_PAL_4_LOCATION_Info;
	permanent = TRUE;
	description = "��� ��, ��������, ������� �����, � ��������?";
};


func int DIA_PAL_4_LOCATION_Condition()
{
	if(Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_PAL_4_LOCATION_Info()
{
	AI_Output(other,self,"DIA_PAL_4_LOCATION_15_00");	//��� ��, ��������, ������� �����, � ��������?
	AI_Output(self,other,"DIA_PAL_4_LOCATION_04_01");	//� �� ����������� �������� ���� ���.
};


instance DIA_PAL_4_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_PAL_4_STANDARD_Condition;
	information = DIA_PAL_4_STANDARD_Info;
	permanent = TRUE;
	description = "��� ������?";
};


func int DIA_PAL_4_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_PAL_4_STANDARD_Info()
{
	AI_Output(other,self,"DIA_PAL_4_STANDARD_15_00");	//��� ����������?
	if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
	{
		if(Kapitel <= 4)
		{
			if(MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_PAL_4_STANDARD_04_01");	//������, ����� �� �����, ��� ����� ���� � ���������, ��� ����������� ��������� ������ ���-�� ����������.
			}
			else
			{
				AI_Output(self,other,"DIA_PAL_4_STANDARD_04_02");	//� �� ��� ��� ��� ������� �������� �� ������ ������ � ������ ��������. ��� ��������� ����.
			};
		};
		if(Kapitel >= 5)
		{
			AI_Output(self,other,"DIA_PAL_4_STANDARD_04_03");	//����� ������! ������� ������ �� �������� ���. ������ ��� �������� ������ ����������� � ������, ����� ������ �������� �������� ����.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_4_STANDARD_04_04");	//� ���� ��� ������� �� ���������� ������, ������� � ������.
	};
};

func void B_AssignAmbientInfos_PAL_4(var C_Npc slf)
{
	dia_pal_4_exit.npc = Hlp_GetInstanceID(slf);
	dia_pal_4_join.npc = Hlp_GetInstanceID(slf);
	dia_pal_4_people.npc = Hlp_GetInstanceID(slf);
	dia_pal_4_location.npc = Hlp_GetInstanceID(slf);
	dia_pal_4_standard.npc = Hlp_GetInstanceID(slf);
};

