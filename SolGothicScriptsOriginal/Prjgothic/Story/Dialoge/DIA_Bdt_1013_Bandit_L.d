
instance DIA_BDT_1013_BANDIT_FIRSTEXIT(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 999;
	condition = DIA_BDT_1013_BANDIT_FIRSTEXIT_Condition;
	information = DIA_BDT_1013_BANDIT_FIRSTEXIT_Info;
	permanent = FALSE;
	description = Dialog_Ende;
};


func int DIA_BDT_1013_BANDIT_FIRSTEXIT_Condition()
{
	return TRUE;
};

func void DIA_BDT_1013_BANDIT_FIRSTEXIT_Info()
{
	if((Bdt13_Friend == TRUE) && !Npc_IsDead(Ambusher_1014) && !Npc_IsDead(Ambusher_1015))
	{
		AI_Output(self,other,"DIA_BDT_1013_BANDIT_FIRSTEXIT_01_00");	//�� ����� ����� � �� �� ����� � ��� ������ - ��� ��������, ��� ����� ���, ������ � ���� ����� ������.
	};
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1013_BANDIT_EXIT(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 999;
	condition = DIA_BDT_1013_BANDIT_EXIT_Condition;
	information = DIA_BDT_1013_BANDIT_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_BDT_1013_BANDIT_EXIT_Condition()
{
	if(Npc_KnowsInfo(other,dia_bdt_1013_bandit_firstexit))
	{
		return TRUE;
	};
};

func void DIA_BDT_1013_BANDIT_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1013_BANDIT_WHERE(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 3;
	condition = DIA_BDT_1013_BANDIT_WHERE_Condition;
	information = DIA_BDT_1013_BANDIT_WHERE_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_BDT_1013_BANDIT_WHERE_Condition()
{
	return TRUE;
};

func void DIA_BDT_1013_BANDIT_WHERE_Info()
{
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_01_00");	//�� - ������ �� ����� ������, �?
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"� ��������� � ���.",dia_bdt_1013_bandit_where_mountain);
	Info_AddChoice(dia_bdt_1013_bandit_where,"� ������ �� ��������...",dia_bdt_1013_bandit_where_xardas);
};

func void dia_bdt_1013_bandit_where_mountain()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_15_00");	//� ��������� � ���.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_01");	//�����. �� ��������� � ���. � ��� ����� ��� ����.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_02");	//����� �����.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_03");	//���� ���� - ����� ���� ������ ������.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_04");	//���� �������, � ������� ���� ������ ���������� ������������. ��� �� ����!
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"����� ����, �����...",dia_bdt_1013_bandit_where_later);
	Info_AddChoice(dia_bdt_1013_bandit_where,"��� ���� ����?",dia_bdt_1013_bandit_where_who);
	Info_AddChoice(dia_bdt_1013_bandit_where,"������! �� ����� ������!",dia_bdt_1013_bandit_where_yes);
};

func void dia_bdt_1013_bandit_where_xardas()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_XARDAS_15_00");	//� ������ �� ��������...
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_XARDAS_01_01");	//��� ��� ������ ���? �� �������� ���� ���������... ����� ��� ����� ���������...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
};

func void dia_bdt_1013_bandit_where_yes()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_YES_15_00");	//������! �� ����� ������!
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_YES_01_01");	//������ ������ �� ����, ������ ��������� ��� ���.
	Npc_ExchangeRoutine(self,"AMBUSH");
	AI_StopProcessInfos(self);
};

func void dia_bdt_1013_bandit_where_who()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_WHO_15_00");	//��� ���� ����?
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_WHO_01_01");	//�� ����� �������� �������� ��������, � �� ������ ������� ���, ��� ������ �� ������ �� ����?
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_WHO_01_02");	//��! �������! �� �� ������ �������� ��� �� ����, ��? ������ - ��� ���� ����.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_WHO_01_03");	//��� �� ����� ��� ���?
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"����� ����, �����...",dia_bdt_1013_bandit_where_later);
	Info_AddChoice(dia_bdt_1013_bandit_where,"� ��� � ������ ����������?",dia_bdt_1013_bandit_where_talkpartner);
	Info_AddChoice(dia_bdt_1013_bandit_where,"������! �� ����� ������!",dia_bdt_1013_bandit_where_yes);
};

func void dia_bdt_1013_bandit_where_talkpartner()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_TALKPARTNER_15_00");	//� ��� � ������ ����������?
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_TALKPARTNER_01_01");	//� ����� ��������. ��� ����� �����. �� ����� ��� ���� ��������, ��� �.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_TALKPARTNER_01_02");	//�� ��� �� - �� ����?
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"����� ����, �����...",dia_bdt_1013_bandit_where_later);
	Info_AddChoice(dia_bdt_1013_bandit_where,"������ ��� �����, ��� ��� �� �������?",dia_bdt_1013_bandit_where_notrap);
	Info_AddChoice(dia_bdt_1013_bandit_where,"������! �� ����� ������!",dia_bdt_1013_bandit_where_yes);
};

