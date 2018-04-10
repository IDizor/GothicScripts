
instance DIA_Wolf_EXIT(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 999;
	condition = DIA_Wolf_EXIT_Condition;
	information = DIA_Wolf_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Wolf_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Wolf_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Wolf_Hallo(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 4;
	condition = DIA_Wolf_Hallo_Condition;
	information = DIA_Wolf_Hallo_Info;
	permanent = FALSE;
	description = "��� ����?";
};


func int DIA_Wolf_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Wolf_Hallo_Info()
{
	AI_Output(other,self,"DIA_Wolf_Hallo_15_00");	//��� ����?
	AI_Output(self,other,"DIA_Wolf_Hallo_08_01");	//��! � ���� ����! �� �� �������.
	AI_Output(self,other,"DIA_Wolf_Hallo_08_02");	//��� ���� ����� �����?
};


instance DIA_Wolf_WannaJoin(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 5;
	condition = DIA_Wolf_WannaJoin_Condition;
	information = DIA_Wolf_WannaJoin_Info;
	permanent = FALSE;
	description = "� ���� �������������� � ���.";
};


func int DIA_Wolf_WannaJoin_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wolf_Hallo) && (Kapitel < 2))
	{
		return TRUE;
	};
};

func void DIA_Wolf_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Wolf_WannaJoin_15_00");	//� ���� �������������� � ���.
	AI_Output(self,other,"DIA_Wolf_WannaJoin_08_01");	//������ �� � ���? � �� ���� ������ ������. � �����, ��� �� ��������� ���� �����, ���� ����������.
	AI_Output(self,other,"DIA_Wolf_WannaJoin_08_02");	//�� �� �����������, ��� ���� ��� ������ ������� �������� �������� ������.
	AI_Output(self,other,"DIA_Wolf_WannaJoin_08_03");	//��������� ����� �� ������� ������� ������. � ���� ������ ������ �������� ����� �� ������� ����.
	AI_Output(self,other,"DIA_Wolf_WannaJoin_08_04");	//� ���-�� ��� ����� ����, �� ��������� ������ �����������.
	AI_Output(other,self,"DIA_Wolf_WannaJoin_15_05");	//����� ������ ���, ��� ����� ������� �������� � �����.
	AI_Output(self,other,"DIA_Wolf_WannaJoin_08_06");	//��, ������, ���� ��� �� �������.
	B_LogEntry(TOPIC_SLDRespekt,"����� �� ��������� ������ ����� ���������� � ���� ���������.");
};


instance DIA_Wolf_WannaBuy(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 6;
	condition = DIA_Wolf_WannaBuy_Condition;
	information = DIA_Wolf_WannaBuy_Info;
	permanent = FALSE;
	description = "�� ������ ���-������ �������?";
};


func int DIA_Wolf_WannaBuy_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wolf_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Wolf_WannaBuy_Info()
{
	AI_Output(other,self,"DIA_Wolf_WannaBuy_15_00");	//�� ������ ���-������ �������?
	AI_Output(self,other,"DIA_Wolf_WannaBuy_08_01");	//��, ����� �� ���������.
	AI_Output(self,other,"DIA_Wolf_WannaBuy_08_02");	//������, ���� �� ����� ������, ������ �������� ������� � ���������.
	AI_Output(self,other,"DIA_Wolf_WannaBuy_08_03");	//� ������� � ������� �� ���� ������� ��, � ��� ������ ������� ������ � - ��� - � ������� ��� ������.
	AI_Output(self,other,"DIA_Wolf_WannaBuy_08_04");	//��� ����� ����� ����� ������, ���� ���� ��� ����� ������ ������� ����.
	AI_Output(self,other,"DIA_Wolf_WannaBuy_08_05");	//���� ��� �� �������, ���� �� ������ �� ���� ������� �����.
};


instance DIA_Wolf_WannaLearn(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 7;
	condition = DIA_Wolf_WannaLearn_Condition;
	information = DIA_Wolf_WannaLearn_Info;
	permanent = FALSE;
	description = "�� ������ ������� ���� ����-������?";
};


