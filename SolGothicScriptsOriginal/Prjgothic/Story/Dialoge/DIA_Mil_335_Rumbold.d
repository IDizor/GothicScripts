
instance DIA_Rumbold_EXIT(C_Info)
{
	npc = Mil_335_Rumbold;
	nr = 999;
	condition = DIA_Rumbold_EXIT_Condition;
	information = DIA_Rumbold_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Rumbold_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Rumbold_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Rumbold_PrePerm(C_Info)
{
	npc = Mil_335_Rumbold;
	nr = 1;
	condition = DIA_Rumbold_PrePerm_Condition;
	information = DIA_Rumbold_PrePerm_Info;
	permanent = TRUE;
	description = "��� �� ������� �����?";
};


func int DIA_Rumbold_PrePerm_Condition()
{
	if(!Npc_KnowsInfo(other,DIA_Bengar_MILIZKLATSCHEN))
	{
		return TRUE;
	};
};

func void DIA_Rumbold_PrePerm_Info()
{
	AI_Output(other,self,"DIA_Rumbold_PrePerm_15_00");	//��� �� ������� �����?
	AI_Output(self,other,"DIA_Rumbold_PrePerm_10_01");	//����������! �����?
	AI_StopProcessInfos(self);
};


instance DIA_Rumbold_Hallo(C_Info)
{
	npc = Mil_335_Rumbold;
	nr = 1;
	condition = DIA_Rumbold_Hallo_Condition;
	information = DIA_Rumbold_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Rumbold_Hallo_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bengar_MILIZKLATSCHEN))
	{
		return TRUE;
	};
};

func void DIA_Rumbold_Hallo_Info()
{
	AI_Output(self,other,"DIA_Rumbold_Hallo_10_00");	//���������� �� ����! ��� ���� �����! ��� �� ����� �������, �?
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Rumbold_Hallo_10_01");	//��� ��, ���� ���� ������?
	}
	else
	{
		AI_Output(self,other,"DIA_Rumbold_Hallo_10_02");	//��� ���� �� ���� ������� ���������!
	};
	Info_ClearChoices(DIA_Rumbold_Hallo);
	Info_AddChoice(DIA_Rumbold_Hallo,"� �����.",DIA_Rumbold_HALLO_schwanzeinziehen);
	Info_AddChoice(DIA_Rumbold_Hallo,"� ����, ����� �� ������� ������.",DIA_Rumbold_HALLO_verschwindet);
	Info_AddChoice(DIA_Rumbold_Hallo,"� ���� ������ ������.",DIA_Rumbold_HALLO_Attack);
};

func void DIA_Rumbold_HALLO_Attack()
{
	AI_Output(other,self,"DIA_Rumbold_HALLO_Attack_15_00");	//� ���� ������ ������.
	AI_Output(self,other,"DIA_Rumbold_HALLO_Attack_10_01");	//������, ��� �� ��� ����!
	Info_ClearChoices(DIA_Rumbold_Hallo);
	Info_AddChoice(DIA_Rumbold_Hallo,Dialog_Ende,DIA_Rumbold_HALLO_ENDAttack);
};

func void DIA_Rumbold_HALLO_verschwindet()
{
	AI_Output(other,self,"DIA_Rumbold_HALLO_verschwindet_15_00");	//� ����, ����� �� ������� ������.
	AI_Output(self,other,"DIA_Rumbold_HALLO_verschwindet_10_01");	//���-���. �� ����, �� ������, ����� �� �������?
	AI_Output(self,other,"DIA_Rumbold_HALLO_verschwindet_10_02");	//(���������) � ��� �����, ���� �� ����� �� �������, ��?
	Info_ClearChoices(DIA_Rumbold_Hallo);
	Info_AddChoice(DIA_Rumbold_Hallo,"� ��� ���� � ������� ���, ����� �� �������� ������?",DIA_Rumbold_HALLO_geld);
	Info_AddChoice(DIA_Rumbold_Hallo,"� ����� ������, �� ������ ������� �� ������� ���������� ���� ��������.",DIA_Rumbold_HALLO_AufsMaul);
};

func void DIA_Rumbold_HALLO_AufsMaul()
{
	AI_Output(other,self,"DIA_Rumbold_HALLO_AufsMaul_15_00");	//� ����� ������, �� ������ ������� �� ������� ���������� ���� ��������.
	AI_Output(self,other,"DIA_Rumbold_HALLO_AufsMaul_10_01");	//�� ������� ������, ��� ������ ����������, ������!
	Info_ClearChoices(DIA_Rumbold_Hallo);
	Info_AddChoice(DIA_Rumbold_Hallo,Dialog_Ende,DIA_Rumbold_HALLO_ENDAttack);
};

func void DIA_Rumbold_HALLO_geld()
{
	AI_Output(other,self,"DIA_Rumbold_HALLO_geld_15_00");	//� ��� ���� � ������� ���, ����� �� �������� ������?
	AI_Output(self,other,"DIA_Rumbold_HALLO_geld_10_01");	//�� ������ ��������� �� �������? ��� ������ ����.
	AI_Output(self,other,"DIA_Rumbold_HALLO_geld_10_02");	//��� ��������. �������� ���, ��� �� ��� ��������, ��� ����� 65 ������� �����.
	AI_Output(self,other,"DIA_Rumbold_HALLO_geld_10_03");	//���� �����, ���� �������� � ������.
	AI_Output(self,other,"DIA_Rumbold_HALLO_geld_10_04");	//��. � �� ���, �������� �������?
	Info_ClearChoices(DIA_Rumbold_Hallo);
	Info_AddChoice(DIA_Rumbold_Hallo,"�� � ��� �����? ��� ������� �����.",DIA_Rumbold_HALLO_Geld_TooMuch);
	if(Npc_HasItems(other,ItMi_Gold) >= 65)
	{
		Info_AddChoice(DIA_Rumbold_Hallo,"��� ������. � ������ ������������.",DIA_Rumbold_HALLO_geld_ok);
	};
};

