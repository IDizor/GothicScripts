
instance DIA_Marduk_Kap1_EXIT(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 999;
	condition = DIA_Marduk_Kap1_EXIT_Condition;
	information = DIA_Marduk_Kap1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Marduk_Kap1_EXIT_Condition()
{
	if(Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_Marduk_Kap1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Marduk_JOB(C_Info)
{
	npc = KDF_505_Marduk;
	condition = DIA_Marduk_JOB_Condition;
	information = DIA_Marduk_JOB_Info;
	permanent = FALSE;
	description = "��� �� ������� �����?";
};


func int DIA_Marduk_JOB_Condition()
{
	return TRUE;
};

func void DIA_Marduk_JOB_Info()
{
	AI_Output(other,self,"DIA_Marduk_JOB_15_00");	//��� �� ������� �����?
	AI_Output(self,other,"DIA_Marduk_JOB_05_01");	//� ������� ��������� � �������� ������ ���.
};


instance DIA_Marduk_Arbeit(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 3;
	condition = DIA_Marduk_Arbeit_Condition;
	information = DIA_Marduk_Arbeit_Info;
	permanent = FALSE;
	description = "���� � ������� ���-������ ��� ����, ������?";
};


func int DIA_Marduk_Arbeit_Condition()
{
	if(MIS_KlosterArbeit == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Marduk_Arbeit_Info()
{
	AI_Output(other,self,"DIA_Marduk_Arbeit_15_00");	//���� � ������� ���-������ ��� ����, ������?
	AI_Output(self,other,"DIA_Marduk_Arbeit_05_01");	//��� ����? ���, ��� �� ����� ���� ������. ����� �������� �� ������ ������, ������������� � ������ ��������.
	MIS_MardukBeten = LOG_Running;
	B_StartOtherRoutine(Sergio,"WAIT");
	Log_CreateTopic(Topic_MardukBeten,LOG_MISSION);
	Log_SetTopicStatus(Topic_MardukBeten,LOG_Running);
	B_LogEntry(Topic_MardukBeten,"� ������� ������� ��� ������� ��� ����. �� ������, ��� ��� ����� ����� ���������� �� ���������.");
};


instance DIA_Marduk_Gebetet(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 3;
	condition = DIA_Marduk_Gebetet_Condition;
	information = DIA_Marduk_Gebetet_Info;
	permanent = FALSE;
	description = "� ��������� �� ���������.";
};


func int DIA_Marduk_Gebetet_Condition()
{
	if((MIS_MardukBeten == LOG_Running) && Npc_KnowsInfo(other,PC_PrayShrine_Paladine))
	{
		return TRUE;
	};
};

func void DIA_Marduk_Gebetet_Info()
{
	AI_Output(other,self,"DIA_Marduk_Gebetet_15_00");	//� ��������� �� ���������.
	AI_Output(self,other,"DIA_Marduk_Gebetet_05_01");	//��� ������. � ������ ����������� � ����� ������.
	MIS_MardukBeten = LOG_SUCCESS;
	B_GivePlayerXP(XP_MardukBeten);
	B_StartOtherRoutine(Sergio,"START");
};


instance DIA_Marduk_Evil(C_Info)
{
	npc = KDF_505_Marduk;
	condition = DIA_Marduk_Evil_Condition;
	information = DIA_Marduk_Evil_Info;
	permanent = TRUE;
	description = "��� ����� '���'?";
};


func int DIA_Marduk_Evil_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Marduk_JOB))
	{
		return TRUE;
	};
};

func void DIA_Marduk_Evil_Info()
{
	AI_Output(other,self,"DIA_Marduk_Evil_15_00");	//��� ����� '���'?
	AI_Output(self,other,"DIA_Marduk_Evil_05_01");	//��� �������. ��� ���������� �������, ��������� ���������� ������.
	AI_Output(self,other,"DIA_Marduk_Evil_05_02");	//��� �������������� ����, ������� �������� �������� ������� �� ��� ���� ������.
	AI_Output(self,other,"DIA_Marduk_Evil_05_03");	//������ - ���������� ����, ��������� � ����������.
	AI_Output(self,other,"DIA_Marduk_Evil_05_04");	//������ �� �� ���, ��� ������ ����� ������ ����� ������, ����� ������� ���� ������ � ��� ��� � �������� ����.
};


instance DIA_Marduk_Pal(C_Info)
{
	npc = KDF_505_Marduk;
	condition = DIA_Marduk_Pal_Condition;
	information = DIA_Marduk_Pal_Info;
	permanent = FALSE;
	description = "�� � ��������� ����� ������ ���� � ����������.";
};


func int DIA_Marduk_Pal_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Marduk_JOB))
	{
		return TRUE;
	};
};

