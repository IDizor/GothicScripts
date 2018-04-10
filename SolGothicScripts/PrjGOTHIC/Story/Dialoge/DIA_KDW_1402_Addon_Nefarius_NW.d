
instance DIA_Addon_Nefarius_EXIT(C_Info)
{
	npc = KDW_1402_Addon_Nefarius_NW;
	nr = 999;
	condition = DIA_Addon_Nefarius_EXIT_Condition;
	information = DIA_Addon_Nefarius_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Nefarius_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Nefarius_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Nefarius_Hallo(C_Info)
{
	npc = KDW_1402_Addon_Nefarius_NW;
	nr = 5;
	condition = DIA_Addon_Nefarius_Hallo_Condition;
	information = DIA_Addon_Nefarius_Hallo_Info;
	description = "��� ����?";
};


func int DIA_Addon_Nefarius_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Addon_Nefarius_Hallo_Info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_Hallo_15_00");	//��� ����?
	AI_Output(self,other,"DIA_Addon_Nefarius_Hallo_05_01");	//� ��� �� ����� �������? ��� ��� �������!
	AI_Output(self,other,"DIA_Addon_Nefarius_Hallo_05_02");	//� �����, �� �����.
	AI_Output(other,self,"DIA_Addon_Nefarius_Hallo_15_03");	//�����.
	AI_Output(self,other,"DIA_Addon_Nefarius_Hallo_05_04");	//��-�� ���� �������� ������� ���, �� ������ �� ����? �������� ���� �� ������ - �� ������� ��������� ������ ��� �� ����.
};


instance DIA_Addon_Nefarius_keineahnung(C_Info)
{
	npc = KDW_1402_Addon_Nefarius_NW;
	nr = 5;
	condition = DIA_Addon_Nefarius_keineahnung_Condition;
	information = DIA_Addon_Nefarius_keineahnung_Info;
	description = "��� ��� �� ������?";
};


func int DIA_Addon_Nefarius_keineahnung_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Nefarius_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_keineahnung_Info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_keineahnung_15_00");	//��� ��� �� ������?
	AI_Output(self,other,"DIA_Addon_Nefarius_keineahnung_05_01");	//�� �������, ��� �� ����� � ���������� ������, � ������� ��������� ����� ������� �����������.
	AI_Output(self,other,"DIA_Addon_Nefarius_keineahnung_05_02");	//�� ���� �� �������� ��������� ���� ������������� ����� �����.
	AI_Output(self,other,"DIA_Addon_Nefarius_keineahnung_05_03");	//������� ������ ����� ������������ ��� ���������� �� �������. ����� ���������...
};


instance DIA_Addon_Nefarius_WieMechanik(C_Info)
{
	npc = KDW_1402_Addon_Nefarius_NW;
	nr = 5;
	condition = DIA_Addon_Nefarius_WieMechanik_Condition;
	information = DIA_Addon_Nefarius_WieMechanik_Info;
	description = "�� ������, ��� ������������ ������?";
};


func int DIA_Addon_Nefarius_WieMechanik_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Nefarius_keineahnung))
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_WieMechanik_Info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_WieMechanik_15_00");	//�� ������, ��� ������������ ������?
	AI_Output(self,other,"DIA_Addon_Nefarius_WieMechanik_05_01");	//������, ��� ��������� ����� ��������� ������������ � ����.
	AI_Output(self,other,"DIA_Addon_Nefarius_WieMechanik_05_03");	//��-�� � ����� ���, ����� ������� ������.
	AI_Output(self,other,"DIA_Addon_Nefarius_WieMechanik_05_02");	//���� ������ ����� ����� � ������������ ���������� ����� � ��������.
};


instance DIA_Addon_Nefarius_SCbringOrnaments(C_Info)
{
	npc = KDW_1402_Addon_Nefarius_NW;
	nr = 5;
	condition = DIA_Addon_Nefarius_SCbringOrnaments_Condition;
	information = DIA_Addon_Nefarius_SCbringOrnaments_Info;
	description = "� ������ ����� ���������.";
};


