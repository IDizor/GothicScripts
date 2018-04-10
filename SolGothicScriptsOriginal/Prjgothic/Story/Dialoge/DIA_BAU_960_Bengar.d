
instance DIA_Bengar_EXIT(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 999;
	condition = DIA_Bengar_EXIT_Condition;
	information = DIA_Bengar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bengar_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Bengar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Bengar_HALLO(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 3;
	condition = DIA_Bengar_HALLO_Condition;
	information = DIA_Bengar_HALLO_Info;
	description = "�� ������� ������?";
};


func int DIA_Bengar_HALLO_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Bengar_HALLO_Info()
{
	AI_Output(other,self,"DIA_Bengar_HALLO_15_00");	//�� ������� ������?
	AI_Output(self,other,"DIA_Bengar_HALLO_10_01");	//����� ������� � ���, ���� �� ����� ����, � ������� ���������.
	AI_Output(self,other,"DIA_Bengar_HALLO_10_02");	//��� ����� ����� ����������� ������ �������� ��������������.
};


instance DIA_Bengar_WOVONLEBTIHR(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 5;
	condition = DIA_Bengar_WOVONLEBTIHR_Condition;
	information = DIA_Bengar_WOVONLEBTIHR_Info;
	description = "��� �� ������������� �� �����?";
};


func int DIA_Bengar_WOVONLEBTIHR_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bengar_HALLO) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Bengar_WOVONLEBTIHR_Info()
{
	AI_Output(other,self,"DIA_Bengar_WOVONLEBTIHR_15_00");	//��� �� ������������� �� �����?
	AI_Output(self,other,"DIA_Bengar_WOVONLEBTIHR_10_01");	//� �������� ������ � ������ ����. �� �, ������� ��, �� ����� ���������� ���� � �������� � ����.
	AI_Output(self,other,"DIA_Bengar_WOVONLEBTIHR_10_02");	//���� ������� ��� ���� ���� ���������� � ��� ���������� ���-�� �������� ��. ����� ��������� �� ��� ������� ��������, ���������?
};


instance DIA_Bengar_TAGELOEHNER(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 6;
	condition = DIA_Bengar_TAGELOEHNER_Condition;
	information = DIA_Bengar_TAGELOEHNER_Info;
	description = "�� ��������� �������� �������?";
};


func int DIA_Bengar_TAGELOEHNER_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bengar_WOVONLEBTIHR) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Bengar_TAGELOEHNER_Info()
{
	AI_Output(other,self,"DIA_Bengar_TAGELOEHNER_15_00");	//�� ��������� �������� �������?
	AI_Output(self,other,"DIA_Bengar_TAGELOEHNER_10_01");	//���� ��������� ����������, ������� �� ����� �� ��� �����.
	AI_Output(self,other,"DIA_Bengar_TAGELOEHNER_10_02");	//����� �� �������� �� �� ���. � ������ ��, � ��� �������� �� ����.
};


instance DIA_Addon_Bengar_MissingPeople(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 5;
	condition = DIA_Addon_Bengar_MissingPeople_Condition;
	information = DIA_Addon_Bengar_MissingPeople_Info;
	description = "�� ��������� �� ����� � ��������� ����� ���-������ ���������?";
};


func int DIA_Addon_Bengar_MissingPeople_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bengar_WOVONLEBTIHR) && (SC_HearedAboutMissingPeople == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bengar_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Bengar_MissingPeople_15_00");	//�� ��������� �� ����� � ��������� ����� ���-������ ���������?
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_10_01");	//� ��������� ��� ���������� ����� ��������� �����.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_10_02");	//�� ����� ��������� ���� ������������ �������.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_10_03");	//��� ���� �� ���� �������. ���������, �� �� �� ���, ��� �������� � ���� ���������� ������ ��� ������� � ������� � ����������� �����������.
	Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_MissingPeople,"� ������� ������� ������ ��� �������� - ������.");
	MIS_Bengar_BringMissPeopleBack = LOG_Running;
	B_GivePlayerXP(XP_Ambient);
	Info_ClearChoices(DIA_Addon_Bengar_MissingPeople);
	Info_AddChoice(DIA_Addon_Bengar_MissingPeople,Dialog_Back,DIA_Addon_Bengar_MissingPeople_back);
	Info_AddChoice(DIA_Addon_Bengar_MissingPeople,"���� �����-������ �����?",DIA_Addon_Bengar_MissingPeople_Hint);
	Info_AddChoice(DIA_Addon_Bengar_MissingPeople,"����� ����, ��� ������ ��� �������.",DIA_Addon_Bengar_MissingPeople_voll);
	Info_AddChoice(DIA_Addon_Bengar_MissingPeople,"��� ������ � ��� ������������ ���������� ���� ��������?",DIA_Addon_Bengar_MissingPeople_was);
};

