
instance DIA_Constantino_EXIT(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 999;
	condition = DIA_Constantino_EXIT_Condition;
	information = DIA_Constantino_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Constantino_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Constantino_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Constantino_PICKPOCKET(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 900;
	condition = DIA_Constantino_PICKPOCKET_Condition;
	information = DIA_Constantino_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Constantino_PICKPOCKET_Condition()
{
	return C_Beklauen(59,90);
};

func void DIA_Constantino_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Constantino_PICKPOCKET);
	Info_AddChoice(DIA_Constantino_PICKPOCKET,Dialog_Back,DIA_Constantino_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Constantino_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Constantino_PICKPOCKET_DoIt);
};

func void DIA_Constantino_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Constantino_PICKPOCKET);
};

func void DIA_Constantino_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Constantino_PICKPOCKET);
};


instance DIA_Constantino_Hallo(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 2;
	condition = DIA_Constantino_Hallo_Condition;
	information = DIA_Constantino_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Constantino_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Constantino_Hallo_Info()
{
	AI_Output(self,other,"DIA_Addon_Constantino_Hallo_10_00");	//��� ���� �����? � �� ����� ���������.
};


instance DIA_Constantino_AboutLehrling(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 1;
	condition = DIA_Constantino_AboutLehrling_Condition;
	information = DIA_Constantino_AboutLehrling_Info;
	permanent = FALSE;
	description = "� ���� ��������� � �������.";
};


func int DIA_Constantino_AboutLehrling_Condition()
{
	return TRUE;
};

func void DIA_Constantino_AboutLehrling_Info()
{
	AI_Output(other,self,"DIA_Constantino_AboutLehrling_15_00");	//� ���� ��������� � �������.
	AI_Output(self,other,"DIA_Constantino_AboutLehrling_10_01");	//������? � ���� �������� �� ������ �����?
};


instance DIA_Constantino_Heilung(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 5;
	condition = DIA_Constantino_Heilung_Condition;
	information = DIA_Constantino_Heilung_Info;
	permanent = FALSE;
	description = "��� ����� �������.";
};


func int DIA_Constantino_Heilung_Condition()
{
	return TRUE;
};

func void DIA_Constantino_Heilung_Info()
{
	AI_Output(other,self,"DIA_Constantino_Heilung_15_00");	//��� ����� �������.
	AI_Output(self,other,"DIA_Constantino_Heilung_10_01");	//�����, �� �����?
	Info_ClearChoices(DIA_Constantino_Heilung);
	Info_AddChoice(DIA_Constantino_Heilung,"� �����-��, ���.",DIA_Constantino_Heilung_Nein);
	Info_AddChoice(DIA_Constantino_Heilung,"��.",DIA_Constantino_Heilung_Ja);
};

func void DIA_Constantino_Heilung_Ja()
{
	AI_Output(other,self,"DIA_Constantino_Heilung_Ja_15_00");	//��.
	if(other.attribute[ATR_HITPOINTS] < other.attribute[ATR_HITPOINTS_MAX])
	{
		AI_Output(self,other,"DIA_Constantino_Heilung_Ja_10_01");	//����� ��� � �������, �� �������� ����. � ��������� ������ ������ �� ��� ���!
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_Heilung_Ja_10_02");	//� ���� ����� ���� ���������� ��������, � � ���� ���� ���� ��������, ��� ������� � �����.
	};
	AI_StopProcessInfos(self);
};

func void DIA_Constantino_Heilung_Nein()
{
	AI_Output(other,self,"DIA_Constantino_Heilung_Nein_15_00");	//� �����-��, ���.
	AI_Output(self,other,"DIA_Constantino_Heilung_Nein_10_01");	//����� ����������, � �� ���� ������������� ����������� ����������� ������.
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Constantino_LestersKraeuter(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 5;
	condition = DIA_Addon_Constantino_LestersKraeuter_Condition;
	information = DIA_Addon_Constantino_LestersKraeuter_Info;
	description = "�� ��������� �����?";
};


func int DIA_Addon_Constantino_LestersKraeuter_Condition()
{
	if((MIS_Constantino_BringHerbs == 0) && (MIS_Addon_Lester_PickForConstantino != 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Constantino_LestersKraeuter_Info()
{
	AI_Output(other,self,"DIA_Addon_Constantino_LestersKraeuter_15_00");	//�� ��������� �����?
	AI_Output(self,other,"DIA_Addon_Constantino_LestersKraeuter_10_01");	//��, ���� ���� ����, ��� ����������...
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Constantino_Trade(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 700;
	condition = DIA_Constantino_Trade_Condition;
	information = DIA_Constantino_Trade_Info;
	permanent = TRUE;
	description = "������ ��� ���� ������.";
	trade = TRUE;
};


func int DIA_Constantino_Trade_Condition()
{
	return TRUE;
};

func void DIA_Constantino_Trade_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other,self,"DIA_Constantino_Trade_15_00");	//������ ��� ���� ������.
	if(Constantino_Logpatch1 == FALSE)
	{
		Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
		B_LogEntry(TOPIC_CityTrader,"����������� ������� ������������ ������.");
		Constantino_Logpatch1 = TRUE;
	};
};


instance DIA_Constantino_BeiDir(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 1;
	condition = DIA_Constantino_BeiDir_Condition;
	information = DIA_Constantino_BeiDir_Info;
	permanent = FALSE;
	description = "� ���� ����� ����� ��������.";
};


func int DIA_Constantino_BeiDir_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Constantino_AboutLehrling) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Constantino_BeiDir_Info()
{
	AI_Output(other,self,"DIA_Constantino_BeiDir_15_00");	//� ���� ����� ����� ��������.
	AI_Output(self,other,"DIA_Constantino_BeiDir_10_01");	//����? ���! � ��� ���-�� ���� ������������ ������������ ����� �������. � ���� ����������.
	AI_Output(self,other,"DIA_Constantino_BeiDir_10_02");	//� �������� ��������� ��� �� ��� ��������, � ����� ���� ����� ���� � ���������.
	AI_Output(self,other,"DIA_Constantino_BeiDir_10_03");	//��� ����� ��������� � ������� � ������� �������!
};


instance DIA_Constantino_ZUSTIMMUNG(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 2;
	condition = DIA_Constantino_ZUSTIMMUNG_Condition;
	information = DIA_Constantino_ZUSTIMMUNG_Info;
	permanent = TRUE;
	description = "� ���� ����� �������� ������ �� ������ ��������.";
};


func int DIA_Constantino_ZUSTIMMUNG_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Constantino_AboutLehrling) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Constantino_ZUSTIMMUNG_Info()
{
	AI_Output(other,self,"DIA_Constantino_ZUSTIMMUNG_15_00");	//� ���� ����� �������� ������ �� ������ ��������.
	AI_Output(self,other,"DIA_Constantino_ZUSTIMMUNG_10_01");	//�� ������ �������� ��� ���������?
	if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
	{
		AI_Output(self,other,"DIA_Constantino_ZUSTIMMUNG_10_02");	//�� - ��� �������� ����� ������, �� ������ ����� �������� ������ �������.
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_ZUSTIMMUNG_10_03");	//�� ��� �� ��������! ��, ��� � ������ � ����, ������� �� � ���� ������.
		AI_Output(self,other,"DIA_Constantino_ZUSTIMMUNG_10_04");	//� �� ���������� �� ��, ����� ���������� ����� ���� ����� ��������� ��������� � ���� ������.
		AI_Output(self,other,"DIA_Constantino_ZUSTIMMUNG_10_05");	//���� �� �� ������� ���� ������ � ����������� ��������� �������, ��� ����� ����� - ���!
	};
	if(Constantino_Logpatch2 == FALSE)
	{
		Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Lehrling,LOG_Running);
		B_LogEntry(TOPIC_Lehrling,"����������� ���� ��� ���� ���������, ���� � �� ��������� �� � ����� ������������ � ������.");
		Constantino_Logpatch2 = TRUE;
	};
};


instance DIA_Constantino_BringHerbs(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 1;
	condition = DIA_Constantino_BringHerbs_Condition;
	information = DIA_Constantino_BringHerbs_Info;
	permanent = FALSE;
	description = "��� ��� ����� �������, ����� ����� ����� ��������?";
};


func int DIA_Constantino_BringHerbs_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Constantino_BeiDir) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Constantino_BringHerbs_Info()
{
	AI_Output(other,self,"DIA_Constantino_BringHerbs_15_00");	//��� ��� ����� �������, ����� ����� ����� ��������?
	AI_Output(self,other,"DIA_Constantino_BringHerbs_10_01");	//� �� ������, ���� ��� ���� �������� �������� �� ���� �������.
	AI_Output(self,other,"DIA_Constantino_BringHerbs_10_02");	//� ������� ������������ ��������� ����. � ��������� ����������� ��� ���� ����� ��������� �������.
	AI_Output(self,other,"DIA_Constantino_BringHerbs_10_03");	//��������, � �������� ���� ���� �� ���� �� ������.
	AI_Output(self,other,"DIA_Constantino_BringHerbs_10_04");	//��� - ��� ������ ����� ������ ��������.
	B_GiveInvItems(self,other,ItWr_Kraeuterliste,1);
	AI_Output(self,other,"DIA_Constantino_BringHerbs_10_05");	//������� ��� ���� �������� ������� ����, �, ��������, � �������� ���� ������ ������ �������.
	MIS_Constantino_BringHerbs = LOG_Running;
	Log_CreateTopic(TOPIC_ConstantinoPlants,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ConstantinoPlants,LOG_Running);
	B_LogEntry(TOPIC_ConstantinoPlants,"����������� ����� �������� �� ������ ���������� ������� ��������, ����� �� �� ������ ���� � �������.");
};


