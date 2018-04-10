
instance DIA_DJG_715_Ferros_EXIT(C_Info)
{
	npc = DJG_715_Ferros;
	nr = 999;
	condition = DIA_DJG_715_Ferros_EXIT_Condition;
	information = DIA_DJG_715_Ferros_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_DJG_715_Ferros_EXIT_Condition()
{
	return TRUE;
};

func void DIA_DJG_715_Ferros_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DJG_715_Ferros_Hello(C_Info)
{
	npc = DJG_715_Ferros;
	nr = 4;
	condition = DIA_DJG_715_Ferros_Hello_Condition;
	information = DIA_DJG_715_Ferros_Hello_Info;
	permanent = FALSE;
	description = "������ ��?";
};


func int DIA_DJG_715_Ferros_Hello_Condition()
{
	return TRUE;
};

func void DIA_DJG_715_Ferros_Hello_Info()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_Hello_15_00");	//������ ��?
	AI_Output(self,other,"DIA_DJG_715_Ferros_Hello_01_01");	//� ��������. ��� ���� � � ������ ������.
	AI_Output(self,other,"DIA_DJG_715_Ferros_Hello_01_02");	//��� ���������� ��� ����. ���� ������� �� ����� ���, ��� �����.
	AI_Output(self,other,"DIA_DJG_715_Ferros_Hello_01_03");	//������ ������� �������� ��� ����� ������������.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_DJG_715_Ferros_Hello_01_04");	//��, ��������, ��������� ��� ����, ���� ���� ��������� ��� ������.
	};
};


instance DIA_DJG_715_Ferros_Friends(C_Info)
{
	npc = DJG_715_Ferros;
	nr = 5;
	condition = DIA_DJG_715_Ferros_Friends_Condition;
	information = DIA_DJG_715_Ferros_Friends_Info;
	permanent = FALSE;
	description = "� ��� ������ ���� ����?";
};


func int DIA_DJG_715_Ferros_Friends_Condition()
{
	if(Npc_KnowsInfo(other,DIA_DJG_715_Ferros_Hello))
	{
		return TRUE;
	};
};

func void DIA_DJG_715_Ferros_Friends_Info()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_Friends_15_00");	//� ��� ������ ���� ����?
	AI_Output(self,other,"DIA_DJG_715_Ferros_Friends_01_01");	//� ������� ��.
	AI_Output(self,other,"DIA_DJG_715_Ferros_Friends_01_02");	//��� ������, ��� �� ��������� ����� ���, ��� �� ������, ���� ���� ��� �� ����������� ��. � �� ���� ��������� � ���� �������.
};


instance DIA_DJG_715_Ferros_War(C_Info)
{
	npc = DJG_715_Ferros;
	nr = 6;
	condition = DIA_DJG_715_Ferros_War_Condition;
	information = DIA_DJG_715_Ferros_War_Info;
	permanent = FALSE;
	description = "��� ��� �� ������ � �����?";
};


func int DIA_DJG_715_Ferros_War_Condition()
{
	if(Npc_KnowsInfo(other,DIA_DJG_715_Ferros_Hello))
	{
		return TRUE;
	};
};

func void DIA_DJG_715_Ferros_War_Info()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_War_15_00");	//��� ��� �� ������ � �����?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_DJG_715_Ferros_War_01_01");	//�� ���� ����� �� ����� ������ ������, �?
	};
	AI_Output(self,other,"DIA_DJG_715_Ferros_War_01_02");	//���� �������� �������. �� ���� ��� ��� ��� ���, � �� ����.
	AI_Output(self,other,"DIA_DJG_715_Ferros_War_01_03");	//���������, ��� � ������, - ��� ������ �����. �� � � ��� �� ����.
};


instance DIA_DJG_715_Ferros_OldCamp(C_Info)
{
	npc = DJG_715_Ferros;
	nr = 7;
	condition = DIA_DJG_715_Ferros_OldCamp_Condition;
	information = DIA_DJG_715_Ferros_OldCamp_Info;
	permanent = FALSE;
	description = "� ��� �� ������� �����, � �����?";
};


func int DIA_DJG_715_Ferros_OldCamp_Condition()
{
	return TRUE;
};

