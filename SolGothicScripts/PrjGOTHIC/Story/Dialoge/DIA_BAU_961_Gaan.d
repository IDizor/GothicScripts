
instance DIA_Gaan_EXIT(C_Info)
{
	npc = BAU_961_Gaan;
	nr = 999;
	condition = DIA_Gaan_EXIT_Condition;
	information = DIA_Gaan_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


var int DIA_Gaan_EXIT_oneTime;

func int DIA_Gaan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Gaan_EXIT_Info()
{
	AI_StopProcessInfos(self);
	if(DIA_Gaan_EXIT_oneTime == FALSE)
	{
		Npc_ExchangeRoutine(self,"Start");
		DIA_Gaan_EXIT_oneTime = TRUE;
	};
};


instance DIA_Addon_Gaan_MeetingIsRunning(C_Info)
{
	npc = BAU_961_Gaan;
	nr = 1;
	condition = DIA_Addon_Gaan_MeetingIsRunning_Condition;
	information = DIA_Addon_Gaan_MeetingIsRunning_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Addon_Gaan_MeetingIsRunning_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (RangerMeetingRunning == LOG_Running))
	{
		return TRUE;
	};
};


var int DIA_Addon_Gaan_MeetingIsRunning_One_time;

func void DIA_Addon_Gaan_MeetingIsRunning_Info()
{
	if(DIA_Addon_Gaan_MeetingIsRunning_One_time == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Gaan_MeetingIsRunning_03_00");	//������� ������ ����� ��� ����� ����. ����� ���������� � '������ ����'.
		DIA_Addon_Gaan_MeetingIsRunning_One_time = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Gaan_MeetingIsRunning_03_01");	//���� ����� ������ ������. ����������� � ����.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Gaan_HALLO(C_Info)
{
	npc = BAU_961_Gaan;
	nr = 3;
	condition = DIA_Gaan_HALLO_Condition;
	information = DIA_Gaan_HALLO_Info;
	description = "� ���� ����� ���������.";
};


func int DIA_Gaan_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Gaan_HALLO_Info()
{
	AI_Output(other,self,"DIA_Gaan_HALLO_15_00");	//� ���� ����� ���������.
	AI_Output(self,other,"DIA_Gaan_HALLO_03_01");	//��, ��� ����� ��������. �� ���� �� ������� �� ��� ���� �������, �� ������ ���������� ���� ������.
	AI_Output(self,other,"DIA_Gaan_HALLO_03_02");	//���� ���� ������ ����� �������� ����������� �� ����, ������, �� ��� �� ����� ������ ��������.
};


instance DIA_Gaan_WASMACHSTDU(C_Info)
{
	npc = BAU_961_Gaan;
	nr = 4;
	condition = DIA_Gaan_WASMACHSTDU_Condition;
	information = DIA_Gaan_WASMACHSTDU_Info;
	description = "��� ��?";
};


func int DIA_Gaan_WASMACHSTDU_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gaan_HALLO) && (self.aivar[AIV_TalkedToPlayer] == FALSE) && (RangerMeetingRunning != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Gaan_WASMACHSTDU_Info()
{
	AI_Output(other,self,"DIA_Gaan_WASMACHSTDU_15_00");	//��� ��?
	AI_Output(self,other,"DIA_Gaan_WASMACHSTDU_03_01");	//���� ����� ����. � ������� � ������� �� �������, �������, ���������� ����� ������������� ����������.
	AI_Output(self,other,"DIA_Gaan_WASMACHSTDU_03_02");	//� ������� ������� ����� ������� �� �������, ������ �� ������.
};


instance DIA_Addon_Gaan_Ranger(C_Info)
{
	npc = BAU_961_Gaan;
	nr = 2;
	condition = DIA_Addon_Gaan_Ranger_Condition;
	information = DIA_Addon_Gaan_Ranger_Info;
	description = "������ � ���� ����� �������������� ������?";
};


func int DIA_Addon_Gaan_Ranger_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gaan_HALLO) && (SCIsWearingRangerRing == TRUE) && (RangerMeetingRunning == 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Gaan_Ranger_Info()
{
	AI_Output(other,self,"DIA_Addon_Gaan_Ranger_15_00");	//������ � ���� ����� �������������� ������?
	AI_Output(self,other,"DIA_Addon_Gaan_Ranger_03_01");	//�� ������ ���� ������������� ������.
	AI_Output(other,self,"DIA_Addon_Gaan_Ranger_15_02");	//�� ������������ � ������ ����?
	AI_Output(self,other,"DIA_Addon_Gaan_Ranger_03_03");	//������ ���. ������� ������ � ����� ����� ������ ��������.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Addon_Gaan_AufgabeBeimRing(C_Info)
{
	npc = BAU_961_Gaan;
	nr = 2;
	condition = DIA_Addon_Gaan_AufgabeBeimRing_Condition;
	information = DIA_Addon_Gaan_AufgabeBeimRing_Info;
	description = "� ��� ����������� ���� ����������� � ���� ��������?";
};


func int DIA_Addon_Gaan_AufgabeBeimRing_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Addon_Gaan_Ranger) || (RangerMeetingRunning != 0)) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Addon_Gaan_AufgabeBeimRing_Info()
{
	AI_Output(other,self,"DIA_Addon_Gaan_AufgabeBeimRing_15_00");	//� ��� ����������� ���� ����������� � ���� ��������?
	AI_Output(self,other,"DIA_Addon_Gaan_AufgabeBeimRing_03_01");	//� �������� �� �������� � �������, ��� �������� � ��� ������.
	AI_Output(self,other,"DIA_Addon_Gaan_AufgabeBeimRing_03_02");	//�������, � ��� ��� ��� �������� ��������� ������� ������ �������, ����� ����� �������.
};


instance DIA_Addon_Gaan_MissingPeople(C_Info)
{
	npc = BAU_961_Gaan;
	nr = 2;
	condition = DIA_Addon_Gaan_MissingPeople_Condition;
	information = DIA_Addon_Gaan_MissingPeople_Info;
	description = "�� ������ � ��������� �����?";
};


func int DIA_Addon_Gaan_MissingPeople_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Gaan_AufgabeBeimRing) && (SC_HearedAboutMissingPeople == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Gaan_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Gaan_MissingPeople_15_00");	//�� ������ � ��������� �����?
	AI_Output(self,other,"DIA_Addon_Gaan_MissingPeople_03_01");	//�������, ������. ������ ������� ��� ���� ���� ���� ����������.
	AI_Output(self,other,"DIA_Addon_Gaan_MissingPeople_03_02");	//�� � �� ���� ������ ������, ��� ����� �� ���� ������.
};


