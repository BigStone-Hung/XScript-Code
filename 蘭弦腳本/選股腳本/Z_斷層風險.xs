{@type:filter|@guid:1c97dcd9d79d4c8ea0f4928212a6be79}
//風險標的==================================================================================
SETBARFreq("AW");
SETTotalBar(22);
CONDITION1=GetField("總持股人數", "W")>GetField("總持股人數", "W")[1]
			and GetField("大戶持股比例", "W", param := 400)<GetField("大戶持股比例", "W", param := 400)[1];
CONDITION2=C<HIGHEST(H,13)*0.79 and LOWEST(L,8)>LOWEST(L,21); 
IF GetField("成交金額(元)", "D")>50000000 and CONDITION1 and CONDITION1[1] and CONDITION2 then RET=1;
OUTputField1(GetField("成交金額(元)", "D"),"成交金額");