
instance DIA_Girion_EXIT(C_Info)
{
	npc = Pal_207_Girion;
	nr = 999;
	condition = DIA_Girion_EXIT_Condition;
	information = DIA_Girion_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Girion_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Girion_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Girion_Hallo(C_Info)
{
	npc = Pal_207_Girion;
	nr = 2;
	condition = DIA_Girion_Hallo_Condition;
	information = DIA_Girion_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Girion_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_ShipIsFree == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Girion_Hallo_Info()
{
	AI_Output(self,other,"DIA_Girion_Hallo_08_00");	//� ������, ������ ��� ��������� ������� � ������� ������. �� ������ ������ �� ���������� ����?
};


instance DIA_Girion_CanTeach(C_Info)
{
	npc = Pal_207_Girion;
	nr = 5;
	condition = DIA_Girion_CanTeach_Condition;
	information = DIA_Girion_CanTeach_Info;
	permanent = TRUE;
	description = "�� ������ ������� ����?";
};


func int DIA_Girion_CanTeach_Condition()
{
	if(Girion_Teach2H == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Girion_CanTeach_Info()
{
	AI_Output(other,self,"DIA_Girion_CanTeach_15_00");	//�� ������ ������� ����?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Girion_CanTeach_08_01");	//��� ������, ��� �� ������ ��������� ������ ������������ �� ���� ������ ������. ��� � �������� ���������� ����� ������.
		AI_Output(self,other,"DIA_Girion_CanTeach_08_02");	//� ����� ����. �������� �� ���, ����� ������ �����.
		Girion_Teach2H = TRUE;
		B_LogEntry(TOPIC_CityTeacher,"������� ������ ����� ������� ���� ��������� �������� ��������� �������.");
	}
	else
	{
		AI_Output(self,other,"DIA_Girion_CanTeach_08_03");	//���� �� ������ ��������� ����-������, ���� ����� �������� ������� �� �� ������ ������.
		AI_Output(self,other,"DIA_Girion_CanTeach_08_04");	//� ����, � �� �������.
	};
};


instance DIA_Girion_Teach(C_Info)
{
	npc = Pal_207_Girion;
	nr = 100;
	condition = DIA_Girion_Teach_Condition;
	information = DIA_Girion_Teach_Info;
	permanent = TRUE;
	description = "� ����� � ��������.";
};


var int DIA_Girion_Teach_permanent;

func int DIA_Girion_Teach_Condition()
{
	if((Girion_Teach2H == TRUE) && (DIA_Girion_Teach_permanent == FALSE))
	{
		return TRUE;
	};
};


var int girion_merk2h;

func void DIA_Girion_Teach_Info()
{
	girion_merk2h = other.HitChance[NPC_TALENT_2H];
	AI_Output(other,self,"DIA_Girion_Teach_15_00");	//� ����� � ��������.
	Info_ClearChoices(DIA_Girion_Teach);
	Info_AddChoice(DIA_Girion_Teach,Dialog_Back,DIA_Girion_Teach_Back);
	Info_AddChoice(DIA_Girion_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Girion_Teach_2H_1);
	Info_AddChoice(DIA_Girion_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Girion_Teach_2H_5);
};

func void DIA_Girion_Teach_Back()
{
	if(other.HitChance[NPC_TALENT_2H] >= 90)
	{
		AI_Output(self,other,"DIA_DIA_Girion_Teach_08_00");	//������-�� ������, ���� �������� ��� �� ���������, �� � ������ ������ �� ���� ������� ����.
		AI_Output(self,other,"DIA_DIA_Girion_Teach_08_01");	//���� �� ������ �������� ���� ���������� ��� ������, ���� ����� �������� ���������� ������� ����.
		AI_Output(other,self,"DIA_DIA_Girion_Teach_15_02");	//��� ��� ����� ������ ��������?
		AI_Output(self,other,"DIA_DIA_Girion_Teach_08_03");	//���� ����� - ������-������. ��, ��������� ������ ������� ����.
		DIA_Girion_Teach_permanent = TRUE;
	};
	Info_ClearChoices(DIA_Girion_Teach);
};

func void DIA_Girion_Teach_2H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,90);
	if(other.HitChance[NPC_TALENT_2H] > girion_merk2h)
	{
		if(Girion_Labercount == 0)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_1_08_00");	//�������� � ������. ��� - ���� �����, � ��� �� ����� ��� �����?
		};
		if(Girion_Labercount == 1)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_1_08_01");	//���� ��������� � ����� � ���. ������� ������ ����������.
		};
		if(Girion_Labercount == 2)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_1_08_02");	//������� �� ������� � ��� ����������������. ����������, ������� �� ����� �������.
		};
		if(Girion_Labercount == 3)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_1_08_03");	//������� ������ ����� � ���. �� ������� �� �������� ���, � ������� �� ����� ��������.
		};
		Girion_Labercount = Girion_Labercount + 1;
		if(Girion_Labercount >= 3)
		{
			Girion_Labercount = 0;
		};
	};
	Info_ClearChoices(DIA_Girion_Teach);
	Info_AddChoice(DIA_Girion_Teach,Dialog_Back,DIA_Girion_Teach_Back);
	Info_AddChoice(DIA_Girion_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Girion_Teach_2H_1);
	Info_AddChoice(DIA_Girion_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Girion_Teach_2H_5);
};