func void DIA_Marduk_Pal_Info()
{
	AI_Output(other,self,"DIA_Marduk_Pal_15_00");	//�� � ��������� ����� ������ ���� � ����������.
	AI_Output(self,other,"DIA_Marduk_Pal_05_01");	//���������. � ������� �� ����� ������, ������� ���� ����� ������...
	AI_Output(self,other,"DIA_Marduk_Pal_05_02");	//...�������� ���� ������� ����� ���� ������ �������.
	AI_Output(self,other,"DIA_Marduk_Pal_05_03");	//�� ��� - ������������� ������, �� �������� - ��� �����, ������ � ��� � ��� ������ �� ����� � ���������� ��� �������.
};


instance DIA_Marduk_BEFORETEACH(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 3;
	condition = DIA_Marduk_BEFORETEACH_Condition;
	information = DIA_Marduk_BEFORETEACH_Info;
	permanent = FALSE;
	description = "�� ������ ����-������ ������� ����?";
};


func int DIA_Marduk_BEFORETEACH_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Marduk_JOB))
	{
		return TRUE;
	};
};

func void DIA_Marduk_BEFORETEACH_Info()
{
	AI_Output(other,self,"DIA_Marduk_BEFORETEACH_15_00");	//�� ������ ����-������ ������� ����?
	AI_Output(self,other,"DIA_Marduk_BEFORETEACH_05_01");	//� ������� � ����� ���� � �����. � ���� ������� ���� ���� �����������.
	if(other.guild != GIL_KDF)
	{
		AI_Output(self,other,"DIA_Marduk_BEFORETEACH_05_02");	//������ � ������ ������ �����.
	};
};


instance DIA_Marduk_TEACH(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 10;
	condition = DIA_Marduk_TEACH_Condition;
	information = DIA_Marduk_TEACH_Info;
	permanent = TRUE;
	description = "����� ���� (�������� ���).";
};


