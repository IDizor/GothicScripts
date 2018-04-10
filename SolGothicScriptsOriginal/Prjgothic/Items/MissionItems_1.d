
instance ItKe_Xardas(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "���� �� �������,";
	text[3] = "�������������� ��������.";
};

instance ItWr_Canthars_KomproBrief_MIS(C_Item)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Canthars_KomproBrief;
	scemeName = "MAP";
	description = "������ ������� �������� ����.";
};


func void Use_Canthars_KomproBrief()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"     ��������� ��������������");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"        � ��� ��������� ��� ��������� ����,");
	Doc_PrintLine(nDocID,0,"        �������� ���� ��������,");
	Doc_PrintLine(nDocID,0,"        ��� ��� ������ ���������� ������,");
	Doc_PrintLine(nDocID,0,"        ���������� � ���� ������");
	Doc_PrintLine(nDocID,0,"        �����.");
	Doc_PrintLine(nDocID,0,"        ���� � ������ �� ������ �� ���� �������");
	Doc_PrintLine(nDocID,0,"        ������, ����, � ���� �������� ��������");
	Doc_PrintLine(nDocID,0,"        ���� ��������� � ����. �������, ");
	Doc_PrintLine(nDocID,0,"        �� �������� ���� �����!!!!!!!!!!!!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"            ����");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItMw_2h_Rod(C_Item)
{
	name = "��������� ��� ����";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = Value_Sld2hSchwert;
	damageTotal = Damage_Rod;
	damagetype = DAM_EDGE;
	range = Range_Sld2hSchwert;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Rod;
	visual = "ItMw_035_2h_sld_sword_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_CoragonsSilber(C_Item)
{
	name = "������� ��������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_SilverCup;
	visual = "ItMi_SilverCup.3DS";
	material = MAT_METAL;
	description = name;
	text[3] = "";
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_TheklasPaket(C_Item)
{
	name = "����� �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItMi_Packet.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = Use_TheklasPacket;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_TheklasPacket()
{
	CreateInvItems(hero,ItPl_Mana_Herb_01,3);
	CreateInvItems(hero,ItPl_Health_Herb_02,1);
	CreateInvItems(hero,ItPl_Speed_Herb_01,1);
	CreateInvItems(hero,ItPl_Blueplant,2);
	Print(PRINT_GotPlants);
};


instance ItMi_MariasGoldPlate(C_Item)
{
	name = "������� ������� �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_GoldPlate;
	visual = "ItMi_GoldPlate.3DS";
	material = MAT_METAL;
	description = name;
	text[2] = "�� ���� ����� �������������";
	text[3] = "�����: ���� � �����.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRi_ValentinosRing(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_Ri_ProtEdge;
	visual = "ItRi_Prot_Edge_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ValentinosRing;
	on_unequip = UnEquip_ValentinosRing;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "������ ���������";
	text[2] = NAME_Prot_Edge;
	count[2] = Ri_ProtEdge;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_ValentinosRing()
{
	self.protection[PROT_EDGE] += Ri_ProtEdge;
	self.protection[PROT_BLUNT] += Ri_ProtEdge;
};

func void UnEquip_ValentinosRing()
{
	self.protection[PROT_EDGE] -= Ri_ProtEdge;
	self.protection[PROT_BLUNT] -= Ri_ProtEdge;
};


instance ItKe_Dexter(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "���� �� �������,";
	text[3] = "�������������� ��������.";
};

instance ItWr_Kraeuterliste(C_Item)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Kraeuterliste;
	scemeName = "MAP";
	description = "������ ���� �����������.";
};


func void Use_Kraeuterliste()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"������������ �����");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"�������� �����");
	Doc_PrintLine(nDocID,0,"�������� ��������");
	Doc_PrintLine(nDocID,0,"�������� ������");
	Doc_PrintLine(nDocID,0,"�������� �������");
	Doc_PrintLine(nDocID,0,"�������� �����");
	Doc_PrintLine(nDocID,0,"�������� ������");
	Doc_PrintLine(nDocID,0,"���������� �����");
	Doc_PrintLine(nDocID,0,"�������� ������");
	Doc_PrintLine(nDocID,0,"�������-�����");
	Doc_PrintLine(nDocID,0,"������� �����");
	Doc_PrintLine(nDocID,0,"������� ������");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"����������: ����� �������� � ������� ������� ��� ����� �� ����. ��� �������� ��������� ��� �����������. ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"� ���������, �����.");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItWr_ManaRezept(C_Item)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 20;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ManaRezept;
	scemeName = "MAP";
	description = "������ ���������� ��������.";
};


func void Use_ManaRezept()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"���������� �����");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"����� ������� ���������� �����, �������� �������� ����������:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"�������� �������");
	Doc_PrintLine(nDocID,0,"�������� �����");
	Doc_PrintLine(nDocID,0,"�������� ������");
	Doc_PrintLines(nDocID,0,"����� ��� �����������");
	Doc_PrintLine(nDocID,0,"������� �����");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"������ ������");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItWr_Passierschein(C_Item)
{
	name = "�������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UsePassierschein;
	scemeName = "MAP";
	description = name;
	text[3] = "��� ������ �������� ���";
	text[4] = "������ ���� ���������� � �����.";
};