func void DIA_Girion_Teach_2H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,90);
	if(other.HitChance[NPC_TALENT_2H] > girion_merk2h)
	{
		if(Girion_Labercount == 0)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_5_08_00");	//������� ��������� �� ������ �����, �� � �������.
		};
		if(Girion_Labercount == 1)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_5_08_01");	//�� ������ ��������, ����� ����� ���������.
		};
		if(Girion_Labercount == 2)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_5_08_02");	//�����, ���� �� ���������� ������, �� ������������� ������ ���������� � �� ����� ��� ����� �������������� ����.
		};
		if(Girion_Labercount == 3)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_5_08_03");	//����������� - ��� ������ ������.
		};
		Girion_Labercount = Girion_Labercount + 1;
		if(Girion_Labercount >= 3)
		{
			Girion_Labercount = 0;
		};
	};
	Info_ClearChoices(DIA_Girion_Teach);
	Info_AddChoice(DIA_Girion_Teach,Dialog_Back,DIA_Girion_Teach_Back);
	Info_AddChoice(DIA_Girion_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Girion_Teach_2H_1);
	Info_AddChoice(DIA_Girion_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Girion_Teach_2H_5);
};


instance DIA_Girion_CATCHPLAYERSTOLENSHIP(C_Info)
{
	npc = Pal_207_Girion;
	nr = 5;
	condition = DIA_Girion_CATCHPLAYERSTOLENSHIP_Condition;
	information = DIA_Girion_CATCHPLAYERSTOLENSHIP_Info;
	important = TRUE;
};


func int DIA_Girion_CATCHPLAYERSTOLENSHIP_Condition()
{
	if((Kapitel >= 5) && (MIS_ShipIsFree == TRUE) && (Npc_GetDistToWP(self,"NW_CITY_WAY_TO_SHIP_25") < 1000))
	{
		return TRUE;
	};
};

func void DIA_Girion_CATCHPLAYERSTOLENSHIP_Info()
{
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_08_00");	//��! �� ������ ������� ���, ��� �� ������� �����?
	Info_ClearChoices(DIA_Girion_CATCHPLAYERSTOLENSHIP);
	Info_AddChoice(DIA_Girion_CATCHPLAYERSTOLENSHIP,"� �� ����, � ��� �� ��������.",DIA_Girion_CATCHPLAYERSTOLENSHIP_no);
	Info_AddChoice(DIA_Girion_CATCHPLAYERSTOLENSHIP,"����� � ���� ������, ��� ��� �������� ����� ����.",DIA_Girion_CATCHPLAYERSTOLENSHIP_weg);
	Info_AddChoice(DIA_Girion_CATCHPLAYERSTOLENSHIP,"��� ����� ���� �������.",DIA_Girion_CATCHPLAYERSTOLENSHIP_ship);
};

