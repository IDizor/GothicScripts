
instance DIA_Gorax_Kap1_EXIT(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 999;
	condition = DIA_Gorax_Kap1_EXIT_Condition;
	information = DIA_Gorax_KAp1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Gorax_Kap1_EXIT_Condition()
{
	if(Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_Gorax_KAp1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Gorax_PICKPOCKET(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 888;
	condition = DIA_Gorax_PICKPOCKET_Condition;
	information = DIA_Gorax_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(���� ���� ����� ������� ����� ������)";
};


func int DIA_Gorax_PICKPOCKET_Condition()
{
	if((self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == TRUE) && (other.attribute[ATR_DEXTERITY] >= (80 - Theftdiff)))
	{
		return 1;
	};
};

func void DIA_Gorax_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Gorax_PICKPOCKET);
	Info_AddChoice(DIA_Gorax_PICKPOCKET,Dialog_Back,DIA_Gorax_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Gorax_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Gorax_PICKPOCKET_DoIt);
};

func void DIA_Gorax_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 80)
	{
		CreateInvItems(self,ItKe_KlosterSchatz,1);
		B_GiveInvItems(self,other,ItKe_KlosterSchatz,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Gorax_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Gorax_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Gorax_PICKPOCKET);
};


instance DIA_Gorax_HELP(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 2;
	condition = DIA_Gorax_HELP_Condition;
	information = DIA_Gorax_HELP_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Gorax_HELP_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Gorax_HELP_Info()
{
	AI_Output(self,other,"DIA_Gorax_HELP_14_00");	//���� � ���-������ ������ ����?
};


instance DIA_Gorax_GOLD(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 2;
	condition = DIA_Gorax_GOLD_Condition;
	information = DIA_Gorax_GOLD_Info;
	permanent = TRUE;
	description = "� ������ ����� ���� ������.";
};


var int DIA_Gorax_GOLD_perm;

func int DIA_Gorax_GOLD_Condition()
{
	if((other.guild == GIL_NOV) && (DIA_Gorax_GOLD_perm == FALSE) && (Pedro_NOV_Aufnahme_LostInnosStatue_Daron == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gorax_GOLD_Info()
{
	AI_Output(other,self,"DIA_Gorax_GOLD_15_00");	//� ������ ����� ���� ������.
	if(Npc_HasItems(other,ItMi_Gold) >= Summe_Kloster)
	{
		AI_Output(self,other,"DIA_Gorax_GOLD_14_01");	//(� ������������) ��! ���������� ������. ��� ����� ������, ��� ���.
		AI_Output(self,other,"DIA_Gorax_GOLD_14_02");	//� ��������� ���� ������������� �� ����� ���������, ��� ���� ������ �����.
		DIA_Gorax_GOLD_perm = TRUE;
		B_GiveInvItems(other,self,ItMi_Gold,Summe_Kloster);
	}
	else
	{
		AI_Output(self,other,"DIA_Gorax_Orlan_14_02");	//��� �� ������ � ���� �������? �� �������� ���? ����� � �� ����������� ���� ��� ������!
	};
};


instance DIA_Addon_Gorax_DaronsStatue(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 2;
	condition = DIA_Addon_Gorax_DaronsStatue_Condition;
	information = DIA_Addon_Gorax_DaronsStatue_Info;
	permanent = TRUE;
	description = "��� ���������, ������� ������ ��� �������� � ��������� �����.";
};


func int DIA_Addon_Gorax_DaronsStatue_Condition()
{
	if((other.guild == GIL_NOV) && (DIA_Gorax_GOLD_perm == FALSE) && (Pedro_NOV_Aufnahme_LostInnosStatue_Daron == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Gorax_DaronsStatue_Info()
{
	AI_Output(other,self,"DIA_Addon_Gorax_DaronsStatue_15_00");	//��� ���������, ������� ������ ��� �������� � ��������� �����.
	if(Npc_HasItems(other,ItMi_LostInnosStatue_Daron))
	{
		AI_Output(self,other,"DIA_Addon_Gorax_DaronsStatue_14_01");	//(��������) �������� ����������� ��, ��� ����� ������������� ������ � ��������� ��������� ���������.
		AI_Output(self,other,"DIA_Addon_Gorax_DaronsStatue_14_02");	//��� ��� ��� ���������� ���� �������������� � �������� ������.
		if(B_GiveInvItems(other,self,ItMi_LostInnosStatue_Daron,1))
		{
			Npc_RemoveInvItems(self,ItMi_LostInnosStatue_Daron,1);
		};
		AI_Output(self,other,"DIA_Addon_Gorax_DaronsStatue_14_03");	//� ����� ����� � �����, ���� ���������.
		MIS_Addon_Daron_GetStatue = LOG_SUCCESS;
		B_GivePlayerXP(XP_Addon_ReturnedLostInnosStatue_Daron);
		DIA_Gorax_GOLD_perm = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Gorax_DaronsStatue_14_04");	//���������? � �� ���� ������� ���������. ������� �� ���, � ����� � ������ ������ ��������.
	};
};


instance DIA_Gorax_SLEEP(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 4;
	condition = DIA_Gorax_SLEEP_Condition;
	information = DIA_Gorax_SLEEP_Info;
	description = "� ��� �����, ��� ����� ���� �� �������.";
};


func int DIA_Gorax_SLEEP_Condition()
{
	if((DIA_Gorax_GOLD_perm == TRUE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Gorax_SLEEP_Info()
{
	AI_Output(other,self,"DIA_Gorax_SLEEP_15_00");	//� ��� �����, ��� ����� ���� �� �������.
	AI_Output(self,other,"DIA_Gorax_SLEEP_14_01");	//���� ���� ��������� ������� � ��������� �������. ������ ����� �������, ����� � ������. �� ������ ������� ���.
	AI_Output(self,other,"DIA_Gorax_SLEEP_14_02");	//�� ������ ������� ���� ���� � ���� �� ������ ��������.
	AI_Output(self,other,"DIA_Gorax_SLEEP_14_03");	//� ����� - ���� ������ ������� � ����������� �����. �����, ��� ���������������� ���������� ���� ������ ������� � ����������.
};


instance DIA_Gorax_Aufgabe(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 3;
	condition = DIA_Gorax_Aufgabe_Condition;
	information = DIA_Gorax_Aufgabe_Info;
	permanent = FALSE;
	description = "� ���� ���� �����-������ ������� ��� ����?";
};


func int DIA_Gorax_Aufgabe_Condition()
{
	if(MIS_KlosterArbeit == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Gorax_Aufgabe_Info()
{
	AI_Output(other,self,"DIA_Gorax_Aufgabe_15_00");	//� ���� ���� �����-������ ������� ��� ����?
	AI_Output(self,other,"DIA_Gorax_Aufgabe_14_01");	//��, ���������� ������ ����������. � ���, ��� ������ ��������, ������ ������ ��������.
	AI_Output(self,other,"DIA_Gorax_Aufgabe_14_02");	//� ��� ���� ���� �� ��������. �� ������� ��� ������� �������. ������ �� ����������� - �� ������� �� �� ��������������!
	AI_Output(self,other,"DIA_Gorax_Aufgabe_14_03");	//� ����� ��������� � ����, ������ ���������� �� ��� �����.
	CreateInvItems(self,ItKe_KlosterStore,1);
	B_GiveInvItems(self,other,ItKe_KlosterStore,1);
	MIS_GoraxEssen = LOG_Running;
	Log_CreateTopic(Topic_GoraxEssen,LOG_MISSION);
	Log_SetTopicStatus(Topic_GoraxEssen,LOG_Running);
	B_LogEntry(Topic_GoraxEssen,"������ ������ �����, ����� � �������� ������� ������� �� �������� ������� ����� �����������. ����� ����, � ��������� ���� ��� ���������� �����������.");
};


instance DIA_Gorax_Wurst(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 2;
	condition = DIA_Gorax_Wurst_Condition;
	information = DIA_Gorax_Wurst_Info;
	permanent = TRUE;
	description = "� ������ ������� (���������� �������).";
};


func int DIA_Gorax_Wurst_Condition()
{
	if((MIS_GoraxEssen == LOG_Running) && (Mob_HasItems("WURSTTRUHE",ItFo_Schafswurst) == 0))
	{
		return TRUE;
	};
};

func void DIA_Gorax_Wurst_Info()
{
	AI_Output(other,self,"DIA_Gorax_Wurst_15_00");	//� ������ �������.
	if(Wurst_Gegeben >= 13)
	{
		AI_Output(self,other,"DIA_Gorax_Wurst_14_01");	//� �������� �� �� ��������������. ���, ������ ��� ������ ��������� - � ����������� � ����� ������.
		MIS_GoraxEssen = LOG_SUCCESS;
		B_GivePlayerXP(XP_GoraxEssen);
		B_GiveInvItems(self,other,ItSc_LightHeal,2);
	}
	else
	{
		AI_Output(self,other,"DIA_Gorax_Wurst_14_02");	//��? � �����, �� ������������ ������������ ���������� � ����� ������.
		AI_Output(self,other,"DIA_Gorax_Wurst_14_03");	//�� ���� ���� ������� ���, ���� ��� ����-������ ������, ��� ��� �����������.
		AI_Output(self,other,"DIA_Gorax_Wurst_14_04");	//��������, ��� ��� �� ������� - � ������ �� ���� ������� - � �� ������ ��� ����� ����. �� ����� ������ ������ �� �����������, ���������!
		MIS_GoraxEssen = LOG_FAILED;
	};
};


instance DIA_Gorax_Aufgabe2(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 3;
	condition = DIA_Gorax_Aufgabe2_Condition;
	information = DIA_Gorax_Aufgabe2_Info;
	permanent = FALSE;
	description = "� ���� ���� ��� �����-������ ��������� ��� ����?";
};


func int DIA_Gorax_Aufgabe2_Condition()
{
	if(((MIS_GoraxEssen == LOG_SUCCESS) || (MIS_GoraxEssen == LOG_FAILED)) && (Npc_IsDead(Orlan) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gorax_Aufgabe2_Info()
{
	AI_Output(other,self,"DIA_Gorax_Aufgabe2_15_00");	//� ���� ���� ��� �����-������ ��������� ��� ����?
	AI_Output(self,other,"DIA_Gorax_Aufgabe2_14_01");	//��. ��� �� ������, �� ������ ����� ������������ ����, � ����� ��� �������.
	AI_Output(self,other,"DIA_Gorax_Aufgabe2_14_02");	//�����, ������ �������� '������� ������' ������� �������� ������. �� ������������ �� ����� � 240 ������� �����.'
	AI_Output(self,other,"DIA_Gorax_Aufgabe2_14_03");	//������ ��� ��� ������� - �� ������, ����� �� �� �������� ����.
	B_GiveInvItems(self,other,ItFo_Wine,12);
	MIS_GoraxWein = LOG_Running;
	Log_CreateTopic(Topic_GoraxWein,LOG_MISSION);
	Log_SetTopicStatus(Topic_GoraxWein,LOG_Running);
	B_LogEntry(Topic_GoraxWein,"������ ������ �����, ����� � �������� ������, ������� ��������, ���������� ������� ����. ��� ����� 240 ������� �����.");
};


instance DIA_Gorax_Orlan(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 3;
	condition = DIA_Gorax_Orlan_Condition;
	information = DIA_Gorax_Orlan_Info;
	permanent = TRUE;
	description = "� ����� ���� ������.";
};


var int DIA_Gorax_Orlan_permanent;

func int DIA_Gorax_Orlan_Condition()
{
	if((MIS_GoraxWein == LOG_Running) && Npc_KnowsInfo(other,DIA_Orlan_Wein) && (DIA_Gorax_Orlan_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gorax_Orlan_Info()
{
	if(Npc_HasItems(other,ItMi_Gold) >= 100)
	{
		AI_Output(other,self,"DIA_Gorax_Orlan_15_00");	//� ����� ���� ������.
		AI_Output(self,other,"DIA_Gorax_Orlan_14_01");	//�? �� ������� 240 ������� �����?
		DIA_Gorax_Orlan_permanent = TRUE;
		Info_ClearChoices(DIA_Gorax_Orlan);
		Info_AddChoice(DIA_Gorax_Orlan,"�� ����� ����! (������ 100 �����)",DIA_Gorax_Orlan_100);
		Info_AddChoice(DIA_Gorax_Orlan,"� ������ ������. (������ 240 �����)",DIA_Gorax_Orlan_240);
	}
	else
	{
		AI_Output(self,other,"DIA_Gorax_Orlan_14_02");	//��� �� ������ � ���� �������? �� �������� ���? ����� � �� ����������� ���� ��� ������!
	};
};

func void DIA_Gorax_Orlan_100()
{
	AI_Output(other,self,"DIA_Gorax_Orlan_100_15_00");	//�� ����� ����!
	AI_Output(self,other,"DIA_Gorax_Orlan_100_14_01");	//�� ������ ��� ���� �������? ��, ���! � ������ ������ � ������ ����?!
	AI_Output(self,other,"DIA_Gorax_Orlan_100_14_02");	//�� ���������� �� �� ��� �� ��������! �������� � ���� ����!
	B_GiveInvItems(other,self,ItMi_Gold,100);
	MIS_GoraxWein = LOG_FAILED;
	Info_ClearChoices(DIA_Gorax_Orlan);
	AI_StopProcessInfos(self);
};

func void DIA_Gorax_Orlan_240()
{
	AI_Output(other,self,"DIA_Gorax_Orlan_240_15_00");	//� ������ ������.
	if(B_GiveInvItems(other,self,ItMi_Gold,240))
	{
		AI_Output(self,other,"DIA_Gorax_Orlan_240_14_01");	//�����������. �� ���������� ��������� �����������. ���, ������ � �������� �������������� ������ ���������. � ������ ��� � ������� �����-������ �����.
		MIS_GoraxWein = LOG_SUCCESS;
		B_GivePlayerXP(XP_GoraxWein);
	}
	else
	{
		AI_Output(self,other,"DIA_Gorax_Orlan_240_14_02");	//�� �� ��� �������� ����� ���� �����, ��? �� ����������� - ����� �����!
		MIS_GoraxWein = LOG_FAILED;
		B_GiveInvItems(other,self,ItMi_Gold,Npc_HasItems(other,ItMi_Gold));
	};
	Info_ClearChoices(DIA_Gorax_Orlan);
};


instance DIA_Gorax_JOB(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 35;
	condition = DIA_Gorax_JOB_Condition;
	information = DIA_Gorax_JOB_Info;
	permanent = FALSE;
	description = "��� �� ����������� �����?";
};


func int DIA_Gorax_JOB_Condition()
{
	return TRUE;
};

func void DIA_Gorax_JOB_Info()
{
	AI_Output(other,self,"DIA_Gorax_JOB_15_00");	//��� ������ � ���� ����������� �����?
	AI_Output(self,other,"DIA_Gorax_JOB_14_01");	//��� ����������� ������������� � ������������. � �� ������ �����������, �� ����� � ��������.
	AI_Output(self,other,"DIA_Gorax_JOB_14_02");	//����� ����, � ������� ������ ��������, � ����� �� ���� ������ ����� ����������� ��������� ��������� ���������.
	AI_Output(self,other,"DIA_Gorax_JOB_14_03");	//�������, ���� ���� ���-������ �����, �� ������ ������ ���������� �� ��� � �������� ��� ����������� - �� �������� �������������, �������.
	Log_CreateTopic(Topic_KlosterTrader,LOG_NOTE);
	B_LogEntry(Topic_KlosterTrader,"������ ������ � ��������� ����� ������������ ��� ���, ��� ��� �����.");
};


instance DIA_Gorax_TRADE(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 99;
	condition = DIA_Gorax_TRADE_Condition;
	information = DIA_Gorax_TRADE_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "��� ����� ���-���...";
};


func int DIA_Gorax_TRADE_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Gorax_JOB))
	{
		return TRUE;
	};
};

func void DIA_Gorax_TRADE_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other,self,"DIA_Gorax_TRADE_15_00");	//��� ����� ���-���...
};


instance DIA_Gorax_KDF(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 5;
	condition = DIA_Gorax_KDF_Condition;
	information = DIA_Gorax_KDF_Info;
	permanent = FALSE;
	description = "��� ����� ����� ��� ���.";
};


func int DIA_Gorax_KDF_Condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_Gorax_KDF_Info()
{
	AI_Output(other,self,"DIA_Gorax_KDF_15_00");	//��� ����� ����� ��� ���.
	AI_Output(self,other,"DIA_Gorax_KDF_14_01");	//� ��� ���� ��������� ������� ������ ������. ���, ������ ����. ��� �� ������� ���, ��� ���� ����� ������������.
	B_GiveInvItems(self,other,ItKe_KDFPlayer,1);
	Wld_InsertItem(ItPo_Perm_Mana,"FP_ITEM_KDFPLAYER");
};


instance DIA_Gorax_Kap2_EXIT(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 999;
	condition = DIA_Gorax_Kap2_EXIT_Condition;
	information = DIA_Gorax_Kap2_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Gorax_Kap2_EXIT_Condition()
{
	if(Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Gorax_Kap2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Gorax_Kap3_EXIT(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 999;
	condition = DIA_Gorax_Kap3_EXIT_Condition;
	information = DIA_Gorax_Kap3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Gorax_Kap3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Gorax_Kap3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Gorax_KILLPEDRO(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 3;
	condition = DIA_Gorax_KILLPEDRO_Condition;
	information = DIA_Gorax_KILLPEDRO_Info;
	important = TRUE;
};


func int DIA_Gorax_KILLPEDRO_Condition()
{
	if((Pedro_Traitor == TRUE) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Gorax_KILLPEDRO_Info()
{
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_14_00");	//�������, �������. ��� ����� ���������� � �����.
	AI_Output(other,self,"DIA_Gorax_KILLPEDRO_15_01");	//���� �� ������?
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_14_02");	//��������� ���������� ������ ����� ���������� ��������.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_14_03");	//� ��������� ������, ������, ��� �� �������� ���� �����. � � ���� ��, ���� ������ � �����, ��� �����... (����������)
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_14_04");	//� ���� ���� ��������� ��� ���� �� ����������������. �� �� ��������� ������ �������� ����, �, �������������, �� ������������, ��� ����� ������ ��� � ������� ���� ��������.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_14_05");	//�� � ������ ������������ ����. ���� � ��� ���� ��� ���������, �� ������ ������ ��������� ���. ����� �� �������, � ��� ��� �����������, � ���� ��� �� ����� ������. �� ��������� ���?
	Info_ClearChoices(DIA_Gorax_KILLPEDRO);
	Info_AddChoice(DIA_Gorax_KILLPEDRO,"������ �� ����. ��� ������� ����������� ����������� ��� ����.",DIA_Gorax_KILLPEDRO_nein);
	Info_AddChoice(DIA_Gorax_KILLPEDRO,"����� ���, ���� �� ������.",DIA_Gorax_KILLPEDRO_ja);
};

func void DIA_Gorax_KILLPEDRO_nein()
{
	AI_Output(other,self,"DIA_Gorax_KILLPEDRO_nein_15_00");	//������ �� ����. ��� ������� ����������� ����������� ��� ����.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_nein_14_01");	//������, � ����� ������, ������ � ���, ��� � �������.
	AI_StopProcessInfos(self);
};

func void DIA_Gorax_KILLPEDRO_ja()
{
	AI_Output(other,self,"DIA_Gorax_KILLPEDRO_ja_15_00");	//����� ���, ���� �� ������.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_ja_14_01");	//������. ����� ������ �����������, ������ ��������� � �� ����.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_ja_14_02");	//��������� �����, ����� �� ���� ����� �� ��� �������������.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_ja_14_03");	//����� �� ��������� ��� ������, ���� ���������� ����� ������ ��������������.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_ja_14_04");	//� ������ ���� �� �������. � �� ������ �� ������. �������?
	B_LogEntry(TOPIC_TraitorPedro,"������ ������ ���, ��� ��������� �����, ����� � ���� ��������� �����, ���� � ������������ � ���.");
	B_GivePlayerXP(XP_Gorax_KILLPEDRO_GotMission);
	MIS_Gorax_KillPedro = LOG_Running;
	AI_StopProcessInfos(self);
};


instance DIA_Gorax_Kap4_EXIT(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 999;
	condition = DIA_Gorax_Kap4_EXIT_Condition;
	information = DIA_Gorax_Kap4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Gorax_Kap4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Gorax_Kap4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Gorax_Kap5_EXIT(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 999;
	condition = DIA_Gorax_Kap5_EXIT_Condition;
	information = DIA_Gorax_Kap5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Gorax_Kap5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Gorax_Kap5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

