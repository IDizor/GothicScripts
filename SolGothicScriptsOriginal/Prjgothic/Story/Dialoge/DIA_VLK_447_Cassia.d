
instance DIA_Cassia_EXIT(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 999;
	condition = DIA_Cassia_EXIT_Condition;
	information = DIA_Cassia_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Cassia_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Cassia_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Cassia_PICKME(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 900;
	condition = DIA_Cassia_PICKME_Condition;
	information = DIA_Cassia_PICKME_Info;
	permanent = TRUE;
	description = Pickpocket_100_Female;
};


func int DIA_Cassia_PICKME_Condition()
{
	return C_Beklauen(100,400);
};

func void DIA_Cassia_PICKME_Info()
{
	Info_ClearChoices(DIA_Cassia_PICKME);
	Info_AddChoice(DIA_Cassia_PICKME,Dialog_Back,DIA_Cassia_PICKME_BACK);
	Info_AddChoice(DIA_Cassia_PICKME,DIALOG_PICKPOCKET,DIA_Cassia_PICKME_DoIt);
};

func void DIA_Cassia_PICKME_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Cassia_PICKME);
};

func void DIA_Cassia_PICKME_BACK()
{
	Info_ClearChoices(DIA_Cassia_PICKME);
};


instance DIA_Cassia_Gilde(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 1;
	condition = DIA_Cassia_Gilde_Condition;
	information = DIA_Cassia_Gilde_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Cassia_Gilde_Condition()
{
	if((Cassia_Gildencheck == TRUE) && (Join_Thiefs == TRUE) && ((other.guild == GIL_MIL) || (other.guild == GIL_PAL) || (other.guild == GIL_KDF)))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Gilde_Info()
{
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Cassia_Gilde_16_00");	//� ����, �� ���� ���������� ������ � �������.
		AI_Output(self,other,"DIA_Cassia_Gilde_16_01");	//�� ��, ��� �� ������ ������� ������, ��� ��� �������� �� �����. �� ���� �� ���. � � �������, ��� �� ��� ���� ���������.
	};
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Cassia_Gilde_16_02");	//��� �� ������ ��������� ������ ������? �������. �� �� ������ ����� ���� �� ��� - �������, �� ������� ��� �� ��������.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Cassia_Abgelaufen(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_Abgelaufen_Condition;
	information = DIA_Cassia_Abgelaufen_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Cassia_Abgelaufen_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Cassia_Frist == TRUE) && (Cassia_Day < (B_GetDayPlus() - 2)))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Abgelaufen_Info()
{
	AI_Output(self,other,"DIA_Cassia_Abgelaufen_16_00");	//���� ���� �����. ���� �� ��������� ������������.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,0);
};


