
instance DIA_Garwig_EXIT(C_Info)
{
	npc = Nov_608_Garwig;
	nr = 999;
	condition = DIA_Garwig_EXIT_Condition;
	information = DIA_Garwig_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Garwig_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Garwig_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Garwig_Wurst(C_Info)
{
	npc = Nov_608_Garwig;
	nr = 3;
	condition = DIA_Garwig_Wurst_Condition;
	information = DIA_Garwig_Wurst_Info;
	permanent = FALSE;
	description = "������ �������?";
};


func int DIA_Garwig_Wurst_Condition()
{
	if((Kapitel == 1) && (MIS_GoraxEssen == LOG_Running) && (Npc_HasItems(self,ItFo_Schafswurst) == 0) && (Npc_HasItems(other,ItFo_Schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Garwig_Wurst_Info()
{
	var string NovizeText;
	var string NovizeLeft;
	AI_Output(other,self,"DIA_Garwig_Wurst_15_00");	//������ �������?
	AI_Output(self,other,"DIA_Garwig_Wurst_06_01");	//��, ��� ������. �������� ������� ����, ����.
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	Wurst_Gegeben = Wurst_Gegeben + 1;
	CreateInvItems(self,ItFo_Sausage,1);
	B_UseItem(self,ItFo_Sausage);
	NovizeLeft = IntToString(13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft,PRINT_NovizenLeft);
	AI_PrintScreen(NovizeText,-1,YPOS_GoldGiven,FONT_ScreenSmall,2);
};


instance DIA_Garwig_Hello(C_Info)
{
	npc = Nov_608_Garwig;
	nr = 3;
	condition = DIA_Garwig_Hello_Condition;
	information = DIA_Garwig_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Garwig_Hello_Condition()
{
	if(other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void DIA_Garwig_Hello_Info()
{
	AI_Output(self,other,"DIA_Garwig_Hello_06_00");	//�� �������� � ����� �����, � ������� �� ����� ���� ������. �� ��������� �����?
	AI_Output(other,self,"DIA_Garwig_Hello_15_01");	//��, � ������ ��� ���� �����������.
	AI_Output(self,other,"DIA_Garwig_Hello_06_02");	//����� � ����� ���� ��������� ����� ���������. ��� ��� �����, ���� ���� ����������� ������.
};


instance DIA_Garwig_Room(C_Info)
{
	npc = Nov_608_Garwig;
	nr = 5;
	condition = DIA_Garwig_Room_Condition;
	information = DIA_Garwig_Room_Info;
	permanent = FALSE;
	description = "��� ��� �� �������?";
};


func int DIA_Garwig_Room_Condition()
{
	return TRUE;
};

func void DIA_Garwig_Room_Info()
{
	AI_Output(other,self,"DIA_Garwig_Room_15_00");	//��� ��� �� �������?
	AI_Output(self,other,"DIA_Garwig_Room_06_01");	//����� �������� ��������� �������� ���������.
	AI_Output(other,self,"DIA_Garwig_Room_15_02");	//����� ��������?
	AI_Output(self,other,"DIA_Garwig_Room_06_03");	//����� �������� ����� ������, � ����� ��� ����. ��� ����� ������ �������� ������ ������ �����, ����� �� ������� �����������.
};


instance DIA_Garwig_Hammer(C_Info)
{
	npc = Nov_608_Garwig;
	nr = 99;
	condition = DIA_Garwig_Hammer_Condition;
	information = DIA_Garwig_Hammer_Info;
	permanent = TRUE;
	description = "�������� ��� �� ���� ������.";
};


func int DIA_Garwig_Hammer_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Garwig_Room))
	{
		return TRUE;
	};
};

func void DIA_Garwig_Hammer_Info()
{
	AI_Output(other,self,"DIA_Garwig_Hammer_15_00");	//�������� ��� �� ���� ������.
	AI_Output(self,other,"DIA_Garwig_Hammer_06_01");	//��� ��������� ����� ������. ���� ������� ������ ����� ������� ��������� ��������.
	AI_Output(self,other,"DIA_Garwig_Hammer_06_02");	//� ��������� �������� ���������, ��� �������� ������� ��� ��������. �� ���������� ��� ����� ���, ��� �����, � ������ ��� ������ ����������� � ��� �������� ����.
	AI_Output(self,other,"DIA_Garwig_Hammer_06_03");	//� ������ ������ �� �����, ����� �������� �� ����� ������� � ������� ��� ����� ������� ������ ������ ������.
};


instance DIA_Garwig_Shield(C_Info)
{
	npc = Nov_608_Garwig;
	nr = 98;
	condition = DIA_Garwig_Shield_Condition;
	information = DIA_Garwig_Shield_Info;
	permanent = FALSE;
	description = "�������� ��� �� ���� ����.";
};


func int DIA_Garwig_Shield_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Garwig_Room))
	{
		return TRUE;
	};
};

func void DIA_Garwig_Shield_Info()
{
	AI_Output(other,self,"DIA_Garwig_Shield_15_00");	//�������� ��� �� ���� ����.
	AI_Output(self,other,"DIA_Garwig_Shield_06_01");	//��� ���� ����������� �������� � ����� �� ����� ��������.
	AI_Output(self,other,"DIA_Garwig_Shield_06_02");	//�� ���� ����� ���� �� ������  ������ �������������� - �������, �� ������� ��� �� �����.
};


instance DIA_Garwig_Auge(C_Info)
{
	npc = Nov_608_Garwig;
	nr = 4;
	condition = DIA_Garwig_Auge_Condition;
	information = DIA_Garwig_Auge_Info;
	permanent = FALSE;
	description = "� ���� ������ ���� ��������� �����?";
};


func int DIA_Garwig_Auge_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Garwig_Room) && (Kapitel <= 2))
	{
		return TRUE;
	};
};

