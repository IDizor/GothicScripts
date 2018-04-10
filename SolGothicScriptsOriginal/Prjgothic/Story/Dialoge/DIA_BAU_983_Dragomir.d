
instance DIA_Dragomir_EXIT(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 999;
	condition = DIA_Dragomir_EXIT_Condition;
	information = DIA_Dragomir_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dragomir_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Dragomir_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Dragomir_Hello(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 1;
	condition = DIA_Dragomir_Hello_Condition;
	information = DIA_Dragomir_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dragomir_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Dragomir_Hello_Info()
{
	AI_Output(self,other,"DIA_Dragomir_Hello_12_00");	//������������� ��� ������ �� ����?
	AI_Output(self,other,"DIA_Dragomir_Hello_12_01");	//����� ���� �� �������� ������������, �������� ����� �� ������ ����.
};


instance DIA_Dragomir_OutHere(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 2;
	condition = DIA_Dragomir_OutHere_Condition;
	information = DIA_Dragomir_OutHere_Info;
	permanent = FALSE;
	description = "��� �� ������� �����?";
};


func int DIA_Dragomir_OutHere_Condition()
{
	return TRUE;
};

func void DIA_Dragomir_OutHere_Info()
{
	AI_Output(other,self,"DIA_Dragomir_OutHere_15_00");	//��� �� ������� �����?
	AI_Output(self,other,"DIA_Dragomir_OutHere_12_01");	//��, ������ � ������� ������� ����� ��� ����, ��� ������ � � ���� �����.
	AI_Output(self,other,"DIA_Dragomir_OutHere_12_02");	//���������� �������� ����� �����, ������, ��� ������ �� �����������.
};


instance DIA_Dragomir_Settlers(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 2;
	condition = DIA_Dragomir_Settlers_Condition;
	information = DIA_Dragomir_Settlers_Info;
	permanent = FALSE;
	description = "� ��� ��� � ���� ������?";
};


func int DIA_Dragomir_Settlers_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dragomir_OutHere))
	{
		return TRUE;
	};
};

func void DIA_Dragomir_Settlers_Info()
{
	AI_Output(other,self,"DIA_Dragomir_Settlers_15_00");	//� ��� ��� � ���� ������?
	AI_Output(self,other,"DIA_Dragomir_Settlers_12_01");	//������� �� ����. ��������, �����-������ ��������. � �������, ��� ������, ��� ����� ����� ������� ������.
};


instance DIA_Dragomir_Dangerous(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 2;
	condition = DIA_Dragomir_Dangerous_Condition;
	information = DIA_Dragomir_Dangerous_Info;
	permanent = FALSE;
	description = "� ����� ����� �� ������?";
};


func int DIA_Dragomir_Dangerous_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dragomir_OutHere))
	{
		return TRUE;
	};
};

func void DIA_Dragomir_Dangerous_Info()
{
	AI_Output(other,self,"DIA_Dragomir_Dangerous_15_00");	//� ����� ����� �� ������?
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_01");	//��... �� �����, ���� �� ������ �������� �� ����. ��� ������� ��� ������������ ������ ����.
	AI_Output(other,self,"DIA_Dragomir_Dangerous_15_02");	//��. �� �� ����� �� �������.
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_03");	//�� ������������, ���� �� ������, ��� ���������� � ���. ��, � ���� ��� ������� ��������. ��, � ���������, � ������� ���.
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_04");	//� ������ ������� ������ �� �����, � ����. ��� ��������� ������� �������� ���� � ���������� �������.
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_05");	//���� � �������� ��� �� �����������, �� ���� �������� ��� ������� ������� � ������ �� ����.
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_06");	//��� �������� ������ �� ���� ���.
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_07");	//� ����� � �����, ������� ����������� �� ���� ����. � �����, �� ��� ��� ����� ���, � ����� ��������� ����� �� ������.
	Log_CreateTopic(TOPIC_DragomirsArmbrust,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DragomirsArmbrust,LOG_Running);
	B_LogEntry(TOPIC_DragomirsArmbrust,"�������� ������� ���� ������� � �������� �������� �����, ����������� ������ � �������� �����.");
	MIS_DragomirsArmbrust = LOG_Running;
};