func void DIA_Rumbold_HALLO_geld_ok()
{
	AI_Output(other,self,"DIA_Rumbold_HALLO_geld_ok_15_00");	//��� ������. � ������ ������������.
	B_GiveInvItems(other,self,ItMi_Gold,65);
	AI_Output(self,other,"DIA_Rumbold_HALLO_geld_ok_10_01");	//���� �� �������, ��� ������ �� �������. �����. (���� ��� ���) ������!
	AI_StopProcessInfos(self);
	Rumbold_Bezahlt = TRUE;
	Npc_ExchangeRoutine(self,"Start");
	if(Hlp_IsValidNpc(Rick) && !Npc_IsDead(Rick))
	{
		Npc_ExchangeRoutine(Rick,"Start");
		AI_ContinueRoutine(Rick);
	};
	if(Hlp_IsValidNpc(Bengar) && !Npc_IsDead(Bengar))
	{
		Npc_ExchangeRoutine(Bengar,"Start");
		AI_ContinueRoutine(Bengar);
	};
};

func void DIA_Rumbold_HALLO_Geld_TooMuch()
{
	AI_Output(other,self,"DIA_Rumbold_HALLO_geld_TooMuch_15_00");	//�� � ��� �����? ��� ������� �����.
	AI_Output(self,other,"DIA_Rumbold_HALLO_geld_TooMuch_10_01");	//����� ����� � ������!
	AI_StopProcessInfos(self);
};

func void DIA_Rumbold_HALLO_schwanzeinziehen()
{
	AI_Output(other,self,"DIA_Rumbold_HALLO_schwanzeinziehen_15_00");	//� �����.
	AI_Output(self,other,"DIA_Rumbold_HALLO_schwanzeinziehen_10_01");	//����� �������� � ���� ������!
	AI_StopProcessInfos(self);
};

func void DIA_Rumbold_HALLO_ENDAttack()
{
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
	if(Hlp_IsValidNpc(Rick) && !C_NpcIsDown(Rick))
	{
		B_Attack(Rick,other,AR_KILL,1);
	};
};


instance DIA_Rumbold_FightNow(C_Info)
{
	npc = Mil_335_Rumbold;
	nr = 1;
	condition = DIA_Rumbold_FightNow_Condition;
	information = DIA_Rumbold_FightNow_Info;
	permanent = TRUE;
	description = "�������� ����� ������� � �����!";
};


func int DIA_Rumbold_FightNow_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rumbold_Hallo) && (Rumbold_Bezahlt == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Rumbold_FightNow_Info()
{
	AI_Output(other,self,"DIA_Rumbold_FightNow_15_00");	//�������� ����� ������� � �����!
	AI_Output(self,other,"DIA_Rumbold_FightNow_10_01");	//�� ���, �����, �����?
	Info_ClearChoices(DIA_Rumbold_FightNow);
	Info_AddChoice(DIA_Rumbold_FightNow,Dialog_Ende,DIA_Rumbold_FightNow_ENDAttack);
};

func void DIA_Rumbold_FightNow_ENDAttack()
{
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
	if(Hlp_IsValidNpc(Rick) && !C_NpcIsDown(Rick))
	{
		B_Attack(Rick,other,AR_KILL,1);
	};
};


instance DIA_Rumbold_StillThere(C_Info)
{
	npc = Mil_335_Rumbold;
	nr = 1;
	condition = DIA_Rumbold_StillThere_Condition;
	information = DIA_Rumbold_StillThere_Info;
	permanent = TRUE;
	description = "�� ��� �����?!";
};


func int DIA_Rumbold_StillThere_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rumbold_Hallo) && (Rumbold_Bezahlt == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Rumbold_StillThere_Info()
{
	AI_Output(other,self,"DIA_Rumbold_StillThere_15_00");	//�� ��� �����?!
	AI_Output(self,other,"DIA_Rumbold_StillThere_10_01");	//������ �� � ���� ���������!
	Info_ClearChoices(DIA_Rumbold_StillThere);
	Info_AddChoice(DIA_Rumbold_StillThere,Dialog_Ende,DIA_Rumbold_StillThere_ENDAttack);
};

func void DIA_Rumbold_StillThere_ENDAttack()
{
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
	if(Hlp_IsValidNpc(Rick) && !C_NpcIsDown(Rick))
	{
		B_Attack(Rick,other,AR_KILL,1);
	};
};


instance DIA_Rumbold_PICKPOCKET(C_Info)
{
	npc = Mil_335_Rumbold;
	nr = 900;
	condition = DIA_Rumbold_PICKPOCKET_Condition;
	information = DIA_Rumbold_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Rumbold_PICKPOCKET_Condition()
{
	return C_Beklauen(24,45);
};

func void DIA_Rumbold_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Rumbold_PICKPOCKET);
	Info_AddChoice(DIA_Rumbold_PICKPOCKET,Dialog_Back,DIA_Rumbold_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Rumbold_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Rumbold_PICKPOCKET_DoIt);
};

func void DIA_Rumbold_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Rumbold_PICKPOCKET);
};

func void DIA_Rumbold_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Rumbold_PICKPOCKET);
};