func void DIA_Addon_Bengar_MissingPeople_was()
{
	AI_Output(other,self,"DIA_Addon_Bengar_MissingPeople_was_15_00");	//��� ������ � ��� ������������ ���������� ���� ��������?
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_was_10_01");	//������ �������� �������. ����� ������� ����������, �� ������� �� ������ �� ����� - ������� �������� ����.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_was_10_02");	//�� �������� �� ������ ���� ��� ���� ������� ����.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_was_10_03");	//� �������, �������� ��� �������� ���������, �� ������� �� ��������...
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_was_10_04");	//(� �����������) � ��� �������, ���-�� �� ����. ��������.
	AI_Output(other,self,"DIA_Addon_Bengar_MissingPeople_was_15_05");	//������� �� ����� ���������.
};

func void DIA_Addon_Bengar_MissingPeople_voll()
{
	AI_Output(other,self,"DIA_Addon_Bengar_MissingPeople_voll_15_00");	//����� ����, ��� ������ ��� �������.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_voll_10_01");	//������ �� ����� ���� ���� ��� ������. � �� ���� ���� ����������� ����, ����� �� ���� �������� � ������� �������.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_voll_10_02");	//� ���� �� ������� ���, ��� �����.
};

func void DIA_Addon_Bengar_MissingPeople_Hint()
{
	AI_Output(other,self,"DIA_Addon_Bengar_MissingPeople_Hint_15_00");	//���� �����-������ �����?
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_Hint_10_01");	//�����, ��� �������� �������. � ��������� ����� ��� ���������� ����� �������.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_Hint_10_02");	//������� � �����, ��� ��� ������ � ���� ������ ����������.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_Hint_10_03");	//������, ��� ��� ���������� ������� ��� �����.
	Info_AddChoice(DIA_Addon_Bengar_MissingPeople,"��� ��������� ������ ��������?",DIA_Addon_Bengar_MissingPeople_Lager);
};


var int Bengar_ToldAboutRangerBandits;

func void DIA_Addon_Bengar_MissingPeople_Lager()
{
	AI_Output(other,self,"DIA_Addon_Bengar_MissingPeople_Lager_15_00");	//��� ��������� ������ ��������?
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_Lager_10_01");	//���, ��� ��������� ��� ����, ���� ��������, ������� � ��������� ������. ��� ��� � ������������.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_Lager_10_02");	//� ����� �������� ��� �������, �� � ����� ������� ��� �� ����������.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_Lager_10_03");	//����, ������, ���� ����� ��������� �� ��� ��������. ������ ��� �� �����.
	Bengar_ToldAboutRangerBandits = TRUE;
};

func void DIA_Addon_Bengar_MissingPeople_back()
{
	Info_ClearChoices(DIA_Addon_Bengar_MissingPeople);
};


instance DIA_Addon_Bengar_ReturnPardos(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 5;
	condition = DIA_Addon_Bengar_ReturnPardos_Condition;
	information = DIA_Addon_Bengar_ReturnPardos_Info;
	description = "������ ��������?";
};