func void UsePassierschein()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"     �������");
	Doc_PrintLine(nDocID,0,"            �������    ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"        ���� �������� ���� �����");
	Doc_PrintLine(nDocID,0,"        ���������� ������� �� ����� �������");
	Doc_PrintLine(nDocID,0,"        �������� �� �������������� ������ �������.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"            ������");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"            ����������� ����������");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItMi_HerbPaket(C_Item)
{
	name = "��� �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItMi_Packet.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "�������, ������ ���,";
	text[3] = "�������� �������� ������.";
	text[5] = NAME_Value;
	count[5] = 200;
};

instance ItKe_Storage(C_Item)
{
	name = "���� �� ������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "���� �� ���������";
	text[3] = "������.";
};


const int HP_Hering = 20;

instance ItFo_SmellyFish(C_Item)
{
	name = "�������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItFo_Fish.3DS";
	material = MAT_LEATHER;
	scemeName = "FOOD";
	on_state[0] = Use_SmellyFish;
	description = "�������.";
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Hering;
	text[5] = NAME_Value;
	count[5] = Value_Fish;
};


func void Use_SmellyFish()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Hering);
};


instance ItFo_HalvorFish_MIS(C_Item)
{
	name = "�������� ����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItFo_Fish.3DS";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	on_state[0] = Use_HalvorFish;
	description = "������� ���������� ����.";
	text[2] = "���-�� � ���� ����� �� ���.";
	text[3] = "������, ��� ���� ������ ...";
};


func void Use_HalvorFish()
{
	CreateInvItems(hero,ItWr_HalvorMessage,1);
	Print(PRINT_FishLetter);
};


instance ItWr_HalvorMessage(C_Item)
{
	name = "������� �������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseHalvorMessage;
	scemeName = "MAP";
	description = name;
	text[2] = "��� ������� ���� �������� � ����.";
};


func void UseHalvorMessage()
{
	var int nDocID;
	Knows_Halvor = TRUE;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"    �� �������������, �����! ");
	Doc_PrintLine(nDocID,0,"    ��������� ���������� ��������������.");
	Doc_PrintLine(nDocID,0,"    �� �������������� ������,");
	Doc_PrintLine(nDocID,0,"    ���� � �� ��� ����� � ����!");
	Doc_PrintLine(nDocID,0,"    ������");
	Doc_Show(nDocID);
};


