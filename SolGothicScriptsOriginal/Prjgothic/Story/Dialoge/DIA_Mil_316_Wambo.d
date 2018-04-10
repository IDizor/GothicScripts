
instance DIA_Wambo_EXIT(C_Info)
{
	npc = Mil_316_Wambo;
	nr = 999;
	condition = DIA_Wambo_EXIT_Condition;
	information = DIA_Wambo_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Wambo_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Wambo_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Wambo_PICKPOCKET(C_Info)
{
	npc = Mil_316_Wambo;
	nr = 900;
	condition = DIA_Wambo_PICKPOCKET_Condition;
	information = DIA_Wambo_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(�������� ���� ���� ����������)";
};


func int DIA_Wambo_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,ItKe_City_Tower_04) >= 1) && (other.attribute[ATR_DEXTERITY] >= 40))
	{
		return TRUE;
	};
};

func void DIA_Wambo_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Wambo_PICKPOCKET);
	Info_AddChoice(DIA_Wambo_PICKPOCKET,Dialog_Back,DIA_Wambo_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Wambo_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Wambo_PICKPOCKET_DoIt);
};

func void DIA_Wambo_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 50)
	{
		B_GiveInvItems(self,other,ItKe_City_Tower_04,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Wambo_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Wambo_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Wambo_PICKPOCKET);
};


instance DIA_Wambo_Job(C_Info)
{
	npc = Mil_316_Wambo;
	nr = 5;
	condition = DIA_Wambo_Job_Condition;
	information = DIA_Wambo_Job_Info;
	permanent = FALSE;
	description = "��� �� ������� �����?";
};


func int DIA_Wambo_Job_Condition()
{
	return TRUE;
};

func void DIA_Wambo_Job_Info()
{
	AI_Output(other,self,"DIA_Wambo_Job_15_00");	//��� �� ������� �����?
	AI_Output(self,other,"DIA_Wambo_Job_03_01");	//� ����� �� ���, ����� ����� �� ������ � ����.
	AI_Output(self,other,"DIA_Wambo_Job_03_02");	//���� ����� ����� ����� ���� ������. � ���� �� ����� �������� ���!
};


instance DIA_Wambo_Situation(C_Info)
{
	npc = Mil_316_Wambo;
	nr = 10;
	condition = DIA_Wambo_Situation_Condition;
	information = DIA_Wambo_Situation_Info;
	permanent = TRUE;
	description = "��� ����?";
};


func int DIA_Wambo_Situation_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wambo_Job))
	{
		return TRUE;
	};
};

func void DIA_Wambo_Situation_Info()
{
	AI_Output(other,self,"DIA_Wambo_Situation_15_00");	//��� ����?
	AI_Output(self,other,"DIA_Wambo_Situation_03_01");	//������ ��� ��������.
};


instance DIA_Wambo_Ramirez(C_Info)
{
	npc = Mil_316_Wambo;
	nr = 5;
	condition = DIA_Wambo_Ramirez_Condition;
	information = DIA_Wambo_Ramirez_Info;
	permanent = FALSE;
	description = "� ������ �� ������ ������ �����, ��������.";
};


func int DIA_Wambo_Ramirez_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Ramirez_Viertel))
	{
		return TRUE;
	};
};

func void DIA_Wambo_Ramirez_Info()
{
	AI_Output(other,self,"DIA_Wambo_Ramirez_15_00");	//� ������ �� ������ ������ �����, ��������.
	AI_Output(self,other,"DIA_Wambo_Ramirez_03_01");	//��? ���� ������� ��� ��� ������. � �� ��� �� ����. ��, �����. �� ������ ��� ���-������?
	AI_Output(other,self,"DIA_Wambo_Ramirez_15_02");	//��� ������� �� ����, ��� �� ������.
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_Wambo_Ramirez_03_03");	//(����) ������, �������� ���: �� ������� ��� 250 ������� �����. � ���� �� ����� ����� ��� ����.
	AI_Output(self,other,"DIA_Wambo_Ramirez_03_04");	//�, ���� �� �� ����� ��������������, ����� ����������� ���: ���� � �������� �����, �� ���� ������ ����� ����� ������� ������������.
};


instance DIA_Wambo_Deal(C_Info)
{
	npc = Mil_316_Wambo;
	nr = 5;
	condition = DIA_Wambo_Deal_Condition;
	information = DIA_Wambo_Deal_Info;
	permanent = TRUE;
	description = "(��������� 250 ������)";
};


var int DIA_Wambo_Deal_permanent;

func int DIA_Wambo_Deal_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wambo_Ramirez) && (DIA_Wambo_Deal_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Wambo_Deal_Info()
{
	AI_Output(other,self,"DIA_Wambo_Deal_15_00");	//� ���� ���� ������...
	if(B_GiveInvItems(other,self,ItMi_Gold,250))
	{
		AI_Output(self,other,"DIA_Wambo_Deal_03_01");	//������, ����� � ������� �� ��� ����.
		AI_Output(self,other,"DIA_Wambo_Deal_03_02");	//� �����: ���� � ���� ��������� ��������, � �� ���� ����.
		DIA_Wambo_Deal_permanent = TRUE;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"DRINK");
	}
	else
	{
		AI_Output(other,self,"DIA_Wambo_Deal_15_03");	//...�� � �����  �� �� ��������.
		AI_Output(self,other,"DIA_Wambo_Deal_03_04");	//� �� ������, ����� ���-������ �������� ��������� ����. ��� ��� ����� ���� ������.
		AI_StopProcessInfos(self);
	};
};

