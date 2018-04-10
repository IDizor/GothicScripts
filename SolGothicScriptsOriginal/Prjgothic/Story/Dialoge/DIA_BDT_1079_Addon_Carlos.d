
instance DIA_Addon_Carlos_EXIT(C_Info)
{
	npc = BDT_1079_Addon_Carlos;
	nr = 999;
	condition = DIA_Addon_Carlos_EXIT_Condition;
	information = DIA_Addon_Carlos_EXIT_Info;
	permanent = TRUE;
	description = "��� ��������.";
};


func int DIA_Addon_Carlos_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Carlos_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Carlos_PICKPOCKET(C_Info)
{
	npc = BDT_1079_Addon_Carlos;
	nr = 900;
	condition = DIA_Addon_Carlos_PICKPOCKET_Condition;
	information = DIA_Addon_Carlos_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Addon_Carlos_PICKPOCKET_Condition()
{
	return C_Beklauen(71,85);
};

func void DIA_Addon_Carlos_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Carlos_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Carlos_PICKPOCKET,Dialog_Back,DIA_Addon_Carlos_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Carlos_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Carlos_PICKPOCKET_DoIt);
};

func void DIA_Addon_Carlos_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Carlos_PICKPOCKET);
};

func void DIA_Addon_Carlos_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Carlos_PICKPOCKET);
};


instance DIA_Addon_Carlos_HI(C_Info)
{
	npc = BDT_1079_Addon_Carlos;
	nr = 1;
	condition = DIA_Addon_Carlos_HI_Condition;
	information = DIA_Addon_Carlos_HI_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Carlos_HI_Condition()
{
	if(Npc_IsDead(Franco))
	{
		return TRUE;
	};
};

func void DIA_Addon_Carlos_HI_Info()
{
	AI_Output(self,other,"DIA_Addon_Carlos_HI_12_00");	//��, ��� �� ��� ������, ��� �������� ������?
	Info_ClearChoices(DIA_Addon_Carlos_HI);
	Info_AddChoice(DIA_Addon_Carlos_HI,"���? �? ���!",DIA_Addon_Carlos_HI_No);
	Info_AddChoice(DIA_Addon_Carlos_HI,"��, � ������ �� �����������?",DIA_Addon_Carlos_HI_Yes);
};

func void DIA_Addon_Carlos_HI_Yes()
{
	AI_Output(other,self,"DIA_Addon_Carlos_HI_Yes_15_00");	//��, � ������ �� �����������?
	AI_Output(self,other,"DIA_Addon_Carlos_HI_Yes_12_01");	//(���) ������ ��� ������ ��� �������� ���������� ��� �������. ������ ���������, �������! ������� ��������!
	Info_ClearChoices(DIA_Addon_Carlos_HI);
};

func void DIA_Addon_Carlos_HI_No()
{
	AI_Output(other,self,"DIA_Addon_Carlos_HI_No_15_00");	//���? �? ���!
	AI_Output(self,other,"DIA_Addon_Carlos_HI_No_12_01");	//�, ������ �������!
	Info_ClearChoices(DIA_Addon_Carlos_HI);
};


instance DIA_Addon_Carlos_Attentat(C_Info)
{
	npc = BDT_1079_Addon_Carlos;
	nr = 2;
	condition = DIA_Addon_Carlos_Attentat_Condition;
	information = DIA_Addon_Carlos_Attentat_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};


func int DIA_Addon_Carlos_Attentat_Condition()
{
	if(MIS_Judas == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Carlos_Attentat_Info()
{
	B_Say(other,self,"$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Carlos_Attentat_12_00");	//����� ���� ��� ���������� ��� ����, ����� �������� ��� ����� ������ �������� ��� ������.
	if(Logan_Inside == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Carlos_Attentat_12_01");	//� ������ ������ ������.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Carlos_Attentat_12_02");	//� ������ ������ ������ �����.
	};
	AI_Output(self,other,"DIA_Addon_Carlos_Attentat_12_03");	//��, � ������ ����� ��, ��� ��� ������ �����. � ������ �� ���� ��� ���� ���������.
};


instance DIA_Addon_Carlos_PERM(C_Info)
{
	npc = BDT_1079_Addon_Carlos;
	nr = 3;
	condition = DIA_Addon_Carlos_PERM_Condition;
	information = DIA_Addon_Carlos_PERM_Info;
	permanent = TRUE;
	description = "� ��� ���� �������� ���� ���������� � ���������?";
};


func int DIA_Addon_Carlos_PERM_Condition()
{
	return TRUE;
};

func void DIA_Addon_Carlos_PERM_Info()
{
	AI_Output(other,self,"DIA_Addon_Carlos_PERM_15_00");	//� ��� ���� �������� ���� ���������� � ���������?
	AI_Output(self,other,"DIA_Addon_Carlos_PERM_12_00");	//������ ���� � �����!
	AI_StopProcessInfos(self);
};