instance DIA_Dragomir_Armbrust(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 2;
	condition = DIA_Dragomir_Armbrust_Condition;
	information = DIA_Dragomir_Armbrust_Info;
	permanent = FALSE;
	description = "���. � ����� ���� �������.";
};


func int DIA_Dragomir_Armbrust_Condition()
{
	if((MIS_DragomirsArmbrust == LOG_Running) && Npc_HasItems(other,ItRw_DragomirsArmbrust_MIS))
	{
		return TRUE;
	};
};

func void DIA_Dragomir_Armbrust_Info()
{
	AI_Output(other,self,"DIA_Dragomir_Armbrust_15_00");	//���. � ����� ���� �������.
	B_GiveInvItems(other,self,ItRw_DragomirsArmbrust_MIS,1);
	AI_Output(self,other,"DIA_Dragomir_Armbrust_12_01");	//�����, ��� ��� �������. ������ �� ������ ���, ��� �� ����� � ����� ��������� �����?
	AI_Output(other,self,"DIA_Dragomir_Armbrust_15_02");	//� ��� � ���� ������?
	AI_Output(self,other,"DIA_Dragomir_Armbrust_12_03");	//��� ���� ����� ����������� � ����� �������. �� ��� �����, �������.
	AI_Output(self,other,"DIA_Dragomir_Armbrust_12_04");	//�����������, � ����� ��������� �� ��� ���� ������. �������, ����� ����� ����������.
	CreateInvItems(self,ItMi_Gold,150);
	B_GiveInvItems(self,other,ItMi_Gold,150);
	MIS_DragomirsArmbrust = LOG_SUCCESS;
	B_GivePlayerXP(XP_DragomirsArmbrust);
};


var int Dragomir_TeachPlayer;
const int Dragomir_TeachingCost = 150;

instance DIA_Dragomir_Learn(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 2;
	condition = DIA_Dragomir_Learn_Condition;
	information = DIA_Dragomir_Learn_Info;
	permanent = TRUE;
	description = "�� ������ ������� ���� ����-������?";
};


