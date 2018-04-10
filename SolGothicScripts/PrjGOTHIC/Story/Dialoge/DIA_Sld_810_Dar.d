
instance DIA_Dar_EXIT(C_Info)
{
	npc = Sld_810_Dar;
	nr = 999;
	condition = DIA_Dar_EXIT_Condition;
	information = DIA_Dar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dar_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Dar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Dar_Hallo(C_Info)
{
	npc = Sld_810_Dar;
	nr = 1;
	condition = DIA_Dar_Hallo_Condition;
	information = DIA_Dar_Hallo_Info;
	permanent = FALSE;
	description = "��� �� ������?";
};


func int DIA_Dar_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Dar_Hallo_Info()
{
	AI_Output(other,self,"DIA_Dar_Hallo_15_00");	//��� �� ������?
	AI_Output(self,other,"DIA_Dar_Hallo_03_01");	//������ ����������?
	Info_ClearChoices(DIA_Dar_Hallo);
	Info_AddChoice(DIA_Dar_Hallo,"���.",DIA_Dar_Hallo_Nein);
	Info_AddChoice(DIA_Dar_Hallo,"�������.",DIA_Dar_Hallo_Ja);
};

func void DIA_Dar_Hallo_Ja()
{
	AI_Output(other,self,"DIA_Dar_Hallo_Ja_15_00");	//�������.
	CreateInvItem(other,ItMi_Joint);
	B_UseItem(other,ItMi_Joint);
	AI_Output(self,other,"DIA_Dar_Hallo_Ja_03_01");	//�������, ��?
	AI_Output(other,self,"DIA_Dar_Hallo_Ja_15_02");	//��� �� ���� ��� �����?
	CreateInvItem(self,ItMi_Joint);
	B_UseItem(self,ItMi_Joint);
	AI_Output(self,other,"DIA_Dar_Hallo_Ja_03_03");	//� ���� ���� ���������.
	Info_ClearChoices(DIA_Dar_Hallo);
};

func void DIA_Dar_Hallo_Nein()
{
	AI_Output(other,self,"DIA_Dar_Hallo_Nein_15_00");	//���.
	Info_ClearChoices(DIA_Dar_Hallo);
};


var int Dar_einmal;

instance DIA_Dar_PERM(C_Info)
{
	npc = Sld_810_Dar;
	nr = 2;
	condition = DIA_Dar_PERM_Condition;
	information = DIA_Dar_PERM_Info;
	permanent = TRUE;
	description = "�� ���������� ���-������ ����� ����?";
};


func int DIA_Dar_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dar_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Dar_PERM_Info()
{
	AI_Output(other,self,"DIA_Dar_PERM_15_00");	//�� ���������� ���-������ ����� ����?
	if((Dar_LostAgainstCipher == TRUE) && (Dar_einmal == FALSE))
	{
		AI_Output(self,other,"DIA_Dar_PERM_03_01");	//������ � �������� ������ ����������� �������� ���������� ������ ��� �������...
		Dar_einmal = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Dar_PERM_03_02");	//�� �� ������.
	};
};


instance DIA_Dar_WannaJoin(C_Info)
{
	npc = Sld_810_Dar;
	nr = 3;
	condition = DIA_Dar_WannaJoin_Condition;
	information = DIA_Dar_WannaJoin_Info;
	permanent = FALSE;
	description = "� ���� �������������� � ���������. �� �� ����������?";
};


func int DIA_Dar_WannaJoin_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dar_Hallo) && (other.guild == GIL_NONE) && (Dar_LostAgainstCipher == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Dar_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Dar_WannaJoin_15_00");	//� ���� �������������� � ���������. �� �� ����������?
	AI_Output(self,other,"DIA_Dar_WannaJoin_03_01");	//��� ��� �����.
};


instance DIA_Dar_DuDieb(C_Info)
{
	npc = Sld_810_Dar;
	nr = 4;
	condition = DIA_Dar_DuDieb_Condition;
	information = DIA_Dar_DuDieb_Info;
	permanent = FALSE;
	description = "����� ������ ���, ��� ���-�� ����� � ���� ��� �������� �����...";
};


