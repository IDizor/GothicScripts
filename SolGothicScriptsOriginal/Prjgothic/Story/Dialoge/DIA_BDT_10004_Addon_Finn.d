
instance DIA_Addon_Finn_EXIT(C_Info)
{
	npc = BDT_10004_Addon_Finn;
	nr = 999;
	condition = DIA_Addon_Finn_EXIT_Condition;
	information = DIA_Addon_Finn_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Finn_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Finn_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Finn_PICKPOCKET(C_Info)
{
	npc = BDT_10004_Addon_Finn;
	nr = 900;
	condition = DIA_Addon_Finn_PICKPOCKET_Condition;
	information = DIA_Addon_Finn_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Addon_Finn_PICKPOCKET_Condition()
{
	return C_Beklauen(35,50);
};

func void DIA_Addon_Finn_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Finn_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Finn_PICKPOCKET,Dialog_Back,DIA_Addon_Finn_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Finn_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Finn_PICKPOCKET_DoIt);
};

func void DIA_Addon_Finn_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Finn_PICKPOCKET);
};

func void DIA_Addon_Finn_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Finn_PICKPOCKET);
};


instance DIA_Addon_Finn_Hacker(C_Info)
{
	npc = BDT_10004_Addon_Finn;
	nr = 9;
	condition = DIA_Addon_Finn_Hacker_Condition;
	information = DIA_Addon_Finn_Hacker_Info;
	permanent = TRUE;
	description = "����� �� �������?";
};


func int DIA_Addon_Finn_Hacker_Condition()
{
	if(Npc_GetDistToWP(self,"ADW_MINE_PICK_06") <= 500)
	{
		return TRUE;
	};
};

func void DIA_Addon_Finn_Hacker_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10004_Finn_Hacker_15_00");	//����� �� �������?
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Hacker_07_01");	//��, � ���� ������� �� ���� ����� ��� ������ �� ���������� �������.
};


instance DIA_Addon_Finn_Hi(C_Info)
{
	npc = BDT_10004_Addon_Finn;
	nr = 1;
	condition = DIA_Addon_Finn_Hi_Condition;
	information = DIA_Addon_Finn_Hi_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Finn_Hi_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Finn_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10004_Finn_Hi_15_00");	//������!
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Hi_07_01");	//(�������) ��� ���� �����?
};


instance DIA_Addon_Finn_Hacke(C_Info)
{
	npc = BDT_10004_Addon_Finn;
	nr = 2;
	condition = DIA_Addon_Finn_Hacke_Condition;
	information = DIA_Addon_Finn_Hacke_Info;
	permanent = FALSE;
	description = "��� � ���� ����� �����?";
};


func int DIA_Addon_Finn_Hacke_Condition()
{
	return TRUE;
};

func void DIA_Addon_Finn_Hacke_Info()
{
	AI_Output(other,self,"DIA_Addon_Finn_Hacke_15_00");	//��� � ���� ����� �����?
	AI_Output(self,other,"DIA_Addon_Finn_Hacke_07_01");	//������ � ������� ����. �� ������� ����� ��� �� ���� ���� ����� ����� � �����.
	AI_Output(self,other,"DIA_Addon_Finn_Hacke_07_02");	//���� �� ������ �����, ���� ����� ���������� � ���������.
	AI_Output(self,other,"DIA_Addon_Finn_Hacke_07_03");	//� � ������� ������ ���� �� �������� �������� - �� ������� ����, ������ ���� � ���� ����� ������� ������.
};


instance DIA_Addon_Finn_Esteban(C_Info)
{
	npc = BDT_10004_Addon_Finn;
	nr = 3;
	condition = DIA_Addon_Finn_Esteban_Condition;
	information = DIA_Addon_Finn_Esteban_Info;
	permanent = FALSE;
	description = "����� ���, ��� �� ������� �� ��������?";
};


func int DIA_Addon_Finn_Esteban_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Finn_Hacke))
	{
		return TRUE;
	};
};

func void DIA_Addon_Finn_Esteban_Info()
{
	AI_Output(other,self,"DIA_Addon_Finn_Esteban_15_00");	//����� ���, ��� �� ������� �� ��������?
	AI_Output(self,other,"DIA_Addon_Finn_Esteban_07_01");	//(���������) �� ����� ����... ��... ��-�����, �� ���� ������.
	AI_Output(self,other,"DIA_Addon_Finn_Esteban_07_02");	//(������������) �� ������ ���������� � ����� ���������� �����. ���, ��� ����� ���� ����, � ���� � ����.
};


