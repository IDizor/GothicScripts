
instance DIA_GornNW_KAP3_EXIT(C_Info)
{
	npc = PC_Fighter_NW_vor_DJG;
	nr = 999;
	condition = DIA_GornNW_KAP3_EXIT_Condition;
	information = DIA_GornNW_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_GornNW_KAP3_EXIT_Condition()
{
	return TRUE;
};

func void DIA_GornNW_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GornNW_Hallo(C_Info)
{
	npc = PC_Fighter_NW_vor_DJG;
	nr = 1;
	condition = DIA_GornNW_Hallo_Condition;
	information = DIA_GornNW_Hallo_Info;
	permanent = FALSE;
	description = "� ����� ��� � �������?";
};


func int DIA_GornNW_Hallo_Condition()
{
	return TRUE;
};

func void DIA_GornNW_Hallo_Info()
{
	AI_Output(other,self,"DIA_GornNW_Add_15_00");	//� ����� ��� � �������?
	if(MIS_RescueGorn == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_GornNW_Add_12_01");	//�� ���� ����, ������.
		AI_Output(self,other,"DIA_GornNW_Add_12_02");	//� ������� �� ������ �����.
		B_GivePlayerXP(XP_Ambient);
	}
	else
	{
		AI_Output(self,other,"DIA_GornNW_Add_12_03");	//������ ������� ����.
		AI_Output(self,other,"DIA_GornNW_Add_12_04");	//� ������� �� ������ �����.
	};
};


instance DIA_GornNW_WhatNext(C_Info)
{
	npc = PC_Fighter_NW_vor_DJG;
	nr = 1;
	condition = DIA_GornNW_WhatNext_Condition;
	information = DIA_GornNW_WhatNext_Info;
	permanent = TRUE;
	description = "��� �� ����������� ������ ������?";
};


func int DIA_GornNW_WhatNext_Condition()
{
	return TRUE;
};

func void DIA_GornNW_WhatNext_Info()
{
	AI_Output(other,self,"DIA_GornNW_Add_15_05");	//��� �� ����������� ������ ������?
	AI_Output(self,other,"DIA_GornNW_Add_12_06");	//������� � �������.
	AI_Output(other,self,"DIA_GornNW_Add_15_07");	//� �����?
	AI_Output(self,other,"DIA_GornNW_Add_12_08");	//��� ����� ... ��������, � ����� ������� � �������.
	AI_Output(self,other,"DIA_GornNW_Add_12_09");	//���-�� ���� ������ ������������� �� ������ - ����� ��� ����� ��������� � ��� �� ������ ��� ������� ��������������.
};

