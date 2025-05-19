{@type:filter|@guid:1e3afe1204604993a3792611a8f8cb90}
input:DD(20241201,"財報基期"),SelA(1,"0:全部財報 1:最新財報"),SelB(0,"0:全選 1:普選 2:嚴選");
setbarfreq("Q");SetTotalBar(9);
//=======================================================================
Value1=Round(summation(GetField("月營收","M")*100,3),0);//億元*100 換成百萬
value2=GetField("每股稅後淨利(元)","Q");
value3=average(GetField("營業外收入及支出", "Q"),4);
Value4=GetField("營業毛利率","Q")/100;
Value5=GetField("股本(元)","D")/10;
Value6=GetField("營業費用率","Q")/100;
Value7=((Value1-GetField("營業收入淨額","Q"))/GetField("營業收入淨額","Q"))*100;
Value8=Value1*Value4;//營業毛利
Value9=Value1*Value6;//營業費用
Value10=(Value8-Value9);//營業淨利	
Value11=Iff((value2*4)>0,Iff(C/(value2*4)>=100,99,C/(value2*4)),0);//蘭氏PE
Value12=(CALL_LQ/GetField("本益比", "D"))*100;
Value13=((((Value10*1000000)+value3)/value5)*(1-(average(GetField("所得稅費用", "Q"),4)/Value1)));//推估EPS
Value15=((Value13-value2)/value2)*100;
Value16=(1-(value3/average(GetField("稅前淨利", "Q"),4)))*100;
Value17=IFF(Value16>=100,100,Value16);
//=====================================================================================================	
value802=0;
value803=4;
IF GetField("營業收入淨額","Q")[3]>GetField("營業收入淨額","Q")[4] then begin
	value803=value803-1;
End;
IF GetField("營業收入淨額","Q")[2]>GetField("營業收入淨額","Q")[3] then begin
	value803=value803-1;
End;
IF GetField("營業收入淨額","Q")[1]>GetField("營業收入淨額","Q")[2] then begin
	value803=value803-1;
End;
If GetField("營業收入淨額","Q")[3]=lowest(GetField("營業收入淨額","Q"),4) then begin
	value803=value803-1;
End;
//==================================================================================================
IF SelA=0 then 
	begin
		IF GetFieldDate("每股稅後淨利(元)","Q")<=DD then begin//	
			If selB=0 then RET=1; 
			If selB=1 then begin
				If ((average(GetField("月營收", "M"),3)-average(GetField("月營收", "M")[3],3))/average(GetField("月營收", "M")[3],3))>0 
				and (CALL_LQ>10 or Value12>60) then begin
					ret=1;
				End;
			End;
			If selB=2 then begin
				If ((average(GetField("月營收", "M"),3)-average(GetField("月營收", "M")[3],3))/average(GetField("月營收", "M")[3],3))>0 
				and GetField("累計營收年增率", "M")>0 and CALL_LQ>10 and Value12>60 and Value17>50 then begin
					ret=1;
				End;
			End;
		End;
	End
Else
	begin
		IF GetFieldDate("每股稅後淨利(元)","Q")=DD then begin//	
			If selB=0 then RET=1; 
			If selB=1 then begin
				If GetField("累計營收年增率", "M")>0
				and CALL_LQ>7 and Value12>50 and GetField("成交金額(元)", "D")>5000000 then begin
					ret=1;
				End;
			End;
			If selB=2 then begin
				If GetField("累計營收年增率", "M")>0 
				and ((average(GetField("月營收", "M"),3)-average(GetField("月營收", "M")[3],3))/average(GetField("月營收", "M")[3],3))>0 
				and GetField("本益比", "D")>7 and Value12>100 and Value17>50 then begin
					ret=1;
				End;
			End;
		End;
	End;
	
//IF GetFieldDate("每股稅後淨利(元)","Q")=20240601 then begin
	//RET=1;
//End;
//========================================================================
outputfield(5,CALL_LQ,"蘭質");
outputfield(6,ROUND(GetField("本益比", "D"),0),"本益比");
outputfield(7,Round(Value12,0),"蘭值");
outputfield(9,Round(GetField("累計營收年增率", "M"),0),"營收累增");
outputfield(12,value803,"旺季期數");
outputfield(14,Round(value17,0),"本業%");	
outputfield(16,GetSymbolInfo("WithConvertibleBond"),"有CB");

//outputfield(11,Round((Value11+GetField("本益比", "D")/2),0),"本業PE");
//outputfield(9,value2[1],"前EPS");
//outputfield(10,value2,"近EPS");
//outputfield(12,Round(Value15,0),"EPS%");
outputfield(21,Round(GetField("殖利率", "D"),1),"E_殖利率");
outputfield(22,GetField("成交金額(億)", "D"),"成交(億)");
outputfield(24,GetField("每股稅後淨利(元)", "Q")>GetField("每股稅後淨利(元)", "Q")[1],"季EPS增");
outputfield(25,GetField("每股稅後淨利(元)", "Q")=lowest(GetField("每股稅後淨利(元)", "Q"),5),"最低EPS");
//outputfield(31,GetField("下一次董監改選年"),"改選");
outputfield(31,GetFieldDate("每股稅後淨利(元)","Q"),"財報期別");
outputfield(33,GetFieldDate("月營收","M"),"營收期別");
//營收季增%(3/6/9/12適用)
//IF Month(GetFieldDate("月營收","M"))=3 or Month(GetFieldDate("月營收","M"))=6 or Month(GetFieldDate("月營收","M"))=9 or Month(GetFieldDate("月營收","M"))=12 then begin 
	//OutputField(35,((average(GetField("月營收", "M"),3)-average(GetField("月營收", "M")[3],3))/average(GetField("月營收", "M")[3],3))*100,"營收季增%(3/6/9/12適用)");
//End;
	
