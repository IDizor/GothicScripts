
var int History_1_permanent;
var int History_2_permanent;
var int History_3_permanent;

func void Use_BookstandHistory1_S1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_RED_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_RED_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"���� �����");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"������ ������ - ��� ������� ���������, �� ������� ����, ����� ���� �������� ������. ���������� ���������� ����� ������ ��� ��������.");
		Doc_PrintLines(nDocID,0,"����� ����� ������� ����� �� ���������� ��� ������ ������, ���������� ������, � ����� ������� ����������� �������������� �����.");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"�������, ������ ������� ����� ����� ������������ ������������. ���� �� ������� �������� ���, �� ���� ������� ������������ ��������� ����������.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"");
		Doc_Show(nDocID);
		if(History_1_permanent == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			History_1_permanent = TRUE;
		};
	};
};

func void Use_BookstandHistory2_S1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_RED_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_RED_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"������");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"�������� ����� ������� ��������� �� ������� � ��������� ����������� �������.");
		Doc_PrintLines(nDocID,0,"���� ������ ��������, ������ �����, ����� ������� ��������. � ��� ����� ������ �����, ����� ��� ��� ���� ������� ���������� �������� � ������� ������� ��� ���� ���������� �����������.");
		Doc_PrintLines(nDocID,0,"����� �������, ��� ������ ����� �������� ��������, ��� ���������� ������� ��� ������ �������� ���������� ����.");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"���������� �� �������� ��������� ��������� ����, ��� ��������� �� ����������� ����� ���������� ������� � ����, � ����� �������� ����.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"��� ������ ��������� ����� ������� ����� ����������� ���������, ������� ����� � ������ ���������� ����� ������ ��������.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"� ������ ������� ��������� ������� ��������� ������, ������������� ������ ����. ��� �������� ��� ������������ � ������� ����� � �������, � ����� ������ �������� ����.");
		Doc_Show(nDocID);
		if(History_2_permanent == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			History_2_permanent = TRUE;
		};
	};
};

func void Use_BookstandHistory3_S1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_RED_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_RED_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"����� �� �������");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"����� ���� ����� ������, ���������� ������ ������� ����������� ���� - ���� ��� ���������, ����� ��� ����� ���������.");
		Doc_PrintLines(nDocID,0,"����� ������������ ������ ���������� �������� ���������.");
		Doc_PrintLines(nDocID,0,"���������� ��������� �������� �� ������, � ����� ����������� � ��� ������ �������.");
		Doc_PrintLines(nDocID,0,"��������� ����� �������� ���������. ����� ���� ��� ������� ������ ����� ��������� ��������� �������� - ����.");
		Doc_PrintLines(nDocID,0," ");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"���� ���-���� ������ ������� ��� ����� ���, ���������� ������ �������� �� �����.");
		Doc_PrintLines(nDocID,1,"����� �������� �������� ������, �������� ������ ��������� ������� �����.");
		Doc_PrintLines(nDocID,1,"�� ���� ������ �������� ��������� ������, ����������� ������������ �����. �� ��� ������� �������� ��� ���� �������������, � � �� ����������� ������ ��������� ��������� � �������������� �������.");
		Doc_PrintLines(nDocID,1,"���, ��� ���� ������� ������������ ��� ��� ���������� ��������, ������ �������� �� ���� �������.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1," ");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"");
		Doc_Show(nDocID);
		if(History_2_permanent == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			History_2_permanent = TRUE;
		};
	};
};