instance DIA_Gaan_WALD(C_Info)
{
	npc = BAU_961_Gaan;
	nr = 5;
	condition = DIA_Gaan_WALD_Condition;
	information = DIA_Gaan_WALD_Info;
	description = "��� ��� ����� ����� � ������ ��������?";
};


func int DIA_Gaan_WALD_Condition()
{
	return TRUE;
};

func void DIA_Gaan_WALD_Info()
{
	AI_Output(other,self,"DIA_Gaan_WALD_15_00");	//��� ��� ����� ����� � ������ ��������?
	AI_Output(self,other,"DIA_Gaan_WALD_03_01");	//������� �� ����. � ����� ��� ������ ������ �������. �� ���, ��� ������� ������.
	AI_Output(self,other,"DIA_Gaan_WALD_03_02");	//����� �����, ���� �� ������� ���� �� �������, ��������� ������������ �������.
	AI_Output(self,other,"DIA_Gaan_WALD_03_03");	//�� ������ ����� ���� ����� ������� ������, ���� �� ������ ����� �������� ����. ������ ���� ������ � ����������.
	AI_Output(self,other,"DIA_Gaan_WALD_03_04");	//������, ����� ���� ������ �������, ����� ���� ����� ����������.
	AI_Output(self,other,"DIA_Gaan_WALD_03_05");	//��� ������ �� ������� ������ ���� � ������-������������.
};


instance DIA_Gaan_SAGITTA(C_Info)
{
	npc = BAU_961_Gaan;
	nr = 7;
	condition = DIA_Gaan_SAGITTA_Condition;
	information = DIA_Gaan_SAGITTA_Info;
	description = "������-������������?";
};