func int DIA_Dar_DuDieb_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cipher_TradeWhat) && (MIS_Cipher_Paket == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Dar_DuDieb_Info()
{
	AI_Output(other,self,"DIA_Dar_DuDieb_15_00");	//����� ������ ���, ��� ���-�� ����� � ���� ��� �������� �����...
	AI_Output(self,other,"DIA_Dar_DuDieb_03_01");	//(������� ��� �����)
	AI_Output(other,self,"DIA_Dar_DuDieb_15_02");	//�� ������ �� ������ �� ����?
	AI_Output(self,other,"DIA_Dar_DuDieb_03_03");	//���.
	Dar_Verdacht = TRUE;
};


instance DIA_Dar_WoPaket(C_Info)
{
	npc = Sld_810_Dar;
	nr = 4;
	condition = DIA_Dar_WoPaket_Condition;
	information = DIA_Dar_WoPaket_Info;
	permanent = TRUE;
	description = "��� ���?";
};


func int DIA_Dar_WoPaket_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dar_DuDieb) && (Dar_Dieb == FALSE) && (MIS_Cipher_Paket == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Dar_WoPaket_Info()
{
	AI_Output(other,self,"DIA_Dar_WoPaket_15_00");	//��� ���?
	if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Dar_WoPaket_03_01");	//������, ������, ������. � ������ ��� ������-�� ������ � ������.
		AI_Output(self,other,"DIA_Dar_WoPaket_03_02");	//��� ���� � ������. � �� �����, ��� �� ��������.
		AI_Output(other,self,"DIA_Dar_WoPaket_15_03");	//�����, ���� ����� ��� ���� ������� ��������?
		AI_Output(self,other,"DIA_Dar_WoPaket_03_04");	//���� ������, � ��� ���������� � ����. � ���������� �� �����������, ��� ���� ������ ��������.
		AI_Output(self,other,"DIA_Dar_WoPaket_03_05");	//��� ���� � ������ ����� �����������������. ��� ���, ��� � �����.
		Dar_Dieb = TRUE;
		B_LogEntry(Topic_CipherPaket,"��� �������, ��� ����� ��� � ������. �� ������ �� � �������� �������� ��������, ����� �����������������.");
	}
	else
	{
		AI_Output(self,other,"DIA_Dar_WoPaket_03_06");	//��� � ���� �����?
	};
};


instance DIA_Dar_AufsMaul(C_Info)
{
	npc = Sld_810_Dar;
	nr = 5;
	condition = DIA_Dar_AufsMaul_Condition;
	information = DIA_Dar_AufsMaul_Info;
	permanent = FALSE;
	description = "� ������ ��� ���������� �� ����!";
};


func int DIA_Dar_AufsMaul_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dar_DuDieb) && (Dar_Dieb == FALSE) && (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_LOST))
	{
		return TRUE;
	};
};

func void DIA_Dar_AufsMaul_Info()
{
	AI_Output(other,self,"DIA_Dar_AufsMaul_15_00");	//� ������ ��� ���������� �� ����!
	AI_Output(self,other,"DIA_Dar_AufsMaul_03_01");	//����������. � ������� ���������, ����� ������� � �����!
	B_GiveInvItems(self,other,ItMi_Joint,1);
	AI_Output(self,other,"DIA_Dar_AufsMaul_03_02");	//���, ��������!
};


