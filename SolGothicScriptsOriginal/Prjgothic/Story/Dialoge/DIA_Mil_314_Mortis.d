
instance DIA_Mortis_EXIT(C_Info)
{
	npc = Mil_314_Mortis;
	nr = 999;
	condition = DIA_Mortis_EXIT_Condition;
	information = DIA_Mortis_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Mortis_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Mortis_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Mortis_Hallo(C_Info)
{
	npc = Mil_314_Mortis;
	nr = 2;
	condition = DIA_Mortis_Hallo_Condition;
	information = DIA_Mortis_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Mortis_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && ((Npc_KnowsInfo(other,DIA_Peck_FOUND_PECK) == FALSE) && (Kapitel < 3)))
	{
		return TRUE;
	};
};

func void DIA_Mortis_Hallo_Info()
{
	AI_Output(self,other,"DIA_Mortis_Hallo_13_00");	//��� ���� �����? ���� ����� ���. � ��� ���� �� ������ �� ��������. ������ �����.
};


instance DIA_Mortis_Waffe(C_Info)
{
	npc = Mil_314_Mortis;
	nr = 2;
	condition = DIA_Mortis_Waffe_Condition;
	information = DIA_Mortis_Waffe_Info;
	permanent = FALSE;
	description = "� ��� ���?";
};


func int DIA_Mortis_Waffe_Condition()
{
	if((MIS_Andre_Peck == LOG_Running) && ((Npc_KnowsInfo(other,DIA_Peck_FOUND_PECK) == FALSE) && (Kapitel < 3)))
	{
		return TRUE;
	};
};

func void DIA_Mortis_Waffe_Info()
{
	AI_Output(other,self,"DIA_Mortis_Waffe_15_00");	//� ��� ���?
	AI_Output(self,other,"DIA_Mortis_Waffe_13_01");	//�� ������ ��� ������� � ���� ����? ��, ����� ����� ����������.
	AI_Output(self,other,"DIA_Mortis_Waffe_13_02");	//��� ���� � ����� ��� �����. ����� ���������, ��� �� ���������� ���� � ������� ������.
};


instance DIA_Mortis_Paket(C_Info)
{
	npc = Mil_314_Mortis;
	nr = 2;
	condition = DIA_Mortis_Paket_Condition;
	information = DIA_Mortis_Paket_Info;
	permanent = FALSE;
	description = "�� ���-������ ������ � ���� ������?";
};