instance DIA_Addon_Finn_Profi(C_Info)
{
	npc = BDT_10004_Addon_Finn;
	nr = 4;
	condition = DIA_Addon_Finn_Profi_Condition;
	information = DIA_Addon_Finn_Profi_Info;
	permanent = FALSE;
	description = "� �� ������ ��� ����?";
};


func int DIA_Addon_Finn_Profi_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Finn_Esteban))
	{
		return TRUE;
	};
};

func void DIA_Addon_Finn_Profi_Info()
{
	AI_Output(other,self,"DIA_Addon_Finn_Profi_15_00");	//� �� ������ ��� ����?
	AI_Output(self,other,"DIA_Addon_Finn_Profi_07_01");	//� � ��� ������!
};


instance DIA_Addon_BDT_10004_Finn_Mine(C_Info)
{
	npc = BDT_10004_Addon_Finn;
	nr = 5;
	condition = DIA_Addon_Finn_Mine_Condition;
	information = DIA_Addon_Finn_Mine_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};


func int DIA_Addon_Finn_Mine_Condition()
{
	if((MIS_Send_Buddler == LOG_Running) && (Player_SentBuddler < 3) && (Npc_HasItems(other,ItMi_Addon_Stone_01) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Finn_Mine_Info()
{
	B_Say(other,self,"$MINE_ADDON_DESCRIPTION");
	B_GiveInvItems(other,self,ItMi_Addon_Stone_01,1);
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Mine_07_00");	//�������, ����. �� ������, ����� � ����� �������� ������ ����? ����� � ������� � ����...
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Mine_07_01");	//��, � ���-��� ���. ��� ���� ������ ���������.
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Mine_07_02");	//�� ���� � ������ ������� ���� - ������ ���������.
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Mine_07_03");	//���� �� ������� ���� ��� ��� �������� ����������, �������� �������� ������ ����� ����� �����.
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Mine_07_04");	//���� ���� �������, ����� ������� �� �������� ��������� ������ �� ���.
	B_Upgrade_Hero_HackChance(10);
	Knows_Truemmerschlag = TRUE;
	Player_SentBuddler = Player_SentBuddler + 1;
	B_GivePlayerXP(XP_Addon_MINE);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MINE");
};


instance DIA_Addon_Finn_Gold(C_Info)
{
	npc = BDT_10004_Addon_Finn;
	nr = 6;
	condition = DIA_Addon_Finn_Gold_Condition;
	information = DIA_Addon_Finn_Gold_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_GOLD_DESCRIPTION;
};


func int DIA_Addon_Finn_Gold_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Finn_Profi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Finn_Gold_Info()
{
	B_Say(other,self,"$ADDON_GOLD_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Finn_Gold_07_00");	//�� � ��� ����, ��� ������� �����. ������ - ��� �� ����. ���� ������� �������.
	AI_Output(self,other,"DIA_Addon_Finn_Gold_07_01");	//� ���� � ����, ��� �� ���� ������� �� ����� ������ �� ��� �������� �� ������ ����. (�������)
	AI_Output(self,other,"DIA_Addon_Finn_Gold_07_02");	//����� ������ ������, ��� ������ ����. ��� ��������� ����� ����� ������.
	AI_Output(self,other,"DIA_Addon_Finn_Gold_07_03");	//���� � ��������, ������� ������ ��� �������� - �� ��� ����� �������.
	B_Upgrade_Hero_HackChance(10);
};


instance DIA_Addon_Finn_ein(C_Info)
{
	npc = BDT_10004_Addon_Finn;
	nr = 7;
	condition = DIA_Addon_Finn_ein_Condition;
	information = DIA_Addon_Finn_ein_Info;
	permanent = TRUE;
	description = "������ �� ������� ��� ������ ��������?";
};


func int DIA_Addon_Finn_ein_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Finn_Profi))
	{
		return TRUE;
	};
};


var int Finn_einmal;
var int Finn_Gratulation;