instance DIA_Cassia_News(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 1;
	condition = DIA_Cassia_News_Condition;
	information = DIA_Cassia_News_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Cassia_News_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Cassia_News_Info()
{
	if(MIS_ThiefGuild_sucked == FALSE)
	{
		AI_Output(self,other,"DIA_Cassia_News_16_00");	//� ����, �� ������� ��� �������. � ������.
		AI_Output(other,self,"DIA_Cassia_News_15_01");	//������, ������. ������ ����� ���, ����� � �����?
		AI_Output(self,other,"DIA_Cassia_News_16_02");	//�� ������� ���� �������� ���, ��� �������� ������� ������ �� ����� ������.
		AI_Output(self,other,"DIA_Cassia_News_16_03");	//� �� ����� ���� ���� ����. �� ������ �������������� � ���.
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_News_16_04");	//������ ����������, ��� ����� ������ ����. ������ ���������� ����. �� � �� ������ ����� ������.
		AI_Output(other,self,"DIA_Cassia_News_15_05");	//��� ��� �� ����?
		AI_Output(self,other,"DIA_Cassia_News_16_06");	//�� ������, ����� �� ���� �� ��, ��� ���� ������ �� ����� ������. ��� ������ �� ������� ������.
		AI_Output(self,other,"DIA_Cassia_News_16_07");	//���� ����������� �����, ������, ��������� ����� �����������...
		AI_Output(other,self,"DIA_Cassia_News_15_08");	//... ��� �� ������ ���������� ���?
		AI_Output(self,other,"DIA_Cassia_News_16_09");	//�� ������ �������������� � ���.
	};
	if((Npc_GetTrueGuild(other) == GIL_NONE) || (Npc_GetTrueGuild(other) == GIL_NOV))
	{
		Cassia_Gildencheck = TRUE;
	};
	DG_gefunden = TRUE;
};


instance DIA_Cassia_mehr(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_mehr_Condition;
	information = DIA_Cassia_mehr_Info;
	permanent = FALSE;
	description = "�������� ��� � ����� �����������.";
};


func int DIA_Cassia_mehr_Condition()
{
	return TRUE;
};

func void DIA_Cassia_mehr_Info()
{
	AI_Output(other,self,"DIA_Cassia_mehr_15_00");	//�������� ��� � ����� �����������.
	AI_Output(self,other,"DIA_Cassia_mehr_16_01");	//�������� ������������� ���. �� ����� �� �����, ��� ��������� ���� �������.
	AI_Output(self,other,"DIA_Cassia_mehr_16_02");	//�� ��������, ��� ������ �����, ��� ����������� ����������, ��������, ��� ��� �������, � � ��� ���������� �������.
	AI_Output(self,other,"DIA_Cassia_mehr_16_03");	//� ���� ��� �� ������ ���, �� ����� �������� ��������.
};


instance DIA_Cassia_MissingPeople(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_MissingPeople_Condition;
	information = DIA_Cassia_MissingPeople_Info;
	permanent = FALSE;
	description = "��� �� ������ � ��������� �����?";
};


func int DIA_Cassia_MissingPeople_Condition()
{
	if((SC_HearedAboutMissingPeople == TRUE) && (MissingPeopleReturnedHome == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Cassia_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Cassia_Add_15_00");	//��� �� ������ � ��������� �����?
	AI_Output(self,other,"DIA_Addon_Cassia_Add_16_01");	//� ������ ��� ��� ���������� ����?
	AI_Output(other,self,"DIA_Addon_Cassia_Add_15_02");	//� ���� ��������, ��� ��������� � ����.
	AI_Output(self,other,"DIA_Addon_Cassia_Add_16_03");	//����� ������� �� �����������, ����� ����� ��������� ������.
	AI_Output(self,other,"DIA_Addon_Cassia_Add_16_04");	//��� �� ������� ������ �� ������������ ���� �������...
};


instance DIA_Cassia_Vorteil(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 3;
	condition = DIA_Cassia_Vorteil_Condition;
	information = DIA_Cassia_Vorteil_Info;
	permanent = FALSE;
	description = "� ����� ��� ������ �� ������������� � ���?";
};


func int DIA_Cassia_Vorteil_Condition()
{
	return TRUE;
};

func void DIA_Cassia_Vorteil_Info()
{
	AI_Output(other,self,"DIA_Cassia_Vorteil_15_00");	//� ����� ��� ������ �� ������������� � ���?
	AI_Output(self,other,"DIA_Cassia_Vorteil_16_01");	//�� ������ ��������� � ��� ������ ������� - �������, ������� �������� ���� ���� � �������.
	AI_Output(other,self,"DIA_Cassia_Vorteil_15_02");	//�� ��� ����� ��� �������� ���������� �����, ��?
	AI_Output(self,other,"DIA_Cassia_Vorteil_16_03");	//(���� �������) ���. ���� ������ ����� �������������� ����� ������. ��� � ���.
};


instance DIA_Cassia_Lernen(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 4;
	condition = DIA_Cassia_Lernen_Condition;
	information = DIA_Cassia_Lernen_Info;
	permanent = FALSE;
	description = "���� � ���� ��������� � ���?";
};


func int DIA_Cassia_Lernen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cassia_Vorteil))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Lernen_Info()
{
	AI_Output(other,self,"DIA_Cassia_Lernen_15_00");	//���� � ���� ��������� � ���?
	AI_Output(self,other,"DIA_Cassia_Lernen_16_01");	//������� ����� ������� ���� ������������� ��������.
	AI_Output(self,other,"DIA_Cassia_Lernen_16_02");	//������� - ����������� ��������� �����������. �� ���� ����� �� ������ ����� ��� ���������.
	AI_Output(self,other,"DIA_Cassia_Lernen_16_03");	//� � ���� ������� ���� ���������� ���������.
	AI_Output(self,other,"DIA_Cassia_Lernen_16_04");	//����� � ���� ������ ���� ����� ����� ������. ������ �������� - ���� � ��������� ������������.
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_CityTeacher,"������ ����� ������� ���� ���������� ��������� � ������ ��� ����� ����� ������.");
	B_LogEntry(TOPIC_CityTeacher,"������� ����� ������� ���� ������������ ���������.");
	B_LogEntry(TOPIC_CityTeacher,"������� ����� ������� ���� ��������.");
};