func int DIA_Gaan_SAGITTA_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gaan_WALD))
	{
		return TRUE;
	};
};

func void DIA_Gaan_SAGITTA_Info()
{
	AI_Output(other,self,"DIA_Gaan_SAGITTA_15_00");	//������-������������?
	AI_Output(self,other,"DIA_Gaan_SAGITTA_03_01");	//�� ����� �������. ��� ����� �������� � ������ �����, ������� ��� ������.
	AI_Output(self,other,"DIA_Gaan_SAGITTA_03_02");	//����� ���������� �������.
	AI_Output(self,other,"DIA_Gaan_SAGITTA_03_03");	//������ �� �������� ������ � ���, � ��� ������� ���������� � ��� �������.
	AI_Output(self,other,"DIA_Gaan_SAGITTA_03_04");	//��, ���� �� ���������, �� ����� �� ������� ������ ������, ��� � �������, �� �� �����, ������ �������� ����.
	AI_Output(self,other,"DIA_Gaan_SAGITTA_03_05");	//�� ������� �� � ���� �� ������ ������.
};


instance DIA_Gaan_MONSTER(C_Info)
{
	npc = BAU_961_Gaan;
	nr = 8;
	condition = DIA_Gaan_MONSTER_Condition;
	information = DIA_Gaan_MONSTER_Info;
	description = "� ��� �������� ���� ������� �����?";
};


