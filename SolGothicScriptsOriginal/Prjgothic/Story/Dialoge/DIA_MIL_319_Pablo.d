
instance DIA_Pablo_EXIT(C_Info)
{
	npc = MIL_319_Pablo;
	nr = 999;
	condition = DIA_Pablo_EXIT_Condition;
	information = DIA_Pablo_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Pablo_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Pablo_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Pablo_PICKPOCKET(C_Info)
{
	npc = MIL_319_Pablo;
	nr = 900;
	condition = DIA_Pablo_PICKPOCKET_Condition;
	information = DIA_Pablo_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(������� ���� ���� ����� �������)";
};


func int DIA_Pablo_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,ItKe_City_Tower_01) >= 1) && (other.attribute[ATR_DEXTERITY] >= (20 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Pablo_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Pablo_PICKPOCKET);
	Info_AddChoice(DIA_Pablo_PICKPOCKET,Dialog_Back,DIA_Pablo_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Pablo_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Pablo_PICKPOCKET_DoIt);
};

func void DIA_Pablo_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 20)
	{
		B_GiveInvItems(self,other,ItKe_City_Tower_01,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Pablo_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Pablo_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Pablo_PICKPOCKET);
};


var int Pablo_belogen;

instance DIA_Pablo_WANTED(C_Info)
{
	npc = MIL_319_Pablo;
	nr = 1;
	condition = DIA_Pablo_WANTED_Condition;
	information = DIA_Pablo_WANTED_Info;
	important = TRUE;
};


func int DIA_Pablo_WANTED_Condition()
{
	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Pablo_WANTED_Info()
{
	AI_Output(self,other,"DIA_Pablo_WANTED_12_00");	//��, ��, ������� - ��� �������, � ���� ����.
	AI_Output(other,self,"DIA_Pablo_WANTED_15_01");	//��� ���� �����?
	AI_Output(self,other,"DIA_Pablo_WANTED_12_02");	//� ���-�� ��� ����� ���� ���� ... �� - �����!
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Pablo_WANTED_12_03");	//��� - �� ����� ���� ������ � ������ �� ��������, �� ������� ���������� ��������� ���� ����� - ������� ����� ����� �� ����.
	B_GiveInvItems(self,other,ItWr_Poster_MIS,1);
	AI_Output(self,other,"DIA_Pablo_WANTED_12_04");	//��-��������, ��� ����� ������ ����.
	Info_ClearChoices(DIA_Pablo_WANTED);
	Info_AddChoice(DIA_Pablo_WANTED,"���, �����, ��� �� ����������.",DIA_Pablo_WANTED_NOTHING);
	Info_AddChoice(DIA_Pablo_WANTED,"��, � ��� �� �� ���� ������� �� ���������.",DIA_Pablo_WANTED_IRONY);
};

func void DIA_Pablo_WANTED_NOTHING()
{
	AI_Output(other,self,"DIA_Pablo_WANTED_NOTHING_15_00");	//���, �����, ��� �� ����������. �� ���� ��� � ������� ...
	AI_Output(self,other,"DIA_Pablo_WANTED_NOTHING_12_01");	//��� �������, ���������.
	AI_Output(self,other,"DIA_Pablo_Add_12_00");	//�� ���� ��� ��� �� ���� ���������� - � ���� � ���� ��������� �������� - ���������� ������ �� �� �������. ����� � ��� ���� ���������� �������.
	AI_Output(self,other,"DIA_Pablo_WANTED_NOTHING_12_03");	//� ������, ������� �������� � ����� ��������, ����� ����� �� ������������� - �������, � ���� ���������.
	Pablo_belogen = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Pablo_WANTED_IRONY()
{
	AI_Output(other,self,"DIA_Pablo_WANTED_IRONY_15_00");	//��, � ��� �� �� ���� ������� �� ���������.
	AI_Output(self,other,"DIA_Pablo_WANTED_IRONY_12_01");	//����� ������ ... ��� ���� ������ ���� ����� �� ����?
	AI_Output(other,self,"DIA_Pablo_Add_15_01");	//������ �� ���. ��� ���� ����� � ��� �� ��������, ����� ���?
	AI_Output(self,other,"DIA_Pablo_WANTED_IRONY_12_03");	//��� - ��� ������.
	AI_Output(other,self,"DIA_Pablo_WANTED_IRONY_15_04");	//��, ����� �� ������� ����� �� ������.
	AI_Output(self,other,"DIA_Pablo_Add_12_02");	//���� � ���� �����-�� �������� - ��� � �������� � ������ �����. ��������, �� ������ ������. �� ������� ��� � ��������.
	AI_StopProcessInfos(self);
};


instance DIA_Pablo_Banditen(C_Info)
{
	npc = MIL_319_Pablo;
	nr = 3;
	condition = DIA_Pablo_Banditen_Condition;
	information = DIA_Pablo_Banditen_Info;
	permanent = FALSE;
	description = "��� �� ������ �� ���� ��������?";
};


func int DIA_Pablo_Banditen_Condition()
{
	return TRUE;
};

func void DIA_Pablo_Banditen_Info()
{
	AI_Output(other,self,"DIA_Pablo_Add_15_03");	//��� �� ������ �� ���� ��������?
	AI_Output(self,other,"DIA_Pablo_Add_12_04");	//��� ��� ������ �� ���� �������� �������. �� ����� ����������� �� ��������� �����.
	AI_Output(self,other,"DIA_Pablo_Add_12_05");	//����� �� ��� �������� ���� ������ � �����, � ������ �������������� � �����, ���������.
	AI_Output(self,other,"DIA_Pablo_Add_12_06");	//�� ������ ����� ������� ���������� ������� ����� ������.
	AI_Output(self,other,"DIA_Pablo_Add_12_07");	//��� ������ �� ���� �� ��������� ���� ���� �� ���������� �� ��������� ������.
};


instance DIA_Pablo_HakonBandits(C_Info)
{
	npc = MIL_319_Pablo;
	nr = 3;
	condition = DIA_Pablo_HakonBandits_Condition;
	information = DIA_Pablo_HakonBandits_Info;
	permanent = FALSE;
	description = "��� �� ������ � ��������, ���������� �������� ������?";
};


func int DIA_Pablo_HakonBandits_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Hakon_Miliz) && Npc_KnowsInfo(other,DIA_Pablo_Banditen))
	{
		return TRUE;
	};
};