func int DIA_Wolf_WannaLearn_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wolf_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Wolf_WannaLearn_Info()
{
	AI_Output(other,self,"DIA_Wolf_WannaLearn_15_00");	//�� ������ ������� ���� ����-������?
	AI_Output(self,other,"DIA_Wolf_WannaLearn_08_01");	//� ���� ������� ���� �������� ��������� � �����, ���� ������. ��� ����� ��� ������ ������ ������.
	Wolf_TeachBow = TRUE;
	Log_CreateTopic(Topic_SoldierTeacher,LOG_NOTE);
	B_LogEntry(Topic_SoldierTeacher,"����� ����� ������� ���� ��������� � �����.");
};


var int Wolf_Merke_Bow;

instance DIA_Wolf_TEACH(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 8;
	condition = DIA_Wolf_TEACH_Condition;
	information = DIA_Wolf_TEACH_Info;
	permanent = TRUE;
	description = "� ���� ��������� �������� �� ����.";
};


func int DIA_Wolf_TEACH_Condition()
{
	if(Wolf_TeachBow == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Wolf_TEACH_Info()
{
	AI_Output(other,self,"DIA_Wolf_TEACH_15_00");	//� ���� ��������� �������� �� ����.
	AI_Output(self,other,"DIA_Wolf_TEACH_08_01");	//���� ������� ����?
	Wolf_Merke_Bow = other.HitChance[NPC_TALENT_BOW];
	Info_ClearChoices(DIA_Wolf_TEACH);
	Info_AddChoice(DIA_Wolf_TEACH,Dialog_Back,DIA_Wolf_Teach_Back);
	Info_AddChoice(DIA_Wolf_TEACH,B_BuildLearnString(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Wolf_Teach_Bow_1);
	Info_AddChoice(DIA_Wolf_TEACH,B_BuildLearnString(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_Wolf_Teach_Bow_5);
};

func void DIA_Wolf_Teach_Back()
{
	if(Wolf_Merke_Bow < other.HitChance[NPC_TALENT_BOW])
	{
		AI_Output(self,other,"DIA_Wolf_Teach_BACK_08_00");	//��� ���. ���� �������� ����������� �������.
	};
	Info_ClearChoices(DIA_Wolf_TEACH);
};

func void DIA_Wolf_Teach_Bow_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,1,90);
	Info_ClearChoices(DIA_Wolf_TEACH);
	Info_AddChoice(DIA_Wolf_TEACH,Dialog_Back,DIA_Wolf_Teach_Back);
	Info_AddChoice(DIA_Wolf_TEACH,B_BuildLearnString(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Wolf_Teach_Bow_1);
	Info_AddChoice(DIA_Wolf_TEACH,B_BuildLearnString(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_Wolf_Teach_Bow_5);
};

func void DIA_Wolf_Teach_Bow_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,5,90);
	Info_ClearChoices(DIA_Wolf_TEACH);
	Info_AddChoice(DIA_Wolf_TEACH,Dialog_Back,DIA_Wolf_Teach_Back);
	Info_AddChoice(DIA_Wolf_TEACH,B_BuildLearnString(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Wolf_Teach_Bow_1);
	Info_AddChoice(DIA_Wolf_TEACH,B_BuildLearnString(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_Wolf_Teach_Bow_5);
};


instance DIA_Wolf_PERM(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 9;
	condition = DIA_Wolf_PERM_Condition;
	information = DIA_Wolf_PERM_Info;
	permanent = TRUE;
	description = "��, ���? �� ����� ��� ������?";
};


func int DIA_Wolf_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wolf_WannaBuy) && (MIS_BengarsHelpingSLD == 0) && (Wolf_IsOnBoard != LOG_FAILED))
	{
		return TRUE;
	};
};

func void DIA_Wolf_PERM_Info()
{
	AI_Output(other,self,"DIA_Wolf_PERM_15_00");	//��, ���? �� ����� ��� ������?
	AI_Output(self,other,"DIA_Wolf_PERM_08_01");	//���� ���. ��� ��� �����, ���� ����������� �����-������ ������ ��� ����.
};


instance DIA_Wolf_Stadt(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 10;
	condition = DIA_Wolf_Stadt_Condition;
	information = DIA_Wolf_Stadt_Info;
	permanent = FALSE;
	description = "� �� �� ������� ����� ������ � ������?";
};


func int DIA_Wolf_Stadt_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wolf_WannaBuy) && (MIS_BengarsHelpingSLD == 0) && (Wolf_IsOnBoard != LOG_FAILED))
	{
		return TRUE;
	};
};