func int DIA_Gaan_MONSTER_Condition()
{
	if((MIS_Gaan_Snapper == LOG_Running) && (Npc_IsDead(Gaans_Snapper) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gaan_MONSTER_Info()
{
	AI_Output(other,self,"DIA_Gaan_MONSTER_15_00");	//� ��� �������� ���� ������� �����?
	AI_Output(self,other,"DIA_Gaan_MONSTER_03_01");	//� ����� �� ����. � ������ ������ �������� � ������� ������. �� �����, ��� �� ����� �������.
	AI_Output(self,other,"DIA_Gaan_MONSTER_03_02");	//���� ����� ������ ���. ���� ����� ���-�� ������� ������ ����� ������.
};


instance DIA_Gaan_WASZAHLSTDU(C_Info)
{
	npc = BAU_961_Gaan;
	nr = 9;
	condition = DIA_Gaan_WASZAHLSTDU_Condition;
	information = DIA_Gaan_WASZAHLSTDU_Info;
	description = "������� �� ���������, ���� � ���� ����� ����� ��� ����?";
};


func int DIA_Gaan_WASZAHLSTDU_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gaan_MONSTER) && (Npc_IsDead(Gaans_Snapper) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gaan_WASZAHLSTDU_Info()
{
	AI_Output(other,self,"DIA_Gaan_WASZAHLSTDU_15_00");	//������� �� ���������, ���� � ���� ����� ����� ��� ����?
	AI_Output(self,other,"DIA_Gaan_WASZAHLSTDU_03_01");	//� �� ����� ����, ��� ����� ����� �����, ���, ��� � ���� ����.
	B_Say_Gold(self,other,30);
	MIS_Gaan_Deal = LOG_Running;
};


instance DIA_Gaan_WOHERMONSTER(C_Info)
{
	npc = BAU_961_Gaan;
	nr = 10;
	condition = DIA_Gaan_WOHERMONSTER_Condition;
	information = DIA_Gaan_WOHERMONSTER_Info;
	description = "������ ������ ���� �������� �����?";
};


func int DIA_Gaan_WOHERMONSTER_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gaan_MONSTER) && (Npc_IsDead(Gaans_Snapper) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gaan_WOHERMONSTER_Info()
{
	AI_Output(other,self,"DIA_Gaan_WOHERMONSTER_15_00");	//������ ������ ���� �������� �����?
	AI_Output(self,other,"DIA_Gaan_WOHERMONSTER_03_01");	//������-�� ��������. ����� ����, �� ������ ��������. �� � �� ���� �����.
	AI_Output(self,other,"DIA_Gaan_WOHERMONSTER_03_02");	//� ������� �� ��� � ������ ��������.
};


instance DIA_Gaan_MONSTERTOT(C_Info)
{
	npc = BAU_961_Gaan;
	nr = 11;
	condition = DIA_Gaan_MONSTERTOT_Condition;
	information = DIA_Gaan_MONSTERTOT_Info;
	important = TRUE;
};


func int DIA_Gaan_MONSTERTOT_Condition()
{
	if((Npc_IsDead(Gaans_Snapper) == TRUE) && (RangerMeetingRunning != LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Gaan_MONSTERTOT_Info()
{
	AI_Output(self,other,"DIA_Gaan_MONSTERTOT_03_00");	//���� ������� ����� �����, � �������.
	AI_Output(self,other,"DIA_Gaan_MONSTERTOT_03_01");	//������ � ����� ���� ��������� ��������.
	if(MIS_Gaan_Deal == LOG_Running)
	{
		AI_Output(self,other,"DIA_Gaan_MONSTERTOT_03_02");	//��� ������, ��� � ������ ����.
		CreateInvItems(self,ItMi_Gold,30);
		B_GiveInvItems(self,other,ItMi_Gold,30);
	};
	MIS_Gaan_Snapper = LOG_SUCCESS;
	B_GivePlayerXP(XP_Gaan_WaldSnapper);
	AI_StopProcessInfos(self);
};


instance DIA_Gaan_AskTeacher(C_Info)
{
	npc = BAU_961_Gaan;
	nr = 10;
	condition = DIA_Gaan_AskTeacher_Condition;
	information = DIA_Gaan_AskTeacher_Info;
	description = "�� ������ ������� ���� ���������?";
};


func int DIA_Gaan_AskTeacher_Condition()
{
	return TRUE;
};

func void DIA_Gaan_AskTeacher_Info()
{
	AI_Output(other,self,"DIA_Gaan_AskTeacher_15_00");	//�� ������ ������� ���� ���������?
	AI_Output(self,other,"DIA_Gaan_AskTeacher_03_01");	//��� �������. �� 100 ������� ����� � ���� �������� ����, ��� ����������� ��������, ��� �� ������.
	AI_Output(self,other,"DIA_Gaan_AskTeacher_03_02");	//����� � ������ ������ ����� ������� ������� �� �����.
	Log_CreateTopic(TOPIC_Teacher,LOG_NOTE);
	B_LogEntry(TOPIC_Teacher,"���� ����� ������� ���� �������� ������ ��������.");
};


instance DIA_Gaan_PayTeacher(C_Info)
{
	npc = BAU_961_Gaan;
	nr = 11;
	condition = DIA_Gaan_PayTeacher_Condition;
	information = DIA_Gaan_PayTeacher_Info;
	permanent = TRUE;
	description = "���. 100 ������� ����� �� ���� ���� �� ������������ ��������. ";
};


var int DIA_Gaan_PayTeacher_noPerm;

func int DIA_Gaan_PayTeacher_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gaan_AskTeacher) && (DIA_Gaan_PayTeacher_noPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gaan_PayTeacher_Info()
{
	AI_Output(other,self,"DIA_Gaan_PayTeacher_15_00");	//���. 100 ������� ����� �� ���� ���� �� ������������ ��������.
	if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		AI_Output(self,other,"DIA_Gaan_PayTeacher_03_01");	//�������. ������, ������, ��� �� ������.
		Gaan_TeachPlayer = TRUE;
		DIA_Gaan_PayTeacher_noPerm = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Gaan_PayTeacher_03_02");	//�������� �� ��� �����, ����� � ���� ����� ������.
	};
};


instance DIA_Gaan_TEACHHUNTING(C_Info)
{
	npc = BAU_961_Gaan;
	nr = 12;
	condition = DIA_Gaan_TEACHHUNTING_Condition;
	information = DIA_Gaan_TEACHHUNTING_Info;
	permanent = TRUE;
	description = "���� �� ������ ������� ����?";
};


func int DIA_Gaan_TEACHHUNTING_Condition()
{
	if(Gaan_TeachPlayer == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Gaan_TEACHHUNTING_Info()
{
	AI_Output(other,self,"DIA_Gaan_TEACHHUNTING_15_00");	//���� �� ������ ������� ����?
	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE) || ((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] == FALSE) && (MIS_Gaan_Snapper == LOG_SUCCESS)))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_03_01");	//��� ������� �� ����, ��� �� ��� ������.
		Info_AddChoice(DIA_Gaan_TEACHHUNTING,Dialog_Back,DIA_Gaan_TEACHHUNTING_BACK);
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE)
		{
			Info_AddChoice(DIA_Gaan_TEACHHUNTING,B_BuildLearnString("�������� �����",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Teeth)),DIA_Gaan_TEACHHUNTING_Teeth);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
		{
			Info_AddChoice(DIA_Gaan_TEACHHUNTING,B_BuildLearnString("�������� ������",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Claws)),DIA_Gaan_TEACHHUNTING_Claws);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
		{
			Info_AddChoice(DIA_Gaan_TEACHHUNTING,B_BuildLearnString("������ ����",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Fur)),DIA_Gaan_TEACHHUNTING_Fur);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == FALSE)
		{
			Info_AddChoice(DIA_Gaan_TEACHHUNTING,B_BuildLearnString("���� �������� ����",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFSting)),DIA_Gaan_TEACHHUNTING_BFSting);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == FALSE)
		{
			Info_AddChoice(DIA_Gaan_TEACHHUNTING,B_BuildLearnString("������ �������� ����",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFWing)),DIA_Gaan_TEACHHUNTING_BFWing);
		};
		if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] == FALSE) && (MIS_Gaan_Snapper == LOG_SUCCESS))
		{
			Info_AddChoice(DIA_Gaan_TEACHHUNTING,B_BuildLearnString("��� ���������� ��������",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DrgSnapperHorn)),DIA_Gaan_TEACHHUNTING_DrgSnapperHorn);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_03_02");	//� �� ���� ������� ���� ������, ��� �� ��� �� ������. ������.
	};
};

