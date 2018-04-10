
instance DIA_Harad_EXIT(C_Info)
{
	npc = VLK_412_Harad;
	nr = 999;
	condition = DIA_Harad_EXIT_Condition;
	information = DIA_Harad_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Harad_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Harad_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Harad_Hallo(C_Info)
{
	npc = VLK_412_Harad;
	nr = 2;
	condition = DIA_Harad_Hallo_Condition;
	information = DIA_Harad_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Harad_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Harad_Hallo_Info()
{
	AI_Output(self,other,"DIA_Harad_Hallo_12_00");	//(�����������) ��� �� ������?
};


instance DIA_Harad_Arbeit(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_Arbeit_Condition;
	information = DIA_Harad_Arbeit_Info;
	permanent = FALSE;
	description = "� ��� ������!";
};


func int DIA_Harad_Arbeit_Condition()
{
	return TRUE;
};

func void DIA_Harad_Arbeit_Info()
{
	AI_Output(other,self,"DIA_Harad_Arbeit_15_00");	//� ��� ������!
	AI_Output(self,other,"DIA_Harad_Arbeit_12_01");	//�� - ��� �� ������� �� ����� ������.
	AI_Output(self,other,"DIA_Harad_Arbeit_12_02");	//������ ����� �������� ���� ��������, � ����� ������� �����.
	AI_Output(self,other,"DIA_Harad_Arbeit_12_03");	//� �� �� ���-������ ��������?
	AI_Output(other,self,"DIA_Harad_Arbeit_15_04");	//���� �� ������ � ����, ���� �� � ������ ������� ...
	AI_Output(self,other,"DIA_Harad_Arbeit_12_05");	//���. � � ������.
	AI_Output(self,other,"DIA_Harad_Arbeit_12_06");	//���� ��� ������, ������ ���� � ������� ����� � ������. � ����� � ������ ����� ����������� ������ �������, ��������� �������� �����.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Harad_Arbeit_12_07");	//� � �� ����, ����� ��� ������ �������� ��� ���, ������ �� ������ ������ � ��������� � ���������� �������������, ������ ����, ����� ������� ������� ������ � ������� ���������.
	};
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Lehrling,LOG_Running);
	B_LogEntry(TOPIC_Lehrling,"���� � ����� ������� ������, ��� � ���� �� ���-������ ������,  �� ������ ���� � �������.");
};


instance DIA_Harad_Taugenichts(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_Taugenichts_Condition;
	information = DIA_Harad_Taugenichts_Info;
	permanent = FALSE;
	description = "� �� ���������!";
};


func int DIA_Harad_Taugenichts_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Harad_Arbeit))
	{
		return TRUE;
	};
};

func void DIA_Harad_Taugenichts_Info()
{
	AI_Output(other,self,"DIA_Harad_Taugenichts_15_00");	//� �� ���������!
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_01");	//��� ������� �����! � �� ������ ����������� �� ������ �� �������� ������?
	AI_Output(other,self,"DIA_Harad_Taugenichts_15_02");	//�� ��� �� ���������?
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_03");	//������� ��� ������ �����.
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_04");	//����� ������� ������ ����� ������. � �����, ���� �� �������� ������ �� ������� �����.
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_05");	//���� ���� ������� �������� ������ �� ���, � ������ ���� � �������.
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_06");	//����, �������, ������ ������� ����� ��������.
	MIS_Harad_Orc = LOG_Running;
	Log_CreateTopic(TOPIC_HaradOrk,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HaradOrk,LOG_Running);
	B_LogEntry(TOPIC_HaradOrk,"���������� �� ������ ������ ����. ������ ����� �����, ����� � ���� ���. ������ ���� �������� ����������� ���������������.");
};


instance DIA_Harad_OrcRunning(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_OrcRunning_Condition;
	information = DIA_Harad_OrcRunning_Info;
	permanent = FALSE;
	description = "����� ��� ��������� �� ���� ����� ...";
};


