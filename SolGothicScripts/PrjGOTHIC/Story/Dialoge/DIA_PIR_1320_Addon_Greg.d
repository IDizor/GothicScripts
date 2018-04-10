
instance DIA_Addon_Greg_EXIT(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 999;
	condition = DIA_Addon_Greg_EXIT_Condition;
	information = DIA_Addon_Greg_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Greg_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Greg_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Greg_PICKPOCKET(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 900;
	condition = DIA_Addon_Greg_PICKPOCKET_Condition;
	information = DIA_Addon_Greg_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_120;
};


func int DIA_Addon_Greg_PICKPOCKET_Condition()
{
	return C_Beklauen(111,666);
};

func void DIA_Addon_Greg_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Greg_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Greg_PICKPOCKET,Dialog_Back,DIA_Addon_Greg_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Greg_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Greg_PICKPOCKET_DoIt);
};

func void DIA_Addon_Greg_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Greg_PICKPOCKET);
};

func void DIA_Addon_Greg_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Greg_PICKPOCKET);
};


instance DIA_Addon_Greg_ImNew(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 1;
	condition = DIA_Addon_Greg_ImNew_Condition;
	information = DIA_Addon_Greg_ImNew_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Greg_ImNew_Condition()
{
	return TRUE;
};

func void DIA_Addon_Greg_ImNew_Info()
{
	AI_Output(self,other,"DIA_Addon_Greg_Hello_01_00");	//��, ��! ��� �� ������� � ���� ������?
	AI_Output(other,self,"DIA_Addon_Greg_Hello_15_01");	//�...
	AI_Output(self,other,"DIA_Addon_Greg_Hello_01_02");	//����� ������ �� ��������� ����, � ��� ��� ������ ���������� ������� ������������� � ���� ������.
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_03");	//������ �����, ��� ����� ����������?
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_04");	//�������� ��� �� ��������! ������ ������ ����� �������, � ��� ������ � ������, ��� ��������� ������.
	GregIsBack = TRUE;
	if(!Npc_IsDead(Francis))
	{
		AI_TurnToNPC(self,Francis);
		AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_05");	//� ��� ���, ��� �� ������, �������?
		if(C_BodyStateContains(Francis,BS_SIT))
		{
			AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_06");	//���������� ����� � ���� ��������!
		};
	};
	Npc_ExchangeRoutine(self,"HOME");
	AI_TurnToNPC(self,other);
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_07");	//� ��? ��� �� ������?
	Info_ClearChoices(DIA_Addon_Greg_ImNew);
	Info_AddChoice(DIA_Addon_Greg_ImNew,"���� �� ��� �����.",DIA_Addon_Greg_ImNew_nich);
	if((Npc_IsDead(BeachLurker1) && Npc_IsDead(BeachLurker2) && Npc_IsDead(BeachLurker3) && Npc_IsDead(BeachWaran1) && Npc_IsDead(BeachWaran2) && Npc_IsDead(BeachShadowbeast1) && Npc_IsDead(BeachShadowbeast1) && (MIS_Addon_MorganLurker != 0)) || (C_TowerBanditsDead() == TRUE))
	{
		Info_AddChoice(DIA_Addon_Greg_ImNew,"� �������.",DIA_Addon_Greg_ImNew_turm);
	};
};

func void B_UseRakeBilanz()
{
	if((MIS_Addon_Greg_RakeCave == LOG_Running) && (Greg_SuchWeiter == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_00");	//� �� �����, ��� � �����, ��� �� ��� �������.
		AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_01");	//� ��������� ������ �������� � ����� ��������� ����� ������� �����.
		AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_02");	//�� �� �����������, �� ��� ��?
		AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_03");	//� �������� ���� ���������� ��� �� ���������� ������.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_04");	//� ������ ����, ��� ������ ��������� ��-�������.
	};
	if(!Npc_IsDead(Francis))
	{
		Npc_ExchangeRoutine(Francis,"GREGISBACK");
		AI_StartState(Francis,ZS_Saw,1,"ADW_PIRATECAMP_BEACH_19");
		Francis_ausgeschissen = TRUE;
	};
	Info_ClearChoices(DIA_Addon_Greg_ImNew);
};

func void DIA_Addon_Greg_ImNew_nich()
{
	AI_Output(other,self,"DIA_Addon_Greg_ImNew_nich_15_00");	//���� �� ��� �����.
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_nich_01_01");	//�������. � ���-������ ������� ����, �������.
	B_UseRakeBilanz();
};

func void DIA_Addon_Greg_ImNew_turm()
{
	AI_Output(other,self,"DIA_Addon_Greg_ImNew_turm_15_00");	//� �������.
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_turm_01_01");	//������? � ���?
	if(C_TowerBanditsDead() == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Greg_ImNew_turm_15_02");	//� ���������� � ��������� �� �����.
	};
	if(Npc_IsDead(BeachLurker1) && Npc_IsDead(BeachLurker2) && Npc_IsDead(BeachLurker3) && Npc_IsDead(BeachWaran1) && Npc_IsDead(BeachWaran2) && Npc_IsDead(BeachShadowbeast1) && (MIS_Addon_MorganLurker != 0))
	{
		AI_Output(other,self,"DIA_Addon_Greg_ImNew_turm_15_03");	//�� ��������� � ������ ������ ��� ����� ������.
	};
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_turm_01_04");	//�� ��� �. �������, ������� ������.
	B_UseRakeBilanz();
};


instance DIA_Addon_Greg_JoinPirates(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_JoinPirates_Condition;
	information = DIA_Addon_Greg_JoinPirates_Info;
	permanent = FALSE;
	description = "��� ����� �������?";
};


func int DIA_Addon_Greg_JoinPirates_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Greg_ImNew) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_JoinPirates_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_JoinPirates_15_00");	//��� ����� �������?
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_01_01");	//������ ����� ���������� ����������� � ������ �����.
	if(Npc_IsDead(Morgan) == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_01_02");	//��� ������� ������ ������ ����� ������ ���������.
	};
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_01_03");	//� �� ��������� ������� ������� � �������� ������ �� ���� ��������� ������.
	MIS_Addon_Greg_ClearCanyon = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_ClearCanyon,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_ClearCanyon,LOG_Running);
	B_LogEntry(TOPIC_Addon_ClearCanyon,"���� �����, ����� � ���� �� ���� ������ ������� � ������� ������ �� ������.");
	Info_ClearChoices(DIA_Addon_Greg_JoinPirates);
	Info_AddChoice(DIA_Addon_Greg_JoinPirates,"� ����� ������ ��� ����.",DIA_Addon_Greg_JoinPirates_Leave);
	if((Npc_IsDead(Brandon) == FALSE) || (Npc_IsDead(Matt) == FALSE))
	{
		Info_AddChoice(DIA_Addon_Greg_JoinPirates,"� ���, ������ ������ ��� � ��������?",DIA_Addon_Greg_JoinPirates_Compadres);
	};
	Info_AddChoice(DIA_Addon_Greg_JoinPirates,"��� ��� �� �����?",DIA_Addon_Greg_JoinPirates_ClearCanyon);
};

