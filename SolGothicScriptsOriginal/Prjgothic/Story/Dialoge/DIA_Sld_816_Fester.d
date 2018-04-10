
instance DIA_Fester_EXIT(C_Info)
{
	npc = Sld_816_Fester;
	nr = 999;
	condition = DIA_Fester_EXIT_Condition;
	information = DIA_Fester_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Fester_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Fester_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Fester_Hello(C_Info)
{
	npc = Sld_816_Fester;
	nr = 1;
	condition = DIA_Fester_Hello_Condition;
	information = DIA_Fester_Hello_Info;
	permanent = FALSE;
	description = "��� �� ������� �����?";
};


func int DIA_Fester_Hello_Condition()
{
	return TRUE;
};

func void DIA_Fester_Hello_Info()
{
	AI_Output(other,self,"DIA_Fester_Hello_15_00");	//��� �� ������� �����?
	AI_Output(self,other,"DIA_Fester_Hello_08_01");	//� ��������� � ���...
};


instance DIA_Fester_Auftrag(C_Info)
{
	npc = Sld_816_Fester;
	nr = 2;
	condition = DIA_Fester_Auftrag_Condition;
	information = DIA_Fester_Auftrag_Info;
	permanent = FALSE;
	description = "������?";
};


func int DIA_Fester_Auftrag_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Fester_Hello))
	{
		return TRUE;
	};
};

func void DIA_Fester_Auftrag_Info()
{
	AI_Output(other,self,"DIA_Fester_Auftrag_15_00");	//�����?
	AI_Output(self,other,"DIA_Fester_Auftrag_08_01");	//��������� ����� � �������� ��� ������ � �������� ���������.
	AI_Output(self,other,"DIA_Fester_Auftrag_08_02");	//���������� �������� ��� ����� ���� �����.
	AI_Output(self,other,"DIA_Fester_Auftrag_08_03");	//� ���� ������ ���� �� ����� ����� ������� ��������. ��� �� ������ ��������� ��� ������.
	AI_Output(self,other,"DIA_Fester_Auftrag_08_04");	//� � ���� ���� ��� ����. ������ �� �����, ����� � ����� ��������� ������ ���� ������.
	AI_Output(self,other,"DIA_Fester_Auftrag_08_05");	//� ��������� �������� ��� ������ ������, ������� ��� ������ ��� ���...
};


instance DIA_Fester_YouFight(C_Info)
{
	npc = Sld_816_Fester;
	nr = 3;
	condition = DIA_Fester_YouFight_Condition;
	information = DIA_Fester_YouFight_Info;
	permanent = FALSE;
	description = "�� ������� ����?";
};


func int DIA_Fester_YouFight_Condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE) && Npc_KnowsInfo(other,DIA_Fester_Hello) && (MIS_Fester_KillBugs == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Fester_YouFight_Info()
{
	AI_Output(other,self,"DIA_Fester_YouFight_15_00");	//�� ������� ����?
	AI_Output(self,other,"DIA_Fester_YouFight_08_01");	//� ������� ���� ���������� � �����, � ��� ��� ������ ��� �����! � ������ �� �����������?
};


instance DIA_Fester_WoNest(C_Info)
{
	npc = Sld_816_Fester;
	nr = 4;
	condition = DIA_Fester_WoNest_Condition;
	information = DIA_Fester_WoNest_Info;
	permanent = FALSE;
	description = "��� ��� ������?";
};


func int DIA_Fester_WoNest_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Fester_Auftrag) && (MIS_Fester_KillBugs == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Fester_WoNest_Info()
{
	AI_Output(other,self,"DIA_Fester_WoNest_15_00");	//��� ��� ������?
	AI_Output(self,other,"DIA_Fester_WoNest_08_01");	//� ������ ���� ��� ���, ��� � ��� ������� �����.
};


var int Fester_Choice;
const int FC_Gold = 0;
const int FC_Join = 1;

instance DIA_Fester_Together(C_Info)
{
	npc = Sld_816_Fester;
	nr = 5;
	condition = DIA_Fester_Together_Condition;
	information = DIA_Fester_Together_Info;
	permanent = FALSE;
	description = "�� ����� ��  ��������� ��� ������ ������...";
};


func int DIA_Fester_Together_Condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE) && Npc_KnowsInfo(other,DIA_Fester_Auftrag))
	{
		return TRUE;
	};
};

