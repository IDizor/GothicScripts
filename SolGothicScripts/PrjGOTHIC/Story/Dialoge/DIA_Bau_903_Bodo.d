
instance DIA_Bodo_EXIT(C_Info)
{
	npc = Bau_903_Bodo;
	nr = 999;
	condition = DIA_Bodo_EXIT_Condition;
	information = DIA_Bodo_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bodo_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Bodo_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Bodo_Hallo(C_Info)
{
	npc = Bau_903_Bodo;
	nr = 1;
	condition = DIA_Bodo_Hallo_Condition;
	information = DIA_Bodo_Hallo_Info;
	permanent = TRUE;
	description = "��� ����?";
};


func int DIA_Bodo_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Bodo_Hallo_Info()
{
	AI_Output(other,self,"DIA_Bodo_Hallo_15_00");	//��� ����?
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Bodo_Hallo_12_01");	//��������� ���������� ������ ����� �����. ������, ����� �� ����� ������� ��������, ��� �� ��������� ���� ���������� �����.
		AI_Output(self,other,"DIA_Bodo_Hallo_12_02");	//������, ��������, ������, ��� ����� ��������� ���� ���. �� �� ������ �� ����� ������� ���!
	};
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Bodo_Hallo_12_03");	//������. ���� ������� ���������, ����� �� ������� ������.
	};
	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Bodo_Hallo_12_04");	//������. �� �������� � ����� �����.
	};
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Bodo_Hallo_12_05");	//����������� ������ �� ����� �� ���� �����.
		AI_Output(self,other,"DIA_Bodo_Hallo_12_06");	//������ �����, �������� �� ��������� ���������� � �����, �� ������������ ���� �� ���� �� ��������.
	};
};


instance DIA_Bodo_Bauernaufstand(C_Info)
{
	npc = Bau_903_Bodo;
	nr = 2;
	condition = DIA_Bodo_Bauernaufstand_Condition;
	information = DIA_Bodo_Bauernaufstand_Info;
	permanent = FALSE;
	description = "� ������ ������� � ��������� ��������!";
};


func int DIA_Bodo_Bauernaufstand_Condition()
{
	return TRUE;
};

func void DIA_Bodo_Bauernaufstand_Info()
{
	AI_Output(other,self,"DIA_Bodo_Bauernaufstand_15_00");	//� ������ ������� � ��������� ��������!
	AI_Output(self,other,"DIA_Bodo_Bauernaufstand_12_01");	//����. �� �� ������ ������ ������. ������ �������� ��, ��� ���������� ������� ������.
	AI_Output(self,other,"DIA_Bodo_Bauernaufstand_12_02");	//�������� ������, ��� ����� ������������ �� ������ ��������. �� ���� ������ �� ���������� ������ ������ � ��������, ��� ������ ���� ���� �����.
};


instance DIA_Bodo_Bett(C_Info)
{
	npc = Bau_903_Bodo;
	nr = 3;
	condition = DIA_Bodo_Bett_Condition;
	information = DIA_Bodo_Bett_Info;
	permanent = FALSE;
	description = "���� � ���-������ ����� ���������?";
};


func int DIA_Bodo_Bett_Condition()
{
	return TRUE;
};

func void DIA_Bodo_Bett_Info()
{
	AI_Output(other,self,"DIA_Bodo_Bett_15_00");	//���� � ���-������ ����� ���������?
	AI_Output(self,other,"DIA_Bodo_Bett_12_01");	//���� �� �����, ��� ����� �������, ��� � �����. �� ������ �� ������ �� ������ �� ������� ��������.
	AI_Output(self,other,"DIA_Bodo_Bett_12_02");	//���� ������, ����� ��� �� ������� ���, ��������, �� ��� �� �������� �������, �� ���������� �� �����. � ���� �������� ����� ������ ���, ��� ��������.
};


instance DIA_Bodo_Cipher(C_Info)
{
	npc = Bau_903_Bodo;
	nr = 4;
	condition = DIA_Bodo_Cipher_Condition;
	information = DIA_Bodo_Cipher_Info;
	permanent = FALSE;
	description = "����� ������ ���, ��� ���-�� ����� � ���� ��� �������� ����� ...";
};