func void DIA_Addon_Greg_JoinPirates_Leave()
{
	AI_Output(other,self,"DIA_Addon_Greg_JoinPirates_Leave_15_00");	//� ����� ������ ��� ����.
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_01");	//� ��� ���-���. ������ �� ���� �� ���.
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_02");	//������� ������� ����� ���� ���������� ������ ��������.
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_03");	//���, ������ ���. �������, ���� ��� ���������� �������� �����.
	CreateInvItems(self,ITAR_PIR_M_Addon,1);
	B_GiveInvItems(self,other,ITAR_PIR_M_Addon,1);
	AI_EquipArmor(hero,ITAR_PIR_M_Addon);
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_04");	//� �� ������, ������ ���������� �� ����!
	Info_ClearChoices(DIA_Addon_Greg_JoinPirates);
};

func void DIA_Addon_Greg_JoinPirates_Compadres()
{
	AI_Output(other,self,"DIA_Addon_Greg_JoinPirates_Compadres_15_00");	//� ���, ������ ������ ��� � ��������?
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Compadres_01_01");	//������ ��������� � ����� ������.
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Compadres_01_02");	//����� ������������ ���� ��������.
	B_LogEntry(TOPIC_Addon_ClearCanyon,"���� ������, ��� � ���� ����� � ����� ���������� �����.");
};