func int DIA_Marduk_TEACH_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Marduk_BEFORETEACH) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Marduk_TEACH_Info()
{
	var int abletolearn;
	abletolearn = 0;
	AI_Output(other,self,"DIA_Marduk_TEACH_15_00");	//����� ����.
	Info_ClearChoices(DIA_Marduk_TEACH);
	Info_AddChoice(DIA_Marduk_TEACH,Dialog_Back,DIA_Marduk_TEACH_BACK);
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1) && (PLAYER_TALENT_RUNES[SPL_Zap] == FALSE))
	{
		Info_AddChoice(DIA_Marduk_TEACH,B_BuildLearnString(NAME_SPL_Zap,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Zap)),DIA_Marduk_TEACH_ZAP);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2) && (PLAYER_TALENT_RUNES[SPL_Icebolt] == FALSE))
	{
		Info_AddChoice(DIA_Marduk_TEACH,B_BuildLearnString(NAME_SPL_Icebolt,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Icebolt)),DIA_Marduk_TEACH_Icebolt);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[SPL_IceCube] == FALSE))
	{
		Info_AddChoice(DIA_Marduk_TEACH,B_BuildLearnString(NAME_SPL_IceCube,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_IceCube)),DIA_Marduk_TEACH_IceCube);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[SPL_ChargeZap] == FALSE))
	{
		Info_AddChoice(DIA_Marduk_TEACH,B_BuildLearnString(NAME_SPL_ChargeZap,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_ChargeZap)),DIA_Marduk_TEACH_ThunderBall);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4) && (PLAYER_TALENT_RUNES[SPL_LightningFlash] == FALSE))
	{
		Info_AddChoice(DIA_Marduk_TEACH,B_BuildLearnString(NAME_SPL_LightningFlash,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_LightningFlash)),DIA_Marduk_TEACH_LightningFlash);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5) && (PLAYER_TALENT_RUNES[SPL_IceWave] == FALSE))
	{
		Info_AddChoice(DIA_Marduk_TEACH,B_BuildLearnString(NAME_SPL_IceWave,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_IceWave)),DIA_Marduk_TEACH_IceWave);
		abletolearn = abletolearn + 1;
	};
	if(abletolearn < 1)
	{
		AI_Output(self,other,"DIA_Marduk_TEACH_05_01");	//������ � �� ���� ������� ����.
		Info_ClearChoices(DIA_Marduk_TEACH);
	};
};

func void DIA_Marduk_TEACH_BACK()
{
	Info_ClearChoices(DIA_Marduk_TEACH);
};

func void DIA_Marduk_TEACH_ZAP()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Zap);
};

func void DIA_Marduk_TEACH_Icebolt()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Icebolt);
};

func void DIA_Marduk_TEACH_LightningFlash()
{
	B_TeachPlayerTalentRunes(self,other,SPL_LightningFlash);
};

func void DIA_Marduk_TEACH_IceCube()
{
	B_TeachPlayerTalentRunes(self,other,SPL_IceCube);
};

func void DIA_Marduk_TEACH_ThunderBall()
{
	B_TeachPlayerTalentRunes(self,other,SPL_ChargeZap);
};

func void DIA_Marduk_TEACH_IceWave()
{
	B_TeachPlayerTalentRunes(self,other,SPL_IceWave);
};


