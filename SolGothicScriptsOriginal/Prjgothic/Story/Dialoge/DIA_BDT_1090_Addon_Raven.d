
instance DIA_Addon_Raven_EXIT(C_Info)
{
	npc = BDT_1090_Addon_Raven;
	nr = 999;
	condition = DIA_Addon_Raven_EXIT_Condition;
	information = DIA_Addon_Raven_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Raven_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Raven_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Raven_Hi(C_Info)
{
	npc = BDT_1090_Addon_Raven;
	nr = 1;
	condition = DIA_Addon_Raven_Hi_Condition;
	information = DIA_Addon_Raven_Hi_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Raven_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Raven_Hi_Info()
{
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_00");	//����������, ��� ������.
	if(C_BodyStateContains(self,BS_SIT))
	{
		Npc_StopAni(self,"T_PRAY_RANDOM");
		AI_PlayAniBS(self,"T_PRAY_2_STAND",BS_STAND);
		AI_TurnToNPC(self,other);
	};
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_01");	//���������� ����������� ����, ��� ����� ������ ������ �����.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_02");	//�� � �� �����, ��� �� ������� ��� ������.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_03");	//��� �, ��� �� ��� ������, (�������) �� � ������ ���� ����� �������.
	Info_ClearChoices(DIA_Addon_Raven_Hi);
	Info_AddChoice(DIA_Addon_Raven_Hi,"�� ����, ���� �� ��� �����. � ��� ������ ��!",DIA_Addon_Raven_Hi_DU);
	Info_AddChoice(DIA_Addon_Raven_Hi,"�� ������ ���� �������!",DIA_Addon_Raven_Hi_Soul);
};

func void DIA_Addon_Raven_Hi_DU()
{
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_00");	//�� ����, ���� �� ��� �����. � ��� ������ ��!
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_04");	//(�������) ���� �� ���� �� ����������. � ���� ��� �������.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_05");	//� ������ ����� �������� �� ���������. ������ �� �������� ��� ����� � ������ ����!
};

func void DIA_Addon_Raven_Hi_Soul()
{
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_01");	//�� ������ ���� �������!
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_06");	//��, � �� ������� ����. � ����� ��������� ��� �����.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_07");	//� ��� ������ ����? ���� ��������, ������� ����� ���� ����?
	Info_ClearChoices(DIA_Addon_Raven_Hi);
	Info_AddChoice(DIA_Addon_Raven_Hi,"����������. ��������� � ����...",DIA_Addon_Raven_Hi_Attack);
	Info_AddChoice(DIA_Addon_Raven_Hi,"� ���� ����� ��, ��� ������ ���� ���������.",DIA_Addon_Raven_Hi_only);
};

func void DIA_Addon_Raven_Hi_only()
{
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_02");	//� ���� ����� ��, ��� ������ ���� ���������.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_08");	//(�������) �� ������ ����������! �� ������� ��� ��������� ����, �����!
	Info_ClearChoices(DIA_Addon_Raven_Hi);
	Info_AddChoice(DIA_Addon_Raven_Hi,"����������. ��������� � ����...",DIA_Addon_Raven_Hi_Attack);
	Info_AddChoice(DIA_Addon_Raven_Hi,"�� ������, ��� � ����� ������?",DIA_Addon_Raven_Hi_Sure);
};

func void DIA_Addon_Raven_Hi_Sure()
{
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_03");	//�� ������, ��� � ����� ������?
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_09");	//���? � ��� �� ��������?
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_04");	//�� �� �����, ��� � ���� ���� � ������������ ���� �������?
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_10");	//(�������) ������!
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_05");	//� �����, � ���� ����� �������? ��� ���� ������ ����?
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_11");	//(����������) ��� �, � ����� ������ �� ��� ���� ��  ���������!
	Info_ClearChoices(DIA_Addon_Raven_Hi);
	Info_AddChoice(DIA_Addon_Raven_Hi,"����������. ��������� � ����...",DIA_Addon_Raven_Hi_Attack);
};

func void DIA_Addon_Raven_Hi_Attack()
{
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_06");	//����������. ��������� � ����...
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_12");	//(����������) �� ��� ���������� �������? ��, ��� �� �����������...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
};

