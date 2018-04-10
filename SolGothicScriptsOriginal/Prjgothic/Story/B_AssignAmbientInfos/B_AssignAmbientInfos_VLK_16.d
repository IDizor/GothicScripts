
instance DIA_VLK_16_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_VLK_16_EXIT_Condition;
	information = DIA_VLK_16_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_VLK_16_EXIT_Condition()
{
	return TRUE;
};

func void DIA_VLK_16_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VLK_16_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_VLK_16_JOIN_Condition;
	information = DIA_VLK_16_JOIN_Info;
	permanent = TRUE;
	description = "� ���� ����� ����������� ����� ������!";
};


func int DIA_VLK_16_JOIN_Condition()
{
	if((hero.guild == GIL_NONE) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_VLK_16_JOIN_Info()
{
	AI_Output(other,self,"DIA_VLK_16_JOIN_15_00");	//� ���� ����� ����������� ����� ������!
	AI_Output(self,other,"DIA_VLK_16_JOIN_16_01");	//�� �������� ��� ���������� �� �����?
	AI_Output(self,other,"DIA_VLK_16_JOIN_16_02");	//���� �� ��������� ��������, �� ������ ��������� � ��������� - �������� � ���-������ �� ��������� ������.
};


instance DIA_VLK_16_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_VLK_16_PEOPLE_Condition;
	information = DIA_VLK_16_PEOPLE_Info;
	permanent = TRUE;
	description = "��� ����� ����� ����������� ����?";
};


func int DIA_VLK_16_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_VLK_16_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_VLK_16_PEOPLE_15_00");	//��� ����� ����� ����������� ����?
	AI_Output(self,other,"DIA_VLK_16_PEOPLE_16_01");	//��������, ������� ����� � ������� ��������.
};


instance DIA_VLK_16_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_VLK_16_LOCATION_Condition;
	information = DIA_VLK_16_LOCATION_Info;
	permanent = TRUE;
	description = "��� ����� �����������?";
};


func int DIA_VLK_16_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_VLK_16_LOCATION_Info()
{
	AI_Output(other,self,"DIA_VLK_16_LOCATION_15_00");	//��� ����������� ����� ����� �����?
	AI_Output(self,other,"DIA_VLK_16_LOCATION_16_01");	//�� ����� �� ������ ������ ����������� ����� ������.
};


instance DIA_VLK_16_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_VLK_16_STANDARD_Condition;
	information = DIA_VLK_16_STANDARD_Info;
	permanent = TRUE;
	description = "��� ������?";
};


func int DIA_VLK_16_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_VLK_16_STANDARD_Info()
{
	AI_Output(other,self,"DIA_VLK_16_STANDARD_15_00");	//��� ����������?
	if(Kapitel == 1)
	{
		AI_Output(self,other,"DIA_Addon_VLK_16_STANDARD_16_00");	//�������, ��������� �������, �������, ���� �������� ��������� ��������.
		AI_Output(self,other,"DIA_Addon_VLK_16_STANDARD_16_01");	//��������� ������� �� ���� �����, ����� �������, ������� ������� �������.
		if(SC_HearedAboutMissingPeople == FALSE)
		{
			Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
			B_LogEntry(TOPIC_Addon_WhoStolePeople,LogText_Addon_SCKnowsMisspeapl);
		};
		SC_HearedAboutMissingPeople = TRUE;
	};
	if(Kapitel == 2)
	{
		AI_Output(self,other,"DIA_VLK_16_STANDARD_16_01");	//�� ����� �� ������? ���� ��� ����� ������! �������� ���������, ��� � ��������� ���������� �����.
		AI_Output(self,other,"DIA_VLK_16_STANDARD_16_02");	//���������, ������ ������� ������ �� �������� �� �����?
	};
	if(Kapitel == 3)
	{
		if(MIS_RescueBennet == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_VLK_16_STANDARD_16_03");	//�������, �������, ��� ��� ������, ���� ������, �������� ����������. ����� ��������������, ��� ��� ����������. � ������� �� ���� �� �����.
		}
		else
		{
			AI_Output(self,other,"DIA_VLK_16_STANDARD_16_04");	//��� �������������. �������� ����� ����� ���������� �������� ������ ����� � ���� �� ������.
			AI_Output(self,other,"DIA_VLK_16_STANDARD_16_05");	//�� ����� ����������� ������� �� �� �� �����. ������ �� ��������� ��������� ���� �� ������� ������ �������.
		};
	};
	if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_VLK_16_STANDARD_16_06");	//� �������, ��� ��� ����������� ����� � ����� �����. �������, ��� ������ ��������� ��������� ����� ������, � ����� �� ��� �����, � ������ ��������.
	};
	if(Kapitel == 5)
	{
		AI_Output(self,other,"DIA_VLK_16_STANDARD_16_07");	//� �������, ��� ��������� ������� ���������� ���� ���� ������� �������� �� ������ ��������.
	};
};

func void B_AssignAmbientInfos_VLK_16(var C_Npc slf)
{
	dia_vlk_16_exit.npc = Hlp_GetInstanceID(slf);
	dia_vlk_16_join.npc = Hlp_GetInstanceID(slf);
	dia_vlk_16_people.npc = Hlp_GetInstanceID(slf);
	dia_vlk_16_location.npc = Hlp_GetInstanceID(slf);
	dia_vlk_16_standard.npc = Hlp_GetInstanceID(slf);
};

