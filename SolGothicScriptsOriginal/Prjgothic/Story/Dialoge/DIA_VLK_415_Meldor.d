
instance DIA_Meldor_EXIT(C_Info)
{
	npc = VLK_415_Meldor;
	nr = 999;
	condition = DIA_Meldor_EXIT_Condition;
	information = DIA_Meldor_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Meldor_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Meldor_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Meldor_Hallo(C_Info)
{
	npc = VLK_415_Meldor;
	nr = 2;
	condition = DIA_Meldor_Hallo_Condition;
	information = DIA_Meldor_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Meldor_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Meldor_Hallo_Info()
{
	AI_Output(self,other,"DIA_Meldor_Hallo_07_00");	//��� ���� �����?
	AI_Output(other,self,"DIA_Meldor_Hallo_15_01");	//� ������ ������� �������������...
	AI_Output(self,other,"DIA_Meldor_Hallo_07_02");	//� ���� ������ �� �������������?
};


instance DIA_Meldor_Interessantes(C_Info)
{
	npc = VLK_415_Meldor;
	nr = 2;
	condition = DIA_Meldor_Interessantes_Condition;
	information = DIA_Meldor_Interessantes_Info;
	permanent = FALSE;
	description = "��� ����� �����������?";
};


func int DIA_Meldor_Interessantes_Condition()
{
	return TRUE;
};

func void DIA_Meldor_Interessantes_Info()
{
	AI_Output(other,self,"DIA_Meldor_Interessantes_15_00");	//��� ����� �����������?
	AI_Output(self,other,"DIA_Meldor_Interessantes_07_01");	//����� ���� ������� � �����. ������� ������ ����� ������. ���� ���� ����� ����������, � ������� ����������� ������ � ���.
	AI_Output(self,other,"DIA_Meldor_Interessantes_07_02");	//����, ������, �� ����� ������?
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"������, �������� ������� � ������, �������������� �����������.");
};


instance DIA_Meldor_Lehmar(C_Info)
{
	npc = VLK_415_Meldor;
	nr = 3;
	condition = DIA_Meldor_Lehmar_Condition;
	information = DIA_Meldor_Lehmar_Info;
	permanent = FALSE;
	description = "� �� ����� ��?";
};


func int DIA_Meldor_Lehmar_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Meldor_Interessantes))
	{
		return TRUE;
	};
};

func void DIA_Meldor_Lehmar_Info()
{
	AI_Output(other,self,"DIA_Meldor_Lehmar_15_00");	//� �� ����� ��?
	AI_Output(self,other,"DIA_Meldor_Lehmar_07_01");	//(������) ���. �� ����� ����� ����� ��������� ��� ������, ����������.
	AI_Output(self,other,"DIA_Meldor_Lehmar_07_02");	//� ������, ��� �� ������ �������� ���� ��������� �������.
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Meldor_Arbeitest(C_Info)
{
	npc = VLK_415_Meldor;
	nr = 4;
	condition = DIA_Meldor_Arbeitest_Condition;
	information = DIA_Meldor_Arbeitest_Info;
	permanent = FALSE;
	description = "�� ��������� �� ������?";
};


func int DIA_Meldor_Arbeitest_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Meldor_Lehmar))
	{
		return TRUE;
	};
};

func void DIA_Meldor_Arbeitest_Info()
{
	AI_Output(other,self,"DIA_Meldor_Arbeitest_15_00");	//�� ��������� �� ������?
	AI_Output(self,other,"DIA_Meldor_Arbeitest_07_01");	//����� �������.
};


instance DIA_Meldor_InsOV(C_Info)
{
	npc = VLK_415_Meldor;
	nr = 5;
	condition = DIA_Meldor_InsOV_Condition;
	information = DIA_Meldor_InsOV_Info;
	permanent = FALSE;
	description = "������-�� � ����������� � ������� �������...";
};


func int DIA_Meldor_InsOV_Condition()
{
	return TRUE;
};

func void DIA_Meldor_InsOV_Info()
{
	AI_Output(other,self,"DIA_Meldor_InsOV_15_00");	//������-�� � ����������� � ������� �������...
	AI_Output(self,other,"DIA_Meldor_InsOV_07_01");	//(�����������) ��, �������. � � ��������� ����� �� ������� � ������� ����� ������.
	AI_Output(self,other,"DIA_Meldor_InsOV_07_02");	//����� ����� ���� � ���� ������ � ������� ������� ������ � ��� ���, ��� � ����� ������� ��������.
};


instance DIA_Meldor_Citizen(C_Info)
{
	npc = VLK_415_Meldor;
	nr = 6;
	condition = DIA_Meldor_Citizen_Condition;
	information = DIA_Meldor_Citizen_Info;
	permanent = FALSE;
	description = "�� ��������� ����� ������?";
};


func int DIA_Meldor_Citizen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Meldor_InsOV))
	{
		return TRUE;
	};
};

