
instance DIA_Mil_305_Torwache_EXIT(C_Info)
{
	npc = Mil_305_Torwache;
	nr = 999;
	condition = DIA_Mil_305_Torwache_EXIT_Condition;
	information = DIA_Mil_305_Torwache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Mil_305_Torwache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Mil_305_Torwache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


const string Mil_305_Checkpoint = "NW_CITY_UPTOWN_PATH_02";

instance DIA_Mil_305_Torwache_FirstWarn(C_Info)
{
	npc = Mil_305_Torwache;
	nr = 1;
	condition = DIA_Mil_305_Torwache_FirstWarn_Condition;
	information = DIA_Mil_305_Torwache_FirstWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Mil_305_Torwache_FirstWarn_Condition()
{
	if(Npc_GetDistToWP(other,Mil_305_Checkpoint) <= 700)
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	if((B_GetGreatestPetzCrime(self) >= CRIME_ATTACK) && (Mil_305_schonmalreingelassen == TRUE))
	{
		self.aivar[AIV_PASSGATE] = FALSE;
	}
	else if(Mil_305_schonmalreingelassen == TRUE)
	{
		self.aivar[AIV_PASSGATE] = TRUE;
	};
	if((self.aivar[AIV_Guardpassage_Status] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Mil_305_Torwache_FirstWarn_Info()
{
	AI_Output(self,other,"DIA_Mil_305_Torwache_FirstWarn_03_00");	//����!
	if(B_GetGreatestPetzCrime(self) >= CRIME_ATTACK)
	{
		if(B_GetGreatestPetzCrime(self) == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Mil_305_Torwache_FirstWarn_03_01");	//���� ����������� � �������� � ������! ���� ��������� �� �����, � �� ���� ���������� ���� � ������� �������.
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_THEFT)
		{
			AI_Output(self,other,"DIA_Mil_305_Torwache_FirstWarn_03_02");	//���� �� ����������� � ���������, �� �� ������ ����� � ������� ������� ������!
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
		{
			AI_Output(self,other,"DIA_Mil_305_Torwache_FirstWarn_03_03");	//� �� ���� ���������� � ������� ������� ������ ���������� ����������� ����� ����.
		};
		AI_Output(self,other,"DIA_Mil_305_Torwache_FirstWarn_03_04");	//��� � ����� ����� � ���������� ��� ��������!
	}
	else
	{
		AI_Output(self,other,"DIA_Mil_305_Torwache_FirstWarn_03_05");	//������ �������� ������ � �������� ����������� ����� ����� �������  ������� ������� ������!
	};
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,Mil_305_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};


instance DIA_Mil_305_Torwache_SecondWarn(C_Info)
{
	npc = Mil_305_Torwache;
	nr = 2;
	condition = DIA_Mil_305_Torwache_SecondWarn_Condition;
	information = DIA_Mil_305_Torwache_SecondWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Mil_305_Torwache_SecondWarn_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,Mil_305_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Mil_305_Torwache_SecondWarn_Info()
{
	AI_Output(self,other,"DIA_Mil_305_Torwache_SecondWarn_03_00");	//� ��������� ��� ������������ ����. ��� ���� ��� - � �� ������������� � ���� �����.
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,Mil_305_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
	AI_StopProcessInfos(self);
};


instance DIA_Mil_305_Torwache_Attack(C_Info)
{
	npc = Mil_305_Torwache;
	nr = 3;
	condition = DIA_Mil_305_Torwache_Attack_Condition;
	information = DIA_Mil_305_Torwache_Attack_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Mil_305_Torwache_Attack_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,Mil_305_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Mil_305_Torwache_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	AI_Output(self,other,"DIA_Mil_305_Torwache_Attack_03_00");	//�� ��� ����������...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};


instance DIA_Mil_305_Torwache_MESSAGE(C_Info)
{
	npc = Mil_305_Torwache;
	nr = 1;
	condition = DIA_Mil_305_Torwache_MESSAGE_Condition;
	information = DIA_Mil_305_Torwache_MESSAGE_Info;
	permanent = FALSE;
	description = "� ���� ������ ��������� ��� ����� ������.";
};


func int DIA_Mil_305_Torwache_MESSAGE_Condition()
{
	if((Player_KnowsLordHagen == TRUE) && (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Mil_305_Torwache_MESSAGE_Info()
{
	AI_Output(other,self,"DIA_Mil_305_Torwache_MESSAGE_15_00");	//� ���� ������ ��������� ��� ����� ������.
	AI_Output(self,other,"DIA_Mil_305_Torwache_MESSAGE_03_01");	//�������� ������ ����� ���������� � ������ ������� �� ������� �������.
	AI_Output(self,other,"DIA_Mil_305_Torwache_MESSAGE_03_02");	//���� � ���� ���������� ������� ���������, �� ������ � ����� ��� ���������� ������� ���������� �������.
};


instance DIA_Mil_305_Torwache_Ausnahme(C_Info)
{
	npc = Mil_305_Torwache;
	nr = 2;
	condition = DIA_Mil_305_Torwache_Ausnahme_Condition;
	information = DIA_Mil_305_Torwache_Ausnahme_Info;
	permanent = TRUE;
	description = "� ����� ������� ��� ���� ����������?";
};


func int DIA_Mil_305_Torwache_Ausnahme_Condition()
{
	if(Mil_305_schonmalreingelassen == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Mil_305_Torwache_Ausnahme_Info()
{
	AI_Output(other,self,"DIA_Mil_305_Torwache_Ausnahme_15_00");	//� ����� ������� ��� ���� ����������?
	AI_Output(self,other,"DIA_Mil_305_Torwache_Ausnahme_03_01");	//���?! ������� ���� �������! ������� ��������� �� ���� ��� ����������!
	AI_Output(self,other,"DIA_Mil_305_Torwache_Ausnahme_03_02");	//���� � ������� ���� �������� ��� �������, ��� ����� �������� �� ��������� � ���, ��� ��������� ��.
};


instance DIA_Mil_305_Torwache_PassAsCitizen(C_Info)
{
	npc = Mil_305_Torwache;
	nr = 2;
	condition = DIA_Mil_305_Torwache_PassAsCitizen_Condition;
	information = DIA_Mil_305_Torwache_PassAsCitizen_Info;
	permanent = TRUE;
	description = "� ��������� ��������� ��������! ������� ��� ������!";
};


func int DIA_Mil_305_Torwache_PassAsCitizen_Condition()
{
	if((Mil_305_schonmalreingelassen == FALSE) && (Kapitel <= 1))
	{
		return TRUE;
	};
};

func void DIA_Mil_305_Torwache_PassAsCitizen_Info()
{
	AI_Output(other,self,"DIA_Mil_305_Torwache_PassAsCitizen_15_00");	//� ��������� ��������� ��������! ������� ��� ������!
	if(Player_IsApprentice > APP_NONE)
	{
		AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsCitizen_03_01");	//� �� ����, ��� ��������� �������� �������� ������� ���� � ������� - � �� ���� �����.
		AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsCitizen_03_02");	//�� ������ �����! �� ���� ���� ��� ��������! ���� �� ������ ��������� �� ��������� ������������!
		self.aivar[AIV_PASSGATE] = TRUE;
		Mil_305_schonmalreingelassen = TRUE;
		B_CheckLog();
		AI_StopProcessInfos(self);
	}
	else if((MIS_Matteo_Gold == LOG_SUCCESS) || (MIS_Thorben_GetBlessings == LOG_SUCCESS) || (MIS_Bosper_Bogen == LOG_SUCCESS) || (MIS_Bosper_WolfFurs == LOG_SUCCESS) || (MIS_Harad_Orc == LOG_SUCCESS) || (MIS_HakonBandits == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsCitizen_03_03");	//��������, ���� ������� ������������ � ���������� ��������� � ������ ����� ������, �� ���� �� �� ��� �����������, � �� ���� �� ����!
		AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsCitizen_03_04");	//�� ������� �������� ����! � ������������ ����!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsCitizen_03_05");	//�� �� ������ ����� ��� ����� �������! ����� � ���� ����!
		AI_StopProcessInfos(self);
	};
};


instance DIA_Mil_305_Torwache_PassAsMil(C_Info)
{
	npc = Mil_305_Torwache;
	nr = 3;
	condition = DIA_Mil_305_Torwache_PassAsMil_Condition;
	information = DIA_Mil_305_Torwache_PassAsMil_Info;
	permanent = TRUE;
	description = "� ������ � ��������� - ��� ��� ������!";
};


func int DIA_Mil_305_Torwache_PassAsMil_Condition()
{
	if((other.guild == GIL_MIL) && (Mil_305_schonmalreingelassen == FALSE) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void DIA_Mil_305_Torwache_PassAsMil_Info()
{
	AI_Output(other,self,"DIA_Mil_305_Torwache_PassAsMil_15_00");	//� ������ � ��������� - ��� ��� ������!
	AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsMil_03_01");	//��� ����� ������ ����? ��������, �� �� ����� �� ������ ������, ��� ��������!
	AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsMil_03_02");	//������ �� ���� �� ���������� ������! ��� ��� ���������� ���� �������� � ����������� � ����������!
	self.aivar[AIV_PASSGATE] = TRUE;
	Mil_305_schonmalreingelassen = TRUE;
	B_CheckLog();
	AI_StopProcessInfos(self);
};


instance DIA_Mil_305_Torwache_PassAsMage(C_Info)
{
	npc = Mil_305_Torwache;
	nr = 3;
	condition = DIA_Mil_305_Torwache_PassAsMage_Condition;
	information = DIA_Mil_305_Torwache_PassAsMage_Info;
	permanent = TRUE;
	description = "�� ������ ������ �� ���� ������������� ������?";
};


func int DIA_Mil_305_Torwache_PassAsMage_Condition()
{
	if((other.guild == GIL_KDF) && (Mil_305_schonmalreingelassen == FALSE) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void DIA_Mil_305_Torwache_PassAsMage_Info()
{
	AI_Output(other,self,"DIA_Mil_305_Torwache_PassAsMage_15_00");	//�� ������ ������ �� ���� ������������� ������?
	AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsMage_03_01");	//����... ���! �������, ���! ��� ��������� ������ ���� ������!
	AI_Output(other,self,"DIA_Mil_305_Torwache_PassAsMage_15_02");	//������, ����� ����� ������� ���� ��� ���������!
	AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsMage_03_03");	//��, �, ���������!
	self.aivar[AIV_PASSGATE] = TRUE;
	Mil_305_schonmalreingelassen = TRUE;
	B_CheckLog();
	AI_StopProcessInfos(self);
};


instance DIA_Mil_305_Torwache_PassAsSld(C_Info)
{
	npc = Mil_305_Torwache;
	nr = 3;
	condition = DIA_Mil_305_Torwache_PassAsSld_Condition;
	information = DIA_Mil_305_Torwache_PassAsSld_Info;
	permanent = TRUE;
	description = "� ���� ������ ��������� ��� ����� ������!";
};


func int DIA_Mil_305_Torwache_PassAsSld_Condition()
{
	if((other.guild == GIL_SLD) && (Mil_305_schonmalreingelassen == FALSE) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void DIA_Mil_305_Torwache_PassAsSld_Info()
{
	AI_Output(other,self,"DIA_Mil_305_Torwache_PassAsSld_15_00");	//� ���� ������ ��������� ��� ����� ������!
	AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsSld_03_01");	//�� ���� �� ���� �������� ���������! ��� ���� ����� �� ����� ������?
	AI_Output(other,self,"DIA_Mil_305_Torwache_PassAsSld_15_02");	//� ������ � ������������ ����.
	AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsSld_03_03");	//��! ������, �������, �� ���, ��������, ����� ����� ������. ����� ������� � ����� ������, �� ���������� ���� ����� � ��������, ��� � ��� ������� ����, ��� ���� �� ���������!
	self.aivar[AIV_PASSGATE] = TRUE;
	Mil_305_schonmalreingelassen = TRUE;
	B_CheckLog();
	AI_StopProcessInfos(self);
};


instance DIA_Mil_305_Torwache_PERM(C_Info)
{
	npc = Mil_305_Torwache;
	nr = 1;
	condition = DIA_Mil_305_Torwache_PERM_Condition;
	information = DIA_Mil_305_Torwache_PERM_Info;
	permanent = TRUE;
	description = "��� ����?";
};


func int DIA_Mil_305_Torwache_PERM_Condition()
{
	if((Mil_305_schonmalreingelassen == TRUE) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void DIA_Mil_305_Torwache_PERM_Info()
{
	AI_Output(other,self,"DIA_Mil_305_Torwache_PERM_15_00");	//��� ����?
	if((other.guild == GIL_PAL) || (other.guild == GIL_MIL))
	{
		AI_Output(self,other,"DIA_Mil_305_Torwache_PERM_03_01");	//��� ������, ����!
	}
	else if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Mil_305_Torwache_PERM_03_02");	//�� ������ ��������� ���� ������. �������, ��� ������� �� ���� ���� ��������, �, ���������!
	}
	else if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Mil_305_Torwache_PERM_03_03");	//��������, ��� �������� ���������� ����, �� � �� ���� ������������� � �����!
	}
	else
	{
		AI_Output(self,other,"DIA_Mil_305_Torwache_PERM_03_04");	//��� ���� �����?
	};
	AI_StopProcessInfos(self);
};

