
instance DIA_Addon_BenchPirate_EXIT(C_Info)
{
	npc = PIR_1363_Addon_PIRAT;
	nr = 999;
	condition = DIA_Addon_BenchPirate_EXIT_Condition;
	information = DIA_Addon_BenchPirate_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_BenchPirate_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_BenchPirate_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_BenchPirate_Hello(C_Info)
{
	npc = PIR_1363_Addon_PIRAT;
	nr = 1;
	condition = DIA_Addon_BenchPirate_Hello_Condition;
	information = DIA_Addon_BenchPirate_Hello_Info;
	permanent = TRUE;
	description = "��� ����?";
};


func int DIA_Addon_BenchPirate_Hello_Condition()
{
	return TRUE;
};

func void DIA_Addon_BenchPirate_Hello_Info()
{
	var int randy;
	AI_Output(other,self,"DIA_Addon_Pir_7_Hello_15_00");	//��� ����?
	randy = Hlp_Random(3);
	if(GregIsBack == TRUE)
	{
		if(randy == 0)
		{
			AI_Output(self,other,"DIA_Addon_Pir_7_Hello_07_01");	//���� �������-�� ��������. ����� �����.
		}
		else if(randy == 1)
		{
			AI_Output(self,other,"DIA_Addon_Pir_7_Hello_07_02");	//������ �������� ���������� ������ ������� ��� ���������. �������, ��� ��� ���� �� ������� ������� ����.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Pir_7_Hello_07_03");	//��� �, ����� �������� �������. ���� � ���� ����, ��� ��� �� �������.
		};
	}
	else if(randy == 0)
	{
		AI_Output(self,other,"DIA_Addon_Pir_7_Hello_07_04");	//�������, ������� ������� �� ��������, - ����� ���� ������ �����. ����� �� ������������ ��� �������.
	}
	else if(randy == 1)
	{
		AI_Output(self,other,"DIA_Addon_Pir_7_Hello_07_05");	//���� �������� ��������, ������ ��� ��� ������� ���, ����� ��� ����������. �� ������ ��� �� ��� ����������...
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Pir_7_Hello_07_06");	//���� � ��������� ����� ���� �� ��������, � � �� ���������� ������ ��� ������ ������, � ���� ����� ������ �������!
	};
};


instance DIA_Addon_BenchPirate_Anheuern(C_Info)
{
	npc = PIR_1363_Addon_PIRAT;
	nr = 11;
	condition = DIA_Addon_BenchPirate_Anheuern_Condition;
	information = DIA_Addon_BenchPirate_Anheuern_Info;
	permanent = FALSE;
	description = "�� ������ ��� ������.";
};


func int DIA_Addon_BenchPirate_Anheuern_Condition()
{
	if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_BenchPirate_Anheuern_Info()
{
	AI_Output(other,self,"DIA_Addon_BenchPirate_Anheuern_15_00");	//�� ������ ��� ������.
	AI_Output(self,other,"DIA_Addon_BenchPirate_Anheuern_07_01");	//������ �����?
	AI_Output(other,self,"DIA_Addon_BenchPirate_Anheuern_15_08");	//�����.
};


instance DIA_Addon_BenchPirate_ComeOn(C_Info)
{
	npc = PIR_1363_Addon_PIRAT;
	nr = 12;
	condition = DIA_Addon_BenchPirate_ComeOn_Condition;
	information = DIA_Addon_BenchPirate_ComeOn_Info;
	permanent = TRUE;
	description = "��� ���� ������.";
};


func int DIA_Addon_BenchPirate_ComeOn_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (MIS_Addon_Greg_ClearCanyon == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_BenchPirate_Anheuern))
	{
		return TRUE;
	};
};

func void DIA_Addon_BenchPirate_ComeOn_Info()
{
	AI_Output(other,self,"DIA_Addon_BenchPirate_ComeOn_15_01");	//��� ���� ������.
	if(C_GregsPiratesTooFar() == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_BenchPirate_ComeOn_07_02");	//������ ���� � � �����������...
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BenchPirate_ComeOn_07_01");	//����, �������!
		if(C_BodyStateContains(self,BS_SIT))
		{
			AI_Standup(self);
			B_TurnToNpc(self,other);
		};
		AI_StopProcessInfos(self);
		B_Addon_PiratesFollowAgain();
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_Addon_BenchPirate_GoHome(C_Info)
{
	npc = PIR_1363_Addon_PIRAT;
	nr = 13;
	condition = DIA_Addon_BenchPirate_GoHome_Condition;
	information = DIA_Addon_BenchPirate_GoHome_Info;
	permanent = TRUE;
	description = "�� ��� ������ �� �����.";
};


func int DIA_Addon_BenchPirate_GoHome_Condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_BenchPirate_GoHome_Info()
{
	AI_Output(other,self,"DIA_Addon_BenchPirate_GoHome_15_00");	//�� ��� ������ �� �����.
	AI_Output(self,other,"DIA_Addon_BenchPirate_GoHome_07_01");	//����������� � ������, �������!
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Addon_BenchPirate_TooFar(C_Info)
{
	npc = PIR_1363_Addon_PIRAT;
	nr = 14;
	condition = DIA_Addon_BenchPirate_TooFar_Condition;
	information = DIA_Addon_BenchPirate_TooFar_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_BenchPirate_TooFar_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (C_GregsPiratesTooFar() == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_BenchPirate_TooFar_Info()
{
	AI_Output(self,other,"DIA_Addon_BenchPirate_TooFar_07_01");	//�� ������� ������ �� ������.
	AI_Output(self,other,"DIA_Addon_BenchPirate_GoHome_07_02");	//��� ��� ��� �� ��������.
	if(C_HowManyPiratesInParty() >= 2)
	{
		AI_Output(self,other,"DIA_Addon_Matt_TooFar_07_02");	//� ����������� � ������!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Matt_TooFar_07_03");	//�� � �������� ������������ � ������!
	};
	B_Addon_PiratesGoHome();
	AI_StopProcessInfos(self);
};

