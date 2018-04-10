
instance DIA_OCPAL_9_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_OCPAL_9_EXIT_Condition;
	information = DIA_OCPAL_9_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_OCPAL_9_EXIT_Condition()
{
	return TRUE;
};

func void DIA_OCPAL_9_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OCPAL_9_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_OCPAL_9_PEOPLE_Condition;
	information = DIA_OCPAL_9_PEOPLE_Info;
	permanent = TRUE;
	description = "��� ��������� �����?";
};


func int DIA_OCPAL_9_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_OCPAL_9_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_OCPAL_9_PEOPLE_15_00");	//��� ��������� �����?
	AI_Output(self,other,"DIA_OCPAL_9_PEOPLE_09_01");	//������. �� ��� ������ �� �����������.
};


instance DIA_OCPAL_9_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_OCPAL_9_LOCATION_Condition;
	information = DIA_OCPAL_9_LOCATION_Info;
	permanent = TRUE;
	description = "��� �� ������ �� ���� ������?";
};


func int DIA_OCPAL_9_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_OCPAL_9_LOCATION_Info()
{
	AI_Output(other,self,"DIA_OCPAL_9_LOCATION_15_00");	//��� �� ������ �� ���� ������?
	AI_Output(self,other,"DIA_OCPAL_9_LOCATION_09_01");	//��, �� ��� ���� ��������� ������� �������� �����. �� ���� ������ ���� �����, ��� ��� ����� ���������� ���� �������.
	AI_Output(self,other,"DIA_OCPAL_9_LOCATION_09_02");	//�������, ��� ���� �� �������� �������� ���� ������� ������. �� ���, ��� � ���, ��� ��� ����, ������� � ��������.
};


instance DIA_OCPAL_9_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_OCPAL_9_STANDARD_Condition;
	information = DIA_OCPAL_9_STANDARD_Info;
	permanent = TRUE;
	description = "��� ����?";
};


func int DIA_OCPAL_9_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_OCPAL_9_STANDARD_Info()
{
	AI_Output(other,self,"DIA_OCPAL_4_STANDARD_15_00");	//��� ����?
	if(Kapitel <= 3)
	{
		AI_Output(self,other,"DIA_OCPAL_4_STANDARD_09_01");	//������� ����� ������ �� ���! �� ����� ������� ��� � ���� ���. �������� ������� ������ �������� �� ���!
	};
	if(Kapitel == 4)
	{
		if(MIS_KilledDragons < 4)
		{
			AI_Output(self,other,"DIA_OCPAL_4_STANDARD_09_02");	//�������� �� ��������! ����� ���� ������� ���, ���������!
		}
		else
		{
			AI_Output(self,other,"DIA_OCPAL_4_STANDARD_09_03");	//������, ����� �� ���������� �� ���� ��������, �� ����� ����������� � ������!
		};
	};
	if(Kapitel >= 5)
	{
		if(MIS_OCGateOpen == FALSE)
		{
			AI_Output(self,other,"DIA_OCPAL_4_STANDARD_09_04");	//��� ����� ��������� ���� �� ������� � ��������� � ���� ��������� �����.
		}
		else
		{
			AI_Output(self,other,"DIA_OCPAL_4_STANDARD_09_05");	//�������������! ������ ������ ���� ���������! ������ ����������!
		};
	};
};

func void B_AssignAmbientInfos_OCPAL_9(var C_Npc slf)
{
	dia_ocpal_9_exit.npc = Hlp_GetInstanceID(slf);
	dia_ocpal_9_people.npc = Hlp_GetInstanceID(slf);
	dia_ocpal_9_location.npc = Hlp_GetInstanceID(slf);
	dia_ocpal_9_standard.npc = Hlp_GetInstanceID(slf);
};

