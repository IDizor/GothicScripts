
instance DIA_OCVLK_1_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_OCVLK_1_EXIT_Condition;
	information = DIA_OCVLK_1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_OCVLK_1_EXIT_Condition()
{
	return TRUE;
};

func void DIA_OCVLK_1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OCVLK_1_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_OCVLK_1_PEOPLE_Condition;
	information = DIA_OCVLK_1_PEOPLE_Info;
	permanent = TRUE;
	description = "��� ��������� �����?";
};


func int DIA_OCVLK_1_PEOPLE_Condition()
{
	if((Kapitel <= 4) && (MIS_KilledDragons < 4))
	{
		return TRUE;
	};
};

func void DIA_OCVLK_1_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_OCVLK_1_PEOPLE_15_00");	//��� ��������� �����?
	AI_Output(self,other,"DIA_OCVLK_1_PEOPLE_01_01");	//����������� ������. �� � ��� ���, ��� �������� ����������, �� �� ������� �� �������� ����. �����, ��� ��� ��� ����� ��������.
};


instance DIA_OCVLK_1_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_OCVLK_1_LOCATION_Condition;
	information = DIA_OCVLK_1_LOCATION_Info;
	permanent = TRUE;
	description = "��� ���� �������� � ������ ��������?";
};


func int DIA_OCVLK_1_LOCATION_Condition()
{
	if((Kapitel <= 4) && (MIS_KilledDragons < 4))
	{
		return TRUE;
	};
};

func void DIA_OCVLK_1_LOCATION_Info()
{
	AI_Output(other,self,"DIA_OCVLK_1_LOCATION_15_00");	//��� ���� �������� � ������ ��������?
	AI_Output(self,other,"DIA_OCVLK_1_LOCATION_01_01");	//��������� � ����, ��������� ����� ������ ��������� � ������ � ��� ��� �������� ����.
	AI_Output(self,other,"DIA_OCVLK_1_LOCATION_01_02");	//� �� �� ����� ���������� � ���� �������. ��� ������ ����� ������. �� ������ ��� � ��������.
};


instance DIA_OCVLK_1_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_OCVLK_1_STANDARD_Condition;
	information = DIA_OCVLK_1_STANDARD_Info;
	permanent = TRUE;
	description = "��� ����?";
};


func int DIA_OCVLK_1_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_OCVLK_1_STANDARD_Info()
{
	AI_Output(other,self,"DIA_OCVLK_1_STANDARD_15_00");	//��� ����?
	if(Kapitel <= 3)
	{
		AI_Output(self,other,"DIA_OCVLK_1_STANDARD_01_01");	//���� ������� ��� � ����, ��� � ������! ��� ������������ ������ �� ��� �� ������! � �������, ��� ������� ��� ��� �� ���������� ���.
	};
	if(Kapitel == 4)
	{
		if(MIS_KilledDragons < 4)
		{
			AI_Output(self,other,"DIA_OCVLK_1_STANDARD_01_02");	//�� ������� ����, ����� ��, �������, ������� ������������.
		}
		else
		{
			AI_Output(self,other,"DIA_OCVLK_1_STANDARD_01_03");	//� ������, ��� ������� ���� ����������? ����� ������!
		};
	};
	if(Kapitel >= 5)
	{
		if(MIS_OCGateOpen == FALSE)
		{
			AI_Output(self,other,"DIA_OCVLK_1_STANDARD_01_04");	//��� ��� ��������� ����. ��� ����� ���� �������� ��� ���� ������ ���� �� ���� ��������. ����� ����, ����� ���� �������� �� ��� � �����.
		}
		else
		{
			AI_Output(self,other,"DIA_OCVLK_1_STANDARD_01_05");	//��� ��������� �����, ��� ��� �������� �������� ����� ������, �� ������ ���������� �����!
		};
	};
};

func void B_AssignAmbientInfos_OCVLK_1(var C_Npc slf)
{
	dia_ocvlk_1_exit.npc = Hlp_GetInstanceID(slf);
	dia_ocvlk_1_people.npc = Hlp_GetInstanceID(slf);
	dia_ocvlk_1_location.npc = Hlp_GetInstanceID(slf);
	dia_ocvlk_1_standard.npc = Hlp_GetInstanceID(slf);
};

