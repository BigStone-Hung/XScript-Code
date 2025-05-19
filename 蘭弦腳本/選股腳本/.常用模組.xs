{@type:filter}
input:SEL(0,"日_K:1 週_集:2 月_營:3 季_財:4");
SETBArFreq("AD");
SETTOTALBAR(56);
Value99=0;
//技術面==================================================================================================================================
IF SEL=1 or SEL=1234 then begin
	CONDITION41=CALL_55W>0 and Call_BV>Call_BV[1] and GetField("成交金額(元)", "D")>10000000;
	IF CONDITION41 then begin
		IF SEL<>99 then RET=1;
		Value99=Value99+1;
	End;
End;
//集保資料庫(每週六日跑一次)==========================================================================================================================================
VALUE31=GetField("大戶持股比例", "W", param := 400)-GetField("大戶持股比例", "W", param := 400)[1];
VALUE32=((GetField("總持股人數", "W")-GetField("總持股人數", "W")[1])/GetField("總持股人數", "W")[1])*100;
IF SEL=2 or SEL=1234 then begin
	CONDITION31=VALUE31>=1 and VALUE32<=-1;
	IF CONDITION31 then begin
		RET=1;
		Value99=Value99+1;
	End;
End;
//月營收資料庫(每月跑一次)===========================================================================================================================================
IF SEL=3 or SEL=1234 then begin
	CONDITION21=HIGHEST(GetField("月營收", "M"),1)=HIGHEST(GetField("月營收", "M"),13);
	CONDITION22=GetField("月營收月增率", "M")>3 and GetField("月營收年增率", "M")>5 and GetField("累計營收年增率", "M")>13;
	CONDITION23=GetField("月營收月增率", "M")<55 and GetField("月營收年增率", "M")<144 and GetField("累計營收年增率", "M")<233;
	CONDITION24=GetField("每股稅後淨利(元)", "Q")>0 and GetField("每股稅後淨利(元)", "Q")>GetField("每股稅後淨利(元)", "Q")[1];
	IF CONDITION21 and CONDITION22 and CONDITION23 and CONDITION24 THEN begin
		RET=1;
		Value99=Value99+1;
	End;
End;
//財報資料庫(每季跑一次)===========================================================================================================================================
IF SEL=4 or SEL=1234 then begin
	CONDITION11=GetField("每股稅後淨利(元)", "Q")>0 and GetField("每股稅後淨利(元)", "Q")>GetField("每股稅後淨利(元)", "Q")[1];
	CONDITION12=CALL_LQ>10 and (CALL_LQ/GetField("本益比", "D"))*100>60;
	IF CONDITION11 and CONDITION12 THEN begin
		RET=1;
		Value99=Value99+1;
	End;