func void DIA_DJG_715_Ferros_OldCamp_Info()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_OldCamp_15_00");	//� ��� �� ������� �����, � �����?
	AI_Output(self,other,"DIA_DJG_715_Ferros_OldCamp_01_01");	//� ������� � �������� � ������ ������ ��������� � ����.
	AI_Output(self,other,"DIA_DJG_715_Ferros_OldCamp_01_02");	//� ���������, � ������� ���� ���, ����� ���������� ���� �����. � ��� � ������� �����.
	AI_Output(self,other,"DIA_DJG_715_Ferros_OldCamp_01_03");	//��� ���� � �� ���� ����� ������, � �� ����, ��� ������� �����, - ����������� ����.
	Info_ClearChoices(DIA_DJG_715_Ferros_OldCamp);
	Info_AddChoice(DIA_DJG_715_Ferros_OldCamp,"� ����� ���� ����� � ����� �������.",DIA_DJG_715_Ferros_OldCamp_No);
	Info_AddChoice(DIA_DJG_715_Ferros_OldCamp,"��� �� ���� ���, ���� � ����� ���� ���?",DIA_DJG_715_Ferros_OldCamp_Price);
	Info_AddChoice(DIA_DJG_715_Ferros_OldCamp,"� ����� ���� ���.",DIA_DJG_715_Ferros_OldCamp_Yes);
	Wld_InsertItem(ItMW_1H_FerrosSword_Mis,"FP_OW_ITEM_08");
	MIS_FErrosSword = LOG_Running;
	Log_CreateTopic(TOPIC_FerrosSword,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FerrosSword,LOG_Running);
	B_LogEntry(TOPIC_FerrosSword,"����� ������� ���� ��� ��-�� �����. ��� ���� ���������.");
};

func void DIA_DJG_715_Ferros_OldCamp_No()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_OldCamp_No_15_00");	//� ����� ���� ����� � ����� �������.
	AI_Output(self,other,"DIA_DJG_715_Ferros_OldCamp_No_01_01");	//� ��� ����� ���� ������ - � ����� � ������ ������ ����?
	Info_ClearChoices(DIA_DJG_715_Ferros_OldCamp);
};

func void DIA_DJG_715_Ferros_OldCamp_Price()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_OldCamp_Price_15_00");	//��� �� ���� ���, ���� � ����� ���� ���?
	AI_Output(self,other,"DIA_DJG_715_Ferros_OldCamp_Price_01_01");	//����, � ������ �� ���� ����. � �������� ��� ���� ������ �� ���� ���.
	Info_ClearChoices(DIA_DJG_715_Ferros_OldCamp);
};

func void DIA_DJG_715_Ferros_OldCamp_Yes()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_OldCamp_Yes_15_00");	//� ����� ���� ���.
	AI_Output(self,other,"DIA_DJG_715_Ferros_OldCamp_Yes_01_01");	//��� ���� �� �����������. ���� ����� �������� � �������� ����� �� ���.
	AI_Output(self,other,"DIA_DJG_715_Ferros_OldCamp_Yes_01_02");	//�, ��������, ������� ��� ���, ����� ������� �����.
	B_LogEntry(TOPIC_FerrosSword,"������, ����� ������� ���� ��� �� ������� ����� �� ���, ���, ��� ��������� ������� �����.");
	Info_ClearChoices(DIA_DJG_715_Ferros_OldCamp);
};


instance DIA_DJG_715_Ferros_FerrosAnySword(C_Info)
{
	npc = DJG_715_Ferros;
	nr = 6;
	condition = DIA_DJG_715_Ferros_FerrosAnySword_Condition;
	information = DIA_DJG_715_Ferros_FerrosAnySword_Info;
	permanent = FALSE;
	description = "��������, � ���� ���� ��� ���� ������ ���.";
};


