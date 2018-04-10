
func void B_Announce_Herold()
{
	var int randy;
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		B_TurnToNpc(self,hero);
	};
	AI_RemoveWeapon(self);
	CreateInvItem(self,Fakescroll);
	AI_UseItemToState(self,Fakescroll,1);
	AI_Output(self,self,"DIA_Herold_Announce_04_00");	//��������, ������ ��������! �� ������� �������� �������������� ����� ������, ������� �������� � ���� ��������� ������.
	if(Kapitel <= 2)
	{
		randy = Hlp_Random(5);
		if(randy == 0)
		{
			AI_Output(self,self,"DIA_Herold_Announce_04_01");	//�������� ����� ��������, ���� � ������� ����� ������ ������� �������� ���� ����� ����������� �� ������������.
			AI_Output(self,self,"DIA_Herold_Announce_04_02");	//����� ����, ����� �������� � ����������� ����������� � ���������� ������ ��������� ���������.
		}
		else if(randy == 1)
		{
			AI_Output(self,self,"DIA_Herold_Announce_04_03");	//� ����� ������� ���� ����� ����������� ����������������� ����� ����������.
			AI_Output(self,self,"DIA_Herold_Announce_04_04");	//��� �������� ����� ������, ������� ������� ������, ������� �������� � ����������� ���������.
		}
		else if(randy == 2)
		{
			AI_Output(self,self,"DIA_Herold_Announce_04_05");	//���� ������������ �� ������ �������� �������� ����� ��� �������.
			AI_Output(self,self,"DIA_Herold_Announce_04_06");	//������ � ����� ��������� ��������� ����� ����� ���������� �������, ����� ������������� ������������������� ������ � ��������.
		}
		else if(randy == 3)
		{
			AI_Output(self,self,"DIA_Herold_Announce_04_07");	//�� ���� ������� � ���������� ����������� ����������� ������� ���������.
			AI_Output(self,self,"DIA_Herold_Announce_04_08");	//��� ����������� ����� ������ ������� ���� ����������� � �������� �� ����������� ���������.
			AI_Output(self,self,"DIA_Herold_Announce_04_09");	//������������� ����� ����� ��������� ������ ����� ������������ ��� ��� ������������� ����������� ������ ����� �������� �������.
			AI_Output(self,self,"DIA_Herold_Announce_04_10");	//��� ������ ��������, �������� � ������������, ������ ���������� ������� � ����� �����.
		}
		else
		{
			AI_Output(self,self,"DIA_Herold_Announce_04_11");	//�������� ��������� ��������� �� ����� �����, ��� ������ ������ ������ ��������������� ������� �������������.
			AI_Output(self,self,"DIA_Herold_Announce_04_12");	//��� ������ ���������� ���������� � �������� ������ ������� � ������� ������� �����������.
		};
	}
	else if(Kapitel == 3)
	{
		if(MIS_RescueBennet != LOG_SUCCESS)
		{
			AI_Output(self,self,"DIA_Herold_Announce_04_13");	//������-������� ������, ��������� ������� �������� ������, ����������� ��������� �� ����� ������.
			AI_Output(self,self,"DIA_Herold_Announce_04_14");	//�� ���������� � ������ ����� ���������. �������� ����� �������� � ���������� � ��������� ���.
		}
		else
		{
			AI_Output(self,self,"DIA_Herold_Announce_04_15");	//� ������� ������� ���� ����� ��� ��������� ���������� ��� ������������, ������� ���� �������� ���������� ����� ������.
		};
	}
	else if(Kapitel == 4)
	{
		AI_Output(self,self,"DIA_Herold_Announce_04_16");	//����� � ��������� �������� � ������ �������� �������� �������� �������.
		AI_Output(self,self,"DIA_Herold_Announce_04_17");	//��� ����� ���������������� ������ � ����� ������� ����� � ���� � ����� ������������ ������� �������.
		AI_Output(self,self,"DIA_Herold_Announce_04_18");	//����� �������� ��� ������� �����, � ������ �������� ��� ��������� ����� ������ ��������� ��� ������������� ��������, ������ ��������� � ���� ����������.
	}
	else
	{
		randy = Hlp_Random(2);
		if(randy == 0)
		{
			AI_Output(self,self,"DIA_Herold_Announce_04_19");	//�������, ���������� ����������� ����� �����, ���� ���������� ������������ ������ ��� ������������� ����� ������.
			AI_Output(self,self,"DIA_Herold_Announce_04_20");	//����� ������ ����� ��������� ���� ����� �� �����, � ����������� ����� ������ �������� � �������������.
		}
		else
		{
			AI_Output(self,self,"DIA_Herold_Announce_04_21");	//���� ����� ����������� ��������� ����������� ������ ��������. �� �������� � ��� ��������� ����������.
			AI_Output(self,self,"DIA_Herold_Announce_04_22");	//���� ����� �������, ��� ����� ������������ � ������ ��������, ����� ���������� �������� ������� ���������� �����.
		};
	};
	AI_UseItemToState(self,Fakescroll,-1);
};

