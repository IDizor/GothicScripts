
instance DIA_Addon_Fisk_EXIT(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 999;
	condition = DIA_Addon_Fisk_EXIT_Condition;
	information = DIA_Addon_Fisk_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Fisk_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Fisk_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Fisk_PICKPOCKET(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 900;
	condition = DIA_Addon_Fisk_PICKPOCKET_Condition;
	information = DIA_Addon_Fisk_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_120;
};


func int DIA_Addon_Fisk_PICKPOCKET_Condition()
{
	return C_Beklauen(118,300);
};

func void DIA_Addon_Fisk_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Fisk_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Fisk_PICKPOCKET,Dialog_Back,DIA_Addon_Fisk_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Fisk_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Fisk_PICKPOCKET_DoIt);
};

func void DIA_Addon_Fisk_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Fisk_PICKPOCKET);
};

func void DIA_Addon_Fisk_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Fisk_PICKPOCKET);
};


instance DIA_Addon_Fisk_Hi(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 1;
	condition = DIA_Addon_Fisk_Hi_Condition;
	information = DIA_Addon_Fisk_Hi_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Fisk_Hi_Condition()
{
	if(Npc_GetDistToWP(self,"BL_INN_UP_06") > 500)
	{
		return TRUE;
	};
};

func void DIA_Addon_Fisk_Hi_Info()
{
	AI_Output(self,other,"DIA_Addon_Fisk_Hi_12_00");	//��, ���� ���� ����� ��������, �� �� ��� �����.
	AI_Output(self,other,"DIA_Addon_Fisk_Hi_12_01");	//��� ����� ��������� �� ����� ��������. ���� ���� ���-������ �����������, ������.
	Log_CreateTopic(Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry(Topic_Addon_BDT_Trader,"���� ������� ����� ������ ������.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Addon_Fisk_Trade(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 888;
	condition = DIA_Addon_Fisk_Trade_Condition;
	information = DIA_Addon_Fisk_Trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE;
};


func int DIA_Addon_Fisk_Trade_Condition()
{
	if(Npc_GetDistToWP(self,"BL_INN_UP_06") > 500)
	{
		return TRUE;
	};
};

func void DIA_Addon_Fisk_Trade_Info()
{
	B_Say(other,self,"$TRADE_2");
	B_GiveTradeInv(self);
	if(Npc_HasItems(self,ItRw_Bolt) < 50)
	{
		CreateInvItems(self,ItRw_Bolt,50 - Npc_HasItems(self,ItRw_Bolt));
	};
	if(Npc_HasItems(self,ItRw_Arrow) < 50)
	{
		CreateInvItems(self,ItRw_Arrow,50 - Npc_HasItems(self,ItRw_Arrow));
	};
};


instance DIA_Addon_Fisk_Attentat(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 2;
	condition = DIA_Addon_Fisk_Attentat_Condition;
	information = DIA_Addon_Fisk_Attentat_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};


func int DIA_Addon_Fisk_Attentat_Condition()
{
	if(MIS_Judas == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Fisk_Attentat_Info()
{
	B_Say(other,self,"$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Fisk_Attentat_12_00");	//������, � �� ���� � ����� ���� �������� ���������, �������?
	AI_Output(self,other,"DIA_Addon_Fisk_Attentat_12_01");	//� ���� ���� ������. � ���� ��, � ��� ���� ������� ���������.
	AI_Output(other,self,"DIA_Addon_Fisk_Attentat_15_02");	//����� �������?
	AI_Output(self,other,"DIA_Addon_Fisk_Attentat_12_03");	//�� ��������� ������ ������ � �������� �������� ����� �������.
	AI_Output(self,other,"DIA_Addon_Fisk_Attentat_12_04");	//�� ����� � ��� � �� �������! ���� ������� ����� ��� � ����.
	AI_Output(self,other,"DIA_Addon_Fisk_Attentat_12_05");	//���� ��������, � ��� ������ ���-��� �� ���� �� �����!
};


instance DIA_Addon_Fisk_Lieferung(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 3;
	condition = DIA_Addon_Fisk_Lieferung_Condition;
	information = DIA_Addon_Fisk_Lieferung_Info;
	permanent = FALSE;
	description = "��� �� ����� �� ������ ��� ��������?";
};


func int DIA_Addon_Fisk_Lieferung_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Fisk_Attentat))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fisk_Lieferung_Info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Lieferung_15_00");	//��� �� ����� �� ������ ��� ��������?
	AI_Output(self,other,"DIA_Addon_Fisk_Lieferung_12_01");	//����� � ���������. ���-�� ������ ��� �������� ��� ��� �� �������.
	AI_Output(self,other,"DIA_Addon_Fisk_Lieferung_12_02");	//�� ������ �� ����� ���� ����� � �������, � ������, ������� � ��������!
	AI_Output(self,other,"DIA_Addon_Fisk_Lieferung_12_03");	//���� ������� �������� ���-�� �� ������.
	MIS_Lennar_Lockpick = LOG_Running;
	Log_CreateTopic(Topic_Addon_Fisk,LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Fisk,LOG_Running);
	B_LogEntry(TOPIC_Addon_KillJuan,"������ �� ����� ���� �������� ������ � ���������. �� �������� ���-�� �� ������.");
	B_LogEntry(Topic_Addon_Fisk,"������� �� ����� ���� ����� ������� (����� � ���������) � �����. �� �������� ���-�� �� ������.");
};

func void B_Addon_Fisk_AboutJuan()
{
	if(Npc_IsDead(Juan))
	{
		AI_Output(other,self,"DIA_Addon_Fisk_AboutJuan_15_00");	//�� �����.
		AI_Output(self,other,"DIA_Addon_Fisk_AboutJuan_12_01");	//������, ������, �� ������ �� ������ ���������� ��� ������������!
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Fisk_AboutJuan_15_02");	//�� ��� ��� ���...
		AI_Output(self,other,"DIA_Addon_Fisk_AboutJuan_12_03");	//�� ������� ��� ����� � �����?
		AI_Output(other,self,"DIA_Addon_Fisk_AboutJuan_15_04");	//�� ��� �� ����...
		AI_Output(self,other,"DIA_Addon_Fisk_AboutJuan_12_05");	//�� �����. � ��� ��������� � ����� ������...
	};
};

func void B_Addon_Fisk_Belohnung()
{
	AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_00");	//�����, ��� ���� ��� ������������...
	AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_01");	//� ���� ������� ��������� � ����.
	AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_02");	//� �������� � ���, � �� ������� ���� ������ �� �������.
	Huno_ArmorCheap = TRUE;
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_03");	//��, � ������ ��� ���� ������. � �����-�� ������� ��� �� ��������.
		AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_04");	//��� ������������ ����, ������� ����������� � ���� ����� ����������� ����� ������. � �����, �� ������� ��� ����������.
		B_GiveInvItems(self,other,ItMi_RuneBlank,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_05");	//� ��� � ��� ���� ��� ������.
		if(other.HitChance[NPC_TALENT_2H] > other.HitChance[NPC_TALENT_1H])
		{
			B_GiveInvItems(self,other,ItMw_Streitaxt1,1);
		}
		else
		{
			B_GiveInvItems(self,other,ItMw_Bartaxt,1);
		};
	};
	AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_06");	//���� ���� ����. ������ �������, ������� �������� � �� ��� ����.
};


instance DIA_Addon_Fisk_GivePaket(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 4;
	condition = DIA_Addon_Fisk_GivePaket_Condition;
	information = DIA_Addon_Fisk_GivePaket_Info;
	permanent = FALSE;
	description = "� ������ ���� ���� �����.";
};


func int DIA_Addon_Fisk_GivePaket_Condition()
{
	if((MIS_Lennar_Lockpick == LOG_Running) && (Npc_HasItems(other,ItMi_Addon_Lennar_Paket) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fisk_GivePaket_Info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_GivePaket_15_00");	//� ������ ���� ���� �����.
	B_GiveInvItems(other,self,ItMi_Addon_Lennar_Paket,1);
	MIS_Lennar_Lockpick = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_LennarPaket);
	AI_Output(self,other,"DIA_Addon_Fisk_GivePaket_12_01");	//������������! � ��� � ������?
	B_Addon_Fisk_AboutJuan();
	B_Addon_Fisk_Belohnung();
};


instance DIA_Addon_Fisk_PaketOpen(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 5;
	condition = DIA_Addon_Fisk_PaketOpen_Condition;
	information = DIA_Addon_Fisk_PaketOpen_Info;
	permanent = FALSE;
	description = "� ������ ���� �����!";
};


func int DIA_Addon_Fisk_PaketOpen_Condition()
{
	if((MIS_Lennar_Lockpick == LOG_Running) && (LennarPaket_Open == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fisk_PaketOpen_Info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_PaketOpen_15_00");	//� ������ ���� �����!
	AI_Output(self,other,"DIA_Addon_Fisk_PaketOpen_12_01");	//�� �������! ���� �� ��������� ������, ��� ������, �� ��� ��?
	AI_Output(self,other,"DIA_Addon_Fisk_PaketOpen_12_02");	//�������-�� �� ���� �� ������?
	AI_Output(self,other,"DIA_Addon_Fisk_PaketOpen_12_03");	//� ��� ��� ����� �����, ��� � ������?
	B_Addon_Fisk_AboutJuan();
};


instance DIA_Addon_Fisk_GivePicks(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 6;
	condition = DIA_Addon_Fisk_GivePicks_Condition;
	information = DIA_Addon_Fisk_GivePicks_Info;
	permanent = TRUE;
	description = "��� ���� ������ �������...";
};


func int DIA_Addon_Fisk_GivePicks_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Fisk_PaketOpen) && (MIS_Lennar_Lockpick == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fisk_GivePicks_Info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_GivePicks_15_00");	//��� ���� ������ �������...
	if(B_GiveInvItems(other,self,ItKE_lockpick,12))
	{
		AI_Output(self,other,"DIA_Addon_Fisk_GivePicks_12_01");	//����� ������! ���������� �� ��� ���������.
		B_Addon_Fisk_Belohnung();
		MIS_Lennar_Lockpick = LOG_SUCCESS;
		B_GivePlayerXP(XP_Addon_LennarPaket);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Fisk_GivePicks_12_02");	//����� ��� ������ �������! �� �� �� ��������� ���� ��������, �����?
	};
};


instance DIA_Addon_Fisk_Inspektor(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 7;
	condition = DIA_Addon_Fisk_Inspektor_Condition;
	information = DIA_Addon_Fisk_Inspektor_Info;
	permanent = FALSE;
	description = "���� ������� �� ��������!";
};


func int DIA_Addon_Fisk_Inspektor_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Fisk_Lieferung) && Npc_KnowsInfo(other,DIA_Addon_Tom_Esteban))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fisk_Inspektor_Info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Inspektor_15_00");	//���� ������� �� ��������!
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_12_01");	//���?
	AI_Output(other,self,"DIA_Addon_Fisk_Inspektor_15_02");	//�� ����� �� ���� � ���� ����! �� ���� �� ����!
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_12_03");	//������. �� ����. �� � �������, ��� �� ���������, ������ � ���� �� ���� �� ������.
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_12_04");	//������ � ���� ������ �����, ��� �� ���� ��������� �� ��������.
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_12_05");	//� ���� ��� �������� ������� ���� �������� � ��� ������� ��-�� ������ ��������� ����������.
	Info_ClearChoices(DIA_Addon_Fisk_Inspektor);
	Info_AddChoice(DIA_Addon_Fisk_Inspektor,"����������, � � �� ������� �� ��������.",DIA_Addon_Fisk_Inspektor_AntiEsteban);
	Info_AddChoice(DIA_Addon_Fisk_Inspektor,"� �� ���� ����!",DIA_Addon_Fisk_Inspektor_DontBelieve);
	Info_AddChoice(DIA_Addon_Fisk_Inspektor,"�������!",DIA_Addon_Fisk_Inspektor_ISee);
};

func void DIA_Addon_Fisk_Inspektor_ISee()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Inspektor_ISee_15_00");	//�������!
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_ISee_12_01");	//������! � ����� ������, ������� ���� ������. � �� ����, ����� ��� ����������!
	Info_ClearChoices(DIA_Addon_Fisk_Inspektor);
};