func void DIA_Garwig_Auge_Info()
{
	AI_Output(other,self,"DIA_Garwig_Auge_15_00");	//� ���� ������ ���� ��������� �����?
	AI_Output(self,other,"DIA_Garwig_Auge_06_01");	//������� ���. ��� �� �������� �����. ����� �� �����, ��� �������� ���� ������������ ��������.
};


instance DIA_Garwig_SLEEP(C_Info)
{
	npc = Nov_608_Garwig;
	nr = 23;
	condition = DIA_Garwig_SLEEP_Condition;
	information = DIA_Garwig_SLEEP_Info;
	permanent = TRUE;
	description = "��� �� ������� �����?";
};


func int DIA_Garwig_SLEEP_Condition()
{
	if(other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void DIA_Garwig_SLEEP_Info()
{
	AI_Output(other,self,"DIA_Garwig_SLEEP_15_00");	//��� �� ������� �����?
	AI_Output(self,other,"DIA_Garwig_SLEEP_06_01");	//� ����� ��������� ����������.
	Info_ClearChoices(DIA_Garwig_SLEEP);
	Info_AddChoice(DIA_Garwig_SLEEP,Dialog_Back,DIA_Garwig_SLEEP_BACK);
	Info_AddChoice(DIA_Garwig_SLEEP,"��� ���� � ����� ���� ���������?",DIA_Garwig_SLEEP_EXCHANGE);
	Info_AddChoice(DIA_Garwig_SLEEP,"������ ��� ��������� ����������?",DIA_Garwig_SLEEP_THIEF);
	Info_AddChoice(DIA_Garwig_SLEEP,"�� �����-������ �����?",DIA_Garwig_SLEEP_NEVER);
};

func void DIA_Garwig_SLEEP_BACK()
{
	Info_ClearChoices(DIA_Garwig_SLEEP);
};

func void DIA_Garwig_SLEEP_EXCHANGE()
{
	AI_Output(other,self,"DIA_Garwig_SLEEP_EXCHANGE_15_00");	//��� ���� � ����� ���� ���������?
	AI_Output(self,other,"DIA_Garwig_SLEEP_EXCHANGE_06_01");	//��� ���������? ���� ������� ���� �������� ����, ���������? ���, � ���� ���!
	AI_Output(self,other,"DIA_Garwig_SLEEP_EXCHANGE_06_02");	//�� � ������ ��� ���������. ����� ����� �����, ��� � ��� ������������� ��� ����� � ��� � ���� �������������� ���� ����������. ��� � ������� �����.
};

func void DIA_Garwig_SLEEP_THIEF()
{
	AI_Output(other,self,"DIA_Garwig_SLEEP_THIEF_15_00");	//������ ��� ��������� ����������? ���� ������� ��������, ��� ��� ����� ���� ��������?
	AI_Output(self,other,"DIA_Garwig_SLEEP_THIEF_06_01");	//��� �� �������� �����. � ���� �� ��� ����?
	AI_Output(self,other,"DIA_Garwig_SLEEP_THIEF_06_02");	//������ ��, ��� ������ ������, ����� ������� � ���������. � �� � ���� �� �������� �������� ����� ����� ���� ��������� �� �����.
};

func void DIA_Garwig_SLEEP_NEVER()
{
	AI_Output(other,self,"DIA_Garwig_SLEEP_NEVER_15_00");	//�� �����-������ �����?
	AI_Output(self,other,"DIA_Garwig_SLEEP_NEVER_06_01");	//��� �� ��������� ���������. ������� ��, � ������� �� ����. ��� ����� ������ ��� ���� ���������� ��� ���.
	AI_Output(self,other,"DIA_Garwig_SLEEP_NEVER_06_02");	//��� �� ����� ��� �� � ��������� ��������� ����������� ������?
	Info_ClearChoices(DIA_Garwig_SLEEP);
	Info_AddChoice(DIA_Garwig_SLEEP,"�� ������������� ������� �� �����?",DIA_Garwig_SLEEP_AGAIN);
};

func void DIA_Garwig_SLEEP_AGAIN()
{
	AI_Output(other,self,"DIA_Garwig_SLEEP_AGAIN_15_00");	//�� ������������� ������� �� �����?
	AI_Output(self,other,"DIA_Garwig_SLEEP_AGAIN_06_01");	//���. ���� ����� ������, �� �������� ���� ���������.
	AI_Output(self,other,"DIA_Garwig_SLEEP_AGAIN_06_02");	//�� � �� ���������, ���� ����� ���� ��� ���� � ������������, � � ������� �� �����.
};


instance DIA_Garwig_THIEF(C_Info)
{
	npc = Nov_608_Garwig;
	nr = 2;
	condition = DIA_Garwig_THIEF_Condition;
	information = DIA_Garwig_THIEF_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Garwig_THIEF_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Npc_HasItems(hero,Holy_Hammer_MIS) == 1))
	{
		return TRUE;
	};
};

