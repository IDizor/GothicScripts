
instance DIA_Addon_Lennar_EXIT(C_Info)
{
	npc = BDT_1096_Addon_Lennar;
	nr = 999;
	condition = DIA_Addon_Lennar_EXIT_Condition;
	information = DIA_Addon_Lennar_EXIT_Info;
	permanent = TRUE;
	description = "��� ����� ����...";
};


func int DIA_Addon_Lennar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Lennar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Lennar_PICKPOCKET(C_Info)
{
	npc = BDT_1096_Addon_Lennar;
	nr = 900;
	condition = DIA_Addon_Lennar_PICKPOCKET_Condition;
	information = DIA_Addon_Lennar_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Addon_Lennar_PICKPOCKET_Condition()
{
	return C_Beklauen(65,100);
};

func void DIA_Addon_Lennar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Lennar_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Lennar_PICKPOCKET,Dialog_Back,DIA_Addon_Lennar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Lennar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Lennar_PICKPOCKET_DoIt);
};

func void DIA_Addon_Lennar_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Lennar_PICKPOCKET);
};

func void DIA_Addon_Lennar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Lennar_PICKPOCKET);
};


instance DIA_Addon_Lennar_Hi(C_Info)
{
	npc = BDT_1096_Addon_Lennar;
	nr = 1;
	condition = DIA_Addon_Lennar_Hi_Condition;
	information = DIA_Addon_Lennar_Hi_Info;
	permanent = FALSE;
	description = "������.";
};


func int DIA_Addon_Lennar_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Lennar_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_Lennar_Hi_15_00");	//������.
	AI_Output(self,other,"DIA_Addon_Lennar_Hi_01_01");	//������. ���� ����� ������. ����� ���������� � ������ ���������.
	AI_Output(other,self,"DIA_Addon_Lennar_Hi_15_02");	//���������? � �����, ��� ���������� ������...
	AI_Output(self,other,"DIA_Addon_Lennar_Hi_01_03");	//�����, �� ������� ����� ������ ��� ����, ����� �������� ����. (�������� �������) ��� ���...
};


instance DIA_Addon_Lennar_Attentat(C_Info)
{
	npc = BDT_1096_Addon_Lennar;
	nr = 2;
	condition = DIA_Addon_Lennar_Attentat_Condition;
	information = DIA_Addon_Lennar_Attentat_Info;
	permanent = FALSE;
	description = "������ ������� ��������� �� ��������...";
};


func int DIA_Addon_Lennar_Attentat_Condition()
{
	if(MIS_Judas == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Lennar_Attentat_Info()
{
	B_Say(other,self,"$ATTENTAT_ADDON_DESCRIPTION2");
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_00");	//������?
	AI_Output(other,self,"DIA_Addon_Lennar_ATTENTAT_15_01");	//� ���� ���� ������������� ������ ����, ��� �� ���� �����?
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_02");	//�������!
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_03");	//(�����������) � ������, ��� �� ���� ������� ������!
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_04");	//(�����������) �� ������ ������ � �����, ��� ���������, � ����� �� �����������.
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_05");	//�� � ������� ��������� �� ������ � ������, ��� ����� �� ��������.
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_06");	//��� �� ��������! ����� ������� � �����, �� ������ �������� � �������� ������� ��������.
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_07");	//(�������) �����, �� ������ �� � ����� ���������� ��� � �����.
	B_LogEntry(Topic_Addon_Esteban,"������ ����������� ������, ������ ��� �� ������ �� ����� � ��������.");
};


instance DIA_Addon_Lennar_Inspektor(C_Info)
{
	npc = BDT_1096_Addon_Lennar;
	nr = 3;
	condition = DIA_Addon_Lennar_Inspektor_Condition;
	information = DIA_Addon_Lennar_Inspektor_Info;
	permanent = FALSE;
	description = "�� ��� ������� �� ������ �� ������ ��������?";
};


func int DIA_Addon_Lennar_Inspektor_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lennar_Attentat))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lennar_Inspektor_Info()
{
	AI_Output(other,self,"DIA_Addon_Lennar_Inspektor_15_00");	//�� ��� ������� �� ������ �� ������ ��������?
	AI_Output(self,other,"DIA_Addon_Lennar_Inspektor_01_01");	//������ ��� �����? �����, � ���� ���� ��������, ������� �� ����� ����� ��������.
	AI_Output(self,other,"DIA_Addon_Lennar_Inspektor_01_02");	//��, ��� ������ �������� �������...
};


instance DIA_Addon_Lennar_Mine(C_Info)
{
	npc = BDT_1096_Addon_Lennar;
	nr = 4;
	condition = DIA_Addon_Lennar_Mine_Condition;
	information = DIA_Addon_Lennar_Mine_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};