instance DIA_Marduk_Kap2_EXIT(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 999;
	condition = DIA_Marduk_Kap2_EXIT_Condition;
	information = DIA_Marduk_Kap2_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Marduk_Kap2_EXIT_Condition()
{
	if(Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Marduk_Kap2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Marduk_Kap3_EXIT(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 999;
	condition = DIA_Marduk_Kap3_EXIT_Condition;
	information = DIA_Marduk_Kap3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Marduk_Kap3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Marduk_Kap3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Marduk_Kap3_Hello(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 30;
	condition = DIA_Marduk_Kap3_Hello_Condition;
	information = DIA_Marduk_Kap3_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Marduk_Kap3_Hello_Condition()
{
	if((Kapitel == 3) && ((hero.guild == GIL_PAL) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Marduk_Kap3_Hello_Info()
{
	AI_Output(self,other,"DIA_Marduk_Kap3_Hello_Info_05_00");	//����� ����������, ��� ���.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_Hello_Info_05_01");	//� ����� ��� ��� �� ���� ���������?
	};
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_Hello_Info_05_02");	//������ �� ������?
	};
	Info_ClearChoices(DIA_Marduk_Kap3_Hello);
	Info_AddChoice(DIA_Marduk_Kap3_Hello,"��� �� ���� ����.",DIA_Marduk_Kap3_Hello_NotYourConcern);
	if(hero.guild == GIL_PAL)
	{
		Info_AddChoice(DIA_Marduk_Kap3_Hello,"������ �������.",DIA_Marduk_Kap3_Hello_Soon);
	};
	if(hero.guild == GIL_DJG)
	{
		Info_AddChoice(DIA_Marduk_Kap3_Hello,"� ������ � �����.",DIA_Marduk_Kap3_Hello_DJG);
	};
};

func void DIA_Marduk_Kap3_Hello_NotYourConcern()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_Hello_NotYourConcern_15_00");	//��� �� ���� ����.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_Hello_NotYourConcern_05_01");	//������� ������ ������ ���� �������� � ��������. �� ������ �������� ���, ��� �� ����� �������� ���� ���.
		AI_Output(self,other,"DIA_Marduk_Kap3_Hello_NotYourConcern_05_02");	//��� ����������, � �� ������ ���� ����������, ��� ����� ���� ���� ����� �����������. ������� �� ����!
	};
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_Hello_NotYourConcern_05_03");	//��, ������ ������ ����� �� ������� � ���������. ���� ��������� ����������, ��� ��� ���� ������� �������.
		AI_Output(self,other,"DIA_Marduk_Kap3_Hello_NotYourConcern_05_04");	//� ������������ ����, �� ����� ����� ��� ����� - �� ������ ���������� �������. �� �� ����� ��������� ��������� �����������.
	};
	Info_ClearChoices(DIA_Marduk_Kap3_Hello);
};

func void DIA_Marduk_Kap3_Hello_Soon()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_Hello_Soon_15_00");	//������ �������.
	AI_Output(self,other,"DIA_Marduk_Kap3_Hello_Soon_05_01");	//����� ����� ����������. � ���� ����� ��� ����� ���, � ���� ���� �������� ������������� ���.
	AI_Output(self,other,"DIA_Marduk_Kap3_Hello_Soon_05_02");	//������ ���� ��� ����� � ����� ����� ����� ����. �� ������� ���� ����� ��� ����������� ���� ��������.
	Info_ClearChoices(DIA_Marduk_Kap3_Hello);
};

func void DIA_Marduk_Kap3_Hello_DJG()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_Hello_DJG_15_00");	//� ������ � �����.
	AI_Output(self,other,"DIA_Marduk_Kap3_Hello_DJG_05_01");	//����� ����� ���������� �� ��� ��������������. �������, �� ������� ���.
	AI_Output(self,other,"DIA_Marduk_Kap3_Hello_DJG_05_02");	//�� �� �������, ��� �� � ������, ����� � ���� ����� ������� ��������.
	Info_ClearChoices(DIA_Marduk_Kap3_Hello);
};


instance DIA_Marduk_TrainPals(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 32;
	condition = DIA_Marduk_TrainPals_Condition;
	information = DIA_Marduk_TrainPals_Info;
	permanent = TRUE;
	description = "���� �� ������ ������� ����?";
};


var int Marduk_TrainPals_permanent;

