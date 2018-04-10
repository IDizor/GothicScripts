
instance DIA_Nadja_EXIT(C_Info)
{
	npc = VLK_435_Nadja;
	nr = 999;
	condition = DIA_Nadja_EXIT_Condition;
	information = DIA_Nadja_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Nadja_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Nadja_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Nadja_PICKPOCKET(C_Info)
{
	npc = VLK_435_Nadja;
	nr = 900;
	condition = DIA_Nadja_PICKPOCKET_Condition;
	information = DIA_Nadja_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40_Female;
};


func int DIA_Nadja_PICKPOCKET_Condition()
{
	return C_Beklauen(40,40);
};

func void DIA_Nadja_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Nadja_PICKPOCKET);
	Info_AddChoice(DIA_Nadja_PICKPOCKET,Dialog_Back,DIA_Nadja_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Nadja_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Nadja_PICKPOCKET_DoIt);
};

func void DIA_Nadja_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Nadja_PICKPOCKET);
};

func void DIA_Nadja_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Nadja_PICKPOCKET);
};


instance DIA_Nadja_STANDARD(C_Info)
{
	npc = VLK_435_Nadja;
	nr = 3;
	condition = DIA_Nadja_STANDARD_Condition;
	information = DIA_Nadja_STANDARD_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Nadja_STANDARD_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Bromor_Pay == FALSE))
	{
		return TRUE;
	};
};


var int Nadja_LuciaInfo;

func void DIA_Nadja_STANDARD_Info()
{
	if(Nadja_LuciaInfo == TRUE)
	{
		AI_Output(self,other,"DIA_ADDON_Nadja_STANDARD_16_00");	//� ���� ������������� � ����� ������ ����� ����, ��� �� ���������� � ��������.
	}
	else
	{
		AI_Output(self,other,"DIA_Nadja_STANDARD_16_00");	//��, � �� ���� �������� ����� ������, �����. ���� ������ ����������, �������� � ��������.
	};
	if((SC_HearedAboutMissingPeople == TRUE) && (SCKnowsMissingPeopleAreInAddonWorld == FALSE) && (Nadja_LuciaInfo == FALSE))
	{
		AI_Output(other,self,"DIA_ADDON_Nadja_STANDARD_15_01");	//� ������ ����� ������ ���� ���� �������� � ��������� �����.
		AI_Output(self,other,"DIA_ADDON_Nadja_STANDARD_16_02");	//� ����� �� ���� ���-��� ����������, �����, �� �� �����.
		AI_Output(other,self,"DIA_ADDON_Nadja_STANDARD_15_03");	//����� ������ ������.
		AI_Output(self,other,"DIA_ADDON_Nadja_STANDARD_16_04");	//������. �� ������� �� ������ ������������ � ��������. ������������ ��� �� �����.
		Nadja_LuciaInfo = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_Nadja_Danach(C_Info)
{
	npc = VLK_435_Nadja;
	nr = 2;
	condition = DIA_Nadja_Danach_Condition;
	information = DIA_Nadja_Danach_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Nadja_Danach_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Bromor_Pay == FALSE) && (Nadja_Nacht == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Nadja_Danach_Info()
{
	AI_Output(self,other,"DIA_Nadja_Danach_16_00");	//������ � ������ ���.
	Nadja_Nacht = FALSE;
	AI_StopProcessInfos(self);
};


instance DIA_Nadja_hochgehen(C_Info)
{
	npc = VLK_435_Nadja;
	nr = 3;
	condition = DIA_Nadja_hochgehen_Condition;
	information = DIA_Nadja_hochgehen_Info;
	important = FALSE;
	permanent = TRUE;
	description = "����� ������.";
};


func int DIA_Nadja_hochgehen_Condition()
{
	if(Bromor_Pay == 1)
	{
		return TRUE;
	};
};

func void DIA_Nadja_hochgehen_Info()
{
	AI_Output(other,self,"DIA_Nadja_hochgehen_15_00");	//����� ������.
	AI_Output(self,other,"DIA_Nadja_hochgehen_16_01");	//������� ���� ����� ���������� �����, �����. ������.
	Bromor_Pay = 2;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"DANCE");
};


instance DIA_Addon_Nadja_LuciaInfo(C_Info)
{
	npc = VLK_435_Nadja;
	nr = 5;
	condition = DIA_Addon_Nadja_LuciaInfo_Condition;
	information = DIA_Addon_Nadja_LuciaInfo_Info;
	description = "�� � ������ �� ����� ����������?";
};


func int DIA_Addon_Nadja_LuciaInfo_Condition()
{
	if((Bromor_Pay == 2) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_PUFF_NADJA") < 200) && (Nadja_LuciaInfo == TRUE))
	{
		return TRUE;
	};
};


var int Nadja_GaveLuciaInfo;

func void DIA_Addon_Nadja_LuciaInfo_Info()
{
	AI_Output(other,self,"DIA_Addon_Nadja_LuciaInfo_15_00");	//�� � ������ �� ����� ����������?
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_16_01");	//��, ����� ��� �� ����������.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_16_02");	//������� �� ��������, ����� �� ������������� � ������� �� ����� ������, ���� ��� �� ����� ������� ������.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_16_03");	//����, �� ������ ������ �������� � �����, ������� ������� � �����, �� ��� ��?
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_16_04");	//� �� ����, ����� �� � ���� ������, �� �� ������� ���� � ���� ����������, ��� ��������� � ������.
	Nadja_GaveLuciaInfo = TRUE;
	Info_ClearChoices(DIA_Addon_Nadja_LuciaInfo);
	Info_AddChoice(DIA_Addon_Nadja_LuciaInfo,"� ���� ��� �������?",DIA_Addon_Nadja_LuciaInfo_wo);
	Info_AddChoice(DIA_Addon_Nadja_LuciaInfo,"�����������.",DIA_Addon_Nadja_LuciaInfo_lucia);
};

func void DIA_Addon_Nadja_LuciaInfo_lucia()
{
	AI_Output(other,self,"DIA_Addon_Nadja_LuciaInfo_lucia_15_00");	//�����������.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_lucia_16_01");	//����� ����� ����� �� ������, ��� ��� �������.
	AI_Output(other,self,"DIA_Addon_Nadja_LuciaInfo_lucia_15_02");	//������?
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_lucia_16_03");	//����� ��� �� ������ ��������, �������� ��� �� �������� ������������ � ����� ���������.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_lucia_16_04");	//��� ���� ��������� �����!
};

func void DIA_Addon_Nadja_LuciaInfo_wo()
{
	AI_Output(other,self,"DIA_Addon_Nadja_LuciaInfo_wo_15_00");	//� ���� ��� �������?
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_wo_16_01");	//��� ����� ����������� � ��������, ������������ �������� ������� �� ������ ����� ������.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_wo_16_02");	//������ ���������, ��� ��� ������ � ���� ������.
	Log_CreateTopic(TOPIC_Addon_Lucia,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Lucia,LOG_Running);
	B_LogEntry(TOPIC_Addon_Lucia,"����� ����� ������� �� ������� ������� ������� �����. ��������, ��� ������� ������ � ��������, �������� �������� �������.");
	Info_AddChoice(DIA_Addon_Nadja_LuciaInfo,"���� ��� ����� �����������?",DIA_Addon_Nadja_LuciaInfo_Elvrich);
};