func void DIA_Fester_Together_Info()
{
	AI_Output(other,self,"DIA_Fester_Together_15_00");	//�� ����� ��  ��������� ��� ������ ������...
	AI_Output(self,other,"DIA_Fester_Together_08_01");	//�� ������ ������ ���? ������?
	Info_ClearChoices(DIA_Fester_Together);
	Info_AddChoice(DIA_Fester_Together,"� ���� �������� �� ��� ������!",DIA_Fester_Together_Gold);
	if(hero.guild == GIL_NONE)
	{
		Info_AddChoice(DIA_Fester_Together,"� ���� �������������� � ���!",DIA_Fester_Together_Join);
	};
};

func void DIA_Fester_Together_Join()
{
	AI_Output(other,self,"DIA_Fester_Together_Join_15_00");	//� ���� �������������� � ���!
	AI_Output(self,other,"DIA_Fester_Together_Join_08_01");	//��, ����� �����. �� ������ ��������, ��� �� ������� ����...
	AI_Output(self,other,"DIA_Fester_Together_Join_08_02");	//(������) ������, ����� ����������� � ����� ������� ������.
	Fester_Choice = FC_Join;
	Info_ClearChoices(DIA_Fester_Together);
};

func void DIA_Fester_Together_Gold()
{
	AI_Output(other,self,"DIA_Fester_Together_Gold_15_00");	//� ���� �������� �� ��� ������!
	AI_Output(self,other,"DIA_Fester_Together_Gold_08_01");	//(�������) �� �� �������! �� ������ ��������������� ���� ����������, ��?
	AI_Output(self,other,"DIA_Fester_Together_Gold_08_02");	//�� ����, ���� � ������� ����, ���� ���������� � ��������?
	AI_Output(self,other,"DIA_Fester_Together_Gold_08_03");	//������. � ���� ��������� ���� 50 ������� - ��� ���, ��� � ���� ����.
	Fester_Choice = FC_Gold;
	Info_ClearChoices(DIA_Fester_Together);
};


var int Fester_Losgeh_Day;

instance DIA_Fester_TogetherNOW(C_Info)
{
	npc = Sld_816_Fester;
	nr = 6;
	condition = DIA_Fester_TogetherNOW_Condition;
	information = DIA_Fester_TogetherNOW_Info;
	permanent = TRUE;
	description = "����� ��������� ������!";
};


