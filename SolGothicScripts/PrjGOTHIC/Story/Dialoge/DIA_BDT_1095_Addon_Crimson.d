
instance DIA_Addon_Crimson_EXIT(C_Info)
{
	npc = BDT_1095_Addon_Crimson;
	nr = 999;
	condition = DIA_Addon_Crimson_EXIT_Condition;
	information = DIA_Addon_Crimson_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Crimson_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Crimson_EXIT_Info()
{
	Wld_StopEffect("DEMENTOR_FX");
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Crimson_PICKPOCKET(C_Info)
{
	npc = BDT_1095_Addon_Crimson;
	nr = 900;
	condition = DIA_Addon_Crimson_PICKPOCKET_Condition;
	information = DIA_Addon_Crimson_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Addon_Crimson_PICKPOCKET_Condition()
{
	return C_Beklauen(66,66);
};

func void DIA_Addon_Crimson_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Crimson_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Crimson_PICKPOCKET,Dialog_Back,DIA_Addon_Crimson_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Crimson_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Crimson_PICKPOCKET_DoIt);
};

func void DIA_Addon_Crimson_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Crimson_PICKPOCKET);
};

func void DIA_Addon_Crimson_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Crimson_PICKPOCKET);
};


instance DIA_Addon_Crimson_Hi(C_Info)
{
	npc = BDT_1095_Addon_Crimson;
	nr = 2;
	condition = DIA_Addon_Crimson_Hi_Condition;
	information = DIA_Addon_Crimson_Hi_Info;
	permanent = FALSE;
	description = "��� �� �������? �� ������� ���� ������?";
};


func int DIA_Addon_Crimson_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Crimson_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_Crimson_Hi_15_00");	//��� �� �������? �� ������� ���� ������?
	AI_Output(self,other,"DIA_Addon_Crimson_Hi_10_01");	//���, ��� �����. ������� ��, � ������ ������. � ������� �� ���� ������.
	AI_Output(self,other,"DIA_Addon_Crimson_Hi_10_02");	//�������������, ������� ������� ����� ������� �� ��� � ������ ��� ����� ��� �������.
	AI_Output(self,other,"DIA_Addon_Crimson_Hi_10_03");	//�� ������ ��������� � ���� ������� ����� ��������� �����. ��� ���������� ������ ��������, ��� �� ��������� �� �� ��������!
};


instance DIA_Addon_Crimson_How(C_Info)
{
	npc = BDT_1095_Addon_Crimson;
	nr = 2;
	condition = DIA_Addon_Crimson_How_Condition;
	information = DIA_Addon_Crimson_How_Info;
	permanent = FALSE;
	description = "������� ����� �� ���� ��� �� ���������?";
};


func int DIA_Addon_Crimson_How_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Crimson_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Crimson_How_Info()
{
	AI_Output(other,self,"DIA_Addon_Crimson_How_15_00");	//������� ����� �� ���� ��� �� ���������?
	AI_Output(self,other,"DIA_Addon_Crimson_How_10_01");	//��, ���� � ������ �� ����, �� �����, ��� ��� ���� ������ ����. �� ���� ��������� � ��� ����...
	B_Say_Gold(self,other,10);
};


instance DIA_Addon_Crimson_Feilsch(C_Info)
{
	npc = BDT_1095_Addon_Crimson;
	nr = 2;
	condition = DIA_Addon_Crimson_Feilsch_Condition;
	information = DIA_Addon_Crimson_Feilsch_Info;
	permanent = FALSE;
	description = "����� �����������!";
};


func int DIA_Addon_Crimson_Feilsch_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Crimson_How))
	{
		return TRUE;
	};
};

func void DIA_Addon_Crimson_Feilsch_Info()
{
	AI_Output(other,self,"DIA_Addon_Crimson_Feilsch_15_00");	//����� �����������!
	AI_Output(self,other,"DIA_Addon_Crimson_Feilsch_10_01");	//��-�, ���. ������� � ��� ������� ��������.
	AI_Output(other,self,"DIA_Addon_Crimson_Feilsch_15_02");	//�� �� �������, ��� ��� ������ ����.
	AI_Output(self,other,"DIA_Addon_Crimson_Feilsch_10_03");	//��� ���. � ���� ����� ������ ����.
};


instance DIA_Addon_Crimson_Gold(C_Info)
{
	npc = BDT_1095_Addon_Crimson;
	nr = 99;
	condition = DIA_Addon_Crimson_Gold_Condition;
	information = DIA_Addon_Crimson_Gold_Info;
	permanent = TRUE;
	description = "������� ������� ������...";
};


func int DIA_Addon_Crimson_Gold_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Crimson_How))
	{
		return TRUE;
	};
};

func void DIA_Addon_Crimson_Gold_Info()
{
	AI_Output(other,self,"DIA_Addon_Crimson_Gold_15_00");	//�������� ���������...
	Info_ClearChoices(DIA_Addon_Crimson_Gold);
	Info_AddChoice(DIA_Addon_Crimson_Gold,Dialog_Back,DIA_Addon_Crimson_Gold_BACK);
	if(Npc_HasItems(other,ItMi_GoldNugget_Addon) >= 1)
	{
		Info_AddChoice(DIA_Addon_Crimson_Gold,"������� ��� ������� ������",DIA_Addon_Crimson_Gold_ALLE);
		Info_AddChoice(DIA_Addon_Crimson_Gold,"������� 1 ������� ������",DIA_Addon_Crimson_Gold_1);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Crimson_Gold_10_01");	//�� � ���� � ����� ��� �� ������ ���������.
	};
};