func int DIA_Harad_OrcRunning_Condition()
{
	if((MIS_Harad_Orc == LOG_Running) && (Harad_HakonMission == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Harad_OrcRunning_Info()
{
	AI_Output(other,self,"DIA_Harad_OrcRunning_15_00");	//����� ��� ��������� �� ���� ����� ...
	AI_Output(self,other,"DIA_Harad_OrcRunning_12_01");	//(���������) ���?
	Info_ClearChoices(DIA_Harad_OrcRunning);
	Info_AddChoice(DIA_Harad_OrcRunning,"������ ������� ������ ���� �������!",DIA_Harad_OrcRunning_Done);
	Info_AddChoice(DIA_Harad_OrcRunning,"��� ��� ����� ��������� ��������� ... ...",DIA_Harad_OrcRunning_TooHard);
};

func void DIA_Harad_OrcRunning_TooHard()
{
	AI_Output(other,self,"DIA_Harad_OrcRunning_TooHard_15_00");	//�� ��� ��� ����� ��������� ��������� ...
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_01");	//�� - ���� �� ����, ��� �� ���������, �������� �� ����. � ���� ������� ���� ���� �� ������. �� ��� ����� ���������.
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_02");	//��� �� �����, �� ������ �������� ���, ��� � ���� ������ �������� ���������, ���� ��� ����� ����������.
	AI_Output(other,self,"DIA_Harad_OrcRunning_TooHard_15_03");	//� ��� �� ��� ���� ���������� ������� ��������?
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_04");	//�� - (���������) �����, �������� ������� �� �������� �������, ������ ���, ��� �� ���� ������ ������� ��������� ���� �����.
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_05");	//��� �������, �� ������, �������� ���� ������ ���-�� �� ���������� ��������.
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_06");	//��� ��������� ������ �� ������ ���� ��� �� ������.
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_07");	//���� ���� ��������! ����! ����� � �����, ��� �� �� ��������� ��� �����.
	Harad_HakonMission = TRUE;
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Lehrling,LOG_Running);
	if(MIS_HakonBandits != LOG_Running)
	{
		B_LogEntry(TOPIC_Lehrling,"����� ������ ���, ��� ������� �������� �������� ������ �������� �� ������. ���� � ����� ����� ��, ��� ������ ���, ��� � ���� �� ���-�� ������. � ������ ���������� � �������. ��������, �� �����, ��� ���������� ��� �������.");
	}
	else
	{
		B_LogEntry(TOPIC_Lehrling,"����� ������ ���, ��� ������� �������� �������� ������ �������� �� ������. ���� � ����� ����� ��, ��� ������ ���, ��� � ���� �� ���-�� ������.");
	};
	Info_ClearChoices(DIA_Harad_OrcRunning);
};

func void DIA_Harad_OrcRunning_Done()
{
	AI_Output(other,self,"DIA_Harad_OrcRunning_Done_15_00");	//������ ������� ������ ���� �������!
	AI_Output(self,other,"DIA_Harad_OrcRunning_Done_12_01");	//������! ����� �� ����� ����� �������. ����� ���� ���� ���� ������� �� ����.
	Info_ClearChoices(DIA_Harad_OrcRunning);
};


instance DIA_Harad_OrcSuccess(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_OrcSuccess_Condition;
	information = DIA_Harad_OrcSuccess_Info;
	permanent = FALSE;
	description = "� ������ ���� ������ �����, ��� �� �����.";
};


func int DIA_Harad_OrcSuccess_Condition()
{
	if(MIS_Harad_Orc == LOG_Running)
	{
		if((Npc_HasItems(other,ItMw_2H_OrcAxe_01) > 0) || (Npc_HasItems(other,ItMw_2H_OrcAxe_02) > 0) || (Npc_HasItems(other,ItMw_2H_OrcAxe_03) > 0) || (Npc_HasItems(other,ItMw_2H_OrcAxe_04) > 0) || (Npc_HasItems(other,ItMw_2H_OrcSword_01) > 0))
		{
			return TRUE;
		};
	};
};

func void DIA_Harad_OrcSuccess_Info()
{
	AI_Output(other,self,"DIA_Harad_OrcSuccess_15_00");	//� ������ ���� ������ �����, ��� �� �����.
	AI_Output(self,other,"DIA_Harad_OrcSuccess_12_01");	//������ ...
	if(Npc_HasItems(other,ItMw_2H_OrcAxe_01) > 0)
	{
		B_GiveInvItems(other,self,ItMw_2H_OrcAxe_01,1);
	}
	else if(Npc_HasItems(other,ItMw_2H_OrcAxe_02) > 0)
	{
		B_GiveInvItems(other,self,ItMw_2H_OrcAxe_02,1);
	}
	else if(Npc_HasItems(other,ItMw_2H_OrcAxe_03) > 0)
	{
		B_GiveInvItems(other,self,ItMw_2H_OrcAxe_03,1);
	}
	else if(Npc_HasItems(other,ItMw_2H_OrcAxe_04) > 0)
	{
		B_GiveInvItems(other,self,ItMw_2H_OrcAxe_04,1);
	}
	else
	{
		B_GiveInvItems(other,self,ItMw_2H_OrcSword_01,1);
	};
	if(Harad_HakonMission == TRUE)
	{
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_02");	//�� ��� �� ������ ���?! �� ��������� �������!
	};
	AI_Output(self,other,"DIA_Harad_OrcSuccess_12_03");	//����� ��� �� ������ � ��������� ������ � ����� ����� - � ��� ��� ��� ��� �������� �� ����� ����� � ������.
	AI_Output(self,other,"DIA_Harad_OrcSuccess_12_04");	//�� ��, ������� �� ���� �������, ����� � ����.
	if(Player_IsApprentice == APP_Harad)
	{
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_05");	//� ����, ��� �� ���� ��������� ������� ������. �������� ������!
	}
	else if(Player_IsApprentice == APP_NONE)
	{
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_06");	//� �� �����, ��� ���� ������� ���. � �������.
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_07");	//����, ������, ��� �� ������ ������ �������.
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_08");	//�� �� ����� ���������� ���.
	};
	MIS_Harad_Orc = LOG_SUCCESS;
	B_GivePlayerXP(XP_Harad_Orc);
	B_LogEntry(TOPIC_Lehrling,"����� ������ ���� � �������, ���� � ����� �������� ��������� ������ ��������.");
};


var int Harad_StartGuild;

instance DIA_Harad_LEHRLING(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_LEHRLING_Condition;
	information = DIA_Harad_LEHRLING_Info;
	permanent = TRUE;
	description = "����� � ���� ����� ����� ��������?";
};


func int DIA_Harad_LEHRLING_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Harad_Arbeit) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Harad_LEHRLING_Info()
{
	var int stimmen;
	stimmen = 0;
	AI_Output(other,self,"DIA_Harad_LEHRLING_15_00");	//����� � ���� ����� ����� ��������?
	if((MIS_Harad_Orc == LOG_SUCCESS) || ((MIS_HakonBandits == LOG_SUCCESS) && (Harad_HakonMission == TRUE)))
	{
		if(MIS_Harad_Orc == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_01");	//��� ����� ������ �� ������� �� �������, ��������� ���������� ����.
			if(MIS_HakonBandits == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_02");	//����� ����, ����� ��������� ���, ��� �� ����� �������� � ���������. �� ��������� �������!
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_03");	//�� �� ���� ����, �� ����� ��������� ���, ��� �� ����� �������� � ���������. ��� ������!
		};
		AI_Output(self,other,"DIA_Harad_LEHRLING_12_04");	//��� �������� ����� ������, �� �� ������ ���������� � ������ ���� ������.
		stimmen = stimmen + 1;
		AI_Output(self,other,"DIA_Harad_LEHRLING_12_05");	//� ������ ������� ...
		if(Thorben.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if(MIS_Thorben_GetBlessings == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_06");	//������ ��� ���� ���� �������������.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_07");	//������ ������ ������ �����, ����� �� ������� ������������� �����. � �����, ��� ������� ����.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_08");	//������ �������, ��� ������� �� ����� ����.
		};
		if(Bosper.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_09");	//������ ������� ��������� ���� �� ���� ����� ���� � �������. �� �����, ����� �� ���� ��� ��������.
			if((MIS_Bosper_Bogen == LOG_SUCCESS) || (MIS_Bosper_WolfFurs == LOG_SUCCESS))
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_10");	//� ���� �������, �� ����������� �������� � ��� �� ����� �������.
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_11");	//� ����� ������, �� ����������.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_12");	//�� �������� ����, ����� � ��� ���� ����������� ���� �� ����������� ���� � ��� �������.
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_13");	//�������� - �� ������ ������� ������� ���� �����. ����, �������, ���� ����� ��� �����.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_14");	//������ ���� �� �����, ��� �� �����
		};
		if(Constantino.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_15");	//��� ������, ����������� ������ �� �������. �� ������, ��� � ��� ����� ������, �� ������ ����� ���� �������� � ����� ������.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_16");	//����������� �������, ��� �� ����������� � ������������ � ������ - ��� ������?
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_17");	//���� ��� ���, �� ���� ����� ������� ��� �������� ��� ����� �������!
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_18");	//����������� ������� �� ������ � ����.
		};
		if(Matteo.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if(MIS_Matteo_Gold == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_19");	//������ �������, ��� �� ������ ��� ��� ������. ��� �������, �� ����������� ������� �������.
				stimmen = stimmen + 1;
			}
			else if(MIS_Matteo_Gold == LOG_Running)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_20");	//������ �������, ��� �� ��� ���-�� ������. � �� ����, ��� � ��� ��� �� ����, �� �� ������ ������������� ��� ��������.
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_21");	//������ �������, ��� ������� �� ������� �� ���� � �����.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_22");	//������ �������, ��� ������� �� ����� ���� � ����� �����.
		};
		if(stimmen >= 4)
		{
			if(stimmen == 5)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_23");	//��� ��������, ��� �� ������� ��������� ���� ��������!
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_24");	//��� ��������, ��� �� ������� ��������� ������� ��������. ����� ����������, ����� ���� �������� � �������.
			};
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_25");	//�� ����� ����� ���� ��������?
			Info_ClearChoices(DIA_Harad_LEHRLING);
			Info_AddChoice(DIA_Harad_LEHRLING,"������ - � ������� ��� ����.",DIA_Harad_LEHRLING_Later);
			Info_AddChoice(DIA_Harad_LEHRLING,"� ����� ����� ����� ��������!",DIA_Harad_LEHRLING_OK);
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_26");	//���� ����� �������� ���������, �� ������� ����, �������  ��������. ����� �� �� ������� ����� �������� � ������ ����� ������.
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_27");	//������� �� ������ ���������� �� ����� ���������, ������� ��� �� ������� � ����.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_LEHRLING_12_28");	//�� ������, ��� �������� ���, ��� ���� �� ���-�� �����.
	};
};

