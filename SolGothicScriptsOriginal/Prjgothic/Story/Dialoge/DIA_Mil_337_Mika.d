
instance DIA_Mika_EXIT(C_Info)
{
	npc = Mil_337_Mika;
	nr = 999;
	condition = DIA_Mika_EXIT_Condition;
	information = DIA_Mika_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Mika_EXIT_Condition()
{
	if(Kapitel <= 2)
	{
		return TRUE;
	};
};

func void DIA_Mika_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Mika_Refuse(C_Info)
{
	npc = Mil_337_Mika;
	nr = 1;
	condition = DIA_Mika_Refuse_Condition;
	information = DIA_Mika_Refuse_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Mika_Refuse_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Lares.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Mika_Refuse_Info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};


instance DIA_Mika_WOHIN(C_Info)
{
	npc = Mil_337_Mika;
	nr = 4;
	condition = DIA_Mika_WOHIN_Condition;
	information = DIA_Mika_WOHIN_Info;
	important = TRUE;
};


func int DIA_Mika_WOHIN_Condition()
{
	if(Lares.aivar[AIV_PARTYMEMBER] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Mika_WOHIN_Info()
{
	AI_Output(self,other,"DIA_Mika_WOHIN_12_00");	//��, ��! �� ��� ������. ������������� ����� ������ �������� ������. ������ �� �����?
	Info_ClearChoices(DIA_Mika_WOHIN);
	Info_AddChoice(DIA_Mika_WOHIN,"��� �� ���� ����.",DIA_Mika_WOHIN_weg);
	Info_AddChoice(DIA_Mika_WOHIN,"� ����� �� ����.",DIA_Mika_WOHIN_Bauern);
	Info_AddChoice(DIA_Mika_WOHIN,"�� ������!",DIA_Mika_WOHIN_stadt);
};

func void DIA_Mika_WOHIN_stadt()
{
	AI_Output(other,self,"DIA_Mika_WOHIN_stadt_15_00");	//�� ������!
	AI_Output(self,other,"DIA_Mika_WOHIN_stadt_12_01");	//���, ���. ����� ��� �� ������� ���, ��� ������ �� ��� �������� ����?
	Info_ClearChoices(DIA_Mika_WOHIN);
};

func void DIA_Mika_WOHIN_Bauern()
{
	AI_Output(other,self,"DIA_Mika_WOHIN_Bauern_15_00");	//� ����� �� ����.
	AI_Output(self,other,"DIA_Mika_WOHIN_Bauern_12_01");	//�� ������, ��? ���. ����� ���� �� ����� ������� �� ���� ������� ������ ������ ������. ��� �����, ��� ��� ����� ��������� ����.
	Info_ClearChoices(DIA_Mika_WOHIN);
};

func void DIA_Mika_WOHIN_weg()
{
	AI_Output(other,self,"DIA_Mika_WOHIN_weg_15_00");	//��� �� ���� ����.
	AI_Output(self,other,"DIA_Mika_WOHIN_weg_12_01");	//��� ������. �� �� ����� �����, ���� ���-�� ������ � ���� �����. ������� ��������.
	AI_StopProcessInfos(self);
};


instance DIA_Mika_WASGEFAEHRLICH(C_Info)
{
	npc = Mil_337_Mika;
	nr = 5;
	condition = DIA_Mika_WASGEFAEHRLICH_Condition;
	information = DIA_Mika_WASGEFAEHRLICH_Info;
	description = "� ��� ������ �������� �����?";
};


func int DIA_Mika_WASGEFAEHRLICH_Condition()
{
	return TRUE;
};

func void DIA_Mika_WASGEFAEHRLICH_Info()
{
	AI_Output(other,self,"DIA_Mika_WASGEFAEHRLICH_15_00");	//� ��� ������ �������� �����?
	AI_Output(self,other,"DIA_Mika_WASGEFAEHRLICH_12_01");	//����� ����.
	if(other.protection[PROT_EDGE] < ITAR_Leather_L.protection[PROT_EDGE])
	{
		AI_Output(self,other,"DIA_Mika_WASGEFAEHRLICH_12_02");	//��, ��������, �������. ��� ������ � ����, ����� � ��� � ���� ������� ���-������ ����� ����.
		AI_Output(self,other,"DIA_Mika_WASGEFAEHRLICH_12_03");	//� ���� ���� �� ������� �������, �� ����� �������� �� ���� ��� ��������, ������� ������� ������, ����������� � ����.
		AI_Output(self,other,"DIA_Mika_WASGEFAEHRLICH_12_04");	//��� ��� ���������� ������� ���� �� ������ ��������� �������. ��� ��� ��� ������ ������.
	};
	AI_Output(self,other,"DIA_Mika_WASGEFAEHRLICH_12_05");	//� ������, ��� �� ��������� �� ������� �� ���, �� ����� ���� ����� �� ���������� �������� ���� ������.
};


instance DIA_Mika_WASKOSTETHILFE(C_Info)
{
	npc = Mil_337_Mika;
	nr = 6;
	condition = DIA_Mika_WASKOSTETHILFE_Condition;
	information = DIA_Mika_WASKOSTETHILFE_Info;
	description = "��, �����������, � �������� � ���� �� �������.";
};


func int DIA_Mika_WASKOSTETHILFE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Mika_WASGEFAEHRLICH))
	{
		return TRUE;
	};
};

