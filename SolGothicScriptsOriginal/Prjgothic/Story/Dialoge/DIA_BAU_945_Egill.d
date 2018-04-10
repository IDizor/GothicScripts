
instance DIA_Egill_EXIT(C_Info)
{
	npc = BAU_945_Egill;
	nr = 999;
	condition = DIA_Egill_EXIT_Condition;
	information = DIA_Egill_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Egill_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Egill_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Egill_HALLO(C_Info)
{
	npc = BAU_945_Egill;
	nr = 3;
	condition = DIA_Egill_HALLO_Condition;
	information = DIA_Egill_HALLO_Info;
	description = "��� ����������?";
};


func int DIA_Egill_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Egill_HALLO_Info()
{
	AI_Output(other,self,"DIA_Egill_HALLO_15_00");	//� ��� ����?
	AI_Output(self,other,"DIA_Egill_HALLO_08_01");	//����� ��� � �� ����� ������ �� ����� �����, ������� �� ����� �� �������� ���, ��� �����.
	AI_Output(self,other,"DIA_Egill_HALLO_08_02");	//�������, � �� �������� � ����.
	AI_Output(self,other,"DIA_Egill_HALLO_08_03");	//� �����.
	if(Hlp_IsValidNpc(Ehnim) && !C_NpcIsDown(Ehnim))
	{
		AI_Output(self,other,"DIA_Egill_HALLO_08_04");	//� ���� ����� ��� ��� - ��� ���� ����.
	};
};


instance DIA_Egill_FELDARBEIT(C_Info)
{
	npc = BAU_945_Egill;
	nr = 4;
	condition = DIA_Egill_FELDARBEIT_Condition;
	information = DIA_Egill_FELDARBEIT_Info;
	description = "��� ���� ������ � ����?";
};


func int DIA_Egill_FELDARBEIT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Egill_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Egill_FELDARBEIT_Info()
{
	AI_Output(other,self,"DIA_Egill_FELDARBEIT_15_00");	//��� ���� ������ � ����?
	AI_Output(self,other,"DIA_Egill_FELDARBEIT_08_01");	//�������. ���� �� ������ ��� ������� ������� ������� �� ������� ��� ������...
};


instance DIA_Egill_FELDRAEUBER(C_Info)
{
	npc = BAU_945_Egill;
	nr = 5;
	condition = DIA_Egill_FELDRAEUBER_Condition;
	information = DIA_Egill_FELDRAEUBER_Info;
	description = "������ �� ������ �� ������� � ����� �������� ���������?";
};


func int DIA_Egill_FELDRAEUBER_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Egill_FELDARBEIT))
	{
		return TRUE;
	};
};

func void DIA_Egill_FELDRAEUBER_Info()
{
	AI_Output(other,self,"DIA_Egill_FELDRAEUBER_15_00");	//������ �� ������ �� ������� � ����� �������� ���������?
	AI_Output(self,other,"DIA_Egill_FELDRAEUBER_08_01");	//�� ������? � ��� ���, ��� � ������� �� ���� �����, � ���� �� �������, ��� ��� ������ �� �����.
	AI_Output(self,other,"DIA_Egill_FELDRAEUBER_08_02");	//�� �� ����� ������ �������� �����.
};


instance DIA_Egill_STREIT2(C_Info)
{
	npc = BAU_945_Egill;
	nr = 6;
	condition = DIA_Egill_STREIT2_Condition;
	information = DIA_Egill_STREIT2_Info;
	description = "���� ���� ������� �� �� �����.";
};


func int DIA_Egill_STREIT2_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Egill_FELDRAEUBER) && Npc_KnowsInfo(other,DIA_Ehnim_FELDRAEUBER) && (Hlp_IsValidNpc(Ehnim) && !C_NpcIsDown(Ehnim)))
	{
		return TRUE;
	};
};

func void DIA_Egill_STREIT2_Info()
{
	AI_Output(other,self,"DIA_Egill_STREIT2_15_00");	//���� ���� ������� �� �� �����.
	AI_Output(self,other,"DIA_Egill_STREIT2_08_01");	//(����������) ���. � ��� ��� �� �������?
	AI_Output(other,self,"DIA_Egill_STREIT2_15_02");	//��� �� ���� ���� ��������� ������� ��������.
	AI_Output(self,other,"DIA_Egill_STREIT2_08_03");	//���? �� ���� ������ ���� �� ����� �������������� ����� ���� �����.
	AI_Output(self,other,"DIA_Egill_STREIT2_08_04");	//����� ���, ����� �� ������ �� ����������.
	AI_StopProcessInfos(self);
};


instance DIA_Egill_STREIT4(C_Info)
{
	npc = BAU_945_Egill;
	nr = 7;
	condition = DIA_Egill_STREIT4_Condition;
	information = DIA_Egill_STREIT4_Info;
	description = "���� ������� ��������� ������ �������.";
};


func int DIA_Egill_STREIT4_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Ehnim_STREIT3) && (Hlp_IsValidNpc(Ehnim) && !C_NpcIsDown(Ehnim)))
	{
		return TRUE;
	};
};

func void DIA_Egill_STREIT4_Info()
{
	AI_Output(other,self,"DIA_Egill_STREIT4_15_00");	//���� ������� ��������� ������ �������.
	AI_Output(self,other,"DIA_Egill_STREIT4_08_01");	//����� �� ����������� ��� ������, ��������� �����, � �� � ��� ������ ������. ����� ��� ���.
	AI_StopProcessInfos(self);
};


instance DIA_Egill_PERMKAP1(C_Info)
{
	npc = BAU_945_Egill;
	condition = DIA_Egill_PERMKAP1_Condition;
	information = DIA_Egill_PERMKAP1_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Egill_PERMKAP1_Condition()
{
	if((DIA_Ehnim_STREIT5_noPerm == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Egill_PERMKAP1_Info()
{
	AI_Output(self,other,"DIA_Egill_PERMKAP1_08_00");	//���� ���� ����, ��� �� ��������? � �����, ���� ����� ����.
	AI_StopProcessInfos(self);
};


instance DIA_Egill_PICKPOCKET(C_Info)
{
	npc = BAU_945_Egill;
	nr = 900;
	condition = DIA_Egill_PICKPOCKET_Condition;
	information = DIA_Egill_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Egill_PICKPOCKET_Condition()
{
	return C_Beklauen(45,24);
};

func void DIA_Egill_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Egill_PICKPOCKET);
	Info_AddChoice(DIA_Egill_PICKPOCKET,Dialog_Back,DIA_Egill_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Egill_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Egill_PICKPOCKET_DoIt);
};

func void DIA_Egill_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Egill_PICKPOCKET);
};

func void DIA_Egill_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Egill_PICKPOCKET);
};