func int DIA_Bodo_Cipher_Condition()
{
	if((MIS_Cipher_BringWeed == LOG_Running) || (MIS_Cipher_Paket == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Bodo_Cipher_Info()
{
	AI_Output(other,self,"DIA_Bodo_Cipher_15_00");	//����� ������ ���, ��� ���-�� ����� � ���� ��� �������� ����� ...
	AI_Output(self,other,"DIA_Bodo_Cipher_12_01");	//�?
	AI_Output(other,self,"DIA_Bodo_Cipher_15_02");	//�� ������, ��� ��� ������ ��.
	AI_Output(self,other,"DIA_Bodo_Cipher_12_03");	//��, ��� ������ ���� ������ ��� ����� ��� ������� �� ����.
	AI_Output(self,other,"DIA_Bodo_Cipher_12_04");	//� �������� ���� � ��� ����������� ����������� ��������� �����, ������ ���, ������, ��� ����� ������ ��� �����.
	AI_Output(self,other,"DIA_Bodo_Cipher_12_05");	//�� � ������ �� ���� ��������. � �������� ��������� ���, � �� � ����� ������� ���, ��� ����� ����� ����� ����.
};


instance DIA_Bodo_WeedOrElse(C_Info)
{
	npc = Bau_903_Bodo;
	nr = 5;
	condition = DIA_Bodo_WeedOrElse_Condition;
	information = DIA_Bodo_WeedOrElse_Info;
	permanent = FALSE;
	description = "����� ��� ��� ����� ��� ...";
};


func int DIA_Bodo_WeedOrElse_Condition()
{
	if((MIS_Cipher_BringWeed == LOG_Running) && Npc_KnowsInfo(other,DIA_Bodo_Cipher))
	{
		return TRUE;
	};
};

func void DIA_Bodo_WeedOrElse_Info()
{
	AI_Output(other,self,"DIA_Bodo_WeedOrElse_15_00");	//����� ��� ��� ����� ��� ...
	AI_Output(self,other,"DIA_Bodo_WeedOrElse_12_01");	//��������, ���, ��� � ���� ���� - ��� ���� ����� �� �������� �����. ������ ��� � ������ ���� � �����.
	B_GiveInvItems(self,other,ItMi_Joint,1);
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Bodo_WeedOrElse_12_02");	//�� ������, ��� �������� ����� �������� ���, �?
		AI_Output(self,other,"DIA_Bodo_WeedOrElse_12_03");	//��� ��� ���� �� ������� ������� �����-������ ��������!
	};
};


instance DIA_Bodo_WeedPERM(C_Info)
{
	npc = Bau_903_Bodo;
	nr = 6;
	condition = DIA_Bodo_WeedPERM_Condition;
	information = DIA_Bodo_WeedPERM_Info;
	permanent = TRUE;
	description = "� �� ���� �� ������ ������ �����. ����� ��� ��� �����!";
};


func int DIA_Bodo_WeedPERM_Condition()
{
	if((MIS_Cipher_BringWeed == LOG_Running) && Npc_KnowsInfo(other,DIA_Bodo_WeedOrElse))
	{
		return TRUE;
	};
};

func void DIA_Bodo_WeedPERM_Info()
{
	AI_Output(other,self,"DIA_Bodo_WeedPERM_15_00");	//� �� ���� �� ������ ������ �����. ����� ��� ��� �����!
	AI_Output(self,other,"DIA_Bodo_WeedPERM_12_01");	//� ���� �� ���. ������.
};


instance DIA_Bodo_PICKPOCKET(C_Info)
{
	npc = Bau_903_Bodo;
	nr = 900;
	condition = DIA_Bodo_PICKPOCKET_Condition;
	information = DIA_Bodo_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Bodo_PICKPOCKET_Condition()
{
	return C_Beklauen(30,60);
};

func void DIA_Bodo_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Bodo_PICKPOCKET);
	Info_AddChoice(DIA_Bodo_PICKPOCKET,Dialog_Back,DIA_Bodo_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Bodo_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Bodo_PICKPOCKET_DoIt);
};

func void DIA_Bodo_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Bodo_PICKPOCKET);
};

func void DIA_Bodo_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Bodo_PICKPOCKET);
};

