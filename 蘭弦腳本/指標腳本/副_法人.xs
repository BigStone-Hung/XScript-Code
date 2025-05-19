{@type:indicator|@guid:831f500905644915bce3e94b458e276a}
//法人進出趨勢  視覺簡化版
VALUE1=average(GetField("投信買賣超")*C*1000,3)+average(GetField("外資買賣超")*C*1000,3);
CONDITION1=VALUE1>VALUE1[1] and GetField("投信買賣超")>0 and GetField("外資買賣超")>0;
CONDITION2=(GetField("投信持股比例", "D")+GetField("外資持股比例", "D"))=highest((GetField("投信持股比例", "D")+GetField("外資持股比例", "D")),21);
IF GetField("投信持股比例", "D")>1 or GetField("外資持股比例", "D")>1 then begin
	plot1(((GetField("投信持股比例", "D")+GetField("外資持股比例", "D"))/100),"合計",checkbox:=1);
	plot2(GetField("外資持股比例", "D")/100,"外比",checkbox:=1);
	plot3(GetField("投信持股比例", "D")/100,"投比",checkbox:=1);
	IF C>O and Call_55B>0 and CONDITION2 and NOT(CONDITION2[1]) then plot4(1,"訊號") else plot4(0,"訊號");
END;