func void DIA_Garwig_THIEF_Info()
{
	if(Hammer_Taken == TRUE)
	{
		AI_Output(self,other,"DIA_Garwig_THIEF_06_00");	//(������������) ���! �� �������� �� ������ ���� � ����, �� � ���� ���������!
		AI_Output(self,other,"DIA_Garwig_THIEF_06_01");	//�� ����������� �� ��� ������������. �, �������� ������� - ����� ��� ���� �����!
	}
	else
	{
		AI_Output(self,other,"DIA_Garwig_THIEF_06_02");	//(� ��������) ����� �����! ��� ��� ����� ���������?
		AI_Output(self,other,"DIA_Garwig_THIEF_06_03");	//� �������� ���������. ����� ������� ����!
	};
};


instance DIA_Garwig_Abgeben(C_Info)
{
	npc = Nov_608_Garwig;
	nr = 2;
	condition = DIA_Garwig_Abgeben_Condition;
	information = DIA_Garwig_Abgeben_Info;
	permanent = TRUE;
	description = "� ������ ����� �����.";
};


func int DIA_Garwig_Abgeben_Condition()
{
	if(Npc_HasItems(other,Holy_Hammer_MIS) >= 1)
	{
		return TRUE;
	};
};

func void DIA_Garwig_Abgeben_Info()
{
	AI_Output(other,self,"DIA_Garwig_Abgeben_15_00");	//� ������ ����� �����.
	if(Hammer_Taken == TRUE)
	{
		AI_Output(self,other,"DIA_Garwig_Abgeben_06_01");	//�� �� ������ ���!
	}
	else
	{
		AI_Output(self,other,"DIA_Garwig_Abgeben_06_02");	//��� ��� �� ���� ���...
	};
	AI_Output(self,other,"DIA_Garwig_Abgeben_06_03");	//�� � �� ������ ������ ����. ����� ����� ������ ����, � �� �������� ����������� ����!
	B_GiveInvItems(other,self,Holy_Hammer_MIS,1);
	Hammer_Taken = FALSE;
};


instance DIA_Garwig_PICKPOCKET(C_Info)
{
	npc = Nov_608_Garwig;
	nr = 900;
	condition = DIA_Garwig_PICKPOCKET_Condition;
	information = DIA_Garwig_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Garwig_PICKPOCKET_Condition()
{
	return C_Beklauen(52,80);
};

func void DIA_Garwig_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Garwig_PICKPOCKET);
	Info_AddChoice(DIA_Garwig_PICKPOCKET,Dialog_Back,DIA_Garwig_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Garwig_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Garwig_PICKPOCKET_DoIt);
};

func void DIA_Garwig_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Garwig_PICKPOCKET);
};

func void DIA_Garwig_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Garwig_PICKPOCKET);
};

