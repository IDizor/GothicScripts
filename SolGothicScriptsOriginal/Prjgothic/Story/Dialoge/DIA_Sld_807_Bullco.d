
instance DIA_Bullco_EXIT(C_Info)
{
	npc = Sld_807_Bullco;
	nr = 999;
	condition = DIA_Bullco_EXIT_Condition;
	information = DIA_Bullco_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bullco_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Bullco_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Bullco_Hallo(C_Info)
{
	npc = Sld_807_Bullco;
	nr = 1;
	condition = DIA_Bullco_Hallo_Condition;
	information = DIA_Bullco_Hallo_Info;
	permanent = TRUE;
	description = "��� ����� ����� ���������...";
};


func int DIA_Bullco_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Bullco_Hallo_Info()
{
	AI_Output(other,self,"DIA_Bullco_HALLO_15_00");	//��� ����� ����� ���������...
	if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Bullco_HALLO_06_01");	//��������, �� �������! ������ ������ ���� � �����.
	}
	else
	{
		AI_Output(self,other,"DIA_Bullco_HALLO_06_02");	//� ������ �� ���� ����� �� ����.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Bullco_Quatscher(C_Info)
{
	npc = Sld_807_Bullco;
	nr = 2;
	condition = DIA_Bullco_Quatscher_Condition;
	information = DIA_Bullco_Quatscher_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Bullco_Quatscher_Condition()
{
	if((self.aivar[AIV_DefeatedByPlayer] == FALSE) && (Sylvio_angequatscht >= 2))
	{
		return TRUE;
	};
};

func void DIA_Bullco_Quatscher_Info()
{
	AI_Output(self,other,"DIA_Bullco_Quatscher_06_00");	//������� �� ����� ��������. �� ��� �� ������ ��� ���.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"PEE");
	B_Attack(self,other,AR_NONE,1);
};


var int Bullco_Leave_Day;
var int Bullco_scharf;

instance DIA_Bullco_PleaseLeave(C_Info)
{
	npc = Sld_807_Bullco;
	nr = 3;
	condition = DIA_Bullco_PleaseLeave_Condition;
	information = DIA_Bullco_PleaseLeave_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Bullco_PleaseLeave_Condition()
{
	if(self.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		if((self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE) || (Sylvio_MenDefeated == TRUE))
		{
			return TRUE;
		};
	};
};

func void DIA_Bullco_PleaseLeave_Info()
{
	AI_Output(self,other,"DIA_Bullco_PleaseLeave_06_00");	//��� ����� ����������. ���� � ���.
	AI_Output(other,self,"DIA_Bullco_PleaseLeave_15_01");	//��� ���� �����?
	AI_Output(self,other,"DIA_Bullco_PleaseLeave_06_02");	//� �����, ����� ����� ��� ����, ���� ���� ���������� ������ �� ����� ������� �� ���� �����.
	AI_Output(self,other,"DIA_Bullco_PleaseLeave_06_03");	//����� ������ ����� ���� ����� �� ����. �� ������ ���� �����?
	Bullco_Leave_Day = B_GetDayPlus();
	Bullco_scharf = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"PEE");
};


var int Bullco_HitCounter;

instance DIA_Bullco_DailyCheck(C_Info)
{
	npc = Sld_807_Bullco;
	nr = 4;
	condition = DIA_Bullco_DailyCheck_Condition;
	information = DIA_Bullco_DailyCheck_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Bullco_DailyCheck_Condition()
{
	if((self.aivar[AIV_DefeatedByPlayer] == FALSE) && (Bullco_scharf == TRUE) && (Wld_GetDay() > Bullco_Leave_Day))
	{
		return TRUE;
	};
};

func void DIA_Bullco_DailyCheck_Info()
{
	if(Bullco_HitCounter == 0)
	{
		AI_Output(self,other,"DIA_Bullco_DailyCheck_06_00");	//�� ��� ��� �����...
		AI_Output(self,other,"DIA_Bullco_DailyCheck_06_01");	//� �-�� �����, �� ������������, ��� � ������� ���� ���� � �����.
		AI_Output(self,other,"DIA_Bullco_DailyCheck_06_02");	//���� ������ ������������ � ���� ������.
	}
	else
	{
		AI_Output(self,other,"DIA_Bullco_DailyCheck_06_03");	//������ ����� �� ����! ���� ���� ��� ��� �����!
	};
	Bullco_HitCounter = Bullco_HitCounter + 1;
	B_GetDayPlus();
	AI_StopProcessInfos(self)Bullco_Leave_Day == ;
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Bullco_WontLeave(C_Info)
{
	npc = Sld_807_Bullco;
	nr = 5;
	condition = DIA_Bullco_WontLeave_Condition;
	information = DIA_Bullco_WontLeave_Info;
	permanent = FALSE;
	description = "� �� ��������� ������� ������!";
};


func int DIA_Bullco_WontLeave_Condition()
{
	if(Bullco_scharf == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Bullco_WontLeave_Info()
{
	AI_Output(other,self,"DIA_Bullco_WontLeave_15_00");	//� �� ��������� ������� ������!
	if(self.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		AI_Output(self,other,"DIA_Bullco_WontLeave_06_01");	//(��������) ������, ��� �������� �������� ���� ������ �����.
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Bullco_WontLeave_06_02");	//(��������) ��, ��, ���, �������� ��� ����-������, ���� ��� ���������.
		Bullco_scharf = FALSE;
		AI_StopProcessInfos(self);
	};
};


instance DIA_Bullco_PepesSchafe(C_Info)
{
	npc = Sld_807_Bullco;
	nr = 6;
	condition = DIA_Bullco_PepesSchafe_Condition;
	information = DIA_Bullco_PepesSchafe_Info;
	permanent = FALSE;
	description = "���� ��� ���� ������� � ���-������?";
};


func int DIA_Bullco_PepesSchafe_Condition()
{
	if((MIS_Pepe_KillWolves == LOG_SUCCESS) && (Bullco_scharf == TRUE) && (Onar_WegenPepe == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Bullco_PepesSchafe_Info()
{
	AI_Output(other,self,"DIA_Bullco_PepesSchafe_15_00");	//���� ��� ���� ������� � ���-������?
	AI_Output(self,other,"DIA_Bullco_PepesSchafe_06_01");	//� ��������� �� �������, � ��� �� ��������, �� ���� ��� ��� �� ��������!
	AI_Output(other,self,"DIA_Bullco_PepesSchafe_15_02");	//�� ������ ��� �������� ����.
	AI_Output(self,other,"DIA_Bullco_PepesSchafe_06_03");	//����� ��� ���� �� ����?
	AI_Output(other,self,"DIA_Bullco_PepesSchafe_15_04");	//�� ��� ���� ���� ��.
	AI_Output(self,other,"DIA_Bullco_PepesSchafe_06_05");	//�� ��� �� ���������?
	AI_Output(other,self,"DIA_Bullco_PepesSchafe_15_06");	//���� �� ���������� ����������� ��� �� �����, � ����������, ����� ���� �������� ��������� �� ����.
	AI_Output(other,self,"DIA_Bullco_PepesSchafe_15_07");	//��� ��� ���� ���� ������� ���� ���������, ������ ���� � �����!
	AI_Output(self,other,"DIA_Bullco_PepesSchafe_06_08");	//(� ������) ��, ��...
	AI_Output(other,self,"DIA_Bullco_PepesSchafe_15_09");	//(��������) ��?
	AI_Output(self,other,"DIA_Bullco_PepesSchafe_06_10");	//(���� ��� ���) ������� �������� �������...
	Bullco_scharf = FALSE;
	B_GivePlayerXP(XP_Ambient);
	AI_StopProcessInfos(self);
};


instance DIA_BullcoSLD_PICKPOCKET(C_Info)
{
	npc = Sld_807_Bullco;
	nr = 900;
	condition = DIA_BullcoSLD_PICKPOCKET_Condition;
	information = DIA_BullcoSLD_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_BullcoSLD_PICKPOCKET_Condition()
{
	return C_Beklauen(56,35);
};

func void DIA_BullcoSLD_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_BullcoSLD_PICKPOCKET);
	Info_AddChoice(DIA_BullcoSLD_PICKPOCKET,Dialog_Back,DIA_BullcoSLD_PICKPOCKET_BACK);
	Info_AddChoice(DIA_BullcoSLD_PICKPOCKET,DIALOG_PICKPOCKET,DIA_BullcoSLD_PICKPOCKET_DoIt);
};

func void DIA_BullcoSLD_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_BullcoSLD_PICKPOCKET);
};

func void DIA_BullcoSLD_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_BullcoSLD_PICKPOCKET);
};

