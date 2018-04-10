
var int Morgan_Perm_Counter;

instance DIA_Addon_Morgan_EXIT(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 999;
	condition = DIA_Addon_Morgan_EXIT_Condition;
	information = DIA_Addon_Morgan_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Morgan_EXIT_Condition()
{
	return TRUE;
};

func int DIA_Addon_Morgan_EXIT_Info()
{
	if(GregIsBack == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Morgan_Perm_15_00");	//������ ������������ ����� ������.
		if(Morgan_Perm_Counter == 0)
		{
			AI_Output(self,other,"DIA_Addon_Morgan_Perm_07_01");	//�������� �����.
			Morgan_Perm_Counter = 1;
		}
		else if(Morgan_Perm_Counter == 1)
		{
			AI_Output(self,other,"DIA_Addon_Morgan_Perm_07_02");	//��� �, ��������� ����.
			Morgan_Perm_Counter = 2;
		}
		else if(Morgan_Perm_Counter == 2)
		{
			AI_Output(self,other,"DIA_Addon_Morgan_Perm_07_03");	//� �������� �������������.
			Morgan_Perm_Counter = 3;
		}
		else if(Morgan_Perm_Counter == 3)
		{
			AI_Output(self,other,"DIA_Addon_Morgan_Perm_07_04");	//������� ����, ���� ���-������ ����������.
			Morgan_Perm_Counter = 0;
		};
	};
	AI_StopProcessInfos(self);
	return TRUE;
};


instance DIA_Addon_Morgan_PICKPOCKET(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 900;
	condition = DIA_Addon_Morgan_PICKPOCKET_Condition;
	information = DIA_Addon_Morgan_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Addon_Morgan_PICKPOCKET_Condition()
{
	return C_Beklauen(20,43);
};

func void DIA_Addon_Morgan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Morgan_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Morgan_PICKPOCKET,Dialog_Back,DIA_Addon_Morgan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Morgan_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Morgan_PICKPOCKET_DoIt);
};

func void DIA_Addon_Morgan_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Morgan_PICKPOCKET);
};

func void DIA_Addon_Morgan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Morgan_PICKPOCKET);
};


instance DIA_Addon_Morgan_Anheuern(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 1;
	condition = DIA_Addon_Morgan_Anheuern_Condition;
	information = DIA_Addon_Morgan_Anheuern_Info;
	important = TRUE;
};


func int DIA_Addon_Morgan_Anheuern_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (GregIsBack == TRUE))
	{
		return TRUE;
	};
};

func int DIA_Addon_Morgan_Anheuern_Info()
{
	AI_Output(self,other,"DIA_Addon_Morgan_Anheuern_07_00");	//������������! ������ ���� �������� ���� ������ �����!
	if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Anheuern_07_01");	//����� � ���������� ��������!
	};
	return TRUE;
};


