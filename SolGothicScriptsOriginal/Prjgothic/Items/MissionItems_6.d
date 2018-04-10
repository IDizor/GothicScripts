
instance ItSe_XardasNotfallBeutel_MIS(C_Item)
{
	name = "����� �������� ������� �������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_Pocket.3ds";
	scemeName = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = Use_XardasNotfallBeutel;
	description = name;
	text[0] = "";
	text[1] = "� ���� �������, ������,";
	text[2] = "���������� ������� ������";
	text[3] = "� ��������.";
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_XardasNotfallBeutel()
{
	var string concatText;
	CreateInvItems(hero,ItWr_XardasErmahnungFuerIdioten_MIS,1);
	CreateInvItems(hero,ItMi_InnosEye_Discharged_Mis,1);
	concatText = ConcatStrings("2",PRINT_ItemsErhalten);
	Print(concatText);
};


instance ItWr_XardasErmahnungFuerIdioten_MIS(C_Item)
{
	name = "������ � ���������������� ��������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_XardasErmahnungFuerIdioten;
	scemeName = "MAP";
	description = name;
};


func void Use_XardasErmahnungFuerIdioten()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"��� ���� �������, �� ����� ����������� ����. ��� �� ��� ������� �� ������� � �� ����� ���� ������?");
	Doc_PrintLines(nDocID,0,"��� �������� ������ ���������, ��� ����� ���������� ���� �������. � ��������� ������, ���� ������� �� ������� �������� ��� �� ���  � ��� �������� ����� ������� ���� �� ���� �������.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"                      �������");
	Doc_Show(nDocID);
};


instance ItWr_Krypta_Garon(C_Item)
{
	name = "������ ������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Krypta_Garon;
	scemeName = "MAP";
	description = name;
	text[3] = "���������� ���������� �����.";
};


func void Use_Krypta_Garon()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"��� ����� ������. � ������ ������� �������� ������� �� ���� �����.");
	Doc_PrintLines(nDocID,0,"�������, ��� ����������, ��� � ��� �����. �� ���-����� ���� ��� ��� �������� � ������ ������ �����.");
	Doc_PrintLines(nDocID,0,"������ ������� �� �������. ��������� ������� ������� ���������, ������ �� ���� �������� �� ���� ���������.");
	Doc_PrintLines(nDocID,0,"������ � ��� ������ �� ��� ��������������. � �� ���� ������, ��� ����� ������������ ��� ������ ��� ����� ����� ����.");
	Doc_PrintLines(nDocID,0,"� ����� ��� ������ � ���� ������. �� � �� ������, ������� �� ��� �������� � ����� �������. �������, � ���� ��� ������ � �������, ��� ���-������ ������ ��.");
	Doc_PrintLines(nDocID,0,"������. ������� ���� �������� ���������� �� ��������� ���. ������ ����� �� ���������.");
	Doc_PrintLine(nDocID,0," ");
	Doc_PrintLine(nDocID,0,"�� ������ ����� ���� ����.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"                                 ����");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItKe_OrkKnastDI_MIS(C_Item)
{
	name = "���� ���������� �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItKe_EVT_UNDEAD_01(C_Item)
{
	name = "���� ������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_03;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = name;
};

instance ItKe_EVT_UNDEAD_02(C_Item)
{
	name = "���� ��������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_03;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItKe_LastDoorToUndeadDrgDI_MIS(C_Item)
{
	name = "���� �� ������� ������� ����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_03;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItWr_LastDoorToUndeadDrgDI_MIS(C_Item)
{
	name = "������ ������� ����";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_LastDoorToUndeadDrgDI_MIS;
	scemeName = "MAP";
	description = name;
};


func void Use_ItWr_LastDoorToUndeadDrgDI_MIS()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"����� ");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"���� �����");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"���� ���� �������� ���� ����.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
	B_LogEntry(TOPIC_HallenVonIrdorath,"������ ������� ���� �������� ����� ����� ���� �����. ��� ������ �� �����-�� ���������� �������, �� ��� ���� ��� ������������ - � ��� ����� ���� ����?");
};


instance ItKe_ChestMasterDementor_MIS(C_Item)
{
	name = "���� �� ������� ������� ����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_03;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItWr_Rezept_MegaDrink_MIS(C_Item)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_RezeptFuerMegaTrank;
	scemeName = "MAP";
	description = name;
};


func void Use_RezeptFuerMegaTrank()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"� ������ � ����� ������� ���������. �����, ������, �������� �� ������ ��� ����������.");
	Doc_PrintLines(nDocID,0,"��� ��������, �������� ������, ��� � ������ ���������� ���� ��� ������� � �����. ���� �� ������ �� �� ����� �� ����� ����� ��� ����� ��� ������, � �� ���������.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"������� ��������:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"11 ��������� ���, ���� �������� � ������� ������ ��������� � ������� ����.");
	Doc_PrintLines(nDocID,0,"��� ����� ����� ������� �� �������, ��������� ���������, � ���������� ����� �����������.");
	Doc_PrintLines(nDocID,0,"������������ ������� ����� ������������ � �������������. �� �������� �������� ��������� ��������� � ����� ������������ �������� �� ����.");
	Doc_Show(nDocID);
	PLAYER_TALENT_ALCHEMY[POTION_MegaDrink] = TRUE;
};


