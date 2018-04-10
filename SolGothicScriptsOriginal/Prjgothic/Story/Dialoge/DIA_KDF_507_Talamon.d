
instance DIA_Talamon_KAP1_EXIT(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 999;
	condition = DIA_Talamon_KAP1_EXIT_Condition;
	information = DIA_Talamon_KAP1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Talamon_KAP1_EXIT_Condition()
{
	if(Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_Talamon_KAP1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


const string KDF_507_Checkpoint = "NW_MONASTERY_SEALROOM_01";

instance DIA_KDF_507_Talamon_FirstWarn(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 1;
	condition = DIA_KDF_507_Talamon_FirstWarn_Condition;
	information = DIA_KDF_507_Talamon_FirstWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_KDF_507_Talamon_FirstWarn_Condition()
{
	if((Pyrokar_LetYouPassTalamon == FALSE) && (self.aivar[AIV_Guardpassage_Status] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_KDF_507_Talamon_FirstWarn_Info()
{
	AI_Output(self,other,"DIA_KDF_507_Talamon_FirstWarn_04_00");	//���� ������ ���� ������. ����������� �����!
	AI_StopProcessInfos(self);
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,KDF_507_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};


instance DIA_KDF_507_Talamon_SecondWarn(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 2;
	condition = DIA_KDF_507_Talamon_SecondWarn_Condition;
	information = DIA_KDF_507_Talamon_SecondWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_KDF_507_Talamon_SecondWarn_Condition()
{
	if((Pyrokar_LetYouPassTalamon == FALSE) && (self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,KDF_507_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_KDF_507_Talamon_SecondWarn_Info()
{
	AI_Output(self,other,"DIA_KDF_507_Talamon_SecondWarn_04_00");	//����� ������� ���� ���� ������ ����, ���� �� �� ��������� �����!
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,KDF_507_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
	AI_StopProcessInfos(self);
};


instance DIA_KDF_507_Talamon_Attack(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 3;
	condition = DIA_KDF_507_Talamon_Attack_Condition;
	information = DIA_KDF_507_Talamon_Attack_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_KDF_507_Talamon_Attack_Condition()
{
	if((Pyrokar_LetYouPassTalamon == FALSE) && (self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,KDF_507_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_KDF_507_Talamon_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,1);
};


instance DIA_Talamon_KAP2_EXIT(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 999;
	condition = DIA_Talamon_KAP2_EXIT_Condition;
	information = DIA_Talamon_KAP2_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Talamon_KAP2_EXIT_Condition()
{
	if(Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Talamon_KAP2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Talamon_KAP3_EXIT(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 999;
	condition = DIA_Talamon_KAP3_EXIT_Condition;
	information = DIA_Talamon_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Talamon_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Talamon_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Talamon_KAP4_EXIT(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 999;
	condition = DIA_Talamon_KAP4_EXIT_Condition;
	information = DIA_Talamon_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Talamon_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Talamon_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Talamon_KAP5_Stop(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 50;
	condition = DIA_Talamon_KAP5_Stop_Condition;
	information = DIA_Talamon_KAP5_Stop_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Talamon_KAP5_Stop_Condition()
{
	if(Pyrokar_LetYouPassTalamon == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Talamon_KAP5_Stop_Info()
{
	AI_Output(self,other,"DIA_Talamon_KAP5_Stop_04_00");	//���� ������ ���� ������. ����������� �����!
	AI_Output(other,self,"DIA_Talamon_KAP5_Stop_15_01");	//������� ������, ��� ��� ����� ����� ����� ��������.
	AI_Output(self,other,"DIA_Talamon_KAP5_Stop_04_02");	//��, ���� �� ��� ������... ������, �� ������ �����. �����, ������� �� �����, ��������� ��� ���, �� ������������ �����.
	B_LogEntry(TOPIC_BuchHallenVonIrdorath,"������� ������ ����� �������� �� ������������ ����� � �������.");
};


instance DIA_Talamon_FoundSecretDoor(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 51;
	condition = DIA_Talamon_FoundSecretDoor_Condition;
	information = DIA_Talamon_FoundSecretDoor_Info;
	permanent = FALSE;
	description = "� ����� ��������� �����.";
};


func int DIA_Talamon_FoundSecretDoor_Condition()
{
	if(SecretLibraryIsOpen == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Talamon_FoundSecretDoor_Info()
{
	AI_Output(other,self,"DIA_Talamon_FoundSecretDoor_15_00");	//� ����� ��������� �����.
	AI_Output(self,other,"DIA_Talamon_FoundSecretDoor_04_01");	//(���������) ���? ���?
	AI_Output(other,self,"DIA_Talamon_FoundSecretDoor_15_02");	//�� ������� ������.
	AI_Output(self,other,"DIA_Talamon_FoundSecretDoor_04_03");	//� ��� �� ������?
	AI_Output(other,self,"DIA_Talamon_FoundSecretDoor_15_04");	//������, ��� ������ ������.
	AI_Output(self,other,"DIA_Talamon_FoundSecretDoor_04_05");	//��� ������ �������, � ������ ���������� �������� �� ���� ��������.
	AI_Output(self,other,"DIA_Talamon_FoundSecretDoor_04_06");	//� ���� �� ������ ��������, ��� ��� � ���� �������.
	MIS_ScoutLibrary = LOG_Running;
};


instance DIA_Talamon_ScoutSecretLibrary(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 51;
	condition = DIA_Talamon_ScoutSecretLibrary_Condition;
	information = DIA_Talamon_ScoutSecretLibrary_Info;
	permanent = TRUE;
	description = "� ��� � ���� �������.";
};


func int DIA_Talamon_ScoutSecretLibrary_Condition()
{
	if((MIS_ScoutLibrary == LOG_Running) && (HeroWasInLibrary == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Talamon_ScoutSecretLibrary_Info()
{
	AI_Output(other,self,"DIA_Talamon_ScoutSecretLibrary_15_00");	//� ��� � ���� �������.
	AI_Output(self,other,"DIA_Talamon_ScoutSecretLibrary_04_01");	//� ��� �� ��� �����?
	if(Npc_IsDead(SecretLibrarySkeleton))
	{
		AI_Output(other,self,"DIA_Talamon_ScoutSecretLibrary_15_02");	//��� ��� ������ �����, ���������� �����. � ���� ���.
		AI_Output(self,other,"DIA_Talamon_ScoutSecretLibrary_04_03");	//�������.
		AI_Output(self,other,"DIA_Talamon_ScoutSecretLibrary_04_04");	//�� ���������� � ���� ��������, ����� ������� ���.
		MIS_ScoutLibrary = LOG_SUCCESS;
		B_GivePlayerXP(XP_ScoutSecretLibrary);
	}
	else
	{
		AI_Output(other,self,"DIA_Talamon_ScoutSecretLibrary_15_05");	//���, �����, ����� ��������.
		AI_Output(self,other,"DIA_Talamon_ScoutSecretLibrary_04_06");	//��� ������ ���-�� ����, ��������� ������. � ��������� ���� �������� ��� ������ �������.
	};
};


instance DIA_Talamon_KAP5_EXIT(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 999;
	condition = DIA_Talamon_KAP5_EXIT_Condition;
	information = DIA_Talamon_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Talamon_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Talamon_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Talamon_PICKPOCKET(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 900;
	condition = DIA_Talamon_PICKPOCKET_Condition;
	information = DIA_Talamon_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_100;
};


func int DIA_Talamon_PICKPOCKET_Condition()
{
	return C_Beklauen(87,140);
};

func void DIA_Talamon_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Talamon_PICKPOCKET);
	Info_AddChoice(DIA_Talamon_PICKPOCKET,Dialog_Back,DIA_Talamon_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Talamon_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Talamon_PICKPOCKET_DoIt);
};

func void DIA_Talamon_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Talamon_PICKPOCKET);
};

func void DIA_Talamon_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Talamon_PICKPOCKET);
};