instance DIA_Addon_Morgan_Hello(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 1;
	condition = DIA_Addon_Morgan_Hello_Condition;
	information = DIA_Addon_Morgan_Hello_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Morgan_Hello_Condition()
{
	if((MIS_AlligatorJack_BringMeat == FALSE) && Npc_IsInState(self,ZS_Talk) && (Npc_IsDead(AlligatorJack) == FALSE) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Morgan_Hello_Info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_Hello_15_00");	//��, ��!
	AI_Output(self,other,"DIA_Addon_Morgan_Hello_07_01");	//�? ��� ���� �����?
	AI_Output(self,other,"DIA_Addon_Morgan_Hello_07_02");	//��������� ���� ��� ��������?
	AI_Output(self,other,"DIA_Addon_Morgan_Hello_07_03");	//���? ��, ������, ����� ��������. �������� ����.
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Morgan_Meat(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 2;
	condition = DIA_Addon_Morgan_Meat_Condition;
	information = DIA_Addon_Morgan_Meat_Info;
	description = "� ������ ����.";
};


func int DIA_Addon_Morgan_Meat_Condition()
{
	if((MIS_AlligatorJack_BringMeat == LOG_Running) && (Npc_HasItems(other,ItFoMuttonRaw) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Morgan_Meat_Info()
{
	var int GivenMeat;
	AI_Output(other,self,"DIA_Addon_Morgan_Meat_15_00");	//� ������ ����.
	if(GregIsBack == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Meat_07_01");	//�-�-�. ��� ����� �������� ����, ����� ����������.
		CreateInvItems(self,ItFo_Booze,3);
		B_UseItem(self,ItFo_Booze);
		AI_Output(self,other,"DIA_Addon_Morgan_Meat_07_02");	//���-�� �����. ��� ���, ��� �� �����?
		AI_Output(other,self,"DIA_Addon_Morgan_Meat_15_03");	//� ������ ����. �� ���������� �����.
	};
	AI_Output(self,other,"DIA_Addon_Morgan_Meat_07_04");	//�����! � ��������! ����! ����� ��� ����.
	GivenMeat = Npc_HasItems(other,ItFoMuttonRaw);
	if(GivenMeat > 10)
	{
		GivenMeat = 10;
	};
	B_GiveInvItems(other,self,ItFoMuttonRaw,GivenMeat);
	if(GivenMeat < 10)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Meat_07_05");	//��� ���? ���������, ��������, ��� ����? �� �����...
	};
	B_LogEntry(TOPIC_Addon_BringMeat,"� ������ ���� �������.");
	MIS_AlligatorJack_BringMeat = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_AlligatorJAck_BringMeat);
};


instance DIA_Addon_Morgan_Job(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 3;
	condition = DIA_Addon_Morgan_Job_Condition;
	information = DIA_Addon_Morgan_Job_Info;
	description = "��� �� ������� �����?";
};


func int DIA_Addon_Morgan_Job_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Morgan_Meat))
	{
		return TRUE;
	};
};

func void DIA_Addon_Morgan_Job_Info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_Job_15_01");	//��� �� ����� �������?
	AI_Output(self,other,"DIA_Addon_Morgan_Job_07_01");	//���� �������� ���� ���������� ������ �� ������ �������.
	AI_Output(self,other,"DIA_Addon_Morgan_Job_07_02");	//� ������� �� ��������� ������. ���� ��� ���������� ��������� ����.
	AI_Output(self,other,"DIA_Addon_Morgan_Job_07_03");	//��� � ����� �� ���, ����� � ������ �� ��������� ����� �����, ������� ��� �����.
	AI_Output(self,other,"DIA_Addon_Morgan_Job_07_04");	//�� ���� ������ ��� �����.
	if(GregIsBack == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Job_07_05");	//� ������ ��, ��� � ����������� ����� ����� �� ������ ���� �� ������ �����.
	};
};


instance DIA_Addon_Morgan_Sleep(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 4;
	condition = DIA_Addon_Morgan_Sleep_Condition;
	information = DIA_Addon_Morgan_Sleep_Info;
	description = "� ��� �� ���-������ �������?";
};


func int DIA_Addon_Morgan_Sleep_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Morgan_Job))
	{
		return TRUE;
	};
};

func void DIA_Addon_Morgan_Sleep_Info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_Sleep_15_00");	//� ��� �� ���-������ �������?
	AI_Output(self,other,"DIA_Addon_Morgan_Sleep_07_01");	//�� ��� ��� �� ���������?!
	AI_Output(self,other,"DIA_Addon_Morgan_Sleep_07_02");	//�� ��� ������ ����� ����� ������.
	AI_Output(self,other,"DIA_Addon_Morgan_Sleep_07_03");	//� ������ ����� �����.
	AI_Output(self,other,"DIA_Addon_Morgan_Sleep_07_04");	//� ����� �� ��� ������ � ����� �������� ������, ������� �����-���� ������ ��� ����.
	AI_Output(self,other,"DIA_Addon_Morgan_Sleep_07_05");	//�� ��� �� �� ���, ��� ������� ���� �� �������.
	AI_Output(self,other,"DIA_Addon_Morgan_Sleep_07_06");	//�� ���� ���� ��� �������� ���������� ��� ������.
};


instance DIA_Addon_Morgan_JoinMorgan(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 5;
	condition = DIA_Addon_Morgan_JoinMorgan_Condition;
	information = DIA_Addon_Morgan_JoinMorgan_Info;
	description = "� ���� �������� � ���� �����.";
};