func void DIA_Addon_Greg_JoinPirates_ClearCanyon()
{
	AI_Output(other,self,"DIA_Addon_Greg_JoinPirates_ClearCanyon_15_00");	//��� ��� �� �����?
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_ClearCanyon_01_01");	//���������� � ������� ��� ����� ����������� � ������ ������.
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_ClearCanyon_01_02");	//� �� ��������� �����, ���� ��� ������ ����-������ �� ���� �����.
	B_LogEntry(TOPIC_Addon_ClearCanyon,"��������� � ������ �� �����������.");
};


instance DIA_Addon_Greg_AboutCanyon(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_AboutCanyon_Condition;
	information = DIA_Addon_Greg_AboutCanyon_Info;
	permanent = TRUE;
	description = "������ �������...";
};


func int DIA_Addon_Greg_AboutCanyon_Condition()
{
	if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_AboutCanyon_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_AboutCanyon_15_00");	//������ �������...
	AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_01_01");	//��, ��� ���?
	Info_ClearChoices(DIA_Addon_Greg_AboutCanyon);
	if(C_AllCanyonRazorDead() == FALSE)
	{
		Info_AddChoice(DIA_Addon_Greg_AboutCanyon,Dialog_Back,DIA_Addon_Greg_AboutCanyon_Back);
		if((Npc_IsDead(Brandon) == FALSE) || (Npc_IsDead(Matt) == FALSE))
		{
			Info_AddChoice(DIA_Addon_Greg_AboutCanyon,"��� ���-������ ����� ������?",DIA_Addon_Greg_AboutCanyon_Compadres);
		};
		Info_AddChoice(DIA_Addon_Greg_AboutCanyon,"� ��� ��� �� �����, ������� � ������ �����?",DIA_Addon_Greg_AboutCanyon_Job);
	}
	else
	{
		Info_AddChoice(DIA_Addon_Greg_AboutCanyon,"� ��������� ���� �����������.",DIA_Addon_Greg_AboutCanyon_RazorsDead);
	};
};

func void DIA_Addon_Greg_AboutCanyon_Back()
{
	Info_ClearChoices(DIA_Addon_Greg_AboutCanyon);
};

func void DIA_Addon_Greg_AboutCanyon_Compadres()
{
	AI_Output(other,self,"DIA_Addon_Greg_AboutCanyon_Compadres_15_00");	//��� ���-������ ����� ������?
	AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_Compadres_01_01");	//������� � ����� ���� �����.
	AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_Compadres_01_02");	//��� ��� ����� ��������� ��� ����.
	Info_ClearChoices(DIA_Addon_Greg_AboutCanyon);
};

func void DIA_Addon_Greg_AboutCanyon_Job()
{
	AI_Output(other,self,"DIA_Addon_Greg_AboutCanyon_Job_15_00");	//� ��� ��� �� �����, ������� � ������ �����?
	AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_Job_01_01");	//�������� �� �����������! ������ �������� ��������.
	Info_ClearChoices(DIA_Addon_Greg_AboutCanyon);
};

