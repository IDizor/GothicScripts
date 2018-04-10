
instance BDT_1035_Fluechtling(Npc_Default)
{
	name[0] = NAME_Fluechtling;
	guild = GIL_OUT;
	id = 1035;
	voice = 7;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_B_Normal_Orik,BodyTex_B,ITAR_Leather_L);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_1035;
};


func void Rtn_Start_1035()
{
	TA_Smalltalk(8,0,23,0,"NW_BIGFARM_HOUSE_OUT_05");
	TA_Smalltalk(23,0,8,0,"NW_BIGFARM_HOUSE_OUT_05");
};

