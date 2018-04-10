
instance DIA_Oric_EXIT(C_Info)
{
	npc = PAL_251_Oric;
	nr = 999;
	condition = DIA_Oric_EXIT_Condition;
	information = DIA_Oric_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Oric_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Oric_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Oric_HALLO(C_Info)
{
	npc = PAL_251_Oric;
	nr = 4;
	condition = DIA_Oric_HALLO_Condition;
	information = DIA_Oric_HALLO_Info;
	permanent = FALSE;
	description = "������ ���� �����������?";
};


func int DIA_Oric_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Oric_HALLO_Info()
{
	AI_Output(other,self,"DIA_Oric_HALLO_15_00");	//������ ���� �����������?
	AI_Output(self,other,"DIA_Oric_HALLO_11_01");	//� ������-������� ������, � � ��������� ����� ���������� ��������������� ������������ �������.
	AI_Output(self,other,"DIA_Oric_HALLO_11_02");	//�� ��������� ��������, ���������� �����, � �����. ��� ��������� ���� ���� ���� �� ���� ���.
	AI_Output(self,other,"DIA_Oric_HALLO_11_03");	//��� ��� ����, ����� ��� ���������� ����������� �������. � �� �������� �����. ������� ������� - �� �������� �����.
};


instance DIA_Oric_Bruder(C_Info)
{
	npc = PAL_251_Oric;
	nr = 4;
	condition = DIA_Oric_Bruder_Condition;
	information = DIA_Oric_Bruder_Info;
	permanent = FALSE;
	description = "� ���� ���� �������� ��� ����.";
};


func int DIA_Oric_Bruder_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jergan_Burg) && Npc_KnowsInfo(other,DIA_Oric_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Oric_Bruder_Info()
{
	AI_Output(other,self,"DIA_Oric_Bruder_15_00");	//� ���� ���� �������� ��� ����.
	AI_Output(self,other,"DIA_Oric_Bruder_11_01");	//��� �� ��������?
	AI_Output(other,self,"DIA_Oric_Bruder_15_02");	//���� ���� �����. �� ����� � �������.
	AI_Output(self,other,"DIA_Oric_Bruder_11_03");	//(��������)... ��� ����...
	AI_Output(self,other,"DIA_Oric_Bruder_11_04");	//����� ���������� ���� ������� ����������. �� �� ����� ��� ��� �����...
	AI_Output(self,other,"DIA_Oric_Bruder_11_05");	//��� ������� - ������, ���������� ��� ������. � ���� ������ ����� ���� � ��������.
	OricBruder = TRUE;
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Oric_ScoutMine(C_Info)
{
	npc = PAL_251_Oric;
	nr = 1;
	condition = DIA_Oric_ScoutMine_Condition;
	information = DIA_Oric_ScoutMine_Info;
	permanent = FALSE;
	description = "� ����������� � ������.";
};


func int DIA_Oric_ScoutMine_Condition()
{
	if((MIS_ScoutMine == LOG_Running) && (Kapitel < 3) && Npc_KnowsInfo(other,DIA_Oric_HALLO) && (Fajeth_Ore == FALSE) && (Marcos_Ore == FALSE) && (Silvestro_Ore == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Oric_ScoutMine_Info()
{
	AI_Output(other,self,"DIA_Oric_ScoutMine_15_00");	//� ����������� � ������.
	AI_Output(self,other,"DIA_Oric_ScoutMine_11_01");	//���� ��������. ��� �������� ������. ������ �����, ����� ���������. ��� ����������� ��� ��� ������.
	AI_Output(self,other,"DIA_Oric_ScoutMine_11_02");	//���� ���� ����� ������ ����������, �������� � ����������.
};


instance DIA_Oric_Perm(C_Info)
{
	npc = PAL_251_Oric;
	nr = 99;
	condition = DIA_Oric_Perm_Condition;
	information = DIA_Oric_Perm_Info;
	permanent = TRUE;
	description = "��� ��������?";
};


func int DIA_Oric_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Oric_HALLO) && (Kapitel <= 3))
	{
		return TRUE;
	};
};

func void DIA_Oric_Perm_Info()
{
	AI_Output(other,self,"DIA_Oric_Perm_15_00");	//��� ����������?
	if(MIS_ScoutMine == LOG_Running)
	{
		AI_Output(self,other,"DIA_Oric_Perm_11_01");	//�� ������ ����� ���������� � ��������, ������� � ��� ����. � ��� ����� �����, ��� � ����� �� ������ �������� ��� ������.
	}
	else if(MIS_ScoutMine == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Oric_Perm_11_02");	//�������� ���������� �� �������. �� �� �� ��������. ����� ������ � ����. �� ������� ��� �� ���� ������.
	}
	else
	{
		AI_Output(self,other,"DIA_Oric_Perm_11_03");	//���� ��������� ����� ������� � ��� �������.
		AI_Output(self,other,"DIA_Oric_Perm_11_04");	//�� ����� ���. ���, �������� � �������� - �� ��� �������� ����.
	};
};


instance DIA_Oric_KAP3_EXIT(C_Info)
{
	npc = PAL_251_Oric;
	nr = 999;
	condition = DIA_Oric_KAP3_EXIT_Condition;
	information = DIA_Oric_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Oric_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Oric_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Oric_KAP4_EXIT(C_Info)
{
	npc = PAL_251_Oric;
	nr = 999;
	condition = DIA_Oric_KAP4_EXIT_Condition;
	information = DIA_Oric_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Oric_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Oric_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Oric_IAmBack(C_Info)
{
	npc = PAL_251_Oric;
	nr = 4;
	condition = DIA_Oric_IAmBack_Condition;
	information = DIA_Oric_IAmBack_Info;
	description = "� ��� ��������.";
};


func int DIA_Oric_IAmBack_Condition()
{
	if((Kapitel >= 4) && Npc_KnowsInfo(other,DIA_Oric_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Oric_IAmBack_Info()
{
	AI_Output(other,self,"DIA_Oric_IAmBack_15_00");	//� ��� ��������.
	AI_Output(self,other,"DIA_Oric_IAmBack_11_01");	//� ��� �� ��������, ��� �� ��� �����-������ ������ ���� ����� ����, ��� ���������, ����� �� ��� ����� ��������� ���� �����.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Oric_IAmBack_11_02");	//� ����������� ���� �� ����� ������ ������.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Oric_IAmBack_11_03");	//� ����, �� ���� �����. ��� ��������.
	};
	AI_Output(self,other,"DIA_Oric_IAmBack_11_04");	//��������, ���� ��������� - ������ ����.
};


instance DIA_Oric_CanHelp(C_Info)
{
	npc = PAL_251_Oric;
	nr = 4;
	condition = DIA_Oric_CanHelp_Condition;
	information = DIA_Oric_CanHelp_Info;
	description = "���� � ���-������ ������?";
};


func int DIA_Oric_CanHelp_Condition()
{
	if((Kapitel >= 4) && Npc_KnowsInfo(other,DIA_Oric_IAmBack) && (MIS_KillHoshPak == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Oric_CanHelp_Info()
{
	AI_Output(other,self,"DIA_Oric_CanHelp_15_00");	//���� � ���-������ ������?
	AI_Output(self,other,"DIA_Oric_CanHelp_11_01");	//� ��������� ������, ������, �� ������� ���, ��� ���� ��������.
	AI_Output(self,other,"DIA_Oric_CanHelp_11_02");	//�������, ���� ���-���. ���-��� ����� ������, ��� �� ��� �� ������� ��� ��� �� ��������� ���� ����.
	AI_Output(self,other,"DIA_Oric_CanHelp_11_03");	//�� ��������� �������� ���� ������.
	Info_ClearChoices(DIA_Oric_CanHelp);
	Info_AddChoice(DIA_Oric_CanHelp,"� �����, ���� ����� �������� ����-������ ���. ",DIA_Oric_CanHelp_NotYourMan);
	Info_AddChoice(DIA_Oric_CanHelp,"��� �� ������ ���� �������?",DIA_Oric_CanHelp_WhatYouMean);
};

func void DIA_Oric_CanHelp_NotYourMan()
{
	AI_Output(other,self,"DIA_Oric_CanHelp_NotYourMan_15_00");	//� �����, ���� ����� �������� ����-������ ���.
	AI_Output(self,other,"DIA_Oric_CanHelp_NotYourMan_11_01");	//� �� ���� �������� �� ������ �������� - �� ���� ������������ �������.
};

func void DIA_Oric_CanHelp_WhatYouMean()
{
	AI_Output(other,self,"DIA_Oric_CanHelp_WhatYouMean_15_00");	//��� �� ������ ������� ����?
	AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_01");	//�� ����� ������ �� �� �������������. ��� ����� ���-���.
	AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_02");	//�� ���� �� ����� ����������� ������� �����.
	AI_Output(other,self,"DIA_Oric_CanHelp_WhatYouMean_15_03");	//� ������ � ���� ��� ����?
	AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_04");	//���� ���.
	AI_Output(other,self,"DIA_Oric_CanHelp_WhatYouMean_15_05");	//�� ������!?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_06");	//�� ������������, ���� �� ����� �������� ��� ����� ����. ��� ��������� ������ ����� �����.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_07");	//��� ������� ������� ���� �� ����, ������. �� �� ��� ������ ����� ��������� ��� ����� �������.
	}
	else
	{
		AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_08");	//�� ���� ������ ������ ���, ����� ���? ��, �����...
	};
	AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_09");	//������� ���-���� ��������� �� ������� ������, �� ����� � ��� ������.
	AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_10");	//�� ���� ����� �� ���� ����.
	Info_ClearChoices(DIA_Oric_CanHelp);
	OrikToldMissionChapter4 = TRUE;
};


instance DIA_Oric_NeedStuff(C_Info)
{
	npc = PAL_251_Oric;
	nr = 6;
	condition = DIA_Oric_NeedStuff_Condition;
	information = DIA_Oric_NeedStuff_Info;
	description = "��� ����� ����������.";
};


func int DIA_Oric_NeedStuff_Condition()
{
	if((OrikToldMissionChapter4 == TRUE) && (MIS_KillHoshPak == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Oric_NeedStuff_Info()
{
	AI_Output(other,self,"DIA_Oric_NeedStuff_15_00");	//��� ����� ����������.
	AI_Output(self,other,"DIA_Oric_NeedStuff_11_01");	//� ��� ���� ��� ��������, ��� �� ����� �� ���������� � �����.
	AI_Output(self,other,"DIA_Oric_NeedStuff_11_02");	//��, � ���� ���������� ���� ��� ���.
	Info_ClearChoices(DIA_Oric_NeedStuff);
	Info_AddChoice(DIA_Oric_NeedStuff,"��� 1 �������� ��������",DIA_Oric_NeedStuff_Dexterity);
	Info_AddChoice(DIA_Oric_NeedStuff,"��� 1 �������� ����",DIA_Oric_NeedStuff_Strength);
	Info_AddChoice(DIA_Oric_NeedStuff,"��� 3 �������� ����",DIA_Oric_NeedStuff_Mana);
	Info_AddChoice(DIA_Oric_NeedStuff,"3 �������� ��������",DIA_Oric_NeedStuff_Health);
};

func void DIA_Oric_NeedStuff_Health()
{
	AI_Output(other,self,"DIA_Oric_NeedStuff_Health_15_00");	//� ������ ��� �������� �����.
	AI_Output(self,other,"DIA_Oric_NeedStuff_Health_11_01");	//������� �����. �������, ��� ������� ����.
	CreateInvItems(self,ItPo_Health_03,3);
	B_GiveInvItems(self,other,ItPo_Health_03,3);
	Info_ClearChoices(DIA_Oric_NeedStuff);
};

func void DIA_Oric_NeedStuff_Mana()
{
	AI_Output(other,self,"DIA_Oric_NeedStuff_Mana_15_00");	//� ������ ��� ����� ����.
	AI_Output(self,other,"DIA_Oric_NeedStuff_Mana_11_01");	//�������, ��� ������� ����. �� ������ ���� �����.
	CreateInvItems(self,ItPo_Mana_03,3);
	B_GiveInvItems(self,other,ItPo_Health_03,3);
	Info_ClearChoices(DIA_Oric_NeedStuff);
};

func void DIA_Oric_NeedStuff_Strength()
{
	AI_Output(other,self,"DIA_Oric_NeedStuff_Strength_15_00");	//� ������ ������� ����.
	AI_Output(self,other,"DIA_Oric_NeedStuff_Strength_11_01");	//���, �� ��������� ���������� ����. � ����� ���� �����.
	CreateInvItems(self,ItPo_Perm_STR,1);
	B_GiveInvItems(self,other,ItPo_Perm_STR,1);
	Info_ClearChoices(DIA_Oric_NeedStuff);
};

func void DIA_Oric_NeedStuff_Dexterity()
{
	AI_Output(other,self,"DIA_Oric_NeedStuff_Dexterity_15_00");	//� ������ ������� ��������.
	AI_Output(self,other,"DIA_Oric_NeedStuff_Dexterity_11_01");	//����� ������ ���� ������ ����� ����� � ����. ���, �����.
	CreateInvItems(self,ItPo_Perm_DEX,1);
	B_GiveInvItems(self,other,ItPo_Perm_DEX,1);
	Info_ClearChoices(DIA_Oric_NeedStuff);
};


instance DIA_Oric_NoMurder(C_Info)
{
	npc = PAL_251_Oric;
	nr = 7;
	condition = DIA_Oric_NoMurder_Condition;
	information = DIA_Oric_NoMurder_Info;
	description = "� �� ���� ������� ���-���� ����� ������ �������.";
};


func int DIA_Oric_NoMurder_Condition()
{
	if((OrikToldMissionChapter4 == TRUE) && (MIS_KillHoshPak == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Oric_NoMurder_Info()
{
	AI_Output(other,self,"DIA_Oric_NoMurder_15_00");	//� �� ���� ������� ���-���� ����� ������ �������.
	AI_Output(self,other,"DIA_Oric_NoMurder_11_01");	//�� ���� �� ������������� ����, ��������� ������ ���� ���������?
	AI_Output(self,other,"DIA_Oric_NoMurder_11_02");	//��� �������� ������������� ���� �����. ���� ������ ��� �� ������.
	AI_Output(self,other,"DIA_Oric_NoMurder_11_03");	//���� �� �� ������ ��������� ��� ���� �� �������, ���� ��������� � ����� ��� ���� �����������.
	AI_Output(self,other,"DIA_Oric_NoMurder_11_04");	//���, ���� ���� �� �����, ������ ������.
};


instance DIA_Oric_WillHelp(C_Info)
{
	npc = PAL_251_Oric;
	nr = 5;
	condition = DIA_Oric_WillHelp_Condition;
	information = DIA_Oric_WillHelp_Info;
	permanent = FALSE;
	description = "������. � ���� ���-����.";
};


func int DIA_Oric_WillHelp_Condition()
{
	if((OrikToldMissionChapter4 == TRUE) && (MIS_KillHoshPak == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Oric_WillHelp_Info()
{
	AI_Output(other,self,"DIA_Oric_WillHelp_15_00");	//������. � ���� ���-����.
	AI_Output(self,other,"DIA_Oric_WillHelp_11_01");	//� ��� ������� ���.
	AI_Output(self,other,"DIA_Oric_WillHelp_11_02");	//������� ���-���� ��������� �� ��������� �����. ��, ������ ����, ��� ����� ��� ������.
	AI_Output(self,other,"DIA_Oric_WillHelp_11_03");	//���� ���� ����� ���������� �� ������, ������� � ����� �����. � ���� �������� ����.
	Log_CreateTopic(TOPIC_KillHoshPak,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KillHoshPak,LOG_Running);
	B_LogEntry(TOPIC_KillHoshPak,"���� �����, ����� � ���� ������ ����� ���-����. ��� ������� ��������� �� ��������� ����� �������� �� ������ ����� �����.");
	MIS_KillHoshPak = LOG_Running;
};


instance DIA_Oric_HoshDead(C_Info)
{
	npc = PAL_251_Oric;
	nr = 8;
	condition = DIA_Oric_HoshDead_Condition;
	information = DIA_Oric_HoshDead_Info;
	permanent = FALSE;
	description = "���-��� �����!";
};


func int DIA_Oric_HoshDead_Condition()
{
	if(Npc_IsDead(Hosh_Pak) && (MIS_KillHoshPak == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Oric_HoshDead_Info()
{
	AI_Output(other,self,"DIA_Oric_HoshDead_15_00");	//���-��� �����!
	AI_Output(self,other,"DIA_Oric_HoshDead_11_01");	//�������, ��� ����������� ������ ���� � ����� �����. ����� ����, � ��� ��� ��� ���� �����-�� �����.
	AI_Output(self,other,"DIA_Oric_HoshDead_11_02");	//� �����, ��� �������� ��� �������� ���������, �� ������� ����, �� ������.
	MIS_KillHoshPak = LOG_SUCCESS;
	B_GivePlayerXP(XP_KillHosh_Pak);
};


instance DIA_Oric_AnyNews(C_Info)
{
	npc = PAL_251_Oric;
	nr = 9;
	condition = DIA_Oric_AnyNews_Condition;
	information = DIA_Oric_AnyNews_Info;
	permanent = TRUE;
	description = "���� �������?";
};


func int DIA_Oric_AnyNews_Condition()
{
	if((Kapitel >= 4) && Npc_KnowsInfo(other,DIA_Oric_IAmBack))
	{
		return TRUE;
	};
};

func void DIA_Oric_AnyNews_Info()
{
	AI_Output(other,self,"DIA_Oric_AnyNews_15_00");	//���� �������?
	if(MIS_OCGateOpen == TRUE)
	{
		AI_Output(self,other,"DIA_Oric_AnyNews_11_01");	//�� ������ � ����, ����� ����, ��� ���� ��������� � �����?
	}
	else if(MIS_AllDragonsDead == TRUE)
	{
		AI_Output(self,other,"DIA_Oric_AnyNews_11_02");	//��. �� ��� �����. ���������� ���� �������� ����� - ��� �������� ����������� ������. � ��������!
	}
	else if(MIS_KillHoshPak == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Oric_AnyNews_11_03");	//����, ������, ������ �� ����� ������� ���-����.
	}
	else
	{
		AI_Output(self,other,"DIA_Oric_AnyNews_11_04");	//����� ���������� ��� ������ � ������. ��� ��� �� ��������.
	};
};


instance DIA_Oric_DragonPlettBericht(C_Info)
{
	npc = PAL_251_Oric;
	nr = 3;
	condition = DIA_Oric_DragonPlettBericht_Condition;
	information = DIA_Oric_DragonPlettBericht_Info;
	permanent = TRUE;
	description = "��� ����� ���������� � ��������.";
};


func int DIA_Oric_DragonPlettBericht_Condition()
{
	if((Kapitel >= 4) && Npc_KnowsInfo(other,DIA_Oric_IAmBack) && (MIS_AllDragonsDead == FALSE))
	{
		return TRUE;
	};
};


var int Oric_SwampdragonInfo_OneTime;
var int Oric_RockdragonInfo_OneTime;
var int Oric_FiredragonInfo_OneTime;
var int Oric_IcedragonInfo_OneTime;
var int Oric_DragonCounter;
var int Oric_FirstQuestion;

func void DIA_Oric_DragonPlettBericht_Info()
{
	AI_Output(other,self,"DIA_Oric_DragonPlettBericht_15_00");	//��� ����� ���������� � ��������.
	if(MIS_KilledDragons == 1)
	{
		AI_Output(other,self,"DIA_Oric_DragonPlettBericht_15_01");	//� ��� ���� ������ �� ���. �� ������ ������� ���, ��� ����� ������ ������?
	}
	else if(MIS_KilledDragons != 0)
	{
		AI_Output(other,self,"DIA_Oric_DragonPlettBericht_15_02");	//� ���� ���� �������, ��� � ���� ����� �� ���� ��������. �����, � ���-�� �������?
	};
	if(((Oric_DragonCounter < MIS_KilledDragons) || (Oric_FirstQuestion == FALSE)) && ((Oric_SwampdragonInfo_OneTime == FALSE) || (Oric_RockdragonInfo_OneTime == FALSE) || (Oric_FiredragonInfo_OneTime == FALSE) || (Oric_IcedragonInfo_OneTime == FALSE)))
	{
		if((Npc_IsDead(SwampDragon) == FALSE) && (Oric_SwampdragonInfo_OneTime == FALSE))
		{
			AI_Output(self,other,"DIA_Oric_DragonPlettBericht_11_03");	//��������� ���� ����� � ������ �� ������ ����� ��������� ������� ������. ��� �������� �������������, ���� ��� �� �������?
			B_LogEntry(TOPIC_DRACHENJAGD,"���� ��� ��� ����� � �����������: �� ��������� ��������� ���� � ������ �� ����� ������������ ������� ������. �� ������� ��� ����� ��������������.");
			Oric_SwampdragonInfo_OneTime = TRUE;
		}
		else if((Npc_IsDead(RockDragon) == FALSE) && (Oric_RockdragonInfo_OneTime == FALSE))
		{
			AI_Output(self,other,"DIA_Oric_DragonPlettBericht_11_04");	//�� ��� ��������� �������� � ������, ������ �� ��������.
			AI_Output(self,other,"DIA_Oric_DragonPlettBericht_11_05");	//���� ���������� �����������, ��� ��� �������� ������ ����������. ����� ����, ���� �� ��� ���������� ���.
			B_LogEntry(TOPIC_DRACHENJAGD,"���������� ��������� �������� �����, ��� �������� � ������ �� �������� �� ��� ������ ����������. ���� �����������, ��� ������ ��������� ���.");
			Oric_RockdragonInfo_OneTime = TRUE;
		}
		else if((Npc_IsDead(FireDragon) == FALSE) && (Oric_FiredragonInfo_OneTime == FALSE))
		{
			AI_Output(self,other,"DIA_Oric_DragonPlettBericht_11_06");	//����� �������� ��������� ��������, ���� �� ���, �� ������, ������� � ����������� ������� �� ���. ���� ����� �������� ��� ���.
			B_LogEntry(TOPIC_DRACHENJAGD,"��-��������, ���������� �������, ����������� �� ����� � ������ ��������, ������ ���������� �� �������.");
			Oric_FiredragonInfo_OneTime = TRUE;
		}
		else if((Npc_IsDead(IceDragon) == FALSE) && (Oric_IcedragonInfo_OneTime == FALSE))
		{
			AI_Output(self,other,"DIA_Oric_DragonPlettBericht_11_07");	//�� ������ ��������� �������� ������� ������. � �� ��������, ���� ���� �� �������� ���������� ���.
			B_LogEntry(TOPIC_DRACHENJAGD,"�������� ����������, ���������� �� �����, ����������� ����� �� ������ ����� ���� ������� �������.");
			Oric_IcedragonInfo_OneTime = TRUE;
		};
		Oric_DragonCounter = MIS_KilledDragons;
		Oric_FirstQuestion = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Oric_DragonPlettBericht_11_08");	//� ��������� ������ ��� ������ ������� ����.
	};
};


instance DIA_Oric_KAP5_EXIT(C_Info)
{
	npc = PAL_251_Oric;
	nr = 999;
	condition = DIA_Oric_KAP5_EXIT_Condition;
	information = DIA_Oric_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Oric_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Oric_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Oric_KAP6_EXIT(C_Info)
{
	npc = PAL_251_Oric;
	nr = 999;
	condition = DIA_Oric_KAP6_EXIT_Condition;
	information = DIA_Oric_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Oric_KAP6_EXIT_Condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Oric_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Oric_PICKPOCKET(C_Info)
{
	npc = PAL_251_Oric;
	nr = 900;
	condition = DIA_Oric_PICKPOCKET_Condition;
	information = DIA_Oric_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(������� ���� ������ ����� ��������� ������)";
};


func int DIA_Oric_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (other.attribute[ATR_DEXTERITY] >= (85 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Oric_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Oric_PICKPOCKET);
	Info_AddChoice(DIA_Oric_PICKPOCKET,Dialog_Back,DIA_Oric_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Oric_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Oric_PICKPOCKET_DoIt);
};

func void DIA_Oric_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 85)
	{
		B_GiveInvItems(self,other,ItSc_PalRepelEvil,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Oric_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Oric_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Oric_PICKPOCKET);
};