instance ItMw_AlriksSword_Mis(C_Item)
{
	name = "��� �������";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_MISSION | ITEM_SWD;
	material = MAT_METAL;
	value = Value_Alrik;
	damageTotal = Damage_Alrik;
	damagetype = DAM_EDGE;
	range = Range_Alrik;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Alrik;
	visual = "ItMw_025_1h_Sld_Sword_01.3DS";
	on_equip = Equip_AlriksSword;
	on_unequip = UnEquip_AlriksSword;
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Equip_AlriksSword()
{
	B_AddFightSkill(self,NPC_TALENT_1H,10);
};

func void UnEquip_AlriksSword()
{
	B_AddFightSkill(self,NPC_TALENT_1H,-10);
};


instance ItWr_VatrasMessage(C_Item)
{
	name = "������������ ��������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseVatrasMessage;
	scemeName = "MAPSEALED";
	description = name;
	text[2] = "�������� �������";
	text[3] = "����� ����";
};


func void UseVatrasMessage()
{
	var int nDocID;
	CreateInvItems(self,ItWr_VatrasMessage_Open,1);
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"������� �������,");
	Doc_PrintLines(nDocID,0,"� ������ ��� ����������� ����������� ������ ����.");
	Doc_PrintLines(nDocID,0,"��� ����, ������ ��������� ���. ����� �� ���� ���, ��� ������� ������� ��� ������?");
	Doc_PrintLines(nDocID,0,"� ���� ���������, �� � ����, ��� ���� �������� ������ �� ����������� � ���� ��������. ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"�� �� ��������� ���� ������� ��� ������.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"������");
	Doc_Show(nDocID);
};


instance ItWr_VatrasMessage_Open(C_Item)
{
	name = "��������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseVatrasMessageOpen;
	scemeName = "MAP";
	description = name;
	text[2] = "�������� �������";
	text[3] = "����� ����";
	text[4] = "������ �������.";
};


func void UseVatrasMessageOpen()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"������� �������,");
	Doc_PrintLines(nDocID,0,"� ������ ��� ����������� ����������� ������ ����.");
	Doc_PrintLines(nDocID,0,"��� ����, ������ ��������� ���. ����� �� ���� ���, ��� ������� ������� ��� ������?");
	Doc_PrintLines(nDocID,0,"� ���� ���������, �� � �������, ��� ���� �������� ������ �� ����������� � ���� ��������. ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"�� �� ��������� ���� ������� ��� ������.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"������");
	Doc_Show(nDocID);
};


instance ItKe_Hotel(C_Item)
{
	name = "���� �� �������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "���� �� �������";
	text[3] = "�����.";
};

instance ItKe_ThiefGuildKey_MIS(C_Item)
{
	name = "������ ����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "���� ���� ������� ������� ������� �����.";
};

instance ItKe_ThiefGuildKey_Hotel_MIS(C_Item)
{
	name = "������ ����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "��� ���� �� ������� �����.";
};

instance ItKe_Innos_MIS(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "��� ���� �� ������� �";
	text[3] = "��������� ������.";
};

instance ItKe_KlosterSchatz(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "��� ���� �� ������������";
	text[3] = "������������.";
};

instance ItKe_KlosterStore(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "��� ���� �� ������������";
	text[3] = "��������.";
};

instance ItKe_KDFPlayer(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "��� ���� �� ������������";
	text[3] = "�����.";
};

instance ItKe_KlosterBibliothek(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "��� ���� �� ������������";
	text[3] = "����������.";
};

instance ItFo_Schafswurst(C_Item)
{
	name = "������� �������";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Sausage;
	visual = "ItFo_Sausage.3DS";
	material = MAT_LEATHER;
	scemeName = "FOOD";
	on_state[0] = Use_Schafswurst;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Sausage;
	text[5] = NAME_Value;
	count[5] = Value_Sausage;
};


func void Use_Schafswurst()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Sausage);
};