End;
//================================================================
//outputfield輸出的資料固定放在程式最末段
//================================================================
{===========================================================================================================================================
	//ABCD_日周月季簡易版
	SETBarFreq("AD");
	SETTOtalBar(56);
	CONDITION1=GetField("每股稅後淨利(元)", "Q")>0;
	CONDITION2=GetField("累計營收年增率", "M")>8 and GetField("累計營收年增率", "M")[4]<0;//Q1設8% Q2=>13% Q3/Q4=>21%
	CONDITION3=GetField("大戶持股比例", "W", param := 400)[0]>GetField("大戶持股比例", "W", param := 400)[1] 
		and GetField("散戶持股比例", "W", param := 400)[0]<GetField("散戶持股比例", "W", param := 400)[1];
	CONDITION4=GetField("成交金額(元)", "D")>10000000 and CALL_55W>0 and CALL_LQ>8;
	IF CONDITION1 and CONDITION2 and CONDITION3 and CONDITION4 then RET=1;
	outputfield(18,GetFieldDate("每股稅後淨利(元)","Q"),"EPS日期");
	outputfield(19,GetFieldDate("月營收", "M"),"營收日期");
}
{漲停跌停股======================================================================================================================================================
	SETBarFreq("AD");
	SETTOtalBar(2);
	CONDITION1=H=GetField("漲停價", "D");
	CONDITION2=L=GetField("跌停價", "D");
	IF CONDITION1 then RET=1;
	outputfield1(GetField("週轉率", "D")[1],"週轉率");
	//outputfield(19,GetFieldDate("月營收", "M"),"營收日期");
}
{控盤者比率======================================================================================================================================================
	VALUE1=IFF(V>0,GetField("控盤者買賣超張數")/V,0);
	VALUE2=xaverage(VALUE1,8);
	If VALUE2>0 and H<highest(H,13) and percentr(55)-50>0 then begin
		RET=1;
	End;
	OUTputField1(ROUND(VALUE2*1000)),"%");
}
{G_投信比率======================================================================================================================================================
	input:BS(0);
	VALUE1=GetField("投信買賣超", "D")*C*1000;
	CONDITION1= GetField("投信持股比例", "D")>3 and GetField("外資持股比例", "D")>8 and SUMmation(GetField("週轉率", "D"),3)>3;
	IF CONDITION1 then begin
		IF BS=0 then RET=1;
		//=============================================
		IF BS=1 then begin
			If SUMmation(VALUE1,3)>10000000 then RET=1;
		End;
		IF BS=-1 then begin
			If SUMmation(VALUE1,3)<-10000000 then RET=1;
		End;
	End;
	OUtputField1(Round(SUMmation(VALUE1,3)/10000000,0),"三日千萬");
	OUtputField3(SUMmation(GetField("週轉率", "D"),3),"三日週轉");
	OUtputField5(GetField("投信持股比例", "D"),"投信比例");
}
{融資創新低======================================================================================================================================================
	IF GetField("成交金額(元)", "D")>10000000 and (C>O or C>=C[1]) and GetField("融資餘額張數")=lowest(GetField("融資餘額張數"),55) and Call_55W[1]>0 and GetField("融資餘額張數")>0 then RET=1;
	OUTputField1(GetField("成交金額(元)", "D"),"AMT");
}
{融資創新高======================================================================================================================================================
	SETBarFreq("AD");
	SETTOtalBar(56);
	IF GetField("成交金額(元)", "D")>10000000 and (C<O or C<=C[1]) and GetField("融資餘額張數")=highest(GetField("融資餘額張數"),55) and Call_55W[1]<0 and GetField("融資餘額張數")>0 then RET=1;
	OUTputField1(GetField("成交金額(元)", "D"),"AMT");
}
{漲漲跌跌======================================================================================================================================================
	CONDITION1= H=GetField("漲停價", "D");
	CONDITION2= L=GetField("跌停價", "D");
	//CONDITION3=CONDITION1[1] and CONDITION2;
	CONDITION3=trueAny(CONDITION1[1],5) and trueAny(CONDITION2,5);
	IF CONDITION3 then RET=1;
	OUTputField1(GetField("成交金額(元)", "D")/100000000,"億");
}
{數據分析靈感======================================================================================================================================================
	SETBarFreq("AD");
	SETTOtalBar(144);
	CONDITION1= V=HIGHEST(V,144);
	IF CONDITION1 then RET=1;
	OUTputField1(GetField("股本(億)", "D"),"股本(億)");
	OUTputField2(ROUND(GetField("成交金額(元)", "D")[1]/10000000,0),"千萬");
	OUTputField3(GetField("週轉率", "D")[1],"週轉率");
	OUTputField4(V[1]>V[2],"量增");
	OUTputField5(L[1]>L[2],"墊高");
	OUTputField6(GetField("漲跌幅", "D")[1],"漲跌幅");
	OUTputField7(GetField("實質買盤比", "D")[1]-GetField("實質賣盤比", "D")[1],"實質買賣");
}
//財報更新==================================================================================================
{
input:N(1,"幾日內更新");
var:i(0);
SetBarFreq("AD"); //
settotalBar(N+1);
value1 = GETFieldDate("每股稅後淨利(元)", "Q");//財報擇一代表科目抓更新的日期
if value1 = 0 then return; //過濾沒資料或資料尚未轉檔完畢
for i = N downTo 1 //抓最近N天 舊到新的倒數的迴圈
	begin
		if value1<>value1[i] then begin
		value3 = GetField("Date","D")[i-1];
		ret=1;
	end;
end;
outputField1(value3,"更新日");
outputField2(GETFieldDate("月營收", "M"),"月份");
outputField5(GetField("月營收月增率", "M"),"月增%");
outputField6(GetField("月營收年增率", "M"),"年增%");
outputField7(GetField("累計營收年增率", "M"),"累營%");
}
//營收更新========================================================
{
input:Sel(0,"寬選0 嚴選1"),days(10,"幾日內更新");
var:i(0);
SetBarFreq("AD"); //僅限日頻率
settotalBar(days+1);
value1 = GETFieldDate("月營收", "M");
if value1 = 0 then return; //過濾沒資料或資料尚未轉檔完畢
for i = days downTo 1
	begin
		if value1<>value1[i] then begin
		value3 = GetField("Date","D")[i-1];
		If sel=0 then 
			begin
				ret=1;
			End
		Else 
			begin
				IF GetField("累計營收年增率", "M")>0 and GetField("月營收月增率", "M") + GetField("月營收年增率", "M")>0 then begin
					If Call_55W>0 then RET=1;
				End;
			End;
	end;
end;

}

