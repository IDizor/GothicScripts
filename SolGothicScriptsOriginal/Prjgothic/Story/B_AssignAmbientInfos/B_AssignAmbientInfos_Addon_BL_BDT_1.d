
instance DIA_Addon_BL_BDT_1_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_Addon_BL_BDT_1_EXIT_Condition;
	information = DIA_Addon_BL_BDT_1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_BL_BDT_1_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_BL_BDT_1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_BL_BDT_1_Chef(C_Info)
{
	nr = 2;
	condition = DIA_Addon_BL_BDT_1_Chef_Condition;
	information = DIA_Addon_BL_BDT_1_Chef_Info;
	permanent = TRUE;
	description = "��� ����� �������?";
};


func int DIA_Addon_BL_BDT_1_Chef_Condition()
{
	return TRUE;
};

func void DIA_Addon_BL_BDT_1_Chef_Info()
{
	AI_Output(other,self,"DIA_Addon_BL_BDT_1_Chef_15_00");	//��� ����� �������?
	if(RavenIsDead == TRUE)
	{
		if(Npc_IsDead(Thorus))
		{
			AI_Output(self,other,"DIA_Addon_BL_BDT_1_Chef_01_01");	//��� ����� ���������� �������� � ������... ����� ��������� ����� �� ������� �� �� ����...
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_BL_BDT_1_Chef_01_02");	//� �����, ����� ������ �� ��������...
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BL_BDT_1_Chef_01_03");	//����� ������ ��� ��������. �� ������ ��� ���� � �������� ������.
		AI_Output(self,other,"DIA_Addon_BL_BDT_1_Chef_01_04");	//�� ������������ �����, ��� ���� ��� ������-����� ��������� �� ���� ����� �� ������.
	};
};


instance DIA_Addon_BL_BDT_1_Lager(C_Info)
{
	nr = 3;
	condition = DIA_Addon_BL_BDT_1_Lager_Condition;
	information = DIA_Addon_BL_BDT_1_Lager_Info;
	permanent = FALSE;
	description = "��� �� ������ ��� ������?";
};


func int DIA_Addon_BL_BDT_1_Lager_Condition()
{
	if((Sklaven_Flucht == FALSE) || !Npc_IsDead(Raven))
	{
		return TRUE;
	};
};

func void DIA_Addon_BL_BDT_1_Lager_Info()
{
	AI_Output(other,self,"DIA_Addon_BL_BDT_1_Lager_15_00");	//��� �� ������ ��� ������?
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_Lager_01_01");	//����� ���� ��� ����� �������� � ������� �����, ��� �������, ������ ����, ��� ������������.
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_Lager_01_02");	//����� ���� ������ �� ���, � ��������� ��������� �� �����.
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_Lager_01_03");	//� ��� ��� ����� �� ����������� � ������� �����. �� ���� �������� �����������, ����� �������� � �����.
	if(SC_KnowsRavensGoldmine == FALSE)
	{
		B_LogEntry(TOPIC_Addon_RavenKDW,LogText_Addon_RavensGoldmine);
		Log_AddEntry(TOPIC_Addon_Sklaven,LogText_Addon_RavensGoldmine);
		B_LogEntry(TOPIC_Addon_ScoutBandits,Log_Text_Addon_ScoutBandits);
	};
	SC_KnowsRavensGoldmine = TRUE;
};


instance DIA_Addon_BL_BDT_1_Lager2(C_Info)
{
	nr = 3;
	condition = DIA_Addon_BL_BDT_1_Lager2_Condition;
	information = DIA_Addon_BL_BDT_1_Lager2_Info;
	permanent = TRUE;
	description = "��� �� ������ ��� ������?";
};


func int DIA_Addon_BL_BDT_1_Lager2_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_BL_BDT_1_Lager))
	{
		return TRUE;
	};
};

func void DIA_Addon_BL_BDT_1_Lager2_Info()
{
	AI_Output(other,self,"DIA_Addon_BL_BDT_1_Lager2_15_00");	//��� �� ������ ��� ������?
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_Lager2_01_01");	//���� �� �� ����-������ ��������, ��� ��� ���������� �� ����.
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_Lager2_01_02");	//���� � ���� ��� �������� ������ ����������� � ���-��, �������. ����� ����� �� ����� �����������.
};


instance DIA_Addon_BL_BDT_1_News(C_Info)
{
	nr = 4;
	condition = DIA_Addon_BL_BDT_1_News_Condition;
	information = DIA_Addon_BL_BDT_1_News_Info;
	permanent = TRUE;
	description = "����� �������?";
};


func int DIA_Addon_BL_BDT_1_News_Condition()
{
	return TRUE;
};

func void DIA_Addon_BL_BDT_1_News_Info()
{
	AI_Output(other,self,"DIA_Addon_BL_BDT_1_News_15_00");	//����� �������?
	if(RavenIsDead == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_BL_BDT_1_News_01_01");	//����� �����. ��� �� ��� ������ ������?
	};
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_News_01_02");	//������ �� ������� ����� ��� �� �������, ������ ��� �� ��� � �� ��������� �� ��������� ��������� ���������.
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_News_01_03");	//��� ������� �������� ������ ��� ����, ����� ��������� �������� ����� ���.
};


instance DIA_Addon_BL_BDT_1_Sklaven(C_Info)
{
	nr = 5;
	condition = DIA_Addon_BL_BDT_1_Sklaven_Condition;
	information = DIA_Addon_BL_BDT_1_Sklaven_Info;
	permanent = TRUE;
	description = "��� �� ������ ��� �����������?";
};


func int DIA_Addon_BL_BDT_1_Sklaven_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_BL_BDT_1_Lager) && ((Sklaven_Flucht == FALSE) || (RavenIsDead == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_Addon_BL_BDT_1_Sklaven_Info()
{
	AI_Output(other,self,"DIA_Addon_BL_BDT_1_Sklaven_15_00");	//��� �� ������ ��� �����������?
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_Sklaven_01_01");	//����� ����� ���-�� ��������. ������� ��� ������ ����������, �� ������� ������ �������.
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_Sklaven_01_02");	//������� �� � ������ ����������� - ���� ��� ������� ������, ������ ���������.
	if(BDT_1_Ausbuddeln == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_BL_BDT_1_Sklaven_15_03");	//� ��� ����� �������� �����?
		AI_Output(self,other,"DIA_Addon_BL_BDT_1_Sklaven_01_04");	//��� �������, �� ���� ���� �� ������ � ������.
		BDT_1_Ausbuddeln = TRUE;
	};
};

func void B_AssignAmbientInfos_Addon_BL_BDT_1(var C_Npc slf)
{
	DIA_Addon_BL_BDT_1_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_1_Chef.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_1_Lager.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_1_News.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_1_Sklaven.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_1_Lager2.npc = Hlp_GetInstanceID(slf);
};

