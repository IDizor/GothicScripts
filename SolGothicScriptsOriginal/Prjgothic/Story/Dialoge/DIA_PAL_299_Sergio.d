
instance DIA_Sergio_EXIT(C_Info)
{
	npc = PAL_299_Sergio;
	nr = 999;
	condition = DIA_Sergio_EXIT_Condition;
	information = DIA_Sergio_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sergio_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Sergio_EXIT_Info()
{
	if(Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500)
	{
		AI_Output(self,other,"DIA_Sergio_EXIT_04_00");	//�� ������� ����� ���� ����.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Sergio_WELCOME(C_Info)
{
	npc = PAL_299_Sergio;
	nr = 5;
	condition = DIA_Sergio_WELCOME_Condition;
	information = DIA_Sergio_WELCOME_Info;
	important = TRUE;
};


func int DIA_Sergio_WELCOME_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500) && (other.guild == GIL_NOV) && (Npc_KnowsInfo(other,DIA_Sergio_Isgaroth) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sergio_WELCOME_Info()
{
	AI_Output(self,other,"DIA_Sergio_WELCOME_04_00");	//�� �������� � ����� �����, ��� � ���� ������ ����?
};


instance DIA_Sergio_Isgaroth(C_Info)
{
	npc = PAL_299_Sergio;
	nr = 2;
	condition = DIA_Sergio_Isgaroth_Condition;
	information = DIA_Sergio_Isgaroth_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Sergio_Isgaroth_Condition()
{
	if(Npc_KnowsInfo(hero,PC_PrayShrine_Paladine) && (Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500) && (Kapitel == 1))
	{
		return TRUE;
	};
};

func void DIA_Sergio_Isgaroth_Info()
{
	AI_Output(self,other,"DIA_Sergio_Isgaroth_04_00");	//�� ������� �� ���� ���������. � ���������� ���� �� ���. ����� ���, ��� � ���� ������� ��� ����.
	Info_ClearChoices(DIA_Sergio_Isgaroth);
	Info_AddChoice(DIA_Sergio_Isgaroth,"��� ������ ���������� �������������?",DIA_Sergio_Isgaroth_Spende);
	Info_AddChoice(DIA_Sergio_Isgaroth,"�� �� ��� �� ���������� ����� ������ ������?",DIA_Sergio_Isgaroth_XP);
};

func void DIA_Sergio_Isgaroth_Spende()
{
	AI_Output(other,self,"DIA_Sergio_Isgaroth_Spende_15_00");	//��� ������ ���������� �������������?
	AI_Output(self,other,"DIA_Sergio_Isgaroth_Spende_04_01");	//����� ��� ������ �������� ���� ������ ������.
	B_GiveInvItems(self,other,ItMi_Gold,100);
	Info_ClearChoices(DIA_Sergio_Isgaroth);
};

func void DIA_Sergio_Isgaroth_XP()
{
	AI_Output(other,self,"DIA_Sergio_Isgaroth_XP_15_00");	//�� �� ��� �� ���������� ����� ������ ������?
	AI_Output(self,other,"DIA_Sergio_Isgaroth_XP_04_01");	//����� �� ����������, ����������, ����� ����� �� ��� ��������� ���� �����.
	other.HitChance[NPC_TALENT_2H] = other.HitChance[NPC_TALENT_2H] + 2;
	PrintScreen(PRINT_Learn2H,-1,-1,FONT_ScreenSmall,2);
	Info_ClearChoices(DIA_Sergio_Isgaroth);
};


instance DIA_Sergio_Aufgabe(C_Info)
{
	npc = PAL_299_Sergio;
	nr = 3;
	condition = DIA_Sergio_Aufgabe_Condition;
	information = DIA_Sergio_Aufgabe_Info;
	description = "��� ����� ������ � ����������.";
};


func int DIA_Sergio_Aufgabe_Condition()
{
	if((Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500) && (other.guild == GIL_NOV) && Npc_KnowsInfo(other,DIA_Sergio_Isgaroth))
	{
		return TRUE;
	};
};

func void DIA_Sergio_Aufgabe_Info()
{
	AI_Output(other,self,"DIA_Sergio_Aufgabe_15_00");	//��� ����� ������ � ����������.
	AI_Output(self,other,"DIA_Sergio_Aufgabe_04_01");	//��, � �� ���� ���������� ���� ������. ��� ����� �� ������ ������� ��������� ���� �������.
	AI_Output(self,other,"DIA_Sergio_Aufgabe_04_02");	//�� � ���� ������ ����. ��� � ������� �������� � �������� � ���. � ������, ��� ����� ������ � ��������� ��� ������ ���, �� � ������� ��� ������ ����.
	Sergio_Sends = TRUE;
	Wld_InsertNpc(BlackWolf,"NW_PATH_TO_MONASTER_AREA_01");
	Log_CreateTopic(Topic_IsgarothWolf,LOG_MISSION);
	Log_SetTopicStatus(Topic_IsgarothWolf,LOG_Running);
	B_LogEntry(Topic_IsgarothWolf,"������� �������� ���������� ������ � �������. � ������ ����� ���.");
};


instance DIA_Sergio_WHAT(C_Info)
{
	npc = PAL_299_Sergio;
	nr = 3;
	condition = DIA_Sergio_WHAT_Condition;
	information = DIA_Sergio_WHAT_Info;
	description = "��� �� ������� �����?";
};


func int DIA_Sergio_WHAT_Condition()
{
	if((Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Sergio_WHAT_Info()
{
	AI_Output(other,self,"DIA_Sergio_WHAT_15_00");	//��� �� ������� �����?
	AI_Output(self,other,"DIA_Sergio_WHAT_04_01");	//� ������ ������, �����  �� ������� ��� ���� � ��� ����.
	AI_Output(self,other,"DIA_Sergio_WHAT_04_02");	//����� � ���� ����� � ����� ���������� � �������� ���� ��� ������ � ��� ������ �� �����.
	AI_Output(other,self,"DIA_Sergio_WHAT_15_03");	//����� ������?
	AI_Output(self,other,"DIA_Sergio_WHAT_04_04");	//���� ���, ��� ���������� ���� ������. �� �����, ������� ��� ��� ��������� ��������.
};


instance DIA_Sergio_Babo(C_Info)
{
	npc = PAL_299_Sergio;
	nr = 3;
	condition = DIA_Sergio_Babo_Condition;
	information = DIA_Sergio_Babo_Info;
	description = "�� ��� �� �� ������� ������������� ����?";
};


func int DIA_Sergio_Babo_Condition()
{
	if((Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500) && (other.guild == GIL_NOV) && Npc_KnowsInfo(other,DIA_Babo_Anliegen))
	{
		return TRUE;
	};
};

func void DIA_Sergio_Babo_Info()
{
	AI_Output(other,self,"DIA_Sergio_Babo_15_00");	//�� ��� �� �� ������� ������������� ����?
	AI_Output(self,other,"DIA_Sergio_Babo_04_01");	//� ������ �� �� �������� ���?
	AI_Output(other,self,"DIA_Sergio_Babo_15_02");	//� �����, �� ������.
	AI_Output(self,other,"DIA_Sergio_Babo_04_03");	//�������. ������, ���� ��� ��� ����� ������ ��� ����, � ���� ����������� ��� ������ ���� � ������� ���� �����. �� ����� �������� � 5 ����. ������ �������� ��� ���.
	Npc_ExchangeRoutine(self,"TRAIN");
	B_StartOtherRoutine(Babo,"TRAIN");
	B_LogEntry(Topic_BaboTrain,"������ ���������� ������������� � ���� �� ��� ���� ������ ����.");
};


instance DIA_Sergio_WHY(C_Info)
{
	npc = PAL_299_Sergio;
	nr = 4;
	condition = DIA_Sergio_WHY_Condition;
	information = DIA_Sergio_WHY_Info;
	description = "������ �� �� � ������� ����������?";
};


func int DIA_Sergio_WHY_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Sergio_WELCOME) && (Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500))
	{
		return TRUE;
	};
};

func void DIA_Sergio_WHY_Info()
{
	AI_Output(other,self,"DIA_Sergio_WHY_15_00");	//������ �� �� � ������� ����������?
	AI_Output(self,other,"DIA_Sergio_WHY_04_01");	//����� ���������� ������� ��������, ��� � �����, ������ �� ���� ��������, ��� ��, ��������, ����� ������ �����, ��� ��� ��� ����������� ���� ������.
	AI_Output(self,other,"DIA_Sergio_WHY_04_02");	//��, ��������, - ����� ������. ��� ���� - ����� ��� ���. � ��������� ������ � ��� ����� �������� �� �����.
};


instance DIA_Sergio_ORDERS(C_Info)
{
	npc = PAL_299_Sergio;
	nr = 10;
	condition = DIA_Sergio_ORDERS_Condition;
	information = DIA_Sergio_ORDERS_Info;
	permanent = TRUE;
	description = "�� ��� ������� ����� �������?";
};


func int DIA_Sergio_ORDERS_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Sergio_WHY) && (self.aivar[AIV_PARTYMEMBER] == FALSE) && (Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500))
	{
		return TRUE;
	};
};

func void DIA_Sergio_ORDERS_Info()
{
	AI_Output(other,self,"DIA_Sergio_ORDERS_15_00");	//�� ��� ������� ����� �������?
	AI_Output(self,other,"DIA_Sergio_ORDERS_04_01");	//���� ���, � � ���� ���� ����� ����� ���� � ��������.
};


instance DIA_Sergio_Start(C_Info)
{
	npc = PAL_299_Sergio;
	nr = 10;
	condition = DIA_Sergio_Start_Condition;
	information = DIA_Sergio_Start_Info;
	permanent = FALSE;
	description = "�� ������ ������������ ���� � �������.";
};


func int DIA_Sergio_Start_Condition()
{
	if((Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500) && (Sergio_Follow == TRUE) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Sergio_Start_Info()
{
	AI_Output(other,self,"DIA_Sergio_Start_15_00");	//�� ������ ������������ ���� � �������.
	AI_Output(self,other,"DIA_Sergio_Start_04_01");	//������, � ������ ���. � ���� ������, ��� �� ����.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	self.npcType = NPCTYPE_FRIEND;
	Npc_ExchangeRoutine(self,"GUIDE");
};


instance DIA_Sergio_Guide(C_Info)
{
	npc = PAL_299_Sergio;
	nr = 10;
	condition = DIA_Sergio_Guide_Condition;
	information = DIA_Sergio_Guide_Info;
	permanent = TRUE;
	description = "��� ����?";
};


func int DIA_Sergio_Guide_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_GetDistToWP(self,"NW_TO_PASS_01") > 1000))
	{
		return TRUE;
	};
};

