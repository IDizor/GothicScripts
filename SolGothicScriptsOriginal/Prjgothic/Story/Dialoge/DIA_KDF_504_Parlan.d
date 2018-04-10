
instance DIA_Parlan_Kap1_EXIT(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 999;
	condition = DIA_Parlan_Kap1_EXIT_Condition;
	information = DIA_Parlan_Kap1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Parlan_Kap1_EXIT_Condition()
{
	if(Kapitel <= 1)
	{
		return TRUE;
	};
};

func void DIA_Parlan_Kap1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


var int Parlan_Hammer;

func void B_Parlan_HAMMER()
{
	AI_Output(self,other,"DIA_Parlan_HAMMER_05_00");	//(������) ������� �������, ��� ���, ��� ���.
	AI_Output(self,other,"DIA_Parlan_HAMMER_05_01");	//����� �����, ��� ������ �������� '�����' �� ������ ���������.
	AI_Output(self,other,"DIA_Parlan_HAMMER_05_02");	//� �� ���� ������ ���� ������� �� ���� - � ���, ��� �� �������� �� ���� �������� �����.
	Parlan_Hammer = TRUE;
};


var int Parlan_LastPetzCounter;
var int Parlan_LastPetzCrime;

instance DIA_Parlan_PMSchulden(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 1;
	condition = DIA_Parlan_PMSchulden_Condition;
	information = DIA_Parlan_PMSchulden_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Parlan_PMSchulden_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Parlan_Schulden > 0) && (B_GetGreatestPetzCrime(self) <= Parlan_LastPetzCrime))
	{
		return TRUE;
	};
};

