
instance ItMi_StoneOfKnowlegde_MIS(C_Item)
{
	name = "������ ������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItMi_StoneOfKnowlegde_MIS.3DS";
	material = MAT_STONE;
	description = name;
};

instance ItWr_PaladinLetter_MIS(C_Item)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = UsePaladinLetter;
	scemeName = "MAP";
	description = "������ ����� ������";
};


func void UsePaladinLetter()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"���� �����!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"���������� � ������ �������� ����������� ��������. �� ������� �������� ������. ��, ���� ������� ������, ������� � �����, ���������� ������.");
	Doc_PrintLines(nDocID,0,"�� ������������ ������������ ��������� ��������. ��� ���������� ����� ������ �����. �������, � ������� ������ �� ������ ������������ �� �������� ������������. ���� �������� ������ �� �� ������.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"�� ������� ��� �����.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"������");
	Doc_Show(nDocID);
};


instance ItWr_LetterForGorn_MIS(C_Item)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseLetterForGorn;
	scemeName = "MAP";
	description = "��������� ������� �����";
};


func void UseLetterForGorn()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0," ");
	Doc_PrintLine(nDocID,0," ");
	Doc_PrintLine(nDocID,0," ");
	Doc_PrintLine(nDocID,0," ");
	Doc_PrintLine(nDocID,0,"����!");
	Doc_PrintLine(nDocID,0," ");
	Doc_PrintLines(nDocID,0,"������ ���������� ���������� ���� - �� 1000 �������.");
	Doc_PrintLines(nDocID,0,"��� ��� ���� � ���� ���� ���-�� ������������ ���������, ����� ����� ������� �� ����.");
	Doc_PrintLine(nDocID,0," ");
	Doc_PrintLine(nDocID,0," ");
	Doc_PrintLine(nDocID,0,"������ ");
	Doc_Show(nDocID);
};