func void DIA_Addon_Finn_ein_Info()
{
	var string concatText;
	AI_Output(other,self,"DIA_Addon_Finn_ein_15_00");	//������ �� ������� ��� ������ ��������?
	if(Finn_einmal == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_01");	//�������. � ��������� ���� ������ 35 ���. ��� ������, ����� � �� ��� �������!
		Finn_einmal = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_Finn_ein_07_02");	//��� �������� ����, �� ��...
	if(Hero_HackChance < 20)
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_03");	//����������� �������.
	}
	else if(Hero_HackChance < 40)
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_04");	//������ ������� ��������.
	}
	else if(Hero_HackChance < 55)
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_05");	//������� ��������������.
	}
	else if(Hero_HackChance < 75)
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_06");	//��������� �������.
	}
	else if(Hero_HackChance < 90)
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_07");	//��������� ������� �������.
	}
	else if(Hero_HackChance < 98)
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_08");	//������� �������.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_09");	//���� ����� ���������.
		if(Finn_Gratulation == FALSE)
		{
			AI_Output(self,other,"DIA_Addon_Finn_ein_07_10");	//������ �� ��� �� �����, ��� �. ����������, �������.
			B_GivePlayerXP(XP_Ambient * 2);
			Snd_Play("LevelUP");
			Finn_Gratulation = TRUE;
		};
	};
	concatText = ConcatStrings("Goldhacken: ",IntToString(Hero_HackChance));
	concatText = ConcatStrings(concatText," Prozent");
	PrintScreen(concatText,-1,-1,FONT_ScreenSmall,2);
};


instance DIA_Addon_Finn_Attentat(C_Info)
{
	npc = BDT_10004_Addon_Finn;
	nr = 8;
	condition = DIA_Addon_Finn_Attentat_Condition;
	information = DIA_Addon_Finn_Attentat_Info;
	permanent = FALSE;
	description = "������ ������� ��������� �� ��������...";
};