func void DIA_Addon_Fisk_Inspektor_DontBelieve()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Inspektor_DontBelieve_15_00");	//� ���� �� ����!
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_DontBelieve_12_01");	//�� ����, ���� ����! �� ������������ ����, ��������, ����������� �� ���� ������ �� ���� �������� - ���� �� ����!
	Info_ClearChoices(DIA_Addon_Fisk_Inspektor);
};

func void DIA_Addon_Fisk_Inspektor_AntiEsteban()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Inspektor_AntiEsteban_15_00");	//����������, � � �� ������� �� ��������.
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_AntiEsteban_12_01");	//���� �� ������ ��� ��������, �����? �� ����� ��� �� �����.
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_AntiEsteban_12_02");	//��� ���� �����: �� ����� ���������� �����.
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_AntiEsteban_12_03");	//����� ���� ������� �� ��������, ������ �� �������. ���� ���.
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_AntiEsteban_12_04");	//� ������ �� ����. �������, ���������� ���.
	Info_ClearChoices(DIA_Addon_Fisk_Inspektor);
};


instance DIA_Addon_Fisk_Meeting(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 2;
	condition = DIA_Addon_Fisk_Meeting_Condition;
	information = DIA_Addon_Fisk_Meeting_Info;
	permanent = FALSE;
	description = "������, �� ����������� ���������!";
};