func void DIA_Meldor_Citizen_Info()
{
	AI_Output(other,self,"DIA_Meldor_Citizen_15_00");	//�� ��������� ����� ������?
	AI_Output(self,other,"DIA_Meldor_Citizen_07_01");	//���� �� ������ � ����, ���� �� � �����, �� ��. �� ���� ��� ����� �� ������ � ������� �������.
	AI_Output(self,other,"DIA_Meldor_Citizen_07_02");	//���� ����� ������� ������ ������ ��������, ��, ��� �������� � ������������ �� ������ ����� ������.
	AI_Output(self,other,"DIA_Meldor_Citizen_07_03");	//������ ��������� �������� �� ����� ������� ���� � ��������. ���� ���� ������� ��������� ����� ������� �� �����������.
};


instance DIA_Meldor_Smoke(C_Info)
{
	npc = VLK_415_Meldor;
	nr = 5;
	condition = DIA_Meldor_Smoke_Condition;
	information = DIA_Meldor_Smoke_Info;
	permanent = FALSE;
	description = "�� �� ������, ��� ��� ������ ������?";
};


func int DIA_Meldor_Smoke_Condition()
{
	if(MIS_Andre_REDLIGHT == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Meldor_Smoke_Info()
{
	var C_Item heroArmor;
	heroArmor = Npc_GetEquippedArmor(other);
	AI_Output(other,self,"DIA_Meldor_Smoke_15_00");	//�� �� ������, ��� ��� ������ ������?
	if(Hlp_IsItem(heroArmor,ITAR_Mil_L) == TRUE)
	{
		AI_Output(self,other,"DIA_Meldor_Smoke_07_01");	//(����������) ���, ������� �� ����.
	}
	else
	{
		AI_Output(self,other,"DIA_Meldor_Smoke_07_02");	//�� ����� �����, � �� ������� ������� � '������� ������'.
	};
};


var int Meldor_DGNews;

instance DIA_Meldor_PERM(C_Info)
{
	npc = VLK_415_Meldor;
	nr = 7;
	condition = DIA_Meldor_PERM_Condition;
	information = DIA_Meldor_PERM_Info;
	permanent = TRUE;
	description = "������ ����������� �� ����?";
};


func int DIA_Meldor_PERM_Condition()
{
	return TRUE;
};

func void DIA_Meldor_PERM_Info()
{
	AI_Output(other,self,"DIA_Meldor_PERM_15_00");	//������ ����������� �� ���� ��������� �����?
	if(Kapitel <= 1)
	{
		AI_Output(self,other,"DIA_Meldor_PERM_07_01");	//�������, ��������� ������ ����������� ����� ���� ����� �������� �������.
		AI_Output(self,other,"DIA_Meldor_PERM_07_02");	//��� ������ ����������. ��������� ����� ��������� �� ������ ����� �����. �������� � ���������� ���������.
		AI_Output(self,other,"DIA_Meldor_PERM_07_03");	//��� �������� �� ���� �������� �������� �� ��������� ��������.
	}
	else if((Andre_Diebesgilde_aufgeraeumt == TRUE) && (Meldor_DGNews == FALSE))
	{
		AI_Output(self,other,"DIA_Meldor_PERM_07_04");	//� ������, � ����������� ������� ����� �����. ��� ���� ���� �����.
		Meldor_DGNews = TRUE;
	}
	else if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_Meldor_PERM_07_05");	//�������, ��� � ������ �������� ��������� �������. ���������, ����� �������� ����� ������, ����� ��������� � ���������.
	}
	else if(Kapitel == 5)
	{
		AI_Output(self,other,"DIA_Meldor_PERM_07_06");	//����������������, ��� ������� ������. ���-�� ����� �� �������� ������.
	}
	else
	{
		AI_Output(self,other,"DIA_Meldor_PERM_07_07");	//���.
	};
};


instance DIA_Meldor_VonLehmar(C_Info)
{
	npc = VLK_415_Meldor;
	nr = 1;
	condition = DIA_Meldor_VonLehmar_Condition;
	information = DIA_Meldor_VonLehmar_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Meldor_VonLehmar_Condition()
{
	if((Lehmar_GeldGeliehen_Day <= (Wld_GetDay() - 2)) && (Lehmar_GeldGeliehen != 0) && (RangerHelp_LehmarKohle == FALSE) && (Lehmar.aivar[AIV_DefeatedByPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Meldor_VonLehmar_Info()
{
	AI_Output(self,other,"DIA_Meldor_VonLehmar_07_00");	//��, �������...
	AI_Output(self,other,"DIA_Meldor_VonLehmar_07_01");	//� ���� ���� ��� ���� ��������� �� ������...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Meldor_PICKPOCKET(C_Info)
{
	npc = VLK_415_Meldor;
	nr = 900;
	condition = DIA_Meldor_PICKPOCKET_Condition;
	information = DIA_Meldor_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Meldor_PICKPOCKET_Condition()
{
	return C_Beklauen(34,55);
};

func void DIA_Meldor_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Meldor_PICKPOCKET);
	Info_AddChoice(DIA_Meldor_PICKPOCKET,Dialog_Back,DIA_Meldor_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Meldor_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Meldor_PICKPOCKET_DoIt);
};

func void DIA_Meldor_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Meldor_PICKPOCKET);
};

func void DIA_Meldor_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Meldor_PICKPOCKET);
};

