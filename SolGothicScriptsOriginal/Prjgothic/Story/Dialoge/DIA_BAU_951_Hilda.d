
instance DIA_Hilda_EXIT(C_Info)
{
	npc = BAU_951_Hilda;
	nr = 999;
	condition = DIA_Hilda_EXIT_Condition;
	information = DIA_Hilda_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hilda_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Hilda_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hilda_Hallo(C_Info)
{
	npc = BAU_951_Hilda;
	nr = 2;
	condition = DIA_Hilda_Hallo_Condition;
	information = DIA_Hilda_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Hilda_Hallo_Condition()
{
	if((MIS_Lobart_Rueben != LOG_SUCCESS) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Hilda_Hallo_Info()
{
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Hilda_Hallo_17_00");	//��, ���� ���� �����? ���������� �������� �� ����� ����. ����� �� ������ ���������.
	}
	else
	{
		AI_Output(self,other,"DIA_Hilda_Hallo_17_01");	//��, ��� ���?
	};
	AI_StopProcessInfos(self);
};


instance DIA_Hilda_WasZuEssen(C_Info)
{
	npc = BAU_951_Hilda;
	nr = 2;
	condition = DIA_Hilda_WasZuEssen_Condition;
	information = DIA_Hilda_WasZuEssen_Info;
	permanent = TRUE;
	description = "�� ���� ��� ���-������ ������?";
};


func int DIA_Hilda_WasZuEssen_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Hilda_Hallo) || (MIS_Lobart_Rueben == LOG_SUCCESS)) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Hilda_WasZuEssen_Info()
{
	var int Rueben_TagNull;
	if(hero.guild == GIL_NONE)
	{
		AI_Output(other,self,"DIA_Hilda_WasZuEssen_15_00");	//�� ���� ��� ���-������ ������?
		if(MIS_Lobart_Rueben == LOG_SUCCESS)
		{
			if(!Npc_KnowsInfo(other,DIA_Hilda_PfanneTooLate))
			{
				if(Hilda_Stew_Day != Wld_GetDay())
				{
					B_GiveInvItems(self,other,ItFo_Stew,1);
					AI_Output(self,other,"DIA_Hilda_WasZuEssen_17_01");	//���, ������. �� ������� ������.
					Hilda_Stew_Day = Wld_GetDay();
				}
				else if((Wld_GetDay() == 0) && (Rueben_TagNull == FALSE))
				{
					AI_Output(self,other,"DIA_Hilda_WasZuEssen_17_02");	//�� �������� ������ ����� ������.
					B_GiveInvItems(self,other,ItFo_Stew,1);
					Hilda_Stew_Day = Wld_GetDay();
					Rueben_TagNull = TRUE;
					Log_CreateTopic(Topic_Bonus,LOG_NOTE);
					B_LogEntry(Topic_Bonus,"� ���� �������� ������� ������� ���� � ������ ������ ����.");
				}
				else
				{
					AI_Output(self,other,"DIA_Hilda_WasZuEssen_17_03");	//�� ������� ��� ������� ���� ������! ������ �������.
				};
			}
			else
			{
				AI_Output(self,other,"DIA_Hilda_WasZuEssen_17_04");	//�� �� ���������� ������� ����� ������ �������. ��������!
				AI_StopProcessInfos(self);
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Hilda_WasZuEssen_17_05");	//� ������ ������ ���, ��� �������� �����!
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Hilda_WasZuEssen_17_06");	//� �������, � ���� ���������� �����, ����� ������ ���� ��� � ������.
	};
};


instance DIA_Hilda_BringBeet(C_Info)
{
	npc = BAU_951_Hilda;
	nr = 1;
	condition = DIA_Hilda_BringBeet_Condition;
	information = DIA_Hilda_BringBeet_Info;
	permanent = FALSE;
	description = "� ������ ���� ����...";
};


func int DIA_Hilda_BringBeet_Condition()
{
	if((MIS_Lobart_RuebenToHilda == LOG_Running) && (Npc_HasItems(other,ItPl_Beet) >= 1) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Hilda_BringBeet_Info()
{
	AI_Output(other,self,"DIA_Hilda_BringBeet_15_00");	//� ������ ���� ����...
	if(Npc_HasItems(other,ItPl_Beet) >= 20)
	{
		B_GiveInvItems(other,self,ItPl_Beet,Npc_HasItems(other,ItPl_Beet));
		AI_Output(self,other,"DIA_Hilda_BringBeet_17_01");	//�������! (�������) ����� ������ �������, ����� ��������� ����� ���������� �� ������!
		AI_Output(self,other,"DIA_Hilda_BringBeet_17_02");	//��� �� �� ��� ����� �����... � ������, ��� ���� ������ ������������� ��������. ��� ���� ��������� ����� �����.
		AI_Output(self,other,"DIA_Hilda_BringBeet_17_03");	//� �����, �� ���-������ ����������� �� ���� � �����. ����� � ����. ����� � ���� �������� ���������� ��� ����.
		MIS_Lobart_RuebenToHilda = LOG_SUCCESS;
		B_GivePlayerXP(XP_Ambient);
	}
	else
	{
		if(hero.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Hilda_BringBeet_17_04");	//���?! ��� ���?
		}
		else
		{
			AI_Output(self,other,"DIA_Hilda_BringBeet_17_05");	//����� ������������.
		};
		AI_Output(self,other,"DIA_Hilda_BringBeet_17_06");	//��� � ���� � ������ ���. ��� ���� �������!
		AI_StopProcessInfos(self);
	};
};


instance DIA_Hilda_Einkaufen(C_Info)
{
	npc = BAU_951_Hilda;
	nr = 2;
	condition = DIA_Hilda_Einkaufen_Condition;
	information = DIA_Hilda_Einkaufen_Info;
	permanent = FALSE;
	description = "��� ��� ������, � � ����� � ����� �������� ��� ����...";
};


func int DIA_Hilda_Einkaufen_Condition()
{
	if((MIS_Lobart_RuebenToHilda == LOG_SUCCESS) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Hilda_Einkaufen_Info()
{
	AI_Output(other,self,"DIA_Hilda_Einkaufen_15_00");	//��� ��� ������, � � ����� � ����� �������� ��� ����...
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Hilda_Einkaufen_17_01");	//� ���� ����� ��������? ������ �������� ��������� ��� ������ �� �������, �������?!
	};
	B_GiveInvItems(self,other,ItMi_Gold,20);
	MIS_Hilda_PfanneKaufen = LOG_Running;
	MIS_Hilda_PfanneKaufen_Day = B_GetDayPlus();
	Log_CreateTopic(TOPIC_Hilda,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Hilda,LOG_Running);
	B_LogEntry(TOPIC_Hilda,"������, ���� ������� �������, ����� � ����� ��� ��� � �������������� �������� ���������.");
};


instance DIA_Hilda_PfanneGeholt(C_Info)
{
	npc = BAU_951_Hilda;
	nr = 2;
	condition = DIA_Hilda_PfanneGeholt_Condition;
	information = DIA_Hilda_PfanneGeholt_Info;
	permanent = FALSE;
	description = "��� ���� ����������.";
};


func int DIA_Hilda_PfanneGeholt_Condition()
{
	if((MIS_Hilda_PfanneKaufen == LOG_Running) && (Npc_HasItems(other,ItMi_Pan) > 0) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Hilda_PfanneGeholt_Info()
{
	AI_Output(other,self,"DIA_Hilda_PfanneGeholt_15_00");	//��� ���� ����������.
	B_GiveInvItems(other,self,ItMi_Pan,1);
	AI_Output(self,other,"DIA_Hilda_PfanneGeholt_17_01");	//�������. ���������, ������� �� ���...
	MIS_Hilda_PfanneKaufen = LOG_SUCCESS;
	B_GivePlayerXP(XP_HildaHolPfanne);
};


instance DIA_Hilda_PfanneTooLate(C_Info)
{
	npc = BAU_951_Hilda;
	nr = 1;
	condition = DIA_Hilda_PfanneTooLate_Condition;
	information = DIA_Hilda_PfanneTooLate_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Hilda_PfanneTooLate_Condition()
{
	if((MIS_Hilda_PfanneKaufen == LOG_Running) && (MIS_Hilda_PfanneKaufen_Day <= (Wld_GetDay() - 1)) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Hilda_PfanneTooLate_Info()
{
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Hilda_PfanneTooLate_17_00");	//� ���� ��� ������� �������� ���������� �����? ��� �� ������ � ����� ��������, ��, ����������?!
	}
	else
	{
		AI_Output(self,other,"DIA_Hilda_PfanneTooLate_17_01");	//��� �� ������ ��� ��� �����? � ��� ��� ������, ��� � ���� ���� �� ���������?
	};
	if(Npc_HasItems(other,ItMi_Pan) > 0)
	{
		AI_Output(other,self,"DIA_Hilda_PfanneTooLate_15_02");	//������, � ������� �������������. ��� ���� ����������!
		B_GiveInvItems(other,self,ItMi_Pan,1);
		AI_Output(self,other,"DIA_Hilda_PfanneTooLate_17_03");	//��-�, ����� �� �� ����! �� � ����� �� �� - ������ ����������!
		MIS_Hilda_PfanneKaufen = LOG_SUCCESS;
		B_GivePlayerXP(XP_HildaHolPfanne / 2);
		AI_StopProcessInfos(self);
	}
	else
	{
		if(Npc_HasItems(other,ItMi_Gold) >= 20)
		{
			AI_Output(self,other,"DIA_Hilda_PfanneTooLate_17_04");	//��! ��� ��� ��� � ����! ����� �� �����. �����!
			B_GiveInvItems(other,self,ItMi_Gold,20);
			AI_Output(self,other,"DIA_Hilda_PfanneTooLate_17_05");	//�� � ����� �� �� - ������ ����������!
		}
		else
		{
			AI_Output(self,other,"DIA_Hilda_PfanneTooLate_17_06");	//� ���� ��� �����?! � ���� ���� 20 �������!
			AI_Output(self,other,"DIA_Hilda_PfanneTooLate_17_07");	//����� � ���� ����, ������� ���!
			B_MemorizePlayerCrime(self,other,CRIME_THEFT);
		};
		MIS_Hilda_PfanneKaufen = LOG_FAILED;
		B_CheckLog();
		AI_StopProcessInfos(self);
	};
};


instance DIA_Hilda_KAP3_EXIT(C_Info)
{
	npc = BAU_951_Hilda;
	nr = 999;
	condition = DIA_Hilda_KAP3_EXIT_Condition;
	information = DIA_Hilda_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hilda_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Hilda_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hilda_KRANK(C_Info)
{
	npc = BAU_951_Hilda;
	nr = 30;
	condition = DIA_Hilda_KRANK_Condition;
	information = DIA_Hilda_KRANK_Info;
	permanent = TRUE;
	description = "��� �� ���� ����������?";
};


func int DIA_Hilda_KRANK_Condition()
{
	if((Kapitel >= 3) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF)) && (MIS_HealHilda != LOG_SUCCESS))
	{
		return TRUE;
	};
};


var int DIA_Hilda_KRANK_OnTime;

func void DIA_Hilda_KRANK_Info()
{
	AI_Output(other,self,"DIA_Hilda_KRANK_15_00");	//��� �� ���� ����������?
	AI_Output(self,other,"DIA_Hilda_KRANK_17_01");	//�������������. � ���� ����� ��� ������� ���������.
	AI_Output(self,other,"DIA_Hilda_KRANK_17_02");	//��� �� ����� ������� � ���������� ������, �� � ������� ����� ��� �����.
	if(DIA_Hilda_KRANK_OnTime == FALSE)
	{
		Info_ClearChoices(DIA_Hilda_KRANK);
		Info_AddChoice(DIA_Hilda_KRANK,"�����������. � ��� ����� ����.",DIA_Hilda_KRANK_besserung);
		Info_AddChoice(DIA_Hilda_KRANK,"���� � ���-������ ������?",DIA_Hilda_KRANK_helfen);
		DIA_Hilda_KRANK_OnTime = TRUE;
	};
	MIS_HealHilda = LOG_Running;
};

func void DIA_Hilda_KRANK_besserung()
{
	AI_Output(other,self,"DIA_Hilda_KRANK_besserung_15_00");	//�����������. � ��� ����� ����.
	AI_Output(self,other,"DIA_Hilda_KRANK_besserung_17_01");	//�������� ���������, ��� ������ ��� ������ �����.
	AI_StopProcessInfos(self);
};

func void DIA_Hilda_KRANK_helfen()
{
	AI_Output(other,self,"DIA_Hilda_KRANK_helfen_15_00");	//���� � ���-������ ������?
	AI_Output(self,other,"DIA_Hilda_KRANK_helfen_17_01");	//���� �� �����������, ���� �� �� ��� ������� � ������� � �������� ��� ��������� �� ����.
	AI_Output(self,other,"DIA_Hilda_KRANK_helfen_17_02");	//�� �����, ��� ��� �����! ����� ��� �� �����.
	Log_CreateTopic(TOPIC_HealHilda,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HealHilda,LOG_Running);
	B_LogEntry(TOPIC_HealHilda,"���� ������� ������ ������, �� � ������� ���� ���������, ������� ����� �������� ��.");
	AI_StopProcessInfos(self);
};


instance DIA_Hilda_HEILUNGBRINGEN(C_Info)
{
	npc = BAU_951_Hilda;
	nr = 31;
	condition = DIA_Hilda_HEILUNGBRINGEN_Condition;
	information = DIA_Hilda_HEILUNGBRINGEN_Info;
	description = "� ������ ���� ���������.";
};


func int DIA_Hilda_HEILUNGBRINGEN_Condition()
{
	if(Npc_HasItems(other,ItPo_HealHilda_MIS))
	{
		return TRUE;
	};
};

func void DIA_Hilda_HEILUNGBRINGEN_Info()
{
	AI_Output(other,self,"DIA_Hilda_HEILUNGBRINGEN_15_00");	//� ������ ���� ���������.
	B_GiveInvItems(other,self,ItPo_HealHilda_MIS,1);
	AI_Output(self,other,"DIA_Hilda_HEILUNGBRINGEN_17_01");	//��. ���� �� ������ ����� �����, ��� ��, ���� ��������. �������� �������.
	B_UseItem(self,ItPo_HealHilda_MIS);
	AI_Output(self,other,"DIA_Hilda_HEILUNGBRINGEN_17_02");	//�������, ���� ���������� ����� ����� ����������.
	CreateInvItems(self,ItMi_Gold,50);
	B_GiveInvItems(self,other,ItMi_Gold,50);
	MIS_HealHilda = LOG_SUCCESS;
	B_GivePlayerXP(XP_HealHilda);
	AI_StopProcessInfos(self);
};


instance DIA_Hilda_DISTURB(C_Info)
{
	npc = BAU_951_Hilda;
	nr = 32;
	condition = DIA_Hilda_DISTURB_Condition;
	information = DIA_Hilda_DISTURB_Info;
	permanent = TRUE;
	description = "��� ��?";
};


func int DIA_Hilda_DISTURB_Condition()
{
	if((MIS_HealHilda == LOG_SUCCESS) || (((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && (Kapitel > 3)))
	{
		return TRUE;
	};
};

func void DIA_Hilda_DISTURB_Info()
{
	if(MIS_HealHilda == LOG_SUCCESS)
	{
		AI_Output(other,self,"DIA_Hilda_DISTURB_15_00");	//��� ���� ��������?
		AI_Output(self,other,"DIA_Hilda_DISTURB_17_01");	//��� �����, ������� ����.
	}
	else
	{
		AI_Output(self,other,"DIA_Hilda_DISTURB_17_02");	//��� ��� �����.
	};
};


instance DIA_Hilda_KAP4_EXIT(C_Info)
{
	npc = BAU_951_Hilda;
	nr = 999;
	condition = DIA_Hilda_KAP4_EXIT_Condition;
	information = DIA_Hilda_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hilda_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Hilda_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hilda_KAP5_EXIT(C_Info)
{
	npc = BAU_951_Hilda;
	nr = 999;
	condition = DIA_Hilda_KAP5_EXIT_Condition;
	information = DIA_Hilda_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hilda_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Hilda_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hilda_KAP6_EXIT(C_Info)
{
	npc = BAU_951_Hilda;
	nr = 999;
	condition = DIA_Hilda_KAP6_EXIT_Condition;
	information = DIA_Hilda_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hilda_KAP6_EXIT_Condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Hilda_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hilda_PICKPOCKET(C_Info)
{
	npc = BAU_951_Hilda;
	nr = 900;
	condition = DIA_Hilda_PICKPOCKET_Condition;
	information = DIA_Hilda_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40_Female;
};


func int DIA_Hilda_PICKPOCKET_Condition()
{
	return C_Beklauen(26,35);
};

func void DIA_Hilda_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Hilda_PICKPOCKET);
	Info_AddChoice(DIA_Hilda_PICKPOCKET,Dialog_Back,DIA_Hilda_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Hilda_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Hilda_PICKPOCKET_DoIt);
};

func void DIA_Hilda_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Hilda_PICKPOCKET);
};

func void DIA_Hilda_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Hilda_PICKPOCKET);
};

