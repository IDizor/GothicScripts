
instance DIA_Dragon_Fire_Exit(C_Info)
{
	nr = 999;
	condition = DIA_Dragon_Fire_Exit_Condition;
	information = DIA_Dragon_Fire_Exit_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dragon_Fire_Exit_Condition()
{
	if(DragonTalk_Exit_Free == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Dragon_Fire_Exit_Info()
{
	Npc_RemoveInvItems(other,ItMi_InnosEye_MIS,1);
	CreateInvItems(other,ItMi_InnosEye_Discharged_Mis,1);
	AI_Output(self,other,"DIA_Dragon_Fire_Exit_20_00");	//���� ������� ���� ����, � ���� �� ������ �� ��������� ����.
	AI_StopProcessInfos(self);
	DragonTalk_Exit_Free = FALSE;
	self.flags = 0;
	if(DJG_Biff_Stay == TRUE)
	{
		B_StartOtherRoutine(Biff,"Follow");
		DJG_Biff_Stay = FALSE;
	};
};


instance DIA_Dragon_Fire_Hello(C_Info)
{
	nr = 1;
	condition = DIA_Dragon_Fire_Hello_Condition;
	information = DIA_Dragon_Fire_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dragon_Fire_Hello_Condition()
{
	if(Npc_HasItems(other,ItMi_InnosEye_MIS) >= 1)
	{
		return 1;
	};
};

func void DIA_Dragon_Fire_Hello_Info()
{
	AI_Output(self,other,"DIA_Dragon_Fire_Hello_20_00");	//�������� �� ����, ��� ��� ��������� ����, ������� ������ ���� ����� �� ��, ����� ������ ������� ������ �������.
	if(MIS_KilledDragons == 0)
	{
		AI_Output(other,self,"DIA_Dragon_Fire_Hello_15_01");	//�� �������� ����� �������� ��� ������ ����������� �������.
	};
	AI_Output(other,self,"DIA_Dragon_Fire_Hello_15_02");	//� ������ �� �����, ����� ������� ����. �����, ���� ��� ��������� ����� ����������.
	AI_Output(self,other,"DIA_Dragon_Fire_Hello_20_03");	//�� ������ �������, ��� ����� ������� ���� �� ���?
	AI_Output(self,other,"DIA_Dragon_Fire_Hello_20_04");	//��-��-��. � ������ ���� ������� ���.
	AI_Output(other,self,"DIA_Dragon_Fire_Hello_15_05");	//�� ��� ������, ������. �� ���� ���� ������. �� �� ������ �������������� ���� ����. ������� �� ��� �������, ����� ���� ���� ����������� ������.
	AI_Output(self,other,"DIA_Dragon_Fire_Hello_20_06");	//(�����) ��-�. ����� ������� ���� ������ �������, ���� ��� ������. ���� ���� ����� �� ���������.
};


instance DIA_Dragon_Fire_WerBistDu(C_Info)
{
	nr = 5;
	condition = DIA_Dragon_Fire_WerBistDu_Condition;
	information = DIA_Dragon_Fire_WerBistDu_Info;
	description = "��� ��?";
};


func int DIA_Dragon_Fire_WerBistDu_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dragon_Fire_Hello))
	{
		return TRUE;
	};
};

func void DIA_Dragon_Fire_WerBistDu_Info()
{
	AI_Output(other,self,"DIA_Dragon_Fire_WerBistDu_15_00");	//��� ��?
	AI_Output(self,other,"DIA_Dragon_Fire_WerBistDu_20_01");	//���� ����� ��������, � ��� ���, ��� �� ������� ��� ���.
	AI_Output(self,other,"DIA_Dragon_Fire_WerBistDu_20_02");	//����� ���� �������� ���� �����, �� ������� � ����.
};


instance DIA_Dragon_Fire_HORT(C_Info)
{
	nr = 5;
	condition = DIA_Dragon_Fire_HORT_Condition;
	information = DIA_Dragon_Fire_HORT_Info;
	description = "��� ���� ������������?";
};


func int DIA_Dragon_Fire_HORT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dragon_Fire_Hello))
	{
		return TRUE;
	};
};

func void DIA_Dragon_Fire_HORT_Info()
{
	AI_Output(other,self,"DIA_Dragon_Fire_HORT_15_00");	//� ������� ������� ���� ������������, ��� �� ������ ���� ���������. � ��� ���� ������������?
	AI_Output(self,other,"DIA_Dragon_Fire_HORT_20_01");	//� �����, ������� ����� ���������� ��� ����, ����� � ���������� �� �� �����.
	AI_Output(self,other,"DIA_Dragon_Fire_HORT_20_02");	//� ����� ���� ��������� ������ � ���� ������� ������, ���� ����������� ���������� ��������� ������ ���������� �������� ����� ����.
};

func void B_AssignDragonTalk_Fire(var C_Npc slf)
{
	DIA_Dragon_Fire_Exit.npc = Hlp_GetInstanceID(slf);
	DIA_Dragon_Fire_Hello.npc = Hlp_GetInstanceID(slf);
	DIA_Dragon_Fire_WerBistDu.npc = Hlp_GetInstanceID(slf);
	DIA_Dragon_Fire_HORT.npc = Hlp_GetInstanceID(slf);
	B_AssignDragonTalk_Main(slf);
};