func void DIA_Harad_LEHRLING_OK()
{
	AI_Output(other,self,"DIA_Harad_LEHRLING_OK_15_00");	//� �����!
	AI_Output(self,other,"DIA_Harad_LEHRLING_OK_12_01");	//�������! � ����� ���� ������ ������� ����.
	if(PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE)
	{
		AI_Output(other,self,"DIA_Harad_LEHRLING_OK_15_02");	//� ��� ���� ���!
		AI_Output(self,other,"DIA_Harad_LEHRLING_OK_12_03");	//��� �. ��� �����!
	};
	if(other.attribute[ATR_STRENGTH] < (T_MED - 30))
	{
		AI_Output(self,other,"DIA_Harad_LEHRLING_OK_12_04");	//����� ����, ������ ����� ����� ������� �������. �� ������� ����� � ���� �� ������!
	};
	Player_IsApprentice = APP_Harad;
	Npc_ExchangeRoutine(Lothar,"START");
	Harad_StartGuild = other.guild;
	Harad_Lehrling_Day = Wld_GetDay();
	Wld_AssignRoomToGuild("schmied",GIL_NONE);
	MIS_Apprentice = LOG_SUCCESS;
	B_LogEntry(Topic_Bonus,"����� ������ ���� � �������. ������ � ����� ������� � ������� �������.");
	B_LogEntry(Topic_Bonus,"����� ����� �������� ������, ���������� ����, �� ������� ����.");
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_GivePlayerXP(XP_Lehrling);
	B_LogEntry(TOPIC_CityTeacher,"����� ����� ������� ���� ���������� ����. ����� �� ����� ������ ��� ����� �������.");
	Info_ClearChoices(DIA_Harad_LEHRLING);
};

func void DIA_Harad_LEHRLING_Later()
{
	AI_Output(other,self,"DIA_Harad_LEHRLING_Later_15_00");	//������ - � ������� ��� ����.
	if(!Npc_IsDead(Brian))
	{
		AI_Output(self,other,"DIA_Harad_LEHRLING_Later_12_01");	//��� ������. ������ ��� ����� ��� ���������� ����� ��������� �����.
	};
	Info_ClearChoices(DIA_Harad_LEHRLING);
};