instance DIA_Cassia_Regeln(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 3;
	condition = DIA_Cassia_Regeln_Condition;
	information = DIA_Cassia_Regeln_Info;
	permanent = FALSE;
	description = "��� � ��� �� �������?";
};


func int DIA_Cassia_Regeln_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cassia_Vorteil))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Regeln_Info()
{
	AI_Output(other,self,"DIA_Cassia_Regeln_15_00");	//��� � ��� �� �������?
	AI_Output(self,other,"DIA_Cassia_Regeln_16_02");	//������ �������: ������ �� ����� � ���. �������.
	AI_Output(self,other,"DIA_Cassia_Regeln_16_03");	//������: �� ���������.
	AI_Output(self,other,"DIA_Cassia_Regeln_16_04");	//������: ���� �� �������� ������ �����, ����� ������� �� ����-������, �� ����� ����.
	AI_Output(self,other,"DIA_Cassia_Regeln_16_05");	//� ��������� - ��������� �������: ���, ��� ����� �������������� � ���, ������ �������� ����������� ����� ���������.
};


instance DIA_Cassia_Erwischen(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_Erwischen_Condition;
	information = DIA_Cassia_Erwischen_Info;
	permanent = FALSE;
	description = "��� �����, ���� ���� �������?";
};


func int DIA_Cassia_Erwischen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cassia_Regeln))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Erwischen_Info()
{
	AI_Output(other,self,"DIA_Cassia_Erwischen_15_00");	//��� �����, ���� ���� �������?
	AI_Output(self,other,"DIA_Cassia_Erwischen_16_01");	//������ �� ���������, ������?
};


instance DIA_Cassia_beweisen(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_beweisen_Condition;
	information = DIA_Cassia_beweisen_Info;
	permanent = TRUE;
	description = "��� ��� �������� ����������� ���� ���������?";
};


var int DIA_Cassia_beweisen_permanent;