func void DIA_Girion_CATCHPLAYERSTOLENSHIP_no()
{
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_no_15_00");	//� �� ����, � ��� �� ��������.
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_no_08_01");	//� ������ � ���, ��� �� ������ � ����������� �������. ��� ���� ����� ������.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_no_08_02");	//���� �������� �� ��, ��� �� ���, � �� ������� ����.
	};
};


var int Girion_WantstoKillSC;

func void DIA_Girion_CATCHPLAYERSTOLENSHIP_weg()
{
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_weg_15_00");	//����� � ���� ������, ��� ��� �������� ����� ����.
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_weg_08_01");	//��������, ���� ������� �������� ������ �������, �� �� ���� ���� ��� ������ �� ����������, ��� ��������� ����.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_weg_08_02");	//���� ���� �� ���� �� ���, ��� �� ���� ���� ����� �������� ������������� ������. ����, ��������� ���������.
	};
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
	Girion_WantstoKillSC = TRUE;
};

func void B_GirionStayOnShip()
{
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_09");	//����� �� �������� � ���� �����, �� ������� ���� ������� ������� ���, �������?
};

func void DIA_Girion_CATCHPLAYERSTOLENSHIP_ship()
{
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_00");	//��� ����� ���� �������. ������� � ������� ���.
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_01");	//�� �� ������ ������� ���. ��� ��������� ��� ����...
	}
	else
	{
		AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_02");	//��� �� ������?! ��, ������� �������...
	};
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_03");	//���� � ������ �������� ������������, ����� ������������� ����������� ������. � ��� ���. ��� ������ ������. ������ ������ - ���� ������ ����.
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_04");	//��������� ���� ������ ���� ����� �� ������� ���������� ������. � ������� ���� � ������ ����� ����� �����.
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_05");	//���� ������������� �� ���, ���� ��� �������� ����������� � �����. �������.
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_06");	//�-�-�. ������, � ���� ��� ������.
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_07");	//���������.
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_08");	//�����, ������. � ������������ � ����, �� ��� ����� �������.
	B_GirionStayOnShip();
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_10");	//� �������� ���.
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_11");	//����� ����� ��, ��� ������. � � ������� ���� �����.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Ship");
	Crewmember_Count = Crewmember_Count + 1;
	Girion_IsOnBoard = LOG_SUCCESS;
};


instance DIA_Girion_Verrat(C_Info)
{
	npc = Pal_207_Girion;
	nr = 2;
	condition = DIA_Girion_Verrat_Condition;
	information = DIA_Girion_Verrat_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Girion_Verrat_Condition()
{
	if(Girion_WantstoKillSC == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Girion_Verrat_Info()
{
	AI_Output(self,other,"DIA_Girion_Verrat_08_00");	//���������!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Girion_OnShip(C_Info)
{
	npc = Pal_207_Girion;
	nr = 2;
	condition = DIA_Girion_OnShip_Condition;
	information = DIA_Girion_OnShip_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Girion_OnShip_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Girion_IsOnBoard == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Girion_OnShip_Info()
{
	B_GirionStayOnShip();
	AI_StopProcessInfos(self);
};


instance DIA_Girion_PICKPOCKET(C_Info)
{
	npc = Pal_207_Girion;
	nr = 900;
	condition = DIA_Girion_PICKPOCKET_Condition;
	information = DIA_Girion_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_Girion_PICKPOCKET_Condition()
{
	return C_Beklauen(73,280);
};

func void DIA_Girion_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Girion_PICKPOCKET);
	Info_AddChoice(DIA_Girion_PICKPOCKET,Dialog_Back,DIA_Girion_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Girion_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Girion_PICKPOCKET_DoIt);
};

func void DIA_Girion_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Girion_PICKPOCKET);
};

func void DIA_Girion_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Girion_PICKPOCKET);
};