func void DIA_Addon_Nadja_LuciaInfo_Elvrich()
{
	AI_Output(other,self,"DIA_Addon_Nadja_LuciaInfo_Elvrich_15_00");	//���� ��� ����� �����������?
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_Elvrich_16_01");	//���� �� �� ������� �����, �� �������, ��� ����� � ��������.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_Elvrich_16_02");	//� ���� �� ��� ������?
	Info_AddChoice(DIA_Addon_Nadja_LuciaInfo,"��� ��� �� ������?",DIA_Addon_Nadja_LuciaInfo_sonst);
};

func void DIA_Addon_Nadja_LuciaInfo_sonst()
{
	AI_Output(other,self,"DIA_Addon_Nadja_LuciaInfo_sonst_15_00");	//��� ��� �� ������?
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_sonst_16_01");	//� ������� �������� ������� � ���, ��� ���� ��������.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_sonst_16_02");	//�� � ����������, ��� ���� ��������� ����� ������.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_sonst_16_03");	//���� ����� ���������� � ����������.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_sonst_16_04");	//� ���������, ��� ���, ��� � ���� ����������.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_sonst_16_05");	//�� � ������ ��� ����� ������, ��������? � ����� ������, �� �� ������ ��������.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_sonst_16_06");	//�� ������ ������������ ����� ���, ��� ������?
	Info_ClearChoices(DIA_Addon_Nadja_LuciaInfo);
	if((MIS_Andre_REDLIGHT == LOG_Running) && (Knows_Borka_Dealer == FALSE))
	{
		Info_AddChoice(DIA_Addon_Nadja_LuciaInfo,PRINT_Addon_NadjaWait,DIA_Addon_Nadja_WAIT);
	};
	Info_AddChoice(DIA_Addon_Nadja_LuciaInfo,"�������, �� ��� ����� ����.",DIA_Addon_Nadja_LuciaInfo_weiter);
	Info_AddChoice(DIA_Addon_Nadja_LuciaInfo,"������ �� � ���? ...",DIA_Nadja_Poppen_Start);
};

func void DIA_Addon_Nadja_LuciaInfo_weiter()
{
	AI_Output(other,self,"DIA_Addon_Nadja_LuciaInfo_weiter_15_00");	//�������, �� ��� ����� ����.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_weiter_16_01");	//����� ����. �� ��� �, ����� � ������ ���.
	Bromor_Pay = FALSE;
	Nadja_Nacht = Nadja_Nacht + 1;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};