func void dia_bdt_1013_bandit_where_notrap()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_NOTRAP_15_00");	//������ ��� �����, ��� ��� �� �������?
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_NOTRAP_01_01");	//������, � ��� ����� �� ����. ���� ���� �� ����� ��� ������, ������ ������ ���� � �����, ����� ��� ���� ������� �� �������!
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_NOTRAP_01_02");	//���� �� ������ ����� �� ����, ���� ������ � ���, ��� � ���� �������!
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"����� ����, �����...",dia_bdt_1013_bandit_where_later);
	Info_AddChoice(dia_bdt_1013_bandit_where,"���-��� ��� ������� �������� ���� ...",dia_bdt_1013_bandit_where_damals);
	Info_AddChoice(dia_bdt_1013_bandit_where,"������! �� ����� ������!",dia_bdt_1013_bandit_where_yes);
};

func void dia_bdt_1013_bandit_where_damals()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_DAMALS_15_00");	//�������, ��������! ���-��� ��� ������� �������� ����...
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_DAMALS_01_01");	//��?
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_DAMALS_15_02");	//���� ������ ���������, ����� �� ������ ����� ������ � �������� �����.
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_DAMALS_15_03");	//� ����� �� �������� ����� ����, �� � �� ������ �������� ����� �� ����.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_DAMALS_01_04");	//������, �� ������ �������� � ������� ������ - � ��� ��� ����?
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"��� �� ��� �� �����.",dia_bdt_1013_bandit_where_notimportant);
	Info_AddChoice(dia_bdt_1013_bandit_where,"� ��� ����������� � ��������������� �������.",dia_bdt_1013_bandit_where_prisoner);
};

func void dia_bdt_1013_bandit_where_prisoner()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_15_00");	//� ��� ����������� � ��������������� �������.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_01");	//(�����������) �� ������ ��-�� �������? ������, ����� �� ���� ��� ������.
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_15_02");	//� �� ���� ����...
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_03");	//� ��� �������� � ������ ������. � ������ ����� ������� �� �������.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_04");	//(������������) �� ������ ������ ��, ��� � ���� ������� ��������!
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_05");	//���-�� �������� ����������� ����� �� ���� ������. � ������ ��������� �������� � ����� �����������!
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_06");	//�� ����� ����� � ��� �� �����, ����� ����������. ����� ��� ���� ����, ������� �� ������ ������ ����� ���� ����������� ����.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_07");	//�� � �����, ��� ��, ������ ����������� �� �������, ������ ��������� ������!
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_15_08");	//����� � ������ ������� ���� ������� �������...
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_09");	//�������. ������ ���������� �������� � �����.
	Bdt13_Friend = TRUE;
	B_SetAttitude(self,ATT_FRIENDLY);
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_EnemyOverride] = FALSE;
	Info_ClearChoices(dia_bdt_1013_bandit_where);
};

func void dia_bdt_1013_bandit_where_notimportant()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_NOTIMPORTANT_15_00");	//��� �� ��� �� �����.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_NOTIMPORTANT_01_01");	//��� ������. ��� ���, �� ����� ��� ���?
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"����� ����, �����...",dia_bdt_1013_bandit_where_later);
	Info_AddChoice(dia_bdt_1013_bandit_where,"������! �� ����� ������!",dia_bdt_1013_bandit_where_yes);
};

func void dia_bdt_1013_bandit_where_later()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_LATER_15_00");	//����� ����, �����...
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_LATER_01_01");	//����� �� �����, ��������!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
};


