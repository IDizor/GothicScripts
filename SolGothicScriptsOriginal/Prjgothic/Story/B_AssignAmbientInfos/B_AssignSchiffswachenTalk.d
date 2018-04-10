
func void B_AssignSchiffswachenGuard(var C_Npc Schiffswache)
{
	if((MIS_ShipIsFree == TRUE) || (MIS_SCvisitShip == LOG_Running))
	{
		if(Schiffswache.voice == 4)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_Ambient_04_00");	//�� ������ �� �����. ����� �� ����.
		};
		if(Schiffswache.voice == 9)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_Ambient_09_01");	//�� �������� ����� �������, ������?
		};
		if(Schiffswache.voice == 12)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_Ambient_12_02");	//���� �� ����� �������� �����, �����?
		};
		AI_StopProcessInfos(Schiffswache);
		Npc_SetRefuseTalk(Schiffswache,60);
		Npc_SetRefuseTalk(Pal_220_Schiffswache,60);
		Npc_SetRefuseTalk(Pal_221_Schiffswache,60);
		Npc_SetRefuseTalk(Pal_222_Schiffswache,60);
		Npc_SetRefuseTalk(Pal_223_Schiffswache,60);
		Npc_SetRefuseTalk(Pal_224_Schiffswache,60);
		Npc_SetRefuseTalk(Pal_225_Schiffswache,60);
		Npc_SetRefuseTalk(Pal_226_Schiffswache,60);
		Npc_SetRefuseTalk(Pal_227_Schiffswache,60);
		Npc_SetRefuseTalk(Pal_228_Schiffswache,60);
	}
	else
	{
		B_Say(self,other,"$ALARM");
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_GuardStopsIntruder,1);
		Npc_SetRefuseTalk(Schiffswache,20);
		Npc_SetRefuseTalk(Pal_220_Schiffswache,20);
		Npc_SetRefuseTalk(Pal_221_Schiffswache,20);
		Npc_SetRefuseTalk(Pal_222_Schiffswache,20);
		Npc_SetRefuseTalk(Pal_223_Schiffswache,20);
		Npc_SetRefuseTalk(Pal_224_Schiffswache,20);
		Npc_SetRefuseTalk(Pal_225_Schiffswache,20);
		Npc_SetRefuseTalk(Pal_226_Schiffswache,20);
		Npc_SetRefuseTalk(Pal_227_Schiffswache,20);
		Npc_SetRefuseTalk(Pal_228_Schiffswache,20);
	};
};

func void B_AssignSchiffswachenInfos(var C_Npc Schiffswache)
{
	if(MIS_OCGateOpen == TRUE)
	{
		if(Schiffswache.voice == 4)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_AmbientKap5_04_00");	//��� ��������� ���� �������� ����� �������. �� ������ ����������� ����������.
		};
		if(Schiffswache.voice == 9)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_AmbientKap5_09_01");	//���� �� ��� ������� ����� ����� ���������, ��� ������ ������� ������ �����, �� �� ��� ��������!
		};
		if(Schiffswache.voice == 12)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_AmbientKap5_12_02");	//�� �� ����� ����� ������. ����� ������ � ������ �������� ����� ������, ����� ���������� �� ��������� ������ �����.
		};
	}
	else
	{
		if(Schiffswache.voice == 4)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_AmbientKap5_04_03");	//������ ������� �������� �����������. �� ����� ������������ � ������ ��������.
		};
		if(Schiffswache.voice == 9)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_AmbientKap5_09_04");	//����� ����� ����������� ����.
		};
		if(Schiffswache.voice == 12)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_AmbientKap5_12_05");	//� �� ���� ���������, ����� ��, �������, ������� ���� �����. �� ������, ����� �� ������ ������� ��.
		};
	};
	AI_StopProcessInfos(Schiffswache);
};

func void B_AssignSchiffswachenTalk(var C_Npc Schiffswache)
{
	if(Kapitel >= 5)
	{
		B_AssignSchiffswachenInfos(Schiffswache);
	}
	else
	{
		B_AssignSchiffswachenGuard(Schiffswache);
	};
};

func int B_AssignSchiffswachenInfoConditions(var C_Npc Schiffswache)
{
	if((Kapitel < 5) && (Npc_RefuseTalk(self) == FALSE) && (MIS_SCvisitShip != LOG_Running))
	{
		return TRUE;
	}
	else if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

