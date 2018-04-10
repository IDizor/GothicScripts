
instance DIA_Ramirez_EXIT(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 999;
	condition = DIA_Ramirez_EXIT_Condition;
	information = DIA_Ramirez_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Ramirez_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Ramirez_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ramirez_PICKPOCKET(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 900;
	condition = DIA_Ramirez_PICKPOCKET_Condition;
	information = DIA_Ramirez_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_100;
};


func int DIA_Ramirez_PICKPOCKET_Condition()
{
	return C_Beklauen(90,300);
};

func void DIA_Ramirez_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Ramirez_PICKPOCKET);
	Info_AddChoice(DIA_Ramirez_PICKPOCKET,Dialog_Back,DIA_Ramirez_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Ramirez_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Ramirez_PICKPOCKET_DoIt);
};

func void DIA_Ramirez_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Ramirez_PICKPOCKET);
};

func void DIA_Ramirez_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Ramirez_PICKPOCKET);
};


instance DIA_Ramirez_Zeichen(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 2;
	condition = DIA_Ramirez_Zeichen_Condition;
	information = DIA_Ramirez_Zeichen_Info;
	permanent = FALSE;
	description = "(�������� ������ �����)";
};


func int DIA_Ramirez_Zeichen_Condition()
{
	if(Knows_SecretSign == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Zeichen_Info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ramirez_Zeichen_14_00");	//���, ���, ���� � ����. (������) � ��������.
};


instance DIA_Ramirez_Hallo(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 2;
	condition = DIA_Ramirez_Hallo_Condition;
	information = DIA_Ramirez_Hallo_Info;
	permanent = TRUE;
	important = TRUE;
};


var int DIA_Ramirez_Hallo_permanent;

func int DIA_Ramirez_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (DIA_Ramirez_Hallo_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Hallo_Info()
{
	if((self.aivar[AIV_TalkedToPlayer] == FALSE) && (Join_Thiefs == FALSE))
	{
		AI_Output(self,other,"DIA_Ramirez_Hallo_14_00");	//�� ���, ����������? ��-�����, ��� �� ����� ���������� ����� ��� ����.
		AI_Output(self,other,"DIA_Ramirez_Hallo_14_01");	//���� ����� � ����� ���-������ ��������, ���� ����� �� ������ �� ������. ��� ��� ���� ���������. (������� �������)
	};
	if(Join_Thiefs == TRUE)
	{
		AI_Output(self,other,"DIA_Ramirez_Hallo_14_02");	//����, �� � ����. ��� �, ����� � ����� ���� ������ - �� ���� ���������.
		AI_Output(self,other,"DIA_Ramirez_Hallo_14_03");	//��, � ��� ���� - ���� �� ���������� ��� �� ��� �������, �  ��� �� ���������.
		AI_Output(self,other,"DIA_Ramirez_Hallo_14_04");	//�� �����, �����, �� ���� �� ���. ���. �� ������ � �� ������.
		DIA_Ramirez_Hallo_permanent = TRUE;
	};
	DG_gefunden = TRUE;
};


instance DIA_Ramirez_Beute(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 3;
	condition = DIA_Ramirez_Beute_Condition;
	information = DIA_Ramirez_Beute_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Ramirez_Beute_Condition()
{
	if((Mob_HasItems("THIEF_CHEST_01",ItMi_Gold) < 50) || (Mob_HasItems("THIEF_CHEST_02",ItMi_Gold) < 100) || (Mob_HasItems("THIEF_CHEST_02",ItMi_SilverCup) == FALSE) || (Mob_HasItems("THIEF_CHEST_03",ItMi_Gold) < 75))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Beute_Info()
{
	AI_Output(self,other,"DIA_Ramirez_Beute_14_00");	//��������, �� ���, ��������� ��� ��������? �� ��������� ������� ����� �������... �� ���, ��������� ������ � ���?
	AI_Output(other,self,"DIA_Ramirez_Beute_15_01");	//�� ����� �������������� ��� ��-�� ���� �����.
	AI_Output(other,self,"DIA_Ramirez_Beute_15_02");	//� ���� �������, ��� ������, ��� ���� ����� - ��� ���, ��� ��� ������� ���������? ��� ���, ��� ������� ����� �������� ����� ����������?
	AI_Output(self,other,"DIA_Ramirez_Beute_14_03");	//��� ������, ��� ���� ��������� �������� �����?
	AI_Output(other,self,"DIA_Ramirez_Beute_15_04");	//��, � ���� �� ���� � ��� ��������. � ��� �� ������� ���� ���������?
	AI_Output(self,other,"DIA_Ramirez_Beute_14_05");	//� ����� �������� �����.
	AI_Output(other,self,"DIA_Ramirez_Beute_15_06");	//�������.
	AI_Output(self,other,"DIA_Ramirez_Beute_14_07");	//������, �� ������ �������� ���� ��� ������. �� � ���� ������������� �� �����. ��� ��� �� ������� ��������� ���� ����.
};


instance DIA_Ramirez_Bezahlen(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 9;
	condition = DIA_Ramirez_Bezahlen_Condition;
	information = DIA_Ramirez_Bezahlen_Info;
	permanent = TRUE;
	description = "�� ������ ������� ���� ����-������?";
};


var int DIA_Ramirez_Bezahlen_permanent;

func int DIA_Ramirez_Bezahlen_Condition()
{
	if((Join_Thiefs == TRUE) && (DIA_Ramirez_Bezahlen_permanent == FALSE) && Npc_KnowsInfo(other,DIA_Cassia_Lernen))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Bezahlen_Info()
{
	if(MIS_ThiefGuild_sucked == FALSE)
	{
		Ramirez_Cost = 150;
	}
	else
	{
		Ramirez_Cost = 300;
	};
	AI_Output(other,self,"DIA_Ramirez_Bezahlen_15_00");	//�� ������ ������� ���� ����-������?
	if(Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) == TRUE)
	{
		AI_Output(self,other,"DIA_Ramirez_Bezahlen_14_01");	//��� ������ ���� �����. �� ��� ������ �� �������� ���.
		if(other.attribute[ATR_DEXTERITY] < T_MAX)
		{
			AI_Output(self,other,"DIA_Ramirez_Add_14_00");	//������ ���� �������� ������ �������� ���� ��������...
		};
		DIA_Ramirez_Bezahlen_permanent = TRUE;
		Info_ClearChoices(DIA_Ramirez_Bezahlen);
	}
	else
	{
		AI_Output(self,other,"DIA_Ramirez_Bezahlen_14_02");	//� ���� �������� ����, ��� ������������ ���������. ��� ����� ������ ����...
		B_Say_Gold(self,other,Ramirez_Cost);
		Info_ClearChoices(DIA_Ramirez_Bezahlen);
		Info_AddChoice(DIA_Ramirez_Bezahlen,"����� ����, ����� ...(�����)",DIA_Ramirez_Bezahlen_Spaeter);
		Info_AddChoice(DIA_Ramirez_Bezahlen,"������, � ����� ���������...",DIA_Ramirez_Bezahlen_Okay);
	};
};

func void DIA_Ramirez_Bezahlen_Spaeter()
{
	Info_ClearChoices(DIA_Ramirez_Bezahlen);
};

func void DIA_Ramirez_Bezahlen_Okay()
{
	AI_Output(other,self,"DIA_Ramirez_Bezahlen_Okay_15_00");	//������, � ����� ���������...
	if(B_GiveInvItems(other,self,ItMi_Gold,Ramirez_Cost))
	{
		AI_Output(other,self,"DIA_Ramirez_Bezahlen_Okay_15_01");	//...��� ������.
		AI_Output(self,other,"DIA_Ramirez_Bezahlen_Okay_14_02");	//�������. � � ����� �������.
		Ramirez_TeachPlayer = TRUE;
		DIA_Ramirez_Bezahlen_permanent = TRUE;
		Info_ClearChoices(DIA_Ramirez_Bezahlen);
	}
	else
	{
		AI_Output(self,other,"DIA_Ramirez_Bezahlen_Okay_14_03");	//�����������, ����� ����������� ������.
		Info_ClearChoices(DIA_Ramirez_Bezahlen);
	};
};


instance DIA_Ramirez_Teach(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 99;
	condition = DIA_Ramirez_Teach_Condition;
	information = DIA_Ramirez_Teach_Info;
	permanent = TRUE;
	description = "����� ���� ��������� �����!";
};


func int DIA_Ramirez_Teach_Condition()
{
	if((Ramirez_TeachPlayer == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Teach_Info()
{
	AI_Output(other,self,"DIA_Ramirez_Teach_15_00");	//����� ���� ������������ ���������!
	if(Ramirez_Zweimal == FALSE)
	{
		AI_Output(self,other,"DIA_Ramirez_Teach_14_06");	//�������� ������ - ��� ������ ���������.
		AI_Output(self,other,"DIA_Ramirez_Teach_14_01");	//��� ����� ����� �������������� �������� � ��������. � ���� ������� �������.
		AI_Output(self,other,"DIA_Ramirez_Teach_14_02");	//��������� �������, �������, ������� �� ������ �����, ������� ����� ������� ������ ���������� ������.
		Ramirez_Zweimal = TRUE;
	};
	if(B_TeachThiefTalent(self,other,NPC_TALENT_PICKLOCK))
	{
		AI_Output(self,other,"DIA_Ramirez_Teach_14_03");	//����, ������ ����� ������, � ����������� ������� ����� � ������.
		AI_Output(self,other,"DIA_Ramirez_Teach_14_04");	//���� �� ������ ������������ �� ������� ������ ��� ������� ������, ��� ���������.
		AI_Output(self,other,"DIA_Ramirez_Teach_14_05");	//�� ��� ����� ������� �� ������ �����������, ��� ����� ���� ����� ����������� � ���� ��������� ������������.
	};
};


instance DIA_Ramirez_Viertel(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 8;
	condition = DIA_Ramirez_Viertel_Condition;
	information = DIA_Ramirez_Viertel_Info;
	permanent = FALSE;
	description = "��� �� �������������� ��� ����������� ���� ����?";
};


func int DIA_Ramirez_Viertel_Condition()
{
	if(Knows_SecretSign == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Viertel_Info()
{
	AI_Output(other,self,"DIA_Ramirez_Viertel_15_00");	//��� �� �������������� ��� ����������� ���� ����?
	AI_Output(self,other,"DIA_Ramirez_Viertel_14_01");	//� ������� ����� ������, ������� ��.
	AI_Output(self,other,"DIA_Ramirez_Viertel_14_02");	//�� ���� �� ������ ���������� � �����-�� ���, ����� ��������� ����, ����� ��� ���� - �� ����������� ��������� ������.
	AI_Output(self,other,"DIA_Ramirez_Viertel_14_03");	//��� ����������� ����� ��� ����. � ���� ������ �� ��� - �����. ��� ���������� ������ ������.
	AI_Output(self,other,"DIA_Ramirez_Viertel_14_04");	//��� ������ ����� ��������, �� ���� �� ��� ���������, ���� ������ �� � ��� �� ����� ����� �����������.
};


instance DIA_Ramirez_Sextant(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 2;
	condition = DIA_Ramirez_Sextant_Condition;
	information = DIA_Ramirez_Sextant_Info;
	permanent = FALSE;
	description = "� ���� ���� ������ ��� ����?";
};


func int DIA_Ramirez_Sextant_Condition()
{
	if((Knows_SecretSign == TRUE) && (MIS_CassiaRing == LOG_SUCCESS) && (Kapitel >= 2))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Sextant_Info()
{
	AI_Output(other,self,"DIA_Ramirez_Sextant_15_00");	//� ���� ���� ������ ��� ����?
	AI_Output(self,other,"DIA_Ramirez_Sextant_14_01");	//���... ���� ������, ������� � ����� �� ����������. �� � ����� �� ���� ����� ��.
	AI_Output(other,self,"DIA_Ramirez_Sextant_15_02");	//��� �� ����� �� ��������?
	AI_Output(self,other,"DIA_Ramirez_Sextant_14_03");	//��������. ������� ��� �������� - � ������� �� ���� ������� ����.
	Log_CreateTopic(Topic_RamirezSextant,LOG_MISSION);
	Log_SetTopicStatus(Topic_RamirezSextant,LOG_Running);
	B_LogEntry(Topic_RamirezSextant,"������� �����, ����� � ������ ��� ��������.");
	MIS_RamirezSextant = LOG_Running;
};


instance DIA_Ramirez_Success(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 2;
	condition = DIA_Ramirez_Success_Condition;
	information = DIA_Ramirez_Success_Info;
	permanent = FALSE;
	description = "� ������ ���� ��������.";
};


func int DIA_Ramirez_Success_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Ramirez_Sextant) && (Npc_HasItems(other,ItMi_Sextant) > 0))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Success_Info()
{
	AI_Output(other,self,"DIA_Ramirez_Success_15_00");	//� ������ ���� ��������.
	B_GiveInvItems(other,self,ItMi_Sextant,1);
	AI_Output(self,other,"DIA_Ramirez_Success_14_01");	//����������. ���� ������� ����� ���!
	AI_Output(self,other,"DIA_Ramirez_Success_14_02");	//���, �����, �� �������� ��� ������.
	B_GiveInvItems(self,other,ItMi_Gold,Value_Sextant / 2);
	Ramirez_Sextant = TRUE;
	MIS_RamirezSextant = LOG_SUCCESS;
	B_GivePlayerXP(XP_RamirezSextant);
};