func int DIA_Cassia_beweisen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cassia_Regeln) && (DIA_Cassia_beweisen_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Cassia_beweisen_Info()
{
	AI_Output(other,self,"DIA_Cassia_beweisen_15_00");	//��� ��� �������� ����������� ���� ���������?
	if(Join_Thiefs == FALSE)
	{
		AI_Output(self,other,"DIA_Cassia_beweisen_16_01");	//��� �� �������������� � ��� ��� ���?
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_beweisen_16_02");	//� ����� �������� �������� - �����������, ���� ���������� ������.
		AI_Output(self,other,"DIA_Cassia_beweisen_16_03");	//�� ��� ��� ������ �� � ����. � ����, ����� ��� �������� ��� ����.
		MIS_CassiaRing = LOG_Running;
		DIA_Cassia_beweisen_permanent = TRUE;
		Log_CreateTopic(Topic_CassiaRing,LOG_MISSION);
		Log_SetTopicStatus(Topic_CassiaRing,LOG_Running);
		B_LogEntry(Topic_CassiaRing,"������ �����, ����� � ������ �� ������ �����������.");
	};
};


instance DIA_Cassia_Beitreten(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 10;
	condition = DIA_Cassia_Beitreten_Condition;
	information = DIA_Cassia_Beitreten_Info;
	permanent = FALSE;
	description = "������, � � ����.";
};


func int DIA_Cassia_Beitreten_Condition()
{
	if((Join_Thiefs == FALSE) && Npc_KnowsInfo(other,DIA_Cassia_Regeln))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Beitreten_Info()
{
	AI_Output(other,self,"DIA_Cassia_Beitreten_15_00");	//������, � � ����.
	AI_Output(self,other,"DIA_Cassia_Beitreten_16_01");	//�������. ���� ����� ���� ����������� �������� ����. � ���� �� �������� ����-������ ��������� � ��� - ������ ����������.
	Join_Thiefs = TRUE;
};


instance DIA_Cassia_Ablehnen(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 9;
	condition = DIA_Cassia_Ablehnen_Condition;
	information = DIA_Cassia_Ablehnen_Info;
	permanent = FALSE;
	description = "� ��� ���� � �� ���� �������������� � ���?..";
};


func int DIA_Cassia_Ablehnen_Condition()
{
	if((Join_Thiefs == FALSE) && Npc_KnowsInfo(other,DIA_Cassia_Regeln))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Ablehnen_Info()
{
	AI_Output(other,self,"DIA_Cassia_Ablehnen_15_00");	//� ��� ���� � �� ���� �������������� � ���?..
	if(MIS_ThiefGuild_sucked == FALSE)
	{
		AI_Output(self,other,"DIA_Cassia_Ablehnen_16_01");	//�� ������� ����, ������� ������ ���� ��� � �����, �� �� ������ ����.
		AI_Output(self,other,"DIA_Cassia_Ablehnen_16_02");	//(��������) � ���� �� �����, ����� ������� ���. �� ������ ��������� �� ����.
		Info_ClearChoices(DIA_Cassia_Ablehnen);
		Info_AddChoice(DIA_Cassia_Ablehnen,"������, � � ����.",DIA_Cassia_Ablehnen_Okay);
		Info_AddChoice(DIA_Cassia_Ablehnen,"��� ����� ����� �� �����������.",DIA_Cassia_Ablehnen_Frist);
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_Ablehnen_16_03");	//� ����� ������, � ���� ����.
		Info_ClearChoices(DIA_Cassia_Ablehnen);
		Info_AddChoice(DIA_Cassia_Ablehnen,"������, � � ����.",DIA_Cassia_Ablehnen_Okay);
		Info_AddChoice(DIA_Cassia_Ablehnen,"��, ����� �������� ���� �����.",DIA_Cassia_Ablehnen_Kill);
	};
};

func void DIA_Cassia_Ablehnen_Okay()
{
	AI_Output(other,self,"DIA_Cassia_Ablehnen_Okay_15_00");	//������, � � ����.
	AI_Output(self,other,"DIA_Cassia_Ablehnen_Okay_16_01");	//(���������) �� ������ ������ �������. ���� �� ������� �������� ����������� ����� ���������, �� ������� ������� � ���� ����.
	AI_Output(self,other,"DIA_Cassia_Ablehnen_Okay_16_02");	//���� �� �� ������ ������� �������� ��������� ������ - ���������� - ��� ���� �����������.
	Join_Thiefs = TRUE;
	Info_ClearChoices(DIA_Cassia_Ablehnen);
};

func void DIA_Cassia_Ablehnen_Kill()
{
	AI_Output(other,self,"DIA_Cassia_Ablehnen_Kill_15_00");	//��, ����� �������� ���� �����.
	AI_Output(self,other,"DIA_Cassia_Ablehnen_Kill_16_01");	//����. � ������, �� �����.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Cassia_Ablehnen_Frist()
{
	AI_Output(other,self,"DIA_Cassia_Ablehnen_Frist_15_00");	//��� ����� ����� �� �����������.
	AI_Output(self,other,"DIA_Cassia_Ablehnen_Frist_16_01");	//����������. � ��� ���� ��� ��� �� �������� ����� �������. ����� �����, ���� ����� �� ���������� �����.
	Cassia_Day = B_GetDayPlus();
	Cassia_Frist = TRUE;
	Info_ClearChoices(DIA_Cassia_Ablehnen);
};


instance DIA_Cassia_BevorLernen(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 5;
	condition = DIA_Cassia_BevorLernen_Condition;
	information = DIA_Cassia_BevorLernen_Info;
	permanent = TRUE;
	description = "�� ������ ������� ����?";
};


func int DIA_Cassia_BevorLernen_Condition()
{
	if((Join_Thiefs == TRUE) && Npc_KnowsInfo(other,DIA_Cassia_Lernen) && ((Cassia_TeachPickpocket == FALSE) || (Cassia_TeachDEX == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_Cassia_BevorLernen_Info()
{
	AI_Output(other,self,"DIA_Cassia_BevorLernen_15_00");	//�� ������ ������� ����?
	if(MIS_ThiefGuild_sucked == FALSE)
	{
		AI_Output(self,other,"DIA_Cassia_BevorLernen_16_01");	//�������, ��� �������. ������ ����� ���, ����� ������ �����.
		Cassia_TeachPickpocket = TRUE;
		Cassia_TeachDEX = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_BevorLernen_16_02");	//�������. ��������� ��������� � �������� ��������� ���� �� 100 ������� �����.
		Info_ClearChoices(DIA_Cassia_BevorLernen);
		Info_AddChoice(DIA_Cassia_BevorLernen,"����� ����, ����� ...(�����)",DIA_Cassia_BevorLernen_Spaeter);
		if(Cassia_TeachPickpocket == FALSE)
		{
			Info_AddChoice(DIA_Cassia_BevorLernen,"� ���� ��������� ���������� ��������� (��������� 100 �������).",DIA_Cassia_BevorLernen_Pickpocket);
		};
		if(Cassia_TeachDEX == FALSE)
		{
			Info_AddChoice(DIA_Cassia_BevorLernen,"� ���� ����� ����� ������ (��������� 100 �������).",DIA_Cassia_BevorLernen_DEX);
		};
	};
};

func void DIA_Cassia_BevorLernen_Spaeter()
{
	Info_ClearChoices(DIA_Cassia_BevorLernen);
};

func void DIA_Cassia_BevorLernen_DEX()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		AI_Output(other,self,"DIA_Cassia_BevorLernen_DEX_15_00");	//� ���� ����� ����� ������. ��� ������.
		AI_Output(self,other,"DIA_Cassia_BevorLernen_DEX_16_01");	//�� ����� ������, ����� �� ������ �����.
		Cassia_TeachDEX = TRUE;
		Info_ClearChoices(DIA_Cassia_BevorLernen);
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_DIA_Cassia_BevorLernen_DEX_16_02");	//�����������, ����� � ���� ����� ������.
		Info_ClearChoices(DIA_Cassia_BevorLernen);
	};
};

func void DIA_Cassia_BevorLernen_Pickpocket()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		AI_Output(other,self,"DIA_Cassia_BevorLernen_Pickpocket_15_00");	//� ���� ��������� ���������� ���������. ��� ������.
		AI_Output(self,other,"DIA_Cassia_BevorLernen_Pickpocket_16_01");	//�� ����� ������, ����� �� ������ �����.
		Cassia_TeachPickpocket = TRUE;
		Info_ClearChoices(DIA_Cassia_BevorLernen);
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_BevorLernen_Pickpocket_16_02");	//�����������, ����� � ���� ����� ������.
		Info_ClearChoices(DIA_Cassia_BevorLernen);
	};
};


instance DIA_Cassia_TEACH(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 12;
	condition = DIA_Cassia_TEACH_Condition;
	information = DIA_Cassia_TEACH_Info;
	permanent = TRUE;
	description = "� ���� ����� ����� ������.";
};


func int DIA_Cassia_TEACH_Condition()
{
	if(Cassia_TeachDEX == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Cassia_TEACH_Info()
{
	AI_Output(other,self,"DIA_Cassia_TEACH_15_00");	//� ���� ����� ����� ������.
	Info_ClearChoices(DIA_Cassia_TEACH);
	Info_AddChoice(DIA_Cassia_TEACH,Dialog_Back,DIA_Cassia_TEACH_BACK);
	Info_AddChoice(DIA_Cassia_TEACH,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Cassia_TEACH_1);
	Info_AddChoice(DIA_Cassia_TEACH,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Cassia_TEACH_5);
};

func void DIA_Cassia_TEACH_BACK()
{
	Info_ClearChoices(DIA_Cassia_TEACH);
};

func void DIA_Cassia_TEACH_1()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MAX);
	Info_ClearChoices(DIA_Cassia_TEACH);
	Info_AddChoice(DIA_Cassia_TEACH,Dialog_Back,DIA_Cassia_TEACH_BACK);
	Info_AddChoice(DIA_Cassia_TEACH,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Cassia_TEACH_1);
	Info_AddChoice(DIA_Cassia_TEACH,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Cassia_TEACH_5);
};

func void DIA_Cassia_TEACH_5()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MAX);
	Info_ClearChoices(DIA_Cassia_TEACH);
	Info_AddChoice(DIA_Cassia_TEACH,Dialog_Back,DIA_Cassia_TEACH_BACK);
	Info_AddChoice(DIA_Cassia_TEACH,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Cassia_TEACH_1);
	Info_AddChoice(DIA_Cassia_TEACH,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Cassia_TEACH_5);
};


instance DIA_Cassia_Pickpocket(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 10;
	condition = DIA_Cassia_Pickpocket_Condition;
	information = DIA_Cassia_Pickpocket_Info;
	permanent = TRUE;
	description = "����� ���� ���������� ��������� (10 LP)";
};


func int DIA_Cassia_Pickpocket_Condition()
{
	if((Cassia_TeachPickpocket == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Pickpocket_Info()
{
	AI_Output(other,self,"DIA_Cassia_Pickpocket_15_00");	//����� ���� ���������� ���������.
	if(B_TeachThiefTalent(self,other,NPC_TALENT_PICKPOCKET))
	{
		AI_Output(self,other,"DIA_Cassia_Pickpocket_16_01");	//���� �� ������ ��������� ���-������ �������, ������� ���. ������ ����� �������� � ���, ��������.
		AI_Output(self,other,"DIA_Cassia_Pickpocket_16_02");	//� ����� ������ �������������, ����� ���. ������� �������� �� ���������������� �������, ������������� ��� ������� ������ �� ���. �, ����� �������, ��������� �������, ��������� �� ���������.
		AI_Output(self,other,"DIA_Cassia_Pickpocket_16_03");	//��������� ������� ��������� �������� - ��� ������ �� �� �� �����, ��� ������� � ����������� ��������. ����� �� ����.
		AI_Output(self,other,"DIA_Cassia_Pickpocket_16_04");	//���� �� �������, �� ������� �� ������ ��������. �, ������� �����: ������ �������� ������������.
	};
};


instance DIA_Cassia_Aufnahme(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_Aufnahme_Condition;
	information = DIA_Cassia_Aufnahme_Info;
	permanent = FALSE;
	description = "� ������ ������ �����������.";
};


func int DIA_Cassia_Aufnahme_Condition()
{
	if((MIS_CassiaRing == LOG_Running) && (Npc_HasItems(other,ItRi_Prot_Point_01_MIS) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Aufnahme_Info()
{
	AI_Output(other,self,"DIA_Cassia_Aufnahme_15_00");	//� ������ ������ �����������.
	B_GiveInvItems(other,self,ItRi_Prot_Point_01_MIS,1);
	AI_Output(self,other,"DIA_Cassia_Aufnahme_16_01");	//����������. �� ������ ������������� ����. ������ �� ���� �� ���.
	AI_Output(self,other,"DIA_Cassia_Aufnahme_16_02");	//������ ���� ����. �� ��������� ����� � �����. (���������) ������ ���� �� �������� ������ ��� ����� ����.
	B_GiveInvItems(self,other,ItKe_ThiefGuildKey_Hotel_MIS,1);
	AI_Output(self,other,"DIA_Cassia_Aufnahme_16_03");	//����� ����, �� ������ �����, ��� � ��� ���� ��������� ����. ������ �����.
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Cassia_Aufnahme_16_04");	//��� �����. ����� �� �������� � ����������� ������ � ������� ���� ����, ��� ������, ��� �� ���� �� ���.
	MIS_CassiaRing = LOG_SUCCESS;
	B_GivePlayerXP(XP_CassiaRing);
	Knows_SecretSign = TRUE;
	Log_CreateTopic(Topic_Diebesgilde,LOG_NOTE);
	B_LogEntry(Topic_Diebesgilde,"� ��� ������ � ������� �����.");
	B_LogEntry(Topic_Diebesgilde,"� ���� ���� �����. ���� � ������ ��� ������ �����, ��� ������, ��� � ���� �� ���.");
};


instance DIA_Cassia_Versteck(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_Versteck_Condition;
	information = DIA_Cassia_Versteck_Info;
	permanent = FALSE;
	description = "� ��� �� ������� ������������?";
};


func int DIA_Cassia_Versteck_Condition()
{
	if((MIS_CassiaRing == LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_Ramirez_Beute))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Versteck_Info()
{
	AI_Output(other,self,"DIA_Cassia_Versteck_15_00");	//� ��� �� ������� ������������?
	AI_Output(self,other,"DIA_Cassia_Versteck_16_01");	//�� �������, � ���� ��� ��� ������ ��� � ������?
	AI_Output(self,other,"DIA_Cassia_Versteck_16_02");	//� ���� ����� ���������� ������������ ������ ��������� ���������. ����� - ������ ������ �������� �� � ���.
};


instance DIA_Cassia_Blutkelche(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_Blutkelche_Condition;
	information = DIA_Cassia_Blutkelche_Info;
	permanent = FALSE;
	description = "� ���� ���� ������ ��� ����?";
};


func int DIA_Cassia_Blutkelche_Condition()
{
	if((MIS_CassiaRing == LOG_SUCCESS) && (MIS_CassiaKelche != LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Blutkelche_Info()
{
	AI_Output(other,self,"DIA_Cassia_Blutkelche_15_00");	//� ���� ���� ������ ��� ����?
	if(PETZCOUNTER_City_Theft > 0)
	{
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_01");	//���, ���� �� �������������� � ������ �� ���������.
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_02");	//���������� ��� �������� - ������� ����� ��� �������� �� ����������. ���� �� �������, ��� �� ��� ��������, ���� �� ���� �������� ������ �� ����.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_03");	//��. ���� ���������� ��������� ������. ����� �� �����.
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_04");	//������ ����� �������� �� ���-�� �� ����� ����� �� ����� �������� - �� ��� ����� ��� �������� �������� ����� ����� ����� �����. ��� ������ ��� ���������� �������� �����.
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_05");	//������ �� ������ ��� �� ���� �� �������� ����� - �� ��� �����, ��������� ������, ����� ����� ���������.
		AI_Output(other,self,"DIA_Cassia_Blutkelche_15_06");	//��� ��� �����?
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_07");	//��� �����, � ������ - ��� ������� ������� �������� �� �������� ��������.
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_08");	//������� �� ���. � ��� �������� � ������ ���������� ��� ���.
		AI_Output(other,self,"DIA_Cassia_Blutkelche_15_09");	//� ��� ��� � ����� �����?
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_10");	//���� �������� �� ������, ���� �� ������� ������� ���-������ �� ���� ������������.
		MIS_CassiaKelche = LOG_Running;
		Log_CreateTopic(Topic_CassiaKelche,LOG_MISSION);
		Log_SetTopicStatus(Topic_CassiaKelche,LOG_Running);
		B_LogEntry(Topic_CassiaKelche,"������ �����, ����� � ������ �� ����� �������� ������. ��-��������, ��� ��������� � ������.");
	};
};


instance DIA_Cassia_abgeben(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_abgeben_Condition;
	information = DIA_Cassia_abgeben_Info;
	permanent = TRUE;
	description = "������ �������� ������...";
};


func int DIA_Cassia_abgeben_Condition()
{
	if(MIS_CassiaKelche == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Cassia_abgeben_Info()
{
	AI_Output(other,self,"DIA_Cassia_abgeben_15_00");	//������ �������� ������...
	if(B_GiveInvItems(other,self,ItMi_BloodCup_MIS,6))
	{
		AI_Output(other,self,"DIA_Cassia_abgeben_15_01");	//� ���� ���� ��� ����� ������.
		AI_Output(self,other,"DIA_Cassia_abgeben_16_02");	//�������� ������. � � ��� �������� ��������� ����������.
		AI_Output(self,other,"DIA_Cassia_abgeben_16_03");	//�� ������ �������� ���� �������. �������, ��� ������ ��� ��� ����.
		AI_Output(self,other,"DIA_Cassia_abgeben_16_04");	//��� ������ ������ ���� ����������, �� �� ������ ������� � ����, ����� ��������. �� � ������ ����� - �� ���� ������� ����� ��� ����� �����... (���������)
		MIS_CassiaKelche = LOG_SUCCESS;
		B_GivePlayerXP(XP_CassiaBlutkelche);
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_abgeben_16_05");	//� ���� ������� ��� ����� ������ ��� ������. ������� ��� ��� �����.
	};
};


instance DIA_Cassia_Belohnung(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_Belohnung_Condition;
	information = DIA_Cassia_Belohnung_Info;
	permanent = FALSE;
	description = "� ������ �� ����� ��������.";
};


func int DIA_Cassia_Belohnung_Condition()
{
	if(MIS_CassiaKelche == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Cassia_Belohnung_Info()
{
	AI_Output(other,self,"DIA_Cassia_Belohnung_15_00");	//� ������ �� ����� ��������.
	AI_Output(self,other,"DIA_Cassia_Belohnung_16_01");	//��� �� ���������?
	Info_ClearChoices(DIA_Cassia_Belohnung);
	Info_AddChoice(DIA_Cassia_Belohnung,"400 �������.",DIA_Cassia_Belohnung_Gold);
	Info_AddChoice(DIA_Cassia_Belohnung,"4 �������� ��������",DIA_Cassia_Belohnung_Trank);
	Info_AddChoice(DIA_Cassia_Belohnung,NAME_ADDON_CASSIASBELOHNUNGSRING,DIA_Cassia_Belohnung_Ring);
};

func void DIA_Cassia_Belohnung_Gold()
{
	AI_Output(other,self,"DIA_Cassia_Belohnung_15_02");	//��� ��� ������.
	B_GiveInvItems(self,other,ItMi_Gold,400);
	Info_ClearChoices(DIA_Cassia_Belohnung);
};

func void DIA_Cassia_Belohnung_Trank()
{
	AI_Output(other,self,"DIA_Cassia_Belohnung_15_03");	//��� ��� �����.
	B_GiveInvItems(self,other,ItPo_Health_03,4);
	Info_ClearChoices(DIA_Cassia_Belohnung);
};

func void DIA_Cassia_Belohnung_Ring()
{
	AI_Output(other,self,"DIA_Cassia_Belohnung_15_04");	//��� ��� ������.
	B_GiveInvItems(self,other,ItRi_HP_01,1);
	Info_ClearChoices(DIA_Cassia_Belohnung);
};

