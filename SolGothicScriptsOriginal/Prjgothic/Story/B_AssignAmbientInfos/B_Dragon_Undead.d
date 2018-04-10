
func void B_Dragon_Undead_Bla()
{
	AI_Output(self,other,"DIA_Addon_UndeadDragon_Add_20_00");	//��, �����? � ���� ���� ��������?
};


instance DIA_Dragon_Undead_Exit(C_Info)
{
	npc = Dragon_Undead;
	nr = 999;
	condition = DIA_Dragon_Undead_Exit_Condition;
	information = DIA_Dragon_Undead_Exit_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dragon_Undead_Exit_Condition()
{
	if(DragonTalk_Exit_Free == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Dragon_Undead_Exit_Info()
{
	AI_StopProcessInfos(self);
	DragonTalk_Exit_Free = FALSE;
	self.flags = 0;
};


instance DIA_Dragon_Undead_Hello(C_Info)
{
	npc = Dragon_Undead;
	nr = 5;
	condition = DIA_Dragon_Undead_Hello_Condition;
	information = DIA_Dragon_Undead_Hello_Info;
	important = TRUE;
};


func int DIA_Dragon_Undead_Hello_Condition()
{
	if(Npc_HasItems(other,ItMi_InnosEye_MIS) >= 1)
	{
		return TRUE;
	};
};

func void DIA_Dragon_Undead_Hello_Info()
{
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_20_00");	//���� ���-���� ������� ����� ����. � ����� ���� ������ �������.
	AI_Output(other,self,"DIA_Dragon_Undead_Hello_15_01");	//�� �����. �� ���, ��� �� ��� ��� ����������.
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_20_02");	//(������ �������) ��� �� ������ � ���� ����������?
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_20_03");	//����� � �� ������ � ���� ������, ����� ������� ���� �� ��� ����?
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_20_04");	//����� � �� �������� ����� � ���� �����������, ����� �����, ��� �� �� ��� �� �������� ��?
	if((hero.guild == GIL_DJG) && (DragonEggCounter >= 7))
	{
		AI_Output(self,other,"DIA_Dragon_Undead_Hello_20_05");	//� ����� �������� ����, �� ������� ������� ���� �������, �� ������� ���� ��������� �� ����?
	};
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Dragon_Undead_Hello_20_06");	//����� ���������� �������� ���� ������������� �������� ��� ����, ����� ������ ����, ����������� ���?
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Dragon_Undead_Hello_20_07");	//����� ��������� ��  ������ ������� ���� ������������� �������� ��� ����, ����� ������ ����, ����������� ���?
	};
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_20_08");	//��� �� �� �� �������������, �� �� ������ ��������� �� ���� ����.
	AI_Output(self,other,"DIA_Addon_UndeadDragon_Add_20_01");	//���� ������ ���� ����, ������� �� ���� ��������������!
	AI_Output(self,other,"DIA_Addon_UndeadDragon_Add_20_02");	//�� ���� ������ �� ���� ����! �� ������ ��� ����� ������.
	AI_Output(self,other,"DIA_Addon_UndeadDragon_Add_20_03");	//��� � ����, ������ ��� ������ ��. �� ��� ���������� �� ������ ������!
	Info_AddChoice(DIA_Dragon_Undead_Hello,"������ �������.",DIA_Dragon_Undead_Hello_attack);
	Info_AddChoice(DIA_Dragon_Undead_Hello,"�� ����� ��������� �� ������ ����� ����������� �� ����� ������ ������������?",DIA_Dragon_Undead_Hello_Auftraggeber);
	Info_AddChoice(DIA_Dragon_Undead_Hello,"����� �� �����?",DIA_Dragon_Undead_Hello_warum);
	Info_AddChoice(DIA_Dragon_Undead_Hello,"��� ��?",DIA_Dragon_Undead_Hello_wer);
	B_LogEntry(TOPIC_HallenVonIrdorath,"������ ��� ���� - ������-������. � ������ ����� ���, ������ ��� ����� �������� ���� ��������� ������.");
};

func void DIA_Dragon_Undead_Hello_wer()
{
	AI_Output(other,self,"DIA_Dragon_Undead_Hello_wer_15_00");	//��� ��?
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_01");	//(�������) �� ��� �� ����� �������� ���� ������? ����� ������ ����, ������. �� �������, ��� �.
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_02");	//� ���� ��� �����. ��� ��, ��� ��� ����� � � ����.
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_03");	//���� ���������� ��� ���� ������������ ����. ����� ��� �� �������� �����, ������ ���� ����� �����.
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_04");	//��� ������ - ����������� ����� ����.
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_05");	//��� ��, ��� ���� ������ ������������ �������� � ������������� ��������.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_06");	//��� ��, ��� ���� ���� ����� ������ ������������ ���������, ������� �� ��������.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_07");	//��� ��, ��� ���� ������ - ������������� ���� � ������, ��� ����.
	};
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_08");	//����� �� �� �������� �����, ������� ��������� ���? ��. �� ������ ��� �.
	AI_Output(other,self,"DIA_Dragon_Undead_Hello_wer_15_09");	//(��������) ���. ����� �� ����� ����. ������� ������ ������� ...
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_10");	//������� ����, � �� ������������ ������ ��� ����. �� ���� ������� ������������� ���.
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_11");	//��� ��������������. ������ ����� ������� ���� ������.
};

func void DIA_Dragon_Undead_Hello_warum()
{
	AI_Output(other,self,"DIA_Dragon_Undead_Hello_warum_15_00");	//����� �� �����?
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_warum_20_01");	//��������������, ���������� ���, ����������� ���� ��������� ���� ��� � ���� ����������.
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_warum_20_02");	//������ ����� ��������� ����� ����������� �����, ����� �, �������, ����� �����.
};

func void DIA_Dragon_Undead_Hello_Auftraggeber()
{
	AI_Output(other,self,"DIA_Dragon_Undead_Hello_Auftraggeber_15_00");	//�� ����� ��������� �� ������ ����� ����������� �� ����� ������ ������������?
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_Auftraggeber_20_01");	//��� ������ - ������� ����. �� ������ ���. �� ������ ������� ��� ���.
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_Auftraggeber_20_03");	//��� ����� ���������� ��-��� ����� � ��� ������ �� ����� � ������� ���� ��� �������� ����.
};

func void DIA_Dragon_Undead_Hello_attack()
{
	AI_Output(other,self,"DIA_Dragon_Undead_Hello_attack_15_00");	//������ �������. � ������ ���� ������� ��� ������, ��-��� �������� �� �����, ������.
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_attack_20_01");	//(�������) �� ��� �� ����� �������� ����. �����-�� ��������� �������� ���� �� ���������� ���� ����.
	if(C_ScHasEquippedBeliarsWeapon() || C_ScHasReadiedBeliarsWeapon() || C_SCHasBeliarsRune())
	{
		AI_Output(self,other,"DIA_Addon_UndeadDragon_Add_20_04");	//�� ������������� ������, ��� ������ ������ ���� ������? (�������)
	};
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_attack_20_02");	//���� ����� ������� ��� ��������� ����� ������ � ���� ���.
	Npc_RemoveInvItems(other,ItMi_InnosEye_MIS,1);
	CreateInvItems(other,ItMi_InnosEye_Discharged_Mis,1);
	AI_StopProcessInfos(self);
	DragonTalk_Exit_Free = FALSE;
	self.flags = 0;
};