func void DIA_Pablo_HakonBandits_Info()
{
	AI_Output(other,self,"DIA_Pablo_Add_15_20");	//��� �� ������ � ��������, ���������� �������� ������?
	AI_Output(self,other,"DIA_Pablo_Add_12_21");	//��, ��� ����... �� ��������� ��� ...
	AI_Output(self,other,"DIA_Pablo_Add_12_22");	//��������� � ����, ������ ��� ������������ �� ����������� ��������� �� ���������.
	AI_Output(self,other,"DIA_Pablo_Banditen_12_01");	//��� ����� ������� � ���� ���� � ������ �� ������������ ������.
	AI_Output(self,other,"DIA_Pablo_Banditen_12_02");	//���-��, ��� ���� ������� ��������� �� � ��������� �� ����. �� ��� �������� �������� ������ � ���� � ������.
	AI_Output(self,other,"DIA_Pablo_Banditen_12_03");	//��� ������ ������� ����� ������ ������ � ��� ������� ������.
	B_LogEntry(TOPIC_HakonBanditen,"�������, ���������� ������, ���������� ���-�� � ���� ���������� �� ������.");
	if(Pablo_AndreMelden == FALSE)
	{
		AI_Output(self,other,"DIA_Pablo_Add_12_23");	//�� ���� ��� ���-��� ...
		AI_Output(self,other,"DIA_Pablo_Banditen_12_04");	//����� ���������� ������� ������� � ��������.
		AI_Output(other,self,"DIA_Pablo_Banditen_15_05");	//��� ��������, ��� ��� ����� ����������� ������������ ���������� ������ � ����� � ��������� �� ...
		AI_Output(self,other,"DIA_Pablo_Banditen_12_06");	//��, �� �����������, ��� � ��� ���� ���� ������� � ������. �� ��� ���� �� ������� ������� ���.
		AI_Output(self,other,"DIA_Pablo_Banditen_12_07");	//���� ���� ������� �������� ���-������ �� ���� ����, �����, ��� ���� ����� �������� ������� �� ������ ����� �������� ����������.
		B_LogEntry(TOPIC_HakonBanditen,"��� �������, ��������, ������� � ������� � ���-�� �� ��������� �������. ���� ����� �������� ������� �� ������ ����� ������.");
	};
};


instance DIA_Pablo_MyBandits(C_Info)
{
	npc = MIL_319_Pablo;
	nr = 4;
	condition = DIA_Pablo_MyBandits_Condition;
	information = DIA_Pablo_MyBandits_Info;
	permanent = FALSE;
	description = "� ������ ������ �������, � ������� ����� ������ � ���� ������������?";
};


func int DIA_Pablo_MyBandits_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Pablo_Banditen) && Npc_KnowsInfo(other,DIA_Pablo_WANTED))
	{
		return TRUE;
	};
};