instance DIA_Constantino_HerbsRunning(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 1;
	condition = DIA_Constantino_HerbsRunning_Condition;
	information = DIA_Constantino_HerbsRunning_Info;
	permanent = TRUE;
	description = "������ ��������...";
};


func int DIA_Constantino_HerbsRunning_Condition()
{
	if(MIS_Constantino_BringHerbs == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Constantino_HerbsRunning_Info()
{
	AI_Output(other,self,"DIA_Constantino_HerbsRunning_15_00");	//������ ��������...
	AI_Output(self,other,"DIA_Constantino_HerbsRunning_10_01");	//���� �� �� ������ ��������� ��� ������� ��������������, �� ���� �� ��������� �������� ��������!
	Info_ClearChoices(DIA_Constantino_HerbsRunning);
	Info_AddChoice(DIA_Constantino_HerbsRunning,"�������.",DIA_Constantino_HerbsRunning_Running);
	if((Npc_HasItems(other,ItPl_Mana_Herb_01) > 0) && (Npc_HasItems(other,ItPl_Mana_Herb_02) > 0) && (Npc_HasItems(other,ItPl_Mana_Herb_03) > 0) && (Npc_HasItems(other,ItPl_Health_Herb_01) > 0) && (Npc_HasItems(other,ItPl_Health_Herb_02) > 0) && (Npc_HasItems(other,ItPl_Health_Herb_03) > 0) && (Npc_HasItems(other,ItPl_Dex_Herb_01) > 0) && (Npc_HasItems(other,ItPl_Strength_Herb_01) > 0) && (Npc_HasItems(other,ItPl_Speed_Herb_01) > 0) && (Npc_HasItems(other,ItPl_Temp_Herb) > 0) && (Npc_HasItems(other,ItPl_Perm_Herb) > 0))
	{
		Info_AddChoice(DIA_Constantino_HerbsRunning,"� ������ ��� ��������, ��� �� ������!",DIA_Constantino_HerbsRunning_Success);
	};
};

func void DIA_Constantino_HerbsRunning_Success()
{
	AI_Output(other,self,"DIA_Constantino_HerbsRunning_Success_15_00");	//� ������ ��� ��������, ��� �� ������!
	AI_Output(self,other,"DIA_Constantino_HerbsRunning_Success_10_01");	//���? �� ��������� �������� ����, ��?
	AI_PrintScreen("11 Gegenst�nde gegeben (Pflanzen)",-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
	Npc_RemoveInvItems(other,ItPl_Mana_Herb_01,1);
	Npc_RemoveInvItems(other,ItPl_Mana_Herb_02,1);
	Npc_RemoveInvItems(other,ItPl_Mana_Herb_03,1);
	Npc_RemoveInvItems(other,ItPl_Health_Herb_01,1);
	Npc_RemoveInvItems(other,ItPl_Health_Herb_02,1);
	Npc_RemoveInvItems(other,ItPl_Health_Herb_03,1);
	Npc_RemoveInvItems(other,ItPl_Dex_Herb_01,1);
	Npc_RemoveInvItems(other,ItPl_Strength_Herb_01,1);
	Npc_RemoveInvItems(other,ItPl_Speed_Herb_01,1);
	Npc_RemoveInvItems(other,ItPl_Temp_Herb,1);
	Npc_RemoveInvItems(other,ItPl_Perm_Herb,1);
	CreateInvItems(self,ItPl_Mana_Herb_01,1);
	CreateInvItems(self,ItPl_Mana_Herb_02,1);
	CreateInvItems(self,ItPl_Mana_Herb_03,1);
	CreateInvItems(self,ItPl_Health_Herb_01,1);
	CreateInvItems(self,ItPl_Health_Herb_02,1);
	CreateInvItems(self,ItPl_Health_Herb_03,1);
	CreateInvItems(self,ItPl_Dex_Herb_01,1);
	CreateInvItems(self,ItPl_Strength_Herb_01,1);
	CreateInvItems(self,ItPl_Speed_Herb_01,1);
	CreateInvItems(self,ItPl_Temp_Herb,1);
	CreateInvItems(self,ItPl_Perm_Herb,1);
	AI_Output(self,other,"DIA_Constantino_HerbsRunning_Success_10_02");	//������� ��������! ��� ��� �����, � ���� ����� �������!
	AI_Output(self,other,"DIA_Constantino_HerbsRunning_Success_10_03");	//��� �����, �����, �����-������ �� ���� ������������� ��������� ��������� �������.
	MIS_Constantino_BringHerbs = LOG_SUCCESS;
	B_GivePlayerXP(XP_Constantino_Herbs);
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Lehrling,LOG_Running);
	B_LogEntry(TOPIC_Lehrling,"����������� ������ ���� � �������, ���� ������ ������� ����� �� ������.");
	Info_ClearChoices(DIA_Constantino_HerbsRunning);
};

func void DIA_Constantino_HerbsRunning_Running()
{
	AI_Output(other,self,"DIA_Constantino_HerbsRunning_Running_15_00");	//�������.
	Info_ClearChoices(DIA_Constantino_HerbsRunning);
};


var int Constantino_StartGuild;

instance DIA_Constantino_LEHRLING(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 1;
	condition = DIA_Constantino_LEHRLING_Condition;
	information = DIA_Constantino_LEHRLING_Info;
	permanent = TRUE;
	description = "���� � ������ ����� ����� ��������?";
};


func int DIA_Constantino_LEHRLING_Condition()
{
	if((MIS_Constantino_BringHerbs == LOG_SUCCESS) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Constantino_LEHRLING_Info()
{
	var int stimmen;
	stimmen = 0;
	AI_Output(other,self,"DIA_Constantino_LEHRLING_15_00");	//���� � ������ ����� ����� ��������?
	if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
	{
		AI_Output(self,other,"DIA_Constantino_LEHRLING_10_01");	//��� �������� ����� ������ - ��.
		stimmen = stimmen + 1;
		if(Harad.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_02");	//������ ����� ������, ����� �� ��� �������� �������� ����� � ������ ��������� �����.
			if((MIS_Harad_Orc == LOG_SUCCESS) || (MIS_HakonBandits == LOG_SUCCESS))
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_03");	//�, ������, �� ���� ������� ��� � ����.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_04");	//�� �� �������, ��� �� ����.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_05");	//�� ����� ����������, ��� ������� ���� �� �����.
		};
		if(Bosper.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_06");	//������ ����� �������� ��������� � ����� ������������.
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_07");	//� �������, ��� �� ����� �� ����� ���� � ������� ���.
			if((MIS_Bosper_Bogen == LOG_SUCCESS) || (MIS_Bosper_WolfFurs == LOG_SUCCESS))
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_08");	//�� ��� ��, � ����� ������, �� ����������.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_09");	//���������� ����-���� � ��������� �� ���� �������, �����������, ���������� ���������� �������!
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_10");	//�� ���� ��� ������ ������� ����������, ���� �� ����������� ��� �����.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_11");	//� ������ ���� ���� �� �����.
		};
		if(Thorben.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_12");	//������ - ����� ����������� �������.
			if(MIS_Thorben_GetBlessings == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_13");	//�� ��� ���� ���� �������������. ��� ������� ����.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_14");	//�� ���� ���� ��������� ������ � ������������� �����.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_15");	//������ �� �����, ��� �� �����.
		};
		if(Matteo.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if(MIS_Matteo_Gold == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_16");	//��� �������� ������ - �� ������������ ���� �� ������ ����.
				stimmen = stimmen + 1;
			}
			else if(MIS_Matteo_Gold == LOG_Running)
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_17");	//������ �������, ��� �� ���-�� ������ ���. ���� �� ������ �������� ��� �����, ���� ����� ������ � ��� ��� ������ ��������.
			}
			else
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_18");	//������ �������, ��� ��� �� ������������ � ����� �� ����� ������.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_19");	//������ �������, ��� ������� �� ����� ���� � ����� �����.
		};
		if(stimmen >= 4)
		{
			if(stimmen == 5)
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_20");	//��� ��������, ��� �� ������� ��������� ���� ��������!
			}
			else
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_21");	//������ � ���� ���� ��������� ������� ��������. ����� ����������, ����� ���� �������� � �������.
			};
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_22");	//�� ����� ���������� � �������� � ����?
			Info_ClearChoices(DIA_Constantino_LEHRLING);
			Info_AddChoice(DIA_Constantino_LEHRLING,"��� ����� ������� ��������.",DIA_Constantino_LEHRLING_Later);
			Info_AddChoice(DIA_Constantino_LEHRLING,"��, ������.",DIA_Constantino_LEHRLING_Yes);
		}
		else
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_23");	//����� ����� �������� � ������ ����� ������, ���� ����� �������� ���������, �� ������� ����, ������� ��������.
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_24");	//��� ��������, ��� �� ������ ���������� �� �����, ��� ��� �� ����� �� ���� ���� �����.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_LEHRLING_10_25");	//�� �� ���! �� ���� ����� �����, ��� �� ����������� � ������������ �����, � ��������!
		AI_Output(self,other,"DIA_Constantino_LEHRLING_10_26");	//� �� ������ ���� � �������, ���� �� �� ������� ���� ������ � ����������� ��������� ������.
	};
};

