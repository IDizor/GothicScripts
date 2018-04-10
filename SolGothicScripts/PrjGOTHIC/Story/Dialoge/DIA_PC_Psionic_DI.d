
instance DIA_Lester_DI_EXIT(C_Info)
{
	npc = PC_Psionic_DI;
	nr = 999;
	condition = DIA_Lester_DI_EXIT_Condition;
	information = DIA_Lester_DI_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lester_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Lester_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lester_DI_Hello(C_Info)
{
	npc = PC_Psionic_DI;
	nr = 1;
	condition = DIA_Lester_DI_Hello_Condition;
	information = DIA_Lester_DI_Hello_Info;
	permanent = TRUE;
	description = "�� ������ ���-�� ������� ���?";
};


func int DIA_Lester_DI_Hello_Condition()
{
	if(Npc_IsDead(UndeadDragon) == FALSE)
	{
		return TRUE;
	};
};


var int DIA_Lester_DI_SCGotWarning1;
var int DIA_Lester_DI_SCGotWarning2;

func void DIA_Lester_DI_Hello_Info()
{
	AI_Output(other,self,"DIA_Lester_DI_Hello_15_00");	//�� ������ ���-�� ������� ���?
	if((Npc_IsDead(Mario_DI) == FALSE) && (ORkSturmDI == TRUE) && (DIA_Lester_DI_SCGotWarning1 == FALSE))
	{
		AI_Output(self,other,"DIA_Lester_DI_Hello_13_01");	//����� ������, ����� �� ��� ������ ����. �������� �� ���� ����, ��� �������� �� �������, � ���� ���������� �� ���.
		AI_Output(self,other,"DIA_Lester_DI_Hello_13_02");	//�� ������ ����� ����� ���� �����, � �� ��� ���� ������� �� �������.
		AI_Output(self,other,"DIA_Lester_DI_Hello_13_03");	//� � ������ ������ �� ������� ����� �����. �� ������ � ������.
		B_GivePlayerXP(XP_Ambient);
		DIA_Lester_DI_SCGotWarning1 = TRUE;
	}
	else if((Npc_IsDead(Mario_DI) == FALSE) && (DIA_Lester_DI_SCGotWarning2 == FALSE))
	{
		AI_Output(self,other,"DIA_Lester_DI_Hello_13_04");	//���� �������� ������, ������� �������� ���� �����, ��� �� ��������. � ���� ������� ����.
		AI_Output(self,other,"DIA_Lester_DI_Hello_13_05");	//���� ���������, ��� ����.
		DIA_Lester_DI_SCGotWarning2 = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Lester_DI_Hello_13_06");	//���� ���. ����� ���� �����.
	};
};


instance DIA_Lester_DI_MarioArsch(C_Info)
{
	npc = PC_Psionic_DI;
	nr = 2;
	condition = DIA_Lester_DI_MarioArsch_Condition;
	information = DIA_Lester_DI_MarioArsch_Info;
	description = "�� ��� ����. ����� ������ ���.";
};


func int DIA_Lester_DI_MarioArsch_Condition()
{
	if(((DIA_Lester_DI_SCGotWarning2 == TRUE) || (DIA_Lester_DI_SCGotWarning2 == TRUE)) && (MIS_Mario_Ambush == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Lester_DI_MarioArsch_Info()
{
	AI_Output(other,self,"DIA_Lester_DI_MarioArsch_15_00");	//�� ��� ����. ����� ������ ���.
	AI_Output(self,other,"DIA_Lester_DI_MarioArsch_13_01");	//��. �������� � �� �����-�� ��������������, �� � ���� ������ ��� ���� ���� � ������ ������.
	AI_Output(self,other,"DIA_Lester_DI_MarioArsch_13_02");	//���������� ���������� �������� ���� ����������� � �������.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_PC_Lester_DI_UndeadDragonDead(C_Info)
{
	npc = PC_Psionic_DI;
	nr = 5;
	condition = DIA_PC_Lester_DI_UndeadDragonDead_Condition;
	information = DIA_PC_Lester_DI_UndeadDragonDead_Info;
	permanent = TRUE;
	description = "�� ����� ����� �� ����������.";
};


func int DIA_PC_Lester_DI_UndeadDragonDead_Condition()
{
	if(Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};


var int DIA_PC_Lester_DI_UndeadDragonDead_OneTime;

func void DIA_PC_Lester_DI_UndeadDragonDead_Info()
{
	AI_Output(other,self,"DIA_PC_Lester_DI_UndeadDragonDead_15_00");	//�� ����� ����� �� ����������.
	if(DIA_PC_Lester_DI_UndeadDragonDead_OneTime == FALSE)
	{
		if(Npc_GetDistToWP(self,"DI_DRACONIANAREA_19") < 4000)
		{
			AI_Output(self,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_01");	//������, ��� �������� ���� ����.
			AI_Output(self,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_02");	//��� ���� ������� ���?
			AI_Output(other,self,"DIA_PC_Lester_DI_UndeadDragonDead_15_03");	//� ��������� �����.
			AI_Output(self,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_04");	//��, ������ ����, ��� ����� �����. ��� ��� ��� ���, ���-����?
			AI_Output(other,self,"DIA_PC_Lester_DI_UndeadDragonDead_15_05");	//������-������.
		};
		if(SC_KnowsMadPsi == TRUE)
		{
			AI_Output(other,self,"DIA_PC_Lester_DI_UndeadDragonDead_15_06");	//���� ������ ���� �� ��������� ������ �������� ��� ������ ������.
			AI_Output(self,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_07");	//��. ���� �������� ������� ����. ��� ���� ������. � ���������, ��� ������� �� ���� ����.
			AI_Output(self,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_08");	//��� ����������� ��������� �����, ����� �������� ��� ���.
		};
		DIA_PC_Lester_DI_UndeadDragonDead_OneTime = TRUE;
	};
	AI_Output(self,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_09");	//�� �������, ������ ������ ������ �� ����������. �� ���� ���� ��� ������� �������� �����, ������� � ����� ������ ��������.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_Psionic_DI_PICKPOCKET(C_Info)
{
	npc = PC_Psionic_DI;
	nr = 900;
	condition = DIA_Psionic_DI_PICKPOCKET_Condition;
	information = DIA_Psionic_DI_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Psionic_DI_PICKPOCKET_Condition()
{
	return C_Beklauen(56,25);
};

func void DIA_Psionic_DI_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Psionic_DI_PICKPOCKET);
	Info_AddChoice(DIA_Psionic_DI_PICKPOCKET,Dialog_Back,DIA_Psionic_DI_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Psionic_DI_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Psionic_DI_PICKPOCKET_DoIt);
};

func void DIA_Psionic_DI_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Psionic_DI_PICKPOCKET);
};

func void DIA_Psionic_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Psionic_DI_PICKPOCKET);
};

