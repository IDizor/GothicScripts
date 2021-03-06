
instance DIA_Khaled_EXIT(C_Info)
{
	npc = SLD_823_Khaled;
	nr = 999;
	condition = DIA_Khaled_EXIT_Condition;
	information = DIA_Khaled_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Khaled_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Khaled_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


var int Khaled_weiter;

instance DIA_Khaled_Hallo(C_Info)
{
	npc = SLD_823_Khaled;
	nr = 1;
	condition = DIA_Khaled_Hallo_Condition;
	information = DIA_Khaled_Hallo_Info;
	permanent = TRUE;
	description = "� ����� ��� � �������?";
};


func int DIA_Khaled_Hallo_Condition()
{
	if(Khaled_weiter == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Khaled_Hallo_Info()
{
	AI_Output(other,self,"DIA_Khaled_Hallo_15_00");	//� ����� ��� � �������?
	if(Npc_KnowsInfo(other,DIA_Lee_WannaJoin))
	{
		AI_Output(self,other,"DIA_Khaled_Hallo_11_01");	//�� - ��� �� ������ �������������� � ���, ��? � � ���� ���� ���� �� ��������� ������?
		Khaled_weiter = TRUE;
		Log_CreateTopic(Topic_SoldierTrader,LOG_NOTE);
		B_LogEntry(Topic_SoldierTrader,"����� - �������� �������.");
	}
	else
	{
		AI_Output(self,other,"DIA_Khaled_Hallo_11_02");	//���� � ���� ���-�� ������, �������� � ��. � ���� ������ � �����.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Khaled_TRADE(C_Info)
{
	npc = SLD_823_Khaled;
	nr = 700;
	condition = DIA_Khaled_TRADE_Condition;
	information = DIA_Khaled_TRADE_Info;
	permanent = TRUE;
	description = "����� ������ �� ������ ���������� ���?";
	trade = TRUE;
};


func int DIA_Khaled_TRADE_Condition()
{
	if(Khaled_weiter == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Khaled_TRADE_Info()
{
	AI_Output(other,self,"DIA_Khaled_TRADE_15_00");	//����� ������ �� ������ ���������� ���?
	B_GiveTradeInv(self);
	AI_Output(self,other,"DIA_Khaled_TRADE_11_01");	//������ ������. �� �� ��� ������� �� ����.
};


instance DIA_Khaled_WannaJoin(C_Info)
{
	npc = SLD_823_Khaled;
	nr = 10;
	condition = DIA_Khaled_WannaJoin_Condition;
	information = DIA_Khaled_WannaJoin_Info;
	permanent = TRUE;
	description = "�� �� ����������, ���� � ������������ � ���?";
};


func int DIA_Khaled_WannaJoin_Condition()
{
	if((Khaled_weiter == TRUE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Khaled_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Khaled_WannaJoin_15_00");	//�� �� ����������, ���� � ������������ � ���?
	AI_Output(self,other,"DIA_Khaled_WannaJoin_11_01");	//����� �� �������� ���������, � ���������� �� ����.
	if((MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS) || (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS))
	{
		AI_Output(other,self,"DIA_Khaled_WannaJoin_15_02");	//� ��� ��� ������.
		AI_Output(self,other,"DIA_Khaled_WannaJoin_11_03");	//��, ����� ��� � �������.
	};
};


instance DIA_Khaled_Woher(C_Info)
{
	npc = SLD_823_Khaled;
	nr = 3;
	condition = DIA_Khaled_Woher_Condition;
	information = DIA_Khaled_Woher_Info;
	permanent = FALSE;
	description = "��� �� �������� ����� ���������?";
};


func int DIA_Khaled_Woher_Condition()
{
	if(Khaled_weiter == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Khaled_Woher_Info()
{
	AI_Output(other,self,"DIA_Khaled_Woher_15_00");	//��� �� �������� ����� ���������?
	AI_Output(self,other,"DIA_Khaled_Woher_11_01");	//� ������ ������ � ������� � ���. �� �������� � ����� ���������, ������� ��������� � ������.
};


instance DIA_Khaled_AboutSylvio(C_Info)
{
	npc = SLD_823_Khaled;
	nr = 4;
	condition = DIA_Khaled_AboutSylvio_Condition;
	information = DIA_Khaled_AboutSylvio_Info;
	permanent = FALSE;
	description = "��� �� ������� � �������?";
};


func int DIA_Khaled_AboutSylvio_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Khaled_Woher))
	{
		return TRUE;
	};
};

func void DIA_Khaled_AboutSylvio_Info()
{
	AI_Output(other,self,"DIA_Khaled_AboutSylvio_15_00");	//��� �� ������� � �������?
	AI_Output(self,other,"DIA_Khaled_AboutSylvio_11_01");	//��� ������� ���! � ������ ��������, ��� ������ � ���, �������������� � ��� ������. ���� ����� �� ����������� � ���.
};


instance DIA_Khaled_AboutLee(C_Info)
{
	npc = SLD_823_Khaled;
	nr = 5;
	condition = DIA_Khaled_AboutLee_Condition;
	information = DIA_Khaled_AboutLee_Info;
	permanent = FALSE;
	description = "��� �� ������� � ��?";
};


func int DIA_Khaled_AboutLee_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Khaled_Woher))
	{
		return TRUE;
	};
};

func void DIA_Khaled_AboutLee_Info()
{
	AI_Output(other,self,"DIA_Khaled_AboutLee_15_00");	//��� �� ������� � ��?
	AI_Output(self,other,"DIA_Khaled_AboutLee_11_01");	//� �����, ������������, ��� ��-���������� ���������� �� - ��� �������� � ����� �������.
	AI_Output(self,other,"DIA_Khaled_AboutLee_11_02");	//�� ����� ��������� �� ��������. ������, � ���� ��� ����� � ���-��...
	AI_Output(self,other,"DIA_Khaled_AboutLee_11_03");	//��, ��� �� �� �� ����, �� ����������� ����� ����������� �� ����� �������, ��� �� ��� �������� �������.
	AI_Output(self,other,"DIA_Khaled_AboutLee_11_04");	//����� ����, �� ������� �����. ������� ����� ������� �� ����� ������ ����� ��� �����.
};


instance DIA_Khaled_PICKPOCKET(C_Info)
{
	npc = SLD_823_Khaled;
	nr = 900;
	condition = DIA_Khaled_PICKPOCKET_Condition;
	information = DIA_Khaled_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_Khaled_PICKPOCKET_Condition()
{
	return C_Beklauen(78,85);
};

func void DIA_Khaled_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Khaled_PICKPOCKET);
	Info_AddChoice(DIA_Khaled_PICKPOCKET,Dialog_Back,DIA_Khaled_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Khaled_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Khaled_PICKPOCKET_DoIt);
};

func void DIA_Khaled_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Khaled_PICKPOCKET);
};

func void DIA_Khaled_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Khaled_PICKPOCKET);
};