func void DIA_Parlan_PMSchulden_Info()
{
	var int diff;
	if((Parlan_Hammer == FALSE) && (Hammer_Taken == TRUE) && (other.guild == GIL_NOV) && (Npc_IsDead(Garwig) == FALSE))
	{
		B_Parlan_HAMMER();
	};
	AI_Output(self,other,"DIA_Parlan_PMSchulden_05_00");	//�� ������� ������ ����� ������.
	if(B_GetTotalPetzCounter(self) > Parlan_LastPetzCounter)
	{
		AI_Output(self,other,"DIA_Parlan_PMSchulden_05_01");	//� ���� �� ��� ��� �������, �� ���� ����������� ���� ����.
		if(Parlan_Schulden < 1000)
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_02");	//���� ���� ����� ���� ������� ������ ����������� ������������� ������� ����� ���������.
			AI_Output(other,self,"DIA_Parlan_PMAdd_15_00");	//�������?
			diff = B_GetTotalPetzCounter(self) - Parlan_LastPetzCounter;
			if(diff > 0)
			{
				Parlan_Schulden = Parlan_Schulden + (diff * 50);
			};
			if(Parlan_Schulden > 1000)
			{
				Parlan_Schulden = 1000;
			};
			B_Say_Gold(self,other,Parlan_Schulden);
		}
		else
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_03");	//�� ���� �� ���� ����������? ������ ������, ����� �� ������� �������� ����� ������!
		};
	}
	else if(B_GetGreatestPetzCrime(self) < Parlan_LastPetzCrime)
	{
		AI_Output(self,other,"DIA_Parlan_PMSchulden_05_04");	//���� �������� ����������.
		if(Parlan_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_05");	//������ ��� ���������� ��������, ������������ �����!
		};
		if((Parlan_LastPetzCrime == CRIME_THEFT) || ((Parlan_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT)))
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_06");	//����� �� ����� �������������������, ��� �� �������!
		};
		if((Parlan_LastPetzCrime == CRIME_ATTACK) || ((Parlan_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK)))
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_07");	//����� ������ �� ����� �������������������, ��� �� �������� ������� � �����!
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_08");	//��� ��������� ������ ���� �� ������� �������������!
		};
		AI_Output(self,other,"DIA_Parlan_PMSchulden_05_09");	//��������, ���� ������� �������� ����, �� ����� ��� �����!
		if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_10");	//���� ����� ������.
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_11");	//� ����������, ����� �� ������ �� ������������ � ����� ���������!
			Parlan_Schulden = 0;
			Parlan_LastPetzCounter = 0;
			Parlan_LastPetzCrime = CRIME_NONE;
		}
		else
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_12");	//�� ������ ��������� �����. ������ ���� ������!
			B_Say_Gold(self,other,Parlan_Schulden);
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_13");	//���������� �� ����� ����!
		};
	};
	if(B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices(DIA_Parlan_PMSchulden);
		Info_ClearChoices(DIA_Parlan_PETZMASTER);
		Info_AddChoice(DIA_Parlan_PMSchulden,"� ���� ������������ ������!",DIA_Parlan_PETZMASTER_PayLater);
		Info_AddChoice(DIA_Parlan_PMSchulden,"������� ��� �����?",DIA_Parlan_PMSchulden_HowMuchAgain);
		if(Npc_HasItems(other,ItMi_Gold) >= Parlan_Schulden)
		{
			Info_AddChoice(DIA_Parlan_PMSchulden,"� ���� ��������� �����!",DIA_Parlan_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Parlan_PMSchulden_HowMuchAgain()
{
	AI_Output(other,self,"DIA_Parlan_PMSchulden_HowMuchAgain_15_00");	//������� ��� �����?
	B_Say_Gold(self,other,Parlan_Schulden);
	Info_ClearChoices(DIA_Parlan_PMSchulden);
	Info_ClearChoices(DIA_Parlan_PETZMASTER);
	Info_AddChoice(DIA_Parlan_PMSchulden,"� ���� ������������ ������!",DIA_Parlan_PETZMASTER_PayLater);
	Info_AddChoice(DIA_Parlan_PMSchulden,"������� ��� �����?",DIA_Parlan_PMSchulden_HowMuchAgain);
	if(Npc_HasItems(other,ItMi_Gold) >= Parlan_Schulden)
	{
		Info_AddChoice(DIA_Parlan_PMSchulden,"� ���� ��������� �����!",DIA_Parlan_PETZMASTER_PayNow);
	};
};


instance DIA_Parlan_PETZMASTER(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 1;
	condition = DIA_Parlan_PETZMASTER_Condition;
	information = DIA_Parlan_PETZMASTER_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Parlan_PETZMASTER_Condition()
{
	if(B_GetGreatestPetzCrime(self) > Parlan_LastPetzCrime)
	{
		return TRUE;
	};
};

func void DIA_Parlan_PETZMASTER_Info()
{
	if((Parlan_Hammer == FALSE) && (Hammer_Taken == TRUE) && (other.guild == GIL_NOV) && (Npc_IsDead(Garwig) == FALSE))
	{
		B_Parlan_HAMMER();
	};
	Parlan_Schulden = 0;
	if(self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_00");	//�� ��� �� ������ ���� ����������, � �� ��� ������� �� ���� ���� ����!
	};
	if(B_GetGreatestPetzCrime(self) == CRIME_MURDER)
	{
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_01");	//�� ����������� � ������ �� ���� ������������! ��������!
		Parlan_Schulden = B_GetTotalPetzCounter(self) * 50;
		Parlan_Schulden = Parlan_Schulden + 500;
		if((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_02");	//� �� ������� �� ���� ���� ����� ����!
		};
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_03");	//���� �� ���� ������ ���, �� ��� �� ������� �� �����, �� ������!
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_04");	//�� ���� �� ��������� ����� �� ���� ������������, �������, �� ������� ���� ���� �����.
	};
	if(B_GetGreatestPetzCrime(self) == CRIME_THEFT)
	{
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_05");	//��������� - ��������� ������� ���������!
		if((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_06");	//����� ����, �� ������� � ������ ������.
		};
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_07");	//��� ����������� ������ ���� ��������. ����� ����� ������.
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_08");	//�� ������ ��������� ����� ���������.
		Parlan_Schulden = B_GetTotalPetzCounter(self) * 50;
	};
	if(B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_09");	//�� �� ������ ���� � ���������. ����� ��������� �������� ���� �������.
		if(PETZCOUNTER_City_Sheepkiller > 0)
		{
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_10");	//� ����� �� ���� ���� ����?
		};
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_11");	//�� ����� ����� � ������������ � ��������. ��� �������� � ����.
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_12");	//�� ���� ������������, �� ������ ������� ������������� ���������.
		Parlan_Schulden = B_GetTotalPetzCounter(self) * 50;
	};
	if(B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER)
	{
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_13");	//�� ���� ���� ����. �� ������ ��������� ����������� �� ���!
		Parlan_Schulden = 100;
	};
	AI_Output(other,self,"DIA_Parlan_PETZMASTER_15_14");	//�������?
	if(Parlan_Schulden > 1000)
	{
		Parlan_Schulden = 1000;
	};
	B_Say_Gold(self,other,Parlan_Schulden);
	Info_ClearChoices(DIA_Parlan_PMSchulden);
	Info_ClearChoices(DIA_Parlan_PETZMASTER);
	Info_AddChoice(DIA_Parlan_PETZMASTER,"� ���� ������������ ������!",DIA_Parlan_PETZMASTER_PayLater);
	if(Npc_HasItems(other,ItMi_Gold) >= Parlan_Schulden)
	{
		Info_AddChoice(DIA_Parlan_PETZMASTER,"� ���� ��������� �����!",DIA_Parlan_PETZMASTER_PayNow);
	};
};

func void DIA_Parlan_PETZMASTER_PayNow()
{
	AI_Output(other,self,"DIA_Parlan_PETZMASTER_PayNow_15_00");	//� ���� ��������� �����!
	B_GiveInvItems(other,self,ItMi_Gold,Parlan_Schulden);
	AI_Output(self,other,"DIA_Parlan_PETZMASTER_PayNow_05_01");	//� �������� ���� �������������. ���� ����������� ������. � �������, ����� ���� ���� �������� �� ��������� ������ �������� ������.
	B_GrantAbsolution(LOC_MONASTERY);
	Parlan_Schulden = 0;
	Parlan_LastPetzCounter = 0;
	Parlan_LastPetzCrime = CRIME_NONE;
	Info_ClearChoices(DIA_Parlan_PMSchulden);
	Info_ClearChoices(DIA_Parlan_PETZMASTER);
};

func void DIA_Parlan_PETZMASTER_PayLater()
{
	AI_Output(other,self,"DIA_Parlan_PETZMASTER_PayLater_15_00");	//� ���� ������������ ������!
	AI_Output(self,other,"DIA_Parlan_PETZMASTER_PayLater_05_01");	//���� ������ �������� �� ���� �� ����, ��� �������.
	AI_Output(self,other,"DIA_Parlan_PETZMASTER_PayLater_05_02");	//��������, ��� ���� ����-������ ������. �� �������� �������, � ���� �� ����� ����� �������.
	Parlan_LastPetzCounter = B_GetTotalPetzCounter(self);
	Parlan_LastPetzCrime = B_GetGreatestPetzCrime(self);
	Info_ClearChoices(DIA_Parlan_PMSchulden);
	Info_ClearChoices(DIA_Parlan_PETZMASTER);
	AI_StopProcessInfos(self);
};


instance DIA_Parlan_WELCOME(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 1;
	condition = DIA_Parlan_WELCOME_Condition;
	information = DIA_Parlan_WELCOME_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Parlan_WELCOME_Condition()
{
	if(other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void B_DIA_Parlan_WELCOME_GoForTribute()
{
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_09");	//����� � ���� ����� ���������, �� ��������� � ����� ������ �����, � ���������.
};

func void B_DIA_Parlan_WELCOME_BringTribute2Gorax()
{
	AI_Output(self,other,"DIA_Addon_Parlan_WELCOME_05_00");	//������ ���� ������������� �������. �� �� ������������.
};

func void DIA_Parlan_WELCOME_Info()
{
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_00");	//����� ����������, ����� ���������. � ������.
	AI_Output(other,self,"DIA_Parlan_WELCOME_15_01");	//� �...
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_02");	//(���������) ...���������. �� �����, ��� �� ��� ������. ������ �� ����� ������. ������ ��� ����� ��������.
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_03");	//� � ��������� � �������� ����, ��� ���� ���������� ����������� ����� ������.
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_04");	//�� ����������� ����� ����� ��������, ��������� ���� ����� �������� ���, � ����� ��� ��� �����.
	AI_Output(other,self,"DIA_Parlan_WELCOME_15_05");	//� ��� ������?
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_06");	//������ �����, �� ������ ��������� ���� ����������� ����������. �� ������ �������� � ������� ��������.
	B_GrantAbsolution(LOC_ALL);
	Snd_Play("LEVELUP");
	Log_CreateTopic(Topic_Gemeinschaft,LOG_MISSION);
	Log_SetTopicStatus(Topic_Gemeinschaft,LOG_Running);
	B_LogEntry(Topic_Gemeinschaft,"� ����������� ���������� ������ ��������� ������ �� ����� ������.");
	if(Pedro_NOV_Aufnahme_LostInnosStatue_Daron == FALSE)
	{
		if(Liesel_Giveaway == FALSE)
		{
			AI_Output(self,other,"DIA_Parlan_WELCOME_05_07");	//�� ������� ������ ���� ���� � �������, �� ����������� � ���.
		};
		if(DIA_Gorax_GOLD_perm == FALSE)
		{
			AI_Output(self,other,"DIA_Parlan_WELCOME_05_08");	//�� ������ ������ ���� ������ �������, ������ ������������. �� ������� ��� � ����������.
			B_DIA_Parlan_WELCOME_GoForTribute();
		};
	}
	else if(DIA_Gorax_GOLD_perm == FALSE)
	{
		B_DIA_Parlan_WELCOME_BringTribute2Gorax();
		B_DIA_Parlan_WELCOME_GoForTribute();
	};
};


instance DIA_Parlan_Auge(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 2;
	condition = DIA_Parlan_Auge_Condition;
	information = DIA_Parlan_Auge_Info;
	permanent = FALSE;
	description = "� ��� ���� ������.";
};


func int DIA_Parlan_Auge_Condition()
{
	if(Kapitel <= 2)
	{
		return TRUE;
	};
};

func void DIA_Parlan_Auge_Info()
{
	AI_Output(other,self,"DIA_Parlan_Auge_15_00");	//� ��� ���� ������.
	AI_Output(self,other,"DIA_Parlan_Auge_05_01");	//� �� ����, ��� ������ ���� � ���, �� � ����� ������������� ��������� ����� �� ����� �����������.
	AI_Output(other,self,"DIA_Parlan_Auge_15_02");	//��� �������� ���� ������?
	AI_Output(self,other,"DIA_Parlan_Auge_05_03");	//����� �������� ����� ��� �����. �������� ����� ��� - � ���� ��� �� �������.
};


instance DIA_Parlan_Amulett(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 3;
	condition = DIA_Parlan_Amulett_Condition;
	information = DIA_Parlan_Amulett_Info;
	permanent = FALSE;
	description = "�������� ��� � ����� ������.";
};


func int DIA_Parlan_Amulett_Condition()
{
	if((Kapitel <= 2) && Npc_KnowsInfo(other,DIA_Parlan_Auge))
	{
		return TRUE;
	};
};

func void DIA_Parlan_Amulett_Info()
{
	AI_Output(other,self,"DIA_Parlan_Amulett_15_00");	//�������� ��� � ����� ������.
	AI_Output(self,other,"DIA_Parlan_Amulett_05_01");	//������. ���� ������ �������� ������� ������������ ���� ������. ������ ���� ��������� ����� ������ ����� ������ ���� ������.
	AI_Output(self,other,"DIA_Parlan_Amulett_05_02");	//�� ��� ������, ����� �������� ��� �� ��� ���, ����� ������ �����.
};


instance DIA_Parlan_Hagen(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 2;
	condition = DIA_Parlan_Hagen_Condition;
	information = DIA_Parlan_Hagen_Info;
	permanent = FALSE;
	description = "� ������ ���������� � ����������� ����������!";
};


func int DIA_Parlan_Hagen_Condition()
{
	if((Kapitel <= 2) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Parlan_Hagen_Info()
{
	AI_Output(other,self,"DIA_Parlan_Hagen_15_00");	//� ������ ���������� � ����������� ����������!
	AI_Output(self,other,"DIA_Parlan_Hagen_05_01");	//���� ����� �� ��������� ����������� - ������ ����� ��������� ������ ���.
};


instance DIA_Parlan_WORK(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 2;
	condition = DIA_Parlan_WORK_Condition;
	information = DIA_Parlan_WORK_Info;
	permanent = TRUE;
	description = "��� � ���� ������� ������?";
};


var int DIA_Parlan_WORK_perm;

func int DIA_Parlan_WORK_Condition()
{
	if((Kapitel == 1) && (Npc_KnowsInfo(other,DIA_Parlan_KNOWSJUDGE) == FALSE) && Npc_KnowsInfo(other,DIA_Parlan_WELCOME) && (DIA_Parlan_WORK_perm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Parlan_WORK_Info()
{
	AI_Output(other,self,"DIA_Parlan_WORK_15_00");	//��� � ���� ������� ������?
	if((Liesel_Giveaway == FALSE) || (DIA_Gorax_GOLD_perm == FALSE))
	{
		AI_Output(self,other,"DIA_Parlan_WELCOME_05_06");	//������ �����, �� ������ ��������� ���� ����������� ����������. �� ������ �������� � ������� ��������.
		if(Liesel_Giveaway == FALSE)
		{
			AI_Output(self,other,"DIA_Parlan_WELCOME_05_07");	//�� ������� ������ ���� ���� � �������, �� ����������� � ���.
		};
		if(DIA_Gorax_GOLD_perm == FALSE)
		{
			if(Pedro_NOV_Aufnahme_LostInnosStatue_Daron == TRUE)
			{
				B_DIA_Parlan_WELCOME_BringTribute2Gorax();
				B_DIA_Parlan_WELCOME_GoForTribute();
			}
			else
			{
				AI_Output(self,other,"DIA_Parlan_WELCOME_05_08");	//�� ������ ������ ���� ������ �������, ������ ������������. �� ������� ��� � ����������.
				AI_Output(self,other,"DIA_Parlan_WELCOME_05_09");	//����� � ���� ����� ���������, �� ��������� � ����� ������ �����, � ���������.
			};
		};
		AI_StopProcessInfos(self);
	}
	else if(Wld_IsTime(22,0,7,30))
	{
		AI_Output(self,other,"DIA_Parlan_WORK_NIGHT_05_01");	//������ ����� ����. ������ ����������� ���������� ���� ����� � ������������ �������.
		AI_Output(self,other,"DIA_Parlan_WORK_NIGHT_05_02");	//�� ���� ������ �����. ����������� �� ���, ����� ������ ����� ������.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_WORK_05_03");	//�������� � ������� ������. ��� ����� ���� ���������.
		AI_Output(self,other,"DIA_Parlan_WORK_05_04");	//� ���� ��������� �� ����� �������, � ���� �� ������ ������ ����������� � ���, �� �������� ���������� ����� � ����������, ����� ������� ������ ������.
		DIA_Parlan_WORK_perm = TRUE;
		MIS_KlosterArbeit = LOG_Running;
		B_LogEntry(Topic_Gemeinschaft,"���� � ������� ��� ������� �����, ��� ����� �������� ����� �������� ����������.");
	};
};


instance DIA_Parlan_Stand(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 23;
	condition = DIA_Parlan_Stand_Condition;
	information = DIA_Parlan_Stand_Info;
	permanent = TRUE;
	description = "���� � ����� � ����������?";
};


func int DIA_Parlan_Stand_Condition()
{
	if((MIS_KlosterArbeit == LOG_Running) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Parlan_Stand_Info()
{
	Kloster_Punkte = 0;
	AI_Output(other,self,"DIA_Parlan_Stand_15_00");	//���� � ����� � ����������?
	if(MIS_NeorasPflanzen == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_01");	//�� ������ �������� ������� ����� �������.
		Kloster_Punkte = Kloster_Punkte + 2;
	};
	if(MIS_NeorasRezept == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_02");	//�� ����� ������ ����� �������.
		Kloster_Punkte = Kloster_Punkte + 2;
	};
	if(MIS_IsgarothWolf == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_03");	//�� ���� ������� �����, ������������������ �������.
		Kloster_Punkte = Kloster_Punkte + 1;
	};
	if(MIS_ParlanFegen == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_04");	//�� ���� ����� ������� ����������� � �������� �����.
		Kloster_Punkte = Kloster_Punkte + 3;
	};
	if(MIS_GoraxEssen == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_05");	//�� ������ ������ ��� �����������, ��� � ������ ���� ���� ������.
		Kloster_Punkte = Kloster_Punkte + 1;
	}
	else if(MIS_GoraxEssen == LOG_FAILED)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_06");	//������ �������������� �����, ��� ��� �������� ����������� ���.
	};
	if(MIS_GoraxWein == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_07");	//�� ������ ����, ��� ���� � ����� ������.
		Kloster_Punkte = Kloster_Punkte + 1;
	}
	else if(MIS_GoraxWein == LOG_FAILED)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_08");	//��� ������ �� ����� �������� � ����, ��� �����...
	};
	if(Kloster_Punkte >= 8)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_09");	//��, �� ������ ���������. ������ ������ ����� ������ ��������� ������ ������. �������� � �������� �������� � ����������.
		AI_Output(self,other,"DIA_Parlan_Stand_05_10");	//� ����� ���� ���� ����.
		Parlan_Erlaubnis = TRUE;
		MIS_KlosterArbeit = LOG_SUCCESS;
		Wld_AssignRoomToGuild("Kloster02",GIL_PUBLIC);
		B_GiveInvItems(self,other,ItKe_KlosterBibliothek,1);
		if(MIS_NeorasPflanzen == LOG_Running)
		{
			MIS_NeorasPflanzen = LOG_OBSOLETE;
		};
		if(MIS_NeorasRezept == LOG_Running)
		{
			MIS_NeorasRezept = LOG_OBSOLETE;
		};
		if(MIS_IsgarothWolf == LOG_Running)
		{
			MIS_IsgarothWolf = LOG_OBSOLETE;
		};
		if(MIS_ParlanFegen == LOG_Running)
		{
			MIS_ParlanFegen = LOG_OBSOLETE;
		};
		if(MIS_GoraxEssen == LOG_Running)
		{
			MIS_GoraxEssen = LOG_OBSOLETE;
		};
		if(MIS_GoraxWein == LOG_Running)
		{
			MIS_GoraxWein = LOG_OBSOLETE;
		};
		if(MIS_MardukBeten == LOG_Running)
		{
			MIS_MardukBeten = LOG_OBSOLETE;
		};
		B_CheckLog();
	}
	else if(Kloster_Punkte >= 1)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_11");	//�� �������, �������, �� ���� �� ������ ���������� ������� ������.
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_12");	//������� ������� ���� ��������� �� ����� ������. � ����� �� ��������� ���� ������, �� �������� � ����� ���������.
	};
};


instance DIA_Parlan_Aufgabe(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 10;
	condition = DIA_Parlan_Aufgabe_Condition;
	information = DIA_Parlan_Aufgabe_Info;
	permanent = FALSE;
	description = "� ���� ���� �����-������ ������� ��� ����?";
};


func int DIA_Parlan_Aufgabe_Condition()
{
	if(MIS_KlosterArbeit == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Parlan_Aufgabe_Info()
{
	AI_Output(other,self,"DIA_Parlan_Aufgabe_15_00");	//� ���� ���� ��������� ��� ����?
	AI_Output(self,other,"DIA_Parlan_Aufgabe_05_01");	//���... ��, ��, ������������� ������ ������� ���-��� ��� ������.
	AI_Output(self,other,"DIA_Parlan_Aufgabe_05_02");	//������ ����������� �� �������� ������� ������. ���������� �� ����.
	AI_Output(other,self,"DIA_Parlan_Aufgabe_15_03");	//�� ��� ������ ����� ��������...
	AI_Output(self,other,"DIA_Parlan_Aufgabe_05_04");	//����� ���� ����� �� ������ ����� �������, ����� ���?
	MIS_ParlanFegen = LOG_Running;
	Log_CreateTopic(Topic_ParlanFegen,LOG_MISSION);
	Log_SetTopicStatus(Topic_ParlanFegen,LOG_Running);
	B_LogEntry(Topic_ParlanFegen,"������ ������ �����, ����� � ������ ����� ������� �����������. ��� ������ ����� ��������.");
};


instance DIA_Parlan_Fegen(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 3;
	condition = DIA_Parlan_Fegen_Condition;
	information = DIA_Parlan_Fegen_Info;
	permanent = TRUE;
	description = "������ ����� �����������...";
};


var int DIA_Parlan_Fegen_permanent;

func int DIA_Parlan_Fegen_Condition()
{
	if((MIS_ParlanFegen == LOG_Running) && (DIA_Parlan_Fegen_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Parlan_Fegen_Info()
{
	AI_Output(other,self,"DIA_Parlan_Fegen_15_00");	//������ ����� �����������...
	if(NOV_Helfer >= 4)
	{
		AI_Output(self,other,"DIA_Parlan_Fegen_05_01");	//���� ������� ����� ������� ����������� ���� � ������. � �����, ������ ��� ����� ��������� � ����� ������.
		AI_Output(self,other,"DIA_Parlan_Fegen_05_02");	//�������, ���������. �� �������� ��� ���������.
		MIS_ParlanFegen = LOG_SUCCESS;
		B_GivePlayerXP(XP_ParlanFegen);
		DIA_Parlan_Fegen_permanent = TRUE;
		B_StartOtherRoutine(Feger1,"START");
		B_StartOtherRoutine(Feger2,"START");
		B_StartOtherRoutine(Feger3,"START");
		B_StartOtherRoutine(Babo,"START");
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_Fegen_05_03");	//��������� - ��� ��������� ������. �� � ������� ������ �� ����������.
	};
};


instance DIA_Parlan_LEARN(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 23;
	condition = DIA_Parlan_LEARN_Condition;
	information = DIA_Parlan_LEARN_Info;
	permanent = FALSE;
	description = "��� ��� ������� ������ �����?";
};


func int DIA_Parlan_LEARN_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Parlan_Hagen) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Parlan_LEARN_Info()
{
	AI_Output(other,self,"DIA_Parlan_LEARN_15_00");	//��� ��� ������� ������ �����?
	AI_Output(self,other,"DIA_Parlan_LEARN_05_01");	//�� ����� �� ��� ����, ����� �������� ��� �����. �� �����, ����� ������� ������.
	AI_Output(self,other,"DIA_Parlan_LEARN_05_02");	//�� � ���� �������� ����, ��� �������� ���� ���������� �����������.
	B_LogEntry(Topic_KlosterTeacher,"������ ������ ����� ������ ��� �������� ��� ���������� �������.");
};


instance DIA_Parlan_KNOWSJUDGE(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 23;
	condition = DIA_Parlan_KNOWSJUDGE_Condition;
	information = DIA_Parlan_KNOWSJUDGE_Info;
	permanent = FALSE;
	description = "� ���� ������ ��������� �����.";
};


func int DIA_Parlan_KNOWSJUDGE_Condition()
{
	if((other.guild == GIL_NOV) && (KNOWS_FIRE_CONTEST == TRUE) && (Npc_KnowsInfo(hero,DIA_Pyrokar_FIRE) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Parlan_KNOWSJUDGE_Info()
{
	AI_Output(other,self,"DIA_Parlan_KNOWSJUDGE_15_00");	//� ���� ������ ��������� �����.
	AI_Output(self,other,"DIA_Parlan_KNOWSJUDGE_05_01");	//���?.. ��... (�������������) �� ��� ������������� ��������?
	AI_Output(other,self,"DIA_Parlan_KNOWSJUDGE_15_02");	//� ���������.
	AI_Output(self,other,"DIA_Parlan_KNOWSJUDGE_05_03");	//�� ��������� ���������. ������, ���� �� �����������, �������� � �������� ���������.
	B_LogEntry(TOPIC_FireContest,"���� � ���� ����������� ������ ��������� �����, � ������ ���������� � �������� ���������.");
};


instance DIA_Parlan_TEACH_MANA(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 10;
	condition = DIA_Parlan_TEACH_MANA_Condition;
	information = DIA_Parlan_TEACH_MANA_Info;
	permanent = TRUE;
	description = "� ���� �������� ��� ���������� �����������.";
};


func int DIA_Parlan_TEACH_MANA_Condition()
{
	if(((other.guild == GIL_KDF) || (other.guild == GIL_PAL) || ((other.guild == GIL_NOV) && Npc_KnowsInfo(hero,DIA_Parlan_LEARN))) && (Parlan_Sends == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Parlan_TEACH_MANA_Info()
{
	AI_Output(other,self,"DIA_Parlan_TEACH_MANA_15_00");	//� ���� �������� ��� ���������� �����������
	Info_ClearChoices(DIA_Parlan_TEACH_MANA);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,Dialog_Back,DIA_Parlan_TEACH_MANA_BACK);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Parlan_TEACH_MANA_1);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Parlan_TEACH_MANA_5);
};

func void DIA_Parlan_TEACH_MANA_BACK()
{
	if(other.attribute[ATR_MANA_MAX] >= T_MED)
	{
		AI_Output(self,other,"DIA_Parlan_TEACH_MANA_05_00");	//���� ���������� ������� �������. � �� ���� ������ ���� �������� �� ��� ������.
		AI_Output(self,other,"DIA_Parlan_TEACH_MANA_05_01");	//���� �� ������ ��������� ��������, �������� � ���������.
		Parlan_Sends = TRUE;
	};
	Info_ClearChoices(DIA_Parlan_TEACH_MANA);
};

func void DIA_Parlan_TEACH_MANA_1()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_MED);
	Info_ClearChoices(DIA_Parlan_TEACH_MANA);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,Dialog_Back,DIA_Parlan_TEACH_MANA_BACK);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Parlan_TEACH_MANA_1);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Parlan_TEACH_MANA_5);
};

func void DIA_Parlan_TEACH_MANA_5()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_MED);
	Info_ClearChoices(DIA_Parlan_TEACH_MANA);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,Dialog_Back,DIA_Parlan_TEACH_MANA_BACK);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Parlan_TEACH_MANA_1);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Parlan_TEACH_MANA_5);
};


instance DIA_Parlan_MAGE(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 2;
	condition = DIA_Parlan_MAGE_Condition;
	information = DIA_Parlan_MAGE_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Parlan_MAGE_Condition()
{
	if((other.guild == GIL_KDF) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Parlan_MAGE_Info()
{
	AI_Output(self,other,"DIA_Parlan_MAGE_05_00");	//�� ������ ������, ����. ����� ���������� � ���� ����.
	AI_Output(self,other,"DIA_Parlan_MAGE_05_01");	//� ����� ���� ������� ����� �����, ����� � ���� ����� ���������� �����.
	AI_Output(self,other,"DIA_Parlan_MAGE_05_02");	//������ ���� ������ ������ � �������� ������� ����, ������� ������ ��������� � ����� �����.
	B_GiveInvItems(self,other,ItMi_RuneBlank,1);
};


instance DIA_Parlan_CIRCLE1(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 99;
	condition = DIA_Parlan_CIRCLE1_Condition;
	information = DIA_Parlan_CIRCLE1_Info;
	permanent = TRUE;
	description = "����� ���� ������� ����� �����.";
};


func int DIA_Parlan_CIRCLE1_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Parlan_MAGE) && (other.guild == GIL_KDF) && (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 0))
	{
		return TRUE;
	};
};

func void DIA_Parlan_CIRCLE1_Info()
{
	AI_Output(other,self,"DIA_Parlan_TECH_CIRCLE1_15_00");	//����� ���� ������� ����� �����.
	if(B_TeachMagicCircle(self,other,1))
	{
		AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE1_05_01");	//������ ���� ����� �������� ���� ������������ ����, ��������� �����.
		AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE1_05_02");	//������ �� ������� ������ ������� ���������� ��� �������� ����������� ���.
		AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE1_05_03");	//������ �� ��� ���������������� �� ����� ������� �����. ��� ��� ������ �������, � ����� ������� ������ ������������������ ��.
	};
};


instance DIA_Parlan_CIRCLE2(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 99;
	condition = DIA_Parlan_CIRCLE2_Condition;
	information = DIA_Parlan_CIRCLE2_Info;
	permanent = TRUE;
	description = "����� ���� ������� ����� �����.";
};


func int DIA_Parlan_CIRCLE2_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Parlan_MAGE) && (other.guild == GIL_KDF) && (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 1))
	{
		return TRUE;
	};
};

func void DIA_Parlan_CIRCLE2_Info()
{
	AI_Output(other,self,"DIA_Parlan_TECH_CIRCLE2_15_00");	//����� ���� ������� ����� �����.
	if(Kapitel >= 2)
	{
		if(B_TeachMagicCircle(self,other,2))
		{
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE2_05_01");	//����� �� ������ ���� � ������� ������������ ����� ������� �����.
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE2_05_02");	//�� ����� �����, ��� �� ���� ����� ������� ���� ���������������. �� ������ ���� � ��������� - ����� �������.
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE2_05_03");	//�� ������� ���� ����������� - �� ���� ��������� ���� ����.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE2_05_04");	//����� ��� �� ������.
	};
};


instance DIA_Parlan_CIRCLE3(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 99;
	condition = DIA_Parlan_CIRCLE3_Condition;
	information = DIA_Parlan_CIRCLE3_Info;
	permanent = TRUE;
	description = "����� ���� �������� ����� �����.";
};


func int DIA_Parlan_CIRCLE3_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Parlan_MAGE) && (other.guild == GIL_KDF) && (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 2))
	{
		return TRUE;
	};
};

func void DIA_Parlan_CIRCLE3_Info()
{
	AI_Output(other,self,"DIA_Parlan_TECH_CIRCLE3_15_00");	//����� ���� �������� ����� �����.
	if(Kapitel >= 3)
	{
		if(B_TeachMagicCircle(self,other,3))
		{
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE3_05_01");	//��, ����� ������. ����� � ������ ���� �����. ���� ���� ����� ����������.
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE3_05_02");	//��� ���� ����������� - ��� ����� ��������� ����� � ����, � ���������� ��� ����� ������ � ������� ���� ������.
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE3_05_03");	//� ������ ���� ���� ������, �������� ������ ���. ����� ������ ���� � ������ �����.
			B_LogEntry(Topic_KlosterTeacher,"���� ������ ������ ���� ������ ���� ������. ���� ������ ������� ��� ������� ��������� �����.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE3_05_04");	//��� �������� �������� ����� ��� �� ������ �����.
	};
};


instance DIA_Parlan_TEACH(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 3;
	condition = DIA_Parlan_TEACH_Condition;
	information = DIA_Parlan_TEACH_Info;
	permanent = TRUE;
	description = "����� ���� (�������� ���).";
};


func int DIA_Parlan_TEACH_Condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_Parlan_TEACH_Info()
{
	var int abletolearn;
	abletolearn = 0;
	AI_Output(other,self,"DIA_Parlan_TEACH_15_00");	//����� ����!
	Info_ClearChoices(DIA_Parlan_TEACH);
	Info_AddChoice(DIA_Parlan_TEACH,Dialog_Back,DIA_Parlan_TEACH_BACK);
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1) && (PLAYER_TALENT_RUNES[SPL_LightHeal] == FALSE))
	{
		Info_AddChoice(DIA_Parlan_TEACH,B_BuildLearnString(NAME_SPL_LightHeal,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_LightHeal)),DIA_Parlan_TEACH_LIGHT_HEAL);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1) && (PLAYER_TALENT_RUNES[SPL_Light] == FALSE))
	{
		Info_AddChoice(DIA_Parlan_TEACH,B_BuildLearnString(NAME_SPL_LIGHT,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Light)),DIA_Parlan_TEACH_LIGHT);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2) && (PLAYER_TALENT_RUNES[SPL_WindFist] == FALSE))
	{
		Info_AddChoice(DIA_Parlan_TEACH,B_BuildLearnString(NAME_SPL_WINDFIST,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_WindFist)),DIA_Parlan_TEACH_WINDFIST);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2) && (PLAYER_TALENT_RUNES[SPL_Sleep] == FALSE))
	{
		Info_AddChoice(DIA_Parlan_TEACH,B_BuildLearnString(NAME_SPL_Sleep,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Sleep)),DIA_Parlan_TEACH_Sleep);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[SPL_MediumHeal] == FALSE))
	{
		Info_AddChoice(DIA_Parlan_TEACH,B_BuildLearnString(NAME_SPL_MediumHeal,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_MediumHeal)),DIA_Parlan_TEACH_MediumHeal);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[SPL_Fear] == FALSE))
	{
		Info_AddChoice(DIA_Parlan_TEACH,B_BuildLearnString(NAME_SPL_Fear,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Fear)),DIA_Parlan_TEACH_Fear);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4) && (PLAYER_TALENT_RUNES[SPL_DestroyUndead] == FALSE))
	{
		Info_AddChoice(DIA_Parlan_TEACH,B_BuildLearnString(NAME_SPL_DestroyUndead,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_DestroyUndead)),DIA_Parlan_TEACH_DestroyUndead);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5) && (PLAYER_TALENT_RUNES[SPL_FullHeal] == FALSE))
	{
		Info_AddChoice(DIA_Parlan_TEACH,B_BuildLearnString(NAME_SPL_FullHeal,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_FullHeal)),DIA_Parlan_TEACH_FullHeal);
		abletolearn = abletolearn + 1;
	};
	if(abletolearn < 1)
	{
		AI_Output(self,other,"DIA_Parlan_TEACH_05_01");	//���� � ������ �� ���� ������� ����.
	};
};