func void DIA_Mika_WASKOSTETHILFE_Info()
{
	AI_Output(other,self,"DIA_Mika_WASKOSTETHILFE_15_00");	//��, �����������, � �������� � ���� �� �������. ������� ��� ����� ��� ������?
	AI_Output(self,other,"DIA_Mika_WASKOSTETHILFE_12_01");	//� ��� �� ���� �������� ����� ������ � ��� �� � ���� �������� ����������� ������� ������ �����������.
	AI_Output(self,other,"DIA_Mika_WASKOSTETHILFE_12_02");	//��, ������, ���� �� �� ��� ������� ������, �� � �� �� ��������� �� ��������� ���������� ������. ��� ������� ���� ������� ������� ���������.
	AI_Output(self,other,"DIA_Mika_WASKOSTETHILFE_12_03");	//10 ������� ����� ���������� ��� ������. ��� �������?
	Info_ClearChoices(DIA_Mika_WASKOSTETHILFE);
	Info_AddChoice(DIA_Mika_WASKOSTETHILFE,"� ������� ��� ����.",DIA_Mika_WASKOSTETHILFE_nochnicht);
	Info_AddChoice(DIA_Mika_WASKOSTETHILFE,"������ �� � ���? ��� ���� 10 �����.",DIA_Mika_WASKOSTETHILFE_ja);
};

func void DIA_Mika_WASKOSTETHILFE_ja()
{
	AI_Output(other,self,"DIA_Mika_WASKOSTETHILFE_ja_15_00");	//������ �� � ���? ��� ���� 10 �����.
	if(B_GiveInvItems(other,self,ItMi_Gold,10))
	{
		AI_Output(self,other,"DIA_Mika_WASKOSTETHILFE_ja_12_01");	//����������. ���� ���� ����������� ��� ������, �� ������, ��� ����� ����.
		AI_Output(self,other,"DIA_Mika_WASKOSTETHILFE_ja_12_02");	//�� ���� ��� �������, �� �������� ���� �� ������ ��������. � �� ������ �����, �� �������?
		Mika_Helps = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Mika_WASKOSTETHILFE_ja_12_03");	//� ���� ��� �����. ��, ��������, ��� � ���� ��������, ����� ���� ������������� ����������� ��� ������.
	};
	AI_StopProcessInfos(self);
};

func void DIA_Mika_WASKOSTETHILFE_nochnicht()
{
	AI_Output(other,self,"DIA_Mika_WASKOSTETHILFE_nochnicht_15_00");	//� ������� ��� ����.
	AI_Output(self,other,"DIA_Mika_WASKOSTETHILFE_nochnicht_12_01");	//��� ������. ����� ������ ���������.
	AI_StopProcessInfos(self);
};


