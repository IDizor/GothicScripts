
instance DIA_OCVLK_6_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_OCVLK_6_EXIT_Condition;
	information = DIA_OCVLK_6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_OCVLK_6_EXIT_Condition()
{
	return TRUE;
};

func void DIA_OCVLK_6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OCVLK_6_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_OCVLK_6_PEOPLE_Condition;
	information = DIA_OCVLK_6_PEOPLE_Info;
	permanent = TRUE;
	description = "��� ��������� �����?";
};


func int DIA_OCVLK_6_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_OCVLK_6_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_OCVLK_6_PEOPLE_15_00");	//��� ��������� �����?
	AI_Output(self,other,"DIA_OCVLK_6_PEOPLE_06_01");	//������ ��������� ���� ������ - ������, ���, ��� �� ���� ��������.
	AI_Output(self,other,"DIA_OCVLK_6_PEOPLE_06_02");	//�� ��� �� �� ������������� ����������� ������. ��, ���� ������ ���-���� �� ��� ����� �� ������� � ����.
	if(Npc_IsDead(Engor) == FALSE)
	{
		AI_Output(self,other,"DIA_OCVLK_6_PEOPLE_06_03");	//���� ���� ����� ����������, �������� � �������. �� ������� ��� � ���� �������� ���� �������.
	};
};


instance DIA_OCVLK_6_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_OCVLK_6_LOCATION_Condition;
	information = DIA_OCVLK_6_LOCATION_Info;
	permanent = TRUE;
	description = "��� �� ������ ���������� ��� � �������� � ������ ��������?";
};


func int DIA_OCVLK_6_LOCATION_Condition()
{
	if((Kapitel <= 4) && (MIS_KilledDragons < 4))
	{
		return TRUE;
	};
};

func void DIA_OCVLK_6_LOCATION_Info()
{
	AI_Output(other,self,"DIA_OCVLK_6_LOCATION_15_00");	//��� �� ������ ���������� ��� � �������� � ������ ��������?
	AI_Output(self,other,"DIA_OCVLK_6_LOCATION_06_01");	//���� ��������� �������� ����� �����. � ���� ����� �� ����, ��� ���� �������� �� ���.
	AI_Output(self,other,"DIA_OCVLK_6_LOCATION_06_02");	//������� �� ���� ���� - ��� ������� ��� �����. � �����, ������� �����, ��� ���������� ������� ������.
	AI_Output(self,other,"DIA_OCVLK_6_LOCATION_06_03");	//��� �������, � �� ������ �������� ��� �����.
	AI_Output(self,other,"DIA_OCVLK_6_LOCATION_06_04");	//�� ������ ����� ����. ���� ��� �������� ������� � ������, � ��� �� ����� �� ������� �����.
};


instance DIA_OCVLK_6_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_OCVLK_6_STANDARD_Condition;
	information = DIA_OCVLK_6_STANDARD_Info;
	permanent = TRUE;
	description = "��� ����?";
};


func int DIA_OCVLK_6_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_OCVLK_6_STANDARD_Info()
{
	AI_Output(other,self,"DIA_OCVLK_6_STANDARD_15_00");	//��� ����?
	if(Kapitel <= 3)
	{
		AI_Output(self,other,"DIA_OCVLK_6_STANDARD_06_01");	//��� ��������: '������ � ����� � � ���� �� ����� �����'. � ��� ��� ��� �����.
		AI_Output(self,other,"DIA_OCVLK_6_STANDARD_06_02");	//������ ��� ������� ������ ��������� ���� ������������ � ������� ��������������. ������, ������, ������, ��� �� ������� ������� � ������ ������. (������� �������)
		AI_Output(self,other,"DIA_OCVLK_6_STANDARD_06_03");	//�� ��� ����� ������� �� ������, ���� ��� ������� ������� �� ����� ��� ������!
	};
	if(Kapitel == 4)
	{
		if(MIS_KilledDragons < 4)
		{
			AI_Output(self,other,"DIA_OCVLK_6_STANDARD_06_04");	//�������� �� ��������. �� ����� ����! ��� ������ �� �������.
		}
		else
		{
			AI_Output(self,other,"DIA_OCVLK_6_STANDARD_06_05");	//�������, ��� ��� ������� �����! ������ � ��� �������� ����!
		};
	};
	if(Kapitel >= 5)
	{
		if(MIS_OCGateOpen == FALSE)
		{
			AI_Output(self,other,"DIA_OCVLK_6_STANDARD_06_06");	//��� ��-�� ���� ��������� ����. ��� �� ����� ��������� ���, ��� �� ���������� �����. �����, ����� ���� ������� ��� � �����.
		}
		else
		{
			AI_Output(self,other,"DIA_OCVLK_6_STANDARD_06_07");	//��� �������� �����, ��� ��� �������� ����� ������, �� ������ ���������� �����!
		};
	};
};

func void B_AssignAmbientInfos_OCVLK_6(var C_Npc slf)
{
	dia_ocvlk_6_exit.npc = Hlp_GetInstanceID(slf);
	dia_ocvlk_6_people.npc = Hlp_GetInstanceID(slf);
	dia_ocvlk_6_location.npc = Hlp_GetInstanceID(slf);
	dia_ocvlk_6_standard.npc = Hlp_GetInstanceID(slf);
};