func void DIA_Addon_Greg_AboutCanyon_RazorsDead()
{
	AI_Output(other,self,"DIA_Addon_Greg_AboutCanyon_RazorsDead_15_00");	//� ��������� ���� �����������.
	AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_RazorsDead_01_01");	//������. ������, �� ���� ���� ������.
	B_LogEntry(TOPIC_Addon_ClearCanyon,"���� ��� ���������, ����� � ������� ���, ��� ���� ���� ����������� � �������.");
	MIS_Addon_Greg_ClearCanyon = LOG_SUCCESS;
	B_Addon_PiratesGoHome();
	B_GivePlayerXP(XP_addon_ClearCanyon);
	Info_ClearChoices(DIA_Addon_Greg_AboutCanyon);
};


instance DIA_Addon_Greg_BanditArmor(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_BanditArmor_Condition;
	information = DIA_Addon_Greg_BanditArmor_Info;
	permanent = TRUE;
	description = "��� ����� ���������� �������.";
};


func int DIA_Addon_Greg_BanditArmor_Condition()
{
	if(MIS_Greg_ScoutBandits == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_BanditArmor_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_BanditArmor_15_00");	//��� ����� ���������� �������.
	if(MIS_Addon_Greg_ClearCanyon != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_01");	//������� ������, �� ��� �� ��������. ����� ����� ���������.
		if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
		{
			AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_02");	//������� �� ������ ����� ���� �����������!
		};
		B_LogEntry(TOPIC_Addon_BDTRuestung,"���� �����, ����� � ����� ��� ������� ������� � ������. ����� ����� � ����� ���������� � ��� � ��������.");
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_03");	//� �� �������!
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_04");	//������� �� ��������� ������ ��� �����. ��� ���� � ��������������� ��� �������.
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_05");	//��, ���� �����, ��� ���� ������ ������ �������� ���� �����������.
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_06");	//��������, � ���� ���� ��������� ��������� ������ �����.
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_07");	//�������� � �������, ����� �� ��� ���� �����. ����� ������� �� � ����������� � ������ ��������.
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_08");	//� ���� ������, ������ ��� ������� ���������� � ���� ������.
		AI_Output(other,self,"DIA_Addon_Greg_BanditArmor_15_09");	//����� �������, �������!
		B_LogEntry(TOPIC_Addon_BDTRuestung,"����� ���� ��� � �������, � ����� ������� ������� � ������.");
		Log_CreateTopic(TOPIC_Addon_ScoutBandits,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_ScoutBandits,LOG_Running);
		B_LogEntry(TOPIC_Addon_ScoutBandits,"� ������ ������, ��� ���� ������� ������ � ������, � �������� �����.");
		MIS_Greg_ScoutBandits = LOG_Running;
	};
};


instance DIA_Addon_Greg_Auftraege2(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_Auftraege2_Condition;
	information = DIA_Addon_Greg_Auftraege2_Info;
	description = "���� ��� ���� ��� ������?";
};


func int DIA_Addon_Greg_Auftraege2_Condition()
{
	if((MIS_Greg_ScoutBandits != 0) && ((C_TowerBanditsDead() == FALSE) || ((Npc_IsDead(BeachLurker1) == FALSE) && (Npc_IsDead(BeachLurker2) == FALSE) && (Npc_IsDead(BeachLurker3) == FALSE) && (Npc_IsDead(BeachWaran1) == FALSE) && (Npc_IsDead(BeachWaran2) == FALSE) && (Npc_IsDead(BeachShadowbeast1) == FALSE))))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_Auftraege2_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_Auftraege2_15_00");	//���� ��� ���� ��� ������?
	if((Npc_IsDead(BeachLurker1) == FALSE) && (Npc_IsDead(BeachLurker2) == FALSE) && (Npc_IsDead(BeachLurker3) == FALSE) && (Npc_IsDead(BeachWaran1) == FALSE) && (Npc_IsDead(BeachWaran2) == FALSE) && (Npc_IsDead(BeachShadowbeast1) == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Greg_Auftraege2_01_01");	//�������� ��������� ��� ��� �������� �����.
		AI_Output(self,other,"DIA_Addon_Greg_Auftraege2_01_02");	//������, ������ ������ �� ������.
		Log_CreateTopic(TOPIC_Addon_MorganBeach,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_MorganBeach,LOG_Running);
		B_LogEntry(TOPIC_Addon_MorganBeach,"���� �����, ����� � ������� ������� ��������� ����.");
		MIS_Addon_MorganLurker = LOG_Running;
	};
	if(C_TowerBanditsDead() == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Greg_Auftraege2_01_03");	//� ����� ����� ��� ��� ���� �������.
		AI_Output(self,other,"DIA_Addon_Greg_Auftraege2_01_04");	//������� ������ ��� ��� ����� � ���� �����������, �� ������ �� ������.
		Log_CreateTopic(TOPIC_Addon_BanditsTower,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_BanditsTower,LOG_Running);
		B_LogEntry(TOPIC_Addon_BanditsTower,"���� �������� ���� ����������� � ���������, ��������� ����� � ��� �� ������.");
		MIS_Henry_FreeBDTTower = LOG_Running;
	};
	AI_Output(self,other,"DIA_Addon_Greg_Auftraege2_01_05");	//�����, �� ������ ���� ��������.
};


instance DIA_Addon_Greg_Sauber2(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_Sauber2_Condition;
	information = DIA_Addon_Greg_Sauber2_Info;
	description = "�� �������� ����� ������ ���������.";
};


func int DIA_Addon_Greg_Sauber2_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Greg_Auftraege2) && Npc_IsDead(BeachLurker1) && Npc_IsDead(BeachLurker2) && Npc_IsDead(BeachLurker3) && Npc_IsDead(BeachWaran1) && Npc_IsDead(BeachWaran2) && Npc_IsDead(BeachShadowbeast1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_Sauber2_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_Sauber2_15_00");	//�� �������� ��������� ������ ���������.
	AI_Output(self,other,"DIA_Addon_Greg_Sauber2_01_01");	//�������. ����� ���� �������.
	CreateInvItems(self,ItMi_Gold,200);
	B_GiveInvItems(self,other,ItMi_Gold,200);
	B_LogEntry(TOPIC_Addon_MorganBeach,"� ������� �����, ��� ���� �� ������ ������ �� ��������.");
	MIS_Addon_MorganLurker = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Morgan_LurkerPlatt);
};