//=================================================================================================================
//IF GetField("官股券商買賣超張數", "D")>0 and HIGHEST(V,4)=HIGHEST(V,89) then RET=1;


//SETTOTALBAR(145);
//CONDITION1=C>O[4] and HIGHEST(V,5)=HIGHEST(V,144);
//IF CONDITION1 THEN RET=1;
//OUTPUTFIELD1(GetField("成交金額(元)", "D"),"成交金額");
{
CONDITION1=GetField("股價淨值比", "D")<1 
		and GetField("累計每股盈餘(發佈值)", "Q")>0.3
		and SUMmation(GetField("來自營運之現金流量", "Q"),4)>0;

IF C>O and RIGHTStr(SYmbolName,2)<>"KY" and CONDITION1 THEN RET=1;
OUTputField1(GetField("每股淨值(元)", "Q"),"淨值");
OUTputField2(GetField("股價淨值比", "D"),"PB");
OUTputField3(CALL_LQ,"蘭質");
OUTputField4(GetField("負債比率", "Q"),"負債比");
}
{
SETTOTALBAR(56);
CONDITION1=V>V[2] and V>CALL_BV*2 and C>=H[1] and GetField("成交金額(元)", "D")>100000000;
IF CONDITION1 THEN RET=1;
OUTputField1(GetField("成交金額(元)", "D"),"成交金額");
}
{
SETTOtalBar(234);
CONDITION1=C>O and V=HIghest(V,233) and GetField("成交金額(元)", "D")>100000000;
IF CONDITION1 then RET=1;
OUTputField1(GetField("成交金額(元)", "D"),"成交金額");
OUTputField2(V/(GetField("股本(元)", "D")/10/1000),"%");
OUTputField3(ROUND((GetField("現金及約當現金", "Q")/GetField("資產總額", "Q"))*100,0),"約當現金");
OUTputField4(GetField("負債比率", "Q"),"負債比");
OUTputField5(ROUND(GetField("本益比", "D"),0),"PE");
}

outputfield(1,Call_VL,"成交(億)");
outputfield(2,Value99,"共振");
outputfield(11,GetField("每股稅後淨利(元)", "Q")[1],"EPS[1]");
outputfield(12,GetField("每股稅後淨利(元)", "Q"),"EPS[0]");
outputfield(13,CALL_LQ,"蘭質");
outputfield(14,GetField("本益比", "D"),"PE");
outputfield(21,ROUND((CALL_LQ/GetField("本益比", "D"))*100,0),"蘭值");
outputfield(22,Round(GetField("月營收月增率", "M"),0),"MOM%");
outputfield(23,Round(GetField("月營收年增率", "M"),0),"YOY%");
outputfield(24,Round(GetField("累計營收年增率", "M"),0),"累增%");
outputfield(32,VALUE31,"比例增比");
outputfield(33,VALUE32,"人數降比");
outputfield(34,(VALUE31*3)-(VALUE32*2),"集保評比");
outputfield(41,GetField("漲跌幅", "W"),"週漲幅");
outputfield(42,Call_55W,"55W");
outputfield(51,GetSymbolInfo("WithConvertibleBond"),"有CB");	