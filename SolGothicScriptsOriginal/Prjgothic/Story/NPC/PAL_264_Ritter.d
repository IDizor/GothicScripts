
instance PAL_264_Ritter(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 264;
	voice = 9;
	flags = 0;
	npcType = NPCTYPE_OCAMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_2h_Pal_Sword);
	EquipItem(self,ItRw_Mil_Crossbow);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItKe_OC_Store,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_L_Ratford,BodyTex_L,ItAr_PAL_M);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,65);
	daily_routine = Rtn_Start_264;
};


func void Rtn_Start_264()
{
	TA_Stand_Guarding(8,0,19,0,"OC_GUARD_STORE_01");
	TA_Stand_Guarding(19,0,8,0,"OC_GUARD_STORE_01");
};

