
instance DIA_Hyglas_Kap1_EXIT(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 999;
	condition = DIA_Hyglas_Kap1_EXIT_Condition;
	information = DIA_Hyglas_Kap1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hyglas_Kap1_EXIT_Condition()
{
	if(Kapitel <= 1)
	{
		return TRUE;
	};
};

func void DIA_Hyglas_Kap1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hyglas_Feuer(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 2;
	condition = DIA_Hyglas_Feuer_Condition;
	information = DIA_Hyglas_Feuer_Info;
	permanent = FALSE;
	description = "��� ���������� ������ ��������� �����.";
};


func int DIA_Hyglas_Feuer_Condition()
{
	if((other.guild == GIL_NOV) && (KNOWS_FIRE_CONTEST == TRUE) && (Npc_KnowsInfo(other,DIA_Pyrokar_FIRE) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_Feuer_Info()
{
	AI_Output(other,self,"DIA_Hyglas_Feuer_15_00");	//��� ���������� ������ ��������� �����.
	AI_Output(self,other,"DIA_Hyglas_Feuer_14_01");	//��������� ����� - ��� ����� �� ������� ������, � �� ����������� ��� �����.
	AI_Output(self,other,"DIA_Hyglas_Feuer_14_02");	//��, ���� �� ��������, ����� ������. ���� � �� ����� �� ����.
};


instance DIA_Hyglas_Hallo(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 2;
	condition = DIA_Hyglas_Hallo_Condition;
	information = DIA_Hyglas_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Hyglas_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_Hallo_Info()
{
	AI_Output(self,other,"DIA_Hyglas_Hallo_14_00");	//� ������ ������, ����� ���� � ��������� ������.
	if(other.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Hyglas_Hallo_14_01");	//����, ������ ������ ��� ���� ���������� ������� ��������� �����.
		AI_Output(self,other,"DIA_Hyglas_Hallo_14_02");	//����� ���� �� � ������. ����� ����, �� ������� ����������� � ���� ��������.
	};
};


instance DIA_Hyglas_JOB(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 2;
	condition = DIA_Hyglas_JOB_Condition;
	information = DIA_Hyglas_JOB_Info;
	permanent = FALSE;
	description = "��� �� ��������, ������?";
};


func int DIA_Hyglas_JOB_Condition()
{
	return TRUE;
};

func void DIA_Hyglas_JOB_Info()
{
	AI_Output(other,self,"DIA_Hyglas_JOB_15_00");	//��� �� ��������, ������?
	AI_Output(self,other,"DIA_Hyglas_JOB_14_01");	//� �������� ���� �������� ���� - ���� ������.
	AI_Output(self,other,"DIA_Hyglas_JOB_14_02");	//��� ��� ���, � � �� �� �����, ������� ������ - � ������ ����, ���������� ������� ��� ����.
	if(other.guild == GIL_NOV)
	{
		AI_Output(other,self,"DIA_Hyglas_JOB_15_03");	//��� ��� ���������! � �� ��� �� �� ������� � ���� �����?
		AI_Output(self,other,"DIA_Hyglas_JOB_14_04");	//����� ������ �����. � ������ ��� ������, ����� ����, ���� �������, ��� ������������ ���� �����.
	};
};


instance DIA_Hyglas_CONTEST(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 9;
	condition = DIA_Hyglas_CONTEST_Condition;
	information = DIA_Hyglas_CONTEST_Info;
	permanent = FALSE;
	description = "� ���������� ����������� ��������� �����.";
};


func int DIA_Hyglas_CONTEST_Condition()
{
	if(MIS_RUNE == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Hyglas_CONTEST_Info()
{
	AI_Output(other,self,"DIA_Hyglas_CONTEST_15_00");	//� ������ ������ ��������� �����. ������ ��� ��� ������� ������� ���� �������� ������.
	AI_Output(self,other,"DIA_Hyglas_CONTEST_14_01");	//� �� ������, ����� � ������ ���� �����?
	AI_Output(other,self,"DIA_Hyglas_CONTEST_15_02");	//� �� ���� ������� ������� ��������� ��� �������.
	AI_Output(self,other,"DIA_Hyglas_CONTEST_14_03");	//���...
	AI_Output(self,other,"DIA_Hyglas_CONTEST_14_04");	//������, � ����� ����. �� �������, �� ������ ����� ��� ����������� �����������.
	B_LogEntry(TOPIC_Rune,"������ ����� ������� ���� ��������� ���� �������� ������, ���� � ������� ��� ��� ����������� �����������.");
};


instance DIA_Hyglas_FIREBOLT(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 9;
	condition = DIA_Hyglas_FIREBOLT_Condition;
	information = DIA_Hyglas_FIREBOLT_Info;
	permanent = FALSE;
	description = "����� ����������� ����� ��� �������� ���� �������� ������?";
};


func int DIA_Hyglas_FIREBOLT_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Hyglas_CONTEST) && (MIS_RUNE == LOG_Running) && (PLAYER_TALENT_RUNES[SPL_Firebolt] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_FIREBOLT_Info()
{
	AI_Output(other,self,"DIA_Hyglas_FIREBOLT_15_00");	//����� ����������� ����� ��� �������� ���� �������� ������?
	AI_Output(self,other,"DIA_Hyglas_FIREBOLT_14_01");	//������ �� ���� - �� ������� ��� ���������� �����, � ������.
};


instance DIA_Hyglas_TALENT_FIREBOLT(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 990;
	condition = DIA_Hyglas_TALENT_FIREBOLT_Condition;
	information = DIA_Hyglas_TALENT_FIREBOLT_Info;
	permanent = TRUE;
	description = "����� ���� ��������� ���� �������� ������.";
};


func int DIA_Hyglas_TALENT_FIREBOLT_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Hyglas_CONTEST) && (PLAYER_TALENT_RUNES[SPL_Firebolt] == FALSE) && (Npc_HasItems(other,ItMi_RuneBlank) >= 1) && (Npc_HasItems(other,ItSc_Firebolt) >= 1) && (Npc_HasItems(other,ItMi_Sulfur) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_TALENT_FIREBOLT_Info()
{
	AI_Output(other,self,"DIA_Hyglas_TALENT_FIREBOLT_15_00");	//����� ���� ��������� ���� �������� ������.
	if(B_TeachPlayerTalentRunes(self,other,SPL_Firebolt))
	{
		AI_Output(self,other,"DIA_Hyglas_TALENT_FIREBOLT_14_01");	//����� ������� ���� �������� ������, �� ������ ���������� �� ������ ����� ���� � ������ ������.
		AI_Output(self,other,"DIA_Hyglas_TALENT_FIREBOLT_14_02");	//���� ������ �������� ������ ��������� � ��� ����, � �� ������� ����������� ������ ������.
		AI_Output(self,other,"DIA_Hyglas_TALENT_FIREBOLT_14_03");	//����� � ���� ����� ��� �����������, ������� � ������� ����� � ������ ���� ����.
	};
};


instance DIA_Hyglas_BLANK_RUNE(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 9;
	condition = DIA_Hyglas_BLANK_RUNE_Condition;
	information = DIA_Hyglas_BLANK_RUNE_Info;
	permanent = FALSE;
	description = "��� � ���� ����� ������ ������?";
};


func int DIA_Hyglas_BLANK_RUNE_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Hyglas_FIREBOLT) && (MIS_RUNE == LOG_Running) && (Npc_HasItems(other,ItMi_RuneBlank) < 1) && (PLAYER_TALENT_RUNES[SPL_Firebolt] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_BLANK_RUNE_Info()
{
	AI_Output(other,self,"DIA_Hyglas_BLANK_RUNE_15_00");	//��� � ���� ����� ������ ������?
	AI_Output(self,other,"DIA_Hyglas_BLANK_RUNE_14_01");	//��������, ���� ���� ���������� ������ ��������� ����� - �� ���. ������ ������ � ��� ���������.
};


instance DIA_Hyglas_GOTRUNE(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 2;
	condition = DIA_Hyglas_GOTRUNE_Condition;
	information = DIA_Hyglas_GOTRUNE_Info;
	permanent = FALSE;
	description = "� ������ ����.";
};


func int DIA_Hyglas_GOTRUNE_Condition()
{
	if((Npc_KnowsInfo(hero,DIA_Ulthar_SUCCESS) == FALSE) && (Npc_HasItems(hero,ItRu_FireBolt) >= 1) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_GOTRUNE_Info()
{
	AI_Output(other,self,"DIA_Hyglas_GOTRUNE_15_00");	//� ������ ����.
	AI_Output(self,other,"DIA_Hyglas_GOTRUNE_14_01");	//������, ������. � �����, �� ������ ���� ����. �������, ��� ���� �� ��� �� � ������.
	AI_Output(self,other,"DIA_Hyglas_GOTRUNE_14_02");	//������ ��� � ������� � ������ ��� ����� ������ �����.
	B_LogEntry(TOPIC_Rune,"� ������ ���� �������� ������.");
};


instance DIA_Hyglas_TEACH(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 15;
	condition = DIA_Hyglas_TEACH_Condition;
	information = DIA_Hyglas_TEACH_Info;
	permanent = TRUE;
	description = "����� ����.";
};


func int DIA_Hyglas_TEACH_Condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_Hyglas_TEACH_Info()
{
	var int abletolearn;
	abletolearn = 0;
	AI_Output(other,self,"DIA_Hyglas_TEACH_15_00");	//����� ����.
	Info_ClearChoices(DIA_Hyglas_TEACH);
	Info_AddChoice(DIA_Hyglas_TEACH,Dialog_Back,DIA_Hyglas_TEACH_BACK);
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2) && (PLAYER_TALENT_RUNES[SPL_InstantFireball] == FALSE))
	{
		Info_AddChoice(DIA_Hyglas_TEACH,B_BuildLearnString(NAME_SPL_InstantFireball,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_InstantFireball)),DIA_Hyglas_TEACH_InstantFireball);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[SPL_Firestorm] == FALSE))
	{
		Info_AddChoice(DIA_Hyglas_TEACH,B_BuildLearnString(NAME_SPL_Firestorm,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Firestorm)),DIA_Hyglas_TEACH_Firestorm);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4) && (PLAYER_TALENT_RUNES[SPL_ChargeFireball] == FALSE))
	{
		Info_AddChoice(DIA_Hyglas_TEACH,B_BuildLearnString(NAME_SPL_ChargeFireball,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_ChargeFireball)),DIA_Hyglas_TEACH_ChargeFireball);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5) && (PLAYER_TALENT_RUNES[SPL_Pyrokinesis] == FALSE))
	{
		Info_AddChoice(DIA_Hyglas_TEACH,B_BuildLearnString(NAME_SPL_Pyrokinesis,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Pyrokinesis)),DIA_Hyglas_TEACH_Pyrokinesis);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 6) && (PLAYER_TALENT_RUNES[SPL_Firerain] == FALSE))
	{
		Info_AddChoice(DIA_Hyglas_TEACH,B_BuildLearnString(NAME_SPL_Firerain,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Firerain)),DIA_Hyglas_TEACH_Firerain);
		abletolearn = abletolearn + 1;
	};
	if(abletolearn < 1)
	{
		B_Say(self,other,"$NOLEARNOVERPERSONALMAX");
		Info_ClearChoices(DIA_Hyglas_TEACH);
	};
};

