
var int EnterDI_Kapitel6;

func void enter_di_firsttime_trigger()
{
	if(Npc_HasItems(hero,ItKe_Ship_Levelchange_MIS))
	{
		Npc_RemoveInvItems(hero,ItKe_Ship_Levelchange_MIS,1);
	};
	if(hero.attribute[ATR_DEXTERITY] < 15)
	{
		Wld_InsertItem(ItPo_Perm_DEX,"FP_ITEM_DI_ENTER_05");
	};
	if(EnterDI_Kapitel6 == FALSE)
	{
		if(hero.guild == GIL_PAL)
		{
			CreateInvItems(Archol,ItRu_PalDestroyEvil,1);
		};
		Wld_InsertItem(ItMi_Flask,"FP_ITEM_SHIP_12");
		if(Npc_HasItems(hero,ItMi_InnosEye_MIS) == FALSE)
		{
			if(Npc_HasItems(hero,ItMi_InnosEye_Discharged_Mis) == FALSE)
			{
				Wld_InsertItem(ItSe_XardasNotfallBeutel_MIS,"FP_ITEM_SHIP_12");
				SC_InnosEyeVergessen_DI = TRUE;
				B_LogEntry(TOPIC_HallenVonIrdorath,"������� ����� ��� ��������� ���. �� ���� ������� �������, �� �������� ���� ������� � ������������� ����� �� �������, ����� ������� ���-��� � ����. ��� ����� �������, �� � ������ �� ��� ����� �������.");
			};
			Wld_InsertItem(ItMi_Flask,"FP_ITEM_SHIP_06");
			if(((Npc_HasItems(hero,ItAt_IcedragonHeart) >= 1) || (Npc_HasItems(hero,ItAt_RockdragonHeart) >= 1) || (Npc_HasItems(hero,ItAt_FiredragonHeart) >= 1) || (Npc_HasItems(hero,ItAt_SwampdragonHeart) >= 1)) == FALSE)
			{
				CreateInvItems(OrkElite_AntiPaladinOrkOberst_DI,ItAt_RockdragonHeart,1);
			};
		};
		Log_CreateTopic(TOPIC_MyCrew,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_MyCrew,LOG_Running);
		if(JorgenIsCaptain == TRUE)
		{
			Log_AddEntry(TOPIC_MyCrew,"������, ��� �������, ����� ����� �� ������� ����� �����������.");
		};
		if(TorlofIsCaptain == TRUE)
		{
			Log_AddEntry(TOPIC_MyCrew,"������, ��� �������, ����� ����� �� ������� � ��������� ��� �� ����� ����� ����������. �� ����� ����� ������ ��� �������� ��� ���� � ��������.");
		};
		if(JackIsCaptain == TRUE)
		{
			Log_AddEntry(TOPIC_MyCrew,"����, ��� �������, ����� ����� �� ������� ����� �����������. ������, �� ������� �������. �������, �� ������� ���� � ����. �� ����� ���.");
		};
		if(Lee_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"�� ����� ����������� �������� � ��� ����������. �� ����� ����� ������ ��� ��������� ����� ������� ��������� � ���������� �������.");
		};
		if(MiltenNW_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"������ ����� ������ ��� �������� ��� ����.");
			if(hero.guild == GIL_KDF)
			{
				Log_AddEntry(TOPIC_MyCrew,"����� ����� ������ ����� ������� ���� ��������� ����.");
			};
		};
		if(Lester_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"� ���� ����� �����������, ��� ��������� ������� ������ ���������� �� ���� �������� �������.");
		};
		if(Mario_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"����� ����� ���� ������� �������. �� ������ ����� �� ����� � ��� ����� �� ���� ����� �� ������ �� �����.");
		};
		if(Wolf_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"����� ����� ������� ���� �������� �� �������� � ����.");
		};
		if(Vatras_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"������ �������� � ����� �����. �� ����� ������ ���� � ����� ��������� �������� ������������� �����.");
			if(hero.guild == GIL_KDF)
			{
				Log_AddEntry(TOPIC_MyCrew,"������ ����� ����� �������� ��� ���������� ����.");
			};
		};
		if(Bennet_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"������ ������ ���� ���������� ����, ���� � ������.");
		};
		if(Diego_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"����� ������� ���, ���� � �� ����, ��� ������, ����� � ���� ���� �������� ��� ����. �� ����� ������� ���� ������������ ��������� � ����� �������� �� ���� � ��������.");
		};
		if(Gorn_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"���� �� ���� �� ������ �� ����� ������ �����������. �� ����� ������������� �� ��������. � �����, ������� ����� � �������� �����.");
			Log_AddEntry(TOPIC_MyCrew,"���� ����� ������ ��� ��������� ����� ������� ��������� �������.");
		};
		if(Lares_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"����� ������ ������� ���� �������� � ��������� ���������� �������. ����� ����� �� ����� �������� ��� ��������.");
		};
		if(Biff_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"���� ������� ����� �� �����, ��� ��������. ��� ������ ��������������.");
		};
		if(Angar_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"����� ����� ���������. ��� �������, ��� ��� �������, � �� ������� ����-������ ��������� ��� �������.");
		};
		if(Girion_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"������ ����������. ��� ����������� ��������. � �� ������������ ���������� ���. ��� ����� ����������� ���.");
		};
		IntroduceChapter(KapWechsel_6,KapWechsel_6_Text,"chapter6.tga","chapter_01.wav",6000);
		EnterDI_Kapitel6 = TRUE;
	};
};

