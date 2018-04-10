
instance DIA_Gritta_EXIT(C_Info)
{
	npc = VLK_418_Gritta;
	nr = 999;
	condition = DIA_Gritta_EXIT_Condition;
	information = DIA_Gritta_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Gritta_EXIT_Condition()
{
	if(Kapitel <= 2)
	{
		return TRUE;
	};
};

func void DIA_Gritta_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Gritta_PICKPOCKET(C_Info)
{
	npc = VLK_418_Gritta;
	nr = 900;
	condition = DIA_Gritta_PICKPOCKET_Condition;
	information = DIA_Gritta_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20_Female;
};


func int DIA_Gritta_PICKPOCKET_Condition()
{
	return C_Beklauen(20,20);
};

func void DIA_Gritta_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Gritta_PICKPOCKET);
	Info_AddChoice(DIA_Gritta_PICKPOCKET,Dialog_Back,DIA_Gritta_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Gritta_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Gritta_PICKPOCKET_DoIt);
};

func void DIA_Gritta_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Gritta_PICKPOCKET);
};

func void DIA_Gritta_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Gritta_PICKPOCKET);
};


instance DIA_Gritta_Hello(C_Info)
{
	npc = VLK_418_Gritta;
	nr = 10;
	condition = DIA_Gritta_Hello_Condition;
	information = DIA_Gritta_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Gritta_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gritta_Hello_Info()
{
	AI_Output(self,other,"DIA_Gritta_Hello_16_00");	//��� ���� �����, ���������? ���� �� ������ ������� ���������, � ��������� ������������ ����. � ������ �����.
	AI_Output(self,other,"DIA_Gritta_Hello_16_01");	//���� ����� ������. � ��� ���, ��� ���� ��� ���, � ����� �� ����� ����� ����, �������.
};


instance DIA_Gritta_WantsMoney(C_Info)
{
	npc = VLK_418_Gritta;
	nr = 2;
	condition = DIA_Gritta_WantsMoney_Condition;
	information = DIA_Gritta_WantsMoney_Info;
	permanent = FALSE;
	description = "���� ������� ������. �� �������, ��� �� ��������� ���.";
};


func int DIA_Gritta_WantsMoney_Condition()
{
	if(MIS_Matteo_Gold == LOG_Running)
	{
		return TRUE;
	};
};


var int Gritta_WantPay;
var int Gritta_Threatened;

func void DIA_Gritta_WantsMoney_Info()
{
	AI_Output(other,self,"DIA_Gritta_WantsMoney_15_00");	//���� ������� ������. �� �������, ��� �� ��������� ���.
	AI_Output(self,other,"DIA_Gritta_WantsMoney_16_01");	//�� ����� �������� ������? �� ���? ��, ��� �� ��� �������, �� �� ��� �� �������. ����� ��������������, � ��� ������������ ����� �� ������.
	AI_Output(self,other,"DIA_Gritta_WantsMoney_16_02");	//� �� �����, ������ ��� �����? ��� �� ��� ����, ��� � ����������. ��� ��������������!
	AI_Output(self,other,"DIA_Gritta_WantsMoney_16_03");	//��������, ���� �� ��� ��� ��� ���, �� �� �� ������ �������� �����. ��, ��� ������ ���...
	Info_ClearChoices(DIA_Gritta_WantsMoney);
	Info_AddChoice(DIA_Gritta_WantsMoney,"������. ��� ������?",DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice(DIA_Gritta_WantsMoney,"���������� ...",DIA_Gritta_WantsMoney_Continue01);
};

func void DIA_Gritta_WantsMoney_Continue01()
{
	AI_Output(self,other,"DIA_Gritta_WantsMoney_continue01_16_00");	//...�� ��� ����� ������� ���������. ��������, ���������, ��������� ����������. � ��� ���� ���. ���������, �������...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue01_16_01");	//...������ ��� ���� ���������� � ������ ����. �� ���������, ��� ����� ���� ������������ ������� � ���������...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue01_16_02");	//...�� ������ �����... ����� ��� ���� ������ ��-�������. ����� ����� �� �� ��������� ������� ������ ����� ������...
	Info_ClearChoices(DIA_Gritta_WantsMoney);
	Info_AddChoice(DIA_Gritta_WantsMoney,"������. ��� ������?",DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice(DIA_Gritta_WantsMoney,"���������� ...",DIA_Gritta_WantsMoney_Continue02);
};

func void DIA_Gritta_WantsMoney_Continue02()
{
	AI_Output(self,other,"DIA_Gritta_WantsMoney_continue02_16_00");	//...�������� �����������. � ��� ��� ������ ������? ��� ������ ��� ��������� ������� ����� � �������, � ����� ���������� ��� ������� � �������. �� �� ��� ��� ������ ������...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue02_16_01");	//...����� ���������� ��������� � ������ ���������� �����. ��� ����� ������ �� ���� ������� �� ������� � �����. ��� ��� ��� ��������� ��������� ������� - �� ����� ����, �� ���� ������ ���� ��������...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue02_16_02");	//...�� ����� ������ �������� �� ������ �������� ��� ������� - ���������� ����� � ��������, ������� ������ �� ����� �����...
	Info_ClearChoices(DIA_Gritta_WantsMoney);
	Info_AddChoice(DIA_Gritta_WantsMoney,"������. ��� ������?",DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice(DIA_Gritta_WantsMoney,"���������� ...",DIA_Gritta_WantsMoney_Continue03);
};

func void DIA_Gritta_WantsMoney_Continue03()
{
	AI_Output(self,other,"DIA_Gritta_WantsMoney_continue03_16_00");	//...����������� ���� �� ������� � ����� �����. �� �������, � �������� ��������, ��� ������ �������� - ��� ��������� ���� �������, ��� ��� ������ ��� ��� ��...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue03_16_01");	//...����� �� ���. � ������� � ��������, ����� ����� ���� ������� ������ � ���� ����������. � ���������, � ����� �������� � ���, �� ��� ��� ������� ���� ��������...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue04_16_02");	//...�� ������������� ����� ��� ��� �����. ����� �� ���� ��������. � ��� ��� ��� ���������� ���� ��� � ���� �������� ��������. � ������ ���� ���������, ������������ ������...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue04_16_03");	//...����� ������ � ���� ��������� ����������. ����������, ������� ��� ������ ��������. ���� �� ��� ��� ��� ���, ������ �� ������ �� ������� ���. ��, ��� ������ ���...
	Info_ClearChoices(DIA_Gritta_WantsMoney);
	Info_AddChoice(DIA_Gritta_WantsMoney,"������. ��� ������?",DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice(DIA_Gritta_WantsMoney,"���������� ...",DIA_Gritta_WantsMoney_Continue01);
};

func void DIA_Gritta_WantsMoney_WhereMoney()
{
	AI_Output(other,self,"DIA_Gritta_WantsMoney_WhereMoney_15_00");	//������. ��� ������?
	AI_Output(self,other,"DIA_Gritta_WantsMoney_WhereMoney_16_01");	//(���������) �� � ���� ��� ������, � ������ �����!
	Info_ClearChoices(DIA_Gritta_WantsMoney);
	Info_AddChoice(DIA_Gritta_WantsMoney,"���������� ������, ��� ��� �������� �������� ����!",DIA_Gritta_WantsMoney_BeatUp);
	Info_AddChoice(DIA_Gritta_WantsMoney,"������, ��� �������� ������� ���� ���� ...",DIA_Gritta_WantsMoney_EnoughStuff);
	Info_AddChoice(DIA_Gritta_WantsMoney,"� ��������� ��������� ��� ����� �� ����.",DIA_Gritta_WantsMoney_IWillPay);
};

func void DIA_Gritta_WantsMoney_EnoughStuff()
{
	AI_Output(other,self,"DIA_Gritta_WantsMoney_EnoughStuff_15_00");	//����� �� ������ �������� ��������� �� ����� ������. � ������, ��� � ����� ������� �� ����� �����...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_EnoughStuff_16_01");	//��� �� ������, �����������! �����, ���, ������ ������.
	B_GiveInvItems(self,other,ItMi_Gold,100);
	AI_Output(other,self,"DIA_Gritta_WantsMoney_EnoughStuff_15_02");	//(����������) ������, ��� ���� �� ��� �� ������.
	AI_Output(self,other,"DIA_Gritta_WantsMoney_EnoughStuff_16_03");	//(�����������) � ������, ����������, ������ ��� ���.
	Gritta_GoldGiven = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Gritta_WantsMoney_IWillPay()
{
	AI_Output(other,self,"DIA_Gritta_WantsMoney_IWillPay_15_00");	//� ��������� ��������� ��� ����� �� ����.
	AI_Output(self,other,"DIA_Gritta_WantsMoney_IWillPay_16_01");	//�� �������� ��� ���� ����? ��, � �����, ��� �� �� ����� ������ ��� ���� ������!
	AI_Output(other,self,"DIA_Gritta_WantsMoney_IWillPay_15_02");	//��, ��, �� ����� ��������������.
	AI_Output(self,other,"DIA_Gritta_WantsMoney_IWillPay_16_03");	//�����������, ����� ������� ������ ������ - � ���� ������������� ����.
	Info_ClearChoices(DIA_Gritta_WantsMoney);
	Gritta_WantPay = TRUE;
};

func void DIA_Gritta_WantsMoney_BeatUp()
{
	AI_Output(other,self,"DIA_Gritta_WantsMoney_BeatUp_15_00");	//(���������) ���������� ������, ��� ��� �������� �������� ����!
	AI_Output(self,other,"DIA_Gritta_WantsMoney_BeatUp_16_01");	//(���������) �� �� ������ ������� ������. �����, �������� ���� ������, � � ������ ������!
	Gritta_Threatened = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_Gritta_WINE(C_Info)
{
	npc = VLK_418_Gritta;
	nr = 2;
	condition = DIA_Gritta_WINE_Condition;
	information = DIA_Gritta_WINE_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Gritta_WINE_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Gritta_WantPay == TRUE) && (MIS_Matteo_Gold == LOG_SUCCESS) && (Npc_HasItems(self,ItMi_Gold) >= 100))
	{
		return TRUE;
	};
};

func void DIA_Gritta_WINE_Info()
{
	AI_Output(self,other,"DIA_Gritta_WINE_16_00");	//��� ���� ����� ���������� � ����� ������� ��������� �� ����. � ���� ������������� ����.
	AI_Output(self,other,"DIA_Gritta_WINE_16_01");	//��� ������� ����, ������� ��� ���, �� ������� ����� ��� ����, ������ � ����� ��������.
	AI_Output(self,other,"DIA_Gritta_WINE_16_02");	//����� � �������� � ���� ����! �������-�� � ������ �������� �������, ��� �����������...
	AI_Output(other,self,"DIA_Gritta_WINE_15_03");	//��-��, �� ����� ��������������.
	B_GivePlayerXP(XP_PayForGritta);
	B_GiveInvItems(self,other,ItFo_Wine,1);
	AI_StopProcessInfos(self);
};


instance DIA_Gritta_PERM(C_Info)
{
	npc = VLK_418_Gritta;
	nr = 3;
	condition = DIA_Gritta_PERM_Condition;
	information = DIA_Gritta_PERM_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Gritta_PERM_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && Npc_KnowsInfo(other,DIA_Gritta_WantsMoney) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Gritta_PERM_Info()
{
	if(Npc_KnowsInfo(other,DIA_Gritta_WINE) && (Npc_HasItems(self,ItMi_Gold) >= 100))
	{
		AI_Output(self,other,"DIA_Gritta_PERM_16_00");	//���� � ������ ���� ����� ���� ��� ��, ���� �� ��������� �������, ��� ��� ��� ����� ������.
	}
	else if((Gritta_WantPay == TRUE) && (Npc_HasItems(self,ItMi_Gold) >= 100))
	{
		AI_Output(self,other,"DIA_Gritta_PERM_16_01");	//�����������, ����� ������� ������ � ������.
	}
	else if((Gritta_Threatened == TRUE) && (Npc_HasItems(self,ItMi_Gold) >= 100))
	{
		AI_Output(self,other,"DIA_Gritta_PERM_16_02");	//��� �� ��������� �� ���� ��� �����? �� ��� ����� �� ���������� ������� ����!
	}
	else
	{
		AI_Output(self,other,"DIA_Gritta_PERM_16_03");	//��� ��� ���� �����? �� ������� ��� ������! ��������!
	};
	AI_StopProcessInfos(self);
};


instance DIA_Gritta_Kap3_EXIT(C_Info)
{
	npc = VLK_418_Gritta;
	nr = 999;
	condition = DIA_Gritta_Kap3_EXIT_Condition;
	information = DIA_Gritta_Kap3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Gritta_Kap3_EXIT_Condition()
{
	if(Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Gritta_Kap3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


var int GrittaXP_Once;

instance DIA_Gritta_Perm3U4U5(C_Info)
{
	npc = VLK_418_Gritta;
	nr = 31;
	condition = DIA_Gritta_Perm3U4U5_Condition;
	information = DIA_Gritta_Perm3U4U5_Info;
	permanent = TRUE;
	description = "��� ����?";
};


func int DIA_Gritta_Perm3U4U5_Condition()
{
	return TRUE;
};

func void DIA_Gritta_Perm3U4U5_Info()
{
	AI_Output(other,self,"DIA_Gritta_Perm3U4U5_15_00");	//��� ����?
	if(Kapitel == 3)
	{
		if(MIS_RescueBennet != LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Gritta_Perm3U4U5_16_01");	//��� ����� ������� � ���������. ���� �� ���������, ����� ���� ������������ � �������. ������ ���������, ������� ����� ���� ��������!
			Info_ClearChoices(DIA_Gritta_Perm3U4U5);
			Info_AddChoice(DIA_Gritta_Perm3U4U5,Dialog_Back,DIA_Gritta_Perm3U4U5_BACK);
			Info_AddChoice(DIA_Gritta_Perm3U4U5,"��� ����� - ���� ���. ����� ���������.",DIA_Gritta_Perm3U4U5_War);
			Info_AddChoice(DIA_Gritta_Perm3U4U5,"��� ����� ������.",DIA_Gritta_Perm3U4U5_TurnsGood);
			Info_AddChoice(DIA_Gritta_Perm3U4U5,"��� �� �������?",DIA_Gritta_Perm3U4U5_Rumors);
		}
		else
		{
			AI_Output(self,other,"DIA_Gritta_Perm3U4U5_16_02");	//��, � ��� �����������. ���� ����� ��������� ����� ��������.
			AI_Output(other,self,"DIA_Gritta_Perm3U4U5_15_03");	//� ����� ��� ����� ��������� � ����?
			AI_Output(self,other,"DIA_Gritta_Perm3U4U5_16_04");	//�� �� ��� �������. �� ������, ��� �������� ������ ��, ����� ����, ����� �� �������� ���������� ��������?
			AI_Output(self,other,"DIA_Gritta_Perm3U4U5_16_05");	//��� �� ���������� ���������� ���, � ��������� �� ����� �����. ��, ����� ������, ��� ����������� ������.
		};
	}
	else if(Kapitel == 5)
	{
		AI_Output(self,other,"DIA_Gritta_Perm3U4U5_16_06");	//�������� � ����-�� ���������. ������, ��� ���������� ������� �� ������.
	}
	else
	{
		AI_Output(self,other,"DIA_Gritta_Perm3U4U5_16_07");	//��� ��� ������, �� � �� ���� ����������.
	};
};

func void DIA_Gritta_Perm3U4U5_BACK()
{
	Info_ClearChoices(DIA_Gritta_Perm3U4U5);
};

func void DIA_Gritta_Perm3U4U5_War()
{
	AI_Output(other,self,"DIA_Gritta_Perm3U4U5_War_15_00");	//��� ����� - ���� ���. ����� ���������.
	AI_Output(self,other,"DIA_Gritta_Perm3U4U5_War_16_01");	//��, ����� ����� ��� ������� �����. ��� �������� �� ���. �� ���� ����, ��� �� ������� ������� ����� � �������.
	AI_Output(self,other,"DIA_Gritta_Perm3U4U5_War_16_02");	//������ � ��������� ����, ��� �� �������, ����� ��������� ����� ��������� �� ������.
};

func void DIA_Gritta_Perm3U4U5_TurnsGood()
{
	AI_Output(other,self,"DIA_Gritta_Perm3U4U5_TurnsGood_15_00");	//��� ����� ������.
	AI_Output(self,other,"DIA_Gritta_Perm3U4U5_TurnsGood_16_01");	//�� ��������� ���������� ����. ��� ����.
	if(GrittaXP_Once == FALSE)
	{
		B_GivePlayerXP(XP_Ambient);
		GrittaXP_Once = TRUE;
	};
};

func void DIA_Gritta_Perm3U4U5_Rumors()
{
	AI_Output(other,self,"DIA_Gritta_Perm3U4U5_Rumors_15_00");	//��� �� �������?
	AI_Output(self,other,"DIA_Gritta_Perm3U4U5_Rumors_16_01");	//������ ��, ��� ������� �� ������.
	AI_Output(self,other,"DIA_Gritta_Perm3U4U5_Rumors_16_02");	//� �������, ��� ������ ��� �������, �� � �� ����, ������ ��� ��� ���.
};