func int DIA_DJG_715_Ferros_FerrosAnySword_Condition()
{
	if((MIS_FErrosSword == LOG_Running) && ((Npc_HasItems(other,ItMw_1H_Special_01) >= 1) || (Npc_HasItems(other,ItMw_1H_Special_02) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_DJG_715_Ferros_FerrosAnySword_Info()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_FerrosAnySword_Silverblade_15_00");	//��������, � ���� ���� ��� ���� ������ ���.
	Info_ClearChoices(DIA_DJG_715_Ferros_FerrosAnySword);
	Info_AddChoice(DIA_DJG_715_Ferros_FerrosAnySword,Dialog_Back,DIA_DJG_715_Ferros_FerrosAnySword_Back);
	if(Npc_HasItems(other,ItMw_1H_Special_01) >= 1)
	{
		Info_AddChoice(DIA_DJG_715_Ferros_FerrosAnySword,ItMw_1H_Special_01.name,DIA_DJG_715_Ferros_FerrosAnySword_Silverblade);
	};
	if(Npc_HasItems(other,ItMw_1H_Special_02) >= 1)
	{
		Info_AddChoice(DIA_DJG_715_Ferros_FerrosAnySword,ItMw_1H_Special_02.name,DIA_DJG_715_Ferros_FerrosAnySword_Oreblade);
	};
};

func void DIA_DJG_715_Ferros_FerrosAnySword_Back()
{
	Info_ClearChoices(DIA_DJG_715_Ferros_FerrosAnySword);
};

func void B_Ferros_FerrosAnySword_Give()
{
	AI_Output(self,other,"DIA_DJG_715_Ferros_FerrosAnySword_Give_01_00");	//��� ������� ������. ������������ ������.
	AI_Output(self,other,"DIA_DJG_715_Ferros_FerrosAnySword_Give_01_01");	//�� ������, ��� ������ ������ ��� ��� ������ ���?
};

func void DIA_DJG_715_Ferros_FerrosAnySword_Silverblade()
{
	B_Ferros_FerrosAnySword_Give();
	Info_ClearChoices(DIA_DJG_715_Ferros_FerrosAnySword);
	Info_AddChoice(DIA_DJG_715_Ferros_FerrosAnySword,"���, �� ����� ��� ������.",DIA_DJG_715_Ferros_FerrosAnySword_Silverblade_No);
	Info_AddChoice(DIA_DJG_715_Ferros_FerrosAnySword,"��, �������.",DIA_DJG_715_Ferros_FerrosAnySword_Silverblade_Yes);
};

func void DIA_DJG_715_Ferros_FerrosAnySword_Oreblade()
{
	B_Ferros_FerrosAnySword_Give();
	Info_ClearChoices(DIA_DJG_715_Ferros_FerrosAnySword);
	Info_AddChoice(DIA_DJG_715_Ferros_FerrosAnySword,"���, �� ����� ��� ������.",DIA_DJG_715_Ferros_FerrosAnySword_Oreblade_No);
	Info_AddChoice(DIA_DJG_715_Ferros_FerrosAnySword,"��, �������.",DIA_DJG_715_Ferros_FerrosAnySword_Oreblade_Yes);
};

func void B_Ferros_FerrosAnySword_Yes1()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes_15_00");	//��, �������.
};

func void B_Ferros_FerrosAnySword_Yes2()
{
	AI_Output(self,other,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes2_01_00");	//�������. � ���� �������.
	AI_Output(self,other,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes2_01_01");	//������ � ������ ���� ������� ������, ������� �������� ���� ����� ������������ ���� � �������� � ���.
	Log_CreateTopic(TOPIC_Teacher,LOG_NOTE);
	B_LogEntry(TOPIC_Teacher,"����� ����� �������� ��� ���� � ��������.");
};

func void B_Ferros_FerrosAnySword_No()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_No_15_00");	//���, �� ����� ��� ������.
	AI_Output(self,other,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_No_01_01");	//�������.
};

func void DIA_DJG_715_Ferros_FerrosAnySword_Silverblade_Yes()
{
	B_Ferros_FerrosAnySword_Yes1();
	B_GiveInvItems(other,self,ItMw_1H_Special_01,1);
	B_Ferros_FerrosAnySword_Yes2();
	Info_ClearChoices(DIA_DJG_715_Ferros_FerrosAnySword);
	MIS_FErrosSword = LOG_SUCCESS;
	B_GivePlayerXP(XP_FerrosSword);
};

func void DIA_DJG_715_Ferros_FerrosAnySword_Silverblade_No()
{
	B_Ferros_FerrosAnySword_No();
	Info_ClearChoices(DIA_DJG_715_Ferros_FerrosAnySword);
};

func void DIA_DJG_715_Ferros_FerrosAnySword_Oreblade_Yes()
{
	B_Ferros_FerrosAnySword_Yes1();
	B_GiveInvItems(other,self,ItMw_1H_Special_02,1);
	B_Ferros_FerrosAnySword_Yes2();
	Info_ClearChoices(DIA_DJG_715_Ferros_FerrosAnySword);
	MIS_FErrosSword = LOG_SUCCESS;
	B_GivePlayerXP(XP_FerrosSword);
};

func void DIA_DJG_715_Ferros_FerrosAnySword_Oreblade_No()
{
	B_Ferros_FerrosAnySword_No();
	Info_ClearChoices(DIA_DJG_715_Ferros_FerrosAnySword);
};


instance DIA_DJG_715_Ferros_FerrosHisSword(C_Info)
{
	npc = DJG_715_Ferros;
	nr = 6;
	condition = DIA_DJG_715_Ferros_FerrosHisSword_Condition;
	information = DIA_DJG_715_Ferros_FerrosHisSword_Info;
	permanent = FALSE;
	description = "� ����� ���� ���.";
};


func int DIA_DJG_715_Ferros_FerrosHisSword_Condition()
{
	if((MIS_FErrosSword == LOG_Running) && (Npc_HasItems(other,ItMW_1H_FerrosSword_Mis) >= 1))
	{
		return TRUE;
	};
};

func void DIA_DJG_715_Ferros_FerrosHisSword_Info()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_FerrosHisSword_15_00");	//� ����� ���� ���.
	B_GiveInvItems(other,self,ItMW_1H_FerrosSword_Mis,1);
	B_Ferros_FerrosAnySword_Yes2();
	MIS_FErrosSword = LOG_SUCCESS;
	B_GivePlayerXP(XP_FerrosSword);
};


instance DIA_Ferros_Teach(C_Info)
{
	npc = DJG_715_Ferros;
	nr = 1;
	condition = DIA_Ferros_Teach_Condition;
	information = DIA_Ferros_Teach_Info;
	permanent = TRUE;
	description = "������ ���, ��� ����� �������� ���� �����������.";
};


func int DIA_Ferros_Teach_Condition()
{
	if(MIS_FErrosSword == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Ferros_Teach_Info()
{
	AI_Output(other,self,"DIA_Ferros_Teach_15_00");	//������ ���, ��� ����� �������� ���� �����������.
	if(MIS_OCGateOpen == TRUE)
	{
		AI_Output(self,other,"DIA_Ferros_Teach_01_01");	//����� ���� ���� ��������� ����� � ������ ���� �� ���������. � ���, ��� ������ ������� ���, ������.
	}
	else
	{
		AI_Output(self,other,"DIA_Ferros_Teach_01_02");	//������� ���� ������ ����� �������� ���������� ���� ����������� ������ ������.
		Info_ClearChoices(DIA_Ferros_Teach);
		Info_AddChoice(DIA_Ferros_Teach,Dialog_Back,DIA_Ferros_Teach_Back);
		Info_AddChoice(DIA_Ferros_Teach,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Ferros_Teach_STR_1);
		Info_AddChoice(DIA_Ferros_Teach,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Ferros_Teach_STR_5);
		Info_AddChoice(DIA_Ferros_Teach,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Ferros_Teach_DEX_1);
		Info_AddChoice(DIA_Ferros_Teach,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Ferros_Teach_DEX_5);
	};
};

func void DIA_Ferros_Teach_Back()
{
	Info_ClearChoices(DIA_Ferros_Teach);
};

func void DIA_Ferros_Teach_STR_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MED);
	Info_AddChoice(DIA_Ferros_Teach,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Ferros_Teach_STR_1);
};

func void DIA_Ferros_Teach_STR_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MED);
	Info_AddChoice(DIA_Ferros_Teach,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Ferros_Teach_STR_5);
};

func void DIA_Ferros_Teach_DEX_1()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MED);
	Info_AddChoice(DIA_Ferros_Teach,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Ferros_Teach_DEX_1);
};