func void DIA_Constantino_LEHRLING_Yes()
{
	AI_Output(other,self,"DIA_Constantino_LEHRLING_Yes_15_00");	//��, ������.
	AI_Output(self,other,"DIA_Constantino_LEHRLING_Yes_10_01");	//������! �������, � �� ������� �� ���� �������.
	AI_Output(self,other,"DIA_Constantino_LEHRLING_Yes_10_02");	//� ����� �������, �� ������ ������� ���� ���� ��������.
	Player_IsApprentice = APP_Constantino;
	Npc_ExchangeRoutine(Lothar,"START");
	Constantino_StartGuild = other.guild;
	Constantino_Lehrling_Day = Wld_GetDay();
	Wld_AssignRoomToGuild("alchemist",GIL_NONE);
	MIS_Apprentice = LOG_SUCCESS;
	B_GivePlayerXP(XP_Lehrling);
	B_LogEntry(Topic_Bonus,"����������� ������ ���� � �������. ������ � ����� ������� � ������� �������.");
	Info_ClearChoices(DIA_Constantino_LEHRLING);
};

func void DIA_Constantino_LEHRLING_Later()
{
	AI_Output(other,self,"DIA_Constantino_LEHRLING_Later_15_00");	//��� ����� ������� ��������.
	AI_Output(self,other,"DIA_Constantino_LEHRLING_Later_10_01");	//������! ���� �� �� ������� ������ ����� ���� ���� ������, ���� ����� ������� ������ ���������.
	Info_ClearChoices(DIA_Constantino_LEHRLING);
};


