
func void B_LastWarningVatras()
{
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_ADD_05_00");	//�������, ��� �� ������?
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_ADD_05_01");	//����� ���� ����� ��� ������������ ���� �� ��������� ��������� � ���� ���.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_ADD_05_02");	//��� �� �����, � �����, ��� �� ���� � ���� ��������������� ����������.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_ADD_05_03");	//�� ������ � ������ ���� � ���. �� ������� �� ������ �������������.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_ADD_05_04");	//��������� �������� ����� ������� �� ����� ����.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_ADD_05_05");	//������ �� - ������� ��� ����.
};

func void B_VatrasPissedOff()
{
	AI_Output(self,other,"DIA_Addon_Vatras_PissedOffPerm_Add_05_00");	//������ �� �� ������ ������������ �� ���� ������.
	AI_Output(self,other,"DIA_Addon_Vatras_PissedOffPerm_Add_05_01");	//��������. ��� ���� �� ������ �����.
	if(Vatras_IsOnBoard == LOG_SUCCESS)
	{
		Crewmember_Count = Crewmember_Count - 1;
	};
	Vatras_IsOnBoard = LOG_FAILED;
	self.flags = 0;
	VatrasPissedOffForever = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"PRAY");
};