func int DIA_Addon_Finn_Attentat_Condition()
{
	if(MIS_Judas == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Finn_Attentat_Info()
{
	B_Say(other,self,"$ATTENTAT_ADDON_DESCRIPTION2");
	AI_Output(self,other,"DIA_Addon_Finn_Attentat_07_00");	//(���������) ��?
	AI_Output(other,self,"DIA_Addon_Finn_Attentat_15_01");	//� ���� ���� ����, ��� ����� �� ���� ����?
	AI_Output(self,other,"DIA_Addon_Finn_Attentat_07_02");	//� ����� ���� ���?
	Info_ClearChoices(DIA_Addon_Finn_Attentat);
	Info_AddChoice(DIA_Addon_Finn_Attentat,"� ���� ���������� � ���...",DIA_Addon_Finn_Attentat_WannaTalk);
	Info_AddChoice(DIA_Addon_Finn_Attentat,"������� ������ �� ����� ������ ��� ����� �����!",DIA_Addon_Finn_Attentat_ForTheBoss);
};

func void B_Addon_Finn_TellAll()
{
	AI_Output(self,other,"DIA_Addon_Finn_TellAll_07_00");	//(���������) ����� ��������� ���������, � ��������� ������� ���� ����� �� ������� ����.
	AI_Output(self,other,"DIA_Addon_Finn_TellAll_07_01");	//�� ��� �� ����� �� ����.
	AI_Output(other,self,"DIA_Addon_Finn_TellAll_15_02");	//�?
	AI_Output(self,other,"DIA_Addon_Finn_TellAll_07_03");	//� ������ �� ������ �� �����. ����� ������������� - ��� ��� � �����.
	Finn_TellAll = TRUE;
	B_LogEntry(Topic_Addon_Esteban,"���� ������, ��� ���� �� ������������� ��� �����.");
};

func void DIA_Addon_Finn_Attentat_ForTheBoss()
{
	AI_Output(other,self,"DIA_Addon_Finn_ForTheBoss_15_00");	//������� ������ �� ����� ������ ��� ����� �����!
	AI_Output(self,other,"DIA_Addon_Finn_ForTheBoss_07_01");	//�! �� ��������� �� �����?
	AI_Output(self,other,"DIA_Addon_Finn_ForTheBoss_07_02");	//����� � ���� �����, ��� � ����.
	B_Addon_Finn_TellAll();
	Info_ClearChoices(DIA_Addon_Finn_Attentat);
};

func void DIA_Addon_Finn_Attentat_WannaTalk()
{
	AI_Output(other,self,"DIA_Addon_Finn_WannaTalk_15_00");	//� ���� ���������� � ���...
	AI_Output(self,other,"DIA_Addon_Finn_WannaTalk_07_01");	//(���������) ��? � ��� ���� �� ���� �����?
	Info_ClearChoices(DIA_Addon_Finn_Attentat);
	Info_AddChoice(DIA_Addon_Finn_Attentat,"��� �� ���� ����!",DIA_Addon_Finn_Attentat_ForgetIt);
	Info_AddChoice(DIA_Addon_Finn_Attentat,"� ���� ���� ��� ���� ����������, ������� ����� ��������� ����������!",DIA_Addon_Finn_Attentat_HaveInfos);
	Info_AddChoice(DIA_Addon_Finn_Attentat,"� ���� ��������� ��������, � ��� ����� �������!",DIA_Addon_Finn_Attentat_KillEsteban);
};

func void DIA_Addon_Finn_Attentat_KillEsteban()
{
	AI_Output(other,self,"DIA_Addon_Finn_KillEsteban_15_00");	//� ���� ��������� ��������, � ��� ����� �������!
	AI_Output(self,other,"DIA_Addon_Finn_KillEsteban_07_01");	//� � ��� ���� ����������� �� ����!
	Finn_Petzt = TRUE;
	Info_ClearChoices(DIA_Addon_Finn_Attentat);
	AI_StopProcessInfos(self);
};

func void DIA_Addon_Finn_Attentat_HaveInfos()
{
	AI_Output(other,self,"DIA_Addon_Finn_HaveInfos_15_00");	//� ���� ���� ��� ���� ����������, ������� ����� ��������� ����������!
	AI_Output(self,other,"DIA_Addon_Finn_HaveInfos_07_01");	//�� � ������� � ���, ��� ��� �������, ������?
	Info_ClearChoices(DIA_Addon_Finn_Attentat);
	Info_AddChoice(DIA_Addon_Finn_Attentat,"� ���� ��������� ��������, � ��� ����� �������!",DIA_Addon_Finn_Attentat_KillEsteban);
	Info_AddChoice(DIA_Addon_Finn_Attentat,"��� �� ���� ����!",DIA_Addon_Finn_Attentat_ForgetIt);
	Info_AddChoice(DIA_Addon_Finn_Attentat,"�������, ���!",DIA_Addon_Finn_Attentat_NoNo);
};

func void DIA_Addon_Finn_Attentat_NoNo()
{
	AI_Output(other,self,"DIA_Addon_Finn_NoNo_15_00");	//�������, ���!
	AI_Output(self,other,"DIA_Addon_Finn_NoNo_07_01");	//(����������) ������! � �������� ���� ��, ��� � ����.
	B_Addon_Finn_TellAll();
	Info_ClearChoices(DIA_Addon_Finn_Attentat);
};

func void DIA_Addon_Finn_Attentat_ForgetIt()
{
	AI_Output(other,self,"DIA_Addon_Finn_ForgetIt_15_00");	//��� �� ���� ����!
	AI_Output(self,other,"DIA_Addon_Finn_ForgetIt_07_01");	//��? �� ����� � ������ �� ���� �� ����.
	Info_ClearChoices(DIA_Addon_Finn_Attentat);
};


instance DIA_Addon_Finn_Again(C_Info)
{
	npc = BDT_10004_Addon_Finn;
	nr = 9;
	condition = DIA_Addon_Finn_Again_Condition;
	information = DIA_Addon_Finn_Again_Info;
	permanent = TRUE;
	description = "� ����� � ���������...";
};


func int DIA_Addon_Finn_Again_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Finn_Attentat) && !Npc_IsDead(Esteban))
	{
		return TRUE;
	};
};

func void DIA_Addon_Finn_Again_Info()
{
	AI_Output(other,self,"DIA_Addon_Finn_Again_15_00");	//� ����� � ���������...
	if(Finn_TellAll == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Finn_Again_07_01");	//� ���� ��� ������ ���, ��� � ����.
		Info_ClearChoices(DIA_Addon_Finn_Again);
		Info_AddChoice(DIA_Addon_Finn_Again,"������... (�����)",DIA_Addon_Finn_Again_Exit);
		Info_AddChoice(DIA_Addon_Finn_Again,"����� �������� ��� ��� ���!",DIA_Addon_Finn_Again_Nochmal);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Finn_Again_07_02");	//������ ���� � ����� � ���� �������!
		AI_StopProcessInfos(self);
	};
};

func void DIA_Addon_Finn_Again_Exit()
{
	AI_Output(other,self,"DIA_Addon_Finn_Again_Exit_15_00");	//(����������) �����...
	Info_ClearChoices(DIA_Addon_Finn_Again);
};

func void DIA_Addon_Finn_Again_Nochmal()
{
	AI_Output(other,self,"DIA_Addon_Finn_Again_Nochmal_15_00");	//����� �������� ��� ��� ���!
	B_Addon_Finn_TellAll();
	Info_ClearChoices(DIA_Addon_Finn_Again);
};

