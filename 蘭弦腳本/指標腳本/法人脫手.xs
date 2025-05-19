{@type:indicator|@guid:117e3414d6ed4141bc5ce9abf77070f7}
VALUE3=GetField("投信持股比例", "D")+GetField("外資持股比例", "D");
CONDITION1=VALUE3<VALUE3[1] and VALUE3[1]<VALUE3[2] and C<O and highest(H,2)=highest(H,5);
CONDITION2=TRueAll(V>CAll_BV,2) and Call_BV>Call_BV[1];
IF CONDITION1 and CONDITION2 then plot1(H,"合計",checkbox:=1);