var int Constantino_MILKommentar;
var int Constantino_INNOSKommentar;

instance DIA_Constantino_AlsLehrling(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 1;
	condition = DIA_Constantino_AlsLehrling_Condition;
	information = DIA_Constantino_AlsLehrling_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Constantino_AlsLehrling_Condition()
{
	if((Player_IsApprentice == APP_Constantino) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Constantino_AlsLehrling_Info()
{
	if(B_GetGreatestPetzCrime(self) > CRIME_NONE)
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_00");	//� ����������� ������� ����, ���� �� ����������� � ������������ � ������.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_01");	//��� � ����� ����� � ����� ���� ������ � ���.
		Constantino_Lehrling_Day = Wld_GetDay();
		AI_StopProcessInfos(self);
	}
	else if((other.guild == GIL_MIL) && (Constantino_StartGuild != GIL_MIL) && (Constantino_MILKommentar == FALSE))
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_02");	//��� �� �������� � ���������? � ��� ������ �� ����.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_03");	//�� ��� ��������� ����� ��������, � ����� ��� ��� ������ ���� � �������� � ���������? �� � �� ����� ������ ���� ������ �� ���.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_04");	//� ������, ��� �� ������ ������ �������������� ������ ����������, � ������ ��������� ��������� ��� �������� � �����.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_05");	//���� ��� ������� ������ ��� ���� - �������� �� ���� ������� ������������, ���� ������ �������� ������ �����!
		Constantino_MILKommentar = TRUE;
		Constantino_Lehrling_Day = Wld_GetDay();
	}
	else if(((other.guild == GIL_NOV) || (other.guild == GIL_KDF) || (other.guild == GIL_PAL)) && (Constantino_StartGuild != GIL_NOV) && (Constantino_StartGuild != GIL_KDF) && (Constantino_StartGuild != GIL_PAL) && (Constantino_INNOSKommentar == FALSE))
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_06");	//� ����, �� �������� � ��������� � ������. � �������, ��� ������, ��� � ����� ������� �� �� ������� ������� ����� �������� ����� ���� ��� �������.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_07");	//�� ��� ��, � ����� �� ������� ����� ������������ ���� �� ����� ����.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_08");	//� ����, �������� �� ���� ����� �����������, �� ������� ����� ���������� ��������, �� ������ ������ ������������ �� ������ ����� �����.
		Constantino_INNOSKommentar = TRUE;
	}
	else if((Constantino_Lehrling_Day <= (Wld_GetDay() - 4)) && (Constantino_INNOSKommentar == FALSE))
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_09");	//��� �� ��������?
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_10");	//� ������ �� ����� ������� �������� �������. ��� ������ �� �������, ��� �� ����������� ����� ��� � �����!
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_11");	//�� ���� �� ������ ��� �����?
		Constantino_Lehrling_Day = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_12");	//����� ��...
		Constantino_Lehrling_Day = Wld_GetDay();
	};
};