func int DIA_Addon_Bengar_ReturnPardos_Condition()
{
	if((MIS_Bengar_BringMissPeopleBack == LOG_Running) && (Npc_GetDistToWP(Pardos_NW,"NW_FARM3_HOUSE_IN_NAVI_2") <= 1000) && (MissingPeopleReturnedHome == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bengar_ReturnPardos_Info()
{
	AI_Output(other,self,"DIA_Addon_Bengar_ReturnPardos_15_00");	//������ ��������?
	AI_Output(self,other,"DIA_Addon_Bengar_ReturnPardos_10_01");	//��, �� � ����, ��������. ������� �� ���...
	AI_Output(other,self,"DIA_Addon_Bengar_ReturnPardos_15_02");	//�� �����.
	AI_Output(self,other,"DIA_Addon_Bengar_ReturnPardos_10_03");	//� ����� �� ��������� ����, �� � ���� ������ ���...
	AI_Output(other,self,"DIA_Addon_Bengar_ReturnPardos_15_04");	//������ �� ����.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Addon_Bengar_FernandosWeapons(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 5;
	condition = DIA_Addon_Bengar_FernandosWeapons_Condition;
	information = DIA_Addon_Bengar_FernandosWeapons_Info;
	description = "����� ������� ����� ���������, � ��� ���� ������?";
};


func int DIA_Addon_Bengar_FernandosWeapons_Condition()
{
	if((Bengar_ToldAboutRangerBandits == TRUE) && (MIS_Vatras_FindTheBanditTrader == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bengar_FernandosWeapons_Info()
{
	AI_Output(other,self,"DIA_Addon_Bengar_FernandosWeapons_15_00");	//����� ������� ����� ���������, � ��� ���� ������?
	AI_Output(self,other,"DIA_Addon_Bengar_FernandosWeapons_10_01");	//��� �� ������ ������? ����� ��� ������� ������ ��� ������?
	AI_Output(other,self,"DIA_Addon_Bengar_FernandosWeapons_15_02");	//� ���� � ����, ����� ������. ������� ����.
	AI_Output(self,other,"DIA_Addon_Bengar_FernandosWeapons_10_03");	//�, �������. ��, ����� ���� ��� �� �� ���� ������, � ���������, ��� ������ ������������� ���� �����.
	AI_Output(self,other,"DIA_Addon_Bengar_FernandosWeapons_10_04");	//����� ���� � ������, ����� - � ������, � ��� ����� ��� ����� �� ������.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Bengar_REBELLIEREN(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 8;
	condition = DIA_Bengar_REBELLIEREN_Condition;
	information = DIA_Bengar_REBELLIEREN_Info;
	description = "��� �� ������� �� �����?";
};


func int DIA_Bengar_REBELLIEREN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bengar_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Bengar_REBELLIEREN_Info()
{
	AI_Output(other,self,"DIA_Bengar_REBELLIEREN_15_00");	//��� �� ������� �� �����?
	AI_Output(self,other,"DIA_Bengar_REBELLIEREN_10_01");	//��� ������ �������. ��-�� ���� ��� ���� �������.
	AI_Output(self,other,"DIA_Bengar_REBELLIEREN_10_02");	//������� ������ �������� �� ������ � �������� ���, ������ ��������, �������������� �� ���, ��� �� �������.
	AI_Output(self,other,"DIA_Bengar_REBELLIEREN_10_03");	//�� � ���� ��� ������. ��������� �������� ���� ������ ����� �������� ������, � �� �����, ����� �������� ��� �����.
	AI_Output(self,other,"DIA_Bengar_REBELLIEREN_10_04");	//���� � ���� ��������� ���������� � ������, � �������� ������ ����.
	AI_Output(self,other,"DIA_Bengar_REBELLIEREN_10_05");	//� ���, ���� ���� �� ������ ��������� ��������� ����������, ��� �� ��� �����.
};


instance DIA_Bengar_PALADINE(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 9;
	condition = DIA_Bengar_PALADINE_Condition;
	information = DIA_Bengar_PALADINE_Info;
	description = "� ��� �� ������ ������ ����������� �����?";
};


func int DIA_Bengar_PALADINE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bengar_REBELLIEREN) && ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL)))
	{
		return TRUE;
	};
};

func void DIA_Bengar_PALADINE_Info()
{
	AI_Output(other,self,"DIA_Bengar_PALADINE_15_00");	//� ��� �� ������ ������ ����������� �����?
	AI_Output(self,other,"DIA_Bengar_PALADINE_10_01");	//��� ��������. � ��� ���, ��� �������� ������� � �����, �� ����� ������� ���������. ������ ��������.
	AI_Output(self,other,"DIA_Bengar_PALADINE_10_02");	//������ ��� ������� ��������� ����� ���������� � ��� ���� ����. ��� ������ ���, ��� ������ �����, � �������� ������ �� ������ � ����.
	AI_Output(self,other,"DIA_Bengar_PALADINE_10_03");	//������������ ��������, ��� � ������ �����-���� �����, ��� ��� �� ��� ��������� � �������.
	AI_Output(self,other,"DIA_Bengar_PALADINE_10_04");	//��� �� �����������, ���� ���� ��������� ������� ��� ����.
};


instance DIA_Bengar_PASS(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 10;
	condition = DIA_Bengar_PASS_Condition;
	information = DIA_Bengar_PASS_Info;
	description = "� �������?";
};


func int DIA_Bengar_PASS_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bengar_PALADINE))
	{
		return TRUE;
	};
};

