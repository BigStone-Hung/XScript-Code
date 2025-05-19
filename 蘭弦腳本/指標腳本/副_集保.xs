{@type:indicator|@guid:1e90a49cff5a4a1385198ceac10d9bac}
//籌碼之母=>週集保  
//運算區=========================================
VALUE5=GetField("大戶持股比例", param := 400);
VALUE11=GetField("總持股人數", "W");
//狀態區============================
CONDITION11= VALUE11=lowest(VALUE11,8) and C=highest(C,5) and value5>value5[1] and value11<value11[1];
//視覺區============================
plot1(GetField("大戶持股比例", param := 400)/100,"大戶比",checkbox:=1);
IF GetField("大戶持股比例", param := 400)-GetField("大戶持股比例", param := 400)[1]>=1 
	then plot2(GetField("大戶持股比例", param := 400)/100,"大增") else plot2(0,"大增");
IF CONdition11 and not(trueAny(CONdition11[1],8)) then plot12(1,"訊號") else plot12(0,"訊號");