instance DIA_Constantino_Aufgaben(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 2;
	condition = DIA_Constantino_Aufgaben_Condition;
	information = DIA_Constantino_Aufgaben_Info;
	permanent = FALSE;
	description = "������ ��� ������?";
};


func int DIA_Constantino_Aufgaben_Condition()
{
	if(Player_IsApprentice == APP_Constantino)
	{
		return TRUE;
	};
};

func void DIA_Constantino_Aufgaben_Info()
{
	AI_Output(other,self,"DIA_Constantino_Aufgaben_15_00");	//������ ��� ������?
	AI_Output(self,other,"DIA_Constantino_Aufgaben_10_01");	//� �������, ��� �� ���� ������� �� �������� ��������, ��� �� ����� ��������� ��� �������� ������ �� ���� � ���� �������.
	AI_Output(self,other,"DIA_Constantino_Aufgaben_10_02");	//����� �� ������� �� ������ ��������� ��������, ������� ��� ����������. ������, � ���� ������� ���� ��������� �������.
	AI_Output(self,other,"DIA_Constantino_Aufgaben_10_03");	//�� ������ �������� � ���� ��������. �� ����������� ������������, �������, ���� �������� �������� ������.
	AI_Output(self,other,"DIA_Constantino_Aufgaben_10_04");	//� � ������, ��� �� ������ ����� ���� ��� ��������������� ��������� ����� ������.
};


