
instance DIA_NOV_8_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_NOV_8_EXIT_Condition;
	information = DIA_NOV_8_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_NOV_8_EXIT_Condition()
{
	return TRUE;
};

func void DIA_NOV_8_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NOV_8_Fegen(C_Info)
{
	nr = 2;
	condition = DIA_NOV_8_Fegen_Condition;
	information = DIA_NOV_8_Fegen_Info;
	permanent = TRUE;
	description = "��� ����� ������, ����� �������� ����� �����������.";
};


func int DIA_NOV_8_Fegen_Condition()
{
	if((Kapitel == 1) && (MIS_KlosterArbeit == LOG_Running) && (NOV_Helfer < 4))
	{
		return TRUE;
	};
};


var int Feger3_Permanent;

func void DIA_NOV_8_Fegen_Info()
{
	AI_Output(other,self,"DIA_NOV_8_Fegen_15_00");	//��� ����� ������, ����� �������� ����� �����������.
	if(Hlp_GetInstanceID(Feger3) == Hlp_GetInstanceID(self))
	{
		if(Feger3_Permanent == FALSE)
		{
			AI_Output(self,other,"DIA_NOV_8_Fegen_08_01");	//��, ������. �� ������ ������� �������� ����� � ��� ����������� ������ ������ ���� ������?
			AI_Output(self,other,"DIA_NOV_8_Fegen_08_02");	//�� �������������, � ���� ���� ����� �� ��������, ����� � ������ ����. ������� � ������ ����. ���� �� ������, ���� �� �� �� ���������� � ����.
			NOV_Helfer = NOV_Helfer + 1;
			Feger3_Permanent = TRUE;
			B_GivePlayerXP(XP_Feger);
			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self,"FEGEN");
			B_LogEntry(Topic_ParlanFegen,"� ����� ����������, ��������� ������ ��� ��������� �������.");
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_8_Fegen_08_03");	//����, � ������� ���� ���������. � � ��� ������ ����, ��� ������ ����. ������ ���� � � ���������.
		};
	};
	if(Hlp_GetInstanceID(Feger3) == Hlp_GetInstanceID(self) == FALSE)
	{
		AI_Output(self,other,"DIA_NOV_8_Fegen_08_04");	//��, � ��� �� �� ������, �� � ����� �����.
	};
};


instance DIA_NOV_8_Wurst(C_Info)
{
	nr = 3;
	condition = DIA_NOV_8_Wurst_Condition;
	information = DIA_NOV_8_Wurst_Info;
	permanent = TRUE;
	description = "��� ������ ������� �������� �������?";
};


