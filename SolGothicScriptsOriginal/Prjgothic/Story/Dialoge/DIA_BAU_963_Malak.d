
instance DIA_Malak_EXIT(C_Info)
{
	npc = BAU_963_Malak;
	nr = 999;
	condition = DIA_Malak_EXIT_Condition;
	information = DIA_Malak_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Malak_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Malak_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Malak_HALLO(C_Info)
{
	npc = BAU_963_Malak;
	nr = 3;
	condition = DIA_Malak_HALLO_Condition;
	information = DIA_Malak_HALLO_Info;
	description = "��� � �������?";
};


func int DIA_Malak_HALLO_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Malak_HALLO_Info()
{
	AI_Output(other,self,"DIA_Malak_HALLO_15_00");	//��� � �������?
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Malak_HALLO_08_01");	//��� ���� �������� �������, ������� �� �����, ��� ��������? ��� �������. �������� � ����� �������� ��������.
	}
	else
	{
		AI_Output(self,other,"DIA_Malak_HALLO_08_02");	//�������.
	};
};


instance DIA_Malak_WASMACHSTDU(C_Info)
{
	npc = BAU_963_Malak;
	nr = 4;
	condition = DIA_Malak_WASMACHSTDU_Condition;
	information = DIA_Malak_WASMACHSTDU_Info;
	description = "��� �� ������� �����?";
};


func int DIA_Malak_WASMACHSTDU_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Malak_HALLO) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Malak_WASMACHSTDU_Info()
{
	AI_Output(other,self,"DIA_Malak_WASMACHSTDU_15_00");	//��� �� ������� �����?
	AI_Output(self,other,"DIA_Malak_WASMACHSTDU_08_01");	//� ���� ����. ��� �� ����� �� ������� ������.
	AI_Output(self,other,"DIA_Malak_WASMACHSTDU_08_02");	//�� ������ ����� ���� ����� ������������. ��������, ���� ������������� � �������.
};


instance DIA_Malak_PASS(C_Info)
{
	npc = BAU_963_Malak;
	nr = 5;
	condition = DIA_Malak_PASS_Condition;
	information = DIA_Malak_PASS_Info;
	description = "��� �� ������ � �������?";
};


func int DIA_Malak_PASS_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Malak_WASMACHSTDU) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Malak_PASS_Info()
{
	AI_Output(other,self,"DIA_Malak_PASS_15_00");	//��� �� ������ � �������?
	AI_Output(self,other,"DIA_Malak_PASS_08_01");	//�� �����. ������ ��, ��� �� ����� � ������ ������ ��������, ������� ���� �������� �������� ��� ��������� ������ �����.
	AI_Output(self,other,"DIA_Malak_PASS_08_02");	//����� ������������, ���� ����� ���� ��������� ���, ��������, ��� ������������ ��������, ������������� ��������� ����� � ������ ��������.
	AI_Output(self,other,"DIA_Malak_PASS_08_03");	//��� ���������� ������ ��������� ��� �����.
};


instance DIA_Malak_WOPASS(C_Info)
{
	npc = BAU_963_Malak;
	nr = 6;
	condition = DIA_Malak_WOPASS_Condition;
	information = DIA_Malak_WOPASS_Info;
	description = "��� ��� ����� ������ � ������ ������ ��������?";
};


func int DIA_Malak_WOPASS_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Malak_HALLO) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Malak_WOPASS_Info()
{
	AI_Output(other,self,"DIA_Malak_WOPASS_15_00");	//��� ��� ����� ������ � ������ ������ ��������?
	AI_Output(self,other,"DIA_Malak_WOPASS_08_01");	//����� ���� ��������� �� ������ ������� ����� ��������.
};


instance DIA_Malak_MINENTAL(C_Info)
{
	npc = BAU_963_Malak;
	nr = 7;
	condition = DIA_Malak_MINENTAL_Condition;
	information = DIA_Malak_MINENTAL_Info;
	description = "��� ������� � ������ ��������?";
};


func int DIA_Malak_MINENTAL_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Malak_PASS) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Malak_MINENTAL_Info()
{
	AI_Output(other,self,"DIA_Malak_MINENTAL_15_00");	//��� ������� � ������ ��������?
	AI_Output(self,other,"DIA_Malak_MINENTAL_08_01");	//������. ��������� �������, ��� ������� ����� �� �����, ������ ������ �������� ���� ��� ������.
	AI_Output(self,other,"DIA_Malak_MINENTAL_08_02");	//�� � �����, ��� ��� ��� ������ �������.
};


instance DIA_Malak_WARSTDUSCHONDA(C_Info)
{
	npc = BAU_963_Malak;
	nr = 8;
	condition = DIA_Malak_WARSTDUSCHONDA_Condition;
	information = DIA_Malak_WARSTDUSCHONDA_Info;
	description = "� �� ��� � ������ ��������?";
};