instance DIA_Harad_Zustimmung(C_Info)
{
	npc = VLK_412_Harad;
	nr = 2;
	condition = DIA_Harad_Zustimmung_Condition;
	information = DIA_Harad_Zustimmung_Info;
	permanent = TRUE;
	description = "���� � ����� �������� ������� �������?";
};


func int DIA_Harad_Zustimmung_Condition()
{
	if((Player_IsApprentice == APP_NONE) && Npc_KnowsInfo(other,DIA_Harad_Arbeit))
	{
		return TRUE;
	};
};


var int DIA_Harad_Zustimmung_Permanent;

func void DIA_Harad_Zustimmung_Info()
{
	AI_Output(other,self,"DIA_Harad_Zustimmung_15_00");	//���� � ����� �������� ������� �������?
	if((MIS_Harad_Orc == LOG_SUCCESS) || ((MIS_HakonBandits == LOG_SUCCESS) && (Harad_HakonMission == TRUE)))
	{
		AI_Output(self,other,"DIA_Harad_Zustimmung_12_01");	//�� ������� �������.
		if(MIS_HakonBandits == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Harad_Zustimmung_12_02");	//����� ��������� ���, ��� �� ���������� � ���������.
		};
		AI_Output(self,other,"DIA_Harad_Zustimmung_12_03");	//� ��� ���� ���� ���������.
		if(DIA_Harad_Zustimmung_Permanent == FALSE)
		{
			B_GivePlayerXP(XP_Zustimmung);
			DIA_Harad_Zustimmung_Permanent = TRUE;
		};
		B_LogEntry(TOPIC_Lehrling,"����� ���� ��� ���� ���������, ���� � ������ ����� �������� ������� �������.");
		if(!Npc_IsDead(Brian))
		{
			AI_Output(self,other,"DIA_Harad_Zustimmung_12_04");	//������ ��� ���������� ����� ��������� �����. � � ������, ��� ���� ��� ������ �������� ������� ������, ��������� �������� ���.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_Zustimmung_12_05");	//������ ������� ����� ���� ���� �������� �� ���. �� � ��� ��� ��������� ������ ����� ����, ��� �� ��������, ��� ���� �� ���-�� �����!
	};
};


var int Harad_MILKommentar;
var int Harad_PALKommentar;
var int Harad_INNOSKommentar;

instance DIA_Harad_AlsLehrling(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_AlsLehrling_Condition;
	information = DIA_Harad_AlsLehrling_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Harad_AlsLehrling_Condition()
{
	if((Player_IsApprentice == APP_Harad) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Harad_AlsLehrling_Info()
{
	if((other.guild == GIL_MIL) && (Harad_StartGuild != GIL_MIL) && (Harad_MILKommentar == FALSE))
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_00");	//�� ������ ������� � ���������? � ������� �����!
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_01");	//���� �� ������� � �����, ����������� � �� ���� ������������, ��� �� ������ ��������� ��� � ���� ����������� �������.
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_02");	//�� ���� ���� ���-������ �����������, ������ �������� �� ���, ����� ��������.
		Harad_MILKommentar = TRUE;
	}
	else if((other.guild == GIL_PAL) && (Harad_StartGuild != GIL_PAL) && (Harad_PALKommentar == FALSE))
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_03");	//���� ������� ����� ���������!
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_04");	//� ���, ��� �����-�� ���� ���� � �������. ���� ���� �� � �� �������� ����� ������� �� �����������.
		Harad_PALKommentar = TRUE;
	}
	else if(((other.guild == GIL_NOV) || (other.guild == GIL_KDF)) && (Harad_StartGuild != GIL_NOV) && (Harad_StartGuild != GIL_KDF) && (Harad_INNOSKommentar == FALSE))
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_05");	//��� �� ��������� � ���������. � �� ���������, ����� �� ��������� � ������. ��� ����� ������� ����.
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_06");	//�� ���� �� ����� ��������� ���� ������, �� ��� ���� � ����.
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_07");	//���� ���� ����� ���-������ ����� �� ����, � ������ ���� ��� ������.
		Harad_INNOSKommentar = TRUE;
	}
	else if((Harad_Lehrling_Day <= (Wld_GetDay() - 4)) && (Harad_MILKommentar == FALSE) && (Harad_PALKommentar == FALSE) && (Harad_INNOSKommentar == FALSE))
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_08");	//��������� ���� �� ���� ����� �����. ��� �� ��� ��� ��� �����, ��?
		Harad_Lehrling_Day = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_09");	//����� �� ...
		Harad_Lehrling_Day = Wld_GetDay();
	};
};


instance DIA_Harad_Waffen(C_Info)
{
	npc = VLK_412_Harad;
	nr = 3;
	condition = DIA_Harad_Waffen_Condition;
	information = DIA_Harad_Waffen_Info;
	permanent = FALSE;
	description = "�� �������� ������?";
};