func void DIA_Wolf_Stadt_Info()
{
	AI_Output(other,self,"DIA_Wolf_Stadt_15_00");	//� �� �� ������� ����� ������ � ������?
	AI_Output(self,other,"DIA_Wolf_Stadt_08_01");	//� ������? (�������) �� ���� ���� ������ �� ��������.
	AI_Output(self,other,"DIA_Wolf_Stadt_08_02");	//��� �� �������, ��� � ����� �������� �������� ���������? � ���� ����������� ���� �� ���� � ���� �������� ��������.
	AI_Output(self,other,"DIA_Wolf_Stadt_08_03");	//� ��� �� ����������� ������������. ���, ������ �� ���� - ���� �����, �� �����, � ����� ��������, ��, �� ������� ����, � ���� ������ ��� ����.
};


var int MIS_Wolf_BringCrawlerPlates;
var int Wolf_MakeArmor;
var int Player_GotCrawlerArmor;

instance DIA_Wolf_AboutCrawler(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 1;
	condition = DIA_Wolf_AboutCrawler_Condition;
	information = DIA_Wolf_AboutCrawler_Info;
	permanent = FALSE;
	description = "� ������, �� ������ ������ ������� �� �������� ���������?";
};


func int DIA_Wolf_AboutCrawler_Condition()
{
	if((Kapitel >= 2) && (Wolf_ProduceCrawlerArmor == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Wolf_AboutCrawler_Info()
{
	AI_Output(other,self,"DIA_Wolf_AboutCrawler_15_00");	//� ������, �� ������ ������ ������� �� �������� ���������?
	AI_Output(self,other,"DIA_Wolf_AboutCrawler_08_01");	//��� ������. � �� ���� �� �� ���� �����?
	AI_Output(other,self,"DIA_Wolf_AboutCrawler_15_02");	//��� ������ ������� ������.
	AI_Output(other,self,"DIA_Wolf_AboutCrawler_15_03");	//�� ������ ������� ����� ������� ��� ����?
	AI_Output(self,other,"DIA_Wolf_AboutCrawler_08_04");	//�������. ������� ��� 10 �������� ���������, � � ������ ���� �������.
	AI_Output(other,self,"DIA_Wolf_AboutCrawler_15_05");	//������� �� ������ �� ���?
	AI_Output(self,other,"DIA_Wolf_AboutCrawler_08_06");	//������ �� ����. � ������ �� ���������. � ������ � ������ ��������.
	MIS_Wolf_BringCrawlerPlates = LOG_Running;
	Log_CreateTopic(TOPIC_Wolf_BringCrawlerPlates,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Wolf_BringCrawlerPlates,LOG_Running);
	B_LogEntry(TOPIC_Wolf_BringCrawlerPlates,"����� ����� ������� ��� ������� �� 10 �������� ���������.");
};


instance DIA_Wolf_TeachCrawlerPlates(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 2;
	condition = DIA_Wolf_TeachCrawlerPlates_Condition;
	information = DIA_Wolf_TeachCrawlerPlates_Info;
	permanent = TRUE;
	description = B_BuildLearnString("����� ���� ������� ������� � ���������!",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_CrawlerPlate));
};


func int DIA_Wolf_TeachCrawlerPlates_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wolf_AboutCrawler) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Wolf_TeachCrawlerPlates_Info()
{
	AI_Output(other,self,"DIA_Wolf_TeachCrawlerPlates_15_00");	//����� ���� ������� ������� � ���������!
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_CrawlerPlate))
	{
		AI_Output(self,other,"DIA_Wolf_TeachCrawlerPlates_08_01");	//��� ������. ������� ����� ������� ����������� � ��������� ������ �� �����. ������ ������ � ��������� ��� ��� ������ ������� ����.
		AI_Output(self,other,"DIA_Wolf_TeachCrawlerPlates_08_02");	//�������?
		AI_Output(other,self,"DIA_Wolf_TeachCrawlerPlates_15_03");	//����� �� ������.
		AI_Output(self,other,"DIA_Wolf_TeachCrawlerPlates_08_04");	//��, � ��� � ������.
	};
};