func int DIA_NOV_8_Wurst_Condition()
{
	if((Kapitel == 1) && (MIS_GoraxEssen == LOG_Running) && (Npc_HasItems(self,ItFo_Schafswurst) == 0) && (Npc_HasItems(other,ItFo_Schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void DIA_NOV_8_Wurst_Info()
{
	var string NovizeText;
	var string NovizeLeft;
	AI_Output(other,self,"DIA_NOV_8_Wurst_15_00");	//��� ������ ������� �������� �������?
	AI_Output(self,other,"DIA_NOV_8_Wurst_08_01");	//�� �������, �� ��������. ������� - ��� ������ ��, ��� ��� ���� �����.
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	Wurst_Gegeben = Wurst_Gegeben + 1;
	CreateInvItems(self,ItFo_Sausage,1);
	B_UseItem(self,ItFo_Sausage);
	NovizeLeft = IntToString(13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft,PRINT_NovizenLeft);
	AI_PrintScreen(NovizeText,-1,YPOS_GoldGiven,FONT_ScreenSmall,2);
};


instance DIA_NOV_8_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_NOV_8_JOIN_Condition;
	information = DIA_NOV_8_JOIN_Info;
	permanent = TRUE;
	description = "��� ��� ����� �����?";
};


func int DIA_NOV_8_JOIN_Condition()
{
	if(hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void DIA_NOV_8_JOIN_Info()
{
	AI_Output(other,self,"DIA_NOV_8_JOIN_15_00");	//��� ��� ����� �����?
	AI_Output(self,other,"DIA_NOV_8_JOIN_08_01");	//�� ������� ��������� ������, ������ ����� ������ ���� ���� �������� ���.
	AI_Output(self,other,"DIA_NOV_8_JOIN_08_02");	//����������� ��������� ������� ������ �����, � ������ ������� ����� �������� ������ � ���������� �����.
};


instance DIA_NOV_8_PEOPLE(C_Info)
{
	nr = 5;
	condition = DIA_NOV_8_PEOPLE_Condition;
	information = DIA_NOV_8_PEOPLE_Info;
	permanent = TRUE;
	description = "��� ��������� ����������?";
};


func int DIA_NOV_8_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_NOV_8_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_NOV_8_PEOPLE_15_00");	//��� ��������� ����������?
	AI_Output(self,other,"DIA_NOV_8_PEOPLE_08_01");	//������ �����. �� ������� �� ���� ����� ������� ����� ������ ������. ���� ��� ��������� � ������.
	AI_Output(self,other,"DIA_NOV_8_PEOPLE_08_02");	//��������� ������ - ��� ����. ����� ��� �� ���� ���, ����� ��� ����� ���������� � ����� ��� ���� �� �����.
};


instance DIA_NOV_8_LOCATION(C_Info)
{
	nr = 6;
	condition = DIA_NOV_8_LOCATION_Condition;
	information = DIA_NOV_8_LOCATION_Info;
	permanent = TRUE;
	description = "�������� ��� �� ���� ���������.";
};


func int DIA_NOV_8_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_NOV_8_LOCATION_Info()
{
	AI_Output(other,self,"DIA_NOV_8_LOCATION_15_00");	//�������� ��� �� ���� ���������.
	AI_Output(self,other,"DIA_NOV_8_LOCATION_08_01");	//�� ����� �������. ��� ������� �������� � �������� ������ �������.
	AI_Output(self,other,"DIA_NOV_8_LOCATION_08_02");	//��� ���� ���������� ��������� ���������. ��� ������������ ������ ������ ����.
};


instance DIA_NOV_8_STANDARD(C_Info)
{
	nr = 10;
	condition = DIA_NOV_8_STANDARD_Condition;
	information = DIA_NOV_8_STANDARD_Info;
	permanent = TRUE;
	description = "���� ���-������ ���������?";
};


func int DIA_NOV_8_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_NOV_8_STANDARD_Info()
{
	AI_Output(other,self,"DIA_NOV_8_STANDARD_15_00");	//���� ���-������ ���������?
	if(Kapitel == 1)
	{
		if(other.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_NOV_8_STANDARD_08_01");	//����� ������� � ���. ��� ����� ��� ��� �� ���� ��������� �� ������� ��� ������ � ���� ����.
			AI_Output(self,other,"DIA_NOV_8_STANDARD_08_02");	//�������, ��� � ���� �����-������ ��������� ���� �����. � ����� ������� ��������� ���� �����.
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_8_STANDARD_08_03");	//�������� ������� �� ������� ������ �������. ���� �� ��� ��������� �����, � ���������, � �������� ����� � ��������.
		};
	};
	if((Kapitel == 2) || (Kapitel == 3))
	{
		if((Pedro_Traitor == TRUE) && (MIS_NovizenChase != LOG_SUCCESS))
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_08_04");	//� ��� ��� �� ���� �������� � ���. ���� �� ��� ������ ��������� � ����� ���� ������.
			AI_Output(self,other,"DIA_NOV_3_STANDARD_08_05");	//�� ������ ����� ������� ������������ ��������, �� �� ��� ������� �����. ��� ������ ������� ������� ���������� ������ �� ��� �� ���� �������.
		}
		else if(MIS_NovizenChase == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_08_06");	//����� ������, �� ������ ������� ���� �� ��� �����.
			AI_Output(self,other,"DIA_NOV_3_STANDARD_08_07");	//���� �������� ����� ��������� �������� ��� ������ ����������� ��� � ������ �� ������ � ��� ������ �������.
		}
		else if(MIS_OLDWORLD == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_NOV_8_STANDARD_08_08");	//� ������ � �������� � �� ����� ���. �� �������� � ���� �����!
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_8_STANDARD_08_09");	//������ ����� ����� ���������� ���������, � ������� ������ ���� ��������. ��� ��� ������ ����� ��� ������� �������� �� ������ ��������.
		};
	};
	if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_NOV_8_STANDARD_08_10");	//���. � � ��������� ������ ������� �� ���. � ������ ������ �� ������ ���������� ��������!
	};
	if(Kapitel >= 5)
	{
		AI_Output(self,other,"DIA_NOV_8_STANDARD_08_11");	//��. �� �������� ������ ��� ���������! ����� ������� ���, ��� ������� �� ����� �������� ����. ������� ���� ������.
		AI_Output(self,other,"DIA_NOV_8_STANDARD_08_12");	//�������� ��� ������ �����, � ��� �������� ������ ����� �����, ����� ������� ��.
	};
};

func void B_AssignAmbientInfos_NOV_8(var C_Npc slf)
{
	dia_nov_8_exit.npc = Hlp_GetInstanceID(slf);
	dia_nov_8_join.npc = Hlp_GetInstanceID(slf);
	dia_nov_8_people.npc = Hlp_GetInstanceID(slf);
	dia_nov_8_location.npc = Hlp_GetInstanceID(slf);
	dia_nov_8_standard.npc = Hlp_GetInstanceID(slf);
	DIA_NOV_8_Fegen.npc = Hlp_GetInstanceID(slf);
	DIA_NOV_8_Wurst.npc = Hlp_GetInstanceID(slf);
};