func int DIA_Marduk_TrainPals_Condition()
{
	if((hero.guild == GIL_PAL) && (Marduk_TrainPals_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Marduk_TrainPals_Info()
{
	AI_Output(other,self,"DIA_Marduk_TrainPals_15_00");	//���� �� ������ ������� ����?
	AI_Output(self,other,"DIA_Marduk_TrainPals_05_01");	//�����������, � �� ���� ������� ���� ������ ����������.
	AI_Output(self,other,"DIA_Marduk_TrainPals_05_02");	//�� � ����, �������, ������� �������� ������ � ��� ���� �� ����.
	AI_Output(self,other,"DIA_Marduk_TrainPals_05_03");	//����� ����, � ��� ����������� ������ ����������� ���� � ��������� ����.
	AI_Output(other,self,"DIA_Marduk_TrainPals_15_04");	//� �����?
	AI_Output(self,other,"DIA_Marduk_TrainPals_05_05");	//����� �� ���� ������ ����� �����. �� ������ ������� ����� ��������� � ������.
	Info_ClearChoices(DIA_Marduk_TrainPals);
	Info_AddChoice(DIA_Marduk_TrainPals,"����� ����, �����.",DIA_Marduk_TrainPals_Later);
	Info_AddChoice(DIA_Marduk_TrainPals,"��� �� ������ ���� �������?",DIA_Marduk_TrainPals_Meaning);
	Info_AddChoice(DIA_Marduk_TrainPals,"��� ����� ��������� ����?",DIA_Marduk_TrainPals_Blessing);
};

func void DIA_Marduk_TrainPals_Later()
{
	AI_Output(other,self,"DIA_Marduk_TrainPals_Later_15_00");	//����� ����, �����.
	AI_Output(self,other,"DIA_Marduk_TrainPals_Later_05_01");	//����� ���������� � ����� �����.
	Info_ClearChoices(DIA_Marduk_TrainPals);
};

func void DIA_Marduk_TrainPals_Meaning()
{
	AI_Output(other,self,"DIA_Marduk_TrainPals_Meaning_15_00");	//��� �� ������ ������� ����?
	AI_Output(self,other,"DIA_Marduk_TrainPals_Meaning_05_01");	//����� ����� ������� ��� ���, �� ������� ������������ ������� ����� ������������ ����.
	AI_Output(self,other,"DIA_Marduk_TrainPals_Meaning_05_02");	//������ �������� �� ����� ��������� ������������ ��� ���� � ����� � ��� ���������� �� ��� �����.
	AI_Output(other,self,"DIA_Marduk_TrainPals_Meaning_15_03");	//� ��� �� ������ ������� �� ����?
	AI_Output(self,other,"DIA_Marduk_TrainPals_Meaning_05_04");	//� ���� ��������� ���� �� ���������� ����, ����� �� ������ �������� ������ � �������� �� ����� ����.
};

func void DIA_Marduk_TrainPals_Blessing()
{
	AI_Output(other,self,"DIA_Marduk_TrainPals_Blessing_15_00");	//��� ����� ��������� ����?
	AI_Output(self,other,"DIA_Marduk_TrainPals_Blessing_05_01");	//��������� ���� - ��� ���� �� ����� ��������� �������� ���������.
	AI_Output(self,other,"DIA_Marduk_TrainPals_Blessing_05_02");	//�� ����� ���� ��������� ������ ���� ������ ��������� ����� ��� �������� � ������� ���� ������������� ����.
	AI_Output(self,other,"DIA_Marduk_TrainPals_Blessing_05_03");	//���, ���������� ����� �������, - ����� ������, ��� ���� � ��������, � �� �� ���������� � ��� �� ����� ����� ����.
	Marduk_TrainPals_permanent = TRUE;
};


instance DIA_Marduk_SwordBlessing(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 33;
	condition = DIA_Marduk_SwordBlessing_Condition;
	information = DIA_Marduk_SwordBlessing_Info;
	permanent = TRUE;
	description = "� ���� �������� ��� ���.";
};


func int DIA_Marduk_SwordBlessing_Condition()
{
	if(Marduk_TrainPals_permanent == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Marduk_SwordBlessing_Info()
{
	AI_Output(other,self,"DIA_Marduk_SwordBlessing_15_00");	//� ���� �������� ��� ���.
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_05_01");	//���� �� ������ ����� ������� ���� ���, ���� ������� ����� ����� ���������� ���.
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_05_02");	//����� �� ������ ��������� � ��� ������� � ��������.
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_05_03");	//�� ����� ������� � ����� ��������� ������������� ������ ������� ������ �� ������ ��������� � ������ ������������ � ������ � ����� ������ ���.
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_05_04");	//���� ����� ����� ������������ � ����, ���� ��� � ��� �� ������ ����� ������� ����� ��������.
	Info_ClearChoices(DIA_Marduk_SwordBlessing);
	Info_AddChoice(DIA_Marduk_SwordBlessing,Dialog_Back,DIA_Marduk_SwordBlessing_Back);
	Info_AddChoice(DIA_Marduk_SwordBlessing,"��� �� �������������?",DIA_Marduk_SwordBlessing_Donation);
	Info_AddChoice(DIA_Marduk_SwordBlessing,"��� ��� ����� ���������� ���?",DIA_Marduk_SwordBlessing_OreBlade);
};

func void DIA_Marduk_SwordBlessing_Back()
{
	Info_ClearChoices(DIA_Marduk_SwordBlessing);
};

func void DIA_Marduk_SwordBlessing_Donation()
{
	AI_Output(other,self,"DIA_Marduk_SwordBlessing_Donation_15_00");	//��� �� �������������?
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_Donation_05_01");	//��, �������� �������, ��� ����� ������� ����, ����� � 5000 ����� ����� ����� ��� ����������.
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_Donation_05_02");	//�������, �� ������ ������������ ������.
};

func void DIA_Marduk_SwordBlessing_OreBlade()
{
	AI_Output(other,self,"DIA_Marduk_SwordBlessing_OreBlade_15_00");	//��� ��� ����� ���������� ���?
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_OreBlade_05_01");	//�������� ���������� � ������ � �������� �������.
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_OreBlade_05_02");	//�� ������������ ��������� ����������� ��������, ���� ��� ��������� �� �������.
	if(Npc_IsDead(Harad) == TRUE)
	{
		AI_Output(other,self,"DIA_Marduk_SwordBlessing_OreBlade_15_03");	//����� �����.
		AI_Output(self,other,"DIA_Marduk_SwordBlessing_OreBlade_05_04");	//��� ����� ����, �� ����� ���� �������� ����� ����������� �� ������� ������ � ������� ����������.
	};
};


instance DIA_Marduk_Kap3_PERM(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 39;
	condition = DIA_Marduk_Kap3_PERM_Condition;
	information = DIA_Marduk_Kap3_PERM_Info;
	permanent = TRUE;
	description = "���� �������?";
};


func int DIA_Marduk_Kap3_PERM_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Marduk_Kap3_PERM_Info()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_15_00");	//���� �������?
	if(MIS_NovizenChase == LOG_Running)
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_05_01");	//��, ����� ������� �������� ��������� � ���� ����.
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_05_02");	//�� ����� ���� ������, ���� �� ����� ������ ����� ����������. � ��� ������ ������� ��������.
	};
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_05_04");	//����, ��-��������, ��� ����� � �����.
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_15_05");	//�� �� ������ � ����?
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_05_06");	//���� �� ���������, �����, ��� ���� �� �����.
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_05_07");	//����� ����� ���� ���! ��� ����� ������� ������, �� � �����, ��� ��� ������ ������.
	Info_ClearChoices(DIA_Marduk_Kap3_PERM);
	Info_AddChoice(DIA_Marduk_Kap3_PERM,Dialog_Back,DIA_Marduk_Kap3_PERM_BAck);
	Info_AddChoice(DIA_Marduk_Kap3_PERM,"��� ����� ������?",DIA_Marduk_Kap3_PERM_AndNow);
	if(MIS_RescueBennet == LOG_SUCCESS)
	{
		Info_AddChoice(DIA_Marduk_Kap3_PERM,"������ �� �������.",DIA_Marduk_Kap3_PERM_BennetisNotGuilty);
	}
	else
	{
		Info_AddChoice(DIA_Marduk_Kap3_PERM,"������ ��� ������?",DIA_Marduk_Kap3_PERM_Murderer);
	};
	if(MIS_NovizenChase == LOG_Running)
	{
		Info_AddChoice(DIA_Marduk_Kap3_PERM,"���� ������� ���?",DIA_Marduk_Kap3_PERM_thief);
	};
};

func void DIA_Marduk_Kap3_PERM_BAck()
{
	Info_ClearChoices(DIA_Marduk_Kap3_PERM);
};

func void DIA_Marduk_Kap3_PERM_AndNow()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_AndNow_15_00");	//��� ����� ������?
	if(MIS_NovizenChase == LOG_Running)
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_AndNow_05_01");	//�� ����� ������������ ����, ���� �� �� �� �������. �� ������ ���, � �� ������� ����������� ���������.
		AI_Output(other,self,"DIA_Marduk_Kap3_PERM_AndNow_15_02");	//��� ����� ������� ����� �����, ��� ���� ���.
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_AndNow_05_03");	//�� ����� ������� ���. � �� �����, ������� ������� �� ��� �����������, �� �� ������ ���.
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_AndNow_05_04");	//������� �������.
	}
	else
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_AndNow_05_05");	//��������, � ��� ����� ��������, ����������, ���� �� ����� ������� ������������.
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_AndNow_05_06");	//������ ��������� ����� ���������� � ������.
	};
};

