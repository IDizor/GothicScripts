
instance DIA_Dyrian_EXIT(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 999;
	condition = DIA_Dyrian_EXIT_Condition;
	information = DIA_Dyrian_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dyrian_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Dyrian_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Dyrian_Hello(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 2;
	condition = DIA_Dyrian_Hello_Condition;
	information = DIA_Dyrian_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dyrian_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_RUNE == FALSE) && (MIS_SCHNITZELJAGD == FALSE) && (MIS_GOLEM == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_Hello_Info()
{
	AI_Output(self,other,"DIA_Dyrian_Hello_13_00");	//(��������) ��� ���� �����?
};


instance DIA_Dyrian_Wurst(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 3;
	condition = DIA_Dyrian_Wurst_Condition;
	information = DIA_Dyrian_Wurst_Info;
	permanent = FALSE;
	description = "� ��������� �������������� �������.";
};


func int DIA_Dyrian_Wurst_Condition()
{
	if((Kapitel == 1) && (MIS_GoraxEssen == LOG_Running) && (Npc_HasItems(self,ItFo_Schafswurst) == 0) && (Npc_HasItems(other,ItFo_Schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_Wurst_Info()
{
	var string NovizeText;
	var string NovizeLeft;
	AI_Output(other,self,"DIA_Dyrian_Wurst_15_00");	//� ��������� �������������� �������.
	AI_Output(self,other,"DIA_Dyrian_Wurst_13_01");	//�������. �������, ��� �� ��������� �������, ��� � ������ �����.
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	Wurst_Gegeben = Wurst_Gegeben + 1;
	CreateInvItems(self,ItFo_Sausage,1);
	B_UseItem(self,ItFo_Sausage);
	NovizeLeft = IntToString(13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft,PRINT_NovizenLeft);
	AI_PrintScreen(NovizeText,-1,YPOS_GoldGiven,FONT_ScreenSmall,2);
};


instance DIA_Dyrian_Job(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 1;
	condition = DIA_Dyrian_Job_Condition;
	information = DIA_Dyrian_Job_Info;
	permanent = FALSE;
	description = "��� �� ������� �����?";
};


func int DIA_Dyrian_Job_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Dyrian_Hello) && (MIS_RUNE == FALSE) && (MIS_SCHNITZELJAGD == FALSE) && (MIS_GOLEM == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_Job_Info()
{
	AI_Output(other,self,"DIA_Dyrian_Job_15_00");	//��� �� ������� �����?
	AI_Output(self,other,"DIA_Dyrian_Job_13_01");	//� ������. � ������� ������� ��������� � ���������.
	AI_Output(self,other,"DIA_Dyrian_Job_13_02");	//������ � ��� ������� ������� ������. �� ����, ������� �� ���� � ���������.
};


instance DIA_Dyrian_WhatDone(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 3;
	condition = DIA_Dyrian_WhatDone_Condition;
	information = DIA_Dyrian_WhatDone_Info;
	permanent = FALSE;
	description = "�������� ���, ��� ���������.";
};


func int DIA_Dyrian_WhatDone_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dyrian_Job) && (MIS_RUNE == FALSE) && (MIS_SCHNITZELJAGD == FALSE) && (MIS_GOLEM == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_WhatDone_Info()
{
	AI_Output(other,self,"DIA_Dyrian_WhatDone_15_00");	//�������� ���, ��� ���������.
	AI_Output(self,other,"DIA_Dyrian_WhatDone_13_01");	//� ���� ����� � ������� ������ �� �����, ����� �������� ���, ����� �������� �� �� ������.
	AI_Output(self,other,"DIA_Dyrian_WhatDone_13_02");	//������ ������, ������� ��, ����� ������� ������� � ������� ���� �� ���� �����.
	AI_Output(self,other,"DIA_Dyrian_WhatDone_13_03");	//�� ������ ���� ����������, � ������. � ����� �� ������ ���� � ���� �����, ����� � ����� ��� �����.
	AI_Output(self,other,"DIA_Dyrian_WhatDone_13_04");	//�� ����� ���������� � ������� �� ���� ������� ������. ������ ��� ������, ���� �� � �������� � ���������.
};


instance DIA_Dyrian_CanHelp(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 4;
	condition = DIA_Dyrian_CanHelp_Condition;
	information = DIA_Dyrian_CanHelp_Info;
	permanent = TRUE;
	description = "� ���� ���� ���-������ ������?";
};


func int DIA_Dyrian_CanHelp_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Dyrian_Job) && (MIS_RUNE == FALSE) && (MIS_SCHNITZELJAGD == FALSE) && (MIS_GOLEM == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_CanHelp_Info()
{
	AI_Output(other,self,"DIA_Dyrian_CanHelp_15_00");	//� ���� ���� ���-������ ������?
	AI_Output(self,other,"DIA_Dyrian_CanHelp_13_01");	//���, ��� ������ ������� ������ ������ �� ������� ������ � �����.
};


instance DIA_Dyrian_Scroll(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 1;
	condition = DIA_Dyrian_Scroll_Condition;
	information = DIA_Dyrian_Scroll_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dyrian_Scroll_Condition()
{
	if((MIS_SCHNITZELJAGD == LOG_Running) || (MIS_RUNE == LOG_Running) || (MIS_GOLEM == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_Scroll_Info()
{
	AI_Output(self,other,"DIA_Dyrian_Scroll_13_00");	//��, �� ������������� ���������� ��������� �����?
	AI_Output(other,self,"DIA_Dyrian_Scroll_15_01");	//��. � � ������� ������ ���.
	AI_Output(self,other,"DIA_Dyrian_Scroll_13_02");	//������ - ��������, � ���� ������ ���� � ����. � ���� ���� ���� ������ � ����� ������� �����������. ����������� ���. ��, ���?
	Info_ClearChoices(DIA_Dyrian_Scroll);
	Info_AddChoice(DIA_Dyrian_Scroll,"���, ��� �� ����� ���� ������.",DIA_Dyrian_Scroll_No);
	Info_AddChoice(DIA_Dyrian_Scroll,"��� �� ������ �� ���?",DIA_Dyrian_Scroll_How);
	Info_AddChoice(DIA_Dyrian_Scroll,"� ��� ��� ������ � ���?",DIA_Dyrian_Scroll_What);
};

func void DIA_Dyrian_Scroll_What()
{
	AI_Output(other,self,"DIA_Dyrian_Scroll_What_15_00");	//� ��� ��� ������ � ���?
	AI_Output(self,other,"DIA_Dyrian_Scroll_What_13_01");	//��� ������ ����� ���������� �� ������ ��������� ����� � ���������� ��� �� �������� �����. �� ������ ���� �� ���� ������ �����.
	AI_Output(self,other,"DIA_Dyrian_Scroll_What_13_02");	//��� ���� ���� ����� ��������, ���� ���-�� ����� � ���� �� ����...
	AI_Output(other,self,"DIA_Dyrian_Scroll_What_15_03");	//� ��� � �����, ��� ���� �������?
	AI_Output(self,other,"DIA_Dyrian_Scroll_What_13_04");	//�� ����� ���� � �������� ���������� ��� ���������� �� �����. �� ����������� ����������� ��������� � ��� ���� �������.
};

func void DIA_Dyrian_Scroll_No()
{
	AI_Output(other,self,"DIA_Dyrian_Scroll_No_15_00");	//���, ��� �� ����� ���� ������.
	AI_Output(self,other,"DIA_Dyrian_Scroll_No_13_01");	//�� ������ ���������� �� ��� � ����� �����, ���� �����������.
	Info_ClearChoices(DIA_Dyrian_Scroll);
};

func void DIA_Dyrian_Scroll_How()
{
	AI_Output(other,self,"DIA_Dyrian_Scroll_How_15_00");	//��� �� ������ �� ����?
	AI_Output(self,other,"DIA_Dyrian_Scroll_How_13_01");	//� ������� ����� ������������ ���� ���� ����� �� ���� �������.
	AI_Output(self,other,"DIA_Dyrian_Scroll_How_13_02");	//� ���� �� ������������� �������� ��������� �����, �� ������ ��������, ����� � ������� � ���������.
	Info_ClearChoices(DIA_Dyrian_Scroll);
	Info_AddChoice(DIA_Dyrian_Scroll,"���, ��� �� ����� ���� ������.",DIA_Dyrian_Scroll_No);
	Info_AddChoice(DIA_Dyrian_Scroll,"������, ����� ��� ���� ������.",DIA_Dyrian_Scroll_Yes);
};

func void DIA_Dyrian_Scroll_Yes()
{
	AI_Output(other,self,"DIA_Dyrian_Scroll_Yes_15_00");	//������, ����� ��� ���� ������.
	AI_Output(self,other,"DIA_Dyrian_Scroll_Yes_13_01");	//����� ���� � ���� ���������. �� ������� ���� �����.
	B_GiveInvItems(self,other,ItSc_Sleep,1);
	MIS_HelpDyrian = LOG_Running;
	Log_CreateTopic(Topic_DyrianDrin,LOG_MISSION);
	Log_SetTopicStatus(Topic_DyrianDrin,LOG_Running);
	B_LogEntry(Topic_DyrianDrin,"������ ��� ��� ������ � ����������� ���. ������, �� �����, ����� ���� � ����� �����, � �������� �� ���� �������� � �� ������� � ���������.");
	Info_ClearChoices(DIA_Dyrian_Scroll);
};


instance DIA_Dyrian_Doch(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 4;
	condition = DIA_Dyrian_Doch_Condition;
	information = DIA_Dyrian_Doch_Info;
	permanent = TRUE;
	description = "� ���������. ����� ��� ��� ���������� ���.";
};


func int DIA_Dyrian_Doch_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Dyrian_Scroll) && (MIS_HelpDyrian != LOG_Running) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_Doch_Info()
{
	AI_Output(other,self,"DIA_Dyrian_Doch_15_00");	//� ���������. ����� ��� ��� ���������� ���.
	AI_Output(self,other,"DIA_Dyrian_Doch_13_01");	//������, ���� �� �������� ���������, �� ��������� �� ���� ��������, � ���� ������� � ���������.
	B_GiveInvItems(self,other,ItSc_Sleep,1);
	MIS_HelpDyrian = LOG_Running;
};


instance DIA_Dyrian_HelloAgain(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 2;
	condition = DIA_Dyrian_HelloAgain_Condition;
	information = DIA_Dyrian_HelloAgain_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dyrian_HelloAgain_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (other.guild == GIL_KDF) && (MIS_HelpDyrian == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_HelloAgain_Info()
{
	AI_Output(self,other,"DIA_Dyrian_HelloAgain_13_00");	//(��������) �������! �� ���� ����!
	AI_Output(self,other,"DIA_Dyrian_HelloAgain_13_01");	//(���������) �� - ����� �������� ����, ������. � �� ����� ���������� ����������.
	AI_Output(self,other,"DIA_Dyrian_HelloAgain_13_02");	//(� ���������) � ��������� ���� �� ��, ��� ��� ��������� �������� � ���������. ��� ����� ������ �����������...
	B_GivePlayerXP(XP_Ambient);
	AI_StopProcessInfos(self);
};

func void B_Dyrian_PlayerHowIsIt()
{
	AI_Output(other,self,"DIA_Dyrian_HowIsIt_15_00");	//��� ����?
};


instance DIA_Dyrian_HowIsIt(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 3;
	condition = DIA_Dyrian_HowIsIt_Condition;
	information = DIA_Dyrian_HowIsIt_Info;
	permanent = TRUE;
	description = "��� ����?";
};


func int DIA_Dyrian_HowIsIt_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dyrian_HelloAgain))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_HowIsIt_Info()
{
	B_Dyrian_PlayerHowIsIt();
	AI_Output(self,other,"DIA_Dyrian_HowIsIt_13_01");	//������. ��� ����� �������� ��� ������, ������.
	AI_StopProcessInfos(self);
};


instance DIA_Dyrian_other(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 3;
	condition = DIA_Dyrian_other_Condition;
	information = DIA_Dyrian_other_Info;
	permanent = TRUE;
	description = "��� ����?";
};


func int DIA_Dyrian_other_Condition()
{
	if((other.guild != GIL_KDF) && (other.guild != GIL_NOV) && (other.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_other_Info()
{
	B_Dyrian_PlayerHowIsIt();
	AI_Output(self,other,"DIA_Dyrian_HowIsIt_13_02");	//� ���������� ������ �� ��, ��� ���� ���� � ���������.
	AI_StopProcessInfos(self);
};


instance DIA_Dyrian_Kneipe(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 3;
	condition = DIA_Dyrian_Kneipe_Condition;
	information = DIA_Dyrian_Kneipe_Info;
	permanent = TRUE;
	description = "��� ����?";
};


func int DIA_Dyrian_Kneipe_Condition()
{
	if((MIS_HelpDyrian == LOG_FAILED) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_Kneipe_Info()
{
	AI_Output(other,self,"DIA_Dyrian_Kneipe_15_00");	//��� ����?
	AI_Output(self,other,"DIA_Dyrian_Kneipe_13_01");	//�� ��� �����������? � ��� �������� �� ����, � �� ������ ���� � ����.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_13_02");	//������ ��� ������ �� ��������, ����� ��� �������� ���� ���� �����. � � ���� ������� ��!
	Info_ClearChoices(DIA_Dyrian_Kneipe);
	Info_AddChoice(DIA_Dyrian_Kneipe,"���, ����� 5 �������.",DIA_Dyrian_Kneipe_Gold);
	Info_AddChoice(DIA_Dyrian_Kneipe,"� ���� ��� ���������.",DIA_Dyrian_Kneipe_CanExplain);
	Info_AddChoice(DIA_Dyrian_Kneipe,"����� �� ������ �������.",DIA_Dyrian_Kneipe_ShutUp);
};

func void DIA_Dyrian_Kneipe_Gold()
{
	AI_Output(other,self,"DIA_Dyrian_Kneipe_Gold_15_00");	//���, ����� 5 �������.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_Gold_13_01");	//(������) 5 �������? �� ����� ��� 5 ������� � �������� ����������� �� ��, ��� ����� ���� ������ ���� �����?
	AI_Output(self,other,"DIA_Dyrian_Kneipe_Gold_13_02");	//� ������ ��� ���� ������!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,0);
};

func void DIA_Dyrian_Kneipe_CanExplain()
{
	AI_Output(other,self,"DIA_Dyrian_Kneipe_CanExplain_15_00");	//� ���� ��� ���������.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_CanExplain_13_01");	//��� �� ����� ���� ����������.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_CanExplain_13_02");	//�� ����� ������ ���, ����� ���������� ���� ������� ���. � ������ ������ ����.
	AI_StopProcessInfos(self);
};

func void DIA_Dyrian_Kneipe_ShutUp()
{
	AI_Output(other,self,"DIA_Dyrian_Kneipe_ShutUp_15_00");	//����� �� ������ �������.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_ShutUp_13_01");	//��, �����, ������� ���! ��� ��� ����� ���� �� �������.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_ShutUp_13_02");	//� ���� ��������, ����� �� ���������� �������! ��� ������ �������� ��� �������...
	AI_Output(self,other,"DIA_Dyrian_Kneipe_ShutUp_13_03");	//� ������ �������� � ���� ����, �� ��� ��������!
	AI_StopProcessInfos(self);
};


instance DIA_Dyrian_nachher(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 3;
	condition = DIA_Dyrian_nachher_Condition;
	information = DIA_Dyrian_nachher_Info;
	permanent = TRUE;
	description = "��� ����������?";
};


func int DIA_Dyrian_nachher_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dyrian_Kneipe))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_nachher_Info()
{
	AI_Output(other,self,"DIA_Dyrian_nachher_15_00");	//��� � �����?
	AI_Output(self,other,"DIA_Dyrian_nachher_13_01");	//��, ������ ���� � �����! � ���� ����� ���� �� ����!
	AI_StopProcessInfos(self);
};


instance DIA_Dyrian_PICKPOCKET(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 900;
	condition = DIA_Dyrian_PICKPOCKET_Condition;
	information = DIA_Dyrian_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Dyrian_PICKPOCKET_Condition()
{
	return C_Beklauen(10,15);
};

func void DIA_Dyrian_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Dyrian_PICKPOCKET);
	Info_AddChoice(DIA_Dyrian_PICKPOCKET,Dialog_Back,DIA_Dyrian_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Dyrian_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Dyrian_PICKPOCKET_DoIt);
};

func void DIA_Dyrian_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Dyrian_PICKPOCKET);
};

func void DIA_Dyrian_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Dyrian_PICKPOCKET);
};

