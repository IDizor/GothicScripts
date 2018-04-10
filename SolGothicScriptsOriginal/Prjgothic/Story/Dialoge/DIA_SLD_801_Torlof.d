
instance DIA_Torlof_EXIT(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 999;
	condition = DIA_Torlof_EXIT_Condition;
	information = DIA_Torlof_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Torlof_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Torlof_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Torlof_Hallo(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 1;
	condition = DIA_Torlof_HALLO_Condition;
	information = DIA_Torlof_HALLO_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Torlof_HALLO_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_HALLO_Info()
{
	AI_Output(self,other,"DIA_Torlof_Hallo_01_00");	//(�����������) ���� ���� ����� �� ����?
};


instance DIA_Torlof_WannaJoin(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 2;
	condition = DIA_Torlof_WannaJoin_Condition;
	information = DIA_Torlof_WannaJoin_Info;
	permanent = FALSE;
	description = "� ���� �������������� � ���������!";
};


func int DIA_Torlof_WannaJoin_Condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Torlof_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Torlof_WannaJoin_15_00");	//� ���� �������������� � ���������!
	AI_Output(self,other,"DIA_Torlof_WannaJoin_01_01");	//��? � � ���� �� ����, ��� � �������� ���� � ���� ���������?
};


var int Torlof_Go;

instance DIA_Torlof_Probe(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 3;
	condition = DIA_Torlof_Probe_Condition;
	information = DIA_Torlof_Probe_Info;
	permanent = TRUE;
	description = "������� ����!";
};


func int DIA_Torlof_Probe_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Torlof_WannaJoin) && (hero.guild == GIL_NONE) && (Torlof_Go == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_Probe_Info()
{
	AI_Output(other,self,"DIA_Torlof_Probe_15_00");	//������� ����!
	AI_Output(self,other,"DIA_Torlof_Probe_01_01");	//���� ������ �� ��� ��?
	if(Npc_KnowsInfo(other,DIA_Lee_OtherSld))
	{
		AI_Output(other,self,"DIA_Torlof_Probe_15_02");	//�� ������, �� �������� ���.
		AI_Output(self,other,"DIA_Torlof_Probe_01_03");	//(��������) ������. ����� ������. ������ ��� �������������� � ���, �� ������ ������� ��� ����.
		AI_Output(self,other,"DIA_Torlof_Probe_01_04");	//��-������, �� ������ ��������, ��� �������� ������ ������, ������� ������ � ����������� ���������. � ������ �������� ����.
		AI_Output(self,other,"DIA_Torlof_Probe_01_05");	//� ������: �� ������ ��������� �������� ������ ���������.
		Torlof_Go = TRUE;
		Npc_ExchangeRoutine(self,"Start");
		Log_CreateTopic(TOPIC_BecomeSLD,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_BecomeSLD,LOG_Running);
		B_LogEntry(TOPIC_BecomeSLD,"����� ���� �������� � ���� ���������, � ������ ������ ��������� ������� � ��������� �������� ��������� ���������.");
	}
	else
	{
		AI_Output(other,self,"DIA_Torlof_Probe_15_06");	//���.
		AI_Output(self,other,"DIA_Torlof_Probe_01_07");	//����� � ���� �� ��� � ������ ����������� ���� ����?
		AI_StopProcessInfos(self);
	};
};


instance DIA_Torlof_Respekt(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 4;
	condition = DIA_Torlof_Respekt_Condition;
	information = DIA_Torlof_Respekt_Info;
	permanent = FALSE;
	description = "��� ��� ��������� �������� ������ ���������? ";
};


func int DIA_Torlof_Respekt_Condition()
{
	if((Torlof_Go == TRUE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_Respekt_Info()
{
	AI_Output(other,self,"DIA_Torlof_Respekt_15_00");	//��� ��� ��������� �������� ������ ���������?
	AI_Output(self,other,"DIA_Torlof_Respekt_01_01");	//��� ����������� ����� ����������, ���� �� ��������� ���� ������� � �������� ��� ���������.
	AI_Output(self,other,"DIA_Torlof_Respekt_01_02");	//�� ����� ������� ���������, ���� �������� �������� ������ ������.
	AI_Output(self,other,"DIA_Torlof_Respekt_01_03");	//��������� ���������� ������� ������ �� ������ ���������, � ������ ����� �� ����������� ���� ����.
	AI_Output(self,other,"DIA_Torlof_Respekt_01_04");	//�� ������ ���������� ��������� ��� ����� ������ ����� ������ - �� ���� ������ �� ��������, �� ������ ������ ���������� � �����.
	AI_Output(self,other,"DIA_Torlof_Respekt_01_05");	//���� �� ��������, �� �������� �������� ����������� �� ���. �� ������ ������, �� ���� �������� ����-������. ����� � ���� ����� ����� ������� ��������.
	Log_CreateTopic(TOPIC_SLDRespekt,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SLDRespekt,LOG_Running);
	B_LogEntry(TOPIC_SLDRespekt,"���� � ����, ����� �������� ������� ����, � ������ ������ ���������, �������������� ��� ��������. ����� �� ����� �������, ������� � �����.");
};


instance DIA_Torlof_Duellregeln(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 5;
	condition = DIA_Torlof_Duellregeln_Condition;
	information = DIA_Torlof_Duellregeln_Info;
	permanent = FALSE;
	description = "��� �� ������� ������?";
};


func int DIA_Torlof_Duellregeln_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Torlof_Respekt) || Npc_KnowsInfo(other,DIA_Jarvis_MissionKO))
	{
		return TRUE;
	};
};

func void DIA_Torlof_Duellregeln_Info()
{
	AI_Output(other,self,"DIA_Torlof_Duellregeln_15_00");	//������ ������� �����?
	AI_Output(self,other,"DIA_Torlof_Duellregeln_01_01");	//��� �������� ������. ��� �������� ������ ����� ����������� �������� ������ �� ��������� ������� �����.
	AI_Output(self,other,"DIA_Torlof_Duellregeln_01_02");	//������ ������ ��� ����� � ������� �� ����-������ ��� ��������������.
	AI_Output(self,other,"DIA_Torlof_Duellregeln_01_03");	//����������� ������ ����� ����� ������ �����. �����������, ��������, ��� ��� �����-������ ������� ��� ��������.
	AI_Output(self,other,"DIA_Torlof_Duellregeln_01_04");	//����� �� ������������ �� ����� ����� ����������� � �����. ���� ������ ���� �� ��������� �� ����� ����.
	B_LogEntry(TOPIC_SLDRespekt,"������� �����: ����� ������ �������� � ������, ����� � ��� ����� �� ����� ����� ���������. ���������� � ����� ������ �������.");
};


instance DIA_Torlof_DeineStimme(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 6;
	condition = DIA_Torlof_DeineStimme_Condition;
	information = DIA_Torlof_DeineStimme_Info;
	permanent = FALSE;
	description = "� ��� ������ ����? �� ������������ �� ����?";
};


func int DIA_Torlof_DeineStimme_Condition()
{
	if((Torlof_Go == TRUE) && (other.guild == GIL_NONE) && (MIS_Torlof_HolPachtVonSekob != LOG_SUCCESS) && (MIS_Torlof_BengarMilizKlatschen != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Torlof_DeineStimme_Info()
{
	AI_Output(other,self,"DIA_Torlof_DeineStimme_15_00");	//� ��� ������ ����? �� ������������ �� ����?
	AI_Output(self,other,"DIA_Torlof_DeineStimme_01_01");	//���� �� ������� ��������, ��� ������ ��������� ����������� ��������, �� ��.
};


var int Points_Sld;

instance DIA_Torlof_RUF(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 7;
	condition = DIA_Torlof_RUF_Condition;
	information = DIA_Torlof_RUF_Info;
	permanent = TRUE;
	description = "��� ��� ��������� ����� ���������?";
};


func int DIA_Torlof_RUF_Condition()
{
	if((Torlof_Go == TRUE) && (Torlof_GenugStimmen == FALSE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_RUF_Info()
{
	AI_Output(other,self,"DIA_Torlof_RUF_15_00");	//��� ��� ��������� ����� ���������?
	AI_Output(self,other,"DIA_Torlof_RUF_01_01");	//���, ���������...
	Points_Sld = 0;
	if(Npc_IsDead(SLD_Wolf))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if(SLD_Wolf.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_02");	//����� �������, ��� ������ �� ����� ������ ����.
		Points_Sld = Points_Sld + 1;
	};
	if(Npc_IsDead(Jarvis))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if(MIS_Jarvis_SldKO == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_03");	//������� ��������, ��� �� �� ���������� �������.
		Points_Sld = Points_Sld + 1;
	}
	else if(Jarvis.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_04");	//������� ��� ��� �� ������, ��� �� �� ���������� �������.
		AI_Output(self,other,"DIA_Torlof_RUF_01_05");	//�� �� �����, ����� ��� ����� ������� ������� ��� ������ �����. ���� ���� ��� ���������, � ���� � � ��� ��������.
	};
	if(Npc_IsDead(Cord))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if(Cord_Approved == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_06");	//���� ��������, ��� �� ���������� �����, ����� �������������� � ���.
		Points_Sld = Points_Sld + 1;
	}
	else if(Cord.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_07");	//�� ������ �����, ���� ����� ������� ��������� ����� ������� �������.
	};
	if(Npc_IsDead(Cipher))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if((MIS_Cipher_Paket == LOG_SUCCESS) || (MIS_Cipher_BringWeed == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_08");	//����� �������, ��� ��� ��������� ����, ��� �� ������� �������������� � ���. ������, ���-�� ������� ��� ����������� ����������.
		Points_Sld = Points_Sld + 1;
	}
	else if(Cipher.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_09");	//����� �������, ��� �� ����� ������, � ��� �� ������, � ��� ���� ����.
	};
	if(Npc_IsDead(Rod))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if(Npc_HasItems(Rod,ItMw_2h_Rod) == 0)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_10");	//��� ������ ����� �������� ���� ��� �����.
	}
	else if((Rod.aivar[AIV_DefeatedByPlayer] == TRUE) || (Rod_WetteGewonnen == TRUE))
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_11");	//������, ���� ������� ������� ����, ��� �� ���������� �����.
		if(Rod.aivar[AIV_DefeatedByPlayer] == FALSE)
		{
			Points_Sld = Points_Sld + 1;
		};
	}
	else if(Rod.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_12");	//��� ������� ���� ��������.
	};
	if(Npc_IsDead(Sentenza))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if(Npc_HasItems(Sentenza,ItMi_Gold) >= 50)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_13");	//�������� ����������� �� ����. �� �������, ��� �� ������ �������������� �������.
		Points_Sld = Points_Sld + 1;
		Torlof_SentenzaCounted = TRUE;
	}
	else if(Sentenza.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_14");	//�������� �� ����������� �� ����. �� �������, ��� �� ������ ��� 50 ������� �����.
	};
	if(Npc_IsDead(Raoul))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if(Raoul.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_15");	//����� ������ ����. ��� �������, �� �� ��� ���� �� �������.
	};
	if(Npc_IsDead(Bullco))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if(Bullco.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_16");	//� ������� � ����� ���� �������� ������. ��� ��� ������� ������ ������ ���� � ���.
	};
	if(Npc_IsDead(Buster))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if(Buster_Duell == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_17");	//������ �������, ��� � ����� ��� � �������.
		if(Buster.aivar[AIV_DefeatedByPlayer] == FALSE)
		{
			AI_Output(self,other,"DIA_Torlof_RUF_01_18");	//���� �� � �������� ���.
		};
	}
	else if(Buster.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_19");	//������ �������, ��� �� �������, ����� �� ������ ����.
		AI_Output(self,other,"DIA_Torlof_RUF_01_20");	//��� �� ����� ������. ��������, ���� ����� ��������� �� �������� � ������� ���.
	};
	if(Npc_IsDead(Dar))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if(Dar_LostAgainstCipher == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_21");	//��� �������, ��� �� ������. �� � ��� ������ ����� �� �������� ��������������.
	};
	if(Points_Sld > 0)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_22");	//��������� �������� ������ �� �������.
	};
	if((MIS_Torlof_HolPachtVonSekob != LOG_SUCCESS) && (MIS_Torlof_BengarMilizKlatschen != LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_23");	//����������� �� ��� ������ ����, �������� �� �� ���������.
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_24");	//�� ������ ����������� �� ���, ������ ���������.
		if(Cord_RangerHelp_TorlofsProbe == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Torlof_RUF_01_00");	//(����������) ����� ���� � ���� � ������������...
			Points_Sld = Points_Sld + 4;
		}
		else if(MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Torlof_RUF_01_25");	//���� ������ �������, ��� ��������� ������� ��������� ����� ���� ������� �����, ����� ������� ��� ����������.
			Points_Sld = Points_Sld + 3;
		}
		else
		{
			Points_Sld = Points_Sld + 5;
		};
		AI_Output(self,other,"DIA_Torlof_RUF_01_26");	//� ����� ������, �� ������ ������������ �� ��� �����.
		Points_Sld = Points_Sld + 1;
	};
	if(Sld_Duelle_gewonnen >= 3)
	{
		Points_Sld = Points_Sld + 1;
		if(Points_Sld >= 9)
		{
			AI_Output(self,other,"DIA_Torlof_RUF_01_27");	//� �� ������� � ���������� ������� ������.
			AI_Output(self,other,"DIA_Torlof_RUF_01_28");	//������ �������� ������� ���.
		}
		else
		{
			AI_Output(self,other,"DIA_Torlof_RUF_01_29");	//��� �� �� �� ����, �� ��� ������� � ���������� ������� ������.
		};
	};
	if(Points_Sld >= 9)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_30");	//����������� ��������� �� ����, � �� �������, ��� �� ������ �������������� � ��� � ����� �����.
		AI_Output(self,other,"DIA_Torlof_RUF_01_31");	//���, �������� � ��. �� �������� ���� ������.
		Torlof_GenugStimmen = TRUE;
		B_LogEntry(TOPIC_BecomeSLD,"� �������� �������� ���������. ������, � ������ ������������ � ��.");
	}
	else if(Points_Sld >= 7)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_32");	//��� �������� �����, �� ���� ��� �� ����������.
		AI_Output(self,other,"DIA_Torlof_RUF_01_33");	//���� ����� ��� ��������� � ����������� �������.
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_34");	//���� ��� ������ �� ��������� ���������, ������. ���� �� ������, ����� �� ������� ���� � ���� ����, ���� ����� ������ �����������.
	};
};


instance DIA_Torlof_Aufgaben(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 8;
	condition = DIA_Torlof_Aufgaben_Condition;
	information = DIA_Torlof_Aufgaben_Info;
	permanent = FALSE;
	description = "� ������ ����������� ��������?";
};


func int DIA_Torlof_Aufgaben_Condition()
{
	if((Torlof_Go == TRUE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_Aufgaben_Info()
{
	AI_Output(other,self,"DIA_Torlof_Aufgaben_15_00");	//� ������ ����������� ��������?
	AI_Output(self,other,"DIA_Torlof_Aufgaben_01_01");	//���� ����� ��� �� ���� ��������: �� �����, ����� �� �������� � ��� ��� ���������, � �� �����, ����� �� ������������ ������� �� ��� ������.
	AI_Output(self,other,"DIA_Torlof_Aufgaben_01_02");	//��� �������� ���� �����, ����� ������� ������������ �������.
	AI_Output(self,other,"DIA_Torlof_Aufgaben_01_03");	//����, ��� �� ���������?
	Info_ClearChoices(DIA_Torlof_Aufgaben);
	Info_AddChoice(DIA_Torlof_Aufgaben,"� ������ �����!",DIA_Torlof_Aufgaben_Pacht);
	Info_AddChoice(DIA_Torlof_Aufgaben,"� ��������� � ����������, ������ ������ �� ���� ��������!",DIA_Torlof_Aufgaben_Miliz);
};

func void B_Torlof_HolPachtVonSekob()
{
	AI_Output(self,other,"B_Torlof_HolPachtvonSekob_01_00");	//������. ������. ������ ����� �� ������ ����� ����� ��� ��������� ������.
	AI_Output(self,other,"B_Torlof_HolPachtvonSekob_01_01");	//���� �����, ����� ��� ������� 50 ������� �����. ���� �������?
	AI_Output(other,self,"B_Torlof_HolPachtvonSekob_15_02");	//��� ����� ������?
	AI_Output(self,other,"B_Torlof_HolPachtvonSekob_01_03");	//�� ������ ���� ������. ���� �������� ������, ��� ����� ������ �� �������� �����������.
	AI_Output(self,other,"B_Torlof_HolPachtvonSekob_01_04");	//���� � ���� ����� ��������, ������� �� ����� ������� ���� ����� ������.
	MIS_Torlof_HolPachtVonSekob = LOG_Running;
	Sekob.flags = 0;
	CreateInvItems(Sekob,ItMi_Gold,50);
	Log_CreateTopic(TOPIC_TorlofPacht,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TorlofPacht,LOG_Running);
	B_LogEntry(TOPIC_TorlofPacht,"������ �������� ���� ������� ����� � ������� ������. �� ������ ��������� 50 ������� �����.");
};

func void B_Torlof_BengarMilizKlatschen()
{
	AI_Output(self,other,"B_Torlof_BengarMilizKlatschen_01_00");	//������ ������ ������� ���������, ��� ��������� �� ������ ��������� ��� �� �����.
	AI_Output(self,other,"B_Torlof_BengarMilizKlatschen_01_01");	//��� ����� �� ����� ������� - ��������, �������� ��������� ��� ������� ��������� � ������.
	AI_Output(self,other,"B_Torlof_BengarMilizKlatschen_01_02");	//� ����, ����� �� ���������� �� ��� ����� � ��� ������ ���� ����������, ��� ��� �� ������ ������! ���� �������?
	AI_Output(other,self,"B_Torlof_BengarMilizKlatschen_15_03");	//��� ��� ����� ����� �������?
	AI_Output(self,other,"B_Torlof_BengarMilizKlatschen_01_04");	//�� ���-������ ���� ������ ���� ������� ��������, ������� �� ����� � �����. �� ��� � ��������� ����� �������.
	AI_Output(self,other,"B_Torlof_BengarMilizKlatschen_01_05");	//���� �� �����������, ����������� �������� �� �����, ��� ������� ���� ������.
	MIS_Torlof_BengarMilizKlatschen = LOG_Running;
	Bengar.flags = 0;
	Wld_InsertNpc(Mil_335_Rumbold,"FARM3");
	Wld_InsertNpc(Mil_336_Rick,"FARM3");
	B_InitNpcGlobals();
	Log_CreateTopic(TOPIC_TorlofMiliz,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TorlofMiliz,LOG_Running);
	B_LogEntry(TOPIC_TorlofMiliz,"������ �������� ������� ��������� � ����� �������. ��� ��������� �� �����������.");
};

func void DIA_Torlof_Aufgaben_Pacht()
{
	AI_Output(other,self,"DIA_Torlof_Aufgaben_Pacht_15_00");	//� ������ �����!
	B_Torlof_HolPachtVonSekob();
	Torlof_Probe = Probe_Sekob;
	Info_ClearChoices(DIA_Torlof_Aufgaben);
};

func void DIA_Torlof_Aufgaben_Miliz()
{
	AI_Output(other,self,"DIA_Torlof_Aufgaben_Miliz_15_00");	//� ��������� � ����������, ������ ������ �� ���� ��������!
	B_Torlof_BengarMilizKlatschen();
	Torlof_Probe = Probe_Bengar;
	Info_ClearChoices(DIA_Torlof_Aufgaben);
};


var int Torlof_TheOtherMission_Day;

func void B_Torlof_TheOtherMissionDay()
{
	if(Torlof_TheOtherMission_Day < (Wld_GetDay() - 1))
	{
		AI_Output(self,other,"B_Torlof_TheOtherMissionDay_01_00");	//�� �������� �� ��� ������� ����� �������. ���� ����� ���������.
		Torlof_TheOtherMission_TooLate = TRUE;
		if(EnterOW_Kapitel2 == TRUE)
		{
			AI_Output(self,other,"DIA_Torlof_Add_01_00");	//� ��� ��� �����, �������� �������� � ������ �������� ��� ���...
		};
	}
	else
	{
		AI_Output(self,other,"B_Torlof_TheOtherMissionDay_01_01");	//�������! ����� � ���� ����� ���-������ ���������, � ��� ���� �����.
	};
};


instance DIA_Torlof_SekobSuccess(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 9;
	condition = DIA_Torlof_SekobSuccess_Condition;
	information = DIA_Torlof_SekobSuccess_Info;
	permanent = TRUE;
	description = "� ������ ����� ������.";
};


func int DIA_Torlof_SekobSuccess_Condition()
{
	if(MIS_Torlof_HolPachtVonSekob == LOG_Running)
	{
		if((Sekob.aivar[AIV_DefeatedByPlayer] == TRUE) || Npc_IsDead(Sekob))
		{
			return TRUE;
		};
	};
};

func void DIA_Torlof_SekobSuccess_Info()
{
	AI_Output(other,self,"DIA_Torlof_SekobSuccess_15_00");	//� ������ ����� ������.
	if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		AI_Output(self,other,"DIA_Torlof_SekobSuccess_01_01");	//�? �� �������� �����������?
		if(Npc_IsDead(Sekob))
		{
			AI_Output(other,self,"DIA_Torlof_SekobTot_15_00");	//��, � ��� ��������� ���������� ������...
		}
		else
		{
			AI_Output(other,self,"DIA_Torlof_SekobSuccess_15_02");	//��� �������� ������� ���.
		};
		if(Torlof_Probe == Probe_Sekob)
		{
			AI_Output(self,other,"DIA_Torlof_SekobSuccess_01_03");	//�������! �� ������ ���������. ��� ������ ����������� ���������, ��� �� ��������� ��������.
		}
		else
		{
			B_Torlof_TheOtherMissionDay();
		};
		MIS_Torlof_HolPachtVonSekob = LOG_SUCCESS;
		B_GivePlayerXP(XP_Torlof_SekobsKohlebekommen);
		B_LogEntry(TOPIC_BecomeSLD,"� �������� ������, ������� ��� ��� ������.");
		Torlof_ProbeBestanden = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_SekobSuccess_01_04");	//�? �� ���, �������� ��� ������?  �� ������ �������� �� ���! � ���������!
	};
};


instance DIA_Torlof_BengarSuccess(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 10;
	condition = DIA_Torlof_BengarSuccess_Condition;
	information = DIA_Torlof_BengarSuccess_Info;
	permanent = FALSE;
	description = "� ����� �������� ������� � ����������.";
};


func int DIA_Torlof_BengarSuccess_Condition()
{
	if((MIS_Torlof_BengarMilizKlatschen == LOG_Running) && Npc_IsDead(Rumbold) && Npc_IsDead(Rick))
	{
		return TRUE;
	};
};

func void DIA_Torlof_BengarSuccess_Info()
{
	AI_Output(other,self,"DIA_Torlof_BengarSuccess_15_00");	//� ����� �������� ������� � ����������.
	AI_Output(self,other,"DIA_Torlof_BengarSuccess_01_01");	//�� �����������, ����� ��� �� ��������� � ���� �� ������ ������ �����?
	AI_Output(other,self,"DIA_Torlof_BengarSuccess_15_02");	//����� ������� ���, �� �������� ����� ������ �����������...
	AI_Output(self,other,"DIA_Torlof_BengarSuccess_01_03");	//�������!
	if(Torlof_Probe == Probe_Bengar)
	{
		AI_Output(self,other,"DIA_Torlof_BengarSuccess_01_04");	//�� ������ ���������. �� ���� ����������� � ����������, ����� ����������, ����� ��������� �������� �����������.
	}
	else
	{
		B_Torlof_TheOtherMissionDay();
	};
	MIS_Torlof_BengarMilizKlatschen = LOG_SUCCESS;
	B_GivePlayerXP(XP_Bengar_MILIZKLATSCHEN);
	B_LogEntry(TOPIC_BecomeSLD,"� �������� ������, ������� ��� ��� ������.");
	Torlof_ProbeBestanden = TRUE;
};


instance DIA_Torlof_Welcome(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 11;
	condition = DIA_Torlof_Welcome_Condition;
	information = DIA_Torlof_Welcome_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Torlof_Welcome_Condition()
{
	if((other.guild == GIL_SLD) && (Kapitel <= 1))
	{
		return TRUE;
	};
};

func void DIA_Torlof_Welcome_Info()
{
	AI_Output(self,other,"DIA_Torlof_Welcome_01_00");	//����� ���������� � ���� ���������, ������!
	AI_Output(other,self,"DIA_Torlof_Welcome_15_01");	//�������!
	AI_Output(self,other,"DIA_Torlof_Welcome_01_02");	//��� ������ � ���� ����� ������ ��� ����, � ��� ���� �����.
};


var int Torlof_KnowsDragons;

func void B_Torlof_Dragons()
{
	AI_Output(self,other,"DIA_Torlof_Add_01_01");	//��� �� ���?
	AI_Output(other,self,"DIA_Torlof_Add_15_02");	//� ��� � ������ ��������! ��� �������! � ��������� ���������� ��������!
	AI_Output(self,other,"DIA_Torlof_Add_01_03");	//��? ������, �� ���� ���� �������� ������������� ���� ���� ������!
	AI_Output(self,other,"DIA_Torlof_Add_01_04");	//�� ��� ����� ���������...
	Torlof_KnowsDragons = TRUE;
};


instance DIA_Torlof_TheOtherMission(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 11;
	condition = DIA_Torlof_TheOtherMission_Condition;
	information = DIA_Torlof_TheOtherMission_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Torlof_TheOtherMission_Condition()
{
	if((other.guild == GIL_SLD) && (Kapitel >= 2))
	{
		return TRUE;
	};
};

func void DIA_Torlof_TheOtherMission_Info()
{
	if((Torlof_KnowsDragons == FALSE) && (ENTER_OLDWORLD_FIRSTTIME_TRIGGER_ONETIME == TRUE))
	{
		B_Torlof_Dragons();
	};
	AI_Output(self,other,"DIA_Torlof_TheOtherMission_01_00");	//������, ��� �� �����. � ���� ���� ��� ���� ������...
	AI_Output(other,self,"DIA_Torlof_TheOtherMission_15_01");	//��� �����?
	if(Torlof_Probe == Probe_Bengar)
	{
		B_Torlof_HolPachtVonSekob();
	}
	else
	{
		B_Torlof_BengarMilizKlatschen();
	};
	AI_Output(self,other,"DIA_Torlof_TheOtherMission_01_02");	//� �� ������ ��������� � ���� �� ����������� ����!
	Torlof_TheOtherMission_Day = Wld_GetDay();
};


instance DIA_Torlof_Dragons(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 12;
	condition = DIA_Torlof_Dragons_Condition;
	information = DIA_Torlof_Dragons_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Torlof_Dragons_Condition()
{
	if((ENTER_OLDWORLD_FIRSTTIME_TRIGGER_ONETIME == TRUE) && (Kapitel <= 3) && (other.guild == GIL_SLD) && (Torlof_KnowsDragons == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_Dragons_Info()
{
	B_Torlof_Dragons();
};


instance DIA_Torlof_WhatCanYouTeach(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 140;
	condition = DIA_Torlof_WhatCanYouTeach_Condition;
	information = DIA_Torlof_WhatCanYouTeach_Info;
	permanent = FALSE;
	description = "�� ������ ������ ��� �������� ��� �����������?";
};


func int DIA_Torlof_WhatCanYouTeach_Condition()
{
	return TRUE;
};

func void DIA_Torlof_WhatCanYouTeach_Info()
{
	AI_Output(other,self,"DIA_Torlof_WhatCanYouTeach_15_00");	//�� ������ ������ ��� �������� ��� �����������?
	AI_Output(self,other,"DIA_Torlof_WhatCanYouTeach_01_01");	//� ��� �� �������� ����, ��� ����� ������������ ���� � ������� ���.
	AI_Output(self,other,"DIA_Torlof_WhatCanYouTeach_01_02");	//������ ����� ����������� ��-�� ����, ��� �� ����� ��������� ��������� ���� ����.
	AI_Output(self,other,"DIA_Torlof_WhatCanYouTeach_01_03");	//�� �� ����� �������� �������� � ������������� ������.
	Log_CreateTopic(Topic_SoldierTeacher,LOG_NOTE);
	B_LogEntry(Topic_SoldierTeacher,"������ ����� �������� ��� �������� � ����.");
};


var int Torlof_Merke_STR;
var int Torlof_Merke_DEX;

instance DIA_Torlof_Teach(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 150;
	condition = DIA_Torlof_Teach_Condition;
	information = DIA_Torlof_Teach_Info;
	permanent = TRUE;
	description = "� ���� �������� ���� �����������!";
};


func int DIA_Torlof_Teach_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Torlof_WhatCanYouTeach))
	{
		return TRUE;
	};
};

func void DIA_Torlof_Teach_Info()
{
	AI_Output(other,self,"DIA_Torlof_Teach_15_00");	//� ���� �������� ���� �����������!
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG) || (other.guild == GIL_NONE))
	{
		Torlof_Merke_STR = other.attribute[ATR_STRENGTH];
		Torlof_Merke_DEX = other.attribute[ATR_DEXTERITY];
		Info_ClearChoices(DIA_Torlof_Teach);
		Info_AddChoice(DIA_Torlof_Teach,Dialog_Back,DIA_Torlof_Teach_Back);
		Info_AddChoice(DIA_Torlof_Teach,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Torlof_Teach_DEX_1);
		Info_AddChoice(DIA_Torlof_Teach,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Torlof_Teach_DEX_5);
		Info_AddChoice(DIA_Torlof_Teach,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Torlof_Teach_STR_1);
		Info_AddChoice(DIA_Torlof_Teach,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Torlof_Teach_STR_5);
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_Teach_01_01");	//� ������, ��� � ��� �� ������ ����, �� ��� �� ������, ��� � ���� ��������.
		AI_Output(self,other,"DIA_Torlof_Teach_01_02");	//���� �� �� ������� ����� �� ���, ���� ����� �������� ������� �������!
	};
};

func void DIA_Torlof_Teach_Back()
{
	if((Torlof_Merke_STR < other.attribute[ATR_STRENGTH]) || (Torlof_Merke_DEX < other.attribute[ATR_DEXTERITY]))
	{
		AI_Output(self,other,"DIA_Torlof_Teach_Back_01_00");	//������! ������ �� ������ ����� ���������� ������������ ���� �����������!
	};
	Info_ClearChoices(DIA_Torlof_Teach);
};

func void DIA_Torlof_Teach_STR_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MAX);
	Info_ClearChoices(DIA_Torlof_Teach);
	Info_AddChoice(DIA_Torlof_Teach,Dialog_Back,DIA_Torlof_Teach_Back);
	Info_AddChoice(DIA_Torlof_Teach,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Torlof_Teach_DEX_1);
	Info_AddChoice(DIA_Torlof_Teach,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Torlof_Teach_DEX_5);
	Info_AddChoice(DIA_Torlof_Teach,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Torlof_Teach_STR_1);
	Info_AddChoice(DIA_Torlof_Teach,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Torlof_Teach_STR_5);
};

func void DIA_Torlof_Teach_STR_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MAX);
	Info_ClearChoices(DIA_Torlof_Teach);
	Info_AddChoice(DIA_Torlof_Teach,Dialog_Back,DIA_Torlof_Teach_Back);
	Info_AddChoice(DIA_Torlof_Teach,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Torlof_Teach_DEX_1);
	Info_AddChoice(DIA_Torlof_Teach,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Torlof_Teach_DEX_5);
	Info_AddChoice(DIA_Torlof_Teach,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Torlof_Teach_STR_1);
	Info_AddChoice(DIA_Torlof_Teach,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Torlof_Teach_STR_5);
};

func void DIA_Torlof_Teach_DEX_1()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MED);
	Info_ClearChoices(DIA_Torlof_Teach);
	Info_AddChoice(DIA_Torlof_Teach,Dialog_Back,DIA_Torlof_Teach_Back);
	Info_AddChoice(DIA_Torlof_Teach,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Torlof_Teach_DEX_1);
	Info_AddChoice(DIA_Torlof_Teach,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Torlof_Teach_DEX_5);
	Info_AddChoice(DIA_Torlof_Teach,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Torlof_Teach_STR_1);
	Info_AddChoice(DIA_Torlof_Teach,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Torlof_Teach_STR_5);
};