instance DIA_Dar_Kameradenschwein(C_Info)
{
	npc = Sld_810_Dar;
	nr = 1;
	condition = DIA_Dar_Kameradenschwein_Condition;
	information = DIA_Dar_Kameradenschwein_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dar_Kameradenschwein_Condition()
{
	if(Dar_LostAgainstCipher == TRUE)
	{
		self.aivar[AIV_LastFightComment] = FALSE;
		return TRUE;
	};
};

func void DIA_Dar_Kameradenschwein_Info()
{
	AI_Output(self,other,"DIA_Dar_Kameradenschwein_03_00");	//������! �� ������ ������, ��� � ���� ��� �����!
	if(Npc_KnowsInfo(other,DIA_Dar_WannaJoin) && (other.guild == GIL_NONE))
	{
		AI_Output(self,other,"DIA_Dar_Kameradenschwein_03_01");	//� �� �� ��� �� ���������� �� ����.
	};
};


instance DIA_Dar_Pilztabak(C_Info)
{
	npc = Sld_810_Dar;
	nr = 6;
	condition = DIA_Dar_Pilztabak_Condition;
	information = DIA_Dar_Pilztabak_Info;
	permanent = FALSE;
	description = "�� �����-������ �������� ������� �����?";
};


func int DIA_Dar_Pilztabak_Condition()
{
	if(Npc_HasItems(other,ItMi_PilzTabak) > 0)
	{
		return TRUE;
	};
};

func void DIA_Dar_Pilztabak_Info()
{
	AI_Output(other,self,"DIA_Dar_Pilztabak_15_00");	//�� �����-������ �������� ������� �����?
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_01");	//������ ���������. ��� ��� ����.
	B_GiveInvItems(other,self,ItMi_PilzTabak,1);
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_02");	//���, ���������...
	CreateInvItem(self,ItMi_Joint);
	B_UseItem(self,ItMi_Joint);
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_03");	//�� �����-������ ����� ��� ���?
	AI_Output(other,self,"DIA_Dar_Pilztabak_15_04");	//��...
	CreateInvItem(self,ItMi_Joint);
	B_UseItem(self,ItMi_Joint);
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_05");	//����� ��� ���?
	AI_Output(other,self,"DIA_Dar_Pilztabak_15_06");	//��� ���� �������...
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_07");	//��, ����!
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_08");	//������ �����!
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_09");	//��� ������ ������� ������! ���� � �� ������� ���������!
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Dar_KAP3_EXIT(C_Info)
{
	npc = Sld_810_Dar;
	nr = 999;
	condition = DIA_Dar_KAP3_EXIT_Condition;
	information = DIA_Dar_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dar_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Dar_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Dar_KAP4_EXIT(C_Info)
{
	npc = Sld_810_Dar;
	nr = 999;
	condition = DIA_Dar_KAP4_EXIT_Condition;
	information = DIA_Dar_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dar_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Dar_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Dar_ORCRING(C_Info)
{
	npc = Sld_810_Dar;
	nr = 4;
	condition = DIA_Dar_ORCRING_Condition;
	information = DIA_Dar_ORCRING_Info;
	description = "������, ����� ��������� �������.";
};


func int DIA_Dar_ORCRING_Condition()
{
	if(Kapitel >= 4)
	{
		return TRUE;
	};
};

func void DIA_Dar_ORCRING_Info()
{
	AI_Output(other,self,"DIA_Dar_ORCRING_15_00");	//������, ����� ��������� �������.
	AI_Output(self,other,"DIA_Dar_ORCRING_03_01");	//�������. ��� ���. ������� ������ ����� ������, � �� ���� � ����� �������� �����.
	AI_Output(self,other,"DIA_Dar_ORCRING_03_02");	//��� �������. � ���� ����� ������ ������ �������� ���� � ��������� �������� ��. ��� ����� ����� ������� ���-������ �������.
	AI_Output(self,other,"DIA_Dar_ORCRING_03_03");	//���� � ����� �������� ��������������, ��� ������������� ������ ������, ��������, � ���� ����� ����� ����� �� �������������� ��.
	Info_ClearChoices(DIA_Dar_ORCRING);
	Info_AddChoice(DIA_Dar_ORCRING,"���� ��� �� ����������.",DIA_Dar_ORCRING_no);
	Info_AddChoice(DIA_Dar_ORCRING,"������ ������? ��?",DIA_Dar_ORCRING_necken);
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_KDF))
	{
		Info_AddChoice(DIA_Dar_ORCRING,"��� ��� ������ ���������?",DIA_Dar_ORCRING_wie);
	};
};

func void DIA_Dar_ORCRING_necken()
{
	AI_Output(other,self,"DIA_Dar_ORCRING_necken_15_00");	//������ ������? ��?
	AI_Output(self,other,"DIA_Dar_ORCRING_necken_03_01");	//��, �����, ��������. ��-�� ������ ��� �����?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Dar_ORCRING_necken_03_02");	//�����-�� ������� ���������� �� ������. ���� ������ ������ �� ������.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Dar_ORCRING_necken_03_03");	//�� ����� ����� ���� ���� � ��� ������ ��� ���� �������.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Dar_ORCRING_necken_03_04");	//���� �� ������ �������� ���� ����� ���������� �����? ������ �� ����.
	};
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Dar_ORCRING_necken_03_05");	//� ����, ���� ��������, ��������� ���� ����� - ������ ��, ��� ��� �����, ����� ��������� �������� �� � ��� ������.
		Info_ClearChoices(DIA_Dar_ORCRING);
		Info_AddChoice(DIA_Dar_ORCRING,"� ���� ��� ������� �� ��� ����.",DIA_Dar_ORCRING_necken_no);
		Info_AddChoice(DIA_Dar_ORCRING,"�����. ��������.",DIA_Dar_ORCRING_necken_schlagen);
	}
	else
	{
		AI_Output(self,other,"DIA_Dar_ORCRING_necken_03_06");	//�� �������. � ����� ������ ���������� ����������� �� ��.
	};
};


var int Dar_FightAgainstPaladin;

