
instance SLD_841_Engardo(Npc_Default)
{
	name[0] = "�������";
	guild = GIL_BDT;
	id = 841;
	voice = 13;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	aivar[AIV_EnemyOverride] = TRUE;
	EquipItem(self,ItMw_2h_Sld_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_Normal_Erpresser,BodyTex_N,ItAr_Sld_L);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,25);
	daily_routine = Rtn_PreStart_841;
};


func void Rtn_PreStart_841()
{
	TA_Stand_Guarding(8,0,22,0,"NW_FARM2_PATH_02");
	TA_Stand_Guarding(22,0,8,0,"NW_FARM2_PATH_02");
};

func void Rtn_Start_841()
{
	TA_Smalltalk(8,0,22,0,"NW_FARM2_TO_TAVERN_08");
	TA_Smalltalk(22,0,8,0,"NW_FARM2_TO_TAVERN_08");
};

func void Rtn_Bigfarm_841()
{
	TA_Smalltalk(8,0,22,0,"NW_BIGFARM_HOUSE_OUT_05");
	TA_Sit_Chair(22,0,8,0,"NW_BIGFARM_HOUSE_12");
};