func void DIA_Bengar_PASS_Info()
{
	AI_Output(other,self,"DIA_Bengar_PASS_15_00");	//� �������?
	AI_Output(self,other,"DIA_Bengar_PASS_10_01");	//��. ������ � ������ ������ �������� ��������� � �������� � ������ ����� ����� �����������.
	AI_Output(self,other,"DIA_Bengar_PASS_10_02");	//������ ������ � ���. �� ��� ������ ���� ��� � ������.
};


instance DIA_Bengar_MILIZ(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 11;
	condition = DIA_Bengar_MILIZ_Condition;
	information = DIA_Bengar_MILIZ_Info;
	permanent = FALSE;
	description = "� ������ ������ ���� �������� � ����������.";
};


func int DIA_Bengar_MILIZ_Condition()
{
	if((MIS_Torlof_BengarMilizKlatschen == LOG_Running) && Npc_KnowsInfo(other,DIA_Bengar_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Bengar_MILIZ_Info()
{
	AI_Output(other,self,"DIA_Bengar_MILIZ_15_00");	//� ������ ������ ���� �������� � ����������.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Bengar_MILIZ_10_01");	//���?! � ������ �����, ����� �� ������� ����� ���������.
		AI_Output(other,self,"DIA_Bengar_MILIZ_15_02");	//��� ��� ���� �������� ����.
		AI_Output(self,other,"DIA_Bengar_MILIZ_10_03");	//����! �� �� ������, ��� ��������� ������� �� ����, ���� � ���� ������ �� ���������?
	}
	else
	{
		AI_Output(self,other,"DIA_Bengar_MILIZ_10_04");	//� �� �����, ��� ����� �� ������.
		AI_Output(self,other,"DIA_Bengar_MILIZ_10_05");	//� ������ �� ���� ����� ��� ���� ���� �����. � �� ��� � ����� ���� �����?!
	};
	AI_Output(self,other,"DIA_Bengar_MILIZ_10_06");	//��� ������� ���������� ���� ������ ������ � �������� ������ � ������ ������.
	AI_Output(self,other,"DIA_Bengar_MILIZ_10_07");	//�� ��� ��� ������� ������.
	AI_Output(self,other,"DIA_Bengar_MILIZ_10_08");	//��� ����� ��������� � ����� ������.
};


instance DIA_Bengar_Selber(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 11;
	condition = DIA_Bengar_Selber_Condition;
	information = DIA_Bengar_Selber_Info;
	permanent = FALSE;
	description = "������ �� �� ������ ���������� � ���������� ����?";
};


func int DIA_Bengar_Selber_Condition()
{
	if((MIS_Torlof_BengarMilizKlatschen == LOG_Running) && (Bengar_MilSuccess == FALSE) && Npc_KnowsInfo(other,DIA_Bengar_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Bengar_Selber_Info()
{
	AI_Output(other,self,"DIA_Bengar_Selber_15_00");	//��� ��� ��� �����. ������ �� �� ������ ���������� � ���������� ����?
	AI_Output(self,other,"DIA_Bengar_Selber_10_01");	//��, ��� �����. �� �� �� ������ ������������� ������ ��������� ������ ���������.
};


instance DIA_Bengar_MILIZKLATSCHEN(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 12;
	condition = DIA_Bengar_MILIZKLATSCHEN_Condition;
	information = DIA_Bengar_MILIZKLATSCHEN_Info;
	permanent = FALSE;
	description = "�� � ��� ���� ���������, � ����� ����������� � ����!";
};


func int DIA_Bengar_MILIZKLATSCHEN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bengar_MILIZ) && !Npc_IsDead(Rick) && !Npc_IsDead(Rumbold) && (Rumbold_Bezahlt == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bengar_MILIZKLATSCHEN_Info()
{
	AI_Output(other,self,"DIA_Bengar_MILIZKLATSCHEN_15_00");	//�� � ��� ���� ���������, � ����� ����������� � ����!
	AI_Output(self,other,"DIA_Bengar_MILIZKLATSCHEN_10_01");	//���, ��� ��� ����. ������, � �� ������� ����.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Bengar_MILIZKLATSCHEN_10_02");	//������ �� �������!
	}
	else
	{
		AI_Output(self,other,"DIA_Bengar_MILIZKLATSCHEN_10_03");	//����� ����! ������ ��, ��� ���� ������.
	};
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MilComing");
	if(Hlp_IsValidNpc(Rick) && !Npc_IsDead(Rick))
	{
		Npc_ExchangeRoutine(Rick,"MilComing");
		AI_ContinueRoutine(Rick);
	};
	if(Hlp_IsValidNpc(Rumbold) && !Npc_IsDead(Rumbold))
	{
		Npc_ExchangeRoutine(Rumbold,"MilComing");
		AI_ContinueRoutine(Rumbold);
	};
};


var int Bengar_MilSuccess;

instance DIA_Bengar_MILIZWEG(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 12;
	condition = DIA_Bengar_MILIZWEG_Condition;
	information = DIA_Bengar_MILIZWEG_Info;
	permanent = TRUE;
	description = "���� �������� � ���������� ��� � �������.";
};


func int DIA_Bengar_MILIZWEG_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bengar_MILIZ) && (Bengar_MilSuccess == FALSE))
	{
		if((Npc_IsDead(Rick) && Npc_IsDead(Rumbold)) || (Rumbold_Bezahlt == TRUE))
		{
			return TRUE;
		};
	};
};

func void DIA_Bengar_MILIZWEG_Info()
{
	AI_Output(other,self,"DIA_Bengar_MILIZWEG_15_00");	//���� �������� � ���������� ��� � �������.
	if((Rumbold_Bezahlt == TRUE) && (Npc_IsDead(Rumbold) == FALSE))
	{
		AI_Output(self,other,"DIA_Bengar_MILIZWEG_10_01");	//�� � ��� �����? �� �� ������, ��� ��� ������� �� ����, ����� �� ������?
		AI_Output(self,other,"DIA_Bengar_MILIZWEG_10_02");	//��� ��� ��� ����� ��� ���. ����� ��, ����� ��� ������� ������!
	}
	else
	{
		AI_Output(self,other,"DIA_Bengar_MILIZWEG_10_03");	//�������. �����, ���� �� ���� ����� � ���� �� � ������. �������.
		if(Rumbold_Bezahlt == TRUE)
		{
			AI_Output(self,other,"DIA_Bengar_MILIZWEG_10_04");	//�� ���� ����� ��� ��������� �� ����. ��� ����� ���������� � ����� �������.
			B_GivePlayerXP(XP_Bengar_MILIZKLATSCHEN + 50);
		}
		else
		{
			B_GivePlayerXP(XP_Bengar_MILIZKLATSCHEN);
		};
		Bengar_MilSuccess = TRUE;
	};
};


instance DIA_Bengar_BALTHASAR(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 13;
	condition = DIA_Bengar_BALTHASAR_Condition;
	information = DIA_Bengar_BALTHASAR_Info;
	description = "������� ���������� ��������� ���������� �� ����� ���������?";
};


func int DIA_Bengar_BALTHASAR_Condition()
{
	if((MIS_Balthasar_BengarsWeide == LOG_Running) && Npc_KnowsInfo(other,DIA_Bengar_WOVONLEBTIHR))
	{
		return TRUE;
	};
};

func void DIA_Bengar_BALTHASAR_Info()
{
	AI_Output(other,self,"DIA_Bengar_BALTHASAR_15_00");	//������� ���������� ��������� ���������� �� ����� ���������?
	AI_Output(self,other,"DIA_Bengar_BALTHASAR_10_01");	//��, ��. ��� ������ �������. � ������ ���, ��� ����� ������ ������� ������, ���� ����� ����� ����� ���� �� ���� ���������.
	AI_Output(self,other,"DIA_Bengar_BALTHASAR_10_02");	//�� ������ ������, ��� ����� ���� ���������. � ������ �� ��� �� �������� ����������.
	B_LogEntry(TOPIC_BalthasarsSchafe,"����� ������� ������� ��������� ���������� ��������� �� ��� ��������, � ������ ������� ��� ������. � ������, ��� ����� ����������� ����������� �����������.");
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Bengar_BALTHASARDARFAUFWEIDE(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 14;
	condition = DIA_Bengar_BALTHASARDARFAUFWEIDE_Condition;
	information = DIA_Bengar_BALTHASARDARFAUFWEIDE_Info;
	description = "��������� ����, � ��������� ����� ����� ������������ ���� ��������.";
};


func int DIA_Bengar_BALTHASARDARFAUFWEIDE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bengar_BALTHASAR) && (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS) && (Bengar_MilSuccess == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Bengar_BALTHASARDARFAUFWEIDE_Info()
{
	AI_Output(other,self,"DIA_Bengar_BALTHASARDARFAUFWEIDE_15_00");	//��������� ����, � ��������� ����� ����� ������������ ���� ��������.
	AI_Output(self,other,"DIA_Bengar_BALTHASARDARFAUFWEIDE_10_01");	//������?
	AI_Output(other,self,"DIA_Bengar_BALTHASARDARFAUFWEIDE_15_02");	//(���������) ������ ��� � ��� ������.
	AI_Output(self,other,"DIA_Bengar_BALTHASARDARFAUFWEIDE_10_03");	//���. ������, ��� �������.
	AI_Output(self,other,"DIA_Bengar_BALTHASARDARFAUFWEIDE_10_04");	//������ ����� �� ����� ����� ���� ���-������ �� �����.
	MIS_Balthasar_BengarsWeide = LOG_SUCCESS;
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Bengar_PERMKAP1(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 15;
	condition = DIA_Bengar_PERMKAP1_Condition;
	information = DIA_Bengar_PERMKAP1_Info;
	permanent = TRUE;
	description = "������ ����.";
};


func int DIA_Bengar_PERMKAP1_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bengar_BALTHASARDARFAUFWEIDE) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Bengar_PERMKAP1_Info()
{
	AI_Output(other,self,"DIA_Bengar_PERMKAP1_15_00");	//������ ����.
	AI_Output(self,other,"DIA_Bengar_PERMKAP1_10_01");	//�� ����.
	AI_StopProcessInfos(self);
};


instance DIA_Bengar_KAP3_EXIT(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 999;
	condition = DIA_Bengar_KAP3_EXIT_Condition;
	information = DIA_Bengar_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bengar_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Bengar_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Bengar_ALLEIN(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 30;
	condition = DIA_Bengar_ALLEIN_Condition;
	information = DIA_Bengar_ALLEIN_Info;
	description = "��� ��������?";
};


func int DIA_Bengar_ALLEIN_Condition()
{
	if(Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Bengar_ALLEIN_Info()
{
	AI_Output(other,self,"DIA_Bengar_ALLEIN_15_00");	//��� ����?
	if((Malak_isAlive_Kap3 == TRUE) && ((Npc_GetDistToWP(Malak,"FARM3") < 3000) == FALSE))
	{
		AI_Output(self,other,"DIA_Bengar_ALLEIN_10_01");	//����� ���� �� ���� � ������ � ����� ����, ��� ������� �� ����. �� ������, ��� ������������ � ����.
		AI_Output(self,other,"DIA_Bengar_ALLEIN_10_02");	//�� ������ �� ��� ���������� �����.
		MIS_GetMalakBack = LOG_Running;
	}
	else
	{
		AI_Output(self,other,"DIA_Bengar_ALLEIN_10_03");	//������� ������� �������. � ���� �� ����, ������� � ��� ����� ������������.
	};
	AI_Output(self,other,"DIA_Bengar_ALLEIN_10_04");	//����� ���� �������� ������ ���� �������� ����� ������. ����� ��� ���� ��� ������.
	AI_Output(self,other,"DIA_Bengar_ALLEIN_10_05");	//���� �� ������ ���� �������� ���� �� ��������� ���������...
	AI_Output(self,other,"DIA_Bengar_ALLEIN_10_06");	//���� �� ��� ���� ��� ����� �������� �� ����. �� �� ���������, �������. ��� �������, ��� ����� '�����'.
	MIS_BengarsHelpingSLD = LOG_Running;
	Log_CreateTopic(TOPIC_BengarALLEIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BengarALLEIN,LOG_Running);
	B_LogEntry(TOPIC_BengarALLEIN,"������ ������� ���� �� ����� �����. ����� ���� � ���� � ����� ���� ���������. ������ ������, ��� ��� ����������� � ����.");
	B_LogEntry(TOPIC_BengarALLEIN,"������ ��� ����� ��������� ����������. ��� ����� ������. �� ������� ���-�� � ��������, �������� ����� �����. ����� ����, � ���� ����� �����?!");
};


instance DIA_Bengar_MALAKTOT(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 32;
	condition = DIA_Bengar_MALAKTOT_Condition;
	information = DIA_Bengar_MALAKTOT_Info;
	description = "����� �����.";
};


func int DIA_Bengar_MALAKTOT_Condition()
{
	if(Npc_IsDead(Malak) && (Malak_isAlive_Kap3 == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Bengar_MALAKTOT_Info()
{
	AI_Output(other,self,"DIA_Bengar_MALAKTOT_15_00");	//����� �����.
	AI_Output(self,other,"DIA_Bengar_MALAKTOT_10_01");	//������ ��� ������ ��� ����.
};


instance DIA_Bengar_SLDDA(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 32;
	condition = DIA_Bengar_SLDDA_Condition;
	information = DIA_Bengar_SLDDA_Info;
	description = "� ����� ���� ��������, ��� �� � �����.";
};


func int DIA_Bengar_SLDDA_Condition()
{
	if((Npc_GetDistToWP(SLD_Wolf,"FARM3") < 3000) && (MIS_BengarsHelpingSLD == LOG_SUCCESS) && (Npc_IsDead(SLD_Wolf) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bengar_SLDDA_Info()
{
	AI_Output(other,self,"DIA_Bengar_SLDDA_15_00");	//� ����� ���� ��������, ��� �� � �����.
	AI_Output(self,other,"DIA_Bengar_SLDDA_10_01");	//� ���� ����� ��� ������� �� ���� ����� ����������. �������, �� ������ ������ ���.
	AI_Output(self,other,"DIA_Bengar_SLDDA_10_02");	//���, ������. � �����, ��� ���� ����������.
	CreateInvItems(self,ItMi_Gold,400);
	B_GiveInvItems(self,other,ItMi_Gold,400);
	B_GivePlayerXP(XP_BengarsHelpingSLDArrived);
};


instance DIA_Bengar_MALAKWIEDERDA(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 35;
	condition = DIA_Bengar_MALAKWIEDERDA_Condition;
	information = DIA_Bengar_MALAKWIEDERDA_Info;
	description = "����� ��������.";
};


func int DIA_Bengar_MALAKWIEDERDA_Condition()
{
	if((Npc_GetDistToWP(Malak,"FARM3") < 3000) && ((MIS_GetMalakBack == LOG_SUCCESS) || (NpcObsessedByDMT_Malak == TRUE)) && (Npc_IsDead(Malak) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bengar_MALAKWIEDERDA_Info()
{
	AI_Output(other,self,"DIA_Bengar_MALAKWIEDERDA_15_00");	//����� ��������.
	AI_Output(self,other,"DIA_Bengar_MALAKWIEDERDA_10_01");	//����� ������. � � �� ������, ��� ������ ������� �� ����� ���.
	B_GivePlayerXP(XP_GetMalakBack);
};


instance DIA_Bengar_PERM(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 80;
	condition = DIA_Bengar_PERM_Condition;
	information = DIA_Bengar_PERM_Info;
	permanent = TRUE;
	description = "��� ����� ������.";
};


func int DIA_Bengar_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bengar_ALLEIN) && (Kapitel >= 3))
	{
		return TRUE;
	};
};

func void DIA_Bengar_PERM_Info()
{
	AI_Output(other,self,"DIA_Bengar_PERM_15_00");	//��� ����� � �������.
	if((Npc_GetDistToWP(Malak,"FARM3") < 3000) && (Npc_IsDead(Malak) == FALSE))
	{
		AI_Output(self,other,"DIA_Bengar_PERM_10_01");	//����� ����� �����, �� �������� ����� �� ����������.
		AI_Output(self,other,"DIA_Bengar_PERM_10_02");	//���� ������ �� ���������� ����, ���� ��� ����� �������� �����.
	}
	else if(Npc_KnowsInfo(other,DIA_Bengar_SLDDA) && (Npc_IsDead(SLD_Wolf) == FALSE) && (Npc_GetDistToWP(SLD_Wolf,"FARM3") < 3000))
	{
		AI_Output(self,other,"DIA_Bengar_PERM_10_03");	//����� �������� ������, �� � �������, �� ��� �� ������ ������ ���.
	}
	else
	{
		AI_Output(self,other,"DIA_Bengar_PERM_10_04");	//��� ������ ���� ����� ����� ������ �����. ���� ������ �� ����������� � ��������� �����, �����, ��� �������� ������� ��.
		if((Malak_isAlive_Kap3 == TRUE) && (Npc_IsDead(Malak) == FALSE))
		{
			AI_Output(self,other,"DIA_Bengar_PERM_10_05");	//�������, �� ����� ��������.
		};
	};
	AI_StopProcessInfos(self);
	if(Npc_IsDead(SLD_Wolf) && (MIS_BengarsHelpingSLD == LOG_SUCCESS))
	{
		B_StartOtherRoutine(SLD_815_Soeldner,"Start");
		B_StartOtherRoutine(SLD_817_Soeldner,"Start");
	};
};


instance DIA_Bengar_KAP4_EXIT(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 999;
	condition = DIA_Bengar_KAP4_EXIT_Condition;
	information = DIA_Bengar_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bengar_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Bengar_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Bengar_KAP5_EXIT(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 999;
	condition = DIA_Bengar_KAP5_EXIT_Condition;
	information = DIA_Bengar_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bengar_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Bengar_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Bengar_KAP6_EXIT(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 999;
	condition = DIA_Bengar_KAP6_EXIT_Condition;
	information = DIA_Bengar_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bengar_KAP6_EXIT_Condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Bengar_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Bengar_PICKPOCKET(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 900;
	condition = DIA_Bengar_PICKPOCKET_Condition;
	information = DIA_Bengar_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Bengar_PICKPOCKET_Condition()
{
	return C_Beklauen(28,50);
};

func void DIA_Bengar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Bengar_PICKPOCKET);
	Info_AddChoice(DIA_Bengar_PICKPOCKET,Dialog_Back,DIA_Bengar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Bengar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Bengar_PICKPOCKET_DoIt);
};

func void DIA_Bengar_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Bengar_PICKPOCKET);
};

func void DIA_Bengar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Bengar_PICKPOCKET);
};