func void DIA_Torlof_Teach_DEX_5()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MED);
	Info_ClearChoices(DIA_Torlof_Teach);
	Info_AddChoice(DIA_Torlof_Teach,Dialog_Back,DIA_Torlof_Teach_Back);
	Info_AddChoice(DIA_Torlof_Teach,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Torlof_Teach_DEX_1);
	Info_AddChoice(DIA_Torlof_Teach,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Torlof_Teach_DEX_5);
	Info_AddChoice(DIA_Torlof_Teach,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Torlof_Teach_STR_1);
	Info_AddChoice(DIA_Torlof_Teach,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Torlof_Teach_STR_5);
};


instance DIA_Torlof_KAP3_EXIT(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 999;
	condition = DIA_Torlof_KAP3_EXIT_Condition;
	information = DIA_Torlof_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Torlof_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Torlof_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Torlof_DEMENTOREN(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 30;
	condition = DIA_Torlof_DEMENTOREN_Condition;
	information = DIA_Torlof_DEMENTOREN_Info;
	description = "� ���� ���� �����-������ ������ ��� ����?";
};


func int DIA_Torlof_DEMENTOREN_Condition()
{
	if(Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Torlof_DEMENTOREN_Info()
{
	AI_Output(other,self,"DIA_Torlof_DEMENTOREN_15_00");	//� ���� ���� �����-������ ������ ��� ����?
	AI_Output(self,other,"DIA_Torlof_DEMENTOREN_01_01");	//�� ����� ���� ������, ������ � ������ ����, ������� ��������� �����? ���� �� ��� � ����� �������, ���� ������.
	AI_Output(self,other,"DIA_Torlof_DEMENTOREN_01_02");	//����� � ����� �� ����, � ����� ����� �������� �����, �� ��� ����� ��-���������� �������� ����.
	AI_Output(self,other,"DIA_Torlof_DEMENTOREN_01_03");	//��� ������ �� ������� ������ ��������, ������� ��������� � �����, � ����� ����� ���� ������.
	AI_Output(self,other,"DIA_Torlof_DEMENTOREN_01_04");	//��������, ���� ����� ������� ���� � ����������� � ����� �������!
	Wld_InsertNpc(CastlemineDMT,"FP_STAND_DEMENTOR_KDF_12");
	Log_CreateTopic(TOPIC_Torlof_Dmt,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Torlof_Dmt,LOG_Running);
	B_LogEntry(TOPIC_Torlof_Dmt,"� ����� ����� ������, � �����, � ���������� ������, ������, ��������� ��� ���� � ������ �����. �� ��� � ������� ������. � ������ ������ ��� �������� ��� ����.");
	MIS_Torlof_Dmt = LOG_Running;
};


instance DIA_Torlof_DmtSuccess(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 30;
	condition = DIA_Torlof_DmtSuccess_Condition;
	information = DIA_Torlof_DmtSuccess_Info;
	description = "���� � ��� � ������ ����� ������ �� ����� ���������� ���.";
};


func int DIA_Torlof_DmtSuccess_Condition()
{
	if((MIS_Torlof_Dmt == LOG_Running) && Npc_IsDead(CastlemineDMT))
	{
		return TRUE;
	};
};

func void DIA_Torlof_DmtSuccess_Info()
{
	AI_Output(other,self,"DIA_Torlof_DmtSuccess_15_00");	//���� � ��� � ������ ����� ������ �� ����� ���������� ���.
	AI_Output(self,other,"DIA_Torlof_DmtSuccess_01_01");	//�� ���� ����������� � ����? �������!
	AI_Output(self,other,"DIA_Torlof_DmtSuccess_01_02");	//� ����� �� ������� ���� ������. �� ������ ���� �����, ��� �� ��� ����� ���� ������������...
	MIS_Torlof_Dmt = LOG_SUCCESS;
	B_GivePlayerXP(XP_Torlof_DMT);
};


instance DIA_Torlof_KAP4_EXIT(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 999;
	condition = DIA_Torlof_KAP4_EXIT_Condition;
	information = DIA_Torlof_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Torlof_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Torlof_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Torlof_WOISTSYLVIO(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 40;
	condition = DIA_Torlof_WOISTSYLVIO_Condition;
	information = DIA_Torlof_WOISTSYLVIO_Info;
	description = "���, ����� ��������� ���� ������?";
};


func int DIA_Torlof_WOISTSYLVIO_Condition()
{
	if((MIS_ReadyforChapter4 == TRUE) || (Kapitel == 4))
	{
		return TRUE;
	};
};

func void DIA_Torlof_WOISTSYLVIO_Info()
{
	AI_Output(other,self,"DIA_Torlof_WOISTSYLVIO_15_00");	//���, ����� ��������� ���� ������?
	AI_Output(self,other,"DIA_Torlof_WOISTSYLVIO_01_01");	//������� ������ ���������� ������ � ���� ����� ������.
	AI_Output(self,other,"DIA_Torlof_WOISTSYLVIO_01_02");	//������������, ��� ��� ��������� �������. ����� �� ��� �������, ��� ���� �� ����������.
	AI_Output(self,other,"DIA_Torlof_WOISTSYLVIO_01_03");	//��� �����? ��������� �������� ��������� ����� ����� ������ �������.
	AI_Output(self,other,"DIA_Torlof_WOISTSYLVIO_01_04");	//�� ���� ��� �� ��������. � �����. � ���������� ����, � ��� ��� ���� �� ������� ������ �������.
};


instance DIA_Torlof_KAP5_EXIT(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 999;
	condition = DIA_Torlof_KAP5_EXIT_Condition;
	information = DIA_Torlof_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Torlof_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Torlof_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Torlof_BEMYCAPTAIN(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 51;
	condition = DIA_Torlof_BEMYCAPTAIN_Condition;
	information = DIA_Torlof_BEMYCAPTAIN_Info;
	description = "�� �����?";
};


func int DIA_Torlof_BEMYCAPTAIN_Condition()
{
	if((Kapitel == 5) && (MIS_SCKnowsWayToIrdorath == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_BEMYCAPTAIN_Info()
{
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN_15_00");	//�� �����?
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_01_01");	//�� ���, ������ ����� �� ����? ��, ���� ������, � �����. � ������ �� �����������?
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN_15_02");	//� ��� �� ����� ���������� ����� ��������. ��� ����� ��������� �� �������.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_01_03");	//(�������) �� �������? �� � ���� ���� ��� �������, �� ������ ��� � �������.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_01_04");	//���, ��� �������. ���� �� ������ ��������������� ����� �������� � �������� �������� � ������� ����, �� ������ ������� �������� ���, ��� �� ���������, � ��� ��������.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_01_05");	//����� ����, � ���� ������� � ������ �������. �������� �� ���� �� ������, ��� � ������.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_01_06");	//������ ��������� ���-�� ����� ���������, ����� ��� �������� ������.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_01_07");	//����������� � ����� � ������ ��������. ������ � ��������� ���� �� ������� ����� � ������ ��. � ���� ����������� �� ���������!
	Log_CreateTopic(Topic_Captain,LOG_MISSION);
	Log_SetTopicStatus(Topic_Captain,LOG_Running);
	B_LogEntry(Topic_Captain,"������ ��� ������ ���������� ������ ���� ��������, � ������ ��������� ��������� �������� �����. �� �������, ��� ����� �������� �������� � ����� � ������ ��������. �� �����, ����� � ����� ���� �� ������� ����� � ��������� � ������� ����� � �����. �� ��������, ��� ��� �������� ��������� �������� �����, ����� ������ ����� ���������.");
};


instance DIA_Torlof_BEMYCAPTAIN2(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 52;
	condition = DIA_Torlof_BEMYCAPTAIN2_Condition;
	information = DIA_Torlof_BEMYCAPTAIN2_Info;
	description = "������ ����� � ������ �������� ������� ...";
};


func int DIA_Torlof_BEMYCAPTAIN2_Condition()
{
	if((MIS_OCGateOpen == TRUE) && Npc_KnowsInfo(other,DIA_Torlof_BEMYCAPTAIN))
	{
		return TRUE;
	};
};

func void DIA_Torlof_BEMYCAPTAIN2_Info()
{
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN2_15_00");	//������ ����� � ������ �������� �������, � �� ���������. ������ ����� �� ���������� �����, � ��� ����� ���� ����� ���������.
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN2_15_01");	//�������� � ����� ����� ������� ������.
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN2_15_02");	//�, � �����, �� ������� ����� �������, ����� �������� �� ������ �������� � ������ ��������, ����� �������� ������, ���������� � �����.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN2_01_03");	//��� ������� �������. ������ ����� �� ������ ��� �������� ��� ����� ��������� �����.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Torlof_BEMYCAPTAIN3(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 53;
	condition = DIA_Torlof_BEMYCAPTAIN3_Condition;
	information = DIA_Torlof_BEMYCAPTAIN3_Info;
	permanent = TRUE;
	description = "������ �� �������� ��� ��������� �� �������?";
};


var int Torlof_PaidToBeCaptain;

func int DIA_Torlof_BEMYCAPTAIN3_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Torlof_BEMYCAPTAIN2) && (Torlof_PaidToBeCaptain == FALSE) && (SCGotCaptain == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_BEMYCAPTAIN3_Info()
{
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN3_15_00");	//������ �� �������� ��� ��������� �� �������?
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_01_01");	//��, ��. �� ����� ��������� �� �������. ���. ��� ��� �������.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_01_02");	//�� ��������� ��� 2500 �������, � � ����� ����� ��������� ������ �������.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_01_03");	//� ����� � ����� �������� ���� ���� � ��������, ����� �� ������ ����� ��������.
	Info_ClearChoices(DIA_Torlof_BEMYCAPTAIN3);
	Info_AddChoice(DIA_Torlof_BEMYCAPTAIN3,"��� ��������� ������� �����.",DIA_Torlof_BEMYCAPTAIN3_zuViel);
	Info_AddChoice(DIA_Torlof_BEMYCAPTAIN3,"������. ��� ���� ������.",DIA_Torlof_BEMYCAPTAIN3_ok);
};

func void DIA_Torlof_BEMYCAPTAIN3_zuViel()
{
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN3_zuViel_15_00");	//��� ��������� ������� �����.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_zuViel_01_01");	//��. ������ ������������� ����� ������. �� � ���� ��� ������� ������. ���� �� ����� ������� �������� ��� ������ �������.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_zuViel_01_02");	//��� ��� ����� ������� � �� �������� �������.
	Info_ClearChoices(DIA_Torlof_BEMYCAPTAIN3);
	B_LogEntry(Topic_Captain,"������ ������ ����� ����������� ��������. ������, �� ����� �������� �� ��� ������ 2500 ������� �����.");
};

func void DIA_Torlof_BEMYCAPTAIN3_ok()
{
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN3_ok_15_00");	//������. ��� ���� ������.
	if(B_GiveInvItems(other,self,ItMi_Gold,2500))
	{
		AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_ok_01_01");	//�����������. ������ ���� �������� ������ ���������� ��������, ��� � ������ ������.
		Torlof_PaidToBeCaptain = TRUE;
		B_LogEntry(Topic_Captain,"����� ����, ��� ������ ������� 2500 ������� �����, ��, �������, ����� ���� �� ����.");
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_ok_01_02");	//�� ��������� ������ ����? ������� ������ ������. ����� � ���������.
	};
	Info_ClearChoices(DIA_Torlof_BEMYCAPTAIN3);
};


instance DIA_Torlof_BEMYCAPTAIN4(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 54;
	condition = DIA_Torlof_BEMYCAPTAIN4_Condition;
	information = DIA_Torlof_BEMYCAPTAIN4_Info;
	permanent = TRUE;
	description = "���� ���� ���������.";
};


func int DIA_Torlof_BEMYCAPTAIN4_Condition()
{
	if((SCGotCaptain == FALSE) && (Torlof_PaidToBeCaptain == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_BEMYCAPTAIN4_Info()
{
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN4_15_00");	//���� ���� ���������.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN4_01_01");	//������. ��� ��� ������� � ������� �������, � � �������� ���� �� ���� ��������� ������.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN4_01_02");	//� ���� ���� ������� �����? ��� ��� �� ������ �� �������.
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN4_15_03");	//� ���������� ��� ����. �������� � �����.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN4_01_04");	//��� �� �������� �������, ��� ��� ��� � ���� ���������.
	AI_StopProcessInfos(self);
	SCGotCaptain = TRUE;
	TorlofIsCaptain = TRUE;
	self.flags = NPC_FLAG_IMMORTAL;
	Npc_ExchangeRoutine(self,"WaitForShipCaptain");
	B_GivePlayerXP(XP_Captain_Success);
};


instance DIA_Torlof_LOSFAHREN(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 59;
	condition = DIA_Torlof_LOSFAHREN_Condition;
	information = DIA_Torlof_LOSFAHREN_Info;
	permanent = TRUE;
	description = "�� ������������ � �������.";
};


func int DIA_Torlof_LOSFAHREN_Condition()
{
	if((TorlofIsCaptain == TRUE) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_LOSFAHREN_Info()
{
	AI_Output(other,self,"DIA_Torlof_LOSFAHREN_15_00");	//�� ������������ � �������.
	if(B_CaptainConditions(self) == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_LOSFAHREN_01_01");	//������. ��� ��� ������� �����, � �� ��������� ������.
		AI_Output(self,other,"DIA_Torlof_LOSFAHREN_01_02");	//(������) ������� ������!
		AI_Output(self,other,"DIA_Torlof_LOSFAHREN_01_03");	//�������, ����� �� �� ����� ��� �����������. �������� �� �����.
		AI_Output(self,other,"DIA_Torlof_LOSFAHREN_01_04");	//���� �� �� ���� ������, ���, �������� � ����������� �����. ��� ����������� ����� ������.
		AI_StopProcessInfos(self);
		B_CaptainCallsAllOnBoard(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_LOSFAHREN_01_05");	//��� �������, ������� � ������� ����� �������� ����������� �� �����, ��������.
		AI_Output(self,other,"DIA_Torlof_LOSFAHREN_01_06");	//��� �����, �� ������� ����, 5 �������, ������� ������ ��� ��� ������.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Torlof_PERM5_NOTCAPTAIN(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 59;
	condition = DIA_Torlof_PERM5_NOTCAPTAIN_Condition;
	information = DIA_Torlof_PERM5_NOTCAPTAIN_Info;
	permanent = TRUE;
	description = "� ����� ����� ������� ��������.";
};


func int DIA_Torlof_PERM5_NOTCAPTAIN_Condition()
{
	if((SCGotCaptain == TRUE) && (TorlofIsCaptain == FALSE) && (Torlof_PaidToBeCaptain == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_PERM5_NOTCAPTAIN_Info()
{
	AI_Output(other,self,"DIA_Torlof_PERM5_NOTCAPTAIN_15_00");	//� ����� ����� ������� ��������. ����� ��� ��� ������.
	AI_Output(self,other,"DIA_Torlof_PERM5_NOTCAPTAIN_01_01");	//����� � ���! ���� �� �������� ��� ������, � ����� ��������� �� ���� �����, ��� ���� ��������.
	AI_StopProcessInfos(self);
};


instance DIA_Torlof_KAP6_EXIT(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 999;
	condition = DIA_Torlof_KAP6_EXIT_Condition;
	information = DIA_Torlof_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Torlof_KAP6_EXIT_Condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Torlof_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Torlof_PICKPOCKET(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 900;
	condition = DIA_Torlof_PICKPOCKET_Condition;
	information = DIA_Torlof_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_Torlof_PICKPOCKET_Condition()
{
	return C_Beklauen(76,120);
};

func void DIA_Torlof_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Torlof_PICKPOCKET);
	Info_AddChoice(DIA_Torlof_PICKPOCKET,Dialog_Back,DIA_Torlof_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Torlof_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Torlof_PICKPOCKET_DoIt);
};

func void DIA_Torlof_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Torlof_PICKPOCKET);
};

func void DIA_Torlof_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Torlof_PICKPOCKET);
};