func void DIA_Parlan_TEACH_BACK()
{
	Info_ClearChoices(DIA_Parlan_TEACH);
};

func void DIA_Parlan_TEACH_LIGHT_HEAL()
{
	B_TeachPlayerTalentRunes(self,other,SPL_LightHeal);
};

func void DIA_Parlan_TEACH_LIGHT()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Light);
};

func void DIA_Parlan_TEACH_WINDFIST()
{
	B_TeachPlayerTalentRunes(self,other,SPL_WindFist);
};

func void DIA_Parlan_TEACH_Sleep()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Sleep);
};

func void DIA_Parlan_TEACH_MediumHeal()
{
	B_TeachPlayerTalentRunes(self,other,SPL_MediumHeal);
};

func void DIA_Parlan_TEACH_Fear()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Fear);
};

func void DIA_Parlan_TEACH_DestroyUndead()
{
	B_TeachPlayerTalentRunes(self,other,SPL_DestroyUndead);
};

func void DIA_Parlan_TEACH_FullHeal()
{
	B_TeachPlayerTalentRunes(self,other,SPL_FullHeal);
};


instance DIA_Parlan_Kap2_EXIT(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 999;
	condition = DIA_Parlan_Kap2_EXIT_Condition;
	information = DIA_Parlan_Kap2_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Parlan_Kap2_EXIT_Condition()
{
	if(Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Parlan_Kap2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

func void B_Parlan_Exit()
{
	AI_Output(self,other,"DIA_Parlan_EXIT_05_00");	//�� ������� ���� �����.
};


instance DIA_Parlan_Kap3_EXIT(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 999;
	condition = DIA_Parlan_Kap3_EXIT_Condition;
	information = DIA_Parlan_Kap3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Parlan_Kap3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Parlan_Kap3_EXIT_Info()
{
	if((other.guild == GIL_PAL) || (other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		B_Parlan_Exit();
	};
	AI_StopProcessInfos(self);
};


instance DIA_Parlan_IAmParlan(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 39;
	condition = DIA_Parlan_IAmParlan_Condition;
	information = DIA_Parlan_IAmParlan_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Parlan_IAmParlan_Condition()
{
	if((Kapitel >= 3) && Npc_IsInState(self,ZS_Talk) && ((other.guild != GIL_NOV) && (other.guild != GIL_KDF)))
	{
		return TRUE;
	};
};

func void DIA_Parlan_IAmParlan_Info()
{
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Parlan_IAmParlan_05_00");	//� ����, �� ����� ��������� �� ����� �������. � ���.
		AI_Output(self,other,"DIA_Parlan_IAmParlan_05_01");	//��� ����� ������ ������� ����. �� ������ ���������� � ��������, �� �������� �� ���, ���������.
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_IAmParlan_05_02");	//� �� ����, ������ ���� ������� � ���������. � ������, � � ������� �� ����� �����������.
		AI_Output(self,other,"DIA_Parlan_IAmParlan_05_03");	//� �� ����, ����� �� ������� �� �� ������ ������ ��������� ���������. �������, ��� ����?
		Parlan_DontTalkToNovice = LOG_Running;
		Info_ClearChoices(DIA_Parlan_IAmParlan);
		Info_AddChoice(DIA_Parlan_IAmParlan,"� ���� ������ ��, ��� ����� ������.",DIA_Parlan_IAmParlan_MyChoice);
		Info_AddChoice(DIA_Parlan_IAmParlan,"�������.",DIA_Parlan_IAmParlan_OK);
	};
	Wld_InsertItem(ItKe_KlosterBibliothek,"NW_MONASTERY_CORRIDOR_02");
};

func void DIA_Parlan_IAmParlan_MyChoice()
{
	AI_Output(other,self,"DIA_Parlan_IAmParlan_MyChoice_15_00");	//� ���� ������ ��, ��� ����� ������.
	AI_Output(self,other,"DIA_Parlan_IAmParlan_MyChoice_05_01");	//��������, ����, ��� ���� ������ �����, ���� �������, �� ������ ���� �����.
	AI_Output(self,other,"DIA_Parlan_IAmParlan_MyChoice_05_02");	//���� �� ������ ��������� ��������, �� �������� �� ���. ��� ��� ����� ������� �������� �� �����������.
	Info_ClearChoices(DIA_Parlan_IAmParlan);
};

func void DIA_Parlan_IAmParlan_OK()
{
	AI_Output(other,self,"DIA_Parlan_IAmParlan_OK_15_00");	//�������.
	AI_Output(self,other,"DIA_Parlan_IAmParlan_OK_05_01");	//����� ������� �� ���.
	Info_ClearChoices(DIA_Parlan_IAmParlan);
};


instance DIA_Parlan_Bibliothek(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 40;
	condition = DIA_Parlan_Bibliothek_Condition;
	information = DIA_Parlan_Bibliothek_Info;
	permanent = FALSE;
	description = "� ���� ���� ���-������ ��� ����?";
};


func int DIA_Parlan_Bibliothek_Condition()
{
	if((other.guild != GIL_KDF) && (Kapitel >= 3) && (other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_Parlan_Bibliothek_Info()
{
	AI_Output(other,self,"DIA_Parlan_Bibliothek_15_00");	//� ���� ���� ���-������ ��� ����?
	AI_Output(self,other,"DIA_Parlan_Bibliothek_05_01");	//��. ��� �������� ����������, ���� �������� ���� �� ���. ��� �� ������� ������� ������ � �������.
	AI_Output(self,other,"DIA_Parlan_Bibliothek_05_02");	//���� ������, �� ������ ���������� � ����.
	if(other.guild != GIL_PAL)
	{
		AI_Output(self,other,"DIA_Parlan_DontDisturb_05_03");	//�� ������ � ����� �����������!
	};
	B_GiveInvItems(self,other,ItKe_KlosterBibliothek,1);
};


instance DIA_Parlan_DontDisturb(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 39;
	condition = DIA_Parlan_DontDisturb_Condition;
	information = DIA_Parlan_DontDisturb_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Parlan_DontDisturb_Condition()
{
	if((Parlan_DontTalkToNovice == LOG_SUCCESS) && (B_GetGreatestPetzCrime(self) == CRIME_NONE) && ((other.guild != GIL_PAL) || (other.guild != GIL_NOV) || (other.guild != GIL_KDF)))
	{
		return TRUE;
	};
};

func void DIA_Parlan_DontDisturb_Info()
{
	AI_Output(self,other,"DIA_Parlan_DontDisturb_05_00");	//(���������) � �� ����� ���������. ������ ����������� � �����.
	AI_Output(self,other,"DIA_Parlan_DontDisturb_05_01");	//��� ������ ������� ���� ��� ���������� ������ � �������� ���� � ����� � ���������.
	AI_Output(self,other,"DIA_Parlan_DontDisturb_05_02");	//(�����) � �� �������� ������������� � �� ������!
	Parlan_DontTalkToNovice = LOG_Running;
};


instance DIA_Parlan_Kap3U4U5_PERM(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 39;
	condition = DIA_Parlan_Kap3U4U5_PERM_Condition;
	information = DIA_Parlan_Kap3U4U5_PERM_Info;
	permanent = TRUE;
	description = "��� ��� �����...";
};


func int DIA_Parlan_Kap3U4U5_PERM_Condition()
{
	if((Kapitel >= 3) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Parlan_Kap3U4U5_PERM_Info()
{
	AI_Output(other,self,"DIA_Parlan_Kap3_PERM_15_00");	//��� ��� �����...
	Info_ClearChoices(DIA_Parlan_Kap3U4U5_PERM);
	Info_AddChoice(DIA_Parlan_Kap3U4U5_PERM,Dialog_Back,DIA_Parlan_Kap3U4U5_PERM_Back);
	Info_AddChoice(DIA_Parlan_Kap3U4U5_PERM,"...�������?",DIA_Parlan_Kap3U4U5_PERM_Church);
	Info_AddChoice(DIA_Parlan_Kap3U4U5_PERM,"...����������?",DIA_Parlan_Kap3U4U5_PERM_Library);
	Info_AddChoice(DIA_Parlan_Kap3U4U5_PERM,"...�������?",DIA_Parlan_Kap3U4U5_PERM_Chapel);
	Info_AddChoice(DIA_Parlan_Kap3U4U5_PERM,"...������?",DIA_Parlan_Kap3U4U5_PERM_Cellar);
};

func void DIA_Parlan_Kap3U4U5_PERM_Back()
{
	Info_ClearChoices(DIA_Parlan_Kap3U4U5_PERM);
};

func void DIA_Parlan_Kap3U4U5_PERM_Church()
{
	AI_Output(other,self,"DIA_Parlan_Kap3U4U5_PERM_Church_15_00");	//...�������?
	AI_Output(self,other,"DIA_Parlan_Add_05_00");	//�, �������! ������� ����� ������� ����?!
	AI_Output(self,other,"DIA_Parlan_Add_05_01");	//(�������) ��� �������? ��, ����, � ���� �� ��� ����������?!
};

func void DIA_Parlan_Kap3U4U5_PERM_Library()
{
	AI_Output(other,self,"DIA_Parlan_Kap3U4U5_PERM_Library_15_00");	//...����������?
	AI_Output(self,other,"DIA_Parlan_Add_05_02");	//���������� ��������� � ����� ��������� �����, ����� �������� ������.
};

func void DIA_Parlan_Kap3U4U5_PERM_Chapel()
{
	AI_Output(other,self,"DIA_Parlan_Kap3U4U5_PERM_Chapel_15_00");	//...�������?
	AI_Output(self,other,"DIA_Parlan_Add_05_03");	//������� ��������� � ������� ���������� ����� ���������. ��� �������� ������� ������.
};

func void DIA_Parlan_Kap3U4U5_PERM_Cellar()
{
	AI_Output(other,self,"DIA_Parlan_Kap3U4U5_PERM_Cellar_15_00");	//...������?
	AI_Output(self,other,"DIA_Parlan_Add_05_04");	//���� � ������ ��������� ���������� ��������� ������.
};


instance DIA_Parlan_Kap4_EXIT(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 999;
	condition = DIA_Parlan_Kap4_EXIT_Condition;
	information = DIA_Parlan_Kap4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Parlan_Kap4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Parlan_Kap4_EXIT_Info()
{
	if((other.guild == GIL_PAL) || (other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		B_Parlan_Exit();
	};
	AI_StopProcessInfos(self);
};


instance DIA_Parlan_Kap5_EXIT(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 999;
	condition = DIA_Parlan_Kap5_EXIT_Condition;
	information = DIA_Parlan_Kap5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Parlan_Kap5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Parlan_Kap5_EXIT_Info()
{
	if((other.guild == GIL_PAL) || (other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		B_Parlan_Exit();
	};
	AI_StopProcessInfos(self);
};