func int DIA_Addon_Fisk_Meeting_Condition()
{
	if((Npc_GetDistToWP(self,"BL_INN_UP_06") <= 500) && Npc_IsInState(self,ZS_Talk) && (MIS_Judas == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fisk_Meeting_Info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Meeting_15_00");	//������, �� ����������� ���������!
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_12_01");	//��. ������� ����� �� ���� ����. � ��� ��������.
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_12_02");	//�� �� ��������� ������ �� �������� �������� �� ���� �� �������. �� �����,  ����� ��� �������� ������ �� ����.
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_12_03");	//��� �� ����� �������� ���� ���� � ������ ������ � ������� ���� ������ �� �������.
	Info_ClearChoices(DIA_Addon_Fisk_Meeting);
	Info_AddChoice(DIA_Addon_Fisk_Meeting,"��� �� ����������� ������ ������?",DIA_Addon_Fisk_Meeting_now);
	Info_AddChoice(DIA_Addon_Fisk_Meeting,"� ��, � �������, ������ ��� �������������� ������.",DIA_Addon_Fisk_Meeting_You);
	if(!Npc_IsDead(Esteban))
	{
		Info_AddChoice(DIA_Addon_Fisk_Meeting,"������, � ���� ���� ���� ������ ��������.",DIA_Addon_Fisk_Meeting_sell);
	};
};

func void DIA_Addon_Fisk_Meeting_You()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Meeting_You_15_00");	//� ��, � �������, ������ ��� �������������� ������.
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_You_12_01");	//���. � ���� ������� ��������. � ����� ���� ����, ����� ����� ���� ����� �� �����.
};

func void DIA_Addon_Fisk_Meeting_sell()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Meeting_sell_15_00");	//������, � ���� ���� ���� ������ ��������.
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_sell_12_01");	//� ���? ��� � ����? �������, ��� �� ���� ���, ��� ���� �����? ��!
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_sell_12_02");	//������ � �������� ����. � ���� ���� ���� �������?
};

