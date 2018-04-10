
instance DIA_MIL_7_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_MIL_7_EXIT_Condition;
	information = DIA_MIL_7_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_MIL_7_EXIT_Condition()
{
	return TRUE;
};

func void DIA_MIL_7_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MIL_7_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_MIL_7_JOIN_Condition;
	information = DIA_MIL_7_JOIN_Info;
	permanent = TRUE;
	description = "� ���� �������� � ���������!";
};


func int DIA_MIL_7_JOIN_Condition()
{
	if(hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_MIL_7_JOIN_Info()
{
	AI_Output(other,self,"DIA_MIL_7_JOIN_15_00");	//� ���� �������� � ���������!
	if(Player_IsApprentice == APP_NONE)
	{
		AI_Output(self,other,"DIA_MIL_7_JOIN_07_01");	//�� ���� �� ��������� ��������! � ���� �� ����, ��� ���� ����� ������� ����?
		AI_Output(self,other,"DIA_MIL_7_JOIN_07_02");	//��� ������ ��� �� ��������, �������� ������ � ������� ���������, � ����� ��������� � ����!
		if(C_NpcIsInQuarter(self) != Q_KASERNE)
		{
			AI_Output(other,self,"DIA_MIL_7_JOIN_15_03");	//�� � ���� ��������� ���������!
			AI_Output(self,other,"DIA_MIL_7_JOIN_07_04");	//�� ���� ��������� ��� ���, �������� ��������� ��� ����� �����. �� ������� ��� � ��������.
		};
	}
	else
	{
		B_Say(self,other,"$ABS_GOOD");
	};
};


instance DIA_MIL_7_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_MIL_7_PEOPLE_Condition;
	information = DIA_MIL_7_PEOPLE_Info;
	permanent = TRUE;
	description = "��� �� ������ � ���������?";
};


func int DIA_MIL_7_PEOPLE_Condition()
{
	if(hero.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void DIA_MIL_7_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_MIL_7_PEOPLE_15_00");	//��� �� ������ � ���������?
	AI_Output(self,other,"DIA_MIL_7_PEOPLE_07_01");	//�� ������. ����� ����� �� �����, ����� ��� �����. ���� ��, ��� ������ � ��������� ������.
	AI_Output(self,other,"DIA_MIL_7_PEOPLE_07_02");	//��� ����� ��� ������ � ������ � ���� ����. ������� ����������� �� ���� ��������� � ����� �� ��� ������.
	AI_Output(self,other,"DIA_MIL_7_PEOPLE_07_03");	//���� ���� ���������� ��� ������ - �� ��� ���� ������. ���� ���������� ����� ������ ��������� ����.
};


instance DIA_MIL_7_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_MIL_7_LOCATION_Condition;
	information = DIA_MIL_7_LOCATION_Info;
	permanent = TRUE;
	description = "� ��� � ���� �������� � ������?";
};


func int DIA_MIL_7_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_MIL_7_LOCATION_Info()
{
	AI_Output(other,self,"DIA_MIL_7_LOCATION_15_00");	//� ��� � ���� �������� � ������?
	AI_Output(self,other,"DIA_MIL_7_LOCATION_07_01");	//���� �� �� ������ ��������� ����� � ������� ������ � �����, ����� ���������� ������. ����������� � ������ ����� ������ - ��������, ���� �������.
	AI_Output(self,other,"DIA_MIL_7_LOCATION_07_02");	//���� �� ���������� �������� � ������ �������, ���� ����� �������� � ���������� � ��������� ���, �� ������� ����, ��������������� � ������ ����������.
	AI_Output(self,other,"DIA_MIL_7_LOCATION_07_03");	//����������� ��� � �������� ��������� � �����������.
	AI_Output(self,other,"DIA_MIL_7_LOCATION_07_04");	//����� ������ ����, � ����� �� ������ ��� ������� ����, ������������ �� �����.
};


instance DIA_MIL_7_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_MIL_7_STANDARD_Condition;
	information = DIA_MIL_7_STANDARD_Info;
	permanent = TRUE;
	description = "��� ������?";
};


func int DIA_MIL_7_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_MIL_7_STANDARD_Info()
{
	var int randy;
	AI_Output(other,self,"DIA_MIL_7_STANDARD_15_00");	//��� ����������?
	if(Kapitel == 1)
	{
		randy = Hlp_Random(2);
		if(randy == 0)
		{
			AI_Output(self,other,"DIA_Addon_MIL_7_STANDARD_07_00");	//�������� �������� ���� �� �����. ���� ��� ��� �� ������� ��������, � ��� ����. ����� ����, �������� ����?
			if(SC_HearedAboutMissingPeople == FALSE)
			{
				Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
				Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
				B_LogEntry(TOPIC_Addon_WhoStolePeople,LogText_Addon_SCKnowsMisspeapl);
			};
			SC_HearedAboutMissingPeople = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_MIL_7_STANDARD_07_01");	//�������, ��� ������� �������������. ������ ����� ��� ��� �� �������. ��� ��� � ����� ������ ����� � ������!
		};
	};
	if(Kapitel == 2)
	{
		AI_Output(self,other,"DIA_MIL_7_STANDARD_07_02");	//�������� ������ �������� ��������� ��������. ���, ��� �������� �����, ������ ���� �������. �������� ������, ����� ���� �����.
	};
	if(Kapitel == 3)
	{
		if(MIS_RescueBennet == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_MIL_7_STANDARD_07_03");	//�������, �������� �������� � �������� ������, �������� ����������. ���-�� ���� ��������, ��� ��� ����������.
		}
		else
		{
			AI_Output(self,other,"DIA_MIL_7_STANDARD_07_04");	//���� �� ��������� ����� ���� ������������ �������� ������. �� ����� ������� ������� �������� � ������� �� �������.
		};
	};
	if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_MIL_7_STANDARD_07_05");	//����� ��������� ��� �������� ����� �����. ��������� �������� �������� ���� �����.
	};
	if(Kapitel >= 5)
	{
		AI_Output(self,other,"DIA_MIL_7_STANDARD_07_06");	//� ��������� ���������, �� ��� ��� �� ���. ��������� �� ������� ����. �� �� ���� ����� ���������!
	};
};

func void B_AssignAmbientInfos_MIL_7(var C_Npc slf)
{
	dia_mil_7_exit.npc = Hlp_GetInstanceID(slf);
	dia_mil_7_join.npc = Hlp_GetInstanceID(slf);
	dia_mil_7_people.npc = Hlp_GetInstanceID(slf);
	dia_mil_7_location.npc = Hlp_GetInstanceID(slf);
	dia_mil_7_standard.npc = Hlp_GetInstanceID(slf);
};

