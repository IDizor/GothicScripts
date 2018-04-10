
instance DIA_NAME_BANDIT_EXIT(C_Info)
{
	npc = BDT_1025_Bandit_H;
	nr = 999;
	condition = DIA_NAME_BANDIT_EXIT_Condition;
	information = DIA_NAME_BANDIT_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_NAME_BANDIT_EXIT_Condition()
{
	return TRUE;
};

func void DIA_NAME_BANDIT_EXIT_Info()
{
	hero.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(hero,"NW_FOREST_CAVE1_IN_01");
	AI_StopProcessInfos(self);
};


instance DIA_NAME_BANDIT_SCHAFBLEIBTHIER(C_Info)
{
	npc = BDT_1025_Bandit_H;
	nr = 30;
	condition = DIA_NAME_BANDIT_SCHAFBLEIBTHIER_Condition;
	information = DIA_NAME_BANDIT_SCHAFBLEIBTHIER_Info;
	important = TRUE;
};


func int DIA_NAME_BANDIT_SCHAFBLEIBTHIER_Condition()
{
	return TRUE;
};

func void DIA_NAME_BANDIT_SCHAFBLEIBTHIER_Info()
{
	AI_Output(self,other,"DIA_NAME_BANDIT_SCHAFBLEIBTHIER_09_00");	//�� ��, ������! �� ������ ���� �������� �� �� �����, �?
	if(MIS_Akil_SchafDiebe == 0)
	{
		AI_Output(other,self,"DIA_NAME_BANDIT_SCHAFBLEIBTHIER_15_01");	//�����? ����� �����?
		AI_Output(self,other,"DIA_NAME_BANDIT_SCHAFBLEIBTHIER_09_02");	//��� ������. � ������ ����������. ����� ���� ������ ������.
	};
};


instance DIA_NAME_BANDIT_SchafKlau(C_Info)
{
	npc = BDT_1025_Bandit_H;
	nr = 30;
	condition = DIA_NAME_BANDIT_SchafKlau_Condition;
	information = DIA_NAME_BANDIT_SchafKlau_Info;
	important = TRUE;
};


func int DIA_NAME_BANDIT_SchafKlau_Condition()
{
	if(Npc_GetDistToWP(hero,"NW_FOREST_CAVE1_IN_01") < (hero.aivar[AIV_LastDistToWP] - 50))
	{
		return TRUE;
	};
};

func void DIA_NAME_BANDIT_SchafKlau_Info()
{
	AI_Output(self,other,"DIA_NAME_BANDIT_SchafKlau_09_00");	//��! � � ����� ������.
	Info_AddChoice(DIA_NAME_BANDIT_SchafKlau,Dialog_Ende,DIA_NAME_BANDIT_SchafKlau_weiter);
};

func void DIA_NAME_BANDIT_SchafKlau_weiter()
{
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
	BDT_1025_Bandit_H.aivar[AIV_EnemyOverride] = FALSE;
	BDT_1026_Bandit_H.aivar[AIV_EnemyOverride] = FALSE;
};


instance DIA_NAME_BANDIT_RUECKDASSCHAFRAUS(C_Info)
{
	npc = BDT_1025_Bandit_H;
	nr = 30;
	condition = DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_Condition;
	information = DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_Info;
	permanent = TRUE;
	description = "�� ������ ���� � ������� �����.";
};


func int DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_Condition()
{
	if((MIS_Akil_SchafDiebe == LOG_Running) && (DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_NoPerm == FALSE))
	{
		return TRUE;
	};
};


var int DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_NoPerm;

func void DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_Info()
{
	AI_Output(other,self,"DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_15_00");	//�� ������ ���� � ������� �����.
	AI_Output(self,other,"DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_09_01");	//� ���? ��� �� ������ ������?
	Info_ClearChoices(dia_name_bandit_rueckdasschafraus);
	Info_AddChoice(dia_name_bandit_rueckdasschafraus,"������. � ����� ��� ��� ����� ����?",DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_nichts);
	Info_AddChoice(dia_name_bandit_rueckdasschafraus,"����� ��� ��� ����, ��� � ���� ��������.",DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_schaf);
};

func void DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_schaf()
{
	AI_Output(other,self,"DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_schaf_15_00");	//����� ��� ��� ����, ��� � ���� ��������.
	AI_Output(self,other,"DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_schaf_09_01");	//����� ��������, ��������. ������ ���� �������� ��������.
	AI_StopProcessInfos(self);
	DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_NoPerm = TRUE;
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
	BDT_1025_Bandit_H.aivar[AIV_EnemyOverride] = FALSE;
	BDT_1026_Bandit_H.aivar[AIV_EnemyOverride] = FALSE;
};

func void DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_nichts()
{
	AI_Output(other,self,"DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_nichts_15_00");	//������. � ����� ��� ��� ����� ����?
	AI_Output(self,other,"DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_nichts_09_01");	//����� �� ����� ���� �� ������. ����������!
	hero.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(hero,"NW_FOREST_CAVE1_IN_01");
	AI_StopProcessInfos(self);
};