func int DIA_Addon_Morgan_JoinMorgan_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Morgan_Sleep) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Morgan_JoinMorgan_Info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_JoinMorgan_15_00");	//� ���� �������� � ���� �����.
	AI_Output(self,other,"DIA_Addon_Morgan_JoinMorgan_07_01");	//��� �����? ��� ����� ������ �������� �� �����.
	AI_Output(self,other,"DIA_Addon_Morgan_JoinMorgan_07_03");	//��� ����� � ����� �� ������ �� ��� ���, ���� ������� �� ��������. ��� � ���� ����� ������.
	AI_Output(self,other,"DIA_Addon_Morgan_JoinMorgan_07_04");	//�� ���� �� ������ �������� ���� ���������, �� ���� �� ������, �� ������ �� �������� ����.
	AI_Output(self,other,"DIA_Addon_Morgan_JoinMorgan_07_05");	//��� ����� ��������... � ���� �����, ���� ���.
	AI_Output(self,other,"DIA_Addon_Morgan_JoinMorgan_07_06");	//��������� � ����, � �� ����������� �������� �����...
	AI_Output(self,other,"DIA_Addon_Morgan_JoinMorgan_07_07");	//����� ���������� � ��� �����. ��-��. � � ���� ��� ������...
	Log_CreateTopic(TOPIC_Addon_MorganBeach,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MorganBeach,LOG_Running);
	B_LogEntry(TOPIC_Addon_MorganBeach,"� ������������� � ������ ������ �������. �� �����, ����� � ������� �������� ���� �� ��������.");
	MIS_Addon_MorganLurker = LOG_Running;
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Morgan_LurkerPlatt(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 6;
	condition = DIA_Addon_Morgan_LurkerPlatt_Condition;
	information = DIA_Addon_Morgan_LurkerPlatt_Info;
	permanent = TRUE;
	description = "�� �������� ����� ������ ���������.";
};