func int DIA_Malak_WARSTDUSCHONDA_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Malak_PASS) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Malak_WARSTDUSCHONDA_Info()
{
	AI_Output(other,self,"DIA_Malak_WARSTDUSCHONDA_15_00");	//� �� ��� � ������ ��������?
	AI_Output(self,other,"DIA_Malak_WARSTDUSCHONDA_08_01");	//���. �� ������ � ���� ���� ����� � ��������. � � ������ ���� ��� ���� ���������, ������� �� ������.
	AI_Output(self,other,"DIA_Malak_WARSTDUSCHONDA_08_02");	//������, ��� ���, ����� ������ �� ��������� �� ������.
	AI_Output(self,other,"DIA_Malak_WARSTDUSCHONDA_08_03");	//������ ������ �������� ���� ������������ �������. ���� �� ������� ����, �� ��� ������� �� ��� ��������� �����.
};


instance DIA_Malak_PALADINE(C_Info)
{
	npc = BAU_963_Malak;
	nr = 9;
	condition = DIA_Malak_PALADINE_Condition;
	information = DIA_Malak_PALADINE_Info;
	description = "�������� ��� � ���������.";
};


func int DIA_Malak_PALADINE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Malak_WARSTDUSCHONDA) && Npc_KnowsInfo(other,DIA_Malak_MINENTAL) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Malak_PALADINE_Info()
{
	AI_Output(other,self,"DIA_Malak_PALADINE_15_00");	//�������� ��� �� ���� ���������. ��� ����� ��� ����� �����?
	AI_Output(self,other,"DIA_Malak_PALADINE_08_01");	//������ ��� ���, ��-�����. � ����� �� �����.
	AI_Output(self,other,"DIA_Malak_PALADINE_08_02");	//�� ��� ����� ��� ��� ���� ����� ����� ���������. ��� ����� ����� ������. � � ��� ��� � �� ������ �� �����.
};


instance DIA_Malak_KEINEFRAUEN(C_Info)
{
	npc = BAU_963_Malak;
	nr = 10;
	condition = DIA_Malak_KEINEFRAUEN_Condition;
	information = DIA_Malak_KEINEFRAUEN_Info;
	description = "� �� ���� ����� ������.";
};


func int DIA_Malak_KEINEFRAUEN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Malak_WASMACHSTDU) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Malak_KEINEFRAUEN_Info()
{
	AI_Output(other,self,"DIA_Malak_KEINEFRAUEN_15_00");	//� �� ���� ����� ������.
	AI_Output(self,other,"DIA_Malak_KEINEFRAUEN_08_01");	//�� ����. ��� ������� �����, ��� �������. � ��� ���� � �������, ��� �������.
};


instance DIA_Malak_PERMKAP1(C_Info)
{
	npc = BAU_963_Malak;
	nr = 11;
	condition = DIA_Malak_PERMKAP1_Condition;
	information = DIA_Malak_PERMKAP1_Info;
	permanent = TRUE;
	description = "������, �� �����������.";
};


func int DIA_Malak_PERMKAP1_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Malak_HALLO) && Npc_KnowsInfo(other,DIA_Malak_WASMACHSTDU) && Npc_KnowsInfo(other,DIA_Malak_PASS) && Npc_KnowsInfo(other,DIA_Malak_MINENTAL) && Npc_KnowsInfo(other,DIA_Malak_WARSTDUSCHONDA) && Npc_KnowsInfo(other,DIA_Malak_PALADINE) && Npc_KnowsInfo(other,DIA_Malak_KEINEFRAUEN) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Malak_PERMKAP1_Info()
{
	AI_Output(other,self,"DIA_Malak_PERMKAP1_15_00");	//������, �� �����������.
	AI_Output(self,other,"DIA_Malak_PERMKAP1_08_01");	//� ��������.
	AI_StopProcessInfos(self);
};