func int DIA_Harad_Waffen_Condition()
{
	if(Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_Harad_Waffen_Info()
{
	AI_Output(other,self,"DIA_Harad_Waffen_15_00");	//�� �������� ������?
	AI_Output(self,other,"DIA_Harad_Waffen_12_01");	//������ �� ����. ���, ��� � �����, ������ ��������� ��� ���������.
	AI_Output(self,other,"DIA_Harad_Add_12_00");	//� ���� ����� �� 100 ����� �� ����� ������. �� ����� ��������� ��������� ������.
};


instance DIA_Harad_Aufgaben(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_Aufgaben_Condition;
	information = DIA_Harad_Aufgaben_Info;
	permanent = FALSE;
	description = "��� ������ ������ ������?";
};


func int DIA_Harad_Aufgaben_Condition()
{
	if(Player_IsApprentice == APP_Harad)
	{
		return TRUE;
	};
};

func void DIA_Harad_Aufgaben_Info()
{
	AI_Output(other,self,"DIA_Harad_Aufgaben_15_00");	//��� ������ ������ ������?
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_01");	//��� ����. �������� �������.
	AI_Output(other,self,"DIA_Harad_Aufgaben_15_02");	//������, ������ � ������?
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_03");	//�� �� ��� �� ���������, ��� ��������. � ����� �� ������ ���. ���� �� �� ���������, �� � ����� �� ���������. ��� ������.
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_05");	//����� ����, � ����� ���� �����, ��� ����� ����� ��� ������������ ������� �����.
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_06");	//������������ ���������� ����� - ������ ��� �������� �������. ���� �� ����� ��� ������ ...
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_07");	//���� ���� ����� ����� ��� ���, �� ������ ������� ���-������ � ���� ����. ��� �������?
};


instance DIA_Harad_SellBlades(C_Info)
{
	npc = VLK_412_Harad;
	nr = 200;
	condition = DIA_Harad_SellBlades_Condition;
	information = DIA_Harad_SellBlades_Info;
	permanent = TRUE;
	description = "� ���� ������� ������, ���������� ����.";
};


func int DIA_Harad_SellBlades_Condition()
{
	if(Player_IsApprentice == APP_Harad)
	{
		return TRUE;
	};
};

func void DIA_Harad_SellBlades_Info()
{
	var C_Item EquipWeap;
	var int anzahl_common;
	var int anzahl_schwert1;
	var int anzahl_schwert4;
	var int anzahl_rubinklinge;
	var int anzahl_elbastardo;
	var int gesamt;
	var string concatText;
	var int lohn;
	AI_Output(other,self,"DIA_Harad_SellBlades_15_00");	//� ���� ������� ������, ���������� ����.
	EquipWeap = Npc_GetEquippedMeleeWeapon(other);
	anzahl_common = Npc_HasItems(other,ItMw_1H_Common_01);
	if(Hlp_IsItem(EquipWeap,ItMw_1H_Common_01) == TRUE)
	{
		anzahl_common = anzahl_common - 1;
	};
	anzahl_schwert1 = Npc_HasItems(other,ItMw_Schwert1);
	if(Hlp_IsItem(EquipWeap,ItMw_Schwert1) == TRUE)
	{
		anzahl_schwert1 = anzahl_schwert1 - 1;
	};
	anzahl_schwert4 = Npc_HasItems(other,ItMw_Schwert4);
	if(Hlp_IsItem(EquipWeap,ItMw_Schwert4) == TRUE)
	{
		anzahl_schwert4 = anzahl_schwert4 - 1;
	};
	anzahl_rubinklinge = Npc_HasItems(other,ItMw_Rubinklinge);
	if(Hlp_IsItem(EquipWeap,ItMw_Rubinklinge) == TRUE)
	{
		anzahl_rubinklinge = anzahl_rubinklinge - 1;
	};
	anzahl_elbastardo = Npc_HasItems(other,ItMw_ElBastardo);
	if(Hlp_IsItem(EquipWeap,ItMw_ElBastardo) == TRUE)
	{
		anzahl_elbastardo = anzahl_elbastardo - 1;
	};
	gesamt = anzahl_common + anzahl_schwert1 + anzahl_schwert4 + anzahl_rubinklinge + anzahl_elbastardo;
	if(gesamt == 0)
	{
		if((Hlp_IsItem(EquipWeap,ItMw_1H_Common_01) == TRUE) || (Hlp_IsItem(EquipWeap,ItMw_Schwert1) == TRUE) || (Hlp_IsItem(EquipWeap,ItMw_Schwert4) == TRUE) || (Hlp_IsItem(EquipWeap,ItMw_Rubinklinge) == TRUE) || (Hlp_IsItem(EquipWeap,ItMw_ElBastardo) == TRUE))
		{
			AI_Output(self,other,"DIA_Harad_SellBlades_12_01");	//���, ��� � ���� ���� - ��� ���, ������� �� �����. �� ����� ������ ��� ����.
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_SellBlades_12_04");	//����� ������ ���! � �������� ������ ������� ����.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_SellBlades_12_02");	//������ - ����� ����.
		Npc_RemoveInvItems(other,ItMw_1H_Common_01,anzahl_common);
		Npc_RemoveInvItems(other,ItMw_Schwert1,anzahl_schwert1);
		Npc_RemoveInvItems(other,ItMw_Schwert4,anzahl_schwert4);
		Npc_RemoveInvItems(other,ItMw_Rubinklinge,anzahl_rubinklinge);
		Npc_RemoveInvItems(other,ItMw_ElBastardo,anzahl_elbastardo);
		concatText = ConcatStrings(IntToString(gesamt),PRINT_ItemsGegeben);
		AI_PrintScreen(concatText,-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
		AI_Output(self,other,"DIA_Harad_SellBlades_12_03");	//�������. �����, ��� ���������.
		lohn = (anzahl_common * Value_Common1) + (anzahl_schwert1 * Value_Schwert1) + (anzahl_schwert4 * Value_Schwert4) + (anzahl_rubinklinge * Value_Rubinklinge) + (anzahl_elbastardo * Value_ElBastardo);
		lohn = lohn / 3;
		B_GiveInvItems(self,other,ItMi_Gold,lohn);
	};
};

func void B_Harad_TeachSmith()
{
	AI_Output(self,other,"DIA_Harad_TeachCommon_12_01");	//��� �������� ������, ������. ������ ����� ����� �����, � ������� ��� ��� �����, ���� �� �� ����������.
	AI_Output(self,other,"DIA_Harad_TeachCommon_12_02");	//����� �������� ������ ����� �� ����������.
};

func void B_HaradSmithChoices()
{
	Info_ClearChoices(DIA_Harad_TeachSmith);
	Info_AddChoice(DIA_Harad_TeachSmith,Dialog_Back,DIA_Harad_TeachSmith_BACK);
	if((PLAYER_TALENT_SMITH[WEAPON_1H_Harad_04] == FALSE) && (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] == TRUE))
	{
		Info_AddChoice(DIA_Harad_TeachSmith,B_BuildLearnString(NAME_Addon_Harad_04,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Harad_04)),DIA_Harad_TeachSmith_Harad04);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] == FALSE) && (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] == TRUE))
	{
		Info_AddChoice(DIA_Harad_TeachSmith,B_BuildLearnString(NAME_Addon_Harad_03,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Harad_03)),DIA_Harad_TeachSmith_Harad03);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] == FALSE) && (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] == TRUE))
	{
		Info_AddChoice(DIA_Harad_TeachSmith,B_BuildLearnString(NAME_Addon_Harad_02,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Harad_02)),DIA_Harad_TeachSmith_Harad02);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] == FALSE) && (PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE))
	{
		Info_AddChoice(DIA_Harad_TeachSmith,B_BuildLearnString(NAME_Addon_Harad_01,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Harad_01)),DIA_Harad_TeachSmith_Harad01);
	};
	if(PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		Info_AddChoice(DIA_Harad_TeachSmith,B_BuildLearnString("��������� ������.",B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_Common)),DIA_Harad_TeachSmith_Common);
	};
};