func void DIA_Gaan_TEACHHUNTING_BACK()
{
	Info_ClearChoices(DIA_Gaan_TEACHHUNTING);
};

func void DIA_Gaan_TEACHHUNTING_Claws()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Claws))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Claws_03_00");	//����� �� ����� ������������ �� ������ �������. ����� ����� �������� ����� �����.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Claws_03_01");	//���� ���� ������ ���� ������ ��������. ����� ����� �������� ����� ������� ������.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Claws_03_02");	//�������� ������ ������ �������� ����������� ����� �� �����.
	};
	Info_ClearChoices(DIA_Gaan_TEACHHUNTING);
	Info_AddChoice(DIA_Gaan_TEACHHUNTING,Dialog_Back,DIA_Gaan_TEACHHUNTING_BACK);
};

func void DIA_Gaan_TEACHHUNTING_Teeth()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Teeth))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Teeth_03_00");	//����� ����� �������� ���� ���������. ������ ������� ����� ����� ������ ����� �� ��� ���������.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Teeth_03_01");	//����� ����� �������� �� �� ������ ������ ������.
	};
	Info_ClearChoices(DIA_Gaan_TEACHHUNTING);
	Info_AddChoice(DIA_Gaan_TEACHHUNTING,Dialog_Back,DIA_Gaan_TEACHHUNTING_BACK);
};

func void DIA_Gaan_TEACHHUNTING_Fur()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Fur))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Fur_03_00");	//����� ������� �����, ������ �������� ������ � ������ ������ ���.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Fur_03_01");	//����� �����, �� ����� ������� ����� �����, �������� �� � ���������.
	};
	Info_ClearChoices(DIA_Gaan_TEACHHUNTING);
	Info_AddChoice(DIA_Gaan_TEACHHUNTING,Dialog_Back,DIA_Gaan_TEACHHUNTING_BACK);
};

func void DIA_Gaan_TEACHHUNTING_BFSting()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_BFSting))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_BFSting_03_00");	//� ���� ��� ���� ������ ����� �� �����.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_BFSting_03_01");	//���� ������ ���, ���� ���������� ����� ������, � �� ������� �������� ��� ��� ������ ����.
	};
	Info_ClearChoices(DIA_Gaan_TEACHHUNTING);
	Info_AddChoice(DIA_Gaan_TEACHHUNTING,Dialog_Back,DIA_Gaan_TEACHHUNTING_BACK);
};