func int DIA_Mortis_Paket_Condition()
{
	if(MIS_Andre_WAREHOUSE == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Mortis_Paket_Info()
{
	AI_Output(other,self,"DIA_Mortis_Paket_15_00");	//�� ���-������ ������ � ���� ������?
	AI_Output(self,other,"DIA_Mortis_Paket_13_01");	//��... ��������� ���, ����� � ��� � �������� ������, � ������, ��� ������ ������� �� ���� � �����-�� ������.
	AI_Output(other,self,"DIA_Mortis_Paket_15_02");	//��� ��� �� ������?
	AI_Output(self,other,"DIA_Mortis_Paket_13_03");	//������� �� ����. �� �� ������, ��� ����� �������� ����� ��� �������� ����� - � ����� ��� ����� ����� ��� ������ ����.
	B_LogEntry(TOPIC_Warehouse,"������ ������, ��� ���������� ������ � ���-�� ��� ������������� � ���� � �������� �������. ��� ���������, ��� ����� ������� ���.");
};


instance DIA_Mortis_Redlight(C_Info)
{
	npc = Mil_314_Mortis;
	nr = 2;
	condition = DIA_Mortis_Redlight_Condition;
	information = DIA_Mortis_Redlight_Info;
	permanent = FALSE;
	description = "�� ������ ������ �������� �������?";
};


func int DIA_Mortis_Redlight_Condition()
{
	if(MIS_Andre_REDLIGHT == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Mortis_Redlight_Info()
{
	AI_Output(other,self,"DIA_Mortis_Redlight_15_00");	//�� ������ ������ �������� �������? � ���� ����� ����, ��� ������� �������� �����.
	AI_Output(self,other,"DIA_Mortis_Redlight_13_01");	//��-�... ����� ��� �� �������� �������������, � ��� �� ����� ������ �� ������ ���������� ���������.
	AI_Output(self,other,"DIA_Mortis_Redlight_13_02");	//���� �� ������ ��������� ���-���� ���, ���� �����... ���, �� ������ ����� ���� �������.
	AI_Output(other,self,"DIA_Mortis_Redlight_15_03");	//������, � ��� ������?
	AI_Output(self,other,"DIA_Mortis_Redlight_13_04");	//����� � ������� - ��������, ����� ������ ����� ��� �������. ���� ���� ������ ������� ���-���� ������, �� �� ������� ��� ���.
	B_LogEntry(TOPIC_Redlight,"������ ��������, ��� ���� � ���� ������ �������� ����� � �������� ��������, ��� ����� ����� ��� �������. ����� ����� �������� �������� � ������� ��� �������.");
};


instance DIA_Mortis_CanTeach(C_Info)
{
	npc = Mil_314_Mortis;
	nr = 5;
	condition = DIA_Mortis_CanTeach_Condition;
	information = DIA_Mortis_CanTeach_Info;
	permanent = TRUE;
	description = "� ���� ����� �������.";
};


func int DIA_Mortis_CanTeach_Condition()
{
	if(Mortis_TeachSTR == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Mortis_CanTeach_Info()
{
	AI_Output(other,self,"DIA_Mortis_CanTeach_15_00");	//� ���� ����� �������.
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Mortis_CanTeach_13_01");	//�������. ���� � ���� ���������� �����, � ���� ������������� ����.
		Mortis_TeachSTR = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Mortis_CanTeach_13_02");	//�������, ������. �� ���� �� �� ������� ����� �� ��� ��� ���������, � �� ���� �������� ����.
	};
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_CityTeacher,"������, ��������� ��������, ����� ������ ��� �������� ��� ����.");
};


instance DIA_Mortis_Teach(C_Info)
{
	npc = Mil_314_Mortis;
	nr = 100;
	condition = DIA_Mortis_Teach_Condition;
	information = DIA_Mortis_Teach_Info;
	permanent = TRUE;
	description = "� ���� ����� �������.";
};


func int DIA_Mortis_Teach_Condition()
{
	if(Mortis_TeachSTR == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Mortis_Teach_Info()
{
	AI_Output(other,self,"DIA_Mortis_Teach_15_00");	//� ���� ����� �������.
	Info_ClearChoices(DIA_Mortis_Teach);
	Info_AddChoice(DIA_Mortis_Teach,Dialog_Back,DIA_Mortis_Teach_BACK);
	Info_AddChoice(DIA_Mortis_Teach,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Mortis_Teach_1);
	Info_AddChoice(DIA_Mortis_Teach,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Mortis_Teach_5);
};

func void DIA_Mortis_Teach_BACK()
{
	if(other.attribute[ATR_STRENGTH] >= T_LOW)
	{
		AI_Output(self,other,"DIA_Mortis_Teach_13_00");	//�� � ��� ���������� �����. ���� �� �� ���������� � ��������, ����� ���� ������� �������.
	};
	Info_ClearChoices(DIA_Mortis_Teach);
};

func void DIA_Mortis_Teach_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_LOW);
	Info_ClearChoices(DIA_Mortis_Teach);
	Info_AddChoice(DIA_Mortis_Teach,Dialog_Back,DIA_Mortis_Teach_BACK);
	Info_AddChoice(DIA_Mortis_Teach,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Mortis_Teach_1);
	Info_AddChoice(DIA_Mortis_Teach,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Mortis_Teach_5);
};

func void DIA_Mortis_Teach_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_LOW);
	Info_ClearChoices(DIA_Mortis_Teach);
	Info_AddChoice(DIA_Mortis_Teach,Dialog_Back,DIA_Mortis_Teach_BACK);
	Info_AddChoice(DIA_Mortis_Teach,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Mortis_Teach_1);
	Info_AddChoice(DIA_Mortis_Teach,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Mortis_Teach_5);
};


instance DIA_Mortis_PICKPOCKET(C_Info)
{
	npc = Mil_314_Mortis;
	nr = 900;
	condition = DIA_Mortis_PICKPOCKET_Condition;
	information = DIA_Mortis_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Mortis_PICKPOCKET_Condition()
{
	return C_Beklauen(38,60);
};

func void DIA_Mortis_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Mortis_PICKPOCKET);
	Info_AddChoice(DIA_Mortis_PICKPOCKET,Dialog_Back,DIA_Mortis_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Mortis_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Mortis_PICKPOCKET_DoIt);
};

func void DIA_Mortis_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Mortis_PICKPOCKET);
};

func void DIA_Mortis_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Mortis_PICKPOCKET);
};