func int DIA_Addon_Morgan_LurkerPlatt_Condition()
{
	if(Npc_IsDead(BeachLurker1) && Npc_IsDead(BeachLurker2) && Npc_IsDead(BeachLurker3) && Npc_IsDead(BeachWaran1) && Npc_IsDead(BeachWaran2) && (MIS_Addon_MorganLurker == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Morgan_LurkerPlatt_Info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_LurkerPlatt_15_00");	//�� �������� ����� ������ ���������.
	AI_Output(self,other,"DIA_Addon_Morgan_LurkerPlatt_07_01");	//� ������? ��� �� ���� �������?
	if(Npc_IsDead(BeachShadowbeast1))
	{
		AI_Output(other,self,"DIA_Addon_Morgan_LurkerPlatt_15_02");	//�������.
		AI_Output(self,other,"DIA_Addon_Morgan_LurkerPlatt_07_03");	//�������. �� ������� �������.
		AI_Output(self,other,"DIA_Addon_Morgan_LurkerPlatt_07_04");	//��� ���� �������.
		CreateInvItems(self,ItMi_Gold,150);
		B_GiveInvItems(self,other,ItMi_Gold,150);
		B_LogEntry(TOPIC_Addon_MorganBeach,"��� �������� �� ����� �����.");
		MIS_Addon_MorganLurker = LOG_SUCCESS;
		B_GivePlayerXP(XP_Addon_Morgan_LurkerPlatt);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Morgan_LurkerPlatt_15_05");	//�-�-�...
		AI_Output(self,other,"DIA_Addon_Morgan_LurkerPlatt_07_06");	//��� ���� ����� ������ �������. �����������, ����� ���������.
		B_LogEntry(TOPIC_Addon_MorganBeach,"������ �������� ���� �������� �������.");
		AI_StopProcessInfos(self);
	};
};


instance DIA_Addon_Morgan_Auftrag2(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 99;
	condition = DIA_Addon_Morgan_Auftrag2_Condition;
	information = DIA_Addon_Morgan_Auftrag2_Info;
	permanent = TRUE;
	description = "��� ���� ���� ��� �����-������ �������?";
};


func int DIA_Addon_Morgan_Auftrag2_Condition()
{
	if(MIS_Addon_MorganLurker == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Addon_Morgan_Auftrag2_Info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_Auftrag2_15_00");	//��� ���� ���� ��� �����-������ ������?
	if(GregIsBack == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Auftrag2_07_01");	//���� ���.
		AI_Output(self,other,"DIA_Addon_Morgan_Auftrag2_07_02");	//�������, ������, ����� ����!
		CreateInvItems(self,ItFo_Booze,3);
		B_UseItem(self,ItFo_Booze);
		AI_Output(self,other,"DIA_Addon_Morgan_Auftrag2_07_03");	//��������� ���������� ����!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Auftrag2_07_04");	//���� ����� �������� ��������.
	};
	AI_StopProcessInfos(self);
};


var int Morgan_AngusStory;

instance DIA_Addon_Morgan_FOUNDTHEM(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 7;
	condition = DIA_Addon_Morgan_FOUNDTHEM_Condition;
	information = DIA_Addon_Morgan_FOUNDTHEM_Info;
	permanent = TRUE;
	description = "������ ������ � �����...";
};


func int DIA_Addon_Morgan_FOUNDTHEM_Condition()
{
	if((MIS_Addon_Morgan_SeekTraitor != LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_Addon_Skip_AngusHank))
	{
		return TRUE;
	};
};

func void DIA_Addon_Morgan_FOUNDTHEM_Info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_FOUNDTHEM_15_00");	//������ ����� � ������...
	if(Morgan_AngusStory == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_01");	//�� ��������� ��� � ���.
		AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_02");	//��������� ��� ������ � ���� ��������.
		AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_03");	//� � ������ ���� ��� ������.
		AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_04");	//���, �������, ��� ���� ��� ��� ������. �� ������� ��� � ���� � �����.
		AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_05");	//�� � �� ����������� ���������. � ������ ��� ������� ��������!
		Morgan_AngusStory = TRUE;
	};
	Info_ClearChoices(DIA_Addon_Morgan_FOUNDTHEM);
	if(Npc_HasItems(other,ItRi_Addon_MorgansRing_Mission) > 0)
	{
		Info_AddChoice(DIA_Addon_Morgan_FOUNDTHEM,"� �� �����.",DIA_Addon_Morgan_FOUNDTHEM_Now);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_06");	//���� ������� ��� ������, ������� ��� ���. � ���� �������� �������!
	};
};

func void DIA_Addon_Morgan_FOUNDTHEM_Now()
{
	AI_Output(other,self,"DIA_Addon_Morgan_FOUNDTHEM_15_01");	//� ����� ��.
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_07");	//��, ������. ��� � ����?
	AI_Output(other,self,"DIA_Addon_Morgan_FOUNDTHEM_15_03");	//��� ������.
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_08");	//� ������? ��� � �������?
	Info_ClearChoices(DIA_Addon_Morgan_FOUNDTHEM);
	Info_AddChoice(DIA_Addon_Morgan_FOUNDTHEM,"��� ���.",DIA_Addon_Morgan_FOUNDTHEM_GiveRing);
	Info_AddChoice(DIA_Addon_Morgan_FOUNDTHEM,"� ��� ��� �� ����.",DIA_Addon_Morgan_FOUNDTHEM_NoRing);
};

func void DIA_Addon_Morgan_FOUNDTHEM_NoRing()
{
	AI_Output(other,self,"DIA_Addon_Morgan_FOUNDTHEM_NoRing_15_00");	//� ��� ��� �� ����.
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_NoRing_07_01");	//���? ����������� � ����� �������. ��� ������ ���� ���� � ������.
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_NoRing_07_02");	//��� ��������� ������, ���������� �������� �������. 
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_NoRing_07_03");	//�� ������ ����� ���! ������!
	Info_ClearChoices(DIA_Addon_Morgan_FOUNDTHEM);
};

func void DIA_Addon_Morgan_FOUNDTHEM_GiveRing()
{
	AI_Output(other,self,"DIA_Addon_Morgan_FOUNDTHEM_GiveRing_15_00");	//��� ���.
	B_GiveInvItems(other,self,ItRi_Addon_MorgansRing_Mission,1);
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_GiveRing_07_01");	//��, ��� ���! ������� ����!
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_GiveRing_07_02");	//���, ������ ��� �������� ��������. ��������, ��� �� ������ ������ � ����������, �� ������ ���� �� ��� ������ ��������.
	MIS_Addon_Morgan_SeekTraitor = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_MorgansRing);
	Info_ClearChoices(DIA_Addon_Morgan_FOUNDTHEM);
	B_GiveInvItems(self,other,ItWr_StonePlateCommon_Addon,1);
};


instance DIA_Addon_Morgan_Francis(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 5;
	condition = DIA_Addon_Morgan_Francis_Condition;
	information = DIA_Addon_Morgan_Francis_Info;
	description = "��� �� ������� � ��������?";
};


func int DIA_Addon_Morgan_Francis_Condition()
{
	if(Francis_ausgeschissen == FALSE)
	{
		if(Npc_KnowsInfo(other,DIA_Addon_Skip_GregsHut) || (Francis.aivar[AIV_TalkedToPlayer] == TRUE))
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Morgan_Francis_Info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_Francis_15_00");	//��� �� ������� � ��������?
	AI_Output(self,other,"DIA_Addon_Morgan_Francis_07_01");	//� ������ �� ���� ������ ����, ���� �� �� ��� �� �����!
	AI_Output(other,self,"DIA_Addon_Morgan_Francis_15_02");	//�� ����� ���������?
	AI_Output(self,other,"DIA_Addon_Morgan_Francis_07_03");	//�� ������, ��� �� �������.
	AI_Output(self,other,"DIA_Addon_Morgan_Francis_07_04");	//�� ����� �������� ����, ������� ����� �������� ����� ������� ������� - �������� �����.
};


instance DIA_Addon_Morgan_TRAIN(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 5;
	condition = DIA_Addon_Morgan_TRAIN_Condition;
	information = DIA_Addon_Morgan_TRAIN_Info;
	description = "�� ������ ������� � ����?";
};


func int DIA_Addon_Morgan_TRAIN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Morgan_Sleep))
	{
		return TRUE;
	};
};