func void DIA_Addon_Fisk_Meeting_now()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Meeting_now_15_00");	//��� �� ����?
	if(!Npc_IsDead(Esteban))
	{
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_01");	//�� ������ �������� � ������ ����. � ��� ������, �� ��� ������ � ������� ��� �����.
		AI_Output(other,self,"DIA_Addon_Fisk_Meeting_now_15_02");	//���� � ��� ��� ���������, �� ��� ���� ����������.
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_03");	//����� �� �� �������. �������. 
		AI_Output(other,self,"DIA_Addon_Fisk_Meeting_now_15_04");	//�������?
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_05");	//�� ���� �������� ���� ������. �� �����, ��� �� ���������� ����� �.
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_06");	//����� ��� ��������, � �� �������� ����� ����� ����, ����� ��������� �� ����. ���-�� � �� � ���� �����.
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_07");	//����� ��� �����, �� ��������� ��������, � � - �����������.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_08");	//������� �����. �������-�� � ����� ����� �������� ����� �����. 
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_09");	//���, �����, ��� ��� ����.
		B_GiveInvItems(self,other,ItMi_Gold,500);
	};
	Info_ClearChoices(DIA_Addon_Fisk_Meeting);
	MIS_Judas = LOG_SUCCESS;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"AMBUSH");
	B_LogEntry(Topic_Addon_Esteban,"��������� �� �������� ������� ����.");
};


instance DIA_Addon_Fisk_Sieg(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 2;
	condition = DIA_Addon_Fisk_Sieg_Condition;
	information = DIA_Addon_Fisk_Sieg_Info;
	permanent = FALSE;
	description = "� ��������� ����� ������ �� ���������. �� �����.";
};


func int DIA_Addon_Fisk_Sieg_Condition()
{
	if((MIS_Judas == LOG_SUCCESS) && Npc_IsDead(Esteban))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fisk_Sieg_Info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Sieg_15_00");	//� ��������� ����� ������ �� ���������. �� �����.
	AI_Output(self,other,"DIA_Addon_Fisk_Sieg_12_01");	//��������� � ����� ����.
	AI_Output(self,other,"DIA_Addon_Fisk_Sieg_12_02");	//� �������, � ���� ��� �����������, �� � � ���� ������, ��� ��� ����� ������������.
	AI_Output(self,other,"DIA_Addon_Fisk_Sieg_12_03");	//� ���� ����� ����������� ����, �� ������, ��� ���� ������.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
	B_GivePlayerXP(XP_Ambient);
};

