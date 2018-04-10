
func string B_BuildLearnString(var string text,var int kosten)
{
	var string concatText;
	if(kosten > 0)
	{
		concatText = ConcatStrings(text,PRINT_Kosten);
		concatText = ConcatStrings(concatText,IntToString(kosten));
		concatText = ConcatStrings(concatText,PRINT_LP);
	}
	else
	{
		concatText = ConcatStrings(text,PRINT_FreeByQuest);
	};
	return concatText;
};

func string B_ManaPlusText(var int one_or_five)
{
	return ConcatStrings(PRINT_LearnMANA_MAX,IntToString(ManaPoints(one_or_five)));
};