instance DIA_Wolf_BringPlates(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 3;
	condition = DIA_Wolf_BringPlates_Condition;
	information = DIA_Wolf_BringPlates_Info;
	permanent = TRUE;
	description = "� ������ ������� ��������� ��� ��������.";
};


func int DIA_Wolf_BringPlates_Condition()
{
	if((MIS_Wolf_BringCrawlerPlates == LOG_Running) && (Npc_HasItems(other,ItAt_CrawlerPlate) >= 10))
	{
		return TRUE;
	};
};

func void DIA_Wolf_BringPlates_Info()
{
	AI_Output(other,self,"DIA_Wolf_BringPlates_15_00");	//� ������ ������� ��������� ��� ��������.
	B_GiveInvItems(other,self,ItAt_CrawlerPlate,10);
	AI_Output(self,other,"DIA_Wolf_BringPlates_08_01");	//������! ����� �� ����.
	MIS_Wolf_BringCrawlerPlates = LOG_SUCCESS;
};


var int Wolf_Armor_Day;

instance DIA_Wolf_ArmorReady(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 4;
	condition = DIA_Wolf_ArmorReady_Condition;
	information = DIA_Wolf_ArmorReady_Info;
	permanent = TRUE;
	description = "��� ��� �������?";
};


func int DIA_Wolf_ArmorReady_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wolf_AboutCrawler) && (Player_GotCrawlerArmor == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Wolf_ArmorReady_Info()
{
	AI_Output(other,self,"DIA_Wolf_ArmorReady_15_00");	//��� ��� �������?
	if(Npc_HasItems(self,ItAt_CrawlerPlate) >= 10)
	{
		if(Wolf_MakeArmor == FALSE)
		{
			Wolf_Armor_Day = Wld_GetDay() + 1;
			Wolf_MakeArmor = TRUE;
		};
		if((Wolf_MakeArmor == TRUE) && (Wolf_Armor_Day > Wld_GetDay()))
		{
			AI_Output(self,other,"DIA_Wolf_ArmorReady_08_01");	//����� ��� ����� ������. ������ ������.
		}
		else
		{
			CreateInvItems(self,ITAR_DJG_Crawler,1);
			Npc_RemoveInvItems(self,ItAt_CrawlerPlate,10);
			AI_Output(self,other,"DIA_Wolf_ArmorReady_08_02");	//� �������� ��. ���, �����.
			B_GiveInvItems(self,other,ITAR_DJG_Crawler,1);
			AI_Output(self,other,"DIA_Wolf_ArmorReady_08_03");	//���������� �������, ��� �������...
			AI_Output(other,self,"DIA_Wolf_ArmorReady_15_04");	//�������!
			AI_Output(self,other,"DIA_Wolf_ArmorReady_08_05");	//�� �����.
			Player_GotCrawlerArmor = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_ArmorReady_08_06");	//�� ������. ������� ��� ����� ������� ���������...
		Wolf_MakeArmor = FALSE;
		MIS_Wolf_BringCrawlerPlates = LOG_Running;
	};
};


instance DIA_Wolf_KAP3_EXIT(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 999;
	condition = DIA_Wolf_KAP3_EXIT_Condition;
	information = DIA_Wolf_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Wolf_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Wolf_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Wolf_BENGAR(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 31;
	condition = DIA_Wolf_BENGAR_Condition;
	information = DIA_Wolf_BENGAR_Info;
	permanent = TRUE;
	description = "������, � ����� ������ ��� ���� �� ����� �������.";
};


func int DIA_Wolf_BENGAR_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wolf_Hallo) && (MIS_BengarsHelpingSLD == LOG_Running) && (Kapitel >= 3) && (Wolf_IsOnBoard != LOG_SUCCESS))
	{
		return TRUE;
	};
};


