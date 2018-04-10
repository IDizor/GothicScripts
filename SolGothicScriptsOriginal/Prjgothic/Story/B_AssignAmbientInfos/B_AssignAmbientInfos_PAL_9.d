
instance DIA_PAL_9_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_PAL_9_EXIT_Condition;
	information = DIA_PAL_9_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_PAL_9_EXIT_Condition()
{
	return TRUE;
};

func void DIA_PAL_9_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_9_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_PAL_9_JOIN_Condition;
	information = DIA_PAL_9_JOIN_Info;
	permanent = TRUE;
	description = "��� ��� ����� ���������?";
};


func int DIA_PAL_9_JOIN_Condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_PAL_9_JOIN_Info()
{
	AI_Output(other,self,"DIA_PAL_9_JOIN_15_00");	//��� ��� ����� ���������?
	AI_Output(self,other,"DIA_PAL_9_JOIN_09_01");	//��������� ����� ����� ������ ���, ��� ������� ���� �������������� �������� ������ ��� ������!
	AI_Output(self,other,"DIA_PAL_9_JOIN_09_02");	//������ �����: ���������� ����� ����� ������ ������ �� ������. �� ���� �� ����� ��� ������, ��� �������!
};


instance DIA_PAL_9_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_PAL_9_PEOPLE_Condition;
	information = DIA_PAL_9_PEOPLE_Info;
	permanent = TRUE;
	description = "��� ��������� �����?";
};


func int DIA_PAL_9_PEOPLE_Condition()
{
	if(other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void DIA_PAL_9_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_PAL_9_PEOPLE_15_00");	//��� ��������� �����?
	AI_Output(self,other,"DIA_PAL_9_PEOPLE_09_01");	//���� �����.
	AI_Output(other,self,"DIA_PAL_9_PEOPLE_15_02");	//�?
	AI_Output(self,other,"DIA_PAL_9_PEOPLE_09_03");	//� ������ �����. ���� ����� - ��������� ����������� ����� ����� �������.
};


instance DIA_PAL_9_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_PAL_9_LOCATION_Condition;
	information = DIA_PAL_9_LOCATION_Info;
	permanent = TRUE;
	description = "����� �������� ������� � �������?";
};


func int DIA_PAL_9_LOCATION_Condition()
{
	if(Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_PAL_9_LOCATION_Info()
{
	AI_Output(other,self,"DIA_PAL_9_LOCATION_15_00");	//����� �������� ������� � �������?
	AI_Output(self,other,"DIA_PAL_9_LOCATION_09_01");	//��� �� ���� ����, ��������! ���� ���������� �����, ��� �� ������ ������ � ������!
};


instance DIA_PAL_9_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_PAL_9_STANDARD_Condition;
	information = DIA_PAL_9_STANDARD_Info;
	permanent = TRUE;
	description = "��� ����������?";
};


func int DIA_PAL_9_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_PAL_9_STANDARD_Info()
{
	AI_Output(other,self,"DIA_PAL_9_STANDARD_15_00");	//��� ����?
	if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
	{
		if(Kapitel <= 4)
		{
			if(MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_PAL_9_STANDARD_09_01");	//������, ����� �� �����, ��� ����� ���� � ���������, ��� ����������� ��������� ����� ���-�� ����������.
			}
			else
			{
				AI_Output(self,other,"DIA_PAL_9_STANDARD_09_02");	//��� ��� ��� ������� �������� �� ������ ������ � ������ ��������. ��� ����� �������.
			};
		};
		if(Kapitel >= 5)
		{
			AI_Output(self,other,"DIA_PAL_9_STANDARD_09_03");	//����� ������! ������ �������� �������������. ������, ����� �������� �������� ����, ��� ����� ������ ����������� � ������.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_9_STANDARD_09_04");	//���� ���� ������ ������ �������, ��� ������, ������!
	};
};

func void B_AssignAmbientInfos_PAL_9(var C_Npc slf)
{
	dia_pal_9_exit.npc = Hlp_GetInstanceID(slf);
	dia_pal_9_join.npc = Hlp_GetInstanceID(slf);
	dia_pal_9_people.npc = Hlp_GetInstanceID(slf);
	dia_pal_9_location.npc = Hlp_GetInstanceID(slf);
	dia_pal_9_standard.npc = Hlp_GetInstanceID(slf);
};

