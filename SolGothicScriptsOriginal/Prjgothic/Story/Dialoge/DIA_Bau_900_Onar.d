
instance DIA_Onar_EXIT(C_Info)
{
	npc = Bau_900_Onar;
	nr = 999;
	condition = DIA_Onar_EXIT_Condition;
	information = DIA_Onar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Onar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Onar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Onar_Hallo(C_Info)
{
	npc = Bau_900_Onar;
	nr = 1;
	condition = DIA_Onar_Hallo_Condition;
	information = DIA_Onar_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Onar_Hallo_Condition()
{
	if((self.aivar[AIV_TalkedToPlayer] == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Onar_Hallo_Info()
{
	AI_Output(self,other,"DIA_Onar_Hallo_14_00");	//��� ������ ���� ����?!
	AI_Output(self,other,"DIA_Onar_Hallo_14_01");	//��� �� ������� �� ���� �����?!
};


instance DIA_Onar_PERM(C_Info)
{
	npc = Bau_900_Onar;
	nr = 1;
	condition = DIA_Onar_PERM_Condition;
	information = DIA_Onar_PERM_Info;
	permanent = TRUE;
	description = "����� ��� � �������, �� ����� �����?";
};


func int DIA_Onar_PERM_Condition()
{
	return TRUE;
};

func void DIA_Onar_PERM_Info()
{
	AI_Output(other,self,"DIA_Onar_PERM_15_00");	//����� ��� � �������, �� ����� �����?
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_01");	//� �� �������, ����� ���� �� ����� ����� ���� ����. �� �� ��������� �����!
	};
	if(other.guild == GIL_SLD)
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_02");	//����� �������, ��� ��! � ����� ������, ������ �� ��� � ���� � �����!
		AI_Output(self,other,"DIA_Onar_PERM_14_03");	//���� ����� �����, ���������� � ��������, ����� ����, � ���� ���� ������ ��� ����.
	};
	if(other.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_04");	//��, �������. �� ������ ����, ��������� �� ����� ��������.
	};
	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_05");	//���, ���������� �������� �� ���������, ���� ���� ������!
	};
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_06");	//���� �������������� �� ���������������� �� ������ ������.
	};
};


instance DIA_Onar_Work(C_Info)
{
	npc = Bau_900_Onar;
	nr = 2;
	condition = DIA_Onar_Work_Condition;
	information = DIA_Onar_Work_Info;
	permanent = FALSE;
	description = "� ���� �������� �� ����!";
};


func int DIA_Onar_Work_Condition()
{
	if(Lee_SendToOnar == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Onar_Work_Info()
{
	AI_Output(other,self,"DIA_Onar_Work_15_00");	//� ���� �������� �� ����!
	AI_Output(self,other,"DIA_Onar_Work_14_01");	//��� ������ �� ����� �������.
	AI_Output(self,other,"DIA_Onar_Work_14_02");	//��� ���� ��������� �� ���� �����������.
	AI_Output(self,other,"DIA_Onar_Work_14_03");	//���� ������ ������ � ���� ����, ��������!
};


instance DIA_Onar_WorkAsSld(C_Info)
{
	npc = Bau_900_Onar;
	nr = 2;
	condition = DIA_Onar_WorkAsSld_Condition;
	information = DIA_Onar_WorkAsSld_Info;
	permanent = FALSE;
	description = "� ���� ���������� ����� � �������� ��������!";
};


func int DIA_Onar_WorkAsSld_Condition()
{
	if((Lee_SendToOnar == FALSE) && (Onar_WegenSldWerden == FALSE) && Npc_KnowsInfo(other,DIA_Onar_Work))
	{
		return TRUE;
	};
};

func void DIA_Onar_WorkAsSld_Info()
{
	AI_Output(other,self,"DIA_Onar_WorkAsSld_15_00");	//� ���� ���������� ����� � �������� ��������!
	AI_Output(self,other,"DIA_Onar_WorkAsSld_14_01");	//��? ��������? �� ����� ����! ���� �� �� ���� ��� ���������� ������� �������, �� ��������� ��������� �� ��� � ����.
	AI_Output(self,other,"DIA_Onar_WorkAsSld_14_02");	//� ������ �������� ������, � �������!
	Onar_WegenSldWerden = TRUE;
};


instance DIA_Onar_Aufstand(C_Info)
{
	npc = Bau_900_Onar;
	nr = 3;
	condition = DIA_Onar_Aufstand_Condition;
	information = DIA_Onar_Aufstand_Info;
	permanent = FALSE;
	description = "�� ������������� ������, ��� � ������?";
};


func int DIA_Onar_Aufstand_Condition()
{
	return TRUE;
};

func void DIA_Onar_Aufstand_Info()
{
	AI_Output(other,self,"DIA_Onar_Aufstand_15_00");	//�� ������������� ������, ��� � ������?
	AI_Output(self,other,"DIA_Onar_Aufstand_14_01");	//� ������ �������� ��. � ����������� ��� ����� � ��� ����� �� ������ ����.
	AI_Output(self,other,"DIA_Onar_Aufstand_14_02");	//� �� ����������� �� �� ������ ����.
	AI_Output(self,other,"DIA_Onar_Aufstand_14_03");	//� �� ������� ����� ������� ������, ����������� ���� �������, �������� ���� ������ ��� ����, ����� ��������� ���� ����������� �����.
	AI_Output(self,other,"DIA_Onar_Aufstand_14_04");	//����� � ������ ������ ��� ����� ��������. � � ���� �� ������? �� ����� �� ����� ���������.
	AI_Output(self,other,"DIA_Onar_Aufstand_14_05");	//��� - � ����������� ��������� ���� ����� ��������������! ������, ��� � ������� ����� �������, ������ �� ������ ���� ����������� �����.
};


instance DIA_Onar_WegenPepe(C_Info)
{
	npc = Bau_900_Onar;
	nr = 4;
	condition = DIA_Onar_WegenPepe_Condition;
	information = DIA_Onar_WegenPepe_Info;
	permanent = FALSE;
	description = "������ ����������� �����, � ���� ����� �� ��������� ���� ������.";
};


func int DIA_Onar_WegenPepe_Condition()
{
	if(MIS_Pepe_KillWolves == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Onar_WegenPepe_Info()
{
	AI_Output(other,self,"DIA_Onar_WegenPepe_15_00");	//������ ����������� �����, � ���� ����� �� ��������� ���� ������.
	AI_Output(self,other,"DIA_Onar_WegenPepe_14_01");	//� ��� ��� �� ��������? ��� ����� �����?
	AI_Output(other,self,"DIA_Onar_WegenPepe_15_02");	//���� �� ���������.
	AI_Output(self,other,"DIA_Onar_WegenPepe_14_03");	//����� ��� �� ����� ����? ���� �� ����������� � ���� �����, �� ����� �������� ����� ��.
	AI_Output(self,other,"DIA_Onar_WegenPepe_14_04");	//����� �� ���������� ���� �� ����� ��������?
	Onar_WegenPepe = TRUE;
};


instance DIA_Onar_WegenSekob(C_Info)
{
	npc = Bau_900_Onar;
	nr = 5;
	condition = DIA_Onar_WegenSekob_Condition;
	information = DIA_Onar_WegenSekob_Info;
	permanent = FALSE;
	description = "� ������ �� ������ ����� ������...";
};


func int DIA_Onar_WegenSekob_Condition()
{
	if(MIS_Sekob_RedeMitOnar == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Onar_WegenSekob_Info()
{
	AI_Output(other,self,"DIA_Onar_WegenSekob_15_00");	//� ������ �� ������ ����� ������...
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Onar_WegenSekob_14_01");	//���, ���� ������, ���� ����� �����? ������ ������ �������.
	}
	else
	{
		AI_Output(self,other,"DIA_Onar_WegenSekob_14_02");	//������ ������� �� ������ � ��� ����?
		AI_Output(other,self,"DIA_Onar_WegenSekob_15_03");	//� ���� ����� ���������. ������� ����� - ��� ��� ���������.
		Onar_WegenSldWerden = TRUE;
	};
	AI_Output(other,self,"DIA_Onar_WegenSekob_15_04");	//�� � ������ ��� �����. � ���� ������� ������ �� �� ����.
	AI_Output(other,self,"DIA_Onar_WegenSekob_15_05");	//�� ������, ��� ��� ��-�� ������� ������...
	AI_Output(self,other,"DIA_Onar_WegenSekob_14_06");	//(�����) �� ���������� ������! �� ��� �������, �� ����� ������ � �����? �� �� ���-�� ������!
	AI_Output(self,other,"DIA_Onar_WegenSekob_14_07");	//�� �� ������, ������� ������ ���� � ���� ���? ������ ������! ���� ��!
	AI_Output(self,other,"DIA_Onar_WegenSekob_14_08");	//���, � ����� ������ ������ �� ���� ��� ������.
	Onar_WegenSekob = TRUE;
};


instance DIA_Onar_LeeSentMe(C_Info)
{
	npc = Bau_900_Onar;
	nr = 6;
	condition = DIA_Onar_LeeSentMe_Condition;
	information = DIA_Onar_LeeSentMe_Info;
	permanent = FALSE;
	description = "���� ������ ��. � ���� �������� � �������� ��������!";
};


func int DIA_Onar_LeeSentMe_Condition()
{
	if((Lee_SendToOnar == TRUE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Onar_LeeSentMe_Info()
{
	AI_Output(other,self,"DIA_Onar_LeeSentMe_15_00");	//���� ������ ��. � ���� �������� � �������� ��������!
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_01");	//�� ��� ������� �� ����.
	if(Onar_WegenSldWerden == TRUE)
	{
		AI_Output(self,other,"DIA_Onar_LeeSentMe_14_02");	//��� ����� ������ ������� � ���� ��������� � ���� �� ����� ������ ������.
		AI_Output(self,other,"DIA_Onar_LeeSentMe_14_03");	//�� ��� �� ��������, ��� �� ����������, �, �������, ��� ���� ����.
	};
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_04");	//� ����� ������, �� �������� �� ����. ��� ��� ��������� � ����� ������������.
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_05");	//�� �� ������ ���� �� ����! ������ �������� � �������� � �����, � ���� �� ����� ������� ���-������, �������?
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_06");	//� ��� �������� ����� ����������, �������� � ��.
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_07");	//� ��� � ����� ����� �������� ������ ���� ���������.
	Onar_Approved = TRUE;
	B_LogEntry(TOPIC_BecomeSLD,"���� ��� ��� ���� ���������. ������ ����� �� ������������ ����� ���������� � ���� ���������.");
};


var int Onar_SOLD_Day;
var int Onar_SOLD_XP;

instance DIA_Onar_HowMuch(C_Info)
{
	npc = Bau_900_Onar;
	nr = 7;
	condition = DIA_Onar_HowMuch_Condition;
	information = DIA_Onar_HowMuch_Info;
	permanent = FALSE;
	description = "��� ��� ������ ����� ���������?";
};


func int DIA_Onar_HowMuch_Condition()
{
	if(Onar_Approved == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Onar_HowMuch_Info()
{
	AI_Output(other,self,"DIA_Onar_HowMuch_15_00");	//��� ��� ������ ����� ���������?
	AI_Output(self,other,"DIA_Onar_HowMuch_14_01");	//���, ���������...
	SOLD = 50;
	if(Onar_WegenSldWerden == TRUE)
	{
		AI_Output(self,other,"DIA_Onar_HowMuch_14_02");	//� �� ������ ������� ������ � ����.
	};
	if(Onar_WegenSekob == TRUE)
	{
		AI_Output(self,other,"DIA_Onar_HowMuch_14_03");	//�� �� ����������� ������ ������������������. ��� �������� ����� ����� ���������� � ������.
		SOLD = SOLD - 10;
	};
	if((ABSOLUTIONLEVEL_Farm > 1) || ((B_GetGreatestPetzCrime(self) > CRIME_NONE) && (ABSOLUTIONLEVEL_Farm > 0)))
	{
		AI_Output(self,other,"DIA_Onar_HowMuch_14_04");	//�� ��� ������������ �������� �������� �����, �� �����.
		SOLD = SOLD - 10;
	};
	if((Onar_WegenPepe == TRUE) && ((Onar_WegenSekob == TRUE) || (Onar_WegenSldWerden == TRUE)))
	{
		AI_Output(self,other,"DIA_Onar_HowMuch_14_05");	//� �� ��������� ��������� ���� ������ �������.
		SOLD = SOLD - 10;
	};
	AI_Output(self,other,"DIA_Onar_HowMuch_14_06");	//��� ��� ��������...
	B_Say_Gold(self,other,SOLD);
	Onar_SOLD_Day = Wld_GetDay();
	Onar_SOLD_XP = other.exp;
	AI_Output(self,other,"DIA_Onar_HowMuch_14_07");	//��� �������?
	Info_ClearChoices(DIA_Onar_HowMuch);
	Info_AddChoice(DIA_Onar_HowMuch,"������!",DIA_Onar_HowMuch_Ok);
	Info_AddChoice(DIA_Onar_HowMuch,"����� �� ���...",DIA_Onar_HowMuch_More);
	Info_AddChoice(DIA_Onar_HowMuch,"� ����?",DIA_Onar_HowMuch_PerDay);
};

func void DIA_Onar_HowMuch_PerDay()
{
	AI_Output(other,self,"DIA_Onar_HowMuch_PerDay_15_00");	//� ����?
	AI_Output(self,other,"DIA_Onar_HowMuch_PerDay_14_01");	//��� �� ���� ��������? � ������! �� � ��� ��� ���� �����.
	AI_Output(self,other,"DIA_Onar_HowMuch_PerDay_14_02");	//�����, ������� ���� � ������ ���� ������.
	AI_Output(self,other,"DIA_Onar_HowMuch_PerDay_14_03");	//� �� ��������� ��������� �� ����.
};

func void DIA_Onar_HowMuch_More()
{
	AI_Output(other,self,"DIA_Onar_HowMuch_More_15_00");	//����� �� ���...
	AI_Output(self,other,"DIA_Onar_HowMuch_More_14_01");	//�������, �� �� ������ ���������� �� ���� ������ ���������, ���� ������.
	AI_Output(self,other,"DIA_Onar_HowMuch_More_14_02");	//��� ���, ��� �� ��������!
	Log_CreateTopic(Topic_Bonus,LOG_NOTE);
	B_LogEntry(Topic_Bonus,"� ���� �������� � ����� ������������� ��� ��������������, ����� ��� ��� �����������������.");
	Info_ClearChoices(DIA_Onar_HowMuch);
};

func void DIA_Onar_HowMuch_Ok()
{
	AI_Output(other,self,"DIA_Onar_HowMuch_Ok_15_00");	//������!
	AI_Output(self,other,"DIA_Onar_HowMuch_Ok_14_01");	//� ���� ��� �����. � ������ ���, �������� � ��.
	Log_CreateTopic(Topic_Bonus,LOG_NOTE);
	B_LogEntry(Topic_Bonus,"� ���� �������� � ����� ������������� ��� ��������������, ����� ��� ��� �����������������.");
	Info_ClearChoices(DIA_Onar_HowMuch);
};


instance DIA_Onar_CollectGold(C_Info)
{
	npc = Bau_900_Onar;
	nr = 8;
	condition = DIA_Onar_CollectGold_Condition;
	information = DIA_Onar_CollectGold_Info;
	permanent = TRUE;
	description = "������� ��� ��� ���������!";
};


func int DIA_Onar_CollectGold_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Onar_HowMuch) && ((other.guild == GIL_SLD) || (other.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Onar_CollectGold_Info()
{
	AI_Output(other,self,"DIA_Onar_CollectGold_15_00");	//������� ��� ��� ���������!
	if(other.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Onar_CollectGold_14_01");	//� ����� ���������, � �� ��������� �� ��������.
	}
	else if(Torlof_TheOtherMission_TooLate == TRUE)
	{
		AI_Output(self,other,"DIA_Onar_CollectGold_14_02");	//�� ����� ������������ �� ������ �����������!
		AI_Output(self,other,"DIA_Onar_CollectGold_14_03");	//� ������� �������, ��� � ���� ���� ����. � �� ������ ���, ��� �� ���������� ������ � ���� ������ ����� ��������.
		AI_Output(self,other,"DIA_Onar_CollectGold_14_04");	//� �� ��������� ������� �������.
		AI_Output(self,other,"DIA_Onar_CollectGold_14_05");	//������ �� ������ ���������� ��������� ������ ��� ������! ����� ����, ����� �� ������� ���� ����.
	}
	else if(B_GetGreatestPetzCrime(self) > CRIME_NONE)
	{
		AI_Output(self,other,"DIA_Onar_CollectGold_14_06");	//� ������, ��� �� ������� ���������. ������� ����� � �� � ���������� ���� ������.
	}
	else if(Wld_GetDay() <= Onar_SOLD_Day)
	{
		AI_Output(self,other,"DIA_Onar_CollectGold_14_07");	//�� ���, ������ ����� �� ���?
		AI_Output(self,other,"DIA_Onar_CollectGold_14_08");	//�� ������ ���������� � ���� ���� �� ����. �� �������� ���� ��������� ������.
	}
	else if((Wld_GetDay() - 2) >= Onar_SOLD_Day)
	{
		if((Wld_GetDay() - 2) == Onar_SOLD_Day)
		{
			AI_Output(self,other,"DIA_Onar_CollectGold_14_09");	//��� �� ��� �����?
		}
		else
		{
			AI_Output(self,other,"DIA_Onar_CollectGold_14_10");	//��� �� ��� ��������� ���� ����?
		};
		AI_Output(self,other,"DIA_Onar_CollectGold_14_11");	//�� �� ����� ���� �� ���������!
		AI_Output(self,other,"DIA_Onar_CollectGold_14_12");	//��� �����, ��� �� ������.
		Onar_SOLD_Day = Wld_GetDay();
		Onar_SOLD_XP = other.exp;
	}
	else
	{
		if(other.exp > (Onar_SOLD_XP + 200))
		{
			AI_Output(self,other,"DIA_Onar_CollectGold_14_13");	//(����������) ��, �����. ��� ���� ���������.
			B_GiveInvItems(self,other,ItMi_Gold,SOLD);
			B_Say_Gold(self,other,SOLD);
		}
		else
		{
			AI_Output(self,other,"DIA_Onar_CollectGold_14_14");	//���? �� �� �� ������ �� �����, ������ ���� � �������� �� ���� � ����!
			AI_Output(self,other,"DIA_Onar_CollectGold_14_15");	//� �� ��������� ������� �� ���!
		};
		Onar_SOLD_Day = Wld_GetDay();
		Onar_SOLD_XP = other.exp;
	};
};


instance DIA_Onar_MariaGold(C_Info)
{
	npc = Bau_900_Onar;
	nr = 9;
	condition = DIA_Onar_MariaGold_Condition;
	information = DIA_Onar_MariaGold_Info;
	permanent = FALSE;
	description = "����� ������, ��� � ������� ������������.";
};


func int DIA_Onar_MariaGold_Condition()
{
	if(Maria_MehrGold == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Onar_MariaGold_Info()
{
	AI_Output(other,self,"DIA_Onar_MariaGold_15_00");	//����� ������, ��� � ������� ������������.
	AI_Output(self,other,"DIA_Onar_MariaGold_14_01");	//���?
	AI_Output(other,self,"DIA_Onar_MariaGold_15_02");	//��� �������, ��� �� ������ ������� ��� ������.
	AI_Output(self,other,"DIA_Onar_MariaGold_14_03");	//(��������) ��� ���� ���� ���� ��� �� ��� ����.
	AI_Output(self,other,"DIA_Onar_MariaGold_14_04");	//��� ������� �������?
	AI_Output(other,self,"DIA_Onar_MariaGold_15_05");	//���.
	AI_Output(self,other,"DIA_Onar_MariaGold_14_06");	//������, ������� �� ���������� ���������, �� ������ �������� �� 10 ����� ������.
	AI_Output(self,other,"DIA_Onar_MariaGold_14_07");	//�� �� ������� ������, �������?
	SOLD = SOLD + 10;
};


var int Onar_SellSheep;

instance DIA_Onar_WannaSheep(C_Info)
{
	npc = Bau_900_Onar;
	nr = 10;
	condition = DIA_Onar_WannaSheep_Condition;
	information = DIA_Onar_WannaSheep_Info;
	permanent = TRUE;
	description = "� ���� ������ ����!";
};


func int DIA_Onar_WannaSheep_Condition()
{
	if(Onar_SellSheep == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Onar_WannaSheep_Info()
{
	AI_Output(other,self,"DIA_Onar_WannaSheep_15_00");	//� ���� ������ ����!
	AI_Output(self,other,"DIA_Onar_WannaSheep_14_01");	//� ��� �� ����� ����� �������? �� ���-�� ������ ����� ����?
	AI_Output(other,self,"DIA_Onar_WannaSheep_15_02");	//�...
	AI_Output(self,other,"DIA_Onar_WannaSheep_14_03");	//���� �� ������ ������ ����, ��� �� ��������. ��� ��������� ������ �� ����� ����.
	AI_Output(self,other,"DIA_Onar_WannaSheep_14_04");	//���� ������� ���� ����.
	if(Npc_IsDead(Pepe))
	{
		AI_Output(other,self,"DIA_Onar_WannaSheep_15_05");	//�����, ��� ���� �����.
		AI_Output(self,other,"DIA_Onar_WannaSheep_14_06");	//��! � ����� ������... ������ 200 ������ ���, � ��� ������ ���� ���� �� ��������.
		Onar_SellSheep = TRUE;
	};
};


instance DIA_Onar_BuyLiesel(C_Info)
{
	npc = Bau_900_Onar;
	nr = 10;
	condition = DIA_Onar_BuyLiesel_Condition;
	information = DIA_Onar_BuyLiesel_Info;
	permanent = TRUE;
	description = "���, �����, 200 ������� �����. ��� ��� ����.";
};


func int DIA_Onar_BuyLiesel_Condition()
{
	if(Onar_SellSheep == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Onar_BuyLiesel_Info()
{
	AI_Output(other,self,"DIA_Onar_BuyLiesel_15_00");	//���, �����, 200 ������� �����. ��� ��� ����.
	if(B_GiveInvItems(other,self,ItMi_Gold,200))
	{
		AI_Output(self,other,"DIA_Onar_BuyLiesel_14_01");	//�� ������ ��� ������� ���� ���� �� ��������.
		AI_Output(self,other,"DIA_Onar_BuyLiesel_14_02");	//���� �� ��� ����������� ������ �� �����. ����������� ���� ���� ���������� �� ��� �����.
		Wld_InsertNpc(Follow_Sheep,"NW_BIGFARM_SHEEP2_02");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Onar_BuyLiesel_14_03");	//� ���� ��� ������� ������! �� ����� ���������� ��� ����������� �����.
	};
};