var int DIA_Wolf_BENGAR_oneTime;
var int Wolf_BENGAR_geld;

func void DIA_Wolf_BENGAR_Info()
{
	AI_Output(other,self,"DIA_Wolf_BENGAR_15_00");	//������, � ����� ������ ��� ���� �� ����� �������.
	if(DIA_Wolf_BENGAR_oneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Wolf_BENGAR_08_01");	//����������.
		AI_Output(other,self,"DIA_Wolf_BENGAR_15_02");	//������ � ������ �������� ���������� ����� �� ������ �������. ��� ��������� �����, ��������������� ����� ������.
		AI_Output(other,self,"DIA_Wolf_BENGAR_15_03");	//�����, ����� ���-������ ������� ����� �������.
		AI_Output(self,other,"DIA_Wolf_BENGAR_08_04");	//��, ���� ���-��. � ���� �� ���� ������ �� ���� �����, � �� ���� �������� ��� ����� �� ������� �������.
		DIA_Wolf_BENGAR_oneTime = TRUE;
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Wolf_BENGAR_08_05");	//� ��������. � ��� ��� �� ���� �� ���, � �� ������ ����� �� ��� ������. ��� ��� 300 �������, � � ����� �� ����������� ����.
		Wolf_BENGAR_geld = 300;
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_BENGAR_08_06");	//������. ��� ����� ������ 800 �������.
		AI_Output(other,self,"DIA_Wolf_BENGAR_15_07");	//�������� ����.
		AI_Output(self,other,"DIA_Wolf_BENGAR_08_08");	//��. ��� ������ �� ���, � ������ �� ��� ����������� ���������. �� ��� ����...
		Wolf_BENGAR_geld = 800;
	};
	Info_ClearChoices(DIA_Wolf_BENGAR);
	Info_AddChoice(DIA_Wolf_BENGAR,"� ������� ��� ����.",DIA_Wolf_BENGAR_nochnicht);
	Info_AddChoice(DIA_Wolf_BENGAR,"��� ���� ������.",DIA_Wolf_BENGAR_geld);
};

func void DIA_Wolf_BENGAR_geld()
{
	AI_Output(other,self,"DIA_Wolf_BENGAR_geld_15_00");	//��� ���� ������.
	if(B_GiveInvItems(other,self,ItMi_Gold,Wolf_BENGAR_geld))
	{
		AI_Output(self,other,"DIA_Wolf_BENGAR_geld_08_01");	//������. � ��� ����. ���������, ��� ��� �� �����.
		AI_Output(self,other,"DIA_Wolf_BENGAR_geld_08_02");	//�������� �����.
		MIS_BengarsHelpingSLD = LOG_SUCCESS;
		B_GivePlayerXP(XP_BengarsHelpingSLD);
		AI_StopProcessInfos(self);
		AI_UseMob(self,"BENCH",-1);
		Npc_ExchangeRoutine(self,"BengarsFarm");
		B_StartOtherRoutine(SLD_815_Soeldner,"BengarsFarm");
		B_StartOtherRoutine(SLD_817_Soeldner,"BengarsFarm");
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_BENGAR_geld_08_03");	//���� �� � ���� ���� ������, � ��� ��� �� ���.
	};
	Info_ClearChoices(DIA_Wolf_BENGAR);
};

func void DIA_Wolf_BENGAR_nochnicht()
{
	AI_Output(other,self,"DIA_Wolf_BENGAR_nochnicht_15_00");	//� ������� ��� ����.
	AI_Output(self,other,"DIA_Wolf_BENGAR_nochnicht_08_01");	//�����, ������ �� ������ ����.
	Info_ClearChoices(DIA_Wolf_BENGAR);
};


instance DIA_Wolf_PERMKAP3(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 80;
	condition = DIA_Wolf_PERMKAP3_Condition;
	information = DIA_Wolf_PERMKAP3_Info;
	permanent = TRUE;
	description = "��� � �������?";
};


