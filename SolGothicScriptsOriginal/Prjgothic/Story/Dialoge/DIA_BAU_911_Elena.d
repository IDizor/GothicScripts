
instance DIA_Elena_EXIT(C_Info)
{
	npc = BAU_911_Elena;
	nr = 999;
	condition = DIA_Elena_EXIT_Condition;
	information = DIA_Elena_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Elena_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Elena_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Elena_HALLO(C_Info)
{
	npc = BAU_911_Elena;
	nr = 1;
	condition = DIA_Elena_HALLO_Condition;
	information = DIA_Elena_HALLO_Info;
	permanent = FALSE;
	description = "������, ���������.";
};


func int DIA_Elena_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Elena_HALLO_Info()
{
	AI_Output(other,self,"DIA_Elena_HALLO_15_00");	//������, ���������.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Elena_HALLO_16_01");	//��. ������ ��� �� ������?
	}
	else
	{
		AI_Output(self,other,"DIA_Elena_HALLO_16_02");	//��� ���� �����?
	};
};


instance DIA_Elena_Aufstand(C_Info)
{
	npc = BAU_911_Elena;
	nr = 2;
	condition = DIA_Elena_Aufstand_Condition;
	information = DIA_Elena_Aufstand_Info;
	permanent = FALSE;
	description = "�������, ��� �� �������� ������ ������?";
};


func int DIA_Elena_Aufstand_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Elena_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Elena_Aufstand_Info()
{
	AI_Output(other,self,"DIA_Elena_Aufstand_15_00");	//�������, ��� �� �������� ������ ������?
	AI_Output(self,other,"DIA_Elena_Aufstand_16_01");	//��� ���� �����, ��� ������ ����� �������� ���� �����.
	if(other.guild != GIL_MIL)
	{
		AI_Output(self,other,"DIA_Elena_Aufstand_16_02");	//��������� ������� �� �������� ���. ��� ��������� ���� ������, ����� ������� ��������.
	};
};


instance DIA_Elena_Arbeit(C_Info)
{
	npc = BAU_911_Elena;
	nr = 3;
	condition = DIA_Elena_Arbeit_Condition;
	information = DIA_Elena_Arbeit_Info;
	permanent = FALSE;
	description = "�����, �� �����, ���� �����-������ ������?";
};


func int DIA_Elena_Arbeit_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Elena_HALLO) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Elena_Arbeit_Info()
{
	AI_Output(other,self,"DIA_Elena_Arbeit_15_00");	//�����, �� �����, ���� �����-������ ������?
	AI_Output(self,other,"DIA_Elena_Arbeit_16_01");	//��� ���� ������ ������ ����, ��� �������� �������� �����.
	AI_Output(self,other,"DIA_Elena_Arbeit_16_02");	//���� ��� ���������? �� �� ����� �� ��������, ���������� � ������ � ����.
	AI_Output(other,self,"DIA_Elena_Arbeit_15_03");	//������� ������ ���� ����?
	AI_Output(self,other,"DIA_Elena_Arbeit_16_04");	//���� ����� �������� ���� ������ � ���.
	AI_Output(self,other,"DIA_Elena_Arbeit_16_05");	//� ���� ������, ��� ��������� ������ ���������.
};


instance DIA_Elena_Regeln(C_Info)
{
	npc = BAU_911_Elena;
	nr = 4;
	condition = DIA_Elena_Regeln_Condition;
	information = DIA_Elena_Regeln_Info;
	permanent = FALSE;
	description = "����� ���� �����-������ �������, ������� ��� ����� ��������������?";
};


func int DIA_Elena_Regeln_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Elena_HALLO) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Elena_Regeln_Info()
{
	AI_Output(other,self,"DIA_Elena_Regeln_15_00");	//����� ���� �����-������ �������, ������� ��� ����� ��������������?
	AI_Output(self,other,"DIA_Elena_Regeln_16_01");	//�� ������ ����, ��� ���� �� �����������.
	AI_Output(self,other,"DIA_Elena_Regeln_16_02");	//�� ��� ���� ��� � ����� ����.
	AI_Output(self,other,"DIA_Elena_Regeln_16_03");	//� ���� ���� ������� ���������, ������ � ����������.
	AI_Output(self,other,"DIA_Elena_Regeln_16_04");	//���� �� ������� ����� � ��������, ��� ����� ����� ������ ����.
};


instance DIA_Elena_AUFGABE(C_Info)
{
	npc = BAU_911_Elena;
	nr = 5;
	condition = DIA_Elena_AUFGABE_Condition;
	information = DIA_Elena_AUFGABE_Info;
	permanent = FALSE;
	description = "��� �� ������� �����?";
};