instance DIA_Constantino_Mushrooms(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 2;
	condition = DIA_Constantino_Mushrooms_Condition;
	information = DIA_Constantino_Mushrooms_Info;
	permanent = FALSE;
	description = "����� �������� � ������ ���������?";
};


func int DIA_Constantino_Mushrooms_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Constantino_Aufgaben))
	{
		return TRUE;
	};
};

func void DIA_Constantino_Mushrooms_Info()
{
	AI_Output(other,self,"DIA_Constantino_Mushrooms_15_00");	//����� �������� � ������ ���������?
	AI_Output(self,other,"DIA_Constantino_Mushrooms_10_01");	//� ���� �������� ���, ��� �� ��������� ��� - � ���� ������� �� ����� ������� ����.
	AI_Output(self,other,"DIA_Constantino_Mushrooms_10_02");	//�� ��� �������� ������, ��� ��� � ���� ������ ����.
	MIS_Constantino_Mushrooms = LOG_Running;
	Log_CreateTopic(Topic_Bonus,LOG_NOTE);
	B_LogEntry(Topic_Bonus,"� ���� ��������� ����� ����������� �� ����� ������� ����.");
};


instance DIA_Constantino_MushroomsRunning(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 2;
	condition = DIA_Constantino_MushroomsRunning_Condition;
	information = DIA_Constantino_MushroomsRunning_Info;
	permanent = TRUE;
	description = "���� ����� ���� �����...";
};


func int DIA_Constantino_MushroomsRunning_Condition()
{
	if(MIS_Constantino_Mushrooms == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Constantino_MushroomsRunning_Info()
{
	AI_Output(other,self,"DIA_Constantino_MushroomsRunning_15_00");	//���� ����� ���� �����...
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
	Info_AddChoice(DIA_Constantino_MushroomsRunning,"� ��������� �������� ���� ��...",DIA_Constantino_MushroomsRunning_Later);
	if(Player_KnowsDunkelpilzBonus == FALSE)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"������ ��� ����� ��� �����?",DIA_Constantino_MushroomsRunning_Why);
	};
	if((Npc_HasItems(other,ItPl_Mushroom_01) > 0) || (Npc_HasItems(other,ItPl_Mushroom_02) > 0))
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"� ������ ��������� ...",DIA_Constantino_MushroomsRunning_Sell);
	};
};

func void DIA_Constantino_MushroomsRunning_Sell()
{
	var int Dunkelpilz_dabei;
	Dunkelpilz_dabei = FALSE;
	if(Npc_HasItems(other,ItPl_Mushroom_01) > 0)
	{
		AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Sell_15_00");	//� ������ ��������� ������ ������...
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Sell_10_01");	//��! ��� ������ �����! �������! ��� ���� ������!
		Dunkelpilz_dabei = TRUE;
		Constantino_DunkelpilzCounter = Constantino_DunkelpilzCounter + Npc_HasItems(other,ItPl_Mushroom_01);
		B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItPl_Mushroom_01) * Value_Mushroom_01 * 4);
		Npc_RemoveInvItems(other,ItPl_Mushroom_01,Npc_HasItems(other,ItPl_Mushroom_01)); // B_GiveInvItems(other,self,ItPl_Mushroom_01,Npc_HasItems(other,ItPl_Mushroom_01));
	};
	if(Npc_HasItems(other,ItPl_Mushroom_02) > 0)
	{
		if(Dunkelpilz_dabei == TRUE)
		{
			AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Sell_15_02");	//� ��� ��� ������...
		}
		else
		{
			AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Sell_15_03");	//� ���� ����� ��������� ������!
		};
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Sell_10_04");	//��� �� ��� ������, ��� ������ �����, �� � ��� ����� ������ ��.
		B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItPl_Mushroom_02) * Value_Mushroom_02 * 4);
		Npc_RemoveInvItems(other,ItPl_Mushroom_02,Npc_HasItems(other,ItPl_Mushroom_02)); // B_GiveInvItems(other,self,ItPl_Mushroom_02,Npc_HasItems(other,ItPl_Mushroom_02));
	};
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void DIA_Constantino_MushroomsRunning_Why()
{
	AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Why_15_00");	//������ ��� ����� ��� �����?
	if(Constantino_DunkelpilzCounter == 0)
	{
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_01");	//���� �������� �� ��, ��� �� ��� ������, � �� ���� ������� ���� ���.
	}
	else if(Constantino_DunkelpilzCounter >= 50)
	{
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_02");	//������ - � ��� �� ����� ����. �� �� ������ ��������� ��� � �����.
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_03");	//������ ����� ����� ���������� �������. � ������ ���, ����� �� �������� ����� ����, ������� ���� ������� �������������� ����� �����.
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_04");	//� ����� �� ����� ����������� ���������� ���� ������, ���� ���������� ������� ���������...
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_05");	//���� �� � ������ ���� ��� �����, �� �� ������ ��� ��� ����� ���, ����� ���?
		AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Why_15_06");	//��!
		Player_KnowsDunkelpilzBonus = TRUE;
		Info_ClearChoices(DIA_Constantino_MushroomsRunning);
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_07");	//�� ��� ��������� ���� �� ����. ��� �����, ����� ���� ������� � ������������� ����� ����...
	};
};