instance DIA_Mika_UEBERLEGT(C_Info)
{
	npc = Mil_337_Mika;
	nr = 7;
	condition = DIA_Mika_UEBERLEGT_Condition;
	information = DIA_Mika_UEBERLEGT_Info;
	permanent = TRUE;
	description = "� ���������. � ������� ���� 10 �������.";
};


func int DIA_Mika_UEBERLEGT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Mika_WASKOSTETHILFE) && (Mika_Helps == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Mika_UEBERLEGT_Info()
{
	AI_Output(other,self,"DIA_Mika_UEBERLEGT_15_00");	//� ���������. � ������� ���� 10 �������.
	if(B_GiveInvItems(other,self,ItMi_Gold,10))
	{
		AI_Output(self,other,"DIA_Mika_UEBERLEGT_12_01");	//�����������. ����� ������, ��� �������. � ��� ������?
		Mika_Helps = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Mika_UEBERLEGT_12_02");	//(�������) �����������, ����� � ���� ����� ������.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Mika_HILFE(C_Info)
{
	npc = Mil_337_Mika;
	nr = 8;
	condition = DIA_Mika_HILFE_Condition;
	information = DIA_Mika_HILFE_Info;
	permanent = TRUE;
	description = "��� ����� ���� ������.";
};


func int DIA_Mika_HILFE_Condition()
{
	if(Mika_Helps == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Mika_HILFE_Info()
{
	AI_Output(other,self,"DIA_Mika_HILFE_15_00");	//��� ����� ���� ������.
	AI_Output(self,other,"DIA_Mika_HILFE_12_01");	//���� ��� ��� ���������� ... ��� ���������?
	Info_ClearChoices(DIA_Mika_HILFE);
	Info_AddChoice(DIA_Mika_HILFE,"���� ���������� �������.",DIA_Mika_HILFE_schongut);
	Info_AddChoice(DIA_Mika_HILFE,"�� ���� ������ �������.",DIA_Mika_HILFE_monster);
	if(!Npc_IsDead(Alvares) && !Npc_IsDead(Engardo) && ((Akils_SLDStillthere == TRUE) || Npc_KnowsInfo(other,DIA_Sarah_Bauern)))
	{
		Info_AddChoice(DIA_Mika_HILFE,"�� ������� ����� ������ ��������.",DIA_Mika_HILFE_Akil);
	};
};

func void DIA_Mika_HILFE_Akil()
{
	AI_Output(other,self,"DIA_Mika_HILFE_Akil_15_00");	//�� ������� ����� ������ ��������.
	AI_Output(self,other,"DIA_Mika_HILFE_Akil_12_01");	//(�����������) ���? ���� ����� ��������� ������ ����� �����? ����� �� ����� ������ ������� �������. ���� �� ����.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	B_GivePlayerXP(XP_Ambient);
	B_LogEntry(TOPIC_AkilsSLDStillthere,"���� ����� ������ ��� ������ �������� � ���������� �� ����� �����.");
	Npc_ExchangeRoutine(self,"Akil");
};

func void DIA_Mika_HILFE_monster()
{
	AI_Output(other,self,"DIA_Mika_HILFE_monster_15_00");	//�� ���� ������ �������.
	AI_Output(self,other,"DIA_Mika_HILFE_monster_12_01");	//�� � �� ���� ������� ��������. � �����, ���� ������������.
	AI_StopProcessInfos(self);
};

func void DIA_Mika_HILFE_schongut()
{
	AI_Output(other,self,"DIA_Mika_HILFE_schongut_15_00");	//���� ���������� �������.
	AI_Output(self,other,"DIA_Mika_HILFE_schongut_12_01");	//�� ��? � ��� �� ���? ���� �� �� ����� �������, � �� ����� ���� �� ������ �� ���, ���������?
	AI_StopProcessInfos(self);
};


instance DIA_Mika_Zack(C_Info)
{
	npc = Mil_337_Mika;
	nr = 8;
	condition = DIA_Mika_Zack_Condition;
	information = DIA_Mika_Zack_Info;
	important = TRUE;
};


func int DIA_Mika_Zack_Condition()
{
	if((Npc_GetDistToWP(self,"NW_FARM2_PATH_03") < 500) && !(Npc_IsDead(Alvares) || !Npc_IsDead(Engardo)))
	{
		return TRUE;
	};
};

func void DIA_Mika_Zack_Info()
{
	AI_Output(self,other,"DIA_Mika_Zack_12_00");	//������ ������, ��� ��� ��������.
	Info_AddChoice(DIA_Mika_Zack,Dialog_Ende,DIA_Mika_Zack_los);
};

func void DIA_Mika_Zack_los()
{
	AI_StopProcessInfos(self);
	if(!Npc_IsDead(Alvares))
	{
		Alvares.aivar[AIV_EnemyOverride] = FALSE;
	};
	if(!Npc_IsDead(Engardo))
	{
		Engardo.aivar[AIV_EnemyOverride] = FALSE;
	};
};


instance DIA_Mika_WIEDERNACHHAUSE(C_Info)
{
	npc = Mil_337_Mika;
	nr = 9;
	condition = DIA_Mika_WIEDERNACHHAUSE_Condition;
	information = DIA_Mika_WIEDERNACHHAUSE_Info;
	important = TRUE;
};


func int DIA_Mika_WIEDERNACHHAUSE_Condition()
{
	if((Npc_GetDistToWP(self,"NW_FARM2_PATH_03") < 10000) && Npc_IsDead(Alvares) && Npc_IsDead(Engardo))
	{
		return TRUE;
	};
};

func void DIA_Mika_WIEDERNACHHAUSE_Info()
{
	AI_Output(self,other,"DIA_Mika_WIEDERNACHHAUSE_12_00");	//��� � ���. � ���� ������������ �����.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"Start");
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Mika_Kap3_EXIT(C_Info)
{
	npc = Mil_337_Mika;
	nr = 999;
	condition = DIA_Mika_Kap3_EXIT_Condition;
	information = DIA_Mika_Kap3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Mika_Kap3_EXIT_Condition()
{
	if(Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Mika_Kap3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Mika_Kap3u4u5_PERM(C_Info)
{
	npc = Mil_337_Mika;
	nr = 39;
	condition = DIA_Mika_Kap3u4u5_PERM_Condition;
	information = DIA_Mika_Kap3u4u5_PERM_Info;
	permanent = TRUE;
	description = "��� ����?";
};


func int DIA_Mika_Kap3u4u5_PERM_Condition()
{
	if((Kapitel >= 3) && Npc_KnowsInfo(other,DIA_Mika_WOHIN) && Npc_IsDead(Alvares) && Npc_IsDead(Engardo))
	{
		return TRUE;
	};
};

func void DIA_Mika_Kap3u4u5_PERM_Info()
{
	AI_Output(other,self,"DIA_Mika_Kap3u4u5_PERM_15_00");	//��� ����?
	AI_Output(self,other,"DIA_Mika_Kap3u4u5_PERM_12_01");	//�� ��� ��� ���? ���� ��!
};


instance DIA_Mika_PICKPOCKET(C_Info)
{
	npc = Mil_337_Mika;
	nr = 900;
	condition = DIA_Mika_PICKPOCKET_Condition;
	information = DIA_Mika_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_Mika_PICKPOCKET_Condition()
{
	return C_Beklauen(65,75);
};

func void DIA_Mika_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Mika_PICKPOCKET);
	Info_AddChoice(DIA_Mika_PICKPOCKET,Dialog_Back,DIA_Mika_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Mika_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Mika_PICKPOCKET_DoIt);
};

func void DIA_Mika_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Mika_PICKPOCKET);
};

func void DIA_Mika_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Mika_PICKPOCKET);
};