func void DIA_Addon_Crimson_Gold_BACK()
{
	Info_ClearChoices(DIA_Addon_Crimson_Gold);
};

func void DIA_Addon_Crimson_Gold_ALLE()
{
	var int CurrentNuggets;
	CurrentNuggets = Npc_HasItems(other,ItMi_GoldNugget_Addon);
	B_GiveInvItems(other,self,ItMi_GoldNugget_Addon,CurrentNuggets);
	B_GiveInvItems(self,other,ItMi_Gold,CurrentNuggets * 10);
	Info_ClearChoices(DIA_Addon_Crimson_Gold);
	Info_AddChoice(DIA_Addon_Crimson_Gold,Dialog_Back,DIA_Addon_Crimson_Gold_BACK);
	if(Npc_HasItems(other,ItMi_GoldNugget_Addon) >= 1)
	{
		Info_AddChoice(DIA_Addon_Crimson_Gold,"������� ��� ������� ������",DIA_Addon_Crimson_Gold_ALLE);
		Info_AddChoice(DIA_Addon_Crimson_Gold,"������� 1 ������� ������",DIA_Addon_Crimson_Gold_1);
	};
};

func void DIA_Addon_Crimson_Gold_1()
{
	B_GiveInvItems(other,self,ItMi_GoldNugget_Addon,1);
	B_GiveInvItems(self,other,ItMi_Gold,10);
	Info_ClearChoices(DIA_Addon_Crimson_Gold);
	Info_AddChoice(DIA_Addon_Crimson_Gold,Dialog_Back,DIA_Addon_Crimson_Gold_BACK);
	if(Npc_HasItems(other,ItMi_GoldNugget_Addon) >= 1)
	{
		Info_AddChoice(DIA_Addon_Crimson_Gold,"������� ��� ������� ������",DIA_Addon_Crimson_Gold_ALLE);
		Info_AddChoice(DIA_Addon_Crimson_Gold,"������� 1 ������� ������",DIA_Addon_Crimson_Gold_1);
	};
};

func void B_Say_CrimsonBeliar()
{
	AI_Output(self,other,"DIA_Addon_Crimson_FATAGN_LOS_10_00");	//�������� ������ ����� ������ ������.
};


instance DIA_Addon_Crimson_Raven(C_Info)
{
	npc = BDT_1095_Addon_Crimson;
	nr = 9;
	condition = DIA_Addon_Crimson_Raven_Condition;
	information = DIA_Addon_Crimson_Raven_Info;
	permanent = FALSE;
	description = "��� �� ������ � ������?";
};


func int DIA_Addon_Crimson_Raven_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Crimson_How))
	{
		return TRUE;
	};
};

func void DIA_Addon_Crimson_Raven_Info()
{
	AI_Output(other,self,"DIA_Addon_Crimson_Raven_15_00");	//��� �� ������ � ������?
	AI_Output(self,other,"DIA_Addon_Crimson_Raven_10_01");	//�� �� ��������! � ��� ���. � �����, ��� �� ����� � ��������!
	AI_Output(self,other,"DIA_Addon_Crimson_Raven_10_02");	//�� �������� � ���������� �����-�� �������� �����. ����� � �����...
	B_Say_CrimsonBeliar();
	AI_Output(self,other,"DIA_Addon_Crimson_Raven_10_03");	//� ����� �� ������ �������� ����� �����, � � ������� ������� �����.
	AI_Output(self,other,"DIA_Addon_Crimson_Raven_10_04");	//� ����... ���� �����... �� ������, ��� ����� ������������ ����� �����!
	AI_Output(self,other,"DIA_Addon_Crimson_Raven_10_05");	//����� ������� � ���! ��� ������������� - ����� � ���� �����!
	AI_Output(self,other,"DIA_Addon_Crimson_Raven_10_06");	//� �� �����, � ��� ��� ��������. �� ����� � ����������� ��� ������� ����� ������ ����� ��������� �����.
};


instance DIA_Addon_Crimson_FATAGN(C_Info)
{
	npc = BDT_1095_Addon_Crimson;
	nr = 98;
	condition = DIA_Addon_Crimson_FATAGN_Condition;
	information = DIA_Addon_Crimson_FATAGN_Info;
	permanent = TRUE;
	description = "�� ������ ��������� ����� ������?";
};


func int DIA_Addon_Crimson_FATAGN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Crimson_Raven) && (Crimson_SayBeliar < 4))
	{
		return TRUE;
	};
};

func void DIA_Addon_Crimson_FATAGN_Info()
{
	Crimson_SayBeliar = Crimson_SayBeliar + 1;
	AI_Output(other,self,"DIA_Addon_Crimson_FATAGN_15_00");	//�� ������ ��������� ����� ������?
	if(Crimson_SayBeliar <= 3)
	{
		AI_Output(self,other,"DIA_Addon_Crimson_FATAGN_10_01");	//�������. �� �����?
		Info_ClearChoices(DIA_Addon_Crimson_FATAGN);
		Info_AddChoice(DIA_Addon_Crimson_FATAGN,"������",DIA_Addon_Crimson_FATAGN_LOS);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Crimson_FATAGN_10_02");	//�����, ��� ����� �� ����������� � ���...
	};
};

func void DIA_Addon_Crimson_FATAGN_LOS()
{
	Snd_Play("Mystery_09");
	B_Say_CrimsonBeliar();
	if(Crimson_SayBeliar == 3)
	{
		Wld_PlayEffect("FX_EARTHQUAKE",self,self,0,0,0,FALSE);
		Wld_PlayEffect("DEMENTOR_FX",self,self,0,0,0,FALSE);
	};
	Info_ClearChoices(DIA_Addon_Crimson_FATAGN);
};

