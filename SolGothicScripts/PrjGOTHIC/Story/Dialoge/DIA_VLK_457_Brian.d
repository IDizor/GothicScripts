
instance DIA_Brian_EXIT(C_Info)
{
	npc = VLK_457_Brian;
	nr = 999;
	condition = DIA_Brian_EXIT_Condition;
	information = DIA_Brian_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Brian_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Brian_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Brian_PICKPOCKET(C_Info)
{
	npc = VLK_457_Brian;
	nr = 900;
	condition = DIA_Brian_PICKPOCKET_Condition;
	information = DIA_Brian_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Brian_PICKPOCKET_Condition()
{
	return C_Beklauen(55,100);
};

func void DIA_Brian_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Brian_PICKPOCKET);
	Info_AddChoice(DIA_Brian_PICKPOCKET,Dialog_Back,DIA_Brian_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Brian_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Brian_PICKPOCKET_DoIt);
};

func void DIA_Brian_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Brian_PICKPOCKET);
};

func void DIA_Brian_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Brian_PICKPOCKET);
};


instance DIA_Brian_HALLO(C_Info)
{
	npc = VLK_457_Brian;
	nr = 1;
	condition = DIA_Brian_HALLO_Condition;
	information = DIA_Brian_HALLO_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Brian_HALLO_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brian_HALLO_Info()
{
	AI_Output(self,other,"DIA_Brian_HALLO_04_00");	//�� ������� � ������, ��? � ������! ������ ������� ������.
};


instance DIA_Brian_AboutLehrling(C_Info)
{
	npc = VLK_457_Brian;
	nr = 1;
	condition = DIA_Brian_AboutLehrling_Condition;
	information = DIA_Brian_AboutLehrling_Info;
	permanent = FALSE;
	description = "������ ���, ���� �������� �������?";
};


func int DIA_Brian_AboutLehrling_Condition()
{
	if((hero.guild == GIL_NONE) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Brian_AboutLehrling_Info()
{
	AI_Output(other,self,"DIA_Brian_AboutLehrling_15_00");	//������ ���, ���� �������� �������?
	AI_Output(self,other,"DIA_Brian_AboutLehrling_04_01");	//������ �� �����������? �� ������ ����� ���� ����������?
	AI_Output(other,self,"DIA_Brian_AboutLehrling_15_02");	//����� ����.
	AI_Output(self,other,"DIA_Brian_AboutLehrling_04_03");	//������ �� � ���... � ����� �������� ���� �������� � ��������� ������ �������� �����.
	AI_Output(self,other,"DIA_Brian_AboutLehrling_04_04");	//�� �� ��-�� ������. �� ������� ������, � ������� �������� � ����.
};


instance DIA_Brian_WhyLeave(C_Info)
{
	npc = VLK_457_Brian;
	nr = 1;
	condition = DIA_Brian_WhyLeave_Condition;
	information = DIA_Brian_WhyLeave_Info;
	permanent = FALSE;
	description = "������ �� ������ �������� �����?";
};


func int DIA_Brian_WhyLeave_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Brian_AboutLehrling))
	{
		return TRUE;
	};
};

func void DIA_Brian_WhyLeave_Info()
{
	AI_Output(other,self,"DIA_Brian_WhyLeave_15_00");	//������ �� ������ �������� �����?
	AI_Output(self,other,"DIA_Brian_WhyLeave_04_00");	//������ ��� ���� ����� ��������� ��� �� �����! � �������� ��������� �������.
	AI_Output(self,other,"DIA_Brian_WhyLeave_04_01");	//� ��� �� �����, ���� ��� ������ - ����� �������� ������.
	AI_Output(self,other,"DIA_Brian_WhyLeave_04_02");	//������ �� ���� �������� ��� ����� �������� ���� �������.
	AI_Output(self,other,"DIA_Brian_WhyLeave_04_03");	//� ���� ��� ������, ���� ����, � ���� �� ���� ����� � �������.
};


instance DIA_Brian_OtherMasters(C_Info)
{
	npc = VLK_457_Brian;
	nr = 1;
	condition = DIA_Brian_OtherMasters_Condition;
	information = DIA_Brian_OtherMasters_Info;
	permanent = FALSE;
	description = "� ��� ����� ������ �������?";
};


func int DIA_Brian_OtherMasters_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Brian_WhyLeave) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Brian_OtherMasters_Info()
{
	AI_Output(other,self,"DIA_Brian_Add_15_00");	//� ��� ����� ������ �������?
	AI_Output(self,other,"DIA_Brian_Add_04_01");	//��, ��� ������� ������, ������-������ ������, ������� ����������� � ������.
	AI_Output(self,other,"DIA_Brian_Add_04_02");	//�� ������� �������, ��, � ������ �������, �� ��������.
	AI_Output(self,other,"DIA_Brian_Add_04_03");	//� ������� ������� ���� ���� ��� �� ���� �����.
	AI_Output(self,other,"DIA_Brian_Add_04_04");	//� ����� ����������� ��������� � ��������� �������, ������� � �����.
};