instance ItPo_Perm_LittleMana(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = 150;
	visual = "ItPo_Perm_Mana.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_LittleMana;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_MANAPOTION";
	description = "�������� ����";
	text[1] = NAME_Bonus_ManaMax;
	count[1] = 3;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseItPo_LittleMana()
{
	B_RaiseAttribute(self,ATR_MANA_MAX,3);
	Npc_ChangeAttribute(self,ATR_MANA,3);
};


instance Holy_Hammer_MIS(C_Item)
{
	name = "��������� �����";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_MISSION | ITEM_2HD_AXE;
	material = MAT_METAL;
	value = Value_HolyHammer;
	owner = Nov_608_Garwig;
	damageTotal = Damage_HolyHammer;
	damagetype = DAM_BLUNT;
	range = Range_HolyHammer;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_HolyHammer;
	visual = "ItMw_030_2h_kdf_hammer_01.3DS";
	description = name;
	text[2] = "����:                   ??";
	text[3] = "���������� ����:          ??";
	text[4] = "��������� ������";
	text[5] = "����:  ���������� ����������";
};

instance ItKe_MagicChest(C_Item)
{
	name = "������ ����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "������ �������� ����.";
	text[3] = "��������, ��� ����";
	text[4] = "�� �������� �����.";
};

instance ItWr_Passage_MIS(C_Item)
{
	name = "����������� ���� ���������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UsePassage;
	scemeName = "MAP";
	description = name;
	text[3] = "��� ������� ������ ������ ���";
	text[4] = "����������� � ������ �������.";
};


func void UsePassage()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"���������������� ���� �����,");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"�� ��� ��������� �����, � ����� �������� �� ����������. �, �������� ��������������, � ��������� ��������� ����������:");
	Doc_PrintLines(nDocID,0,"�� ������� ���� ����� ������ ��������� ������ ����� ������� � �������.");
	Doc_PrintLines(nDocID,0,"������, �� ���������� ��� ���� ������ � ������� ������ � ����������� ������.");
	Doc_PrintLines(nDocID,0,"����� ����, � ����� �������� �� ���, ����� ��� ���� ��������� �������� �� ������� ���� - �� �����������, �����������, ����� �����, ��� �� ���������������.");
	Doc_PrintLines(nDocID,0,"� ����, ��� �� �������, �� ������� �� ����������� ����������� �� �������, ������ ���������� �����, ��� ��� ����, ��� � ��� ���� ��������� �����. ����� �� ��������� ������, � ���� ���� ���� �� �����.");
	Doc_PrintLines(nDocID,0,"� ������ ���: ������� ������� �� ���� �������� ��� ���������.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"�������:   ������� ��");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItWr_BanditLetter_MIS(C_Item)
{
	name = "���������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseBanditLetter;
	scemeName = "MAP";
	description = name;
	text[3] = "";
	text[4] = "";
};


func void UseBanditLetter()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"������������ ����, ������������ � ���.");
	Doc_PrintLine(nDocID,0,"������ ��������, ��� ����� ������");
	Doc_PrintLine(nDocID,0," ���������� ������ ������.");
	Doc_PrintLine(nDocID,0,"�� ����� ��� �������� ��� -");
	Doc_PrintLine(nDocID,0,"    ��� ����� ������� ������.   ");
	Doc_PrintLine(nDocID,0,"�������������� �� ���.");
	Doc_PrintLine(nDocID,0," ");
	Doc_PrintLine(nDocID,0,"��������, �������, �������� �� ����,");
	Doc_PrintLine(nDocID,0,"    ������ � ��� �� �����.    ");
	Doc_PrintLine(nDocID,0,"� ���� ������� � ������� ���");
	Doc_PrintLine(nDocID,0,"    �������� ������� �����.");
	Doc_PrintLine(nDocID,0,"� ��� ��� �������� ����� ������,");
	Doc_PrintLine(nDocID,0,"    ��� ����� ����� ��������.");
	Doc_PrintLine(nDocID,0," ");
	Doc_PrintLine(nDocID,0,"��������� ��� ������ � ������ �����");
	Doc_PrintLine(nDocID,0,"    ����� �������� ��������������.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"�.");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItWr_Poster_MIS(C_Item)
{
	name = "���������� � �������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UsePoster;
	scemeName = "MAP";
	description = name;
	text[3] = "��� �����������!";
	text[4] = "";
};


func void UsePoster()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Gesucht.TGA",0);
	Doc_Show(nDocID);
};


instance ItKe_Bandit(C_Item)
{
	name = "���� �� �������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "���� ���� �����������";
	text[3] = "�������.";
};

