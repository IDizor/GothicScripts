
instance DIA_Buster_EXIT(C_Info)
{
	npc = SLD_802_Buster;
	nr = 999;
	condition = DIA_Buster_EXIT_Condition;
	information = DIA_Buster_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Buster_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Buster_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Buster_Hello(C_Info)
{
	npc = SLD_802_Buster;
	nr = 1;
	condition = DIA_Buster_Hello_Condition;
	information = DIA_Buster_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Buster_Hello_Condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_LOST) && ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Buster_Hello_Info()
{
	AI_Output(self,other,"DIA_Buster_Hello_13_00");	//����������, ��� � ��� �����?! � ���� �������� �� ����?
	Info_ClearChoices(DIA_Buster_Hello);
	Info_AddChoice(DIA_Buster_Hello,"��� �������. � ���� ������� ���������.",DIA_Buster_Hello_GoingToFarm);
	Info_AddChoice(DIA_Buster_Hello,"� ��� ����������?",DIA_Buster_Hello_WhoAreYou);
};

func void DIA_Buster_Hello_WhoAreYou()
{
	AI_Output(other,self,"DIA_Buster_Hello_WhoAreYou_15_00");	//� ��� ����������?
	AI_Output(self,other,"DIA_Buster_Hello_WhoAreYou_13_01");	//� ������, ���� �� ��������� ��!
	AI_Output(self,other,"DIA_Buster_Hello_WhoAreYou_13_02");	//� ���� ����� ���� ���������� �� ����, � �� �� ��� �������� ������� ���� �������!
	AI_Output(self,other,"DIA_Buster_Hello_WhoAreYou_13_03");	//�����, ��� ���� ����� �����?
	Info_ClearChoices(DIA_Buster_Hello);
	Info_AddChoice(DIA_Buster_Hello,"��� �� ���� ����.",DIA_Buster_Hello_NotYourBusiness);
	Info_AddChoice(DIA_Buster_Hello,"� ���� ��!",DIA_Buster_Hello_IKnowLee);
	Info_AddChoice(DIA_Buster_Hello,"� ���� ������� ���������.",DIA_Buster_Hello_GoingToFarm);
};

func void DIA_Buster_Hello_IKnowLee()
{
	AI_Output(other,self,"DIA_Buster_Hello_IKnowLee_15_00");	//� ���� ��!
	AI_Output(self,other,"DIA_Buster_Hello_IKnowLee_13_01");	//��� ����� ��! ��� �� ���� �� ������, ��������. ������, �� �������������� �� ����!
	AI_Output(self,other,"DIA_Buster_Hello_IKnowLee_13_02");	//����, ���� �� �������������?
	Info_ClearChoices(DIA_Buster_Hello);
	Info_AddChoice(DIA_Buster_Hello,"��� �� ���� ����.",DIA_Buster_Hello_NotYourBusiness);
	Info_AddChoice(DIA_Buster_Hello,"� ���� ������� ���������.",DIA_Buster_Hello_GoingToFarm);
};

func void DIA_Buster_Hello_NotYourBusiness()
{
	AI_Output(other,self,"DIA_Buster_Hello_NotYourBusiness_15_00");	//��� �� ���� ����.
	AI_Output(self,other,"DIA_Buster_Hello_NotYourBusiness_13_01");	//� ������ �� ������� ��� ������������� �� ����, ��, ������� �����! ��-�����, �� ������������ ������� �������.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Buster_Hello_GoingToFarm()
{
	AI_Output(other,self,"DIA_Buster_Hello_GoingToFarm_15_00");	//��� �������. � ���� ������� ���������.
	AI_Output(self,other,"DIA_Buster_Hello_GoingToFarm_13_01");	//��?.. �� - �� �� �������� ��� ����� �� �������.
	Info_ClearChoices(DIA_Buster_Hello);
	Info_AddChoice(DIA_Buster_Hello,"������ ���������?",DIA_Buster_Hello_WannaTestIt);
	Info_AddChoice(DIA_Buster_Hello,"� ���� ���� ������� ������ ������.",DIA_Buster_Hello_SlewBeasts);
	Info_AddChoice(DIA_Buster_Hello,"���� ��������� �������.",DIA_Buster_Hello_ImNoDanger);
};

func void DIA_Buster_Hello_ImNoDanger()
{
	AI_Output(other,self,"DIA_Buster_Hello_ImNoDanger_15_00");	//���� ��������� �������.
	AI_Output(self,other,"DIA_Buster_Hello_ImNoDanger_13_01");	//(������������) ��, �� ������ ���� � �������� ������������ ����� ����, ��������.
	AI_Output(self,other,"DIA_Buster_Hello_ImNoDanger_13_02");	//��� ��������� ���������� ��������� � ������. ��� �� ����������� �� ������. ��� ����� ���������. (�������)
	Info_ClearChoices(DIA_Buster_Hello);
	Info_AddChoice(DIA_Buster_Hello,"�� ������ � ���� ��������� �����? ���� ������� ������?",DIA_Buster_Hello_RealOrcs);
	Info_AddChoice(DIA_Buster_Hello,"�?",DIA_Buster_Hello_SoWhat);
	Info_AddChoice(DIA_Buster_Hello,"����������.",DIA_Buster_Hello_Impressive);
};

func void DIA_Buster_Hello_SlewBeasts()
{
	AI_Output(other,self,"DIA_Buster_Hello_SlewBeasts_15_00");	//� ���� ���� ������� ������ ������.
	AI_Output(self,other,"DIA_Buster_Hello_SlewBeasts_13_01");	//��! (�������) ��, ��������, ���������� ��������� ������������ �� ���� � ������ ������� ���� �� �� ���.
	AI_Output(self,other,"DIA_Buster_Hello_SlewBeasts_13_02");	//� �� ����� ����� ���� � ������! ��, � � ����� ��������� ���������� �����������. (����������� ����)
	Info_ClearChoices(DIA_Buster_Hello);
	Info_AddChoice(DIA_Buster_Hello,"�� ������ � ���� ��������� �����? ���� ������� ������?",DIA_Buster_Hello_RealOrcs);
	Info_AddChoice(DIA_Buster_Hello,"�?",DIA_Buster_Hello_SoWhat);
	Info_AddChoice(DIA_Buster_Hello,"����������.",DIA_Buster_Hello_Impressive);
};

func void DIA_Buster_Hello_WannaTestIt()
{
	AI_Output(other,self,"DIA_Buster_Hello_WannaTestIt_15_00");	//������ ���������?
	AI_Output(self,other,"DIA_Buster_Hello_WannaTestIt_13_01");	//���� ��! � ����� �� �� ���� �����, ��?
	AI_Output(other,self,"DIA_Buster_Hello_WannaTestIt_15_02");	//����� ������� � ���.
	AI_Output(self,other,"DIA_Buster_Hello_WannaTestIt_13_03");	//����� �����, ������ ���, �� ��� �� �����.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Buster_Hello_Impressive()
{
	AI_Output(other,self,"DIA_Buster_Hello_Impressive_15_00");	//����������.
	AI_Output(self,other,"DIA_Buster_Hello_Impressive_13_01");	//(�������) ��� ���� ������, ������! �� ���� ������ ���� ����������� ������ � �������!
	AI_Output(self,other,"DIA_Buster_Hello_Impressive_13_02");	//�� ������ ���� ����� ���� �� ���� �� �������. �� ����������� ����� ���� ����� �� ������.
	Info_ClearChoices(DIA_Buster_Hello);
	Info_AddChoice(DIA_Buster_Hello,"������, ��� �������� �������� ����, ��� � ���� �� ����!",DIA_Buster_Hello_LetMeShowYou);
	Info_AddChoice(DIA_Buster_Hello,"��� �������.",DIA_Buster_Hello_IfYouSaySo);
};

func void DIA_Buster_Hello_IfYouSaySo()
{
	AI_Output(other,self,"DIA_Buster_Hello_IfYouSaySo_15_00");	//��� �������.
	AI_Output(self,other,"DIA_Buster_Hello_IfYouSaySo_13_01");	//(�� ��������� ���������) �������, ������!
	AI_StopProcessInfos(self);
};

func void DIA_Buster_Hello_LetMeShowYou()
{
	AI_Output(other,self,"DIA_Buster_Hello_LetMeShowYou_15_00");	//������, ��� �������� �������� ����, ��� � ���� �� ����!
	AI_Output(self,other,"DIA_Buster_Hello_LetMeShowYou_13_01");	//�� ���, ������� �� ���� ������� �����������, ��?
	AI_Output(self,other,"DIA_Buster_Hello_LetMeShowYou_13_02");	//������, �����, ������, �� ��� �� ��������.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Buster_Hello_SoWhat()
{
	AI_Output(other,self,"DIA_Buster_Hello_SoWhat_15_00");	//�?
	AI_Output(self,other,"DIA_Buster_Hello_SoWhat_13_01");	//(�������) ��� ����� �� ���������, � ��� � ������. �� �������, ��� �� ����, ��?
	AI_Output(self,other,"DIA_Buster_Hello_SoWhat_13_02");	//(�������) ������, ������ ����� ����������� ���� ����!
	Info_ClearChoices(DIA_Buster_Hello);
	Info_AddChoice(DIA_Buster_Hello,"������ �����!",DIA_Buster_Hello_Whenever);
	Info_AddChoice(DIA_Buster_Hello,"� ������ ����...",DIA_Buster_Hello_JustJoking);
};

func void DIA_Buster_Hello_RealOrcs()
{
	AI_Output(other,self,"DIA_Buster_Hello_RealOrcs_15_00");	//�� ������ � ���� ��������� �����? ���� ������� ������?
	AI_Output(self,other,"DIA_Buster_Hello_RealOrcs_13_01");	//(��������) � ���� � ����... �������! �� ���, ����������� ���� ����?
	AI_Output(other,self,"DIA_Buster_Hello_RealOrcs_15_02");	//(��������) ���� � �� �����.
	AI_Output(self,other,"DIA_Buster_Hello_RealOrcs_13_03");	//�� �� ����� ��������! (����������) �� ��� ��������������, ��?
	AI_Output(self,other,"DIA_Buster_Hello_RealOrcs_13_04");	//����� �����, ������, �� ��� �� ��������, �����!
	Info_ClearChoices(DIA_Buster_Hello);
	Info_AddChoice(DIA_Buster_Hello,"������ �����!",DIA_Buster_Hello_Whenever);
	Info_AddChoice(DIA_Buster_Hello,"� ������ ����...",DIA_Buster_Hello_JustJoking);
};

func void DIA_Buster_Hello_Whenever()
{
	AI_Output(other,self,"DIA_Buster_Hello_Whenever_15_00");	//������ �����!
	AI_Output(self,other,"DIA_Buster_Hello_Whenever_13_01");	//����� ��� ����, ��������!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Buster_Hello_JustJoking()
{
	AI_Output(other,self,"DIA_Buster_Hello_JustJoking_15_00");	//� ������ ����...
	AI_Output(self,other,"DIA_Buster_Hello_JustJoking_13_01");	//������������ � ������ �������! � ������ ����������!
	AI_StopProcessInfos(self);
};


instance DIA_Buster_FightNone(C_Info)
{
	npc = SLD_802_Buster;
	nr = 1;
	condition = DIA_Buster_FightNone_Condition;
	information = DIA_Buster_FightNone_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Buster_FightNone_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Buster_Hello) && (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Buster_FightNone_Info()
{
	AI_Output(self,other,"DIA_Buster_FightNone_13_00");	//��� ���� �����, �������?
};


instance DIA_Buster_Duell(C_Info)
{
	npc = SLD_802_Buster;
	nr = 3;
	condition = DIA_Buster_Duell_Condition;
	information = DIA_Buster_Duell_Info;
	permanent = TRUE;
	description = "� ������� ���� �� �����!";
};


func int DIA_Buster_Duell_Condition()
{
	if(self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_LOST)
	{
		return TRUE;
	};
};

func void DIA_Buster_Duell_Info()
{
	AI_Output(other,self,"DIA_Buster_Duell_15_00");	//� ������� ���� �� �����!
	if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	{
		AI_Output(self,other,"DIA_Buster_Duell_13_01");	//��-��! ���� ��� ��������, ��? �����, ��� ����!
	}
	else
	{
		AI_Output(self,other,"DIA_Buster_Duell_13_02");	//�� ������ ����������� ��� ���? ��, �� ������, �����, ��� ����!
		if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_CANCEL)
		{
			AI_Output(self,other,"DIA_Buster_Duell_13_03");	//������ ������ �� ������!
		};
	};
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Buster_WannaJoin(C_Info)
{
	npc = SLD_802_Buster;
	nr = 2;
	condition = DIA_Buster_WannaJoin_Condition;
	information = DIA_Buster_WannaJoin_Info;
	permanent = TRUE;
	description = "� ���� �������������� � ���������!";
};


func int DIA_Buster_WannaJoin_Condition()
{
	if((other.guild == GIL_NONE) && (Buster_Duell == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Buster_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Buster_WannaJoin_15_00");	//� ���� �������������� � ���������!
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON) || (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST))
	{
		if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			AI_Output(self,other,"DIA_Buster_WannaJoin_13_01");	//� ����� � ����� ������ ��� � ����, �� ������ ���������� � ���� ������ �������.
		}
		else
		{
			AI_Output(self,other,"DIA_Buster_WannaJoin_13_02");	//�� �� �������� ������� ����, �� � ������ ���� ������� ������.
		};
		AI_Output(self,other,"DIA_Buster_WannaJoin_13_03");	//��� ����� �� ����� ������, ��� ��� � ����� �� ����� �����, �� ���� �� �������, � ���������� �� ����.
		Buster_Duell = TRUE;
		Log_CreateTopic(TOPIC_SLDRespekt,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_SLDRespekt,LOG_Running);
		B_LogEntry(TOPIC_SLDRespekt,"� ��� ���, ��� � ������� �������, �� �� ����� ������ ������ ����� ���������� � ���� ���������.");
	}
	else
	{
		AI_Output(self,other,"DIA_Buster_WannaJoin_13_04");	//��? � �� �����, ����� ����� ������ ��� �� �����-���� ��������� � ��������...
		if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_CANCEL)
		{
			AI_Output(self,other,"DIA_Buster_WannaJoin_13_05");	//�� �������� �� ����� - ����� ��� �� ����� ������ ������!
		};
	};
};


var int Buster_SentenzaTip;

instance DIA_Buster_OtherSld(C_Info)
{
	npc = SLD_802_Buster;
	nr = 1;
	condition = DIA_Buster_OtherSld_Condition;
	information = DIA_Buster_OtherSld_Info;
	permanent = FALSE;
	description = "� ���� ������ ������ � ��������� � ���� ���������.";
};


func int DIA_Buster_OtherSld_Condition()
{
	if((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_Buster_OtherSld_Info()
{
	AI_Output(other,self,"DIA_Buster_OtherSld_15_00");	//� ���� ������ ������ � ��������� � ���� ���������.
	AI_Output(self,other,"DIA_Buster_OtherSld_13_01");	//� ��������� � ���� ��� ���� �������. ���� ����� ������������ ��������.
	AI_Output(self,other,"DIA_Buster_OtherSld_13_02");	//� ��� �������� ��������� - �� ������� � ��� ������: ���� ������ �������� �� ���� - ����� ���������� � ���.
	if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Buster_OtherSld_13_03");	//� �����, �� ������� ����� ����� �� ���.
		AI_Output(self,other,"DIA_Buster_OtherSld_13_04");	//�� �� ����� �����������. ���� ������ ������� �� ����� ������ ���������� ���.
		AI_Output(self,other,"DIA_Buster_OtherSld_13_05");	//�� ���� ����� ����� ������, ������� ����� ������� ����...
		AI_Output(self,other,"DIA_Buster_OtherSld_13_06");	//��������, ��������. �� �������� ���� �� �����. ���� ����� �� ����������� � ���.
		Buster_SentenzaTip = TRUE;
	}
	else if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	{
	}
	else
	{
		AI_Output(self,other,"DIA_Buster_OtherSld_13_07");	//�� ����� � ������ ���� ��� ���, �������?!
		AI_StopProcessInfos(self);
	};
};


var int Buster_GoldZumBrennen;
var int Buster_Bonus;

instance DIA_Buster_AboutSentenza(C_Info)
{
	npc = SLD_802_Buster;
	nr = 1;
	condition = DIA_Buster_AboutSentenza_Condition;
	information = DIA_Buster_AboutSentenza_Info;
	permanent = FALSE;
	description = "��� ��� ������ ��������?";
};


func int DIA_Buster_AboutSentenza_Condition()
{
	if(Buster_SentenzaTip == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Buster_AboutSentenza_Info()
{
	AI_Output(other,self,"DIA_Buster_AboutSentenza_15_00");	//��� ��� ������ ��������?
	AI_Output(self,other,"DIA_Buster_AboutSentenza_13_01");	//�� ���������� �������� �� ���� ������, ����� �� ������ ������� �� ����� - �� ������ ��� �� �����.
	AI_Output(self,other,"DIA_Buster_AboutSentenza_13_02");	//�� ����� �����, � �� ��������. � ��� ��� � ������, ����� ������ ���� ������ ���. � ��� ������, �� ������������ �� ���� ����� �����.
	AI_Output(self,other,"DIA_Buster_AboutSentenza_13_03");	//������ �� ������, ��� �� ������. � ������� ��� ���� ��� ���� ������, �� ��� ��� ����� ���� �������. � ����� � ���� ����������� �����.
	AI_Output(self,other,"DIA_Buster_AboutSentenza_13_04");	//� �����, ��� �� ������� �����, ������� ����� �� ������� ���.
	AI_Output(other,self,"DIA_Buster_AboutSentenza_15_05");	//������� �� �����.
	AI_Output(self,other,"DIA_Buster_AboutSentenza_13_06");	//����������. �� ����� ��� ���� ������?
	Info_ClearChoices(DIA_Buster_AboutSentenza);
	Info_AddChoice(DIA_Buster_AboutSentenza,"���.",DIA_Buster_AboutSentenza_No);
	Info_AddChoice(DIA_Buster_AboutSentenza,"��, ��� ����� - 5 ������� �����.",DIA_Buster_AboutSentenza_Give);
};

func void DIA_Buster_AboutSentenza_Give()
{
	AI_Output(other,self,"DIA_Buster_AboutSentenza_Give_15_00");	//��, ��� ����� - 5 ������� �����.
	AI_Output(self,other,"DIA_Buster_AboutSentenza_Give_13_01");	//�������. ������, ��� �� ��� �� �����. � �� ������ ����� �������.
	Buster_GoldZumBrennen = TRUE;
	Buster_Bonus = 50;
	Info_ClearChoices(DIA_Buster_AboutSentenza);
};

func void DIA_Buster_AboutSentenza_No()
{
	AI_Output(other,self,"DIA_Buster_AboutSentenza_No_15_00");	//���.
	AI_Output(self,other,"DIA_Buster_AboutSentenza_No_13_01");	//� ��� � �����.
	Info_ClearChoices(DIA_Buster_AboutSentenza);
};


instance DIA_Buster_LeeLeader(C_Info)
{
	npc = SLD_802_Buster;
	nr = 2;
	condition = DIA_Buster_LeeLeader_Condition;
	information = DIA_Buster_LeeLeader_Info;
	permanent = FALSE;
	description = "��������� ����������� ��, ��?";
};


func int DIA_Buster_LeeLeader_Condition()
{
	if(Buster_Duell == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Buster_LeeLeader_Info()
{
	AI_Output(other,self,"DIA_Buster_LeeLeader_15_00");	//��������� ����������� ��, ��?
	AI_Output(self,other,"DIA_Buster_LeeLeader_13_01");	//��������� - ��, ������ � ��������, ��� ����� ����! �� ���� ��� � �������.
	AI_Output(other,self,"DIA_Buster_LeeLeader_15_02");	//(��������) ��� � �.
	AI_Output(self,other,"DIA_Buster_LeeLeader_13_03");	//� �� ����� ����, ����� ��� �������. � ��������� ����� ���� ����.
	AI_Output(other,self,"DIA_Buster_LeeLeader_15_04");	//� ���� ���� ������ ��������.
	AI_Output(self,other,"DIA_Buster_LeeLeader_13_05");	//����� �� ������ ��������� - � ��� ��� ������ ����������.
};


instance DIA_Buster_WhatHappened(C_Info)
{
	npc = SLD_802_Buster;
	nr = 2;
	condition = DIA_Buster_WhatHappened_Condition;
	information = DIA_Buster_WhatHappened_Info;
	permanent = FALSE;
	description = "��� ����� � ���������� �� �������?";
};


func int DIA_Buster_WhatHappened_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Buster_LeeLeader) && ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Buster_WhatHappened_Info()
{
	AI_Output(other,self,"DIA_Buster_WhatHappened_15_00");	//��� ����� � ���������� �� �������?
	AI_Output(self,other,"DIA_Buster_WhatHappened_13_01");	//����� ����, ��� ������� �� �����, �� ����� ��� �� �������. �� ������, ��� ��� ������  �� �������, ���� �� ����� ��������� ������. � �� ��� ����.
	AI_Output(self,other,"DIA_Buster_WhatHappened_13_02");	//������ �� ����� ����� ���� ���������� ��������. �������� ������ ���, ����� �� �� ������� ��������� �� ������.
	AI_Output(self,other,"DIA_Buster_WhatHappened_13_03");	//���� ����������� �� ��� ������ ������ ��� ���� ���������.
	AI_Output(self,other,"DIA_Buster_WhatHappened_13_04");	//���� ������ ��� ����, � �� ����� �������� �����, ����� ����������� ����������� �������� � ����� ���������� �������.
};


instance DIA_Buster_Teach(C_Info)
{
	npc = SLD_802_Buster;
	nr = 8;
	condition = DIA_Buster_Teach_Condition;
	information = DIA_Buster_Teach_Info;
	permanent = TRUE;
	description = "�� ������ ������� ���� ���������?";
};


func int DIA_Buster_Teach_Condition()
{
	if(Npc_GetTalentSkill(other,NPC_TALENT_1H) <= 60)
	{
		return TRUE;
	};
};

func void DIA_Buster_Teach_Info()
{
	AI_Output(other,self,"DIA_Buster_Teach_15_00");	//�� ������ ������� ���� ���������?
	if(self.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		AI_Output(self,other,"DIA_Buster_Teach_13_01");	//��, � ���� �������� ���� ������� �������...
	}
	else
	{
		AI_Output(self,other,"DIA_Buster_Teach_13_02");	//�� �� ��� �� ����, ��� ��������. ������, � ����� ���� ����, ��� ���� ���. �����, ����� ����, � ���� �������� ����� ������ ����...
	};
	if(BusterLOG == FALSE)
	{
		Log_CreateTopic(Topic_SoldierTeacher,LOG_NOTE);
		B_LogEntry(Topic_SoldierTeacher,"������ ����� ������� ���� ��������� �������� ���������� �������.");
		BusterLOG = TRUE;
	};
	Info_ClearChoices(DIA_Buster_Teach);
	Info_AddChoice(DIA_Buster_Teach,Dialog_Back,DIA_Buster_Teach_Back);
	Info_AddChoice(DIA_Buster_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Buster_Teach_1H_1);
	Info_AddChoice(DIA_Buster_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Buster_Teach_1H_5);
};

func void DIA_Buster_Teach_Back()
{
	Info_ClearChoices(DIA_Buster_Teach);
};

func void DIA_Buster_Teach_1H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,60);
	Info_ClearChoices(DIA_Buster_Teach);
	Info_AddChoice(DIA_Buster_Teach,Dialog_Back,DIA_Buster_Teach_Back);
	Info_AddChoice(DIA_Buster_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Buster_Teach_1H_1);
	Info_AddChoice(DIA_Buster_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Buster_Teach_1H_5);
};

func void DIA_Buster_Teach_1H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,60);
	Info_ClearChoices(DIA_Buster_Teach);
	Info_AddChoice(DIA_Buster_Teach,Dialog_Back,DIA_Buster_Teach_Back);
	Info_AddChoice(DIA_Buster_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Buster_Teach_1H_1);
	Info_AddChoice(DIA_Buster_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Buster_Teach_1H_5);
};


instance DIA_Buster_KAP3_EXIT(C_Info)
{
	npc = SLD_802_Buster;
	nr = 999;
	condition = DIA_Buster_KAP3_EXIT_Condition;
	information = DIA_Buster_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Buster_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Buster_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Buster_SHADOWBEASTS(C_Info)
{
	npc = SLD_802_Buster;
	nr = 30;
	condition = DIA_Buster_SHADOWBEASTS_Condition;
	information = DIA_Buster_SHADOWBEASTS_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Buster_SHADOWBEASTS_Condition()
{
	if(((Kapitel == 3) || (Kapitel == 4)) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void B_DIA_Buster_SHADOWBEASTS_OK()
{
	AI_StopProcessInfos(self);
};

func void DIA_Buster_SHADOWBEASTS_Info()
{
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_13_00");	//��, ��������!
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_15_01");	//��� ���� �����?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_13_02");	//��������� ����� � ��� �����, ��� ����� ���������� ����� � ���� ����.
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_15_03");	//�?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_13_04");	//��� �������, � ����, ��� ��� ����� �������.
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_13_05");	//�������� �� ������ ����� �������� ������� ����� �� ������������ �����.
	Info_ClearChoices(DIA_Buster_SHADOWBEASTS);
	Info_AddChoice(DIA_Buster_SHADOWBEASTS,"��� ���� ��������, � ������� �� ��������?",DIA_Buster_SHADOWBEASTS_wer);
	Info_AddChoice(DIA_Buster_SHADOWBEASTS,"��� �� ��� ��������?",DIA_Buster_SHADOWBEASTS_was);
	Info_AddChoice(DIA_Buster_SHADOWBEASTS,"����� �� �������� ��� ��� ���?",DIA_Buster_SHADOWBEASTS_ich);
};

func void DIA_Buster_SHADOWBEASTS_ich()
{
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_ich_15_00");	//����� �� �������� ��� ��� ���?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_ich_13_01");	//��� � �� ���� ��� �������. � ������ ���������� ����� � ������������� �� ����� ��������� ��������.
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_ich_15_02");	//�� ������ �������, �� ���������.
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_ich_13_03");	//��, � ��� � ������.
};

func void DIA_Buster_SHADOWBEASTS_was()
{
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_was_15_00");	//��� �� ��� ��������?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_was_13_01");	//���� �������� ����������, ��� ����� ����� ������� ������� ���� ����������.
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_was_13_02");	//���-�� ������ ������� � ��� � ����������� �� ���� ������. ��� ��� ����� �� � �����.
	Info_AddChoice(DIA_Buster_SHADOWBEASTS,"������� �� ���� ����� ����������?",DIA_Buster_SHADOWBEASTS_was_wieviel);
};

func void DIA_Buster_SHADOWBEASTS_was_wieviel()
{
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_was_wieviel_15_00");	//������� �� ���� ����� ����������?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_was_wieviel_13_01");	//����� ���� �����! ����� ������ ��� �����.
	if(Buster_GoldZumBrennen == TRUE)
	{
		AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_was_wieviel_13_02");	//� ����� � ��� ������, ��� �� ��� ���, � ������ ��� ���� ������ ����.
	};
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_was_wieviel_15_03");	//������ ���������! � ��� ���� �����, ����� ������ ��� ����.
	MIS_Buster_KillShadowbeasts_DJG = LOG_Running;
	Log_CreateTopic(TOPIC_Buster_KillShadowbeasts,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Buster_KillShadowbeasts,LOG_Running);
	B_LogEntry(TOPIC_Buster_KillShadowbeasts,"������ ���� ������� ���� �� ������ ��� ���������, ��� � ������� ���.");
	Info_ClearChoices(DIA_Buster_SHADOWBEASTS);
};

func void DIA_Buster_SHADOWBEASTS_wer()
{
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_wer_15_00");	//��� ���� ��������, � ������� �� ��������?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_wer_13_01");	//��� �� ������, ��������. � ���, ��-������, ����� - ���������� ���� ���������? �� ���, ������ �������� ����?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_wer_13_02");	//���� �� ������ ����� ���� �� ����, ��� ������ ������ �� ����, �������?
};


instance DIA_Buster_BringTrophyShadowbeast(C_Info)
{
	npc = SLD_802_Buster;
	nr = 2;
	condition = DIA_Buster_BringTrophyShadowbeast_Condition;
	information = DIA_Buster_BringTrophyShadowbeast_Info;
	permanent = TRUE;
	description = "������ ����� ���������� ...";
};


func int DIA_Buster_BringTrophyShadowbeast_Condition()
{
	if((MIS_Buster_KillShadowbeasts_DJG == LOG_Running) && (Npc_HasItems(other,ItAt_ShadowHorn) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] == FALSE)) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};


var int BusterTrophyShadowbeastCounter;

func void DIA_Buster_BringTrophyShadowbeast_Info()
{
	var int BusterTrophyShadowbeastCount;
	var int XP_BringBusterTrophyShadowbeast;
	var int XP_BringBusterTrophyShadowbeasts;
	var int BustersBusterTrophyShadowbeastOffer;
	var int BusterTrophyShadowbeastGeld;
	if(Kapitel >= 5)
	{
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_13_00");	//��� �������� �� ������ ������� ���������� ������.
		AI_Output(other,self,"DIA_Buster_BringTrophyShadowbeast_15_01");	//��� ��� ������?
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_13_02");	//�� �����. ������ �������� ��� ���� ����. ������ � ��� ����� �� ����, ��� � ���� ������.
		MIS_Buster_KillShadowbeasts_DJG = LOG_SUCCESS;
		B_GivePlayerXP(XP_Ambient);
	}
	else if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] == FALSE)
	{
		AI_Output(other,self,"DIA_Buster_ANIMALTROPHYSHADOWBEAST_15_03");	//� ��� ����� ��������� ���������?
		AI_Output(self,other,"DIA_Buster_ANIMALTROPHYSHADOWBEAST_13_04");	//�� ����� �� ������? ��, ������, � ����� � ���� �����.
		Info_ClearChoices(DIA_Buster_BringTrophyShadowbeast);
		Info_AddChoice(DIA_Buster_BringTrophyShadowbeast,"� ������� � ���� � ������.",DIA_Buster_BringTrophyShadowbeast_back);
		Info_AddChoice(DIA_Buster_BringTrophyShadowbeast,B_BuildLearnString("����� ����.",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_ShadowHorn)),DIA_Buster_BringTrophyShadowbeast_teach);
	}
	else
	{
		BusterTrophyShadowbeastCount = Npc_HasItems(other,ItAt_ShadowHorn);
		XP_BringBusterTrophyShadowbeast = Shadowbeast.level * XP_PER_VICTORY;
		BustersBusterTrophyShadowbeastOffer = Value_ShadowHorn + Buster_Bonus;
		if(BusterTrophyShadowbeastCount == 1)
		{
			AI_Output(other,self,"DIA_Buster_BringTrophyShadowbeast_15_05");	//� ������ ���� ��� ���������.
			B_GivePlayerXP(XP_BringBusterTrophyShadowbeast);
			B_GiveInvItems(other,self,ItAt_ShadowHorn,1);
			BusterTrophyShadowbeastCounter = BusterTrophyShadowbeastCounter + 1;
		}
		else
		{
			AI_Output(other,self,"DIA_Buster_BringTrophyShadowbeast_15_06");	//� ������ ���� ���������� ��� ������ ��������.
			B_GiveInvItems(other,self,ItAt_ShadowHorn,BusterTrophyShadowbeastCount);
			XP_BringBusterTrophyShadowbeasts = BusterTrophyShadowbeastCount * XP_BringBusterTrophyShadowbeast;
			BusterTrophyShadowbeastCounter = BusterTrophyShadowbeastCounter + BusterTrophyShadowbeastCount;
			B_GivePlayerXP(XP_BringBusterTrophyShadowbeasts);
		};
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_13_07");	//�������. ����� ����. � ������� ���, ���� �������. ��� �����, ��� ����� �������� ����� ��������� ��� ����.
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_13_08");	//��� ���� ����.
		BusterTrophyShadowbeastGeld = BusterTrophyShadowbeastCount * BustersBusterTrophyShadowbeastOffer;
		CreateInvItems(self,ItMi_Gold,BusterTrophyShadowbeastGeld);
		B_GiveInvItems(self,other,ItMi_Gold,BusterTrophyShadowbeastGeld);
	};
};