func int DIA_Addon_Nefarius_SCbringOrnaments_Condition()
{
	if(MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_SCbringOrnaments_Info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_SCbringOrnaments_15_00");	//� ������ ����� ���������.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_01");	//������? ��� ������������.
	AI_Output(other,self,"DIA_Addon_Nefarius_SCbringOrnaments_15_02");	//�� ������, ��� ��������� �����?
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_03");	//���� ������ ������� ���������, ���� ��� �������� �� ������ �����.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_04");	//��� ����� ��� ��� ��������� �� �������...
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_05");	//� ������� ���������� ��� ������� ������������ ��������� �������.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_06");	//��� ��������� �� �����, ��� ���� �������� ����� ���������.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_07");	//��� ����� � ������� ��� �� ���� �����.
	CreateInvItems(self,ItWr_Map_NewWorld_Ornaments_Addon,1);
	B_GiveInvItems(self,other,ItWr_Map_NewWorld_Ornaments_Addon,1);
	MIS_Addon_Nefarius_BringMissingOrnaments = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_Ornament,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Ornament,LOG_Running);
	B_LogEntry(TOPIC_Addon_Ornament,"���� ���� ����� ������, ������� ����� � ����������� ����� ��������.");
	B_LogEntry(TOPIC_Addon_Ornament,"�������� ����� ������������ ������ ��� ������ ����������� ������. ��� ��� ��� �� ������� ���� ������ ����� ������. � ������ ����� ��. �� ��� ��� �����, �� ������� �������� �����, ��� � ������ ������ ���������.");
	B_StartOtherRoutine(BAU_4300_Addon_Cavalorn,"OrnamentSteinring");
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_08");	//�� ������ ������ ����� ����� ������ ���.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_09");	//������� �������� �� ������� ���������. ��� ����� ���� ����������������, �� ��� �� ����� �����������.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_10");	//��� ����� ���� ��� ������: �����, ���� ������, �������� ��� ���-������ ��������.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_11");	//�� � ���� ��� ��������? �� ��� ��� �������. �����!
};


instance DIA_Addon_Nefarius_WhyPortalClosed(C_Info)
{
	npc = KDW_1402_Addon_Nefarius_NW;
	nr = 5;
	condition = DIA_Addon_Nefarius_WhyPortalClosed_Condition;
	information = DIA_Addon_Nefarius_WhyPortalClosed_Info;
	description = "��� ���� �������� ��� ������?";
};


func int DIA_Addon_Nefarius_WhyPortalClosed_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Nefarius_SCbringOrnaments))
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_WhyPortalClosed_Info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_WhyPortalClosed_15_00");	//��� ���� �������� ��� ������?
	AI_Output(self,other,"DIA_Addon_Nefarius_WhyPortalClosed_05_01");	//���, ��� ������ ���, �� �����, ����� ������ ������� �����.
	AI_Output(self,other,"DIA_Addon_Nefarius_WhyPortalClosed_05_02");	//��� ������ � ������ ��� �������, ��� ������ ���������, ��� ����� ���� ����������� �� ���� ��������.
	AI_Output(self,other,"DIA_Addon_Nefarius_WhyPortalClosed_05_03");	//� ��� ���� ������ ������� ������� ������ � ���� ������.
	AI_Output(self,other,"DIA_Addon_Nefarius_WhyPortalClosed_05_04");	//�� �� �����, ��� ��� ��� ����, �� ����� ������� ��� ����� �� ��������...
};


instance DIA_Addon_Nefarius_MissingOrnaments(C_Info)
{
	npc = KDW_1402_Addon_Nefarius_NW;
	nr = 5;
	condition = DIA_Addon_Nefarius_MissingOrnaments_Condition;
	information = DIA_Addon_Nefarius_MissingOrnaments_Info;
	permanent = TRUE;
	description = "������ ��������� ����������...";
};