func void DIA_Marduk_Kap3_PERM_BennetisNotGuilty()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_BennetisNotGuilty_15_00");	//������ �� �������. ��������� ������.
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_BennetisNotGuilty_05_01");	//������ �� ��� ������?
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_BennetisNotGuilty_15_02");	//� ����� ��������������.
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_BennetisNotGuilty_05_03");	//������ ��� �������, ��� ������������� � �������� - ���� ����� ���������� �����.
};

func void DIA_Marduk_Kap3_PERM_Murderer()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_Murderer_15_00");	//������ ��� ������?
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_Murderer_05_01");	//�� �������, ��. �� �������� ���� �� ����������� � ����� �����.
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_Murderer_15_02");	//���?
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_Murderer_05_03");	//� �� ���� ��� �����. �� ����� ���������, �����������, ���� ��������, �� ������� ����� ������� ���������.
};

func void DIA_Marduk_Kap3_PERM_thief()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_thief_15_00");	//���� ������� ���?
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_thief_05_01");	//� �� ����, �� ������� �� ����� ��� ��������� � �����.
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_thief_05_02");	//�� �����, ��� �� ����������, ��� ����� ������ �� ���������, ���� ������ ������� ��� � ������ ��� ������ ������.
};


instance DIA_Marduk_Kap4_EXIT(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 999;
	condition = DIA_Marduk_Kap4_EXIT_Condition;
	information = DIA_Marduk_Kap4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Marduk_Kap4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Marduk_Kap4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Marduk_Kap4U5_PERM(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 49;
	condition = DIA_Marduk_Kap4U5_PERM_Condition;
	information = DIA_Marduk_Kap4U5_PERM_Info;
	permanent = TRUE;
	description = "���� �������?";
};


func int DIA_Marduk_Kap4U5_PERM_Condition()
{
	if((Kapitel == 4) || (Kapitel == 5))
	{
		return TRUE;
	};
};

func void DIA_Marduk_Kap4U5_PERM_Info()
{
	AI_Output(other,self,"DIA_Marduk_Kap4U5_PERM_15_00");	//���� �������?
	AI_Output(self,other,"DIA_Marduk_Kap4U5_PERM_05_01");	//���, �, ����, �������� ��� ��� ����� �����������.
};


instance DIA_Marduk_Kap5_EXIT(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 999;
	condition = DIA_Marduk_Kap5_EXIT_Condition;
	information = DIA_Marduk_Kap5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Marduk_Kap5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Marduk_Kap5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Marduk_PICKPOCKET(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 900;
	condition = DIA_Marduk_PICKPOCKET_Condition;
	information = DIA_Marduk_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Marduk_PICKPOCKET_Condition()
{
	return C_Beklauen(36,40);
};

func void DIA_Marduk_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Marduk_PICKPOCKET);
	Info_AddChoice(DIA_Marduk_PICKPOCKET,Dialog_Back,DIA_Marduk_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Marduk_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Marduk_PICKPOCKET_DoIt);
};

func void DIA_Marduk_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Marduk_PICKPOCKET);
};

func void DIA_Marduk_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Marduk_PICKPOCKET);
};

