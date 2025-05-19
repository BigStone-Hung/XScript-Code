{@type:filter}
VALUE3=((GetField("投信持股比例", "D")+GetField("外資持股比例", "D"))/100);
CONDITION1=VALUE3<VALUE3[1] and VALUE3[1]<VALUE3[2] and C<O and highest(H,2)=highest(H,5);
CONDITION2=TRueAll(V>CAll_BV,2);
IF GetField("成交金額(元)", "D")>30000000 and trueAny(CONDITION1 and CONDITION2,2) then RET=1;