instance ItKe_PrisonKey_MIS(C_Item)
{
	name = "���� �� �������";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "��� ���� �� �������";
	text[3] = "� �����.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItKe_OC_Store(C_Item)
{
	name = "���� �� ��������";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "��� ���� �� ��������";
	text[3] = "� �����.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITKE_ErzBaronFlur(C_Item)
{
	name = "���� �� �����";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = "�� ������ �����.";
	text[2] = "�� ��� ������������� ���.";
	text[3] = "�����";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITKE_ErzBaronRaum(C_Item)
{
	name = "���� �� �����";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = "�� ������ �����.";
	text[2] = "�� ��� ������������� ���.";
	text[3] = "�����";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_GornsTreasure_MIS(C_Item)
{
	name = "������� �������";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 250;
	visual = "ItMi_Pocket.3ds";
	scemeName = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = UseGornsTreasure;
	description = "������� ������� �����.";
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseGornsTreasure()
{
	B_PlayerFindItem(ItMi_Gold,250);
	Gorns_Beutel = TRUE;
};


instance ItWr_Silvestro_MIS(C_Item)
{
	name = "�������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseItwr_Silvestro;
	scemeName = "MAP";
	description = "������� ����������";
};


func void UseItwr_Silvestro()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"�� ������������ �������� ����������");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"��� ���� ��� ���� ���� ��������. ������� �� ���������� ��������� ����� ����� � ���������� ������ � �����.");
	Doc_PrintLines(nDocID,0,"� ���� ��������� ������������, ������� � ����������� �������� ����.");
	Doc_PrintLines(nDocID,0,"����� ������������ �� ���, ��� ������ ������������� �����. � �������� �������� ���. �� ��������� ������� � ���������� ����� - �� � �� ������� ��� ����� ������.");
	Doc_PrintLines(nDocID,0,"��� ���� ����� ��������� �� ��� �� �� �� �����, ������� � ��������� � ����� ���� �������.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"�� ����������� ������.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"����������");
	Doc_Show(nDocID);
};


instance ItAt_ClawLeader(C_Item)
{
	name = "����� ��������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 100;
	visual = "ItAt_Claw.3DS";
	material = MAT_LEATHER;
	description = "����� ������ ����";
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSe_Olav(C_Item)
{
	name = "������� �������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 25;
	visual = "ItMi_Pocket.3ds";
	scemeName = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = UseOlav;
	description = "������� �����";
	text[0] = "";
	text[1] = "";
	text[2] = "������ ����������� ��������� �����.";
	text[3] = "";
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseOlav()
{
	B_PlayerFindItem(ItMi_Gold,25);
};


instance ItMi_GoldPlate_MIS(C_Item)
{
	name = "������� �������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_GoldPlate;
	visual = "ItMi_GoldPlate.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItKe_Pass_MIS(C_Item)
{
	name = "���� �� �������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = "��������� ������";
	text[1] = "��������� ������ �������.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItKe_Bromor(C_Item)
{
	name = "���� �������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = "���� �� �������";
	text[1] = "�����.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITKE_RUNE_MIS(C_Item)
{
	name = "����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = "��������� ������ �� �������.";
	text[1] = "������, � �������� ��������";
	text[2] = "���� ����, ��������� ��� ������.";
	text[3] = "� ��� ����� ������ ������.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItWr_Bloody_MIS(C_Item)
{
	name = "�������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseBloodMIS;
	scemeName = "MAP";
	description = "�� �������� ���";
};


func void UseBloodMIS()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"���� �������� ��� �������� ����������� ��, � �� ���� ������� � ������� ��� �� ������� ��� � ����.");
	Doc_PrintLines(nDocID,0,"���� ������ �� �� ������� ���������� ���������� ���� � ��� ���������.");
	Doc_PrintLines(nDocID,0,"���� ���������� ��������� ��������� ������ ����� �� ������� �� ���������.");
	Doc_PrintLines(nDocID,0,"������� ���� ���������. ����� ����������� ����� ������ �����.");
	Doc_PrintLines(nDocID,0,"������������ ��� ������� ��� �������� ��������� ����������.");
	Doc_PrintLines(nDocID,0,"������, �� �������� ������������ ���������� ��������������� � ����� ��������� �����.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"�������");
	Doc_Show(nDocID);
	if(Knows_Bloodfly == FALSE)
	{
		Knows_Bloodfly = TRUE;
		Log_CreateTopic(Topic_Bonus,LOG_NOTE);
		B_LogEntry(Topic_Bonus,"������ � ����, ��� ���������� �������, ����� ������ �������� ��� �� ���� �������� ����.");
		B_GivePlayerXP(XP_Ambient);
	};
};


instance ItWr_Pfandbrief_MIS(C_Item)
{
	name = "���������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = UsePfandbrief;
	scemeName = "MAP";
	description = name;
};


func void UsePfandbrief()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0," ");
	Doc_PrintLine(nDocID,0,"� �������� �������� ��������� �����");
	Doc_PrintLine(nDocID,0,"����������� �����, ��������� ��������");
	Doc_PrintLine(nDocID,0,"����� ����� �����.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"�����: ����������������� ������� �����");
	Doc_PrintLines(nDocID,0,"�� ��������� �������� ������");
	Doc_PrintLine(nDocID,0," ");
	Doc_PrintLine(nDocID,0,"�������");
	Doc_PrintLine(nDocID,0,"������, ��������  ");
	Doc_PrintLine(nDocID,0," ");
	Doc_PrintLine(nDocID,0,"�����, ���������");
	Doc_Show(nDocID);
};


instance ItWr_Map_OldWorld_Oremines_MIS(C_Item)
{
	name = "����� �������� �������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 50;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_OldWorld_Oremines;
	description = name;
	text[0] = "";
	text[1] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Map_OldWorld_Oremines()
{
	var int Document;
	if(Npc_IsPlayer(self))
	{
		B_SetPlayerMap(ItWr_Map_OldWorld_Oremines_MIS);
	};
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_OldWorld_Oremines.tga",TRUE);
	Doc_SetLevel(Document,"OldWorld\OldWorld.zen");
	Doc_SetLevelCoords(Document,-78500,47500,54000,-53000);
	Doc_Show(Document);
};


instance ItWr_Manowar(C_Item)
{
	name = "�����";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseManowar;
	scemeName = "MAP";
	description = "����� �����.";
};


func void UseManowar()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"���� ��������");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"�� �������� ��� ��������.");
	Doc_PrintLines(nDocID,0,"����� ������ �� ���� � ����� ��������.");
	Doc_PrintLines(nDocID,0,"� ���� ������, ��� ���������� ���������� ����");
	Doc_PrintLines(nDocID,0,"� ���� ������ ����� ��� �����.");
	Doc_PrintLines(nDocID,0,"��� ��� ������ ������ ���.");
	Doc_PrintLines(nDocID,0,"��� ��� ������ � ���� �� �����.");
	Doc_PrintLines(nDocID,0,"�����, ��� ������������ ���,");
	Doc_PrintLines(nDocID,0,"����� �� ��� ����,");
	Doc_PrintLines(nDocID,0,"���� � ���� ������.");
	Doc_Show(nDocID);
};


instance ItWr_KDWLetter(C_Item)
{
	name = "���������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseKDWLetter;
	scemeName = "MAP";
	description = "���������.";
};


func void UseKDWLetter()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"�� �������� ������. ������, ����� ������ ���, �� ���������� �� ������ ������ ����������. ��������, ��� �� ������ ������ �� �������, ������� �� �������� ������� ������ ���. ������ ������� ������, ���� �������� ��� ��� ����.");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"�� �������� � ���� ������.");
	Doc_PrintLine(nDocID,0,"�������");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItWr_GilbertLetter(C_Item)
{
	name = "�������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseGilbertLetter;
	scemeName = "MAP";
	description = "���������.";
};


func void UseGilbertLetter()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"� ���� ������. � ����� ��������� �����. � ���� ����� ����� - ������, �������, ���.");
	Doc_PrintLines(nDocID,0,"���� �� ���-�� ����� ������ ���� ������. ���� ��� ������� ��� ������ � ��� ��� ������� ������. ������ ����� ������������ �����.");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"��������");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItRi_Tengron(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_Ri_Hp;
	visual = "ItRi_Hp_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Tengron;
	on_unequip = UnEquip_ItRi_Tengron;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = NAME_ADDON_TengronsRing;
	text[2] = NAME_Bonus_HP;
	count[2] = Ri_Hp;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_ItRi_Tengron()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + Ri_Hp;
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + Ri_Hp;
};

func void UnEquip_ItRi_Tengron()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - Ri_Hp;
	if(self.attribute[ATR_HITPOINTS] > (Ri_Hp + 1))
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - Ri_Hp;
	}
	else
	{
		self.attribute[ATR_HITPOINTS] = 2;
	};
};