func int DIA_Addon_Lennar_Mine_Condition()
{
	if((MIS_Send_Buddler == LOG_Running) && (Player_SentBuddler < 3) && (Npc_HasItems(other,ItMi_Addon_Stone_01) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lennar_Mine_Info()
{
	B_Say(other,self,"$MINE_ADDON_DESCRIPTION");
	B_GiveInvItems(other,self,ItMi_Addon_Stone_01,1);
	AI_Output(self,other,"DIA_Addon_Lennar_Mine_01_00");	//� ���� ������������� ���� ��� ���� ������� ��������?
	AI_Output(self,other,"DIA_Addon_Lennar_Mine_01_01");	//�������! �� ������-�� � ������� ��� ������� ����� �� �������! � ��� ����, ��� ������ ���� ��������!
	AI_Output(self,other,"DIA_Addon_Lennar_Mine_01_02");	//��, ���� �����: ����� �� ��������� � �������, �� ��� ������ ������� ������. ����� ��� ����� �������� � ������!
	B_Upgrade_Hero_HackChance(10);
	Player_SentBuddler = Player_SentBuddler + 1;
	B_GivePlayerXP(XP_Addon_MINE);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MINE");
};


instance DIA_Addon_Lennar_Gold(C_Info)
{
	npc = BDT_1096_Addon_Lennar;
	nr = 5;
	condition = DIA_Addon_Lennar_Gold_Condition;
	information = DIA_Addon_Lennar_Gold_Info;
	permanent = FALSE;
	description = "�� ��� ������ ���������� ���-������ � ������ ������?";
};


func int DIA_Addon_Lennar_Gold_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lennar_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lennar_Gold_Info()
{
	AI_Output(other,self,"DIA_Addon_Lennar_Gold_15_00");	//�� ��� ������ ���������� ���-������ � ������ ������?
	AI_Output(self,other,"DIA_Addon_Lennar_Gold_01_01");	//�������! �� ���� � ����� ����, �� ������� �������� ������ ������.
	AI_Output(other,self,"DIA_Addon_Lennar_Gold_15_02");	//������� � ���� � ���������.
	AI_Output(self,other,"DIA_Addon_Lennar_Gold_01_03");	//��. �� ���� �� ������� �������� ������ ������, �� ���� �� ������, ���� �� �� ��������� �� �� ����.
	AI_Output(other,self,"DIA_Addon_Lennar_Gold_15_04");	//��...
	AI_Output(self,other,"DIA_Addon_Lennar_Gold_01_05");	//�������, �� ������ ��������� ��� ��� ���� �������. ������...
	AI_Output(self,other,"DIA_Addon_Lennar_Gold_01_06");	//��������� �������.
};


var int Lennar_TeachGold;

instance DIA_Addon_Lennar_Train(C_Info)
{
	npc = BDT_1096_Addon_Lennar;
	nr = 6;
	condition = DIA_Addon_Lennar_Train_Condition;
	information = DIA_Addon_Lennar_Train_Info;
	permanent = TRUE;
	description = "����� ���� �������� ������! (50 �������)";
};


func int DIA_Addon_Lennar_Train_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lennar_Gold) && (Lennar_TeachGold == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lennar_Train_Info()
{
	AI_Output(other,self,"DIA_Addon_Lennar_Train_15_00");	//� ����� ������� ������ ������!
	if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		AI_Output(self,other,"DIA_Addon_Lennar_Train_01_01");	//����: �������� ������ ������������ ������������ �������. �� ��������������, �� � �� ������� ��� ������.
		AI_Output(self,other,"DIA_Addon_Lennar_Train_01_02");	//� �� ����� ���� ��� ����� � ���� � �� �� �����. ����������� ������� ���� ������ - ��� �������� ���� ����� ����� ��������� �������� �������.
		AI_Output(self,other,"DIA_Addon_Lennar_Train_01_03");	//������� ��� ������: ��� ������� ���� ����� �������� � ���������� ����.
		B_Upgrade_Hero_HackChance(10);
		Lennar_TeachGold = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Lennar_Train_01_04");	//������� � ���� �������� ���� ����!
	};
};


instance DIA_Addon_Lennar_Hacker(C_Info)
{
	npc = BDT_1096_Addon_Lennar;
	nr = 9;
	condition = DIA_Addon_Lennar_Hacker_Condition;
	information = DIA_Addon_Lennar_Hacker_Info;
	permanent = TRUE;
	description = "��� � �������?";
};


func int DIA_Addon_Lennar_Hacker_Condition()
{
	if(Npc_GetDistToWP(self,"ADW_MINE_PICK_09") <= 500)
	{
		return TRUE;
	};
};

func void DIA_Addon_Lennar_Hacker_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10004_Lennar_Hacker_15_00");	//��� ����?
	AI_Output(self,other,"DIA_Addon_BDT_10004_Lennar_Hacker_01_01");	//��� ��������.
};