func void DIA_Sergio_Guide_Info()
{
	AI_Output(other,self,"DIA_Sergio_Guide_15_00");	//��� ����?
	AI_Output(self,other,"DIA_Sergio_Guide_04_01");	//� ������ ����������� ���� � �������. �� ����� ������� ����� ����������� ������ ���������� ���.
	AI_Output(self,other,"DIA_Sergio_Guide_04_02");	//�� �� ����� ������ �������
	AI_StopProcessInfos(self);
};


instance DIA_Sergio_Ende(C_Info)
{
	npc = PAL_299_Sergio;
	nr = 2;
	condition = DIA_Sergio_Ende_Condition;
	information = DIA_Sergio_Ende_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Sergio_Ende_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_GetDistToWP(self,"NW_TO_PASS_01") <= 1000))
	{
		return TRUE;
	};
};

func void DIA_Sergio_Ende_Info()
{
	AI_Output(self,other,"DIA_Sergio_Ende_04_00");	//�� ������. ��� �� �� ����� ���� � ������ ��������, � �������, ��� �� ������� ������ �����.
	AI_Output(other,self,"DIA_Sergio_Ende_15_01");	//�� ����� - � �������.
	AI_Output(self,other,"DIA_Sergio_Ende_04_02");	//��� � �������. �� �� ������� �� ���� ��� ������.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Sergio_Perm(C_Info)
{
	npc = PAL_299_Sergio;
	nr = 2;
	condition = DIA_Sergio_Perm_Condition;
	information = DIA_Sergio_Perm_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Sergio_Perm_Condition()
{
	if((Kapitel >= 3) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Sergio_Perm_Info()
{
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Sergio_Perm_04_00");	//����� ������, ����. ���� �� ������ ������ ���-������ �� ��������� ����, �������� � ��������.
	}
	else
	{
		AI_Output(self,other,"DIA_Sergio_Perm_04_01");	//� ������ � ����. �� ������ � �����, ������� ��� � ������ ��������. ��� ��������.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Sergio_PICKPOCKET(C_Info)
{
	npc = PAL_299_Sergio;
	nr = 900;
	condition = DIA_Sergio_PICKPOCKET_Condition;
	information = DIA_Sergio_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_Sergio_PICKPOCKET_Condition()
{
	return C_Beklauen(78,85);
};

func void DIA_Sergio_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Sergio_PICKPOCKET);
	Info_AddChoice(DIA_Sergio_PICKPOCKET,Dialog_Back,DIA_Sergio_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Sergio_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Sergio_PICKPOCKET_DoIt);
};

func void DIA_Sergio_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Sergio_PICKPOCKET);
};

func void DIA_Sergio_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Sergio_PICKPOCKET);
};

