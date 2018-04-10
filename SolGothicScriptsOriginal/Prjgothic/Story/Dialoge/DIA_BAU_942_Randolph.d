
instance DIA_Randolph_EXIT(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 999;
	condition = DIA_Randolph_EXIT_Condition;
	information = DIA_Randolph_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Randolph_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Randolph_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Randolph_SchwereLuft(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 4;
	condition = DIA_Randolph_SchwereLuft_Condition;
	information = DIA_Randolph_SchwereLuft_Info;
	permanent = FALSE;
	description = "��� � �������?";
};


func int DIA_Randolph_SchwereLuft_Condition()
{
	if(!Npc_IsDead(Alvares) && !Npc_IsDead(Engardo) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Randolph_SchwereLuft_Info()
{
	AI_Output(other,self,"DIA_Randolph_SchwereLuft_15_00");	//��� � �������?
	AI_Output(self,other,"DIA_Randolph_SchwereLuft_06_01");	//����... ��� ������ ���-������ ����� ������ �������� �����, �������� ����� ������... ��� ��� ���� ���������� - ��� ����� �� ��������.
	AI_Output(other,self,"DIA_Randolph_SchwereLuft_15_02");	//�� ������ ����������� � �������?
	AI_Output(self,other,"DIA_Randolph_SchwereLuft_06_03");	//� �� �������� � �������, ����� �������� �����. �� � ����� �� ��������� ������������� ��.
	Akils_SLDStillthere = TRUE;
	Log_CreateTopic(TOPIC_AkilsSLDStillthere,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AkilsSLDStillthere,LOG_Running);
	B_LogEntry(TOPIC_AkilsSLDStillthere,"������� ����� �������� ��������.");
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Randolph_HALLO(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 4;
	condition = DIA_Randolph_HALLO_Condition;
	information = DIA_Randolph_HALLO_Info;
	permanent = FALSE;
	description = "��� � �������?";
};


func int DIA_Randolph_HALLO_Condition()
{
	if(Npc_IsDead(Alvares) && Npc_IsDead(Engardo) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Randolph_HALLO_Info()
{
	AI_Output(other,self,"DIA_Randolph_HALLO_15_00");	//��� � �������?
	if(Npc_IsDead(Akil) && Npc_IsDead(Kati))
	{
		AI_Output(self,other,"DIA_Randolph_HALLO_06_01");	//������, ����� ���� � ���� ����������� � ������� ������, � ���� ��������� ���� ������.
		Npc_ExchangeRoutine(self,"START");
		AI_ContinueRoutine(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Randolph_HALLO_06_02");	//��, � � �������. ���� �������� ���������� ��� ������ � ������ � ������ ����. ������, ��� ��� ���������.
	};
	AI_Output(self,other,"DIA_Randolph_HALLO_06_03");	//�� ���� � �� ��������� �� ������ - ��� ��� �� ���������� �������� ���� � �������.
};


instance DIA_Randolph_Baltram(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 5;
	condition = DIA_Randolph_Baltram_Condition;
	information = DIA_Randolph_Baltram_Info;
	permanent = FALSE;
	description = "���� ������� �������� ...";
};


func int DIA_Randolph_Baltram_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Randolph_HALLO) && (MIS_Baltram_ScoutAkil == LOG_Running) && Npc_IsDead(Akil) && Npc_IsDead(Kati) && (Lieferung_Geholt == FALSE) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Randolph_Baltram_Info()
{
	AI_Output(other,self,"DIA_Randolph_Baltram_15_00");	//���� ������� ��������. � ������ ������� ����� ��� ����.
	AI_Output(self,other,"DIA_Randolph_Baltram_06_01");	//������. � ��� ��� ����������. ��� ���� �����.
	CreateInvItems(self,ItMi_BaltramPaket,1);
	B_GiveInvItems(self,other,ItMi_BaltramPaket,1);
	Lieferung_Geholt = TRUE;
};


instance DIA_Randolph_Geschichte(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 5;
	condition = DIA_Randolph_Geschichte_Condition;
	information = DIA_Randolph_Geschichte_Info;
	permanent = FALSE;
	description = "�� ���� ���������, ��?";
};


func int DIA_Randolph_Geschichte_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Randolph_HALLO) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Randolph_Geschichte_Info()
{
	AI_Output(other,self,"DIA_Randolph_Geschichte_15_00");	//�� ���� ���������, ��?
	AI_Output(self,other,"DIA_Randolph_Geschichte_06_01");	//� ������ � ����� ��������. �����-�� ������ �������� � ���������, ��� �� �������� ����� ����, ����� �������� ���������� ����.
	AI_Output(self,other,"DIA_Randolph_Geschichte_06_02");	//�� ����� � ������� ����, ��� ������� ���� �������� ������. � ��� ����������� ���� ����. ������� � ����� �������� � �����.
	AI_Output(self,other,"DIA_Randolph_Geschichte_06_03");	//����� ���� ��������� ��������� �������, � � ����� �������� �� �����. � ���� ���� ������ � ������, ������ ��� ������.
};


instance DIA_Randolph_TAVERNE(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 5;
	condition = DIA_Randolph_TAVERNE_Condition;
	information = DIA_Randolph_TAVERNE_Info;
	description = "�� ������� � �������?";
};


func int DIA_Randolph_TAVERNE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Randolph_HALLO) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Randolph_TAVERNE_Info()
{
	AI_Output(other,self,"DIA_Randolph_TAVERNE_15_00");	//�� ������� � �������?
	AI_Output(self,other,"DIA_Randolph_TAVERNE_06_01");	//�����.
	AI_Output(self,other,"DIA_Randolph_TAVERNE_06_02");	//�� ������ � �� ���� ��������� ���� ������ ����.
};


instance DIA_Randolph_WASISTINTAVERNE(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 6;
	condition = DIA_Randolph_WASISTINTAVERNE_Condition;
	information = DIA_Randolph_WASISTINTAVERNE_Info;
	description = "� ��� ��� ����������, � �������?";
};


func int DIA_Randolph_WASISTINTAVERNE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Randolph_TAVERNE) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Randolph_WASISTINTAVERNE_Info()
{
	AI_Output(other,self,"DIA_Randolph_WASISTINTAVERNE_15_00");	//� ��� ��� ����������, � �������?
	AI_Output(self,other,"DIA_Randolph_WASISTINTAVERNE_06_01");	//��� �������� �������� ����.
	AI_Output(self,other,"DIA_Randolph_WASISTINTAVERNE_06_02");	//���� ����������� ���� � ������. ���, ��� ����� ������ ������ ���� - ���������.
	AI_Output(self,other,"DIA_Randolph_WASISTINTAVERNE_06_03");	//� ��������� ����� � ������ ����������, � ������ � ���� ������ �� �������� �����.
	Log_CreateTopic(TOPIC_Wettsaufen,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Wettsaufen,LOG_Running);
	B_LogEntry(TOPIC_Wettsaufen,"� ������� ����� ��������� ����.");
};


instance DIA_Randolph_GEGENWEN(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 7;
	condition = DIA_Randolph_GEGENWEN_Condition;
	information = DIA_Randolph_GEGENWEN_Info;
	description = "� ��� �� ������������?";
};


func int DIA_Randolph_GEGENWEN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Randolph_WASISTINTAVERNE) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Randolph_GEGENWEN_Info()
{
	AI_Output(other,self,"DIA_Randolph_GEGENWEN_15_00");	//� ��� �� ������������?
	AI_Output(self,other,"DIA_Randolph_GEGENWEN_06_01");	//� �������, ���� ������ ������������. �� ������ �������� ����.
	AI_Output(self,other,"DIA_Randolph_GEGENWEN_06_02");	//�� � ���� ���� ����������, ��� ��� ������� ������ ��� ����� ����������� � ��� ���� ����.
	AI_Output(self,other,"DIA_Randolph_GEGENWEN_06_03");	//� �����, �� ������ ���� � ����� �������� �������. ��� ������!
	AI_Output(self,other,"DIA_Randolph_GEGENWEN_06_04");	//���-������ ������ ��������� ���� � ��� ������� �� ����. ����� �� ����� ��������� �� � ��� ���� ������� �����.
	AI_Output(self,other,"DIA_Randolph_GEGENWEN_06_05");	//���� �� ������ � ���� ���� ������, ����� ��������� � ��� ��� ���.
	B_LogEntry(TOPIC_Wettsaufen,"�������� ��������� ��� � ������ � ���������� '��� ���� ��������'. � ��������� ������������ �����, ����� ��������� ���� � ������� ��� ���.");
	B_LogEntry(TOPIC_Wettsaufen,"�������� ����������� ������ � ������������ � ���������� '��� ���� ��������'. �������� ����� �� ��������� ������� ����� � ������� ������ �� ������� � �����.");
};


instance DIA_Randolph_WASBRAUCHSTDU(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 8;
	condition = DIA_Randolph_WASBRAUCHSTDU_Condition;
	information = DIA_Randolph_WASBRAUCHSTDU_Info;
	description = "������� ����� ���� ����� ��� ����� ����������?";
};


func int DIA_Randolph_WASBRAUCHSTDU_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Randolph_GEGENWEN) && (MIS_Rukhar_Wettkampf == LOG_Running) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Randolph_WASBRAUCHSTDU_Info()
{
	AI_Output(other,self,"DIA_Randolph_WASBRAUCHSTDU_15_00");	//������� ����� ���� ����� ��� ����� ����������?
	AI_Output(self,other,"DIA_Randolph_WASBRAUCHSTDU_06_01");	//10 �������.
};


instance DIA_Randolph_ICHGEBEDIRGELD(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 9;
	condition = DIA_Randolph_ICHGEBEDIRGELD_Condition;
	information = DIA_Randolph_ICHGEBEDIRGELD_Info;
	permanent = TRUE;
	description = "� ��� ���� ������, ����� �� �������� � �������.";
};


var int DIA_Randolph_ICHGEBEDIRGELD_noPerm;

func int DIA_Randolph_ICHGEBEDIRGELD_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Randolph_WASBRAUCHSTDU) && (DIA_Randolph_ICHGEBEDIRGELD_noPerm == FALSE) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Randolph_ICHGEBEDIRGELD_Info()
{
	AI_Output(other,self,"DIA_Randolph_ICHGEBEDIRGELD_15_00");	//� ��� ���� ������, ����� �� �������� � �������.
	if(B_GiveInvItems(other,self,ItMi_Gold,10))
	{
		AI_Output(self,other,"DIA_Randolph_ICHGEBEDIRGELD_06_01");	//(�����������) ������? �������� �������. � ����� ����� �� ����.
		AI_Output(self,other,"DIA_Randolph_ICHGEBEDIRGELD_06_02");	//���� � ����� ��������, � ���� ����� ���� �� � ����������. ��� ��������.
		B_LogEntry(TOPIC_Wettsaufen,"���� ���������. � ������ ��������� �� ���.");
		B_GivePlayerXP(XP_Randolph_WettkampfStart);
		DIA_Randolph_ICHGEBEDIRGELD_noPerm = TRUE;
		B_NpcClearObsessionByDMT(self);
		MIS_Rukhar_Wettkampf_Day = Wld_GetDay();
		Npc_ExchangeRoutine(self,"Wettkampf");
		B_StartOtherRoutine(Orlan,"Wettkampf");
		B_StartOtherRoutine(Rukhar,"Wettkampf");
	}
	else
	{
		AI_Output(self,other,"DIA_Randolph_ICHGEBEDIRGELD_06_03");	//�� �����. � ���� ���� �����-�� ���.
	};
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Randolph_WETTKAMPFZUENDE(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 10;
	condition = DIA_Randolph_WETTKAMPFZUENDE_Condition;
	information = DIA_Randolph_WETTKAMPFZUENDE_Info;
	permanent = TRUE;
	description = "��������?";
};


func int DIA_Randolph_WETTKAMPFZUENDE_Condition()
{
	if((MIS_Rukhar_Wettkampf == LOG_SUCCESS) && (Kapitel < 4))
	{
		return TRUE;
	};
};


var int DIA_Randolph_WETTKAMPFZUENDE_OneTime;

func void DIA_Randolph_WETTKAMPFZUENDE_Info()
{
	AI_Output(other,self,"DIA_Randolph_WETTKAMPFZUENDE_15_00");	//��������?
	if(Rukhar_Won_Wettkampf == TRUE)
	{
		AI_Output(self,other,"DIA_Randolph_WETTKAMPFZUENDE_06_01");	//�� ��, ����� ������ �� ���������. � � �� ���� ���������� �� ����. � ������ ����� � ��� �� ������, �������!
		AI_Output(self,other,"DIA_Randolph_WETTKAMPFZUENDE_06_02");	//���� ������ �������. ������.
	}
	else
	{
		AI_Output(self,other,"DIA_Randolph_WETTKAMPFZUENDE_06_03");	//���. � �������� ���� �������, ������.
		if(DIA_Randolph_WETTKAMPFZUENDE_OneTime == FALSE)
		{
			AI_Output(self,other,"DIA_Randolph_WETTKAMPFZUENDE_06_04");	//���, �������, ����������. ������� ��� ��� �� ������. ���, ������ �� �����.
			CreateInvItems(self,ItMi_Gold,20);
			B_GiveInvItems(self,other,ItMi_Gold,12);
			DIA_Randolph_WETTKAMPFZUENDE_OneTime = TRUE;
		};
		AI_Output(self,other,"DIA_Randolph_WETTKAMPFZUENDE_06_05");	//������, ����� �� ����� ��� ��������� ����� �����.
	};
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Randolph_PERM(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 30;
	condition = DIA_Randolph_PERM_Condition;
	information = DIA_Randolph_PERM_Info;
	permanent = TRUE;
	description = "�� �� ��� �����?";
};


func int DIA_Randolph_PERM_Condition()
{
	if((Kapitel >= 4) && (NpcObsessedByDMT_Randolph == FALSE))
	{
		return TRUE;
	};
};


var int DIA_Randolph_PERM_GotMoney;

func void DIA_Randolph_PERM_Info()
{
	if(hero.guild == GIL_KDF)
	{
		B_NpcObsessedByDMT(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Randolph_PERM_15_00");	//�� � �������?
		if(((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL)) && (MIS_HealRandolph != LOG_SUCCESS))
		{
			if((DIA_Sagitta_HEALRANDOLPH_GotOne == FALSE) && (DIA_Sagitta_HEALRANDOLPH_KnowsPrice == TRUE) && (DIA_Randolph_PERM_GotMoney == FALSE))
			{
				AI_Output(other,self,"DIA_Randolph_PERM_15_01");	//�� ������ ����, �� ��� �����, � �� �����������, ��� ��� ��������� ����� �������?!
				AI_Output(other,self,"DIA_Randolph_PERM_15_02");	//������� ����� 300 ������� �� ����.
				AI_Output(self,other,"DIA_Randolph_PERM_06_03");	//� ���� ���� ���� ������ 150 �������. ����������. �� ������ ������ ���. ����������.
				CreateInvItems(self,ItMi_Gold,150);
				B_GiveInvItems(self,other,ItMi_Gold,150);
				DIA_Randolph_PERM_GotMoney = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_Randolph_PERM_06_04");	//��� �����. ������ ���, ����� � �������� ����, ��� �������� ������� ����. ��� ����� ����� ������.
				AI_Output(self,other,"DIA_Randolph_PERM_06_05");	//�� ���� ���������, ������� ����� ������.
				AI_Output(self,other,"DIA_Randolph_PERM_06_06");	//�������, ������-������������, ��� �������� ��� ��� ����. �� � �� �����, ��� ������ ����� ��������� �� ��� ���. ��� ������� ����.
			};
			Log_CreateTopic(TOPIC_HealRandolph,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_HealRandolph,LOG_Running);
			B_LogEntry(TOPIC_HealRandolph,"��������, ������, ����� ������� ���� � ������ ���� � ������� �� ���������� �� ����������� ��������.");
			MIS_HealRandolph = LOG_Running;
		}
		else
		{
			AI_Output(self,other,"DIA_Randolph_PERM_06_07");	//� ��� ��� �������� �������� � �����, �� ��� ��� ����� �����.
		};
	};
};


instance DIA_Randolph_Heilung(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 55;
	condition = DIA_Randolph_Heilung_Condition;
	information = DIA_Randolph_Heilung_Info;
	permanent = TRUE;
	description = "�������� ������� ���� � ������, ��?";
};


func int DIA_Randolph_Heilung_Condition()
{
	if((NpcObsessedByDMT_Randolph == TRUE) && (NpcObsessedByDMT == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Randolph_Heilung_Info()
{
	AI_Output(other,self,"DIA_Randolph_Heilung_15_00");	//�������� ������� ���� � ������, ��?
	AI_Output(self,other,"DIA_Randolph_Heilung_06_01");	//� ������ ����� � ��� �� ������. ������ �� � ���� �����. �� ������ ��� ��������, ������.
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Randolph_SAGITTAHEAL(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 56;
	condition = DIA_Randolph_SAGITTAHEAL_Condition;
	information = DIA_Randolph_SAGITTAHEAL_Info;
	description = "�����. ��� �������� ���� ��������. ";
};


func int DIA_Randolph_SAGITTAHEAL_Condition()
{
	if((MIS_HealRandolph == LOG_Running) && Npc_HasItems(other,ItPo_HealRandolph_MIS))
	{
		return TRUE;
	};
};

func void DIA_Randolph_SAGITTAHEAL_Info()
{
	AI_Output(other,self,"DIA_Randolph_SAGITTAHEAL_15_00");	//�����. ��� �������� ���� ��������.
	B_GiveInvItems(other,self,ItPo_HealRandolph_MIS,1);
	if(Npc_IsInState(self,ZS_Pick_FP))
	{
		B_UseItem(self,ItPo_HealRandolph_MIS);
	};
	AI_Output(self,other,"DIA_Randolph_SAGITTAHEAL_06_01");	//��! �������, ����. ������ � ����� ���� �� �������.
	AI_Output(self,other,"DIA_Randolph_SAGITTAHEAL_06_02");	//��� � ���� ��������� ���� �� ���?
	if(DIA_Randolph_PERM_GotMoney == FALSE)
	{
		AI_Output(self,other,"DIA_Randolph_SAGITTAHEAL_06_03");	//� �����, ��� ��������� ����� ����� ������ ������ ��� ������ ����. �� �����, ��� ���, ��� � ���� ����.
		CreateInvItems(self,ItMi_Gold,150);
		B_GiveInvItems(self,other,ItMi_Gold,150);
	}
	else
	{
		AI_Output(other,self,"DIA_Randolph_SAGITTAHEAL_15_04");	//� �������� �� ���� ���� �����. ���� ������ ��������� ����� ����� �� ����� �������������� ��� �������.
		AI_Output(self,other,"DIA_Randolph_SAGITTAHEAL_06_05");	//��, � ����� ������ ��� �������, ��� � �������� ������ ������������� ��������, ���� ��� �� �������?
	};
	MIS_HealRandolph = LOG_SUCCESS;
	B_GivePlayerXP(XP_HealRandolph);
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Randolph_PICKPOCKET(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 900;
	condition = DIA_Randolph_PICKPOCKET_Condition;
	information = DIA_Randolph_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Randolph_PICKPOCKET_Condition()
{
	return C_Beklauen(58,2);
};

func void DIA_Randolph_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Randolph_PICKPOCKET);
	Info_AddChoice(DIA_Randolph_PICKPOCKET,Dialog_Back,DIA_Randolph_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Randolph_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Randolph_PICKPOCKET_DoIt);
};

func void DIA_Randolph_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Randolph_PICKPOCKET);
};

func void DIA_Randolph_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Randolph_PICKPOCKET);
};