instance DIA_Harad_TeachSmith(C_Info)
{
	npc = VLK_412_Harad;
	nr = 50;
	condition = DIA_Harad_TeachSmith_Condition;
	information = DIA_Harad_TeachSmith_Info;
	permanent = TRUE;
	description = "����� ���� ������ ������� ����!";
};


func int DIA_Harad_TeachSmith_Condition()
{
	if(Player_IsApprentice == APP_Harad)
	{
		if((PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE) || (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] == FALSE) || (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] == FALSE) || (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] == FALSE) || (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_04] == FALSE))
		{
			return TRUE;
		};
	};
};

func void DIA_Harad_TeachSmith_Info()
{
	AI_Output(other,self,"DIA_Harad_TeachCommon_15_00");	//����� ���� ������ ������� ����!
	B_HaradSmithChoices();
};

func void DIA_Harad_TeachSmith_BACK()
{
	Info_ClearChoices(DIA_Harad_TeachSmith);
};

func void DIA_Harad_TeachSmith_Common()
{
	if(B_TeachPlayerTalentSmith(self,other,WEAPON_Common))
	{
		B_Harad_TeachSmith();
		AI_Output(self,other,"DIA_Harad_TeachCommon_12_03");	//���� ������ ��� ������� �� ������ ������������� ���������, �� ����� ���������� �� ��������� ���� �����.
	};
	B_HaradSmithChoices();
};

func void DIA_Harad_TeachSmith_Harad01()
{
	if(B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Harad_01))
	{
		B_Harad_TeachSmith();
	};
	B_HaradSmithChoices();
};

func void DIA_Harad_TeachSmith_Harad02()
{
	if(B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Harad_02))
	{
		B_Harad_TeachSmith();
	};
	B_HaradSmithChoices();
};

func void DIA_Harad_TeachSmith_Harad03()
{
	if(B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Harad_03))
	{
		B_Harad_TeachSmith();
	};
	B_HaradSmithChoices();
};

func void DIA_Harad_TeachSmith_Harad04()
{
	if(B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Harad_04))
	{
		B_Harad_TeachSmith();
	};
	B_HaradSmithChoices();
};


var int Harad_Merke_STR;

instance DIA_Harad_TeachSTR(C_Info)
{
	npc = VLK_412_Harad;
	nr = 100;
	condition = DIA_Harad_TeachSTR_Condition;
	information = DIA_Harad_TeachSTR_Info;
	permanent = 1;
	description = "� ���� ����� �������!";
};


func int DIA_Harad_TeachSTR_Condition()
{
	if(Player_IsApprentice == APP_Harad)
	{
		return TRUE;
	};
};

func void DIA_Harad_TeachSTR_Info()
{
	AI_Output(other,self,"DIA_Harad_TeachSTR_15_00");	//� ���� ����� �������!
	Harad_Merke_STR = other.attribute[ATR_STRENGTH];
	Info_ClearChoices(DIA_Harad_TeachSTR);
	Info_AddChoice(DIA_Harad_TeachSTR,Dialog_Back,DIA_Harad_TeachSTR_BACK);
	Info_AddChoice(DIA_Harad_TeachSTR,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Harad_TeachSTR_1);
	Info_AddChoice(DIA_Harad_TeachSTR,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Harad_TeachSTR_5);
};

func void DIA_Harad_TeachSTR_BACK()
{
	if(Harad_Merke_STR < other.attribute[ATR_STRENGTH])
	{
		AI_Output(self,other,"DIA_Harad_TeachSTR_BACK_12_01");	//�� ��� �������� ������� ��������.
	};
	if(other.attribute[ATR_STRENGTH] < T_MED)
	{
		AI_Output(self,other,"DIA_Harad_TeachSTR_BACK_12_02");	//�����������, ���� ������ ��������� ���.
	};
	Info_ClearChoices(DIA_Harad_TeachSTR);
};