func void DIA_Hyglas_TEACH_BACK()
{
	Info_ClearChoices(DIA_Hyglas_TEACH);
};

func void DIA_Hyglas_TEACH_InstantFireball()
{
	B_TeachPlayerTalentRunes(self,other,SPL_InstantFireball);
};

func void DIA_Hyglas_TEACH_ChargeFireball()
{
	B_TeachPlayerTalentRunes(self,other,SPL_ChargeFireball);
};

func void DIA_Hyglas_TEACH_Pyrokinesis()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Pyrokinesis);
};

func void DIA_Hyglas_TEACH_Firestorm()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Firestorm);
};

func void DIA_Hyglas_TEACH_Firerain()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Firerain);
};


instance DIA_Hyglas_Kap2_EXIT(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 999;
	condition = DIA_Hyglas_Kap2_EXIT_Condition;
	information = DIA_Hyglas_Kap2_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hyglas_Kap2_EXIT_Condition()
{
	if(Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Hyglas_Kap2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hyglas_Kap3_EXIT(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 999;
	condition = DIA_Hyglas_Kap3_EXIT_Condition;
	information = DIA_Hyglas_Kap3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hyglas_Kap3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Hyglas_Kap3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hyglas_BringBook(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 38;
	condition = DIA_Hyglas_BringBook_Condition;
	information = DIA_Hyglas_BringBook_Info;
	permanent = FALSE;
	description = "���� �������?";
};


func int DIA_Hyglas_BringBook_Condition()
{
	if((Kapitel >= 3) && (hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_BringBook_Info()
{
	AI_Output(other,self,"DIA_Hyglas_BringBook_15_00");	//���� �����-������ �������?
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_01");	//���, ��. ��, ��, ��������, ������� ��� ������ � ������ �����.
	AI_Output(other,self,"DIA_Hyglas_BringBook_15_02");	//� �������� ��.
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_03");	//���! � ������ �������� � ���� ����. � ��������� ������, �� ��������� ����� ������ ���������.
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_04");	//���� ���� ����� ������, ��������� ���� ������ ��������� � ������ ����������� � ���������� �����. � �������, �� ������, ��� ��� ��������.
	AI_Output(other,self,"DIA_Hyglas_BringBook_15_05");	//���. ��, ���� ���� �������...
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_06");	//��, ������, � �������. ��, � �� ���� ��������� ���� ������ ��� ������, �� ���, �����������, ���������� ������� ��������. � � �� ����� ��������.
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_07");	//�������, � ����, ����� �� ������ ��� �� ������ �����. ��� ���������� '������������ ���� �����'. ����, ��������, �������� �������� ��, �� � ������, ��� �� ���������� � ����.
	Info_ClearChoices(DIA_Hyglas_BringBook);
	Info_AddChoice(DIA_Hyglas_BringBook,"������� ��� ����� ���.",DIA_Hyglas_BringBook_GetItYourself);
	Info_AddChoice(DIA_Hyglas_BringBook,"� ��� ��� � ����� �����?",DIA_Hyglas_BringBook_GetForIt);
	Info_AddChoice(DIA_Hyglas_BringBook,"� �������� ����� ��.",DIA_Hyglas_BringBook_Yes);
};

func void DIA_Hyglas_BringBook_GetItYourself()
{
	AI_Output(other,self,"DIA_Hyglas_BringBook_GetItYourself_15_00");	//������� ��� ����� ���.
	AI_Output(self,other,"DIA_Hyglas_BringBook_GetItYourself_14_01");	//��� �� ������ �������� �� ���� � ����� ����?! ���� ��������� �����������, �� ������ ��������� �������� �� ���!
	AI_Output(self,other,"DIA_Hyglas_BringBook_GetItYourself_14_02");	//�������� � ���� ���� � ������� � ����� ���������.
	MIS_HyglasBringBook = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Hyglas_BringBook);
};

func void DIA_Hyglas_BringBook_GetForIt()
{
	AI_Output(other,self,"DIA_Hyglas_BringBook_GetForIt_15_00");	//� ��� � �� ��� ������?
	AI_Output(self,other,"DIA_Hyglas_BringBook_GetForIt_14_01");	//��� �� ������ � ����?
	AI_Output(other,self,"DIA_Hyglas_BringBook_GetForIt_15_02");	//� �� ����� �����, ��� �� ���� ���, ���� � ������� ��� �����.
	AI_Output(self,other,"DIA_Hyglas_BringBook_GetForIt_14_03");	//������. � ��� �� ������ ��������? ���� � ���� ���� �����, ����� ��������� ��� ���� ������� � ������, ��� ���� ����������� ������ ���.
	Info_ClearChoices(DIA_Hyglas_BringBook);
};

func void DIA_Hyglas_BringBook_Yes()
{
	AI_Output(other,self,"DIA_Hyglas_BringBook_Yes_15_00");	//� �������� ����� ��.
	AI_Output(self,other,"DIA_Hyglas_BringBook_Yes_14_01");	//������ - ��� ��������� ��� �����, � � ����� �������� ������� ������.
	AI_Output(self,other,"DIA_Hyglas_BringBook_Yes_14_02");	//�� �� ����� �� ��� ������� ����� �������. ��� ��� �������-��, �����, � ��� ����� ����.
	MIS_HyglasBringBook = LOG_Running;
	Info_ClearChoices(DIA_Hyglas_BringBook);
	Log_CreateTopic(TOPIC_HyglasBringBook,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HyglasBringBook,LOG_Running);
	B_LogEntry(TOPIC_HyglasBringBook,"������ �����, ����� � ������ ��� ����� '������������ ���� �����'. ��� ����� ���� � ������ �� ��������� � ������.");
};


instance DIA_Hyglas_HaveBook(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 38;
	condition = DIA_Hyglas_HaveBook_Condition;
	information = DIA_Hyglas_HaveBook_Info;
	permanent = FALSE;
	description = "� ������ ���� �����.";
};


func int DIA_Hyglas_HaveBook_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Hyglas_BringBook) && (Npc_HasItems(other,ItWr_Astronomy_Mis) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_HaveBook_Info()
{
	AI_Output(other,self,"DIA_Hyglas_HaveBook_15_00");	//� ������ ���� �����.
	if(MIS_HyglasBringBook == LOG_Running)
	{
		AI_Output(self,other,"DIA_Hyglas_HaveBook_14_01");	//����� ������, ����� �� ����.
	}
	else
	{
		AI_Output(self,other,"DIA_Hyglas_HaveBook_14_02");	//�� ��� �� ���������. ����� ������. ��� ��� �� ��� �����?
	};
	B_GiveInvItems(other,self,ItWr_Astronomy_Mis,1);
	MIS_HyglasBringBook = LOG_SUCCESS;
	B_GivePlayerXP(XP_HyglasBringBook);
	AI_Output(self,other,"DIA_Hyglas_HaveBook_14_03");	//������ �� ������ ���������. � � ������ ���������� � �������� �� ���������.
};


instance DIA_Hyglas_Kap4_EXIT(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 999;
	condition = DIA_Hyglas_Kap4_EXIT_Condition;
	information = DIA_Hyglas_Kap4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hyglas_Kap4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Hyglas_Kap4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hyglas_Kap4_PERM(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 49;
	condition = DIA_Hyglas_Kap4_PERM_Condition;
	information = DIA_Hyglas_Kap4_PERM_Info;
	permanent = TRUE;
	description = "������ ���� �� �����?";
};


func int DIA_Hyglas_Kap4_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Hyglas_BringBook))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_Kap4_PERM_Info()
{
	AI_Output(other,self,"DIA_Hyglas_Kap4_PERM_15_00");	//������ ���� �� �����?
	if(MIS_HyglasBringBook == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_01");	//��, � �� ������ ������, �� ������� ������������ �����, ������, ����� ������ ���������.
		AI_Output(other,self,"DIA_Hyglas_Kap4_PERM_15_02");	//������ ���� ���������?
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_03");	//��, ������� ����� ������, ������, ����� �����. ����� ������ ��������� ����� ����, ������� ������������� �� � ������� �����, ����� �������� ����� � ���� �������.
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_04");	//������ ����� ������������ ��� �������, ����� ����� � ��� ���, �� �������� �������������.
		Hyglas_SendsToKarras = TRUE;
	}
	else if(MIS_HyglasBringBook == LOG_Running)
	{
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_05");	//���, � ��� ��� ��� ��� �����.
	}
	else
	{
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_06");	//� ������� ����, ��� � ��� ����� ��������� ���� ������������, �� �� ���, ������� ��, ����������� ������ �������, ���� � ���� �� ����� ����������� ����������.
	};
};


instance DIA_Hyglas_Kap5_EXIT(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 999;
	condition = DIA_Hyglas_Kap5_EXIT_Condition;
	information = DIA_Hyglas_Kap5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hyglas_Kap5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Hyglas_Kap5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hyglas_PICKPOCKET(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 900;
	condition = DIA_Hyglas_PICKPOCKET_Condition;
	information = DIA_Hyglas_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_Hyglas_PICKPOCKET_Condition()
{
	return C_Beklauen(73,200);
};

func void DIA_Hyglas_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Hyglas_PICKPOCKET);
	Info_AddChoice(DIA_Hyglas_PICKPOCKET,Dialog_Back,DIA_Hyglas_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Hyglas_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Hyglas_PICKPOCKET_DoIt);
};

func void DIA_Hyglas_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Hyglas_PICKPOCKET);
};

func void DIA_Hyglas_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Hyglas_PICKPOCKET);
};