instance ItWr_Diary_BlackNovice_MIS(C_Item)
{
	name = "�������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_Diary_BlackNovice;
};


func void Use_Diary_BlackNovice()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"BOOK_RED_L.tga",0);
	Doc_SetPage(nDocID,1,"BOOK_RED_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"� ��� ���������� ��� ��� 36 ����. � ������� �����������, ��� ���� ������ ��������. �� � ������ ���, ��� ��� �������. � ����������� �� ��� ������� �� ����������.");
	Doc_PrintLines(nDocID,0,"������� �������� ��� ������� �������. � ��� �� ������ �����. ���� ��� � ������ ����� ���� � ��� �� ����, ����� ������ �������� ������ ����� ������.");
	Doc_PrintLines(nDocID,0,"��� ����, ��� � �� ����� ����������.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,FONT_Book);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"� ������ � ������� ��� ��� ������-�����. � �� ���� ���������, ����� ����� �������. ���������, �������� �� ��� ������ ���, ����� � ����� ����� �� ���.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"����� � ������� �������. �� �������� ������� � ���� ������� � �������� ��� �� ����, ��� ���� ������ ��� ������������� � �������� ����� � ���������� �������. ���� ��� ������ ������! ������ � ��������� ������� � ���� ���� ...");
	Doc_Show(nDocID);
	B_LogEntry(TOPIC_HallenVonIrdorath,"� �������� ������� ����-���������� ����������� ������ � ��������, �������, ���������� �������������� � ����� ���� ���. � ������ ��������� ���, ������� �� ������ �������, ��� ����������, � ��� ���.");
};


instance ItWr_ZugBruecke_MIS(C_Item)
{
	name = "������ ������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ZugBruecke;
	scemeName = "MAP";
	description = name;
};


func void Use_ZugBruecke()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"   ��������� ��������������!");
	Doc_SetMargins(nDocID,-1,50,50,70,50,1);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"���� �� ����������, ������� �� �������� ���� � ������ ������� ��� ���. ���� ��� ��������� ��� ������ - �� ��� ������������ ������ � ���.");
	Doc_PrintLines(nDocID,0,"� ��������� �������� ���� �������� �� ��� ���, ���� � �������� �����. � ���� � ������, ��� ���-�� �������� ������ ������������� ��� ������ ���� � ������, � ����� ������� ����� ������ �� ��������� ������!");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"                      �����");
	Doc_Show(nDocID);
};


instance ItMi_PowerEye(C_Item)
{
	name = "���� ����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "ItMi_DarkPearl.3ds";
	material = MAT_METAL;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};