func void DIA_Pablo_MyBandits_Info()
{
	AI_Output(other,self,"DIA_Pablo_Add_15_08");	//� ������ ������ �������, � ������� ����� ������ � ���� ������������?
	if(Pablo_belogen == TRUE)
	{
		AI_Output(self,other,"DIA_Pablo_Add_12_09");	//�-��! ��� ��� ��� �� ���� ���������� ���. � ������ �� ����� ��� �� �������, �?
		AI_Output(self,other,"DIA_Pablo_Add_12_10");	//(�������������) �� ��� ���� �����������?
		AI_Output(other,self,"DIA_Pablo_Add_15_11");	//� �� ���� - ������!
		AI_Output(self,other,"DIA_Pablo_Add_12_12");	//��, ��. �������. � ����, ����� �� ���-��� �����. ���� �� � �����, ��� �� ��� ���������� ���� ��������, �� �� ��� ������� �� ��������.
		AI_Output(self,other,"DIA_Pablo_Add_12_13");	//�� �� ��, ��� ����� �������� �� ���� ��������� ����� ����� ...
		Pablo_AndreMelden = TRUE;
		AI_Output(self,other,"DIA_Pablo_Add_12_14");	//�� - ������� �� ���� ������ ...
	};
	AI_Output(self,other,"DIA_Pablo_Add_12_15");	//�� ����� �� ���������� �� �������� ���������.
	AI_Output(self,other,"DIA_Pablo_Add_12_16");	//�� ��� ���� �� ������ �� ����� �����.
	AI_Output(self,other,"DIA_Pablo_Add_12_17");	//� �����, ��� ���� ������ �����, ������� ������ � ����� ����� ����� �����.
	AI_Output(self,other,"DIA_Pablo_Add_12_18");	//�� ���� �� �������� ����������� ����, ������� ��� ���� ������������. ��� ���������� ����� ������� ������� �� ���� ������!
	AI_Output(other,self,"DIA_Pablo_Add_15_19");	//� ������� ���.
};


instance DIA_Pablo_Perm(C_Info)
{
	npc = MIL_319_Pablo;
	nr = 1;
	condition = DIA_Pablo_Perm_Condition;
	information = DIA_Pablo_Perm_Info;
	permanent = TRUE;
	description = "��� ��������?";
};


func int DIA_Pablo_Perm_Condition()
{
	return TRUE;
};

func void DIA_Pablo_Perm_Info()
{
	AI_Output(other,self,"DIA_Pablo_Perm_15_00");	//��� ����������?
	if(Kapitel == 3)
	{
		if(MIS_RescueBennet != LOG_SUCCESS)
		{
			if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
			{
				AI_Output(self,other,"DIA_Pablo_Perm_12_01");	//� ������ �������, ��� ���� ��������� ������ ��������.
				AI_Output(self,other,"DIA_Pablo_Perm_12_02");	//������ ����� ��������� ����� ������ ����. ������ �� ��� ���������� ��� ��� � ��������.
			}
			else if(hero.guild == GIL_KDF)
			{
				AI_Output(self,other,"DIA_Pablo_Perm_12_03");	//� ������� �������� ��������� ��������������� �������� ������.
				AI_Output(self,other,"DIA_Pablo_Perm_12_04");	//�� � ����, ��� ������� �������� ������������ ��������� ��� ����� ������.
			}
			else
			{
				AI_Output(self,other,"DIA_Pablo_Perm_12_05");	//��� �� ��� ����������? ���� �� ����������� ���������� ������ ������ ��������, ����� ���� ������ �� ����.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Pablo_Perm_12_06");	//��� �������� ����. ������ ��� �������� �������� ��� ���� � ������.
			AI_Output(self,other,"DIA_Pablo_Perm_12_07");	//���� �� ���� �� ������� ����� ���������� ������, ����� ���� �� �������� �� ������ ������.
		};
	}
	else if(Kapitel == 5)
	{
		AI_Output(self,other,"DIA_Pablo_Perm_12_08");	//� �� ����, ��� ����� � ����, ���� �������� ����� ������.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Pablo_Perm_12_09");	//�� ������ ������������ �� ���, �� ������� ��� ���������, ����� ���� ����� �� ����������� � ������ ��� ��������.
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Pablo_Perm_12_10");	//���������� ����� ���� ��� ��������. �� ���� �� �������� � ����� ��� ��.
	}
	else
	{
		AI_Output(self,other,"DIA_Pablo_Perm_12_11");	//���� ��� ��������. ������ ������� � ������ ���������� ��� ��������� ��������.
	};
};