func int DIA_Wolf_PERMKAP3_Condition()
{
	if((Kapitel >= 3) && (Npc_GetDistToWP(self,"FARM3") < 3000) && (MIS_BengarsHelpingSLD == LOG_SUCCESS) && (Wolf_IsOnBoard != LOG_SUCCESS))
	{
		return TRUE;
	};
};


var int DIA_Wolf_PERMKAP3_onetime;

func void DIA_Wolf_PERMKAP3_Info()
{
	AI_Output(other,self,"DIA_Wolf_PERMKAP3_15_00");	//��� � �������?
	if(Npc_IsDead(Bengar) && (DIA_Wolf_PERMKAP3_onetime == FALSE))
	{
		AI_Output(self,other,"DIA_Wolf_PERMKAP3_08_01");	//��� ������������ �����. ����� ����� ��� ����� �����. ������, � ������ ����� ����� ���� ����������� �����.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"BengarDead");
		DIA_Wolf_PERMKAP3_onetime = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_PERMKAP3_08_02");	//�������! ��� ��������.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Wolf_KAP4_EXIT(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 999;
	condition = DIA_Wolf_KAP4_EXIT_Condition;
	information = DIA_Wolf_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Wolf_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Wolf_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Wolf_KAP5_EXIT(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 999;
	condition = DIA_Wolf_KAP5_EXIT_Condition;
	information = DIA_Wolf_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Wolf_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Wolf_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


var int wolf_SaidNo;

instance DIA_Wolf_SHIP(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 2;
	condition = DIA_Wolf_SHIP_Condition;
	information = DIA_Wolf_SHIP_Info;
	description = "� �� �� ������ ����������� �� ���� � ����������� �� �������?";
};


func int DIA_Wolf_SHIP_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && Npc_KnowsInfo(other,DIA_Wolf_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Wolf_SHIP_Info()
{
	AI_Output(other,self,"DIA_Wolf_SHIP_15_00");	//� �� �� ������ ����������� �� ���� � ����������� �� �������?
	if((MIS_BengarsHelpingSLD == LOG_SUCCESS) && !Npc_IsDead(Bengar))
	{
		AI_Output(self,other,"DIA_Wolf_SHIP_08_01");	//���. ������ �� ����. � ����� ���� ������. ����� ����, � ������ ���.
		wolf_SaidNo = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_SHIP_08_02");	//��, �������. ����� ��������� ������. �� �� ��������� �� ����. � ������ ���� �������� �������. ���� �� ������������?
		MIS_BengarsHelpingSLD = LOG_OBSOLETE;
		Log_CreateTopic(Topic_Crew,LOG_MISSION);
		Log_SetTopicStatus(Topic_Crew,LOG_Running);
		B_LogEntry(Topic_Crew,"������ ������ ���� ������, � �� ����� �� ���, ����� �������� ������. �� ������� ����.");
	};
};


instance DIA_Wolf_KnowWhereEnemy(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 2;
	condition = DIA_Wolf_KnowWhereEnemy_Condition;
	information = DIA_Wolf_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = "� ����������� �� ������ �������� ������.";
};


func int DIA_Wolf_KnowWhereEnemy_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wolf_SHIP) && (wolf_SaidNo == FALSE) && (MIS_SCKnowsWayToIrdorath == TRUE) && (Wolf_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Wolf_KnowWhereEnemy_Info()
{
	AI_Output(other,self,"DIA_Wolf_KnowWhereEnemy_15_00");	//� ����������� �� ������ �������� ������.
	AI_Output(self,other,"DIA_Wolf_KnowWhereEnemy_08_01");	//� ���� �� ����� ����? ���� �� ����� � ����, � ���� ������� ���� �������� �� ���� � ��������.
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self,"DIA_Wolf_KnowWhereEnemy_15_02");	//� ��������, ��� � ���� ��� ���������� �����.
		AI_Output(self,other,"DIA_Wolf_KnowWhereEnemy_08_03");	//(���) ��� ��� ��� �� ����������. ������� ������ ���� � �����, � ����� ����� �� ����� �������, ��?
		AI_Output(self,other,"DIA_Wolf_KnowWhereEnemy_08_04");	//�� ����� ��. ���� ���� ������ ��������.
		AI_StopProcessInfos(self);
	}
	else
	{
		Info_ClearChoices(DIA_Wolf_KnowWhereEnemy);
		Info_AddChoice(DIA_Wolf_KnowWhereEnemy,"� ��� ������� �������.",DIA_Wolf_KnowWhereEnemy_No);
		Info_AddChoice(DIA_Wolf_KnowWhereEnemy,"����� ���������� �� ����!",DIA_Wolf_KnowWhereEnemy_Yes);
	};
};

func void DIA_Wolf_KnowWhereEnemy_Yes()
{
	AI_Output(other,self,"DIA_Wolf_KnowWhereEnemy_Yes_15_00");	//����� ���������� �� ����!
	AI_Output(other,self,"DIA_Wolf_KnowWhereEnemy_Yes_15_01");	//������� � ������. �� ����� ������������.
	AI_Output(self,other,"DIA_Wolf_KnowWhereEnemy_Yes_08_02");	//������ �������, ��� � ��� ���.
	B_GivePlayerXP(XP_Crewmember_Success);
	self.flags = NPC_FLAG_IMMORTAL;
	Wolf_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	AI_StopProcessInfos(self);
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
};

func void DIA_Wolf_KnowWhereEnemy_No()
{
	AI_Output(other,self,"DIA_Wolf_KnowWhereEnemy_No_15_00");	//� ��� ������� �������.
	AI_Output(self,other,"DIA_Wolf_KnowWhereEnemy_No_08_01");	//��-�����, �� ������ ������. � �� ���� �� ������ ������ �����. ����������.
	Wolf_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Wolf_KnowWhereEnemy);
};


instance DIA_Wolf_LeaveMyShip(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 55;
	condition = DIA_Wolf_LeaveMyShip_Condition;
	information = DIA_Wolf_LeaveMyShip_Info;
	permanent = TRUE;
	description = "� �����, ��� �� ��� �� �����.";
};


func int DIA_Wolf_LeaveMyShip_Condition()
{
	if((Wolf_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Wolf_LeaveMyShip_Info()
{
	AI_Output(other,self,"DIA_Wolf_LeaveMyShip_15_00");	//� �����, ��� �� ��� �� �����.
	AI_Output(self,other,"DIA_Wolf_LeaveMyShip_08_01");	//������� �� �������� � ���� �������, � ����� ����� �� ����� �������. �� ��� ��������� �� ����!
	Wolf_IsOnBoard = LOG_FAILED;
	Crewmember_Count = Crewmember_Count - 1;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_Wolf_SHIPOFF(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 56;
	condition = DIA_Wolf_SHIPOFF_Condition;
	information = DIA_Wolf_SHIPOFF_Info;
	permanent = TRUE;
	description = "��������.";
};


func int DIA_Wolf_SHIPOFF_Condition()
{
	if(Wolf_IsOnBoard == LOG_FAILED)
	{
		return TRUE;
	};
};

func void DIA_Wolf_SHIPOFF_Info()
{
	AI_Output(other,self,"DIA_Wolf_SHIPOFF_15_00");	//��������.
	AI_Output(self,other,"DIA_Wolf_SHIPOFF_08_01");	//����������, �������.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Wolf_KAP6_EXIT(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 999;
	condition = DIA_Wolf_KAP6_EXIT_Condition;
	information = DIA_Wolf_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Wolf_KAP6_EXIT_Condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Wolf_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Wolf_PICKPOCKET(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 900;
	condition = DIA_Wolf_PICKPOCKET_Condition;
	information = DIA_Wolf_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Wolf_PICKPOCKET_Condition()
{
	return C_Beklauen(32,35);
};

func void DIA_Wolf_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Wolf_PICKPOCKET);
	Info_AddChoice(DIA_Wolf_PICKPOCKET,Dialog_Back,DIA_Wolf_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Wolf_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Wolf_PICKPOCKET_DoIt);
};

func void DIA_Wolf_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Wolf_PICKPOCKET);
};

func void DIA_Wolf_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Wolf_PICKPOCKET);
};