func void DIA_Addon_Morgan_TRAIN_Info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_TRAIN_15_00");	//� ���� �� ������ ����-������ �������?
	AI_Output(self,other,"DIA_Addon_Morgan_TRAIN_07_01");	//�������. � ���� �������� ���� ������ ���������� ���������� �������.
	Log_CreateTopic(Topic_Addon_PIR_Teacher,LOG_NOTE);
	B_LogEntry(Topic_Addon_PIR_Teacher,Log_Text_Addon_MorganTeach);
	Morgan_Addon_TeachPlayer = TRUE;
};


var int Morgan_merke1h;
var int Morgan_Labercount;

instance DIA_Addon_Morgan_Teach(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 99;
	condition = DIA_Addon_Morgan_Teach_Condition;
	information = DIA_Addon_Morgan_Teach_Info;
	permanent = TRUE;
	description = "��� ����!";
};


func int DIA_Addon_Morgan_Teach_Condition()
{
	if(Morgan_Addon_TeachPlayer == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Morgan_Teach_Info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_Teach_15_00");	//� ����� �������!
	Morgan_merke1h = other.HitChance[NPC_TALENT_1H];
	Info_ClearChoices(DIA_Addon_Morgan_Teach);
	Info_AddChoice(DIA_Addon_Morgan_Teach,Dialog_Back,DIA_Addon_Morgan_Teach_Back);
	Info_AddChoice(DIA_Addon_Morgan_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Addon_Morgan_Teach_1H_1);
	Info_AddChoice(DIA_Addon_Morgan_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,1) * 5),DIA_Addon_Morgan_Teach_1H_5);
};

func void DIA_Addon_Morgan_Teach_Back()
{
	if(other.HitChance[NPC_TALENT_1H] > Morgan_merke1h)
	{
		if(Morgan_Labercount == 0)
		{
			AI_Output(self,other,"DIA_Addon_Morgan_CommentFightSkill_07_00");	//����, ������ ��� ��� ������ ������ ����� � ����� �������. ���� �� �������� �����, ���� �� ����.
			Morgan_Labercount = 1;
		}
		else if(Morgan_Labercount == 1)
		{
			AI_Output(self,other,"DIA_Addon_Morgan_CommentFightSkill_07_01");	//�� ��������� ���������� ������ ���� � ���� �����.
			Morgan_Labercount = 2;
		}
		else if(Morgan_Labercount == 2)
		{
			AI_Output(self,other,"DIA_Addon_Morgan_CommentFightSkill_07_02");	//��-��. ��, ������ �� ���� �� ������, � ����� ������� ������� �� ���.
			Morgan_Labercount = 0;
		};
	}
	else if(other.HitChance[NPC_TALENT_1H] >= 75)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Teach_Back_07_00");	//���� �� ������ ����� ��� �����, �� ������ ����� ����� �������� �������.
	};
	Info_ClearChoices(DIA_Addon_Morgan_Teach);
};

func void DIA_Addon_Morgan_Teach_1H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,75);
	Info_ClearChoices(DIA_Addon_Morgan_Teach);
	Info_AddChoice(DIA_Addon_Morgan_Teach,Dialog_Back,DIA_Addon_Morgan_Teach_Back);
	Info_AddChoice(DIA_Addon_Morgan_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Addon_Morgan_Teach_1H_1);
	Info_AddChoice(DIA_Addon_Morgan_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,1) * 5),DIA_Addon_Morgan_Teach_1H_5);
};

func void DIA_Addon_Morgan_Teach_1H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,75);
	Info_ClearChoices(DIA_Addon_Morgan_Teach);
	Info_AddChoice(DIA_Addon_Morgan_Teach,Dialog_Back,DIA_Addon_Morgan_Teach_Back);
	Info_AddChoice(DIA_Addon_Morgan_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Addon_Morgan_Teach_1H_1);
	Info_AddChoice(DIA_Addon_Morgan_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,1) * 5),DIA_Addon_Morgan_Teach_1H_5);
};