func int DIA_Fester_TogetherNOW_Condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE) && Npc_KnowsInfo(other,DIA_Fester_Together) && (MIS_Fester_KillBugs == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Fester_TogetherNOW_Info()
{
	AI_Output(other,self,"DIA_Fester_TogetherNOW_15_00");	//����� ��������� ������!
	if(Wld_IsTime(20,30,6,0))
	{
		AI_Output(self,other,"DIA_Fester_TogetherNOW_08_01");	//� �������? ���, ��� ����� ��������� ��������.
	}
	else
	{
		AI_Output(self,other,"DIA_Fester_TogetherNOW_08_02");	//����� ������? � �����, ���� ������� ��������� ���������� �������?
		AI_Output(self,other,"DIA_Fester_TogetherNOW_08_03");	//�� ��� �� ������� ������� �� �����...
		Info_ClearChoices(DIA_Fester_TogetherNOW);
		Info_AddChoice(DIA_Fester_TogetherNOW,"������, ����� �������� ��� �������...",DIA_Fester_TogetherNOW_Later);
		Info_AddChoice(DIA_Fester_TogetherNOW,"������ �����������, ��� ������, �� �����.",DIA_Fester_TogetherNOW_NOW);
	};
};

func void DIA_Fester_TogetherNOW_NOW()
{
	AI_Output(other,self,"DIA_Fester_TogetherNOW_Now_15_00");	//������ �����������, ��� ������, �� �����.
	AI_Output(self,other,"DIA_Fester_TogetherNOW_Now_08_01");	//������, ����� ���������, �� ��� �� ��������.
	Npc_ExchangeRoutine(self,"GUIDE");
	Fester_Losgeh_Day = B_GetDayPlus();
	MIS_Fester_KillBugs = LOG_Running;
	Log_CreateTopic(TOPIC_FesterRauber,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FesterRauber,LOG_Running);
	B_LogEntry(TOPIC_FesterRauber,"� ��������� ��������� ������ ������� �������� ������ � ��������.");
	Info_ClearChoices(DIA_Fester_TogetherNOW);
	AI_StopProcessInfos(self);
};

func void DIA_Fester_TogetherNOW_Later()
{
	AI_Output(other,self,"DIA_Fester_TogetherNOW_Later_15_00");	//������, ����� �������� ��� �������...
	AI_Output(self,other,"DIA_Fester_TogetherNOW_Later_08_01");	//�� ������, ��� ����� ����...
	Info_ClearChoices(DIA_Fester_TogetherNOW);
};


instance DIA_Fester_InCave(C_Info)
{
	npc = Sld_816_Fester;
	nr = 7;
	condition = DIA_Fester_InCave_Condition;
	information = DIA_Fester_InCave_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Fester_InCave_Condition()
{
	if((MIS_Fester_KillBugs == LOG_Running) && (Npc_GetDistToWP(self,"NW_BIGFARM_FELDREUBER4") <= 500))
	{
		self.aivar[AIV_LastFightComment] = TRUE;
		return TRUE;
	};
};

func void DIA_Fester_InCave_Info()
{
	if(Wld_GetDay() > Fester_Losgeh_Day)
	{
		AI_Output(self,other,"DIA_Fester_InCave_08_00");	//��� �� ������, ���� ���� ������?
	}
	else
	{
		AI_Output(self,other,"DIA_Fester_InCave_08_01");	//��� ��� ���� ��� �������� ������� ��������. ����� ��������.
	};
	AI_Output(self,other,"DIA_Fester_InCave_08_02");	//������, ��� ��� ������� ����� ����������.
	AI_Output(self,other,"DIA_Fester_InCave_08_03");	//������ �����!
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
};


instance DIA_Fester_WasMitAbmachung(C_Info)
{
	npc = Sld_816_Fester;
	nr = 8;
	condition = DIA_Fester_WasMitAbmachung_Condition;
	information = DIA_Fester_WasMitAbmachung_Info;
	permanent = FALSE;
	description = "��� ������ ������ ����������?";
};


func int DIA_Fester_WasMitAbmachung_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Fester_InCave))
	{
		return TRUE;
	};
};

func void DIA_Fester_WasMitAbmachung_Info()
{
	AI_Output(other,self,"DIA_Fester_WasMitAbmachung_15_00");	//��� ������ ������ ����������?
	if(Festers_Giant_Bug_Killed == 0)
	{
		AI_Output(self,other,"DIA_Fester_WasMitAbmachung_08_01");	//�� ������? �� �� ������ ������ �� �����.
	}
	else if(Fester_Choice == FC_Join)
	{
		AI_Output(self,other,"DIA_Fester_WasMitAbmachung_08_02");	//� ��� �� ������ ���� �������� � ���� ����, �� � �� ���� ������ �����.
		AI_Output(other,self,"DIA_Fester_WasMitAbmachung_15_03");	//������?
		AI_Output(self,other,"DIA_Fester_WasMitAbmachung_08_04");	//���� � ����� ����-������, ��� �� ����� ���, ��� ����� ��� ����� �������.
		AI_Output(self,other,"DIA_Fester_WasMitAbmachung_08_05");	//�� ���������, ��� ����� ����������� ���� �� ������������?
		AI_Output(self,other,"DIA_Fester_WasMitAbmachung_08_06");	//���� �� �������, ������. �� � ������, �� ������� ����-������ ���, ��� ������� ����.
	}
	else
	{
		AI_Output(self,other,"DIA_Fester_WasMitAbmachung_08_07");	//�� - �� ����� ��������������� ���� ����������. � ������ � ������������ �����.
		AI_Output(self,other,"DIA_Fester_WasMitAbmachung_08_08");	//�������� ��������� �� ��� ���� � ����������: �� ������� ����. � ��� ���-�� �� ������, ����� ���?
	};
	MIS_Fester_KillBugs = LOG_OBSOLETE;
	Wld_InsertNpc(Giant_Bug,"NW_BIGFARM01_RIGHTFIELD_02_MONSTER");
	Wld_InsertNpc(Giant_Bug,"NW_BIGFARM01_RIGHTFIELD_02_MONSTER");
	Wld_InsertNpc(Giant_Bug,"NW_BIGFARM01_RIGHTFIELD_02_MONSTER");
	Wld_InsertNpc(Giant_Bug,"NW_BIGMILL_FIELD_MONSTER_04");
	Wld_InsertNpc(Giant_Bug,"NW_BIGMILL_FIELD_MONSTER_04");
};