func void DIA_Constantino_MushroomsRunning_Later()
{
	AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Later_15_00");	//� ��������� �������� ���� ��...
	AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Later_10_01");	//�������! ������� ��� ���, ��� ������ �������...
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};


instance DIA_Constantino_Alchemy(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 2;
	condition = DIA_Constantino_Alchemy_Condition;
	information = DIA_Constantino_Alchemy_Info;
	permanent = FALSE;
	description = "����� ���� ��������� �������!";
};


func int DIA_Constantino_Alchemy_Condition()
{
	if(Player_IsApprentice == APP_Constantino)
	{
		return TRUE;
	};
};

func void DIA_Constantino_Alchemy_Info()
{
	AI_Output(other,self,"DIA_Constantino_Alchemy_15_00");	//����� ���� ��������� �������!
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_01");	//������. ������� ������.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_02");	//��� ����� �������� �� �������� - ��� �������� ��������� �����.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_03");	//�� �������� ������� ��� ���� ���� � ���� - � ������� ���������� ���������� ���� ���� � ������������ �� � ������ �����.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_04");	//����� ����������� ����� �� ������������ �����, ���� ����������� ������������ ��������.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_05");	//�� ������ ����� ���������� ������� � ����� ��������������� �����������.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_06");	//� ���� ������� ���� ������ ����� ��������.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_07");	//�������� �����, ����������������� ���� ���������� ����, � ���� �����, ������� ������������ �� ���� ���� �����������.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_08");	//�� ������ ������� ��� �����.
	Constantino_TeachAlchemy = TRUE;
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_CityTeacher,"����������� ����� ������� ���� ��������� �������.");
};


instance DIA_Constantino_NewRecipes(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 2;
	condition = DIA_Constantino_NewRecipes_Condition;
	information = DIA_Constantino_NewRecipes_Info;
	permanent = FALSE;
	description = "� ���� ������ ����� ������� �����.";
};


func int DIA_Constantino_NewRecipes_Condition()
{
	if((Player_IsApprentice != APP_Constantino) && (Player_IsApprentice > APP_NONE) && (Npc_GetTalentSkill(other,NPC_TALENT_ALCHEMY) > 0))
	{
		return TRUE;
	};
};

func void DIA_Constantino_NewRecipes_Info()
{
	AI_Output(other,self,"DIA_Constantino_NewRecipes_15_00");	//� ���� ������ ����� ������� �����.
	AI_Output(self,other,"DIA_Constantino_NewRecipes_10_01");	//� ���� ���� �����-������ ���� � �������?
	AI_Output(other,self,"DIA_Constantino_NewRecipes_15_02");	//��, ����.
	AI_Output(self,other,"DIA_Constantino_NewRecipes_10_03");	//� �� ��� ��� ���... ��� �������� ����.
	AI_Output(self,other,"DIA_Constantino_NewRecipes_10_04");	//� �����, ��� ���� �������� ���� ��������� ��������. �� ��� �������, ������� ��, �� ����, ��� �� ������ ������.
	Constantino_TeachAlchemy = TRUE;
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_CityTeacher,"����������� ����� ������� ���� ��������� �������.");
};


instance DIA_Constantino_TEACH(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 2;
	condition = DIA_Constantino_TEACH_Condition;
	information = DIA_Constantino_TEACH_Info;
	permanent = TRUE;
	description = "����� �������� �� ������ ������� ����?";
};