func void DIA_Harad_TeachSTR_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MED);
	Info_ClearChoices(DIA_Harad_TeachSTR);
	Info_AddChoice(DIA_Harad_TeachSTR,Dialog_Back,DIA_Harad_TeachSTR_BACK);
	Info_AddChoice(DIA_Harad_TeachSTR,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Harad_TeachSTR_1);
	Info_AddChoice(DIA_Harad_TeachSTR,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Harad_TeachSTR_5);
};

func void DIA_Harad_TeachSTR_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MED);
	Info_ClearChoices(DIA_Harad_TeachSTR);
	Info_AddChoice(DIA_Harad_TeachSTR,Dialog_Back,DIA_Harad_TeachSTR_BACK);
	Info_AddChoice(DIA_Harad_TeachSTR,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Harad_TeachSTR_1);
	Info_AddChoice(DIA_Harad_TeachSTR,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Harad_TeachSTR_5);
};


instance DIA_Harad_ImmerNoch(C_Info)
{
	npc = VLK_412_Harad;
	nr = 3;
	condition = DIA_Harad_ImmerNoch_Condition;
	information = DIA_Harad_ImmerNoch_Info;
	permanent = FALSE;
	description = "�� ��� ��� ��������� �� ���������?";
};


func int DIA_Harad_ImmerNoch_Condition()
{
	if(Kapitel >= 2)
	{
		return TRUE;
	};
};

func void DIA_Harad_ImmerNoch_Info()
{
	AI_Output(other,self,"DIA_Harad_Add_15_01");	//�� ��� ��� ��������� �� ���������?
	AI_Output(self,other,"DIA_Harad_Add_12_02");	//� �������� ����� ����� ������.
	AI_Output(self,other,"DIA_Harad_Add_12_03");	//������ � ����� ���� ���� ���� �� ���������� ���� - �� �� ���� ��� �� �����.
	AI_Output(self,other,"DIA_Harad_Add_12_04");	//�� ������ � ���� ����� ���� �����, ����� ������ ������ ��� ��������� �� �������� �������.
	AI_Output(self,other,"DIA_Harad_Add_12_05");	//��� ��� ���� �� ����� ������� ���, �������� � ���.
};


instance DIA_Harad_AboutErzklingen(C_Info)
{
	npc = VLK_412_Harad;
	nr = 3;
	condition = DIA_Harad_AboutErzklingen_Condition;
	information = DIA_Harad_AboutErzklingen_Info;
	permanent = FALSE;
	description = "�������� ��� � ����� �� ���������� ����!";
};


func int DIA_Harad_AboutErzklingen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Harad_ImmerNoch))
	{
		return TRUE;
	};
};

func void DIA_Harad_AboutErzklingen_Info()
{
	AI_Output(other,self,"DIA_Harad_Add_15_06");	//�������� ��� � ����� �� ���������� ����!
	AI_Output(self,other,"DIA_Harad_Waffen_12_02");	//�������� ����������� ���� - ����� ������� � ������� �������, �� � ���������� ���������� ����� ������� � ����������� �� ��������� ���.
	AI_Output(self,other,"DIA_Harad_Waffen_12_03");	//��� ����� ������� ���, �� ��� ��� ����������� ������������ ������ � ����� ��������.
	AI_Output(self,other,"DIA_Harad_Waffen_12_04");	//��� �������� ���������� ����� �������. � ����������, �� ���������� ������������ �������, ��������� �������� ���� �����!
};


instance DIA_Harad_Erzklingen(C_Info)
{
	npc = VLK_412_Harad;
	nr = 3;
	condition = DIA_Harad_Erzklingen_Condition;
	information = DIA_Harad_Erzklingen_Info;
	permanent = TRUE;
	description = "� ���� ������ ��� �� ���������� ����.";
};


func int DIA_Harad_Erzklingen_Condition()
{
	if((OreBladeBought == FALSE) && Npc_KnowsInfo(other,DIA_Harad_AboutErzklingen))
	{
		return TRUE;
	};
};


var int OreBladeBought;

func void DIA_Harad_Erzklingen_Info()
{
	AI_Output(other,self,"DIA_Harad_Erzklingen_15_00");	//� ���� ������ ��� �� ���������� ����.
	if(hero.guild != GIL_PAL)
	{
		AI_Output(self,other,"DIA_Harad_Erzklingen_12_01");	//� ����� ���������� ���� ������ ���������. � ������ �� ������ � ���� ����.
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_Erzklingen_12_02");	//��, ��������, ������ ������� ���� ��������������, ��� ��� ��������� ������� ������ ������������� ������.
		AI_Output(self,other,"DIA_Harad_Erzklingen_12_03");	//�������� ������� ����� ������, � ���� ������� ���� ������ ���� ���������� ������.
		AI_Output(self,other,"DIA_Harad_Erzklingen_12_04");	//���, ��� � ���� ���������� ����?
		Info_ClearChoices(DIA_Harad_Erzklingen);
		Info_AddChoice(DIA_Harad_Erzklingen,Dialog_Back,DIA_Harad_Erzklingen_Back);
		Info_AddChoice(DIA_Harad_Erzklingen,"��������� ��� (2000 ������)",DIA_Harad_Erzklingen_2h);
		Info_AddChoice(DIA_Harad_Erzklingen,"���������� ��� (2000 ������)",DIA_Harad_Erzklingen_1h);
	};
};

func void DIA_Harad_Erzklingen_Back()
{
	Info_ClearChoices(DIA_Harad_Erzklingen);
};