func void DIA_Dar_ORCRING_necken_schlagen()
{
	Dar_FightAgainstPaladin = TRUE;
	AI_Output(other,self,"DIA_Dar_ORCRING_necken_schlagen_15_00");	//�����. ��������.
	AI_Output(self,other,"DIA_Dar_ORCRING_necken_schlagen_03_01");	//��, � �� ���� �����.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Dar_ORCRING_necken_no()
{
	AI_Output(other,self,"DIA_Dar_ORCRING_necken_no_15_00");	//� ���� ��� ������� �� ��� ����.
	AI_Output(self,other,"DIA_Dar_ORCRING_necken_no_03_01");	//�, ��. �� �� ������ ����������, ��� � ��� ������. ����. � �����, ��� � ���� ������ ��������.
	AI_StopProcessInfos(self);
};

func void DIA_Dar_ORCRING_wie()
{
	AI_Output(other,self,"DIA_Dar_ORCRING_wie_15_00");	//��� ��� ������ ���������?
	AI_Output(self,other,"DIA_Dar_ORCRING_wie_03_01");	//� �� ���� �����. �����-������ ������ ����� ������ ������� ��.
	AI_Output(self,other,"DIA_Dar_ORCRING_wie_03_02");	//���-������ ����� ������� ������ �����, �� ��� ���-�� �����. �����, ���������� ������� ��� ������, ��, �� �����.
	AI_Output(self,other,"DIA_Dar_ORCRING_wie_03_03");	//� �� ����� ���������� ����������� ��� �����. ��� ��������.
	Log_CreateTopic(TOPIC_Dar_BringOrcEliteRing,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Dar_BringOrcEliteRing,LOG_Running);
	B_LogEntry(TOPIC_Dar_BringOrcEliteRing,"��� ����� ����� ������ ������ � ����� ���������. �� ����� ���������� ������ �����. �����, ���������� �������, ������, ��� ��� ���-������.");
	MIS_Dar_BringOrcEliteRing = LOG_Running;
	Info_ClearChoices(DIA_Dar_ORCRING);
};

func void DIA_Dar_ORCRING_no()
{
	AI_Output(other,self,"DIA_Dar_ORCRING_no_15_00");	//���� ��� �� ����������.
	AI_Output(self,other,"DIA_Dar_ORCRING_no_03_01");	//������� ���. � �� ����� ��������, ���� �� ��� ���� �� ���.
	Info_ClearChoices(DIA_Dar_ORCRING);
};


instance DIA_Dar_FIGHTAGAINSTPALOVER(C_Info)
{
	npc = Sld_810_Dar;
	nr = 4;
	condition = DIA_Dar_FIGHTAGAINSTPALOVER_Condition;
	information = DIA_Dar_FIGHTAGAINSTPALOVER_Info;
	important = TRUE;
};


func int DIA_Dar_FIGHTAGAINSTPALOVER_Condition()
{
	if((Dar_FightAgainstPaladin == TRUE) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL)))
	{
		return TRUE;
	};
};

func void DIA_Dar_FIGHTAGAINSTPALOVER_Info()
{
	AI_Output(self,other,"DIA_Dar_FIGHTAGAINSTPALOVER_03_00");	//������, � ����, ��� �� �� �������� ����������, ���� � ����� �������� � �����.
	AI_Output(self,other,"DIA_Dar_FIGHTAGAINSTPALOVER_03_01");	//� �� ���� �������� ���� ����� ������. ��� ��� ������� �� ����, ������?
	B_GivePlayerXP(XP_Ambient);
	AI_StopProcessInfos(self);
};


instance DIA_Dar_BRINGORCELITERING(C_Info)
{
	npc = Sld_810_Dar;
	nr = 4;
	condition = DIA_Dar_BRINGORCELITERING_Condition;
	information = DIA_Dar_BRINGORCELITERING_Info;
	description = "� ������ ������ �����, ������� �� �����.";
};


func int DIA_Dar_BRINGORCELITERING_Condition()
{
	if((MIS_Dar_BringOrcEliteRing == LOG_Running) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_KDF)) && Npc_HasItems(other,ItRi_OrcEliteRing))
	{
		return TRUE;
	};
};

func void DIA_Dar_BRINGORCELITERING_Info()
{
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_15_00");	//� ������ ������ �����, ������� �� �����.
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_03_01");	//��� �� ��� ������ ���?
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_15_02");	//������ ������������ �����.
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_03_03");	//�� ��, � ����� ������... ��� �� ������ �� ����?
	MIS_Dar_BringOrcEliteRing = LOG_SUCCESS;
	Info_ClearChoices(DIA_Dar_BRINGORCELITERING);
	Info_AddChoice(DIA_Dar_BRINGORCELITERING,"��� �� ������ ���������� ���?",DIA_Dar_BRINGORCELITERING_was);
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		Info_AddChoice(DIA_Dar_BRINGORCELITERING,"������� ��� �������.",DIA_Dar_BRINGORCELITERING_geld);
	};
};