var int Fester_Duell_Day;
var int Fester_FightVerarscht;
var int Fester_FightSylvio;

instance DIA_Fester_PERMPruegel(C_Info)
{
	npc = Sld_816_Fester;
	nr = 9;
	condition = DIA_Fester_PERMPruegel_Condition;
	information = DIA_Fester_PERMPruegel_Info;
	permanent = TRUE;
	description = "� �����, ���� �� �������� ��� ���� ������.";
};


func int DIA_Fester_PERMPruegel_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Fester_WasMitAbmachung) || Npc_KnowsInfo(other,DIA_Jarvis_MissionKO) || (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE))
	{
		return TRUE;
	};
};

func void DIA_Fester_PERMPruegel_Info()
{
	var int random;
	AI_Output(other,self,"DIA_Fester_PERMPruegel_15_00");	//� �����, ���� �� �������� ��� ���� ������.
	if(Fester_Duell_Day < Wld_GetDay())
	{
		random = Hlp_Random(11);
		CreateInvItems(self,ItMi_Gold,random);
		Fester_Duell_Day = Wld_GetDay();
	};
	if(Npc_KnowsInfo(other,DIA_Fester_WasMitAbmachung) && (Fester_FightVerarscht == FALSE))
	{
		AI_Output(other,self,"DIA_Fester_PERMPruegel_15_01");	//��� �� ��������, ����� ���� ����������.
		AI_Output(self,other,"DIA_Fester_PERMPruegel_08_02");	//� ���� �����, � ���� �����!
		Fester_FightVerarscht = TRUE;
	}
	else if(Npc_KnowsInfo(other,DIA_Jarvis_MissionKO))
	{
		AI_Output(other,self,"DIA_Fester_PERMPruegel_15_03");	//���� �� ������ ����������� � �������.
		AI_Output(self,other,"DIA_Fester_PERMPruegel_08_04");	//�� ���� �� ���������� ��, ��? ����� �� ������ �������!
		Fester_FightSylvio = TRUE;
	}
	else if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Fester_PERMPruegel_08_05");	//������ ����� ���� �� ���� ����?
		AI_Output(other,self,"DIA_Fester_PERMPruegel_15_06");	//��� ����� ������� ����������, ��� �� ������ �������� � �����!
	}
	else
	{
		AI_Output(self,other,"DIA_Fester_PERMPruegel_08_07");	//���� ��� ����, ��?
	};
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Fester_PICKPOCKET(C_Info)
{
	npc = Sld_816_Fester;
	nr = 900;
	condition = DIA_Fester_PICKPOCKET_Condition;
	information = DIA_Fester_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Fester_PICKPOCKET_Condition()
{
	return C_Beklauen(27,45);
};

func void DIA_Fester_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Fester_PICKPOCKET);
	Info_AddChoice(DIA_Fester_PICKPOCKET,Dialog_Back,DIA_Fester_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Fester_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Fester_PICKPOCKET_DoIt);
};

func void DIA_Fester_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Fester_PICKPOCKET);
};

func void DIA_Fester_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Fester_PICKPOCKET);
};

