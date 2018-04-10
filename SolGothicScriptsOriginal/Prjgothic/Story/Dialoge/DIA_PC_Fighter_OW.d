
instance DIA_GornOW_EXIT(C_Info)
{
	npc = PC_Fighter_OW;
	nr = 999;
	condition = DIA_GornOW_EXIT_Condition;
	information = DIA_GornOW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_GornOW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_GornOW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GornOW_Hello(C_Info)
{
	npc = PC_Fighter_OW;
	nr = 2;
	condition = DIA_GornOW_Hello_Condition;
	information = DIA_GornOW_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_GornOW_Hello_Condition()
{
	return TRUE;
};

func void DIA_GornOW_Hello_Info()
{
	var C_Npc Milten;
	Milten = Hlp_GetNpc(PC_Mage_OW);
	AI_Output(other,self,"DIA_GornOW_Hello_15_00");	//������ ������������� ����� - �� ��������!
	AI_Output(self,other,"DIA_GornOW_Hello_12_01");	//�� ��. ����� ���� ���� �������� ���� ������.
	AI_Output(self,other,"DIA_GornOW_Hello_12_02");	//�� � ������ �� ������, ��� ��� ������ ��, �������. � ��������� ��� ������ ����.
	AI_Output(other,self,"DIA_GornOW_Hello_15_03");	//(����������) ������ �������, ��� �� ��� ������� ����� � �� ������ �� ����� ���� ��������� ������� ����.
	AI_Output(self,other,"DIA_GornOW_Hello_12_04");	//��� �� �� �������� �� ����, � �� �� ��������� �� ���� ������ ����. �� ����� ���������� ������. ��� ������ ��� ��� �������� �������.
	if(other.guild == GIL_SLD)
	{
		AI_Output(self,other,"DIA_GornOW_Add_12_00");	//�������, � ���� ���� ���-���, ��� ����� �� ����������� ����.
		AI_Output(self,other,"DIA_GornOW_Add_12_01");	//� ����� ��� ������� �����, � ������. ��������, �� ������� �����-�� �����������.
		B_GiveInvItems(self,other,itar_sld_M,1);
		AI_Output(self,other,"DIA_GornOW_Add_12_02");	//��� ���� ��� ������� ����, �� ���� ����� ������� ...
		AI_Output(other,self,"DIA_GornOW_Add_15_03");	//�������! �������� � ������� ...
	}
	else
	{
		AI_Output(other,self,"DIA_GornOW_Hello_15_05");	//�����, �������� � �������.
	};
	AI_Output(self,other,"DIA_GornOW_Hello_12_06");	//�������.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FREE");
	B_StartOtherRoutine(Milten,"GORNFREE");
	MIS_RescueGorn = LOG_SUCCESS;
	B_GivePlayerXP(XP_RescueGorn);
};


instance DIA_GornOW_MetMilten(C_Info)
{
	npc = PC_Fighter_OW;
	nr = 2;
	condition = DIA_GornOW_MetMilten_Condition;
	information = DIA_GornOW_MetMilten_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_GornOW_MetMilten_Condition()
{
	if((MIS_RescueGorn == LOG_SUCCESS) && (Npc_GetDistToWP(self,"OC_MAGE_LIBRARY_IN") <= 500) && Npc_IsInState(self,ZS_Talk) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_GornOW_MetMilten_Info()
{
	AI_Output(self,other,"DIA_GornOW_MetMilten_12_00");	//�������� - ��� ����� ��� �������� �������. � �����, ����� ���������� �� ���� ������.
	AI_Output(self,other,"DIA_GornOW_MetMilten_12_01");	//��� �� ������ ����� ������?
	AI_Output(other,self,"DIA_GornOW_MetMilten_15_02");	//��� ���� ���� ����� ����������� �����.
	AI_Output(self,other,"DIA_GornOW_MetMilten_12_03");	//������. � ����� ������ ������ � ������� ������.
	if(other.guild != GIL_SLD)
	{
		AI_Output(other,self,"DIA_GornOW_MetMilten_15_04");	//� ���� �� �������?
		AI_Output(self,other,"DIA_GornOW_MetMilten_12_05");	//� ������, �� ��� ���. � ���� ����� �������������� � ����.
	}
	else
	{
		AI_Output(other,self,"DIA_GornOW_MetMilten_15_06");	//����� ��� �� ����� �����. �� � ��� ����� ������ ���. ��� ������ ����� ����� ����� ����.
		AI_Output(self,other,"DIA_GornOW_MetMilten_12_07");	//��� � ������. �����, �������, ��� ��� ���.
	};
};


instance DIA_GornOW_SeeYou(C_Info)
{
	npc = PC_Fighter_OW;
	nr = 900;
	condition = DIA_GornOW_SeeYou_Condition;
	information = DIA_GornOW_Seeyou_Info;
	permanent = TRUE;
	description = "��� ��������.";
};


func int DIA_GornOW_SeeYou_Condition()
{
	if(Npc_KnowsInfo(other,DIA_GornOW_MetMilten) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_GornOW_Seeyou_Info()
{
	AI_Output(other,self,"DIA_GornOW_SeeYou_15_00");	//��� ��������.
	AI_Output(self,other,"DIA_GornOW_SeeYou_12_01");	//��� �����.
	AI_StopProcessInfos(self);
};