func void DIA_Dar_BRINGORCELITERING_geld()
{
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_geld_15_00");	//������� ��� �������.
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_geld_03_01");	//���. 600 ������� �����?
		AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_geld_15_02");	//���?
	};
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_geld_03_03");	//�����. � ��� ���� 1200 �����.
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_geld_03_04");	//������� �� ��� ������ ���� ��� ������.
	};
	Info_ClearChoices(DIA_Dar_BRINGORCELITERING);
	Info_AddChoice(DIA_Dar_BRINGORCELITERING,"����� ������������.",DIA_Dar_BRINGORCELITERING_geld_no);
	Info_AddChoice(DIA_Dar_BRINGORCELITERING,"������������.",DIA_Dar_BRINGORCELITERING_geld_ok);
};

func void DIA_Dar_BRINGORCELITERING_geld_ok()
{
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_geld_ok_15_00");	//������������. ����� ������.
	B_GiveInvItems(other,self,ItRi_OrcEliteRing,1);
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_geld_ok_03_01");	//�������. �� �������� ��������, ��� ������ ������ �� ����.
	CreateInvItems(self,ItMi_Gold,1200);
	B_GiveInvItems(self,other,ItMi_Gold,1200);
	B_GivePlayerXP(XP_Dar_BringOrcEliteRing);
	Info_ClearChoices(DIA_Dar_BRINGORCELITERING);
};

func void DIA_Dar_BRINGORCELITERING_geld_no()
{
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_geld_no_15_00");	//����� ������������.
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_geld_no_03_01");	//� � �����, ��� ��� ������� �����. ���� ������ �� �������� ���. �� ���� �������.
	Info_ClearChoices(DIA_Dar_BRINGORCELITERING);
};

func void DIA_Dar_BRINGORCELITERING_was()
{
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_was_15_00");	//��� �� ������ ���������� ���?
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_was_03_01");	//���� ������� ������, ���� ���� ������, ������� �... ��, ������, �������� �������.
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_was_03_02");	//�� ������� ���� ��������. � ��� ��������� ���.
	Info_ClearChoices(DIA_Dar_BRINGORCELITERING);
	Info_AddChoice(DIA_Dar_BRINGORCELITERING,"������� ��� �������.",DIA_Dar_BRINGORCELITERING_geld);
	Info_AddChoice(DIA_Dar_BRINGORCELITERING,"����� ��� ������.",DIA_Dar_BRINGORCELITERING_was_am);
};

func void DIA_Dar_BRINGORCELITERING_was_am()
{
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_was_am_15_00");	//����� ��� ������.
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_was_am_03_01");	//�������. ����� �� �������� ���� �������. ������ ����� ��� ��� ������.
	B_GiveInvItems(other,self,ItRi_OrcEliteRing,1);
	CreateInvItems(self,ItAm_Dex_01,1);
	B_GiveInvItems(self,other,ItAm_Dex_01,1);
	B_GivePlayerXP(XP_Dar_BringOrcEliteRing);
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_was_am_03_02");	//������ � ��������.
	Info_ClearChoices(DIA_Dar_BRINGORCELITERING);
};


instance DIA_Dar_KAP5_EXIT(C_Info)
{
	npc = Sld_810_Dar;
	nr = 999;
	condition = DIA_Dar_KAP5_EXIT_Condition;
	information = DIA_Dar_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dar_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Dar_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Dar_KAP6_EXIT(C_Info)
{
	npc = Sld_810_Dar;
	nr = 999;
	condition = DIA_Dar_KAP6_EXIT_Condition;
	information = DIA_Dar_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dar_KAP6_EXIT_Condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Dar_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Dar_PICKPOCKET(C_Info)
{
	npc = Sld_810_Dar;
	nr = 900;
	condition = DIA_Dar_PICKPOCKET_Condition;
	information = DIA_Dar_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_Dar_PICKPOCKET_Condition()
{
	return C_Beklauen(67,35);
};

func void DIA_Dar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Dar_PICKPOCKET);
	Info_AddChoice(DIA_Dar_PICKPOCKET,Dialog_Back,DIA_Dar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Dar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Dar_PICKPOCKET_DoIt);
};

func void DIA_Dar_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Dar_PICKPOCKET);
};

func void DIA_Dar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Dar_PICKPOCKET);
};