func void B_Harad_NotEnoughGold()
{
	AI_Output(self,other,"B_Harad_NotEnoughGold_12_00");	//� ���� ������������ ������.
};

func void B_Harad_HaveFunWithYourSword()
{
	AI_Output(self,other,"B_Harad_HaveGunWithYourSword_12_00");	//������ ���� ����� ������. ��� ����� ����� ���������.
	OreBladeBought = TRUE;
	Info_ClearChoices(DIA_Harad_Erzklingen);
};

func void DIA_Harad_Erzklingen_2h()
{
	AI_Output(other,self,"DIA_Harad_Erzklingen_2h_15_00");	//� ������ ��������� ���!
	if(Npc_HasItems(other,ItMi_Gold) >= Value_Blessed_2H_1)
	{
		B_GiveInvItems(other,self,ItMi_Gold,Value_Blessed_2H_1);
		CreateInvItems(self,ItMw_2H_Blessed_01,1);
		B_GiveInvItems(self,other,ItMw_2H_Blessed_01,1);
		B_Harad_HaveFunWithYourSword();
	}
	else
	{
		B_Harad_NotEnoughGold();
		Info_ClearChoices(DIA_Harad_Erzklingen);
		Info_AddChoice(DIA_Harad_Erzklingen,Dialog_Back,DIA_Harad_Erzklingen_Back);
		Info_AddChoice(DIA_Harad_Erzklingen,"��������� ��� (2000 ������)",DIA_Harad_Erzklingen_2h);
		Info_AddChoice(DIA_Harad_Erzklingen,"���������� ��� (2000 ������)",DIA_Harad_Erzklingen_1h);
	};
};

func void DIA_Harad_Erzklingen_1h()
{
	AI_Output(other,self,"DIA_Harad_Erzklingen_1h_15_00");	//� ������ ���������� ���!
	if(Npc_HasItems(other,ItMi_Gold) >= Value_Blessed_1H_1)
	{
		B_GiveInvItems(other,self,ItMi_Gold,Value_Blessed_1H_1);
		CreateInvItems(self,ItMw_1H_Blessed_01,1);
		B_GiveInvItems(self,other,ItMw_1H_Blessed_01,1);
		B_Harad_HaveFunWithYourSword();
	}
	else
	{
		B_Harad_NotEnoughGold();
		Info_ClearChoices(DIA_Harad_Erzklingen);
		Info_AddChoice(DIA_Harad_Erzklingen,Dialog_Back,DIA_Harad_Erzklingen_Back);
		Info_AddChoice(DIA_Harad_Erzklingen,"��������� ��� (2000 ������)",DIA_Harad_Erzklingen_2h);
		Info_AddChoice(DIA_Harad_Erzklingen,"���������� ��� (2000 ������)",DIA_Harad_Erzklingen_1h);
	};
};


instance DIA_Harad_RepairNecklace(C_Info)
{
	npc = VLK_412_Harad;
	nr = 8;
	condition = DIA_Harad_RepairNecklace_Condition;
	information = DIA_Harad_RepairNecklace_Info;
	permanent = FALSE;
	description = "�� ������ ������������� ��������� �������?";
};


func int DIA_Harad_RepairNecklace_Condition()
{
	if((MIS_Bennet_InnosEyeRepairedSetting != LOG_SUCCESS) && (Npc_HasItems(other,ItMi_InnosEye_Broken_Mis) || (MIS_SCKnowsInnosEyeIsBroken == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Harad_RepairNecklace_Info()
{
	AI_Output(other,self,"DIA_Harad_RepairNecklace_15_00");	//�� ������ ������ �������������?
	AI_Output(self,other,"DIA_Harad_RepairNecklace_12_01");	//� ���������, � �� ������. �������, ����� � ������ �� �� ������� ������, ��� ��� �� ������ ����.
	AI_Output(self,other,"DIA_Harad_RepairNecklace_12_02");	//������ ���� � ���� ������� ������, � ����� ��� ������ �� ��������� ����������� �����.
	AI_Output(self,other,"DIA_Harad_RepairNecklace_12_03");	//����������� ���� ���� �� ����, ��� �� ������� �� ����.
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
};


instance DIA_Harad_Goldsmith(C_Info)
{
	npc = VLK_412_Harad;
	nr = 8;
	condition = DIA_Harad_Goldsmith_Condition;
	information = DIA_Harad_Goldsmith_Info;
	permanent = FALSE;
	description = "��� ��� ����� �������?";
};


func int DIA_Harad_Goldsmith_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Harad_RepairNecklace))
	{
		return TRUE;
	};
};

func void DIA_Harad_Goldsmith_Info()
{
	AI_Output(other,self,"DIA_Harad_Goldsmith_15_00");	//��� ��� ����� �������?
	AI_Output(self,other,"DIA_Harad_Goldsmith_12_01");	//� ������, ��� � ��������� �� ����� ����� ���� ������� ������.
	AI_Output(self,other,"DIA_Harad_Goldsmith_12_02");	//�����, ���� ����� ������������ ���.
};


instance DIA_Harad_PICKPOCKET(C_Info)
{
	npc = VLK_412_Harad;
	nr = 900;
	condition = DIA_Harad_PICKPOCKET_Condition;
	information = DIA_Harad_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Harad_PICKPOCKET_Condition()
{
	return C_Beklauen(14,35);
};

func void DIA_Harad_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Harad_PICKPOCKET);
	Info_AddChoice(DIA_Harad_PICKPOCKET,Dialog_Back,DIA_Harad_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Harad_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Harad_PICKPOCKET_DoIt);
};

func void DIA_Harad_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Harad_PICKPOCKET);
};

func void DIA_Harad_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Harad_PICKPOCKET);
};