instance DIA_1013_BANDIT_AMBUSH(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 1;
	condition = DIA_1013_BANDIT_AMBUSH_Condition;
	information = DIA_1013_BANDIT_AMBUSH_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_1013_BANDIT_AMBUSH_Condition()
{
	if((Npc_GetDistToWP(self,"NW_XARDAS_BANDITS_RIGHT") <= 300) && (Bdt13_Friend == FALSE))
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_AMBUSH_Info()
{
	if(Npc_IsDead(Ambusher_1014) && Npc_IsDead(Ambusher_1015))
	{
		AI_Output(self,other,"DIA_1013_BANDIT_AMBUSH_01_00");	//���� �� ������ ���� �� ����...
		B_Attack(self,other,AR_SuddenEnemyInferno,1);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_1013_BANDIT_AMBUSH_01_01");	//��, �����, ����������, ��� � ��� �����...
		AI_StopProcessInfos(self);
	};
};


instance DIA_1013_BANDIT_NAME(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 1;
	condition = DIA_1013_BANDIT_NAME_Condition;
	information = DIA_1013_BANDIT_NAME_Info;
	permanent = FALSE;
	description = "��� �������� ���� �� ��� ������?";
};


func int DIA_1013_BANDIT_NAME_Condition()
{
	if(Bdt13_Friend == TRUE)
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_NAME_Info()
{
	AI_Output(other,self,"DIA_1013_BANDIT_NAME_15_00");	//��� �������� ���� �� ��� ������?
	AI_Output(self,other,"DIA_1013_BANDIT_NAME_01_01");	//� ����� �� ����, ������ ���� �� ��� ����� ���.
	AI_Output(other,self,"DIA_1013_BANDIT_NAME_15_02");	//� ��� ���?
	AI_Output(self,other,"DIA_1013_BANDIT_NAME_01_03");	//��, �������� - � ������������� �� ���� ������� ���� ���. ��� �����, ��� ��� ������...
	Log_CreateTopic(Topic_Bandits,LOG_MISSION);
	Log_SetTopicStatus(Topic_Bandits,LOG_Running);
	B_LogEntry(Topic_Bandits,"�� ���� �������� �������. � ��� ���� ������ � ���� ������������. ���������, ��� ��� ��� ������.");
	MIS_Steckbriefe = LOG_Running;
};


instance DIA_1013_BANDIT_DEXTER(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 1;
	condition = DIA_1013_BANDIT_DEXTER_Condition;
	information = DIA_1013_BANDIT_DEXTER_Info;
	permanent = TRUE;
	description = "10 ������� ����� �� ��� ����, ��� �������� ���� �� ��� ������.";
};


func int DIA_1013_BANDIT_DEXTER_Condition()
{
	if((Bdt13_Friend == TRUE) && (Bdt13_Dexter_verraten == FALSE) && Npc_KnowsInfo(other,dia_1013_bandit_name))
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_DEXTER_Info()
{
	AI_Output(other,self,"DIA_1013_BANDIT_DEXTER_15_00");	//10 ������� ����� �� ��� ����, ��� �������� ���� �� ��� ������.
	AI_Output(self,other,"DIA_1013_BANDIT_DEXTER_01_01");	//��, � ������������� �� ���� �������...
	AI_Output(other,self,"DIA_1013_BANDIT_DEXTER_15_02");	//����������, �����!
	AI_Output(self,other,"DIA_1013_BANDIT_DEXTER_01_03");	//(������ �������� ����) ��, ������! ������. ��� ����� �������. ����� ������� ����� ���� ������ �����.
	AI_Output(self,other,"DIA_1013_BANDIT_DEXTER_01_04");	//�� ��� ���������� ����� � ��������� ����. �� ������� ���� ������ ���-�� ���.
	B_LogEntry(Topic_Bandits,"������� �������� ����� �������. �� ���������� � ����� ����� �������� ���������.");
	if(B_GiveInvItems(other,self,ItMi_Gold,10))
	{
		AI_Output(other,self,"DIA_1013_BANDIT_DEXTER_15_05");	//������, ��� ���� �� ��� �� � ������. ��� ���� ������.
	}
	else
	{
		AI_Output(other,self,"DIA_1013_BANDIT_DEXTER_15_06");	//��� - � ������ ��� �����, ��� � ���� �� �������� ���� ������ �����.
		AI_Output(self,other,"DIA_1013_BANDIT_DEXTER_01_07");	//���?! �... �� - ������ �� ���� - � ��� �������. �� ����� ���� �������� ���� ���, ���� � �� ������ ������...
	};
	AI_Output(self,other,"DIA_1013_BANDIT_DEXTER_01_08");	//������ ������ �� ������, ��� ��� � ������ ���� ���.
	Bdt13_Dexter_verraten = TRUE;
};


instance DIA_1013_BANDIT_PIC(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 2;
	condition = DIA_1013_BANDIT_PIC_Condition;
	information = DIA_1013_BANDIT_PIC_Info;
	permanent = FALSE;
	description = "���� � ����� ��� ��������?";
};


func int DIA_1013_BANDIT_PIC_Condition()
{
	if(Bdt13_Friend == TRUE)
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_PIC_Info()
{
	AI_Output(other,self,"DIA_1013_BANDIT_PIC_15_00");	//���� � ����� ��� ��������?
	AI_Output(self,other,"DIA_1013_BANDIT_PIC_01_01");	//������� (����������) - ���� �� ��� ���� ����.
	B_GiveInvItems(self,other,ItWr_Poster_MIS,1);
};


instance DIA_1013_BANDIT_FromMaleth(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 3;
	condition = DIA_1013_BANDIT_FromMaleth_Condition;
	information = DIA_1013_BANDIT_FromMaleth_Info;
	permanent = FALSE;
	description = "���� ������ ���� �� �������� � ������...";
};


func int DIA_1013_BANDIT_FromMaleth_Condition()
{
	if((Bdt13_Friend == TRUE) && ((MIS_Maleth_Bandits == LOG_Running) || (MIS_Maleth_Bandits == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_FromMaleth_Info()
{
	var C_Npc b14;
	var C_Npc b15;
	AI_Output(other,self,"DIA_1013_BANDIT_FromMaleth_15_00");	//���� ������ ���� �� �������� � ������...
	AI_Output(self,other,"DIA_1013_BANDIT_FromMaleth_01_01");	//���? ������� ����� �� ���� �������?
	AI_Output(other,self,"DIA_1013_BANDIT_FromMaleth_15_02");	//��� �������� ������� ����.
	b14 = Hlp_GetNpc(Bdt_1014_Bandit_L);
	b15 = Hlp_GetNpc(Bdt_1015_Bandit_L);
	if(Npc_IsDead(b14) && Npc_IsDead(b15))
	{
		AI_Output(self,other,"DIA_1013_BANDIT_FromMaleth_01_03");	//����! ��, ����� ��� ����� �������� ������ �����. ���� ��� ������ ��� ������ ������, ����� ����, ��� ��������� ������ ����.
	}
	else
	{
		AI_Output(other,self,"DIA_1013_BANDIT_FromMaleth_15_04");	//�� �����, ����� �� ��� ���� ������...
		AI_Output(self,other,"DIA_1013_BANDIT_FromMaleth_01_05");	//������� - �� ���� �� �������� ����� �� ����, ������, ���� � ����� ����?
		AI_Output(self,other,"DIA_1013_BANDIT_FromMaleth_01_06");	//��� ���� � ���������� � �������, ���� �� ��� ������� ����� - � � �������� ������!
	};
	Bdt_1013_Away = TRUE;
	B_GivePlayerXP(XP_BanditWeg);
	Npc_ExchangeRoutine(self,"AWAY");
	AI_StopProcessInfos(self);
};


instance DIA_1013_BANDIT_FromCavalorn(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 3;
	condition = DIA_1013_BANDIT_FromCavalorn_Condition;
	information = DIA_1013_BANDIT_FromCavalorn_Info;
	permanent = FALSE;
	description = "������, � ���� ����� ����� ��������!";
};


func int DIA_1013_BANDIT_FromCavalorn_Condition()
{
	if((Bdt13_Friend == TRUE) && (MIS_Addon_Cavalorn_KillBrago == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_FromCavalorn_Info()
{
	AI_Output(other,self,"DIA_ADDON_1013_BANDIT_FromCavalorn_15_00");	//������, � ���� ����� ����� ��������!
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_FromCavalorn_01_01");	//��� �����?
	AI_Output(other,self,"DIA_ADDON_1013_BANDIT_FromCavalorn_15_02");	//���� ������������ ������ �� ����� ��������.
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_FromCavalorn_01_03");	//���������! �� ��� ��� ���? � ���������� ������...
	Bdt_1013_Away = TRUE;
	B_GivePlayerXP(XP_BanditWeg);
	Npc_ExchangeRoutine(self,"AWAY2");
	AI_StopProcessInfos(self);
};


var int bdt13_Gossip_Wildnis;

instance DIA_1013_BANDIT_PERM(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 4;
	condition = DIA_1013_BANDIT_PERM_Condition;
	information = DIA_1013_BANDIT_PERM_Info;
	permanent = TRUE;
	description = "���� ���-������ ���, ��� ����� �������������� ����?";
};


func int DIA_1013_BANDIT_PERM_Condition()
{
	if(Bdt13_Friend == TRUE)
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_PERM_Info()
{
	AI_Output(other,self,"DIA_1013_BANDIT_PERM_15_00");	//���� ���-������ ���, ��� ����� �������������� ����?
	if(bdt13_Gossip_Wildnis == FALSE)
	{
		AI_Output(self,other,"DIA_1013_BANDIT_PERM_01_01");	//�� ������ � ���� ��� ���������? ���� ������ �������� � �����, ���� ����� ��������� ������.
		AI_Output(self,other,"DIA_1013_BANDIT_PERM_01_02");	//��� ������ �� �������� � �����, ��� ������� ��� ����������.
		bdt13_Gossip_Wildnis = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_1013_BANDIT_PERM_01_03");	//� ������ ���� ���, ��� ���.
	};
};