func int DIA_Elena_AUFGABE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Elena_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Elena_AUFGABE_Info()
{
	AI_Output(other,self,"DIA_Elena_AUFGABE_15_00");	//� ��� �� �����������?
	AI_Output(self,other,"DIA_Elena_AUFGABE_16_01");	//� ������ ��, ��� �� ���������� �� �����. ���� �������� ������ ���-������, ��� ��� �����.
	AI_Output(self,other,"DIA_Elena_AUFGABE_16_02");	//�� � ���� ������������ ����. � �� ����� ����������� � �� �������� ���������. �������?
	Log_CreateTopic(Topic_SoldierTrader,LOG_NOTE);
	B_LogEntry(Topic_SoldierTrader,"����� ������� ������ �� ����� �����.");
};


var int Elena_Trade_mit_mir;

instance DIA_Elena_TRADE(C_Info)
{
	npc = BAU_911_Elena;
	nr = 7;
	condition = DIA_Elena_TRADE_Condition;
	information = DIA_Elena_TRADE_Info;
	permanent = TRUE;
	description = "������ ��� ���� ������!";
	trade = TRUE;
};


func int DIA_Elena_TRADE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Elena_AUFGABE) || (Elena_Trade_mit_mir == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Elena_TRADE_Info()
{
	AI_Output(other,self,"DIA_Elena_TRADE_15_00");	//������ ��� ���� ������!
	B_GiveTradeInv(self);
	AI_Output(self,other,"DIA_Elena_TRADE_16_01");	//�������.
};


instance DIA_Elena_PERM(C_Info)
{
	npc = BAU_911_Elena;
	nr = 900;
	condition = DIA_Elena_PERM_Condition;
	information = DIA_Elena_PERM_Info;
	permanent = TRUE;
	description = "������ ����������� ��������� ����� �� ����?";
};


func int DIA_Elena_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Elena_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Elena_PERM_Info()
{
	AI_Output(other,self,"DIA_Elena_PERM_15_00");	//������ ����������� ��������� ����� �� ����?
	if(Kapitel <= 1)
	{
		AI_Output(self,other,"DIA_Elena_PERM_16_01");	//��������� ���� ����� ��� ���� �������, ��� ��� ������ ������ ������ ��������� ������.
		AI_Output(self,other,"DIA_Elena_PERM_16_02");	//������� � ������ ��� ����� �� ����� � ������ ������ ������ �����.
		Elena_Trade_mit_mir = TRUE;
	}
	else if(Kapitel == 2)
	{
		AI_Output(self,other,"DIA_Elena_PERM_16_03");	//��������� ��������� �� �������� ����� ���������� ��� ���� � ����. ��� ������ ������ �������, ����� ��� ���� ���������.
	}
	else if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_Elena_PERM_16_04");	//����� ����� ����� ����� �������. ����� �� ������������ ������ �������� �� ������ ����. ��� ����� ����� �� ��� �� ��� � ������.
	}
	else if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_Elena_PERM_16_05");	//�������� ���������� ��� ����� � ����� ��������. �� � ��� ���, ��� ���� ������� �� ������ �������, ��� ����� ������� �����������.
	}
	else
	{
		AI_Output(self,other,"DIA_Elena_PERM_16_06");	//��� ������ � �������, ��� � ������ ��������� �����. �� � �� �����-�� ���� � ���. � �����, ��� �����, �� �����, �� � ������������.
	};
};


instance DIA_Elena_MINENANTEIL(C_Info)
{
	npc = BAU_911_Elena;
	nr = 2;
	condition = DIA_Elena_MINENANTEIL_Condition;
	information = DIA_Elena_MINENANTEIL_Info;
	description = "�� �������� �����?";
};


func int DIA_Elena_MINENANTEIL_Condition()
{
	if((hero.guild == GIL_KDF) && (MIS_Serpentes_MinenAnteil_KDF == LOG_Running) && Npc_KnowsInfo(other,DIA_Elena_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Elena_MINENANTEIL_Info()
{
	AI_Output(other,self,"DIA_Elena_MINENANTEIL_15_00");	//�� �������� ����� ����?
	AI_Output(self,other,"DIA_Elena_MINENANTEIL_16_01");	//�� � ���? � ���� �� ������ � ������� ��������.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Elena_PICKPOCKET(C_Info)
{
	npc = BAU_911_Elena;
	nr = 900;
	condition = DIA_Elena_PICKPOCKET_Condition;
	information = DIA_Elena_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40_Female;
};


func int DIA_Elena_PICKPOCKET_Condition()
{
	return C_Beklauen(30,35);
};

func void DIA_Elena_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Elena_PICKPOCKET);
	Info_AddChoice(DIA_Elena_PICKPOCKET,Dialog_Back,DIA_Elena_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Elena_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Elena_PICKPOCKET_DoIt);
};

func void DIA_Elena_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Elena_PICKPOCKET);
};

func void DIA_Elena_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Elena_PICKPOCKET);
};