instance ItRw_Bow_L_03_MIS(C_Item)
{
	name = "��������� ���";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = Value_Jagdbogen;
	damageTotal = Damage_Jagdbogen;
	damagetype = DAM_POINT;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_Jagdbogen;
	visual = "ItRw_Bow_L_03.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[4] = "��������� ��� �������.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRi_Prot_Point_01_MIS(C_Item)
{
	name = "������ �����������";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = Value_Ri_ProtPoint;
	visual = "ItRi_Prot_Point_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Prot_Point_01_MIS;
	on_unequip = UnEquip_ItRi_Prot_Point_01_MIS;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "���������� ������";
	text[2] = NAME_Prot_Point;
	count[2] = Ri_ProtPoint;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void Equip_ItRi_Prot_Point_01_MIS()
{
	self.protection[PROT_POINT] += Ri_ProtPoint;
};

func void UnEquip_ItRi_Prot_Point_01_MIS()
{
	self.protection[PROT_POINT] -= Ri_ProtPoint;
};


instance ItMi_EddasStatue(C_Item)
{
	name = "������ ������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 50;
	visual = "ItMi_InnosStatue.3DS";
	material = MAT_METAL;
	description = name;
	text[2] = "�����, ��� ����������";
	text[3] = "���������� � ������� ����,";
	text[4] = "� ������ ���� �� ����.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItKe_EVT_CRYPT_01(C_Item)
{
	name = "������ �������� ����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "��� ���� ������� � ������� 1";
};

instance ItKe_EVT_CRYPT_02(C_Item)
{
	name = "������ �������� ����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "��� ���� ������� � ������� 2";
};

instance ItKe_EVT_CRYPT_03(C_Item)
{
	name = "������ �������� ����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "��� ���� ������� � ������� 3";
};


const int VALUE_ITAR_PAL_SKEL = 500;

instance ITAR_PAL_SKEL(C_Item)
{
	name = "������ ��������� �������";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 100;
	protection[PROT_BLUNT] = 100;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 50;
	protection[PROT_MAGIC] = 50;
	value = value_itar_pal_skel;
	wear = WEAR_TORSO;
	visual = "ItAr_Pal_H.3ds";
	visual_change = "Armor_Pal_Skeleton.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItKe_Valentino(C_Item)
{
	name = "���� �� �������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "��� ���� �� �������,";
	text[3] = "�������������� ���������.";
};

instance ItKe_Buerger(C_Item)
{
	name = "���� �� �������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "�� ����� �� �����������.";
	text[3] = "";
};

instance ItKe_Richter(C_Item)
{
	name = "���� �� �������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "��� ���� �� �������,";
	text[3] = "�������������� �����.";
};

instance ItKe_Salandril(C_Item)
{
	name = "���� �� �������, ��������������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "���������� ��������.";
	text[3] = "";
};

instance ItKe_PaladinTruhe(C_Item)
{
	name = "���� �� �������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "��������� �������� ������";
	text[3] = "�� ���� ���������.";
};

instance ItKe_ThiefTreasure(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = Value_Key_01;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "��������� ������.";
};

instance ItKe_Fingers(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "������ ���� �� �����";
	text[3] = "� �����������.";
};

instance ItWr_Schuldenbuch(C_Item)
{
	name = "�������� �����";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "�������� ����� ������.";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseSchuldBuch;
};


func void UseSchuldBuch()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"������ � �����");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"�, ������ ������, ������� ��������, ������ ����������������� ������ 200 ������� �����.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"             ������");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"�, �������, ���������� ��������, ������ ����������������� ������ 150 ������� �����.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"             �������");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,FONT_Book);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"�, �����, ��������� ����� ��������, ������ ����������������� ������ 250 ������� �����.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"               �����");
	Doc_PrintLines(nDocID,1,"");
	Doc_Show(nDocID);
};


instance ItPl_Sagitta_Herb_MIS(C_Item)
{
	name = "��������� ����";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Strength_Herb_01;
	visual = "ItPl_Strength_Herb_01.3DS";
	material = MAT_WOOD;
	scemeName = "FOOD";
	description = name;
	text[5] = NAME_Value;
	count[5] = Value_Strength_Herb_01;
};

instance ITKE_ORLAN_HOTELZIMMER(C_Item)
{
	name = "���� �� �������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "� ������� '������� ������'.";
	text[3] = "";
};

instance ItRw_DragomirsArmbrust_MIS(C_Item)
{
	name = "������� ���������";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	value = Value_LeichteArmbrust;
	damageTotal = Damage_LeichteArmbrust;
	damagetype = DAM_POINT;
	munition = ItRw_Bolt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_LeichteArmbrust;
	visual = "ItRw_Crossbow_L_02.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