func int DIA_Addon_Nefarius_MissingOrnaments_Condition()
{
	if(MIS_Addon_Nefarius_BringMissingOrnaments == LOG_Running)
	{
		return TRUE;
	};
};


var int MissingOrnamentsCounter;
const int Addon_NefariussMissingOrnamentsOffer = 100;

func void DIA_Addon_Nefarius_MissingOrnaments_Info()
{
	var int MissingOrnamentsCount;
	var int XP_Addon_BringMissingOrnaments;
	var int MissingOrnamentsGeld;
	var string concatText;
	AI_Output(other,self,"DIA_Addon_Nefarius_MissingOrnaments_15_00");	//������ ��������� ����������...
	AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_01");	//��?
	if(Npc_HasItems(other,ItMi_Ornament_Addon) >= 1)
	{
		MissingOrnamentsCount = Npc_HasItems(other,ItMi_Ornament_Addon);
		if(MissingOrnamentsCount == 1)
		{
			AI_Output(other,self,"DIA_Addon_Nefarius_MissingOrnaments_15_02");	//� ����� ��� ����.
			B_GivePlayerXP(XP_Addon_BringMissingOrnament);
			Npc_RemoveInvItems(other,ItMi_Ornament_Addon,1);
			AI_PrintScreen(PRINT_ItemGegeben,-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
			MissingOrnamentsCounter = MissingOrnamentsCounter + 1;
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Nefarius_MissingOrnaments_15_03");	//� ����� ��.
			Npc_RemoveInvItems(other,ItMi_Ornament_Addon,MissingOrnamentsCount);
			concatText = ConcatStrings(IntToString(MissingOrnamentsCount),PRINT_ItemsGegeben);
			AI_PrintScreen(concatText,-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
			XP_Addon_BringMissingOrnaments = MissingOrnamentsCount * XP_Addon_BringMissingOrnament;
			MissingOrnamentsCounter = MissingOrnamentsCounter + MissingOrnamentsCount;
			B_GivePlayerXP(XP_Addon_BringMissingOrnaments);
		};
		AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_04");	//�������!
		if(MissingOrnamentsCounter == 1)
		{
			AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_05");	//�������� ����� ��� ���. �����, �� ����������.
		}
		else if(MissingOrnamentsCounter == 2)
		{
			AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_06");	//����� ��� ����, � ��� ����� � ��� ���.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_07");	//������ � ��� ���� ��� �����. �������� �� �������.
			AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_08");	//�� ���������� ���� ������������ ����, ����� ������� �� ���������� ������.
			MIS_Addon_Nefarius_BringMissingOrnaments = LOG_SUCCESS;
		};
		AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_09");	//���, ������ � ������� ��� ������.
		MissingOrnamentsGeld = MissingOrnamentsCount * Addon_NefariussMissingOrnamentsOffer;
		CreateInvItems(self,ItMi_Gold,MissingOrnamentsGeld);
		B_GiveInvItems(self,other,ItMi_Gold,MissingOrnamentsGeld);
		if(MIS_Addon_Nefarius_BringMissingOrnaments == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_10");	//������ �� ����!
			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self,"PreRingritual");
			B_StartOtherRoutine(KDW_1400_Addon_Saturas_NW,"PreRingritual");
			B_StartOtherRoutine(KDW_1401_Addon_Cronos_NW,"PreRingritual");
			B_StartOtherRoutine(KDW_1403_Addon_Myxir_NW,"PreRingritual");
			B_StartOtherRoutine(KDW_1404_Addon_Riordian_NW,"PreRingritual");
			B_StartOtherRoutine(KDW_1405_Addon_Merdarion_NW,"PreRingritual");
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Nefarius_MissingOrnaments_15_11");	//�������, ������� ����� ����������?
		AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_12");	//������...
		AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_13");	//�� ������� ���������� ��������� � ������, ������� � ������� �� �����.
	};
};


instance DIA_Addon_Nefarius_Ringritual(C_Info)
{
	npc = KDW_1402_Addon_Nefarius_NW;
	nr = 5;
	condition = DIA_Addon_Nefarius_Ringritual_Condition;
	information = DIA_Addon_Nefarius_Ringritual_Info;
	important = TRUE;
};


func int DIA_Addon_Nefarius_Ringritual_Condition()
{
	if((MIS_Addon_Nefarius_BringMissingOrnaments == LOG_SUCCESS) && (Npc_GetDistToWP(self,"NW_TROLLAREA_PORTALTEMPEL_42") < 1000))
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_Ringritual_Info()
{
	AI_Output(self,other,"DIA_Addon_Nefarius_Ringritual_05_00");	//� ������ ������ �����.
	Npc_SetRefuseTalk(self,60);
	RitualRingRuns = LOG_Running;
	B_LogEntry(TOPIC_Addon_Ornament,"� ������ ��� ����� ������ ���������. ������ ���� ���� ������ ������� ������.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Ringritual");
	B_StartOtherRoutine(KDW_1400_Addon_Saturas_NW,"Ringritual");
	B_StartOtherRoutine(KDW_1401_Addon_Cronos_NW,"Ringritual");
	B_StartOtherRoutine(KDW_1403_Addon_Myxir_NW,"Ringritual");
	B_StartOtherRoutine(KDW_1404_Addon_Riordian_NW,"Ringritual");
	B_StartOtherRoutine(KDW_1405_Addon_Merdarion_NW,"Ringritual");
};


instance DIA_Addon_Nefarius_RingRitualEnds(C_Info)
{
	npc = KDW_1402_Addon_Nefarius_NW;
	nr = 5;
	condition = DIA_Addon_Nefarius_RingRitualEnds_Condition;
	information = DIA_Addon_Nefarius_RingRitualEnds_Info;
	important = TRUE;
};


func int DIA_Addon_Nefarius_RingRitualEnds_Condition()
{
	if((Npc_RefuseTalk(self) == FALSE) && (RitualRingRuns == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_RingRitualEnds_Info()
{
	AI_Output(self,other,"DIA_Addon_Nefarius_RingRitualEnds_05_00");	//�������� ����� ������.
	AI_Output(self,other,"DIA_Addon_Nefarius_RingRitualEnds_05_01");	//�� ������ ��� ����������� ���������, ������� �� ����������� ���� ����� �������� ���� � ������.
	AI_Output(self,other,"DIA_Addon_Nefarius_RingRitualEnds_05_02");	//��� � �������� � ������ � ���� ������.
	AI_Output(self,other,"DIA_Addon_Nefarius_RingRitualEnds_05_03");	//�������, ������ ���������.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	B_StartOtherRoutine(KDW_1400_Addon_Saturas_NW,"Start");
	B_StartOtherRoutine(KDW_1401_Addon_Cronos_NW,"Start");
	B_StartOtherRoutine(KDW_1403_Addon_Myxir_NW,"Start");
	B_StartOtherRoutine(KDW_1404_Addon_Riordian_NW,"Start");
	B_StartOtherRoutine(KDW_1405_Addon_Merdarion_NW,"Start");
	RitualRingRuns = LOG_SUCCESS;
	B_LogEntry(TOPIC_Addon_Ornament,"���������� ������ �������������. � ������ ������� ��� � ��������.");
};


instance DIA_Addon_Nefarius_OpenedPortal(C_Info)
{
	npc = KDW_1402_Addon_Nefarius_NW;
	nr = 5;
	condition = DIA_Addon_Nefarius_OpenedPortal_Condition;
	information = DIA_Addon_Nefarius_OpenedPortal_Info;
	description = "� ��� ������?";
};


func int DIA_Addon_Nefarius_OpenedPortal_Condition()
{
	if(RitualRingRuns == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_OpenedPortal_Info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_OpenedPortal_15_00");	//��� ������?
	AI_Output(self,other,"DIA_Addon_Nefarius_OpenedPortal_05_01");	//���� �� �����? ������ � ������.
};

