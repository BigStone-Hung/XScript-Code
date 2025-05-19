{@type:indicator|@guid:e8a913648aef4b379e8db5543b818221}
//蘭弦閱讀混沌理論後之經驗改良
CONDITION2=trueAll(Call_AO>0,3) and Call_AO>Call_AO[1] and Call_AO[1]<Call_AO[2] and lowest(L,2)=lowest(L,4);
CONDITION3=trueAll(Call_AO[1]<0,5) and (C>O and Call_AO[1]<0 and Call_AO>0);
If  Call_AO > 0 then
	plot11(Call_AO, "AO")
else
	plot12(0, "AO");
IF Call_55B>0 and (CONDITION2 or CONDITION3) and V>V[1] and Call_BV>Call_BV[1] and Call_AO/C<0.13 then PLOT13(1,"訊號") ELSE PLOT13(0,"訊號");


