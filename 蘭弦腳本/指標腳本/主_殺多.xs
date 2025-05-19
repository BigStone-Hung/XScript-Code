{@type:indicator|@guid:903778cc8de646e7a2d8c464aa1adc1b}
CONDITION1= H=GetField("漲停價", "D");
CONDITION2= trueAny(L=GetField("跌停價", "D") or C<GetField("參考價", "D")*0.98,5) and C<L[1] and C<O;
CONDITION9= CONDITION2 and trueAny(CONDITION1[1],8) and not(trueany(CONDITION2[1],5)) and (V>V[1] or CALL_BV>CALL_BV[1] or C=L);
IF CONDITION1 then PLOT1(H*1.03,"漲停",checkbox:=1);
IF CONDITION2 and trueAny(CONDITION1[1],8) and not(CONDITION2[1]) then PLOT2(L*0.97,"大跌",checkbox:=1);
IF CONDITION9 then PLOT3((H+L)/2,"風險");