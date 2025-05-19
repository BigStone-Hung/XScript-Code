{@type:indicator|@guid:ac513d3e79e84cd68d54d4653c3fec17}
//指數或商品類日線週期看盤通用
settbmode(1);
VAR:KN(0);
variable:J_Empty(0),PLine(0),ULine(0),JUCount(0),JDCount(0);
//變數與狀態區===================================================================================================================================================================
value1=(O+H+L+C)/4;
VALUE2=AVERAGE((HIGHEST(H,89)+LOWest(L,89))/2,13);
value11=GetSymbolField("FITXN*1.TF", "十大交易人未沖銷買口", "D")*1;
value12=GetSymbolField("FITXN*1.TF", "十大交易人未沖銷賣口", "D")*-1;
VALUE51=GetSymbolField("TSE.TW", "成交金額(元)");
VALUE52=GetSymbolField("2330.TW", "成交金額(元)");
VALUE53=ROUND((VALUE52/VALUE51)*100,0);
Condition41=L>H[1] and (C>=(H+L)/2 or C>=O) and H>=H[1];
Condition42=H<L[1] and (C<=(H+L)/2 or C<=O) and L<=L[1];
Condition43=C>O and C>L[1] and L[2]<L[5] and lowest(L,3)=lowest(L,21) and highest(V,3)=highest(V,21); 
CONDITION31=VALUE2>=VALUE2[1] and C>VALUE2; 
CONDITION51=H<H[1] and L<L[1] and VALUE53>13 and C<L+(H-L)/3 and TRueAll(C<O,2);
CONDITION52=C>O and VALUE53*2>34 and VALUE53>VALUE53[1]*2;
//邏輯區=======================================================================================================
if gettotalbar-currentbar=54 then value21=C;	
If DayOfWeek(Date) = 3 and DayOfMonth(Date)>14 and DayOfMonth(Date)<22 then
	begin
		KN=0;
	End;
KN=KN+1;
//視覺區=========================================================================================================================================================================
If gettotalbar-currentbar<=54 then plot2(value21,"扣底白線",checkbox:=1);
IF AVERAGE(C,55)>AVERAGE(C,55)[1] then plot4(AVERAGE(C,55),"上升季線",checkbox:=1) else plot5(AVERAGE(C,55),"下降季線",checkbox:=1);
PLOT31(VALUE2*1.00,"中心軸線",checkbox:=0);
PLOT34(VALUE2*1.13,"中心上軌",checkbox:=0);
PLOT35(VALUE2*0.92,"中心下軌",checkbox:=0);
IF Condition41 then begin
	JDCount=0;
	JUCount=JUCount+1;
	IF JUCount=1 then begin
		VALUE16=maxlist(O[1],C[1]);
		VALUE17=L;
	End;
End;
If condition42 then begin
	JUCount=0;
	JDCount=JDCount+1;
	IF JDCount=1 then begin
		VALUE18=minlist(O[1],C[1]);
		VALUE19=O;
	End;
End;
If JUCount>0 and TRUEAll(C<VALUE16,3) then JUCount=0;
If JDCount>0 and TRUEAll(C>VALUE18,3) then JDCount=0;
//If JUCount=1 and JUCount[1]<>1 then plot41(VALUE16,"起漲缺口",checkbox:=1);
//If JDCount=1 and JDCount[1]<>1 then plot42(VALUE18,"起跌缺口",checkbox:=1);
IF JUCount>0 then PlotFill(43, VALUE16, VALUE17,"起跳區域") Else noPlot(43);
IF JDCount>0 then PlotFill(44, VALUE18, VALUE19,"起墜區域") Else noPlot(44);
If Condition43 and not(Condition43[1]) then plot45(Lowest(L,2),"殺出蟄伏",checkbox:=1) else noPlot(45);

IF SYMBOL="TSE.TW" or SYMBOL="OTC.TW" THEN BEGIN
	IF KN=1 then PLOT1(25000,"結算黃框",checkbox:=1) Else NOPlot(1);
	PLOT3(AVerage(value1,KN),"當月均價",checkbox:=1);
	IF (CONDITION51[1] or CONDITION52[1]) and L[1]=LOWEST(L,5) then PLOT46(L*0.985,"台積佈局",checkbox:=1);
	IF TRUEALL(VALUE53[1]>VALUE53[2],3) and C<O and highest(H,2)=highest(H,4) then PLOT47(H*1.015,"台積風險",checkbox:=1);
END;