func void DIA_Gaan_TEACHHUNTING_BFWing()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_BFWing))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_BFWing_03_00");	//����� ����� �������� ������ �������� ����, ������� �� ������ ������� ���� ��� ����� ����� � ����.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_BFWing_03_01");	//����� ���� ����� ����������, ����� �� ��������� ������ ����� �������. ��� �� ����� ������ ������, ���� �� ��������� ��.
	};
	Info_ClearChoices(DIA_Gaan_TEACHHUNTING);
	Info_AddChoice(DIA_Gaan_TEACHHUNTING,Dialog_Back,DIA_Gaan_TEACHHUNTING_BACK);
};

func void DIA_Gaan_TEACHHUNTING_DrgSnapperHorn()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_DrgSnapperHorn))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_DrgSnapperHorn_03_00");	//������, ����� ���� �������� ������� �����, � ���� �������� ����, ��� �������� ��� ���.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_DrgSnapperHorn_03_01");	//����� �������� ��� ������� � ��� ����� ��������� � ��������� ����������� ���.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_DrgSnapperHorn_03_02");	//���� �� �� ��������� �� ������, ����� ������� ��� ������ ����� � ������ �������.
		CreateInvItems(Gaans_Snapper,ItAt_DrgSnapperHorn,1);
	};
	Info_ClearChoices(DIA_Gaan_TEACHHUNTING);
	Info_AddChoice(DIA_Gaan_TEACHHUNTING,Dialog_Back,DIA_Gaan_TEACHHUNTING_BACK);
};


instance DIA_Gaan_JAGD(C_Info)
{
	npc = BAU_961_Gaan;
	nr = 80;
	condition = DIA_Gaan_JAGD_Condition;
	information = DIA_Gaan_JAGD_Info;
	permanent = TRUE;
	description = "��� �����?";
};


func int DIA_Gaan_JAGD_Condition()
{
	return TRUE;
};

func void B_WasMachtJagd()
{
	AI_Output(other,self,"DIA_Gaan_JAGD_15_00");	//��� �����?
};

func void DIA_Gaan_JAGD_Info()
{
	B_WasMachtJagd();
	if(Npc_IsDead(Gaans_Snapper) == FALSE)
	{
		AI_Output(self,other,"DIA_Gaan_JAGD_03_01");	//��������� ��������, ������� ��� ������� �����, ���� ������� �����. ���� ���� ������ �����.
		AI_Output(self,other,"DIA_Gaan_JAGD_03_02");	//��� ��� ��������� ���� �����-�� ��������� ����� ������ �����.
		AI_Output(self,other,"DIA_Gaan_JAGD_03_03");	//�� �� ������ ������� ���, ��� ��������, �� ������ ���� ������.
		Log_CreateTopic(TOPIC_GaanSchnaubi,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_GaanSchnaubi,LOG_Running);
		B_LogEntry(TOPIC_GaanSchnaubi,"���� ��������� ����� ���������� ������������ �������� ����. ���� � �� �������� ����� �����, �� �� ������ ���������.");
		MIS_Gaan_Snapper = LOG_Running;
	}
	else if(Kapitel >= 3)
	{
		AI_Output(self,other,"DIA_Gaan_JAGD_03_04");	//���� ���� ��� ���� � ����. � ��� ��������, ����� ������ ������� ����� ��� ��������� �����.
		AI_Output(self,other,"DIA_Gaan_JAGD_03_05");	//��������� ���������� ��� ������� � �������.
	}
	else
	{
		AI_Output(self,other,"DIA_Gaan_JAGD_03_06");	//��� �� �� ��� ����������.
	};
};


instance DIA_Gaan_PICKPOCKET(C_Info)
{
	npc = BAU_961_Gaan;
	nr = 900;
	condition = DIA_Gaan_PICKPOCKET_Condition;
	information = DIA_Gaan_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Gaan_PICKPOCKET_Condition()
{
	return C_Beklauen(23,35);
};

func void DIA_Gaan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Gaan_PICKPOCKET);
	Info_AddChoice(DIA_Gaan_PICKPOCKET,Dialog_Back,DIA_Gaan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Gaan_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Gaan_PICKPOCKET_DoIt);
};

func void DIA_Gaan_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Gaan_PICKPOCKET);
};

func void DIA_Gaan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Gaan_PICKPOCKET);
};

