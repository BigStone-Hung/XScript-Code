{@type:filter|@guid:ef0163d3aa3346a1a8413b0a2204e1f2}
//日線選股基本判斷
SETBARFreq("AD");
SETTOTALBar(90);
Condition1=(C-C[54])/C[54]<0.66 and (C-L[1])/L[1]<0.21 and C>C[1] and C>O[1];
Condition2=Call_55B>0 and C>Call_MP and GetField("本益比", "D")<50;
IF Condition1 and Condition2 and GetField("週轉率", "D")<21 and Bias(21)<8 then ret=1; 
//outputField(1,GetField("成交金額(元)", "D"),"成交額");