instance DIA_Addon_Greg_BanditPlatt2(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_BanditPlatt2_Condition;
	information = DIA_Addon_Greg_BanditPlatt2_Info;
	description = "������� � ����� ����������.";
};


func int DIA_Addon_Greg_BanditPlatt2_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Greg_Auftraege2) && (C_TowerBanditsDead() == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_BanditPlatt2_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_BanditPlatt2_15_00");	//������� � ����� ����������.
	AI_Output(self,other,"DIA_Addon_Greg_BanditPlatt2_01_01");	//���������. ������� ������. ��� ���� �������.
	CreateInvItems(self,ItMi_Gold,200);
	B_GiveInvItems(self,other,ItMi_Gold,200);
	B_LogEntry(TOPIC_Addon_BanditsTower,"������� �� ����� ������. ���� ����� �������.");
	MIS_Henry_FreeBDTTower = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Henry_FreeBDTTower);
};


instance DIA_Addon_Greg_BanditGoldmine(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_BanditGoldmine_Condition;
	information = DIA_Addon_Greg_BanditGoldmine_Info;
	permanent = TRUE;
	description = "������� ����� ����� � �������.";
};


func int DIA_Addon_Greg_BanditGoldmine_Condition()
{
	if((SC_KnowsRavensGoldmine == TRUE) && (MIS_Greg_ScoutBandits == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_BanditGoldmine_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_BanditGoldmine_15_00");	//������� ����� ����� � �������.
	AI_Output(self,other,"DIA_Addon_Greg_BanditGoldmine_01_01");	//� ��� � ����! ��� ������ ��� ���������� ����.
	AI_Output(self,other,"DIA_Addon_Greg_BanditGoldmine_01_02");	//����� �� ������� ���� � ���� ����.
	AI_Output(self,other,"DIA_Addon_Greg_BanditGoldmine_01_03");	//������� ������. ���, �����, � ���� ��� ���� �������.
	B_GiveInvItems(self,other,ItRi_Addon_STR_01,1);
	B_LogEntry(TOPIC_Addon_ScoutBandits,"� ��������� ����� � ������� �����.");
	MIS_Greg_ScoutBandits = LOG_SUCCESS;
	B_GivePlayerXP(XP_Greg_ScoutBandits);
};


instance DIA_Addon_Greg_WhoAreYou(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 2;
	condition = DIA_Addon_Greg_WhoAreYou_Condition;
	information = DIA_Addon_Greg_WhoAreYou_Info;
	permanent = FALSE;
	description = "��� ��?";
};


func int DIA_Addon_Greg_WhoAreYou_Condition()
{
	if((PlayerTalkedToGregNW == FALSE) && (SC_MeetsGregTime == 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_WhoAreYou_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_WhoAreYou_15_00");	//��� ��?
	AI_Output(self,other,"DIA_Addon_Greg_WhoAreYou_01_01");	//� ����, ������������ ���� ������� �����.
	AI_Output(self,other,"DIA_Addon_Greg_WhoAreYou_01_02");	//���� ���������� ����� �����?
};


instance DIA_Addon_Greg_NiceToSeeYou(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_NiceToSeeYou_Condition;
	information = DIA_Addon_Greg_NiceToSeeYou_Info;
	permanent = FALSE;
	description = "� ��� �� ���� �����?";
};


func int DIA_Addon_Greg_NiceToSeeYou_Condition()
{
	if((PlayerTalkedToGregNW == TRUE) && (MIS_Greg_ScoutBandits == 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NiceToSeeYou_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NiceToSeeYou_15_00");	//� ��� �� ���� �����?
	AI_Output(self,other,"DIA_Addon_Greg_NiceToSeeYou_01_01");	//�� ������ ������� ���� �����, ��?
	AI_Output(self,other,"DIA_Addon_Greg_NiceToSeeYou_01_02");	//����� ����� ��������� ����� ��� i. � ����, � ��� ��� ������.
	AI_Output(self,other,"DIA_Addon_Greg_NiceToSeeYou_01_03");	//���� ���������� ����� �����?
};


instance DIA_Addon_Greg_Story(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 99;
	condition = DIA_Addon_Greg_Story_Condition;
	information = DIA_Addon_Greg_Story_Info;
	permanent = TRUE;
	description = "� ����� �� ����� ��� ���-���.";
};


func int DIA_Addon_Greg_Story_Condition()
{
	if(((Npc_KnowsInfo(other,DIA_Addon_Greg_WhoAreYou) == TRUE) || (Npc_KnowsInfo(other,DIA_Addon_Greg_NiceToSeeYou) == TRUE)) && (MIS_Greg_ScoutBandits != 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_Story_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_Story_15_00");	//� ����� �� ����� ��� ���-���.
	AI_Output(self,other,"DIA_Addon_Greg_Story_01_01");	//��� ������?
	Info_ClearChoices(DIA_Addon_Greg_Story);
	Info_AddChoice(DIA_Addon_Greg_Story,Dialog_Back,DIA_Addon_Greg_Story_Back);
	Info_AddChoice(DIA_Addon_Greg_Story,"��� �� ���� �����?",DIA_Addon_Greg_Story_Way);
	Info_AddChoice(DIA_Addon_Greg_Story,"� ��� ���� �������?",DIA_Addon_Greg_Story_Ship);
	if(RavenIsDead == FALSE)
	{
		Info_AddChoice(DIA_Addon_Greg_Story,"��� �� ������ � ������?",DIA_Addon_Greg_Story_Raven);
	};
};

func void DIA_Addon_Greg_Story_Back()
{
	Info_ClearChoices(DIA_Addon_Greg_Story);
};

func void DIA_Addon_Greg_Story_Way()
{
	AI_Output(other,self,"DIA_Addon_Greg_Story_Way_15_00");	//��� �� ���� �����?
	AI_Output(self,other,"DIA_Addon_Greg_Story_Way_01_01");	//� ��������� ���� � ������� ����� ������� ��������, ������� �������� ��������� �����.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Way_01_02");	//��� ������� ��������� ������������� ���� ���� �������.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Way_01_03");	//������� � ������ ��� ����� �� ������� ����� � ����� ���������, ��� ��� ����� ����������.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Way_01_04");	//��������� ��� ���������, ����� � �������� � ���� �������� ������.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Way_01_05");	//� ��� ��������� ��� ��� � ��� ������, ����� � ��� �����, ��� ���� ������� ����� ��� �������� ���������� �� ���������.
};

func void DIA_Addon_Greg_Story_Ship()
{
	AI_Output(other,self,"DIA_Addon_Greg_Story_Ship_15_00");	//� ��� ���� �������?
	AI_Output(self,other,"DIA_Addon_Greg_Story_Ship_01_01");	//� ��������� ��������� �������. ��� ��������� ������� ���� �� ���������� �������. 
	AI_Output(self,other,"DIA_Addon_Greg_Story_Ship_01_02");	//��������� �������! � ������ �������, ������� ��� ����� ����� �����������, ����������� ������ ��������, ������������� ������.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Ship_01_03");	//�� ��� ������ ����� ����������.
	AI_Output(other,self,"DIA_Addon_Greg_Story_Ship_15_04");	//�� ��, �� ������� ����.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Ship_01_05");	//��� ������. ��� ��� �� �������� ���. � ������������, ��� �������� �� ������. 
};

func void DIA_Addon_Greg_Story_Raven()
{
	AI_Output(other,self,"DIA_Addon_Greg_Story_Raven_15_00");	//��� �� ������ � ������?
	AI_Output(self,other,"DIA_Addon_Greg_Story_Raven_01_01");	//�� �������� �����. �������� ������� ����� � �������.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Raven_01_02");	//� �� ���� �� ��������� �������������, ��� �� ����� ���� ������ � ������ ���� ��� ��� ������� �� ���.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Raven_01_03");	//�� �� ���� ���-�� ���������. ��-�� �� ����� �� ����� ������������ � �������� �����.
};


instance DIA_Addon_Greg_RavenDead(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 2;
	condition = DIA_Addon_Greg_RavenDead_Condition;
	information = DIA_Addon_Greg_RavenDead_Info;
	description = "� ������� ���������...";
};


func int DIA_Addon_Greg_RavenDead_Condition()
{
	if(RavenIsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_RavenDead_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_RavenDead_15_00");	//� ������� ���������...
	AI_Output(self,other,"DIA_Addon_Greg_RavenDead_01_01");	//���� ����... �� ������ � �����... ������ ��� ��������, ��?
	AI_Output(self,other,"DIA_Addon_Greg_RavenDead_01_02");	//��, �� ��� ������, ��� ����� ������� ������� �����.
	CreateInvItems(self,ItMi_Gold,500);
	B_GiveInvItems(self,other,ItMi_Gold,500);
	AI_Output(self,other,"DIA_Addon_Greg_RavenDead_01_03");	//� �� ������. ��������� � ��� �� ����.
	B_GivePlayerXP(XP_ADDON_GregRavenLohn);
};