instance DIA_Brian_AboutHarad(C_Info)
{
	npc = VLK_457_Brian;
	nr = 2;
	condition = DIA_Brian_AboutHarad_Condition;
	information = DIA_Brian_AboutHarad_Info;
	permanent = FALSE;
	description = "�������� ��� � ������� ������.";
};


func int DIA_Brian_AboutHarad_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Brian_AboutLehrling))
	{
		return TRUE;
	};
};

func void DIA_Brian_AboutHarad_Info()
{
	AI_Output(other,self,"DIA_Brian_AboutHarad_15_00");	//�������� ��� � ������� ������.
	AI_Output(self,other,"DIA_Brian_AboutHarad_04_01");	//�� ������ �� � ������ ������������ ����.
	AI_Output(self,other,"DIA_Brian_AboutHarad_04_02");	//��������� ���� ����� ������ �������� � ��������� ��� ������ ���� ��� ���.
	AI_Output(self,other,"DIA_Brian_AboutHarad_04_03");	//��� ���� ��������� ��� ��������� ���� ����-���� ���.
	AI_Output(self,other,"DIA_Brian_AboutHarad_04_04");	//������ ��, ��� ���, �������� ��� � ���� ��������, ����� ��� ����� ������� ��������� ���� ������.
};


instance DIA_Brian_NEEDWEAPONS(C_Info)
{
	npc = VLK_457_Brian;
	nr = 4;
	condition = DIA_Brian_NEEDWEAPONS_Condition;
	information = DIA_Brian_NEEDWEAPONS_Info;
	permanent = FALSE;
	description = "���� � ������ ������ � ����?";
};


func int DIA_Brian_NEEDWEAPONS_Condition()
{
	return TRUE;
};

func void DIA_Brian_NEEDWEAPONS_Info()
{
	AI_Output(other,self,"DIA_Brian_NEEDWEAPONS_15_00");	//���� � ������ ������ � ����?
	AI_Output(self,other,"DIA_Brian_NEEDWEAPONS_04_01");	//���. � ����� ���� ��������.
	AI_Output(self,other,"DIA_Brian_NEEDWEAPONS_04_02");	//������, ������� �������� � ���� �������, �������� ���������. ��� ������ ��� � ������, ��� ��� ��������.
	AI_Output(self,other,"DIA_Brian_NEEDWEAPONS_04_03");	//�� �� ���� ���������, ��� �������� ���������� ����, � ���� ������.
};


var int Brian_Trade_einmal;

instance DIA_Brian_WASKAUFEN(C_Info)
{
	npc = VLK_457_Brian;
	nr = 4;
	condition = DIA_Brian_WASKAUFEN_Condition;
	information = DIA_Brian_WASKAUFEN_Info;
	permanent = TRUE;
	description = "��� � ���� ������ � ����?";
	trade = TRUE;
};


func int DIA_Brian_WASKAUFEN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Brian_NEEDWEAPONS))
	{
		return TRUE;
	};
};