func int DIA_Constantino_TEACH_Condition()
{
	if(Constantino_TeachAlchemy == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Constantino_TEACH_Info()
{
	AI_Output(other,self,"DIA_Constantino_TEACH_15_00");	//����� �������� �� ������ ������� ����?
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == TRUE))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_10_01");	//������. � ������ ������ �� ���� ������� ����.
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_10_02");	//���� ��������� - �������.
		Info_ClearChoices(DIA_Constantino_TEACH);
		Info_AddChoice(DIA_Constantino_TEACH,Dialog_Back,DIA_Constantino_Teach_BACK);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice(DIA_Constantino_TEACH,B_BuildLearnString("�������� ��������",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_01)),DIA_Constantino_TEACH_Health01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE))
	{
		Info_AddChoice(DIA_Constantino_TEACH,B_BuildLearnString("�������� ��������",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_02)),DIA_Constantino_TEACH_Health02);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE))
	{
		Info_AddChoice(DIA_Constantino_TEACH,B_BuildLearnString("�������� �������",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_03)),DIA_Constantino_TEACH_Health03);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE))
	{
		Info_AddChoice(DIA_Constantino_TEACH,B_BuildLearnString("������� �����",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Health)),DIA_Constantino_TEACH_PermHealth);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice(DIA_Constantino_TEACH,B_BuildLearnString("�������� ����",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_01)),DIA_Constantino_TEACH_Mana01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE))
	{
		Info_AddChoice(DIA_Constantino_TEACH,B_BuildLearnString("�������� ����",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_02)),DIA_Constantino_TEACH_Mana02);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == FALSE)
	{
		Info_AddChoice(DIA_Constantino_TEACH,B_BuildLearnString("������� ����",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_STR)),DIA_Constantino_TEACH_PermSTR);
	};
};

func void DIA_Constantino_Teach_BACK()
{
	Info_ClearChoices(DIA_Constantino_TEACH);
};

func void DIA_Constantino_TEACH_Health01()
{
	if(B_TeachPlayerTalentAlchemy(self,other,POTION_Health_01))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_Health01_10_00");	//����������� ��� �������� �������� - �������� ����� � ������� �����.
	};
	Info_ClearChoices(DIA_Constantino_TEACH);
};

func void DIA_Constantino_TEACH_Health02()
{
	if(B_TeachPlayerTalentAlchemy(self,other,POTION_Health_02))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_Health02_10_00");	//����� ����������� �������� ��������, ���� ����������� �������� �������� � ������� �����.
		AI_Output(self,other,"DIA_Constantino_TEACH_Health02_10_01");	//�������� ���� �������� ����� ����� ���������.
	};
	Info_ClearChoices(DIA_Constantino_TEACH);
};

func void DIA_Constantino_TEACH_Health03()
{
	if(B_TeachPlayerTalentAlchemy(self,other,POTION_Health_03))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_Health03_10_00");	//��� �������� ��������� �������� ��������� ���� ������ �����.
		AI_Output(self,other,"DIA_Constantino_TEACH_Health03_10_01");	//���� ����������� �������� ����� � ������� �����. ��� ��������� ����� ����� ����� ���� �������� ������������.
	};
	Info_ClearChoices(DIA_Constantino_TEACH);
};

func void DIA_Constantino_TEACH_PermHealth()
{
	if(B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Health))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_PermHealth_10_00");	//������� �����! ������ ������. �� �� ��-�� ��������� ������������� - ��� ����� �� ��� �� ������ �������.
		AI_Output(self,other,"DIA_Constantino_TEACH_PermHealth_10_01");	//�� � ��� ������������ ������ �����������. ���� ����������� �������� ����� � ������� ������.
	};
	Info_ClearChoices(DIA_Constantino_TEACH);
};

func void DIA_Constantino_TEACH_Mana01()
{
	if(B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_01))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_Mana01_10_00");	//�������� ���� - ����� ������� �� ���������� �����.
		AI_Output(self,other,"DIA_Constantino_TEACH_Mana01_10_01");	//������ �������� ������� � ������� ����� � �������� �� �� ��������� ����.
	};
	Info_ClearChoices(DIA_Constantino_TEACH);
};

func void DIA_Constantino_TEACH_Mana02()
{
	if(B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_02))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_Mana02_10_00");	//��� ��� �� ��� ������ �������� �������� ����, ���� ������� ��������������, �� ������� �������� ����� � ��������.
		AI_Output(self,other,"DIA_Constantino_TEACH_Mana02_10_01");	//�����������, ����� ������� ������ �������� �������� ����������� ����� �����. � �������� ������������ ��� ���� ������������ �������� ����� � ������� �����.
	};
	Info_ClearChoices(DIA_Constantino_TEACH);
};

func void DIA_Constantino_TEACH_PermSTR()
{
	if(B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_STR))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_PermSTR_10_00");	//������� ����! ������������ �����. ��� ���� ���� ����������� ������ �������� ������ � ������� ������.
		AI_Output(self,other,"DIA_Constantino_TEACH_PermSTR_10_01");	//��� ��������� ����� ����� �����, ����� �������� �� ����� ������� ��������, ����� ���� ����� ����� ���������� �������!
	};
	Info_ClearChoices(DIA_Constantino_TEACH);
};