func void DIA_Addon_Nadja_WAIT()
{
	Info_ClearChoices(DIA_Addon_Nadja_LuciaInfo);
};


instance DIA_Nadja_Poppen(C_Info)
{
	npc = VLK_435_Nadja;
	nr = 3;
	condition = DIA_Nadja_Poppen_Condition;
	information = DIA_Nadja_Poppen_Info;
	permanent = TRUE;
	description = "(����������)";
};


func int DIA_Nadja_Poppen_Condition()
{
	if((Bromor_Pay == 2) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_PUFF_NADJA") < 300))
	{
		return TRUE;
	};
};

func void DIA_Nadja_Poppen_Info()
{
	AI_Output(self,other,"DIA_Nadja_Poppen_16_00");	//��������� ���� ����� ����������� ������ ���.
	AI_Output(self,other,"DIA_Nadja_Poppen_16_01");	//����������. ������ � ������� ������������.
	Info_ClearChoices(DIA_Nadja_Poppen);
	Info_AddChoice(DIA_Nadja_Poppen,"������ ...",DIA_Nadja_Poppen_Start);
};

func void DIA_Nadja_Poppen_Start()
{
	Bromor_Pay = FALSE;
	Nadja_Nacht = Nadja_Nacht + 1;
	PlayVideo("LOVESCENE.BIK");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};

func void DIA_Addon_Nadja_LuciaInfo_Pop()
{
	DIA_Nadja_Poppen_Start();
};


instance DIA_Nadja_BUYHERB(C_Info)
{
	npc = VLK_435_Nadja;
	nr = 2;
	condition = DIA_Nadja_BUYHERB_Condition;
	information = DIA_Nadja_BUYHERB_Info;
	permanent = TRUE;
	description = "���� � ����� ������ ������?";
};


func int DIA_Nadja_BUYHERB_Condition()
{
	if((MIS_Andre_REDLIGHT == LOG_Running) && (Npc_KnowsInfo(other,DIA_Nadja_WANT_HERB) == FALSE) && (Nadja_Money == FALSE) && (Undercover_Failed == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Nadja_BUYHERB_Info()
{
	var C_Item heroArmor;
	heroArmor = Npc_GetEquippedArmor(other);
	AI_Output(other,self,"DIA_Nadja_BUYHERB_15_00");	//���� � ����� ������ ������?
	if(Npc_GetDistToWP(self,"NW_CITY_HABOUR_PUFF_NADJA") < 500)
	{
		if(Hlp_IsItem(heroArmor,ITAR_Mil_L) == TRUE)
		{
			AI_Output(self,other,"DIA_Nadja_BUYHERB_16_01");	//������ ��� �����? �� � ���� �� �����, ��� ����� �� ������� �� ���������� ���������.
			Undercover_Failed = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Nadja_BUYHERB_16_02");	//������� ��������� �������, � � �����, ��� �� �������.
			AI_Output(other,self,"DIA_Nadja_BUYHERB_15_03");	//������� �� ������?
			AI_Output(self,other,"DIA_Nadja_BUYHERB_16_04");	//50 ������� ����� ����������.
			Nadja_Money = TRUE;
		};
	}
	else
	{
		B_Say(self,other,"$NOTNOW");
	};
};


instance DIA_Nadja_WANT_HERB(C_Info)
{
	npc = VLK_435_Nadja;
	nr = 2;
	condition = DIA_Nadja_WANT_HERB_Condition;
	information = DIA_Nadja_WANT_HERB_Info;
	permanent = FALSE;
	description = "� ������ ����� ���, ��� ����� ������ ������ (��������� 50 �������).";
};


func int DIA_Nadja_WANT_HERB_Condition()
{
	if((Npc_HasItems(other,ItMi_Gold) >= 50) && (Nadja_Money == TRUE) && (MIS_Andre_REDLIGHT == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Nadja_WANT_HERB_Info()
{
	var C_Item heroArmor;
	heroArmor = Npc_GetEquippedArmor(other);
	AI_Output(other,self,"DIA_Nadja_WANT_HERB_15_00");	//� ������ ����� ���, ��� ����� ������ ������.
	if(Hlp_IsItem(heroArmor,ITAR_Mil_L) == TRUE)
	{
		AI_Output(self,other,"DIA_Nadja_WANT_HERB_16_01");	//������, � ������.
	}
	else
	{
		B_GiveInvItems(other,self,ItMi_Gold,50);
		AI_Output(self,other,"DIA_Nadja_WANT_HERB_16_02");	//�������� � ������, �����. � ���� �������� ������ ��� ����.
		Knows_Borka_Dealer = TRUE;
	};
};

