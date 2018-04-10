
instance DIA_Sentenza_EXIT(C_Info)
{
	npc = SLD_814_Sentenza;
	nr = 999;
	condition = DIA_Sentenza_EXIT_Condition;
	information = DIA_Sentenza_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sentenza_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Sentenza_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


var int Sentenza_Wants50;
var int Sentenza_SearchDay;

instance DIA_Sentenza_Hello(C_Info)
{
	npc = SLD_814_Sentenza;
	nr = 1;
	condition = DIA_Sentenza_Hello_Condition;
	information = DIA_Sentenza_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Sentenza_Hello_Condition()
{
	if(self.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Sentenza_Hello_Info()
{
	AI_Output(self,other,"DIA_Sentenza_Hello_09_00");	//� ���� ��� �� ��������?!
	self.aivar[AIV_LastFightComment] = TRUE;
	Sentenza_SearchDay = B_GetDayPlus();
	Info_ClearChoices(DIA_Sentenza_Hello);
	Info_AddChoice(DIA_Sentenza_Hello,"� ����� ���� �� ����� ����?",DIA_Sentenza_Hello_NotYourBusiness);
	Info_AddChoice(DIA_Sentenza_Hello,"� ������ ������������. ��� � ���.",DIA_Sentenza_Hello_JustLooking);
};

func void DIA_Sentenza_Hello_JustLooking()
{
	AI_Output(other,self,"DIA_Sentenza_Hello_JustLooking_15_00");	//� ������ ������������. ��� � ���.
	AI_Output(self,other,"DIA_Sentenza_Hello_JustLooking_09_01");	//(�������) ����� ��� ��, ����� ������� ������� ��������! ��� �� ��� ���������, ��� ������ ��������������?
	AI_Output(self,other,"DIA_Sentenza_Hello_JustLooking_09_02");	//��! �� ����� �� ����! ����� ��� ���� ����� ���� �� ����������� ����� ������ ����?
	AI_Output(self,other,"DIA_Sentenza_Hello_JustLooking_09_03");	//��� ��� ��������� ����� ��� ����. ������ � ����� ����, � ������ ������ ������.
	Info_ClearChoices(DIA_Sentenza_Hello);
	Info_AddChoice(DIA_Sentenza_Hello,"�� ��������� ����!",DIA_Sentenza_Hello_HandsOff);
	Info_AddChoice(DIA_Sentenza_Hello,"��� ������. ������ �������� ����!",DIA_Sentenza_Hello_SearchMe);
};

func void DIA_Sentenza_Hello_NotYourBusiness()
{
	AI_Output(other,self,"DIA_Sentenza_Hello_NotYourBusiness_15_00");	//� ����� ���� �� ����� ����?
	AI_Output(self,other,"DIA_Sentenza_Hello_NotYourBusiness_09_01");	//(��������) ������, ��� �������� ��������� ���� ��� � �������.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void B_Sentenza_SearchMe()
{
	var int playerGold;
	playerGold = Npc_HasItems(other,ItMi_Gold);
	AI_Output(other,self,"DIA_Sentenza_Hello_SearchMe_15_00");	//��� ������. ������ �������� ����!
	AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_01");	//���, ���������, ��� � ��� ����� ����...
	if(playerGold >= 50)
	{
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_02");	//��! ������! ����� ������ ������ � ����� ����� ���������� ������.
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_03");	//������ �� ��������� ��������� ����������. � �� ����� ������� �����, ��� �.
		B_GiveInvItems(other,self,ItMi_Gold,50);
		Sentenza_GoldTaken = TRUE;
	}
	else if(playerGold > 0)
	{
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_04");	//��-�... � ���� �� ��� �� ����� � �����.
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_05");	//� ������� � ���� �����.
	}
	else
	{
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_06");	//� ���� ��� � ����� ������?
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_07");	//�� ������, ��� �� ���������. ��, ������ ����, ��������� ��������� ���-��, ���������?
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_08");	//�� �� �� �����. � ������, ��� �� ��� ����������. ������ ����.
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_09");	//��, ��������, ������������, ��� �����, ��� ��� ���� ������!
	};
	Sentenza_Wants50 = TRUE;
	AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_10");	//� ���� �������� � ���� ����� 50 ������� - ��� ����������� ����. �� ������ ��������� ��� ����� ���� ���. ��� ���� ������, ������?
};

func void DIA_Sentenza_Hello_SearchMe()
{
	B_Sentenza_SearchMe();
	AI_StopProcessInfos(self);
};

func void DIA_Sentenza_Hello_HandsOff()
{
	AI_Output(other,self,"DIA_Sentenza_Hello_HandsOff_15_00");	//�� ��������� ����!
	AI_Output(self,other,"DIA_Sentenza_Hello_HandsOff_09_01");	//(���������) � �� ���?
	Info_ClearChoices(DIA_Sentenza_Hello);
	Info_AddChoice(DIA_Sentenza_Hello,"��� ������. ����� ����!",DIA_Sentenza_Hello_SearchMe);
	Info_AddChoice(DIA_Sentenza_Hello,"� �� �� ����� �� ������� ������ ����������!",DIA_Sentenza_Hello_OrElse);
};

func void DIA_Sentenza_Hello_OrElse()
{
	AI_Output(other,self,"DIA_Sentenza_Hello_OrElse_15_00");	//� �� �� ����� �� ������� ������ ����������!
	AI_Output(self,other,"DIA_Sentenza_Hello_OrElse_09_01");	//��, ��� �� ���������!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Sentenza_Vzwei(C_Info)
{
	npc = SLD_814_Sentenza;
	nr = 2;
	condition = DIA_Sentenza_Vzwei_Condition;
	information = DIA_Sentenza_Vzwei_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Sentenza_Vzwei_Condition()
{
	if((self.aivar[AIV_DefeatedByPlayer] == FALSE) && (Sentenza_GoldTaken == FALSE) && (Sentenza_SearchDay < Wld_GetDay()))
	{
		return TRUE;
	};
};

func void DIA_Sentenza_Vzwei_Info()
{
	AI_Output(self,other,"DIA_Sentenza_Vzwei_09_00");	//����� ��! ����� ���������, ��� � ���� ���� �� ���� ���!
	self.aivar[AIV_LastFightComment] = TRUE;
	Sentenza_SearchDay = B_GetDayPlus();
	Info_ClearChoices(DIA_Sentenza_Vzwei);
	Info_AddChoice(DIA_Sentenza_Vzwei,"����� �� ���� ���� ������� ����!",DIA_Sentenza_Vzwei_HandsOff);
	Info_AddChoice(DIA_Sentenza_Vzwei,"��� ������. ������ �������� ����!",DIA_Sentenza_Vzwei_SearchMe);
};

func void DIA_Sentenza_Vzwei_SearchMe()
{
	B_Sentenza_SearchMe();
	AI_StopProcessInfos(self);
};

func void DIA_Sentenza_Vzwei_HandsOff()
{
	AI_Output(other,self,"DIA_Sentenza_Vzwei_HandsOff_15_00");	//����� �� ���� ���� ������� ����!
	AI_Output(self,other,"DIA_Sentenza_Vzwei_HandsOff_09_01");	//(���������) ��? ������, � ���� � ����� ������ �������� ���������!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Sentenza_WannaJoin(C_Info)
{
	npc = SLD_814_Sentenza;
	nr = 3;
	condition = DIA_Sentenza_WannaJoin_Condition;
	information = DIA_Sentenza_WannaJoin_Info;
	permanent = FALSE;
	description = "� ������, ����� �������������� � ���!";
};


func int DIA_Sentenza_WannaJoin_Condition()
{
	if(hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Sentenza_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Sentenza_WannaJoin_15_00");	//� ������, ����� �������������� � ���!
	AI_Output(self,other,"DIA_Sentenza_WannaJoin_09_01");	//���������� �������.
	AI_Output(self,other,"DIA_Sentenza_WannaJoin_09_02");	//(��������) � �� ������, ��� �������� ����� ���������� - ������� ���� ��� ���?
};


instance DIA_Sentenza_Vote(C_Info)
{
	npc = SLD_814_Sentenza;
	nr = 4;
	condition = DIA_Sentenza_Vote_Condition;
	information = DIA_Sentenza_Vote_Info;
	permanent = TRUE;
	description = "�� ������������ �� ����?";
};


func int DIA_Sentenza_Vote_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sentenza_WannaJoin) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Sentenza_Vote_Info()
{
	AI_Output(other,self,"DIA_Sentenza_Vote_15_00");	//�� ������������ �� ����?
	if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Sentenza_Vote_09_01");	//������ ������, ��� �� ����� ����? (�������) ���.
	}
	else if((Npc_HasItems(self,ItMi_Gold) >= 50) && ((Sentenza_GoldTaken == TRUE) || (Sentenza_GoldGiven == TRUE)))
	{
		AI_Output(self,other,"DIA_Sentenza_Vote_09_02");	//����, ������ �� � ���? 50 ������� - ��� �������� ����� �� ��� �����, ���� ��� �� �������?
		Sentenza_Stimme = TRUE;
		B_LogEntry(TOPIC_SLDRespekt,"�������� �� ��������� ������ ����� ���������� � ���� ���������.");
	}
	else if((Sentenza_Stimme == TRUE) && (Npc_HasItems(self,ItMi_Gold) < 50))
	{
		AI_Output(self,other,"DIA_Sentenza_Vote_09_03");	//����� ����, ��� �� ������ ��� ������? ���� ��, ��� �������.
	}
	else
	{
		AI_Output(self,other,"DIA_Sentenza_Vote_09_04");	//� ���� ��� ������ �� ������, ������! ���� �� ������, ����� � ������������ �� ����, �� ������ ������������ ��� ������� ������.
		AI_Output(other,self,"DIA_Sentenza_Vote_15_05");	//�������?
		AI_Output(self,other,"DIA_Sentenza_Vote_09_06");	//50 �����. ��� ����, ������� ���� ��� ����� �������� �� ���������.
		Sentenza_Wants50 = TRUE;
	};
};


var int Sentenza_GoldGiven;

instance DIA_Sentenza_Pay50(C_Info)
{
	npc = SLD_814_Sentenza;
	nr = 5;
	condition = DIA_Sentenza_Pay50_Condition;
	information = DIA_Sentenza_Pay50_Info;
	permanent = TRUE;
	description = "��� ���� 50 ������� �����.";
};


func int DIA_Sentenza_Pay50_Condition()
{
	if((Sentenza_Wants50 == TRUE) && (Npc_HasItems(self,ItMi_Gold) < 50) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Sentenza_Pay50_Info()
{
	AI_Output(other,self,"DIA_Sentenza_Pay50_15_00");	//��� ���� 50 ������� �����.
	if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		AI_Output(self,other,"DIA_Sentenza_Pay50_09_01");	//�������, �������.
		Sentenza_GoldGiven = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Sentenza_Pay50_09_02");	//�� ������� �������� ����. 50 ������� � �� ������� ������! �����?
	};
};


var int Sentenza_Einmal;

instance DIA_Sentenza_GoldBack(C_Info)
{
	npc = SLD_814_Sentenza;
	nr = 6;
	condition = DIA_Sentenza_GoldBack_Condition;
	information = DIA_Sentenza_GoldBack_Info;
	permanent = TRUE;
	description = "����� ��� ��� ������!";
};


func int DIA_Sentenza_GoldBack_Condition()
{
	if(Npc_HasItems(self,ItMi_Gold) >= 50)
	{
		if((Sentenza_GoldGiven == FALSE) || (other.guild == GIL_SLD))
		{
			return TRUE;
		};
	};
};

func void DIA_Sentenza_GoldBack_Info()
{
	AI_Output(other,self,"DIA_Sentenza_GoldBack_15_00");	//����� ��� ��� ������!
	if((other.guild == GIL_SLD) && (Torlof_SentenzaCounted == TRUE) && (Sentenza_Einmal == FALSE))
	{
		AI_Output(self,other,"DIA_Sentenza_GoldBack_09_01");	//����� ����, ��� � ������������ �� ����?
		AI_Output(self,other,"DIA_Sentenza_GoldBack_09_02");	//�� ��, ������� ����������!
		Sentenza_Einmal = TRUE;
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Sentenza_GoldBack_09_03");	//����������! � ������ �������� ���� �� ���...
	};
};


instance DIA_Sentenza_AufsMaul(C_Info)
{
	npc = SLD_814_Sentenza;
	nr = 7;
	condition = DIA_Sentenza_AufsMaul_Condition;
	information = DIA_Sentenza_AufsMaul_Info;
	permanent = FALSE;
	description = "������, � ��� ��� � ���� ����� �������? ���� ��� �������? ";
};


func int DIA_Sentenza_AufsMaul_Condition()
{
	if((Npc_HasItems(self,ItMi_Gold) >= 50) || Npc_KnowsInfo(other,DIA_Jarvis_MissionKO))
	{
		return TRUE;
	};
};

func void DIA_Sentenza_AufsMaul_Info()
{
	AI_Output(other,self,"DIA_Sentenza_AufsMaul_15_00");	//������, � ��� ��� � ���� ����� �������? ���� ��� �������?
	AI_Output(self,other,"DIA_Sentenza_AufsMaul_09_01");	//(��� �������) �����, �� ��� ����� �����...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Sentenza_AufsMaulAgain(C_Info)
{
	npc = SLD_814_Sentenza;
	nr = 8;
	condition = DIA_Sentenza_AufsMaulAgain_Condition;
	information = DIA_Sentenza_AufsMaulAgain_Info;
	permanent = TRUE;
	description = "������ ����� ��������� �������!";
};


func int DIA_Sentenza_AufsMaulAgain_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sentenza_AufsMaul))
	{
		if((Npc_HasItems(self,ItMi_Gold) >= 50) || Npc_KnowsInfo(other,DIA_Jarvis_MissionKO))
		{
			return TRUE;
		};
	};
};

func void DIA_Sentenza_AufsMaulAgain_Info()
{
	AI_Output(other,self,"DIA_Sentenza_AufsMaulAgain_15_00");	//������ ����� ��������� �������!
	AI_Output(self,other,"DIA_Sentenza_AufsMaulAgain_09_01");	//��� �������...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Sentenza_PERM(C_Info)
{
	npc = SLD_814_Sentenza;
	nr = 1;
	condition = DIA_Sentenza_PERM_Condition;
	information = DIA_Sentenza_PERM_Info;
	permanent = TRUE;
	description = "��, ��� ����?";
};


func int DIA_Sentenza_PERM_Condition()
{
	return TRUE;
};

func void DIA_Sentenza_PERM_Info()
{
	AI_Output(other,self,"DIA_Sentenza_PERM_15_00");	//��, ��� ����?
	AI_Output(self,other,"DIA_Sentenza_PERM_09_01");	//���� ��� ������� ����, �� �� ���������� ������� ��� ��� ������� ��� ����.
	if(Npc_HasItems(self,ItMi_Gold) < 50)
	{
		AI_Output(self,other,"DIA_Sentenza_PERM_09_02");	//�� ����������� ����. (��������)
	};
};


instance DIA_Sentenza_PICKPOCKET(C_Info)
{
	npc = SLD_814_Sentenza;
	nr = 900;
	condition = DIA_Sentenza_PICKPOCKET_Condition;
	information = DIA_Sentenza_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Sentenza_PICKPOCKET_Condition()
{
	return C_Beklauen(56,65);
};

func void DIA_Sentenza_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Sentenza_PICKPOCKET);
	Info_AddChoice(DIA_Sentenza_PICKPOCKET,Dialog_Back,DIA_Sentenza_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Sentenza_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Sentenza_PICKPOCKET_DoIt);
};

func void DIA_Sentenza_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Sentenza_PICKPOCKET);
};

func void DIA_Sentenza_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Sentenza_PICKPOCKET);
};