func void DIA_Buster_BringTrophyShadowbeast_teach()
{
	AI_Output(other,self,"DIA_Buster_BringTrophyShadowbeast_teach_15_00");	//����� ����.
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_ShadowHorn))
	{
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_teach_13_01");	//�����, ������. �������� ���������, � ��� ����� ������ ������ ��� ��� ������ �����.
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_teach_13_02");	//����� ������������ ��� � ��� ��� � ������� �������� ������ ������ ����.
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_teach_13_03");	//��, � ����� ������ ���������� ��� �����, ��������� ��� ��� �����, � ������� ��� ���� � ������.
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_teach_13_04");	//� ��������� ��� ���. � �����, � ���� ���������.
	};
	Info_ClearChoices(DIA_Buster_BringTrophyShadowbeast);
};

func void DIA_Buster_BringTrophyShadowbeast_back()
{
	AI_Output(other,self,"DIA_Buster_BringTrophyShadowbeast_back_15_00");	//� ������� � ���� � ������.
	AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_back_13_01");	//�������.
	Info_ClearChoices(DIA_Buster_BringTrophyShadowbeast);
};


instance DIA_Buster_KAP4_EXIT(C_Info)
{
	npc = SLD_802_Buster;
	nr = 999;
	condition = DIA_Buster_KAP4_EXIT_Condition;
	information = DIA_Buster_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Buster_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Buster_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Buster_Perm4(C_Info)
{
	npc = SLD_802_Buster;
	nr = 2;
	condition = DIA_Buster_Perm4_Condition;
	information = DIA_Buster_Perm4_Info;
	permanent = TRUE;
	description = "��� �� ������� �� ��������� �� ��������?";
};


func int DIA_Buster_Perm4_Condition()
{
	if(Kapitel >= 4)
	{
		return TRUE;
	};
};

func void DIA_Buster_Perm4_Info()
{
	AI_Output(other,self,"DIA_Buster_Perm4_15_00");	//��� �� ������� �� ��������� �� ��������?
	AI_Output(self,other,"DIA_Buster_Perm4_13_01");	//��� ����� ����� ���������� ����� ���� ������ - ���� �� ������� � ����.
	AI_Output(self,other,"DIA_Buster_Perm4_13_02");	//� � ����������� �������� � ��.
};


instance DIA_Buster_KAP5_EXIT(C_Info)
{
	npc = SLD_802_Buster;
	nr = 999;
	condition = DIA_Buster_KAP5_EXIT_Condition;
	information = DIA_Buster_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Buster_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Buster_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Buster_KAP6_EXIT(C_Info)
{
	npc = SLD_802_Buster;
	nr = 999;
	condition = DIA_Buster_KAP6_EXIT_Condition;
	information = DIA_Buster_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Buster_KAP6_EXIT_Condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Buster_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Buster_PICKPOCKET(C_Info)
{
	npc = SLD_802_Buster;
	nr = 900;
	condition = DIA_Buster_PICKPOCKET_Condition;
	information = DIA_Buster_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Buster_PICKPOCKET_Condition()
{
	return C_Beklauen(34,60);
};

func void DIA_Buster_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Buster_PICKPOCKET);
	Info_AddChoice(DIA_Buster_PICKPOCKET,Dialog_Back,DIA_Buster_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Buster_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Buster_PICKPOCKET_DoIt);
};

func void DIA_Buster_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Buster_PICKPOCKET);
};

func void DIA_Buster_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Buster_PICKPOCKET);
};