instance DIA_Malak_KAP3_EXIT(C_Info)
{
	npc = BAU_963_Malak;
	nr = 999;
	condition = DIA_Malak_KAP3_EXIT_Condition;
	information = DIA_Malak_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Malak_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Malak_KAP3_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Malak_FLEEFROMPASS(C_Info)
{
	npc = BAU_963_Malak;
	nr = 30;
	condition = DIA_Malak_FLEEFROMPASS_Condition;
	information = DIA_Malak_FLEEFROMPASS_Info;
	description = "��� �� ������� �����?";
};


func int DIA_Malak_FLEEFROMPASS_Condition()
{
	if(Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Malak_FLEEFROMPASS_Info()
{
	if((NpcObsessedByDMT_Malak == FALSE) && (hero.guild == GIL_KDF))
	{
		B_NpcObsessedByDMT(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Malak_FLEEFROMPASS_15_00");	//��� �� ������� �����?
		AI_Output(self,other,"DIA_Malak_FLEEFROMPASS_08_01");	//� ������ � ����� �������. � �� ����, ����� ���� ������� ��� ��� �����, ��� ������� ����� �� �������.
		AI_Output(self,other,"DIA_Malak_FLEEFROMPASS_08_02");	//�� ����������� ���� �� ������, ����� ����� ���������� ������ �� ��������� ��������� ����.
		AI_Output(other,self,"DIA_Malak_FLEEFROMPASS_15_03");	//����.
		B_LogEntry(TOPIC_BengarALLEIN,"����� ��������� � ����������� ����� �� ���, ������ ��� ������ ������, ���������� �� ��� �������� �� �������.");
		B_GivePlayerXP(XP_FoundMalakFLEEFROMPASS);
	};
};


instance DIA_Malak_Heilung(C_Info)
{
	npc = BAU_963_Malak;
	nr = 55;
	condition = DIA_Malak_Heilung_Condition;
	information = DIA_Malak_Heilung_Info;
	permanent = TRUE;
	description = "���� ����� ������.";
};


func int DIA_Malak_Heilung_Condition()
{
	if((NpcObsessedByDMT_Malak == TRUE) && (NpcObsessedByDMT == FALSE) && (hero.guild == GIL_KDF) && (Kapitel >= 3))
	{
		return TRUE;
	};
};


var int DIA_Malak_Heilung_oneTime;

func void DIA_Malak_Heilung_Info()
{
	AI_Output(other,self,"DIA_Malak_Heilung_15_00");	//���� ����� ������.
	if(DIA_Malak_Heilung_oneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Malak_Heilung_08_01");	//(��������) � ������ ���� ��������� �����. � ������� � �������. �������, �� ��� ���.
		B_NpcClearObsessionByDMT(self);
		Npc_ExchangeRoutine(self,"Start");
		B_StartOtherRoutine(BAU_962_Bauer,"Start");
		B_StartOtherRoutine(BAU_964_Bauer,"Start");
		B_StartOtherRoutine(BAU_965_Bauer,"Start");
		B_StartOtherRoutine(BAU_966_Bauer,"Start");
		B_StartOtherRoutine(BAU_967_Bauer,"Start");
		B_StartOtherRoutine(BAU_968_Bauer,"Start");
		B_StartOtherRoutine(BAU_969_Bauer,"Start");
		DIA_Malak_Heilung_oneTime = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Malak_Heilung_08_02");	//������ ���� � �����, ���. � ���������.
		B_NpcClearObsessionByDMT(self);
	};
};


instance DIA_Malak_PERMCASTLE(C_Info)
{
	npc = BAU_963_Malak;
	nr = 31;
	condition = DIA_Malak_PERMCASTLE_Condition;
	information = DIA_Malak_PERMCASTLE_Info;
	permanent = TRUE;
	description = "� ��� ���� �����?";
};


func int DIA_Malak_PERMCASTLE_Condition()
{
	if((Npc_GetDistToWP(self,"CASTLEMINE") < 4000) && (MIS_GetMalakBack != LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_Malak_FLEEFROMPASS) && (NpcObsessedByDMT_Malak == FALSE) && (hero.guild != GIL_KDF) && (Kapitel >= 3))
	{
		return TRUE;
	};
};

func void DIA_Malak_PERMCASTLE_Info()
{
	AI_Output(other,self,"DIA_Malak_PERMCASTLE_15_00");	//� ��� ���� �����?
	AI_Output(self,other,"DIA_Malak_PERMCASTLE_08_01");	//����� ��� ���������� ����� ���� ������ � ���������. ��� ��� �� ������� ���.
};


instance DIA_Malak_BACKTOBENGAR(C_Info)
{
	npc = BAU_963_Malak;
	nr = 31;
	condition = DIA_Malak_BACKTOBENGAR_Condition;
	information = DIA_Malak_BACKTOBENGAR_Info;
	permanent = TRUE;
	description = "�� ����� �������.";
};


func int DIA_Malak_BACKTOBENGAR_Condition()
{
	if((MIS_GetMalakBack == LOG_Running) && Npc_KnowsInfo(other,DIA_Malak_FLEEFROMPASS) && (Npc_IsDead(Bengar) == FALSE) && (NpcObsessedByDMT_Malak == FALSE) && (hero.guild != GIL_KDF) && (Kapitel >= 3))
	{
		return TRUE;
	};
};

func void DIA_Malak_BACKTOBENGAR_Info()
{
	AI_Output(other,self,"DIA_Malak_BACKTOBENGAR_15_00");	//�� ����� �������. �� �����, ����� �� �������� �� ��� �����.
	AI_Output(self,other,"DIA_Malak_BACKTOBENGAR_08_01");	//� �� �����������. ���� ����� ����������, � �� �� ��� ������ �� �����!
	B_LogEntry(TOPIC_BengarALLEIN,"����� �� �������� �� ����� �������, ���� ��� �� ����� ������ ��������.");
	if(MIS_BengarsHelpingSLD == LOG_SUCCESS)
	{
		AI_Output(other,self,"DIA_Malak_BACKTOBENGAR_15_02");	//� ����� ��������. �� ���������� �� ����� ������.
		AI_Output(self,other,"DIA_Malak_BACKTOBENGAR_08_03");	//��, ��� ������ ����, ������� ��. �� ������� �������. � ��� ����� ������� ����� �����?
		AI_Output(other,self,"DIA_Malak_BACKTOBENGAR_15_04");	//��� ��� ��������.
		AI_Output(self,other,"DIA_Malak_BACKTOBENGAR_08_05");	//(� ������������) �-�-�. � �����, �������, �?
		Info_AddChoice(DIA_Malak_BACKTOBENGAR,"���.",DIA_Malak_BACKTOBENGAR_los);
	};
};

func void DIA_Malak_BACKTOBENGAR_los()
{
	AI_Output(other,self,"DIA_Malak_BACKTOBENGAR_los_15_00");	//���.
	AI_Output(self,other,"DIA_Malak_BACKTOBENGAR_los_08_01");	//������. ����� � �����������. �������, ���� ������ ����� ���� ����.
	MIS_GetMalakBack = LOG_SUCCESS;
	B_GivePlayerXP(XP_Malak_BACKTOBENGAR);
	B_NpcClearObsessionByDMT(self);
	Npc_ExchangeRoutine(self,"Start");
	B_StartOtherRoutine(BAU_962_Bauer,"Start");
	B_StartOtherRoutine(BAU_964_Bauer,"Start");
	B_StartOtherRoutine(BAU_965_Bauer,"Start");
	B_StartOtherRoutine(BAU_966_Bauer,"Start");
	B_StartOtherRoutine(BAU_967_Bauer,"Start");
	B_StartOtherRoutine(BAU_968_Bauer,"Start");
	B_StartOtherRoutine(BAU_969_Bauer,"Start");
};


instance DIA_Malak_BACK(C_Info)
{
	npc = BAU_963_Malak;
	nr = 32;
	condition = DIA_Malak_BACK_Condition;
	information = DIA_Malak_BACK_Info;
	permanent = TRUE;
	description = "�� ������ ���������� �� ����� �������?";
};


func int DIA_Malak_BACK_Condition()
{
	if((MIS_GetMalakBack == LOG_SUCCESS) && (NpcObsessedByDMT_Malak == FALSE) && (hero.guild != GIL_KDF) && (Kapitel >= 3))
	{
		return TRUE;
	};
};

func void DIA_Malak_BACK_Info()
{
	AI_Output(other,self,"DIA_Malak_BACK_15_00");	//�� ������ ���������� �� ����� �������?
	AI_Output(self,other,"DIA_Malak_BACK_08_01");	//�������. � ���� ��������� �������. �� ���-������ ���������.
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Malak_KAP4_EXIT(C_Info)
{
	npc = BAU_963_Malak;
	nr = 999;
	condition = DIA_Malak_KAP4_EXIT_Condition;
	information = DIA_Malak_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Malak_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Malak_KAP4_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Malak_KAP5_EXIT(C_Info)
{
	npc = BAU_963_Malak;
	nr = 999;
	condition = DIA_Malak_KAP5_EXIT_Condition;
	information = DIA_Malak_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Malak_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Malak_KAP5_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Malak_KAP6_EXIT(C_Info)
{
	npc = BAU_963_Malak;
	nr = 999;
	condition = DIA_Malak_KAP6_EXIT_Condition;
	information = DIA_Malak_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Malak_KAP6_EXIT_Condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Malak_KAP6_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Malak_PICKPOCKET(C_Info)
{
	npc = BAU_963_Malak;
	nr = 900;
	condition = DIA_Malak_PICKPOCKET_Condition;
	information = DIA_Malak_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Malak_PICKPOCKET_Condition()
{
	return C_Beklauen(43,40);
};

func void DIA_Malak_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Malak_PICKPOCKET);
	Info_AddChoice(DIA_Malak_PICKPOCKET,Dialog_Back,DIA_Malak_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Malak_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Malak_PICKPOCKET_DoIt);
};

func void DIA_Malak_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Malak_PICKPOCKET);
};

func void DIA_Malak_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Malak_PICKPOCKET);
};