func void DIA_Brian_WASKAUFEN_Info()
{
	AI_Output(other,self,"DIA_Brian_WASKAUFEN_15_00");	//��� � ���� ������ � ����?
	B_GiveTradeInv(self);
	if(Npc_IsDead(Harad))
	{
		AI_Output(self,other,"DIA_Brian_WASKAUFEN_04_01");	//���� � ���� ��� ���� ������� ������ �������� ��������, �� ������ ����� ��. �����, ��� ��� ���.
		if(MIS_Jack_NewLighthouseOfficer == 0)
		{
			AI_Output(self,other,"DIA_Brian_WASKAUFEN_04_02");	//� ��� ��� ��� ������ ������ ��� �����, ��������� ���� � ���� �� ��������.
			AI_Output(self,other,"DIA_Brian_WASKAUFEN_04_03");	//��� �� ��������� ���������� �������� � �������. ��� ������, ��� � ��� ��������� � �����.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Brian_WASKAUFEN_04_05");	//� ���� ������� ���� �������� ���������.
	};
	if(Brian_Trade_einmal == FALSE)
	{
		Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
		B_LogEntry(TOPIC_CityTrader,"������, ����������� ������, ������� �������� ���������.");
		Brian_Trade_einmal = TRUE;
	};
	Npc_RemoveInvItems(self,ItMiSwordblade,Npc_HasItems(self,ItMiSwordblade));
};


instance DIA_Brian_KAP3_EXIT(C_Info)
{
	npc = VLK_457_Brian;
	nr = 999;
	condition = DIA_Brian_KAP3_EXIT_Condition;
	information = DIA_Brian_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Brian_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Brian_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Brian_RepairNecklace(C_Info)
{
	npc = VLK_457_Brian;
	nr = 8;
	condition = DIA_Brian_RepairNecklace_Condition;
	information = DIA_Brian_RepairNecklace_Info;
	permanent = FALSE;
	description = "�� ������ ������������� ��������� �������?";
};


func int DIA_Brian_RepairNecklace_Condition()
{
	if((MIS_Bennet_InnosEyeRepairedSetting != LOG_SUCCESS) && (Npc_HasItems(other,ItMi_InnosEye_Broken_Mis) || (MIS_SCKnowsInnosEyeIsBroken == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Brian_RepairNecklace_Info()
{
	AI_Output(other,self,"DIA_Brian_RepairNecklace_15_00");	//�� ������ ������������� ��������� �������?
	AI_Output(self,other,"DIA_Brian_RepairNecklace_04_01");	//� ����� ���� ��������, � �������, ����� ��� ��������� ������� ���� �� ������.
	if(Npc_IsDead(Harad) == FALSE)
	{
		AI_Output(self,other,"DIA_Brian_RepairNecklace_04_02");	//��������� �������? ���� ����� ���������� � �������.
	};
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
};


instance DIA_Brian_KAP4_EXIT(C_Info)
{
	npc = VLK_457_Brian;
	nr = 999;
	condition = DIA_Brian_KAP4_EXIT_Condition;
	information = DIA_Brian_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Brian_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Brian_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Brian_KAP5_EXIT(C_Info)
{
	npc = VLK_457_Brian;
	nr = 999;
	condition = DIA_Brian_KAP5_EXIT_Condition;
	information = DIA_Brian_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Brian_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Brian_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Brian_NEWLIGHTHOUSEOFFICER(C_Info)
{
	npc = VLK_457_Brian;
	nr = 51;
	condition = DIA_Brian_NEWLIGHTHOUSEOFFICER_Condition;
	information = DIA_Brian_NEWLIGHTHOUSEOFFICER_Info;
	description = "� ������, ��� �� ������������� ������ ������� �����.";
};


func int DIA_Brian_NEWLIGHTHOUSEOFFICER_Condition()
{
	if((Kapitel == 5) && (MIS_Jack_NewLighthouseOfficer == LOG_Running) && Npc_KnowsInfo(other,DIA_Brian_NEEDWEAPONS))
	{
		return TRUE;
	};
};

func void DIA_Brian_NEWLIGHTHOUSEOFFICER_Info()
{
	AI_Output(other,self,"DIA_Brian_NEWLIGHTHOUSEOFFICER_15_00");	//� ������, ��� �� ������������� ������ ������� �����.
	AI_Output(other,self,"DIA_Brian_NEWLIGHTHOUSEOFFICER_15_01");	//���� ���������� ����� � ����. �� ��� �� �� ���� �������� ����.
	AI_Output(self,other,"DIA_Brian_NEWLIGHTHOUSEOFFICER_04_02");	//�� ���� ������ ��������, ��� � ��� ���������� � �������� ���� � �������.
	AI_Output(other,self,"DIA_Brian_NEWLIGHTHOUSEOFFICER_15_03");	//��� ��������?
	AI_Output(self,other,"DIA_Brian_NEWLIGHTHOUSEOFFICER_04_04");	//�� ��� ����. ��� ��� ����� �� ���������� ������� ������. � ��� �������� ��� ����� �� ������.
	AI_Output(self,other,"DIA_Brian_NEWLIGHTHOUSEOFFICER_04_05");	//��������. ���������� � �����.
	MIS_Jack_NewLighthouseOfficer = LOG_SUCCESS;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Lighthouse");
};


instance DIA_Brian_LIGHTHOUSEFREE(C_Info)
{
	npc = VLK_457_Brian;
	nr = 8;
	condition = DIA_Brian_LIGHTHOUSEFREE_Condition;
	information = DIA_Brian_LIGHTHOUSEFREE_Info;
	permanent = TRUE;
	description = "�, ��� �������?";
};


func int DIA_Brian_LIGHTHOUSEFREE_Condition()
{
	if((MIS_Jack_NewLighthouseOfficer == LOG_SUCCESS) && (Npc_GetDistToWP(self,"NW_LIGHTHOUSE_IN_01") < 1000) && (Kapitel == 5))
	{
		return TRUE;
	};
};

func void DIA_Brian_LIGHTHOUSEFREE_Info()
{
	AI_Output(other,self,"DIA_Brian_LIGHTHOUSEFREE_15_00");	//� ��� �������?
	AI_Output(self,other,"DIA_Brian_LIGHTHOUSEFREE_04_01");	//����, ����� ������. ���� �� ������ ��� �����, ����� � ��� ����� ������ ��� ����.
};