func void DIA_Ferros_Teach_DEX_5()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MED);
	Info_AddChoice(DIA_Ferros_Teach,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Ferros_Teach_DEX_5);
};


instance DIA_Ferros_AllDragonsDead(C_Info)
{
	npc = DJG_715_Ferros;
	nr = 5;
	condition = DIA_Ferros_AllDragonsDead_Condition;
	information = DIA_Ferros_AllDragonsDead_Info;
	permanent = FALSE;
	description = "��� ������� ������.";
};


func int DIA_Ferros_AllDragonsDead_Condition()
{
	if(MIS_AllDragonsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Ferros_AllDragonsDead_Info()
{
	AI_Output(other,self,"DIA_Ferros_AllDragonsDead_15_00");	//��� ������� ������.
	AI_Output(self,other,"DIA_Ferros_AllDragonsDead_01_01");	//�������! ���� �� � ��� ���� �������� ����� ����� ����, ���, ��������, �� ����� �� ��� ������.
};


instance DIA_Ferros_PICKPOCKET(C_Info)
{
	npc = DJG_715_Ferros;
	nr = 900;
	condition = DIA_Ferros_PICKPOCKET_Condition;
	information = DIA_Ferros_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Ferros_PICKPOCKET_Condition()
{
	return C_Beklauen(56,75);
};

func void DIA_Ferros_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Ferros_PICKPOCKET);
	Info_AddChoice(DIA_Ferros_PICKPOCKET,Dialog_Back,DIA_Ferros_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Ferros_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Ferros_PICKPOCKET_DoIt);
};

func void DIA_Ferros_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Ferros_PICKPOCKET);
};

func void DIA_Ferros_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Ferros_PICKPOCKET);
};