func int DIA_Dragomir_Learn_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dragomir_Dangerous) && (Dragomir_TeachPlayer == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Dragomir_Learn_Info()
{
	AI_Output(other,self,"DIA_Dragomir_Learn_15_00");	//�� ������ ������� ���� ����-������?
	if(other.attribute[ATR_DEXTERITY] < 30)
	{
		AI_Output(self,other,"DIA_Dragomir_Learn_12_01");	//������, ��� � ����� ������� ���� ����-������, �� ������ �������� ���� ��������.
	}
	else
	{
		AI_Output(self,other,"DIA_Dragomir_Learn_12_02");	//���� �� ������ ���������. ��� � ��� �������, � ������ ������� ������� � ���������.
		AI_Output(other,self,"DIA_Dragomir_Learn_15_03");	//������� �� ������?
		B_Say_Gold(self,other,Dragomir_TeachingCost);
		Info_ClearChoices(DIA_Dragomir_Learn);
		Info_AddChoice(DIA_Dragomir_Learn,"����� ����, �����.",DIA_Dragomir_Learn_Later);
		if(Npc_HasItems(other,ItMi_Gold) >= Dragomir_TeachingCost)
		{
			Info_AddChoice(DIA_Dragomir_Learn,"��� ���� ������.",DIA_Dragomir_Learn_Here);
		};
	};
};

func void DIA_Dragomir_Learn_Later()
{
	AI_Output(other,self,"DIA_Dragomir_Learn_Later_15_00");	//��������, �����.
	Info_ClearChoices(DIA_Dragomir_Learn);
};

func void DIA_Dragomir_Learn_Here()
{
	AI_Output(other,self,"DIA_Dragomir_Learn_Here_15_00");	//��� ���� ������.
	B_GiveInvItems(other,self,ItMi_Gold,Dragomir_TeachingCost);
	AI_Output(self,other,"DIA_Dragomir_Learn_Here_12_01");	//������, �� ����� ������ ���� ������.
	Dragomir_TeachPlayer = TRUE;
	Info_ClearChoices(DIA_Dragomir_Learn);
};


var int DIA_Dragomir_Teach_permanent;

instance DIA_Dragomir_Teach(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 2;
	condition = DIA_Dragomir_Teach_Condition;
	information = DIA_Dragomir_Teach_Info;
	permanent = TRUE;
	description = "����� ���� ����-������.";
};


func int DIA_Dragomir_Teach_Condition()
{
	if((Dragomir_TeachPlayer == TRUE) && (DIA_Dragomir_Teach_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Dragomir_Teach_Info()
{
	AI_Output(other,self,"DIA_Dragomir_Teach_15_00");	//����� ���� ����-������.
	Info_ClearChoices(DIA_Dragomir_Teach);
	Info_AddChoice(DIA_Dragomir_Teach,Dialog_Back,DIA_Dragomir_Teach_Back);
	Info_AddChoice(DIA_Dragomir_Teach,B_BuildLearnString(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Dragomir_Teach_1H_1);
	Info_AddChoice(DIA_Dragomir_Teach,B_BuildLearnString(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1) * 5),DIA_Dragomir_Teach_1H_5);
};

func void DIA_Dragomir_Teach_Back()
{
	if(other.HitChance[NPC_TALENT_CROSSBOW] >= 75)
	{
		AI_Output(self,other,"DIA_Dragomir_Teach_12_00");	//� ������ ������ �� ���� ������� ����. ���� ����� �������� ������� �������.
		DIA_Dragomir_Teach_permanent = TRUE;
	};
	Info_ClearChoices(DIA_Dragomir_Teach);
};

func void DIA_Dragomir_Teach_1H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,1,75);
	Info_ClearChoices(DIA_Dragomir_Teach);
	Info_AddChoice(DIA_Dragomir_Teach,Dialog_Back,DIA_Dragomir_Teach_Back);
	Info_AddChoice(DIA_Dragomir_Teach,B_BuildLearnString(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Dragomir_Teach_1H_1);
	Info_AddChoice(DIA_Dragomir_Teach,B_BuildLearnString(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1) * 5),DIA_Dragomir_Teach_1H_5);
};

func void DIA_Dragomir_Teach_1H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,5,75);
	Info_ClearChoices(DIA_Dragomir_Teach);
	Info_AddChoice(DIA_Dragomir_Teach,Dialog_Back,DIA_Dragomir_Teach_Back);
	Info_AddChoice(DIA_Dragomir_Teach,B_BuildLearnString(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Dragomir_Teach_1H_1);
	Info_AddChoice(DIA_Dragomir_Teach,B_BuildLearnString(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1) * 5),DIA_Dragomir_Teach_1H_5);
};


instance DIA_Dragomir_PICKPOCKET(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 900;
	condition = DIA_Dragomir_PICKPOCKET_Condition;
	information = DIA_Dragomir_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Dragomir_PICKPOCKET_Condition()
{
	return C_Beklauen(47,70);
};

func void DIA_Dragomir_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Dragomir_PICKPOCKET);
	Info_AddChoice(DIA_Dragomir_PICKPOCKET,Dialog_Back,DIA_Dragomir_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Dragomir_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Dragomir_PICKPOCKET_DoIt);
};

func void DIA_Dragomir_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Dragomir_PICKPOCKET);
};

func void DIA_Dragomir_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Dragomir_PICKPOCKET);
};

