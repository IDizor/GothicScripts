
instance DIA_VLK_8_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_VLK_8_EXIT_Condition;
	information = DIA_VLK_8_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_VLK_8_EXIT_Condition()
{
	return TRUE;
};

func void DIA_VLK_8_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VLK_8_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_VLK_8_JOIN_Condition;
	information = DIA_VLK_8_JOIN_Info;
	permanent = TRUE;
	description = "� ���� ����� ����������� ����� ������!";
};


func int DIA_VLK_8_JOIN_Condition()
{
	if((hero.guild == GIL_NONE) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_VLK_8_JOIN_Info()
{
	AI_Output(other,self,"DIA_VLK_8_JOIN_15_00");	//� ���� ����� ����������� ����� ������!
	AI_Output(self,other,"DIA_VLK_8_JOIN_08_01");	//� ��� �� ����� �� ���� ��������? ��� � ������ �� �������� ������������� � ������ ����� ������. ����� ����, ���� ���� �������, ����-������ �� ��� ����� ������.
	AI_Output(self,other,"DIA_VLK_8_JOIN_08_02");	//� ��������� ������, ���� �������� ���������� � �����������, ����� �� ��������������� ���� ��� ����������.
	AI_Output(self,other,"DIA_VLK_8_JOIN_08_03");	//�� ������, �� ������ ������ �� ����. � ��� ���, ��� ������ ��������, ���������� ������ ������ �� ������.
	AI_Output(self,other,"DIA_VLK_8_JOIN_08_04");	//� � �� �����, ����� ������, �� ����� ��� ������� �� ����� �������.
};


instance DIA_VLK_8_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_VLK_8_PEOPLE_Condition;
	information = DIA_VLK_8_PEOPLE_Info;
	permanent = TRUE;
	description = "��� ����� ����������� �������� ����� ������?";
};


func int DIA_VLK_8_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_VLK_8_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_VLK_8_PEOPLE_15_00");	//��� ����� ����������� �������� ����� ������?
	AI_Output(self,other,"DIA_VLK_8_PEOPLE_08_01");	//����� ���������... ������� ������������ �� ������ ����� ������. ��� ����� ����������.
};


instance DIA_VLK_8_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_VLK_8_LOCATION_Condition;
	information = DIA_VLK_8_LOCATION_Info;
	permanent = TRUE;
	description = "��� ����� �����������?";
};


func int DIA_VLK_8_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_VLK_8_LOCATION_Info()
{
	AI_Output(other,self,"DIA_VLK_8_LOCATION_15_00");	//��� ����������� ����� ����� �������?
	AI_Output(self,other,"DIA_VLK_8_LOCATION_08_01");	//������� �������, �� ������� �������� �������� � ������. ��� �������� �����! ���� ����������� ����� ��������� �� ����.
	AI_Output(self,other,"DIA_VLK_8_LOCATION_08_02");	//�� � ����������, ��� ��� ������ ���� �� ����. �������� �������� ���� ������� �����, ��� ����������� ����������.
	AI_Output(self,other,"DIA_VLK_8_LOCATION_08_03");	//��� �������������. ��� ������������ ������� ����� �� ������ ���� ������.
};


instance DIA_VLK_8_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_VLK_8_STANDARD_Condition;
	information = DIA_VLK_8_STANDARD_Info;
	permanent = TRUE;
	description = "��� ������?";
};


func int DIA_VLK_8_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_VLK_8_STANDARD_Info()
{
	AI_Output(other,self,"DIA_VLK_8_STANDARD_15_00");	//��� ����������?
	if(Kapitel == 1)
	{
		AI_Output(self,other,"DIA_Addon_VLK_8_STANDARD_08_00");	//��� �����������.
		AI_Output(self,other,"DIA_Addon_VLK_8_STANDARD_08_01");	//���� ���� ����, ��� �������� ������������ �����, ��� ����, ������ ��� ��������� ��������� ���� ����� �������� �������.
		AI_Output(self,other,"DIA_Addon_VLK_8_STANDARD_08_02");	//���� �� ���������, �������, ������� � ���� ���-������.
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
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_01");	//��� ����, ����� �������� �������, ����� ��� ���� �������. � �������, ��� ��-�� �����. ���, ���������, ����� ������� �� ���!
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_02");	//��������, ����� ����, � ������������� �������, �� ����� ���� ����� �������� �����, � �����, ��� ���� ������������.
	};
	if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_03");	//� ������, ��� �������� ����� ������ �����, ����� ���������� �� ������� ��� ����. ��� ����� �� ��������, ��� ��� �������.
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_04");	//�� ���������, ��� ��� ��������? ������ ���� ������� �� ���������, ���� �� ��� ��� �������� �� ����� ����� �����.
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_05");	//� �������� ������� �� �������, ����� �������� ����� ��������� �����.
	};
	if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_06");	//�������, ��� ���� �������� ���� �� �������� ��������, �������� � �������� ������! � ��� ��� �� ������� �����!
	};
	if(Kapitel >= 5)
	{
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_07");	//�������, ��� ��� ������� ����������. ������� ��� ������?
	};
};

func void B_AssignAmbientInfos_VLK_8(var C_Npc slf)
{
	dia_vlk_8_exit.npc = Hlp_GetInstanceID(slf);
	dia_vlk_8_join.npc = Hlp_GetInstanceID(slf);
	dia_vlk_8_people.npc = Hlp_GetInstanceID(slf);
	dia_vlk_8_location.npc = Hlp_GetInstanceID(slf);
	dia_vlk_8_standard.npc = Hlp_GetInstanceID(slf);
};

